# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

ingredients = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

puts 'seeding the database with ingredients…'

ingredients['drinks'].each do |ingredient|
  ingredient = Ingredient.new(name: ingredient['strIngredient1'])
  ingredient.save!
end

puts 'finished seeding the database with ingredients'
