require 'rails_helper'

RSpec.describe 'show page' do
  #   Story 2 - Mechanic Show Page
  #
  # As a user,
  # When I visit a mechanic show page
  # I see their name, years of experience, and the names of rides they’re working on
  # And I only see rides that are open
  # And the rides are listed by thrill rating in descending order (most thrills first)

  it "shows the individual mechanic attributes and the rides they are working on" do
    amusement_park = AmusementPark.create!(name: 'Six Flags', price_of_admission: 2)
    mechanic_1 = Mechanic.create!(name: 'Ted', years_experience: 9)
    mechanic_2 = Mechanic.create!(name: 'Bob', years_experience: 11)
    ride_1 = amusement_park.rides.create!(name: 'mangler', amusement_park_id: 1)
    ride_2 = amusement_park.rides.create!(name: 'Batman', amusement_park_id: 1)


    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).not_to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_1.years_experience)
    expect(page).not_to have_content(mechanic_2.years_experience)
    expect(page).to have_content(ride_1.name)
    expect(page).not_to have_content(ride_2.name)
  end
end
