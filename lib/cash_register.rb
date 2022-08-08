require 'pry'


class CashRegister 

    attr_accessor :total, :discount, :items, :last_transaction_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction_price = 0
    end

    def add_item(title, price, quantity = 1)
        self.total += price*quantity

        if quantity == 1
            @items << title
        elsif quantity > 1
            for i in 0..quantity-1
                @items << title
            end
        end

        @last_transaction_price = price * quantity

    end

    def apply_discount
        if self.discount > 0
            self.total = self.total.to_f - (self.discount.to_f/100.0) * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        removed_item = @items.pop
        self.total -= @last_transaction_price
        @last_transaction_price = 0

        if self.items.length == 0
            total
        end
    end


end

binding.pry
0

