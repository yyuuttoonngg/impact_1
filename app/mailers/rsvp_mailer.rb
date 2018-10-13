class RsvpMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def rsvp_email(rsvp)
        @rsvp = rsvp
        attachments.inline['impact-red-logo.svg'] = File.read(Rails.root.join("public/impact-red-logo.svg"))
        mail(to: @rsvp.reg_user.email, subject: "You're attending '#{@rsvp.event.subject}!")
    end

    def cancel_confirm_email(rsvp)
        @rsvp = rsvp
        attachments.inline['impact-red-logo.svg'] = File.read(Rails.root.join("public/impact-red-logo.svg"))
        mail(to: @rsvp.reg_user.email, subject: "You are no longer marked as attending #{@rsvp.event.subject}!")
    end
end
  