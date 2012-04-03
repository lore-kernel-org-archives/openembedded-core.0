Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SFA8z-0002co-KJ; Tue, 03 Apr 2012 22:15:57 +0200
Received: by ggcy3 with SMTP id y3so75675ggc.6
	for <multiple recipients>; Tue, 03 Apr 2012 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=2/6zBmnCm6k2CSlg/0dgb20LEcodi1gUYzYRAej5KSs=;
	b=PiAlnzJve6gHzPd0CCEetSVYRaXCQC08nY8ebaPbACxHmbgkCFCZubkayzTMUlqK6I
	WBGZzd3gw7+HRqnT11z9LsCQl7dzHWNOOYdl3bkEw/LII6hMv2H/VhDEpXpimFnCeVLH
	pq+rNlMbUa7YnL27yZZXEhJeeJHEUByYRp28AheUXYMIZ2XWrjf27er1d/JUJkyjJpJl
	vwQV7wdpij+0xp9OFLjMUjkpqsNsBQdkTS9BZi8f9F8E7bnyPTqpugYNoxBu5WZSOIJU
	aFwBJRudkSsR0me5v6Xn+F4GwrRsN3R/hmodta+VutbOmNNpn223mZhYSFlBoS+9z+L7
	YXPw==
MIME-Version: 1.0
Received: by 10.50.46.167 with SMTP id w7mr10219945igm.73.1333483606941; Tue,
	03 Apr 2012 13:06:46 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.163.72 with HTTP; Tue, 3 Apr 2012 13:06:46 -0700 (PDT)
Date: Tue, 3 Apr 2012 13:06:46 -0700
X-Google-Sender-Auth: fredsXQrNynvY-DMbit1TF0j3UY
Message-ID: <CA+YB3rbx7NF0mLX9vKC+Q9OCU0SsOe_3tYcUGzFjY5eXd=qf6A@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 27 March 2012
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2012 20:15:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
27 March 2012

Attending: Richard (RP__), Paul (bluelightning), Mark (fray), Khem (khem)
Apologies: Tom (Tartarus)
Minutes: Jefro (Jefro)

________________________________________________
Agenda

0. nota benes
   Yocto Project BSP Summit, Collab Summit next week

1. pick a chair
   bluelightning

2. lingering issues

   a. IMAGE_FSTYPES (Tartarus)
      ->poking people to read & reply on list
      RP replied to thread - consensus on release
      resolved in short term, may need to revisit

   b. raise awareness of "janitor" list, QA "bugs"
      ->RP will mention idea to Darren & Sean
      ->all - please think of other ways to get people involved
=>    fray to start publicity about "janitor" bugs
      item to stand on agenda

3. new issues

   a. discuss communication with OE community about
      	      release-oriented phases
      need to give ample notice on oe-core mailing list
      RP asking for Song's help
      must be in email, possibly release cycle page also
=>    fray willing to manage page as TSC activity
=>    RP to send email updates, TSC to handle in future
=>    future agenda: document release process

4. status

   a. elections
      ->RP to ping board, roll into new election right away
      board notified - Tom is next
=>    agenda for next meeting if no action

   b. infrastructure

   c. oe-core release
      covered above, agenda for next meeting if needed
      final freeze 2-3 weeks from 18 Mar

________________________________________________
Raw Transcript

(8:59:02 AM) Jefro: I'll enter it here:
(8:59:02 AM) Jefro: 1. pick a chair
(8:59:02 AM) Jefro: 2. lingering issues
(8:59:02 AM) Jefro:   a. IMAGE_FSTYPES
(8:59:02 AM) Jefro:       => poking people to read & reply on list
(8:59:02 AM) Jefro:   b. raise awareness of "janitor" list, QA "bugs"
(8:59:02 AM) Jefro:       => RP will mention idea to Darren & Sean
(8:59:02 AM) Jefro:       => all - please think of other ways to get
people involved
(8:59:02 AM) Jefro: 3. new issues
(8:59:02 AM) Jefro: 4. status
(8:59:02 AM) Jefro:   a. elections
(8:59:02 AM) Jefro:       => RP to ping board, roll into new election right away
(8:59:02 AM) Jefro:   b. infrasturcture
(8:59:02 AM) Jefro:   c. oe-core release, feature freeze, final freeze
2-3 weeks from 18 Mar
(9:00:07 AM) Jefro: just waiting for Tartarus. any new issues to add under 3. ?
(9:01:13 AM) fray: there was concern some oe contributors didn't know
we were going into a stabilization period..
(9:01:23 AM) fray: we should likely talk about that briefly
(9:02:51 AM) Jefro: 3a. discuss communication with OE community about
release-oriented phases
(9:03:36 AM) fray: yup
(9:03:41 AM) khem: ok i m back
(9:04:55 AM) RP__: BSP Summit? Anything the TSC wants represented there?
(9:05:01 AM) RP__: Khem and I will be there at least
(9:06:27 AM) khem: RP__: I think Documenting improvements for writing  BSPs
(9:06:31 AM) Jefro: There will be remote participation for the BSP
Summit as well, to a certain extent
(9:06:37 AM) fray: I am going to attempt to attend from remote..
(9:08:39 AM) ***bluelightning too
(9:09:35 AM) bluelightning: has someone pinged Tom?
(9:09:53 AM) Jefro: I pinged him on IRC, no response
(9:10:06 AM) fray: maybe he fell down a well.. ;)
(9:10:48 AM) khem: heh
(9:11:58 AM) bluelightning: I guess we may have to start without him
(9:12:01 AM) RP__: should we just get started?
(9:12:02 AM) Jefro: there is a quorum here, but I'm fine with wiaiting
until we hear from Tom
(9:12:10 AM) bluelightning: I'll chair if nobody else wants to
(9:12:12 AM) khem: I think we need to publish some rough OE-Core
schedule and send emails to lists of phase changes or may be update
webpage to reflect state like gcc does
(9:12:13 AM) Jefro: ok
(9:12:39 AM) Jefro: khem - related to 3a
(9:12:47 AM) bluelightning: let's wait a couple more minutes
(9:12:51 AM) ***Jefro is making notes in the minutes)
(9:13:31 AM) khem: I started using tmux instead of screen and now it
does not refresh the last line in windows
(9:13:40 AM) khem: bugs everywhere
(9:14:07 AM) khem: workaround is keep changing size of window then it
refreshes it
(9:14:29 AM) khem: I guess I need to reinstall my computer :)
(9:15:36 AM) bluelightning: ok let's get started... assuming I am chairing
(9:15:42 AM) RP__: bluelightning: go for it
(9:15:45 AM) bluelightning: first item is 2a. IMAGE_FSTYPES
(9:16:12 AM) bluelightning: did anyone reply? I have to admit I did
not get back to review that thread myself...
(9:16:28 AM) fray: I've been out for the last week moving so, no..
(9:17:01 AM) khem: what thread are you talking about
(9:17:10 AM) khem: IMAGE_FSTYPES ok
(9:17:35 AM) bluelightning: this was tom's thread so it's a shame he's
not here...
(9:18:00 AM) bluelightning: ah btw... : http://pastebin.com/TqiVP8dw
(9:18:20 AM) bluelightning: not sure if we should have these as public
on pastebin...
(9:18:39 AM) Jefro: doesn't hurt - agendas are public anyway
(9:18:47 AM) Jefro: pastebin is still down for me
(9:18:57 AM) bluelightning: ok, these days I guess I got into the
habit of making all my pastes private
(9:19:00 AM) RP__: I replied to the thread
(9:19:13 AM) RP__: I think there was a concensus about what we'd do for release
(9:19:18 AM) RP__: we might have to revisist it
(9:20:16 AM) bluelightning: ok, so it's resolved in the short term but
may need to be looked at again in the near future?
(9:21:11 AM) RP__: yes
(9:21:24 AM) RP__: The trouble is other things get included after local.conf
(9:21:42 AM) RP__: so the other things can override it. I'm half
tempted to recommend we move the position of local.conf
(9:21:57 AM) bluelightning: why was it put where it is currently?
(9:22:19 AM) khem: well local.conf should be prio 1 isnt it
(9:22:25 AM) RP__: I'm not entirely sure
(9:22:27 AM) khem: so user can override stuff
(9:22:37 AM) RP__: khem: it is included before machine/distro
(9:22:50 AM) RP__: khem: so machine/distro can override it
(9:22:57 AM) bluelightning: khem: that's what I would have thought, I
was aware it was the other way around though and has been for a very
long time
(9:23:02 AM) RP__: I'm not sure this makes sense based on current usage
(9:23:06 AM) khem: yes so you mean we should let distro/machine
policies prio higher
(9:23:33 AM) khem: I think it should be included last
(9:23:56 AM) bluelightning: changing this would need to be done with
caution, there's a high possibility of breaking people's setups
(9:24:02 AM) Jefro: Tartarus sends apologies, he is between buildings
and can't make it
(9:24:09 AM) bluelightning: Jefro: ok thanks
(9:25:28 AM) khem: bluelightning: If we think its a good change then
we can think of possible breakages and address them
(9:25:54 AM) bluelightning: sure, I'm just saying, we have to be careful
(9:25:58 AM) khem: or advertizing the change beforehand can help too
(9:26:21 AM) bluelightning: I wonder has changing this come up before
and been decided against?
(9:26:49 AM) khem: I dont remember
(9:26:57 AM) RP__: bluelightning: Its a major change, I don't
suggesting it lightly
(9:27:10 AM) RP__: Certainly not for the current release
(9:27:19 AM) RP__: but I think we should consider it
(9:27:21 AM) khem: RP__: yes probably something for phase1 in next window
(9:28:31 AM) bluelightning: ok, let's revisit this at that time
(9:28:34 AM) RP__: I'll take the action to start a discussion on the list
(9:28:39 AM) RP__: oh, hang on
(9:28:52 AM) RP__: we can't change it - MACHINE comes from local.conf!
(9:29:06 AM) bluelightning: aha, that's why it wasn't changed
(9:29:23 AM) bluelightning: (duh)
(9:29:51 AM) RP__: It does make it hard for the local.conf to override
machine/distro settings though :/
(9:30:07 AM) RP__: We should probably better document that
(9:30:09 AM) khem: RP__: can we say machine and distro come from env instead ?
(9:30:10 AM) fray: sorry -- I got pulled away..
(9:30:12 AM) fray: catching back up
(9:30:23 AM) khem: I always use it from env
(9:30:28 AM) RP__: khem: we can but that is a major change in baheviour
(9:30:52 AM) khem: RP__: that also means we dont change local.conf
everytime we want a different machine and distro
(9:30:56 AM) khem: its very handy
(9:31:14 AM) RP__: khem: I've been doing this myself for a long time ;-)
(9:31:27 AM) bluelightning: khem: I can understand MACHINE but do you
really change DISTRO that often (and keep TMPDIR)?
(9:32:05 AM) fray: For reproducable configurations (which I do share
with others) I always set the machine and distro in the local.conf..
(9:32:13 AM) fray: but for local builds, I do both that and the
environment.. they're both useful
(9:32:14 AM) khem: bluelightning: DISTRO I dont change but three
variables are use from env are DISTRO MACHINE and LIBC
(9:32:27 AM) fray: ahh I didn't know about LIBC coming from the ENV
(9:32:33 AM) khem: and tmpdir is set based on these vars
(9:32:47 AM) khem: DISTRO-LIBC that is
(9:33:29 AM) khem: so I can shared native packages between uclibc/eglibc
(9:33:43 AM) khem: sstate that is
(9:34:13 AM) khem: fray: its actually TCLIBC to be precise
(9:35:02 AM) fray: my feeling is this sounds like something to explore
early in the next release cycle..
(9:35:07 AM) RP__: I suggest this goes back to the mailing list
(9:35:12 AM) bluelightning: yes
(9:35:14 AM) fray: yup, sounds good
(9:35:33 AM) bluelightning: ok, shall we move onto 2b. raise awareness
of "janitor" list, QA "bugs"
(9:36:41 AM) bluelightning: I guess this hasn't been high priority in
the last two weeks (well, we have fixed a lot of QA issues though)
(9:37:13 AM) fray: sadly I've been out more then in for the past two
weeks.. so I havn't been able to pay attention..
(9:37:23 AM) fray: but anything we can do for the janitors list, QA
bugs, etc is a good thing..
(9:37:26 AM) bluelightning: fray:
(9:37:31 AM) RP__: I think the actual work in setup of bugzilla
categories has been done
(9:37:39 AM) RP__: now we need to publicise this
(9:37:43 AM) fray: RP__, is it a whiteboard item, or something different?
(9:37:47 AM) bluelightning: fray: right, what he said ;)
(9:38:03 AM) RP__: fray: There is a category in bugzilla for this now
(9:39:15 AM) bluelightning: it's a severity value to be precise
(9:39:16 AM) fray: where is the category and/or how do we nominate
things to be added to it?
(9:39:19 AM) fray: Ahh
(9:39:25 AM) fray: I see it now..
(9:41:15 AM) bluelightning: so, do we want to cover anything more on
this or should we move onto the next item?
(9:42:07 AM) fray: has this been promoted on the mailing list(s) yet?
if so, is this something we need to keep promoting?
(9:42:17 AM) fray: otherwise, I think we're good with the new severity
(9:42:29 AM) bluelightning: I could be wrong but I don't think it has
been announced
(9:42:46 AM) fray: is this something we should do after the
freeze/release cycle -- or during?
(9:42:56 AM) fray: (I can see reasons for both)
(9:43:27 AM) bluelightning: probably during... we need to keep
classifying bugs as "janitor" and try to find ways of
attracting/pointing new people who want to contribute towards them
(9:43:28 AM) RP__: after I think
(9:43:50 AM) RP__: but I'm all for anyone promoting it if they have time
(9:44:03 AM) fray: the advantage of during is it gets people used to
them, and we hopefully get fixes.. problem is initially it's going to
take some more hands-on approach..
(9:44:17 AM) fray: after, we have more time for the hands-on.. (but
lack any fixes for the stable release)
(9:44:22 AM) RP__: For the release I have bigger concerns :/
(9:44:39 AM) RP__: and not taking patches may frustrate people
(9:44:52 AM) fray: yes
(9:45:00 AM) bluelightning: yeah by during I assumed next cycle...
(9:45:41 AM) RP__: So how about we keep this one on the TSC agenda -
does anyone want to own starting some publicity about it?
(9:46:08 AM) fray: I likely won't have the time for another couple
weeks.. then I can own it, if nobody else wants to
(9:46:18 AM) ***bluelightning hasn't even done the wiki day publicity yet...
(9:47:23 AM) ***RP__ also won't be able to work on this for the next
couple of weeks
(9:47:28 AM) Jefro: time check: 13 more minutes
(9:47:33 AM) ***RP__ suggests it stands on the agenda
(9:47:38 AM) bluelightning: I think we can safely leave this one for a few weeks
(9:47:43 AM) ***RP__ notes he has to leave on time
(9:47:46 AM) bluelightning: and yes, keep it on
(9:47:54 AM) bluelightning: ok, next is 3a. discuss communication with
OE community about release-oriented phases
(9:47:55 AM) fray: yes, sounds good
(9:48:27 AM) fray: What do we need to do to make sure the contributors
know we're in a release process, and what phase we're in?
(9:48:45 AM) fray: sending out the meeting minutes and occasional
reminders doesn't seem to be enough..
(9:48:52 AM) bluelightning: give people ample notice beforehand, on
the oe-core list
(9:49:01 AM) fray: I agree that is necessary
(9:49:11 AM) bluelightning: I think what people are expecting are
specific notices rather than just inside minutes
(9:49:38 AM) bluelightning: as in "upcoming feature freeze"
(9:50:10 AM) fray: yes.. I like what someone said earlier about have a
release cycle page that tells people where we're at, and what the next
step is.. (and approx dates)
(9:50:12 AM) RP__: Right, we just need emails out there saying in 2
weeks X is happening
(9:50:20 AM) RP__: I'm asking for Song's help in this
(9:50:28 AM) fray: ok..
(9:50:28 AM) bluelightning: among the many other things, we also need
to document this on the OE website
(9:50:43 AM) Jefro: community management issue.  OE needs a CM :)
(9:50:54 AM) RP__: I don't want a google calender, powerpoint or a
wiki page, needs to be an email
(9:51:22 AM) bluelightning: yes, the community will expect an email too I think
(9:51:28 AM) fray: RP__, the email is the trigger and active
notification.. the "page" is we're currently in the step, the next
step is X, the next step is Y.. etc..
(9:51:42 AM) fray: not everyone follows the mailing lists (or gets
overwealmed by them)
(9:52:00 AM) fray: that is something I'm willing to manage as an
OE-TSC activity..
(9:52:07 AM) bluelightning: right now just a few lines that say that
we do in fact have a schedule and what the cadence is would be better
than nothing...
(9:52:20 AM) fray: (I'm not expecting to do anything but link to the
emails when they go out and have something that simply shows what
state we're in)  ;)
(9:52:27 AM) fray: yes
(9:52:45 AM) RP__: This could be good for the TSC to help with...
(9:53:15 AM) fray: lets put for a future agenda to document the
release process.. (i.e. come up with steps and names) so we're
consistent in the future
(9:53:27 AM) bluelightning: ok
(9:53:42 AM) fray: then for now.. email out updates saying we're doing
this.. and this is the time period..
(9:54:20 AM) Jefro: who has that action item?
(9:54:31 AM) fray: RP for the email..
(9:54:36 AM) fray: TSC (as a unit) for the future..
(9:54:37 AM) Jefro: ok, thanks
(9:54:48 AM) bluelightning: next item is 4a: elections
(9:55:01 AM) fray: who is next, or have we had a full election cycle?
(9:55:04 AM) RP__: I did email the board
(9:55:07 AM) RP__: Tom
(9:55:10 AM) fray: ahh ok
(9:55:13 AM) fray: cool
(9:55:30 AM) Jefro: election underway?
(9:56:07 AM) fray: up to the board.. but as long as they've been
notified we're good..
(9:56:16 AM) fray: (I havn't seen any new election email on the members list)
(9:56:36 AM) Jefro: note in minutes to ping them again next week if no action?
(9:56:42 AM) Jefro: (4 minute warning)
(9:56:49 AM) fray: yup
(9:56:53 AM) bluelightning: yep
(9:57:09 AM) bluelightning: next item is 4b: infrastructure
(9:57:31 AM) bluelightning: don't think there's anything to cover on
this is there?
(9:58:20 AM) Jefro: evidently not :)
(9:58:21 AM) ***RP__ doesn't have anything
(9:58:49 AM) bluelightning: so we're almost out of time... 4c we kind
of covered in part under the release/freeze discussion, if we need to
talk more we can do it at the next meeting
(9:59:05 AM) fray: yup
(9:59:23 AM) bluelightning: ok, so shall we close it there? anything
else to add?
(10:00:07 AM) RP__: nothing from me, just trying to keep up with
patches, emails and other things. Its a hectic time
(10:00:37 AM) Jefro: adjourned?
(10:00:37 AM) bluelightning: indeed
(10:00:41 AM) bluelightning: yep
(10:00:43 AM) fray: agreed

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


