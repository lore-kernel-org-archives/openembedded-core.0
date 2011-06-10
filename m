Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QV9yA-0000zz-Sh; Sat, 11 Jun 2011 00:14:24 +0200
Received: by iye7 with SMTP id 7so2779736iye.6
	for <multiple recipients>; Fri, 10 Jun 2011 15:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=qwT1TBVeyoccexPtP2CPqdgVXAfrfGmN2aMvA7BuLlY=;
	b=n0lbhLQDHF19isyZAWNYgnYzNez2BirYFjasyuIoGgR60pTTmAHHVtm+k5LOR+F/LF
	qPH3ZAXNuNhwSDEovYxGl1uDNHoGALL71NmJ/tSJ5fy8NPLGp3hl5TT9DklFbwJt1+7Q
	HdC13UMQm5LkTb6KkS2XutYKwV5w31Pdvi/Jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=KvMwdHlj2VHr+9rj43fg+OYU5dKx8pxrS9BpkXK49+ti1LFrlR6ijAKOimiM8/4y6e
	NLqhAUdT5LXiQOf8o4T5204As9Tv34aqS+lBYi7/7tICneXI2DGOvlHXfiY+f5pWlXle
	eh3QrPP6bqjZY782BtAMCmKImbTvPTDvJJYvE=
MIME-Version: 1.0
Received: by 10.42.132.129 with SMTP id d1mr2654972ict.526.1307743861026; Fri,
	10 Jun 2011 15:11:01 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.217.71 with HTTP; Fri, 10 Jun 2011 15:11:01 -0700 (PDT)
Date: Fri, 10 Jun 2011 15:11:01 -0700
X-Google-Sender-Auth: AjjzfjwXFjqC5G8fJBZ3mVOONUs
Message-ID: <BANLkTikKfWjz8ExK=hvW4yejEJGL5GaWkw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: OE-TSC minutes 02-Jun-2011
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
X-List-Received-Date: Fri, 10 Jun 2011 22:14:25 -0000
Content-Type: multipart/alternative; boundary=90e6ba3fcec54b2f5404a562d871

--90e6ba3fcec54b2f5404a562d871
Content-Type: text/plain; charset=ISO-8859-1

OE-TSC minutes 02-Jun-2011

Attending: Koen, Khem, Richard, Tom, Mark (had to leave early)
Apologies: Stefan

Agenda:

01) Meeting chair

RP

02) Ask for topics

infrastructure SIG

mailinglist police
--> RP to send email to yocto folks

khem notes that oe-core ml does not enable patch attachments
--> mailman needs to be patched (koen)

03) Action items from last week:
--> GNOME discussion to ml (all)
still needs to happen

--> release issues to ml, interest in 2011.06 (stefan)

04) TSC structure, voting for members, etc.
members elections should be done now and we're waiting on the result, then
the TSC elections should happen
--> discuss one member standing down next week, RP volunteers

05) Status updates:
      - oe-core
      - contrib guidelines
      - bsp guidelines
      - metadata layer splitting
      - infrastructure

Raw Transcript

(12:59:30 PM) Tartarus: roll call?
(12:59:34 PM) Jefro: is it just me, or does this channel now log activity
for a day or so?
(12:59:35 PM) koen: aye
(12:59:59 PM) Jefro: I see fray khem koen RP__ Tartarus - a quorum.  is
stefan still out?
(1:00:13 PM) fray: I'm here this minute, but I have to leave...
(1:00:32 PM) fray: I'll stick around as long as I can...
(1:01:07 PM) khem: I am here
(1:01:16 PM) Jefro: fray ok - I think that still leaves 4
(1:01:29 PM) ***RP__ is here
(1:01:55 PM) Tartarus: yeah, at least 4, did stefan say anything before
hand??
(1:02:27 PM) Jefro: not to me
(1:02:46 PM) ***RP__ doesn't remember anything
(1:02:55 PM) Tartarus: Give him 'till 5 past?
(1:03:19 PM) Tartarus: do we have an agenda up yet?
(1:03:21 PM) Jefro: ok.  fray, any burning issues you need to discuss before
you go?
(1:03:26 PM) Jefro: Tartarus I was just building one
(1:03:51 PM) ***Jefro 's week has been plagued with hardware issues, both
computer and human
(1:03:51 PM) fray: Just that I havn't gotten to the final rev of the commit
guidelines yet..  I won't be able to get to that until the morning
(1:03:59 PM) fray: (but I finally cleared everything else off my schedule)
(1:04:10 PM) RP__: fray: lucky you :)
(1:04:17 PM) Jefro: fray I was going to get together with you for some
guidelines of some kind...
(1:04:56 PM) fray: yes we still need to do that..
(1:05:08 PM) fray: Most of my day tomorrow is open, except around noon..
(well as of right now)
(1:05:23 PM) Jefro: fray cool, I'll try to contact you relatively early
given the time dif
(1:05:51 PM) Jefro: anyone have a problem following the same agenda as last
time?
(1:05:56 PM) Jefro: meeting chair is #1
(1:06:37 PM) fray: ok, I've got to go.. sorry.
(1:06:47 PM) Jefro: fray seeya
(1:06:48 PM) Tartarus: Jefro, didn't we talk about letting you chair last
week?
(1:06:51 PM) Tartarus: or am I crazy?
(1:06:54 PM) koen: didn't we volunteer Jefro ?
(1:07:00 PM) ***RP__ volunteers this week
(1:07:02 PM) Jefro: Tartarus you may be crazy.. :)  I thought that was for
last week
(1:07:08 PM) Jefro: http://pastebin.com/JADncdCV is last week's agenda.  any
modifications or additions?
(1:07:08 PM) RP__: jefro did last week I think
(1:07:35 PM) koen: tom k ask for an hw IG
(1:08:07 PM) RP__: ok, I'll chair
(1:08:11 PM) Tartarus: s/hw/infrastructure/
(1:08:17 PM) RP__: agenda looks good apart from listing things we've closed
on
(1:08:30 PM) ***Jefro notes RP__  as chair
(1:08:47 PM) RP__: Koen wants to add the hw IG to the agenda
(1:08:53 PM) RP__: anything else for 03?
(1:08:56 PM) RP__: we 02?
(1:08:59 PM) RP__: er, 02
(1:09:26 PM) Tartarus: not here
(1:09:33 PM) koen: yeah, mailinglist police
(1:09:44 PM) koen: e.g. stop people from posting oe-core stuff to poky only
(1:10:00 PM) RP__: koen: Yocto folks are working on that
(1:10:37 PM) ***Jefro notes infrastructure SIG discussion topic
(1:10:37 PM) RP__: koen: Most have got the message but those who haven't are
getting reminded
(1:10:47 PM) khem: and sometimes cross posting too much
(1:10:57 PM) khem: patches in particular
(1:11:00 PM) RP__: khem: emails have been sent about that too
(1:11:20 PM) Jefro: does that cover the mailinglist police topic?
(1:11:35 PM) RP__: I will sent out a reminder to the yocto people. I think
that covers it unless anyone has anything else to add?
(1:11:43 PM) khem: oe-core does not allow attaching patches
(1:11:47 PM) khem: is that intentional
(1:11:52 PM) RP__: khem: no
(1:12:18 PM) RP__: koen: any idea why its doing that (as our mailman admin
;-)) ?
(1:12:21 PM) khem: so if I compose email and add patch as attachment it
strips out the patch and sends the bare message
(1:12:33 PM) khem: more than 1 person has seen this problem
(1:12:39 PM) koen: either the mime type is messed up or the attachment is
too large
(1:12:55 PM) khem: no patches are 1-2 liners
(1:13:13 PM) khem: and patch can be generated by git diff
(1:13:21 PM) khem: it strips it
(1:13:44 PM) koen: the cases I've seen is where the mime type is messed up
(1:14:17 PM) koen: since I'm not fluent in mailman, can't we just tell
people to not attach patches?
(1:14:18 PM) khem: for me same mutt sends it fine to oe-devel same is
stripped by oe-core AFAICT
(1:15:08 PM) khem: koen: http://support.tigertech.net/mailman-attachments
(1:16:44 PM) Jefro: sorry to interrupt - is this an education issue ("send
patches to patches list instead of oe-core") or a mailman issue ("enable
oe-core ml to handle patches") ?
(1:17:00 PM) RP__: I think we need to fix mailman
(1:17:05 PM) RP__: there is likely a config error
(1:17:17 PM) RP__: koen: If you can't find it, let me know the password and
I'll take a look
(1:17:27 PM) RP__: So, 03)
(1:17:39 PM) RP__: GNOME discussion still needs to happen on the mailing
list IMO
(1:17:51 PM) Tartarus: Agree
(1:18:05 PM) Tartarus: Anyone in the room now that needs a poke to reply or
start a discussion?
(1:18:16 PM) Tartarus: If so, consider yourself poked
(1:18:45 PM) Jefro: Stefan had the action item 2 weeks ago, last week
Tartarus said he would do it if it didn't happen
(1:18:56 PM) Tartarus: That was re 2011.06
(1:18:58 PM) Tartarus: stefan started
(1:19:02 PM) RP__: ok, cool
(1:19:04 PM) Jefro: ah - sorry
(1:19:08 PM) RP__: and the bitbake list migrated
(1:19:11 PM) Tartarus: I read, and haven't said anything since no one else
has said yes, we need it
(1:19:25 PM) Tartarus: So, lets see
(1:19:26 PM) Jefro: no one has volunteered to start a GNOME discussion yet
(1:19:32 PM) RP__: ok, I think we can consider that issue closed then
(1:19:37 PM) Tartarus: That was the 30th
(1:19:41 PM) Tartarus: give folks the rest of the week
(1:19:48 PM) Jefro: RP__ closed bitbake issue
(1:19:50 PM) Tartarus: And if no one pops up saying no, we must have another
oe.dev release
(1:19:55 PM) Tartarus: close it
(1:20:02 PM) RP__: agreed
(1:20:09 PM) Tartarus: koen, don't you have a stake in GNOME stuff?
(1:20:15 PM) Jefro: Tartarus sounds good - decide next week re 2011.06?
(1:20:17 PM) koen: yes
(1:20:27 PM) koen: I get hassled at work now to add gnome stuff
(1:20:29 PM) Tartarus: koen: Can you start the GNOME discussion off?
(1:20:36 PM) koen: but I get hassled more for other things
(1:20:40 PM) Tartarus: Ha
(1:20:58 PM) RP__: personally, I think a core in oe-core makes sense and all
the other bits in a later component of meta-oe or a separate repo, I don't
mind which
(1:21:09 PM) RP__: (for gnome)
(1:21:16 PM) RP__: but I will say as much on the mailing list
(1:21:38 PM) RP__: For 04, the members elections should be done now and
we're waiting on the result, then the TSC elections should happen
(1:21:59 PM) RP__: Last week we talked about someone volunteering to step
out the TSC. Did we close on that?
(1:22:21 PM) Jefro: no closure that I saw
(1:22:22 PM) ***Jefro sent out the minutes about 1/2 hr ago
(1:22:53 PM) RP__: Ok, let me volunteer to stand down at the first election
(1:23:02 PM) Jefro: stefan mentioned something about it two or three weeks
ago as I recall
(1:23:23 PM) RP__: stefan isn't here so that doesn't help us
(1:23:49 PM) Jefro: true - fray is gone as well. I suggest deferring that
discussion to next week, and requiring all TSC members to attend.
(1:23:52 PM) Tartarus: RP__, I think none of us want you to stand down,
given your position in oe-core
(1:24:01 PM) ***Jefro thought RP was joking
(1:24:13 PM) RP__: Tartarus: doesn't matter really, I have to stand for
election at some point
(1:24:25 PM) koen: we can just reelect him
(1:24:29 PM) RP__: Jefro: I'm serious
(1:24:46 PM) ***RP__ hopes he might get reelected, if I don't I stop having
to attend these meetings
(1:24:52 PM) RP__: :)
(1:25:48 PM) Tartarus: So, in sum, we need a TSC meeting where everyone
attends, asap
(1:25:57 PM) RP__: I don't think it matters
(1:25:57 PM) Tartarus: Or a off-the-ML thread?
(1:26:09 PM) RP__: I can go first and then we can worry about the rest at a
later meeting
(1:26:19 PM) Tartarus: Er
(1:26:30 PM) Tartarus: isn't the problem we have more members than the
normal charter allows right now?
(1:26:39 PM) Tartarus: and we have (or had) a schedule for each of us
standing for election
(1:26:51 PM) Tartarus: But the problem is that once that happens, unless
someone looses, we'll have too many folks
(1:27:04 PM) Tartarus: And either need to change the official charter, or
have someone volunteer not to be elected
(1:27:14 PM) RP__: Well, eventually we'll be left with no seat for someone
(1:27:35 PM) Tartarus: Right, which is why we're seeing if someone wants to
step down, yes?
(1:27:51 PM) RP__: Its not up to us
(1:27:58 PM) RP__: There will be 5 elections. What I'm saying is that I'll
volunteer my seat as the first one to be elected
(1:28:17 PM) RP__: The board will call for candidates, I will stand, I don't
know who else will and we see who gets elected
(1:28:19 PM) Jefro: that is different indeed from volunteering to stand down
:)
(1:28:44 PM) Tartarus: Well, I'm confused now
(1:28:51 PM) Tartarus: Since that wasn't the last plan
(1:28:57 PM) khem: We were going alphabetically
(1:29:02 PM) Tartarus: Or are we putting all seats up at once?
(1:29:03 PM) RP__: People didn't seem happy with the last plan
(1:29:19 PM) ***koen has no problems with RPs plan
(1:29:57 PM) RP__: There will be 5 elections, one at a time, spread over a
period of time
(1:30:01 PM) khem: so how  does it go now ? every seat gets elected one by
one ?
(1:30:07 PM) khem: ok
(1:30:09 PM) Tartarus: So, i think I get it
(1:30:11 PM) RP__: For each one there will be a call for candidates
(1:30:16 PM) Jefro: so.. electing seats rather than individuals
(1:30:17 PM) Tartarus: It sounds to me like a wording change over the last
plan
(1:30:22 PM) khem: ok
(1:30:34 PM) Tartarus: So, whichever
(1:31:01 PM) RP__: There are 5 seats and for each of which there is an
election
(1:31:34 PM) RP__: Separate call for candidates and then people vote
(1:31:46 PM) khem: ok sounds a good plan
(1:32:08 PM) Jefro: RP__ who gets to organize and manage the vote?  is that
the board's responsibility?
(1:32:15 PM) RP__: Jefro: yes
(1:32:28 PM) RP__: Jefro: this is all documented procedure for the e.V.
(1:32:34 PM) Jefro: got it
(1:33:32 PM) RP__: So we wait for the board, we as a TSC just need to work
out how six become five
(1:34:05 PM) RP__: After one of the elections some who has given up their
seat will not be re-elected
(1:34:27 PM) RP__: Everyone happy?
(1:34:50 PM) ***RP__ takes that as a yes
(1:34:56 PM) RP__: 05) status updates
(1:35:16 PM) RP__: oe-core seems to be gaining momentum and certainly has
some healthy patch turnover
(1:35:21 PM) koen: I will manage the betting pool when the usual suspect
gets confused about voting again
(1:35:36 PM) RP__: yes there have been odd issues but I think we're dealing
with them ok
(1:35:42 PM) RP__: Does anyone have any comments on oe-core?
(1:35:47 PM) Tartarus: Yeah, I do
(1:36:00 PM) Tartarus: Do the autobuilders folks use currently have
no-distro configs in them?
(1:36:11 PM) Tartarus: I know we have poky, and I'm almost sure we have
angstrom and probably shr
(1:36:14 PM) RP__: Tartarus: Not the yocto ones
(1:36:32 PM) RP__: Tartarus: We're basically waiting on hardware atm
(1:36:37 PM) Tartarus: Would that be something we can put on the yocto ones?
 Or does OE need to come up with the HW for that?
(1:37:00 PM) Tartarus: RP__: can we at least add a single config to what's
going on now in the yocto one?
(1:37:07 PM) RP__: Tartarus: We have plans in place to be able to take extra
stuff but its six weeks off at least
(1:37:33 PM) RP__: Tartarus: I can put in the request but I know I'll get
screamed at
(1:37:53 PM) RP__: Tartarus: let me see what I can do
(1:37:53 PM) Tartarus: RP__: I think we really must have it, since that's
the default oe-core setting
(1:37:56 PM) Tartarus: thanks
(1:38:23 PM) koen: tom k mentioned he wanted to to a pure oe-core
autobuilder
(1:38:24 PM) RP__: Tartarus: keep in mind that we did slim the poky shim
layer down to the bare minimal
(1:38:28 PM) koen: but he needs hw for that as well
(1:38:39 PM) RP__: Yes, I think Tom will ultimately do this
(1:38:42 PM) Tartarus: RP__: yes, but still, since oe-core is supposed to
work on its own
(1:38:48 PM) RP__: but he's waiting for the same source of hardware as Yocto
(1:38:52 PM) Tartarus: We really really should have at least one autobuilder
confirming that's not dying
(1:38:54 PM) Jefro: RP__ not quite
(1:38:56 PM) RP__: Tartarus: I know it is
(1:39:13 PM) RP__: Jefro: In what way is this different?
(1:39:17 PM) Jefro: OE hardware is being donated by LF, who is waiting for
the donator to get back. there is progress in this way.
(1:39:26 PM) Jefro: Yocto's hardware is coming from a different source.
(1:39:46 PM) khem: RP__: I still think we need to work out a way so there is
no need for gcc 4.6 in meta-oe
(1:39:49 PM) RP__: Jefro: Lets talk offline about that
(1:39:53 PM) Jefro: RP__ yup
(1:39:55 PM) RP__: Jefro: You have partial info
(1:40:42 PM) RP__: khem: What is the current problem there?
(1:41:05 PM) RP__: khem: Is it just the linaro patches?
(1:41:11 PM) khem: RP__: yes
(1:41:26 PM) khem: RP__: I was think if we could just bbappend them
(1:41:43 PM) koen: khem: what I did for 4.5 was to only have the .bbs
(1:41:45 PM) RP__: khem: That would work too
(1:41:48 PM) koen: khem: the logic is in the .incs
(1:41:56 PM) khem: yeah
(1:42:13 PM) RP__: Lets take that to the mailing list
(1:42:23 PM) RP__: Anything else on oe-core?
(1:42:42 PM) khem: release
(1:43:10 PM) khem: I think we need some sort of release plan for oe-core
(1:43:45 PM) RP__: My current thinking is to time something with yocto's
1.1?
(1:44:04 PM) Jefro: I remembered there being a plan to release on .03 and
.09
(1:44:14 PM) khem: I think half yearly release would be optimum
(1:44:23 PM) RP__: coming up to that point yocto will want to stabilise so
that would benefit the oe-core release too
(1:44:35 PM) koen: I talked with Martin and my impression is that the
oe-core + meta-oe combo lacks too much to be usefull as a release
(1:45:03 PM) khem: koen: lacks ? in what sense
(1:45:05 PM) RP__: koen: what does it lack?
(1:45:21 PM) koen: martin can't build his usual images with it
(1:45:29 PM) koen: and I can't build my usual angstrom images with it
(1:45:50 PM) RP__: wouldn't some of the layers release at the same time?
(1:46:00 PM) khem: koen: so thats something we can roll into a release plan
 may be for oe
(1:46:02 PM) RP__: or release a version at some point which would work with
the releases oe-core?
(1:46:27 PM) koen: RP__: that's my point, an oe-core only release would not
buy "us" much
(1:46:39 PM) RP__: koen: you miss my point
(1:46:51 PM) khem: koen: so you mean it should be distro releases ?
(1:47:17 PM) RP__: koen: ideally it would be good if angstrom could release
at some point based on the oe-core release for the oe-core layer
(1:47:27 PM) khem: I still think folks can pick up  a oe-core release and
build their software around it
(1:47:54 PM) koen: RP__: I don't have enough working to call something a
release with a straight face
(1:48:02 PM) koen: RP__: and I think neither does martin
(1:48:03 PM) RP__: koen: not yet
(1:48:13 PM) khem: with git submodules its easy since it locks the
submodules by commit ids
(1:48:17 PM) RP__: koen: you don't think you'll be there in 3 months?
(1:48:58 PM) koen: RP__: realistically, no
(1:49:12 PM) RP__: koen: which areas are the concerns in?
(1:49:19 PM) ***RP__ is worried by this
(1:49:31 PM) khem: I think we need more recipes into meta-oe
(1:49:32 PM) koen: the big one in terms of recipes is a complete gnome 2.32
stack
(1:49:54 PM) koen: the big one in terms of base system is work out why
things like console setup are screwed
(1:49:55 PM) RP__: ok, so its the meta-oe issue, not something about oe-core
itself
(1:50:11 PM) khem: I think oe-core plays into it as well
(1:50:17 PM) RP__: It would be good to have a working list of things with
oe-core that are problems
(1:50:17 PM) khem: indirectly
(1:50:23 PM) RP__: those I can try and help with directly
(1:50:37 PM) RP__: meta-oe does need community help and may take a little
longer
(1:50:57 PM) khem: a release would bring over some devs
(1:51:28 PM) RP__: I think oe-core needs to release. Whether meta-oe does or
not at the 09 point I don't know
(1:51:30 PM) koen: RP__: I'm not against an oe-core release, but by the
looks of it only oe-core would release
(1:51:41 PM) RP__: koen: we have to start somewhere
(1:52:25 PM) khem: may be initially only yocto will be based of release and
slowly other distros will fall in as we go
(1:52:57 PM) khem: angstrom clearly has wide coverage and lot of different
images to consider
(1:52:57 PM) koen: RP__: that's very true, but we have to be carefull in the
messaging
(1:53:18 PM) RP__: koen: no argument from me
(1:53:59 PM) khem: we can discuss it more next week
(1:54:14 PM) koen: btw, 15 more members for the e.V.
(1:54:35 PM) Jefro: koen is there a link?
(1:54:41 PM) khem: good
(1:54:51 PM) RP__: ok, we have 5 mins left
(1:55:16 PM) RP__: I think if anyone has status updates on contrib
guidelines, bsp guidelines metadata layer splitting
(1:55:17 PM) khem: siteinfo in oe-core needs some makeover from oe.dev
(1:55:18 PM) RP__: raise them now
(1:55:21 PM) koen: Jefro: mail is underway
(1:55:25 PM) RP__: remaining topic was infrastructure
(1:55:28 PM) Jefro: koen cool
(1:55:48 PM) RP__: I think Yocto setup an interest group for this
(1:55:51 PM) Jefro: infrastructure we kind of covered earlier.  Tom has
linked up with LF and things are progressing.
(1:55:51 PM) koen: RP__: I raised the layer splitting internally at TI,
people are going to try out the current angstrom setup and report back
(1:56:06 PM) RP__: Can the OE and Yocto groups work together or is there a
reason to keep them separate?
(1:56:09 PM) Jefro: Yocto has a Yocto Infrastructure SIG, which Tom can join
if he likes - maybe should
(1:56:17 PM) Jefro: I talk with him a few times a week
(1:56:55 PM) ***RP__ proposes Tom should join the Yocto group rather than
form a separate one
(1:57:09 PM) RP__: at least see if that can work
(1:57:25 PM) Jefro: I think the orgs can definitely help each other out
here. I'll take action item to talk with Tom.
(1:57:29 PM) RP__: koen: sounds good, I'd be interested to know how that
foes
(1:57:32 PM) RP__: er, goes
(1:57:46 PM) ***RP__ needs to put the light on as touch typing isn't working
well
(1:58:24 PM) RP__: Anything else anyone wants to talk about?>
(1:58:29 PM) khem: not me
(1:58:33 PM) Tartarus: not me

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba3fcec54b2f5404a562d871
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-f=
amily: arial, sans-serif; font-size: 13px; "><div>OE-TSC minutes 02-Jun-201=
1</div><div><br></div><div>Attending: Koen, Khem, Richard, Tom, Mark (had t=
o leave early)</div>
<div>Apologies: Stefan</div><div><br></div><div>Agenda:=A0</div><div><br></=
div><div>01) Meeting chair</div><div><br></div><div>RP</div><div><br></div>=
<div>02) Ask for topics</div><div><br></div><div>infrastructure SIG</div>
<div><br></div><div>mailinglist police</div><div>--&gt; RP to send email to=
 yocto folks</div><div><br></div><div>khem notes that oe-core ml does not e=
nable patch attachments</div><div>--&gt; mailman needs to be patched (koen)=
</div>
<div><br></div><div>03) Action items from last week:</div><div>--&gt; GNOME=
 discussion to ml (all)</div><div>still needs to happen</div><div><br></div=
><div>--&gt; release issues to ml, interest in 2011.06 (stefan)</div><div>
<br></div><div>04) TSC structure, voting for members, etc.</div><div>member=
s elections should be done now and we&#39;re waiting on the result, then th=
e TSC elections should happen</div><div>--&gt; discuss one member standing =
down next week, RP volunteers</div>
<div><br></div><div>05) Status updates:</div><div>=A0 =A0 =A0 - oe-core</di=
v><div>=A0 =A0 =A0 - contrib guidelines</div><div>=A0 =A0 =A0 - bsp guideli=
nes</div><div>=A0 =A0 =A0 - metadata layer splitting</div><div>=A0 =A0 =A0 =
- infrastructure</div><div>
<span style=3D"white-space: pre-wrap; ">	</span>=A0=A0</div><div>Raw Transc=
ript</div><div><br></div><div>(12:59:30 PM) Tartarus: roll call?</div><div>=
(12:59:34 PM) Jefro: is it just me, or does this channel now log activity f=
or a day or so?</div>
<div>(12:59:35 PM) koen: aye</div><div>(12:59:59 PM) Jefro: I see fray khem=
 koen RP__ Tartarus - a quorum. =A0is stefan still out?</div><div>(1:00:13 =
PM) fray: I&#39;m here this minute, but I have to leave...</div><div>(1:00:=
32 PM) fray: I&#39;ll stick around as long as I can...</div>
<div>(1:01:07 PM) khem: I am here</div><div>(1:01:16 PM) Jefro: fray ok - I=
 think that still leaves 4</div><div>(1:01:29 PM) ***RP__ is here</div><div=
>(1:01:55 PM) Tartarus: yeah, at least 4, did stefan say anything before ha=
nd??</div>
<div>(1:02:27 PM) Jefro: not to me</div><div>(1:02:46 PM) ***RP__ doesn&#39=
;t remember anything</div><div>(1:02:55 PM) Tartarus: Give him &#39;till 5 =
past?</div><div>(1:03:19 PM) Tartarus: do we have an agenda up yet?</div>
<div>(1:03:21 PM) Jefro: ok. =A0fray, any burning issues you need to discus=
s before you go?</div><div>(1:03:26 PM) Jefro: Tartarus I was just building=
 one</div><div>(1:03:51 PM) ***Jefro &#39;s week has been plagued with hard=
ware issues, both computer and human</div>
<div>(1:03:51 PM) fray: Just that I havn&#39;t gotten to the final rev of t=
he commit guidelines yet.. =A0I won&#39;t be able to get to that until the =
morning</div><div>(1:03:59 PM) fray: (but I finally cleared everything else=
 off my schedule)</div>
<div>(1:04:10 PM) RP__: fray: lucky you :)</div><div>(1:04:17 PM) Jefro: fr=
ay I was going to get together with you for some guidelines of some kind...=
=A0</div><div>(1:04:56 PM) fray: yes we still need to do that..</div><div>
(1:05:08 PM) fray: Most of my day tomorrow is open, except around noon.. (w=
ell as of right now)</div><div>(1:05:23 PM) Jefro: fray cool, I&#39;ll try =
to contact you relatively early given the time dif</div><div>(1:05:51 PM) J=
efro: anyone have a problem following the same agenda as last time?</div>
<div>(1:05:56 PM) Jefro: meeting chair is #1</div><div>(1:06:37 PM) fray: o=
k, I&#39;ve got to go.. sorry.</div><div>(1:06:47 PM) Jefro: fray seeya</di=
v><div>(1:06:48 PM) Tartarus: Jefro, didn&#39;t we talk about letting you c=
hair last week?</div>
<div>(1:06:51 PM) Tartarus: or am I crazy?</div><div>(1:06:54 PM) koen: did=
n&#39;t we volunteer Jefro ?</div><div>(1:07:00 PM) ***RP__ volunteers this=
 week</div><div>(1:07:02 PM) Jefro: Tartarus you may be crazy.. :) =A0I tho=
ught that was for last week</div>
<div>(1:07:08 PM) Jefro:=A0<a href=3D"http://pastebin.com/JADncdCV" target=
=3D"_blank" style=3D"color: rgb(0, 0, 204); ">http://pastebin.com/JADncdCV<=
/a>=A0is last week&#39;s agenda. =A0any modifications or additions?</div><d=
iv>(1:07:08 PM) RP__: jefro did last week I think</div>
<div>(1:07:35 PM) koen: tom k ask for an hw IG</div><div>(1:08:07 PM) RP__:=
 ok, I&#39;ll chair</div><div>(1:08:11 PM) Tartarus: s/hw/infrastructure/</=
div><div>(1:08:17 PM) RP__: agenda looks good apart from listing things we&=
#39;ve closed on</div>
<div>(1:08:30 PM) ***Jefro notes RP__ =A0as chair</div><div>(1:08:47 PM) RP=
__: Koen wants to add the hw IG to the agenda</div><div>(1:08:53 PM) RP__: =
anything else for 03?</div><div>(1:08:56 PM) RP__: we 02?</div><div>(1:08:5=
9 PM) RP__: er, 02</div>
<div>(1:09:26 PM) Tartarus: not here</div><div>(1:09:33 PM) koen: yeah, mai=
linglist police</div><div>(1:09:44 PM) koen: e.g. stop people from posting =
oe-core stuff to poky only</div><div>(1:10:00 PM) RP__: koen: Yocto folks a=
re working on that</div>
<div>(1:10:37 PM) ***Jefro notes infrastructure SIG discussion topic</div><=
div>(1:10:37 PM) RP__: koen: Most have got the message but those who haven&=
#39;t are getting reminded</div><div>(1:10:47 PM) khem: and sometimes cross=
 posting too much</div>
<div>(1:10:57 PM) khem: patches in particular</div><div>(1:11:00 PM) RP__: =
khem: emails have been sent about that too</div><div>(1:11:20 PM) Jefro: do=
es that cover the mailinglist police topic?</div><div>(1:11:35 PM) RP__: I =
will sent out a reminder to the yocto people. I think that covers it unless=
 anyone has anything else to add?</div>
<div>(1:11:43 PM) khem: oe-core does not allow attaching patches</div><div>=
(1:11:47 PM) khem: is that intentional</div><div>(1:11:52 PM) RP__: khem: n=
o</div><div>(1:12:18 PM) RP__: koen: any idea why its doing that (as our ma=
ilman admin ;-)) ?</div>
<div>(1:12:21 PM) khem: so if I compose email and add patch as attachment i=
t strips out the patch and sends the bare message</div><div>(1:12:33 PM) kh=
em: more than 1 person has seen this problem</div><div>(1:12:39 PM) koen: e=
ither the mime type is messed up or the attachment is too large</div>
<div>(1:12:55 PM) khem: no patches are 1-2 liners</div><div>(1:13:13 PM) kh=
em: and patch can be generated by git diff</div><div>(1:13:21 PM) khem: it =
strips it</div><div>(1:13:44 PM) koen: the cases I&#39;ve seen is where the=
 mime type is messed up</div>
<div>(1:14:17 PM) koen: since I&#39;m not fluent in mailman, can&#39;t we j=
ust tell people to not attach patches?</div><div>(1:14:18 PM) khem: for me =
same mutt sends it fine to oe-devel same is stripped by oe-core AFAICT</div=
>
<div>(1:15:08 PM) khem: koen:=A0<a href=3D"http://support.tigertech.net/mai=
lman-attachments" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">http:=
//support.tigertech.net/mailman-attachments</a></div><div>(1:16:44 PM) Jefr=
o: sorry to interrupt - is this an education issue (&quot;send patches to p=
atches list instead of oe-core&quot;) or a mailman issue (&quot;enable oe-c=
ore ml to handle patches&quot;) ?</div>
<div>(1:17:00 PM) RP__: I think we need to fix mailman</div><div>(1:17:05 P=
M) RP__: there is likely a config error</div><div>(1:17:17 PM) RP__: koen: =
If you can&#39;t find it, let me know the password and I&#39;ll take a look=
</div>
<div>(1:17:27 PM) RP__: So, 03)</div><div>(1:17:39 PM) RP__: GNOME discussi=
on still needs to happen on the mailing list IMO</div><div>(1:17:51 PM) Tar=
tarus: Agree</div><div>(1:18:05 PM) Tartarus: Anyone in the room now that n=
eeds a poke to reply or start a discussion?</div>
<div>(1:18:16 PM) Tartarus: If so, consider yourself poked</div><div>(1:18:=
45 PM) Jefro: Stefan had the action item 2 weeks ago, last week Tartarus sa=
id he would do it if it didn&#39;t happen</div><div>(1:18:56 PM) Tartarus: =
That was re 2011.06</div>
<div>(1:18:58 PM) Tartarus: stefan started</div><div>(1:19:02 PM) RP__: ok,=
 cool</div><div>(1:19:04 PM) Jefro: ah - sorry</div><div>(1:19:08 PM) RP__:=
 and the bitbake list migrated</div><div>(1:19:11 PM) Tartarus: I read, and=
 haven&#39;t said anything since no one else has said yes, we need it</div>
<div>(1:19:25 PM) Tartarus: So, lets see</div><div>(1:19:26 PM) Jefro: no o=
ne has volunteered to start a GNOME discussion yet</div><div>(1:19:32 PM) R=
P__: ok, I think we can consider that issue closed then</div><div>(1:19:37 =
PM) Tartarus: That was the 30th</div>
<div>(1:19:41 PM) Tartarus: give folks the rest of the week</div><div>(1:19=
:48 PM) Jefro: RP__ closed bitbake issue</div><div>(1:19:50 PM) Tartarus: A=
nd if no one pops up saying no, we must have another oe.dev release</div>
<div>(1:19:55 PM) Tartarus: close it</div><div>(1:20:02 PM) RP__: agreed</d=
iv><div>(1:20:09 PM) Tartarus: koen, don&#39;t you have a stake in GNOME st=
uff?</div><div>(1:20:15 PM) Jefro: Tartarus sounds good - decide next week =
re 2011.06?</div>
<div>(1:20:17 PM) koen: yes</div><div>(1:20:27 PM) koen: I get hassled at w=
ork now to add gnome stuff</div><div>(1:20:29 PM) Tartarus: koen: Can you s=
tart the GNOME discussion off?</div><div>(1:20:36 PM) koen: but I get hassl=
ed more for other things</div>
<div>(1:20:40 PM) Tartarus: Ha</div><div>(1:20:58 PM) RP__: personally, I t=
hink a core in oe-core makes sense and all the other bits in a later compon=
ent of meta-oe or a separate repo, I don&#39;t mind which</div><div>(1:21:0=
9 PM) RP__: (for gnome)</div>
<div>(1:21:16 PM) RP__: but I will say as much on the mailing list</div><di=
v>(1:21:38 PM) RP__: For 04, the members elections should be done now and w=
e&#39;re waiting on the result, then the TSC elections should happen</div>
<div>(1:21:59 PM) RP__: Last week we talked about someone volunteering to s=
tep out the TSC. Did we close on that?</div><div>(1:22:21 PM) Jefro: no clo=
sure that I saw</div><div>(1:22:22 PM) ***Jefro sent out the minutes about =
1/2 hr ago</div>
<div>(1:22:53 PM) RP__: Ok, let me volunteer to stand down at the first ele=
ction</div><div>(1:23:02 PM) Jefro: stefan mentioned something about it two=
 or three weeks ago as I recall</div><div>(1:23:23 PM) RP__: stefan isn&#39=
;t here so that doesn&#39;t help us</div>
<div>(1:23:49 PM) Jefro: true - fray is gone as well. I suggest deferring t=
hat discussion to next week, and requiring all TSC members to attend.</div>=
<div>(1:23:52 PM) Tartarus: RP__, I think none of us want you to stand down=
, given your position in oe-core</div>
<div>(1:24:01 PM) ***Jefro thought RP was joking</div><div>(1:24:13 PM) RP_=
_: Tartarus: doesn&#39;t matter really, I have to stand for election at som=
e point</div><div>(1:24:25 PM) koen: we can just reelect him</div><div>
(1:24:29 PM) RP__: Jefro: I&#39;m serious</div><div>(1:24:46 PM) ***RP__ ho=
pes he might get reelected, if I don&#39;t I stop having to attend these me=
etings</div><div>(1:24:52 PM) RP__: :)</div><div>(1:25:48 PM) Tartarus: So,=
 in sum, we need a TSC meeting where everyone attends, asap</div>
<div>(1:25:57 PM) RP__: I don&#39;t think it matters</div><div>(1:25:57 PM)=
 Tartarus: Or a off-the-ML thread?</div><div>(1:26:09 PM) RP__: I can go fi=
rst and then we can worry about the rest at a later meeting</div><div>(1:26=
:19 PM) Tartarus: Er</div>
<div>(1:26:30 PM) Tartarus: isn&#39;t the problem we have more members than=
 the normal charter allows right now?</div><div>(1:26:39 PM) Tartarus: and =
we have (or had) a schedule for each of us standing for election</div><div>
(1:26:51 PM) Tartarus: But the problem is that once that happens, unless so=
meone looses, we&#39;ll have too many folks</div><div>(1:27:04 PM) Tartarus=
: And either need to change the official charter, or have someone volunteer=
 not to be elected</div>
<div>(1:27:14 PM) RP__: Well, eventually we&#39;ll be left with no seat for=
 someone</div><div>(1:27:35 PM) Tartarus: Right, which is why we&#39;re see=
ing if someone wants to step down, yes?</div><div>(1:27:51 PM) RP__: Its no=
t up to us</div>
<div>(1:27:58 PM) RP__: There will be 5 elections. What I&#39;m saying is t=
hat I&#39;ll volunteer my seat as the first one to be elected</div><div>(1:=
28:17 PM) RP__: The board will call for candidates, I will stand, I don&#39=
;t know who else will and we see who gets elected</div>
<div>(1:28:19 PM) Jefro: that is different indeed from volunteering to stan=
d down :)</div><div>(1:28:44 PM) Tartarus: Well, I&#39;m confused now</div>=
<div>(1:28:51 PM) Tartarus: Since that wasn&#39;t the last plan</div><div>
(1:28:57 PM) khem: We were going alphabetically</div><div>(1:29:02 PM) Tart=
arus: Or are we putting all seats up at once?</div><div>(1:29:03 PM) RP__: =
People didn&#39;t seem happy with the last plan</div><div>(1:29:19 PM) ***k=
oen has no problems with RPs plan</div>
<div>(1:29:57 PM) RP__: There will be 5 elections, one at a time, spread ov=
er a period of time</div><div>(1:30:01 PM) khem: so how =A0does it go now ?=
 every seat gets elected one by one ?</div><div>(1:30:07 PM) khem: ok</div>
<div>(1:30:09 PM) Tartarus: So, i think I get it</div><div>(1:30:11 PM) RP_=
_: For each one there will be a call for candidates</div><div>(1:30:16 PM) =
Jefro: so.. electing seats rather than individuals</div><div>(1:30:17 PM) T=
artarus: It sounds to me like a wording change over the last plan</div>
<div>(1:30:22 PM) khem: ok</div><div>(1:30:34 PM) Tartarus: So, whichever</=
div><div>(1:31:01 PM) RP__: There are 5 seats and for each of which there i=
s an election</div><div>(1:31:34 PM) RP__: Separate call for candidates and=
 then people vote</div>
<div>(1:31:46 PM) khem: ok sounds a good plan</div><div>(1:32:08 PM) Jefro:=
 RP__ who gets to organize and manage the vote? =A0is that the board&#39;s =
responsibility?</div><div>(1:32:15 PM) RP__: Jefro: yes</div><div>(1:32:28 =
PM) RP__: Jefro: this is all documented procedure for the e.V.</div>
<div>(1:32:34 PM) Jefro: got it</div><div>(1:33:32 PM) RP__: So we wait for=
 the board, we as a TSC just need to work out how six become five</div><div=
>(1:34:05 PM) RP__: After one of the elections some who has given up their =
seat will not be re-elected</div>
<div>(1:34:27 PM) RP__: Everyone happy?</div><div>(1:34:50 PM) ***RP__ take=
s that as a yes</div><div>(1:34:56 PM) RP__: 05) status updates</div><div>(=
1:35:16 PM) RP__: oe-core seems to be gaining momentum and certainly has so=
me healthy patch turnover</div>
<div>(1:35:21 PM) koen: I will manage the betting pool when the usual suspe=
ct gets confused about voting again</div><div>(1:35:36 PM) RP__: yes there =
have been odd issues but I think we&#39;re dealing with them ok</div><div>
(1:35:42 PM) RP__: Does anyone have any comments on oe-core?</div><div>(1:3=
5:47 PM) Tartarus: Yeah, I do</div><div>(1:36:00 PM) Tartarus: Do the autob=
uilders folks use currently have no-distro configs in them?</div><div>(1:36=
:11 PM) Tartarus: I know we have poky, and I&#39;m almost sure we have angs=
trom and probably shr</div>
<div>(1:36:14 PM) RP__: Tartarus: Not the yocto ones</div><div>(1:36:32 PM)=
 RP__: Tartarus: We&#39;re basically waiting on hardware atm</div><div>(1:3=
6:37 PM) Tartarus: Would that be something we can put on the yocto ones? =
=A0Or does OE need to come up with the HW for that?</div>
<div>(1:37:00 PM) Tartarus: RP__: can we at least add a single config to wh=
at&#39;s going on now in the yocto one?</div><div>(1:37:07 PM) RP__: Tartar=
us: We have plans in place to be able to take extra stuff but its six weeks=
 off at least</div>
<div>(1:37:33 PM) RP__: Tartarus: I can put in the request but I know I&#39=
;ll get screamed at</div><div>(1:37:53 PM) RP__: Tartarus: let me see what =
I can do</div><div>(1:37:53 PM) Tartarus: RP__: I think we really must have=
 it, since that&#39;s the default oe-core setting</div>
<div>(1:37:56 PM) Tartarus: thanks</div><div>(1:38:23 PM) koen: tom k menti=
oned he wanted to to a pure oe-core autobuilder</div><div>(1:38:24 PM) RP__=
: Tartarus: keep in mind that we did slim the poky shim layer down to the b=
are minimal</div>
<div>(1:38:28 PM) koen: but he needs hw for that as well</div><div>(1:38:39=
 PM) RP__: Yes, I think Tom will ultimately do this</div><div>(1:38:42 PM) =
Tartarus: RP__: yes, but still, since oe-core is supposed to work on its ow=
n</div>
<div>(1:38:48 PM) RP__: but he&#39;s waiting for the same source of hardwar=
e as Yocto</div><div>(1:38:52 PM) Tartarus: We really really should have at=
 least one autobuilder confirming that&#39;s not dying</div><div>(1:38:54 P=
M) Jefro: RP__ not quite</div>
<div>(1:38:56 PM) RP__: Tartarus: I know it is</div><div>(1:39:13 PM) RP__:=
 Jefro: In what way is this different?</div><div>(1:39:17 PM) Jefro: OE har=
dware is being donated by LF, who is waiting for the donator to get back. t=
here is progress in this way.</div>
<div>(1:39:26 PM) Jefro: Yocto&#39;s hardware is coming from a different so=
urce.</div><div>(1:39:46 PM) khem: RP__: I still think we need to work out =
a way so there is no need for gcc 4.6 in meta-oe</div><div>(1:39:49 PM) RP_=
_: Jefro: Lets talk offline about that</div>
<div>(1:39:53 PM) Jefro: RP__ yup</div><div>(1:39:55 PM) RP__: Jefro: You h=
ave partial info</div><div>(1:40:42 PM) RP__: khem: What is the current pro=
blem there?</div><div>(1:41:05 PM) RP__: khem: Is it just the linaro patche=
s?</div>
<div>(1:41:11 PM) khem: RP__: yes</div><div>(1:41:26 PM) khem: RP__: I was =
think if we could just bbappend them</div><div>(1:41:43 PM) koen: khem: wha=
t I did for 4.5 was to only have the .bbs</div><div>(1:41:45 PM) RP__: khem=
: That would work too</div>
<div>(1:41:48 PM) koen: khem: the logic is in the .incs</div><div>(1:41:56 =
PM) khem: yeah</div><div>(1:42:13 PM) RP__: Lets take that to the mailing l=
ist</div><div>(1:42:23 PM) RP__: Anything else on oe-core?</div><div>(1:42:=
42 PM) khem: release</div>
<div>(1:43:10 PM) khem: I think we need some sort of release plan for oe-co=
re</div><div>(1:43:45 PM) RP__: My current thinking is to time something wi=
th yocto&#39;s 1.1?</div><div>(1:44:04 PM) Jefro: I remembered there being =
a plan to release on .03 and .09=A0</div>
<div>(1:44:14 PM) khem: I think half yearly release would be optimum</div><=
div>(1:44:23 PM) RP__: coming up to that point yocto will want to stabilise=
 so that would benefit the oe-core release too</div><div>(1:44:35 PM) koen:=
 I talked with Martin and my impression is that the oe-core + meta-oe combo=
 lacks too much to be usefull as a release</div>
<div>(1:45:03 PM) khem: koen: lacks ? in what sense</div><div>(1:45:05 PM) =
RP__: koen: what does it lack?</div><div>(1:45:21 PM) koen: martin can&#39;=
t build his usual images with it</div><div>(1:45:29 PM) koen: and I can&#39=
;t build my usual angstrom images with it</div>
<div>(1:45:50 PM) RP__: wouldn&#39;t some of the layers release at the same=
 time?</div><div>(1:46:00 PM) khem: koen: so thats something we can roll in=
to a release plan =A0may be for oe</div><div>(1:46:02 PM) RP__: or release =
a version at some point which would work with the releases oe-core?</div>
<div>(1:46:27 PM) koen: RP__: that&#39;s my point, an oe-core only release =
would not buy &quot;us&quot; much</div><div>(1:46:39 PM) RP__: koen: you mi=
ss my point</div><div>(1:46:51 PM) khem: koen: so you mean it should be dis=
tro releases ?</div>
<div>(1:47:17 PM) RP__: koen: ideally it would be good if angstrom could re=
lease at some point based on the oe-core release for the oe-core layer</div=
><div>(1:47:27 PM) khem: I still think folks can pick up =A0a oe-core relea=
se and build their software around it</div>
<div>(1:47:54 PM) koen: RP__: I don&#39;t have enough working to call somet=
hing a release with a straight face</div><div>(1:48:02 PM) koen: RP__: and =
I think neither does martin</div><div>(1:48:03 PM) RP__: koen: not yet</div=
>
<div>(1:48:13 PM) khem: with git submodules its easy since it locks the sub=
modules by commit ids</div><div>(1:48:17 PM) RP__: koen: you don&#39;t thin=
k you&#39;ll be there in 3 months?</div><div>(1:48:58 PM) koen: RP__: reali=
stically, no</div>
<div>(1:49:12 PM) RP__: koen: which areas are the concerns in?</div><div>(1=
:49:19 PM) ***RP__ is worried by this</div><div>(1:49:31 PM) khem: I think =
we need more recipes into meta-oe</div><div>(1:49:32 PM) koen: the big one =
in terms of recipes is a complete gnome 2.32 stack</div>
<div>(1:49:54 PM) koen: the big one in terms of base system is work out why=
 things like console setup are screwed</div><div>(1:49:55 PM) RP__: ok, so =
its the meta-oe issue, not something about oe-core itself</div><div>(1:50:1=
1 PM) khem: I think oe-core plays into it as well</div>
<div>(1:50:17 PM) RP__: It would be good to have a working list of things w=
ith oe-core that are problems</div><div>(1:50:17 PM) khem: indirectly</div>=
<div>(1:50:23 PM) RP__: those I can try and help with directly</div><div>
(1:50:37 PM) RP__: meta-oe does need community help and may take a little l=
onger</div><div>(1:50:57 PM) khem: a release would bring over some devs</di=
v><div>(1:51:28 PM) RP__: I think oe-core needs to release. Whether meta-oe=
 does or not at the 09 point I don&#39;t know</div>
<div>(1:51:30 PM) koen: RP__: I&#39;m not against an oe-core release, but b=
y the looks of it only oe-core would release</div><div>(1:51:41 PM) RP__: k=
oen: we have to start somewhere</div><div>(1:52:25 PM) khem: may be initial=
ly only yocto will be based of release and slowly other distros will fall i=
n as we go</div>
<div>(1:52:57 PM) khem: angstrom clearly has wide coverage and lot of diffe=
rent images to consider</div><div>(1:52:57 PM) koen: RP__: that&#39;s very =
true, but we have to be carefull in the messaging</div><div>(1:53:18 PM) RP=
__: koen: no argument from me</div>
<div>(1:53:59 PM) khem: we can discuss it more next week</div><div>(1:54:14=
 PM) koen: btw, 15 more members for the e.V.</div><div>(1:54:35 PM) Jefro: =
koen is there a link?</div><div>(1:54:41 PM) khem: good</div><div>(1:54:51 =
PM) RP__: ok, we have 5 mins left</div>
<div>(1:55:16 PM) RP__: I think if anyone has status updates on contrib gui=
delines, bsp guidelines metadata layer splitting</div><div>(1:55:17 PM) khe=
m: siteinfo in oe-core needs some makeover from oe.dev</div><div>(1:55:18 P=
M) RP__: raise them now</div>
<div>(1:55:21 PM) koen: Jefro: mail is underway</div><div>(1:55:25 PM) RP__=
: remaining topic was infrastructure</div><div>(1:55:28 PM) Jefro: koen coo=
l</div><div>(1:55:48 PM) RP__: I think Yocto setup an interest group for th=
is</div>
<div>(1:55:51 PM) Jefro: infrastructure we kind of covered earlier. =A0Tom =
has linked up with LF and things are progressing.</div><div>(1:55:51 PM) ko=
en: RP__: I raised the layer splitting internally at TI, people are going t=
o try out the current angstrom setup and report back</div>
<div>(1:56:06 PM) RP__: Can the OE and Yocto groups work together or is the=
re a reason to keep them separate?</div><div>(1:56:09 PM) Jefro: Yocto has =
a Yocto Infrastructure SIG, which Tom can join if he likes - maybe should</=
div>
<div>(1:56:17 PM) Jefro: I talk with him a few times a week</div><div>(1:56=
:55 PM) ***RP__ proposes Tom should join the Yocto group rather than form a=
 separate one</div><div>(1:57:09 PM) RP__: at least see if that can work</d=
iv>
<div>(1:57:25 PM) Jefro: I think the orgs can definitely help each other ou=
t here. I&#39;ll take action item to talk with Tom.</div><div>(1:57:29 PM) =
RP__: koen: sounds good, I&#39;d be interested to know how that foes</div>
<div>(1:57:32 PM) RP__: er, goes</div><div>(1:57:46 PM) ***RP__ needs to pu=
t the light on as touch typing isn&#39;t working well</div><div>(1:58:24 PM=
) RP__: Anything else anyone wants to talk about?&gt;</div><div>(1:58:29 PM=
) khem: not me</div>
<div>(1:58:33 PM) Tartarus: not me</div></span><br>-- <br>Jeff Osier-Mixon =
<a href=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/blog</=
a><div>Yocto Project Community Manager @Intel <a href=3D"http://yoctoprojec=
t.org" target=3D"_blank">http://yoctoproject.org</a></div>
<br>

--90e6ba3fcec54b2f5404a562d871--
