Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Skkxr-0003CH-O9; Sat, 30 Jun 2012 01:51:04 +0200
Received: by yenl13 with SMTP id l13so3156794yen.6
	for <multiple recipients>; Fri, 29 Jun 2012 16:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=47UKT5xhR90nli1BDx1NPBxV6pYrq+U486PvXdUIu7o=;
	b=NEKlHm3SajvOF+ZStnR0hC6MSh/Ddx86My71+x/wE66di4P1xM9uhZ/bsJ+uezMFym
	4jEYI0y/lP5dgq9WELh4L1A7vRuLOae6t9NfwiOsuiewcoafElXLfrGZZTT1bQhfLy5Z
	J3zzgn3bTudID2O5C+wSfxl9ygZZNVX8vYhFp/CRMCWlP1c0ftk9ADM4a4lXmpwo15ed
	UVixrp5QcU2R4r7hQbIMGxtqrj3zcAAfn5jPLy5+FUilALqkNgq4DUCy0UC1IeakUQO0
	JPHjMVz7Ael2xRRq+VX/+/2RterPDUOy+jSycSTsGMguH8KxhyROaqj26Gqbsv/Lky6c
	YkzA==
MIME-Version: 1.0
Received: by 10.50.181.225 with SMTP id dz1mr927543igc.2.1341013205949; Fri,
	29 Jun 2012 16:40:05 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.90.98 with HTTP; Fri, 29 Jun 2012 16:40:05 -0700 (PDT)
Date: Fri, 29 Jun 2012 16:40:05 -0700
X-Google-Sender-Auth: sO07kUZ2D8w4jYjEWDr4L-E7_2c
Message-ID: <CA+YB3rZjUeSyPRqJxYOYeY5cwX+RPSRUi6s5R7ndN+2y213C=A@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: Minutes: OE Technical Steering Committee 19 June 2012
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
X-List-Received-Date: Fri, 29 Jun 2012 23:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
19 June 2012

Attending:
 Richard Purdie (RP)
 Paul Eggleton (bluelightning)
 Koen Kooi (koen)
 Khem (khem)
 Mark Hatle (fray)

Minutes: Jefro (Jefro)

________________________________________________
Agenda & Summary

1. pick a chair
RP

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
  goal to have initial janitor communication with OE list end of May
  19/6 still pending

 b. discuss communication with OE community about release-oriented phases
   fray willing to manage page as TSC activity, create wiki when appropriate
   future agenda: document release process
   19/6 still pending

 c. pre/post install scripting (fray)
   19/6 still pending

3. new issues

 a. build history
 => Paul to announce wiki page to mailing list - done

 b. systemd
   addition of systemd to meta-oe problematic
   Radu signed up to look at systemd
   meta-systemd layer on yp is temporary, will defer to oe.org
   big systemd patchset on oe-dev ml, needs feedback on plan
      1) move everything into its own layer
      2) work out PACKAGECONFIG/DISTRO_FEATURE/IMAGE_FEATURE
      3) start merging to oe-core
    feedback indicates using DISTRO_FEATURES
 => discuss on mailing list (all)

 c. PR bumps
     need to move away from manual PR bumps towards automated ones
     Yocto Project wrote PR server, but things seem stalled
     agreement regarding automated PR bumps, server needs to be tested
     RP hoping for automated PR bumps in YP1.3 timeframe (October)
 => koen to investigate server & report back
 => bluelightning to test on autobuilder infrastructure

 d. layers discussions, specifically meta-oe and oe-core
     people are using recipes from meta-oe into their own overlays,
       not using layer
     best practice is to keep distro layers & regular recipes separate
     RP wants to come up with "combo-layer" plan to allow people to
       come up with own collections of metadata
    desire to bolt meta-oe onto oe-core without changing its
       properties - work in progress
     criteria for layer splitting needs to be related to maintainership
     meta-networking: WR offering to resurrect some OE-classic recipes and
       maintain the layer (with help)
e. sstate distro issue
   can't share sstate-native and -cross between host distros (eg F16,
       deb stable)
    open bug, next on RP's list

4. status

  Ross Burton has joined Yocto Project team

 a. Should we still support separation of / and /usr?
 =>   khem to file enhancement request for python devshell - not done

 a. oe-core release
      there will be discussion on the list about release process

 b. elections
 -> remove from this list, put back when needed - 2 years from last December
 => Jefro to document on wiki & remind the board in October 2013

 c. infrastructure
      Tom K needs to upgrade servers to 12.04 LTS, some downtime coming soon
        not much progress, tom k setting up buildbot
      mailing list issue (koen) - board is coping with it, keep on agenda

key:
=> action item (indented = older or remaining from prior meetings)
-> note from prior meetings

________________________________________________
Raw Transcript

(9:06:22 AM) Jefro: agenda is at http://piratepad.net/Yq5pzl63x6
(9:06:33 AM) khem: I would like to to add layers discussions,
specifically meta-oe and oe-core
(9:06:51 AM) Jefro: added
(9:07:01 AM) khem: interaction
(9:07:29 AM) bluelightning: this interactive pad thing is kind of cool :)
(9:07:35 AM) bluelightning: just marked that 3a is done
(9:07:42 AM) bluelightning: hope that's ok :)
(9:07:47 AM) Jefro: :) yes, that's the idea
(9:08:15 AM) RP__: Jefro: package revision
(9:08:16 AM) khem: yeah etherpad is similar
(9:09:31 AM) Jefro: is etherpad still around? I thought google
cancelled it in favor of google+ hangouts
(9:09:56 AM) Jefro: this one is hosted by the Pirate Party
(9:10:26 AM) khem: yeah its still there etherpad.org
(9:11:39 AM) RP__: is fray here?
(9:11:50 AM) koen: good morning all
(9:11:54 AM) bluelightning: hi koen
(9:12:01 AM) ***koen is still jetlagged as hell
(9:12:15 AM) RP__: koen: I know that feeling all too well :/
(9:12:49 AM) RP__: so any chair volunteer?
(9:12:53 AM) Jefro: good morning, koen - and thanks for taking the
time out of your busy race-car-driving schedule :)
(9:13:19 AM) RP__: driving race cars? sounds like fun! :)
(9:13:30 AM) ***RP__ can chair?
(9:13:36 AM) Jefro: ok
(9:13:41 AM) ***RP__ is concious we're 15 mins in and not started
(9:14:00 AM) RP__: so any other agenda items?
(9:14:29 AM) RP__: ok, 2a, Mark isn't here, its still pending
(9:14:29 AM) koen: not from me
(9:14:50 AM) RP__: For 2b, any updates?
(9:14:57 AM) RP__: I don't have anything...
(9:15:22 AM) RP__: and since Mark isn't here I'd propose deferring 2c too
(9:15:29 AM) RP__: 3a is done
(9:15:37 AM) RP__: For 3b, I can give an update
(9:15:47 AM) khem: ok
(9:16:02 AM) RP__: Various Yocto project team members are changing
around at the moment. There is someone (Radu) signed up to look at
systemd
(9:16:23 AM) fray: Apologies for being late.. having basement flooding
issues.. (think it's managed now)
(9:16:26 AM) RP__: The new team members are still coming up to speed
but I'd expect some work in that area soon, it will get discussed on
the mailing list
(9:16:33 AM) RP__: fray: any opens?
(9:16:41 AM) fray: not that I can remember
(9:16:45 AM) RP__: I'd also mention Ross Burton has joined the Yocto
Project team
(9:16:52 AM) khem: RP__: ok. there is meta-systemd layer on yp as well on oe.org
(9:16:58 AM) RP__: I think some people here might know him :)
(9:17:29 AM) khem: IIRC he worked on poky some years ago isnt it
(9:17:43 AM) RP__: khem: yes, that was a stop gap solution to avoid
pulling in the whole of meta-oe in certain circumstances, particularly
as it wasn't interoperating with other layers well
(9:17:49 AM) RP__: khem: and matchbox
(9:17:51 AM) fray: the meta-systemd layer in the Yocto Project has had
the readme changed to indicate it is expected to be temporary, with
the meta-oe version being the replacement
(9:18:09 AM) bluelightning: ok, good to have that clarification
(9:18:11 AM) koen: would have been nice to have communicated that upfrount
(9:18:13 AM) koen: -u
(9:18:14 AM) RP__: yes, its intended that its short lived, will die
and everyone wants systemd into oe-core in some form
(9:18:46 AM) RP__: koen: I apologise unreservedly about that. I did
tell the people concerned to do it, they did not, I failed to find
time to do it myself
(9:18:47 AM) koen: there's a big systemd patchset on oe-dev ml
(9:19:13 AM) koen: not much feedback on it yet, would be nice if
people would have a look at it
(9:19:21 AM) RP__: koen: whats the high level summary?
(9:19:39 AM) RP__: koen: I'll take a note to look
(9:19:43 AM) koen: move systemd into its own layer, create a ton of bbappends
(9:20:21 AM) ***RP__ appreciates pointers to things like that since I
am not managing to filter email well atm :/
(9:20:21 AM) bluelightning: koen: IIRC the latest was that there were
still some issues with that series...
(9:20:47 AM) bluelightning: (judging by someone's reply, I haven't
tested the patch series myself)
(9:21:34 AM) koen: meta-intel broke parsing for me last week, so I
wasn't able to test it
(9:21:43 AM) RP__: koen: still broken or fixed?
(9:21:52 AM) khem: ok so plan is make oe.org meta-systemd work for
everybody and then phase that into OE-Core
(9:22:07 AM) koen: RP__: it seems to work today
(9:22:29 AM) koen: khem: I think the plan is:
(9:22:35 AM) koen: 1) move everything into its own layer
(9:22:49 AM) koen: 2) work out PACKAGECONFIG/DISTRO_FEATURE/IMAGE_FEATURE
(9:22:56 AM) koen: 3) start merging to oe-core
(9:23:10 AM) khem: ok sounds good
(9:23:20 AM) RP__: sounds good to me. The feedback I've heard so far
is it needs to be a DISTRO_FEATURE
(9:23:40 AM) khem: RP__: do we still aspire to have virtual init
manager in OE-Core
(9:23:40 AM) RP__: there are reasons it can't be done entirely at an image level
(9:23:49 AM) RP__: khem: at least in theory, yes
(9:23:58 AM) bluelightning: or alternatively, some other distro-level variable
(9:23:58 AM) RP__: but we need workable proposals
(9:24:42 AM) RP__: right, alternative proposals are welcome but we'd
need good reason not to use DISTRO_FEATURES imo
(9:25:01 AM) fray: distro_feature is reasonable to me
(9:25:07 AM) khem: some packages need to be configured to build with
systemd so image level may not work I think
(9:25:21 AM) bluelightning: RP__: only that it's a selection rather
than a set of binary options
(9:25:22 AM) koen: DISTRO_FEATURE is part of the solution, but not the
complete solution IMO
(9:25:50 AM) khem: koen: whats missing if its a distro feature
(9:25:59 AM) ***RP__ hasn't looked at the code so its hard to comment
(9:26:50 AM) koen: you enable the bits with DISTRO_FEATURE, but you
still need to have some mechanics to manage the image stuff
(9:27:16 AM) koen: e.g. initramfs without or without systemd
(9:27:19 AM) fray: I'm wondering if part of the solution might be an
initscript helper of some type..  that way the distro policy of
sysvinit, systemd, or "simple init".. could be used to contrct the
right format initscripts (control files, etc)...
(9:27:40 AM) RP__: It could end up as an option in both. We just need
to be clear about the meanings
(9:28:19 AM) koen: anyway, that discussion is for the mailinglist :)
(9:28:39 AM) RP__: yes, lets take it to the mailing list. I think
things are progressing the right way
(9:28:40 AM) fray: ya, seems like the right thing to do
(9:28:50 AM) RP__: So 3c, PR bumps
(9:29:13 AM) RP__: I actually have an ask here, for koen but its a
higher level policy decision too
(9:29:31 AM) RP__: I do feel strongly we need to move away from manual
PR bumps towards automated ones
(9:29:54 AM) RP__: We've (as in Yocto) written the PR server and tried
to help this along but things seem stalled
(9:30:30 AM) RP__: I've wondered about setting a date for stopping
manual PR bumps, I appreciate the tensions that might create though
(9:31:02 AM) RP__: I'm hoping the TSC does agree that moving from
manual to automated PR bumps is the right overall goal
(9:31:38 AM) RP__: With the data in sstate, we're in a much better
position to get this right in future, particular if we couple that
with some kind of binary diff of two sets of generated packages before
they hit the feed
(9:31:48 AM) koen: I haven't tried it latetely, but does the PR server
actually work nowadays?
(9:31:49 AM) fray: I think we need to figure out something.. there has
to be a better way then bumping the PR manually (and/or using PRINC in
bbappends)...  the PR server is likely the right answer... but it
needs testing (as you mentioned)
(9:31:51 AM) RP__: This latter piece is still an idea, not implemented
(9:32:12 AM) RP__: koen: According to the people who wrote it, yes. If
it doesn't I'd love to understand why it doesn't
(9:32:24 AM) koen: I feel a lot better about automated bumps now that
we have buildhistory in oe-core
(9:32:36 AM) fray: I used it briefly a year? ago.... and it was
working.. but it was only in a test situation
(9:33:07 AM) ***bluelightning admits he has not looked at it at all
(9:33:11 AM) RP__: koen: I think all the pieces are coming together to
make this work but I could use some help in testing the PR server in
real world use. If it doesn't work, I can get people to help fix it
but we need to know what is wrong
(9:33:13 AM) koen: not trying to be a jerk here, but the people who
wrote it didn't have any real experience with the package management
side
(9:33:25 AM) RP__: koen: I'm hoping you and Martin could help a bit...
(9:33:33 AM) RP__: koen: I know, which is why I'm asking for help
(9:33:40 AM) koen: and yes, I need to try it again before making any
more comments :)
(9:34:00 AM) RP__: koen: even if it doesn't work again, I'd like to
work at it and make it work
(9:34:26 AM) khem: has yocto plans to adopt PR server
(9:34:33 AM) khem: or already usingit
(9:34:38 AM) RP__: koen: could you take an action to try it and report back?
(9:34:54 AM) RP__: khem: we don't have binary feeds to its not exactly
real world use
(9:35:07 AM) bluelightning: khem: I think we can commit to at least
testing it on our autobuilder infrastructure
(9:36:15 AM) bluelightning: but the real proof is in it working and
continuing to work for those that rely on their package feeds being
consistent and bumping PR properly
(9:36:32 AM) koen: if it works it would reduce my patch review
comments by an order magnitude
(9:36:41 AM) khem: :)
(9:36:44 AM) bluelightning: heh
(9:37:08 AM) RP__: koen: There are multiple potential benefits :)
(9:37:49 AM) RP__: FWIW I really want to stop manual PR bumping
sometime in the 1.3 release timeframe so before October
(9:38:15 AM) khem: I am for it actually
(9:38:34 AM) RP__: If there are good reasons we can't, fine but at
present I don't know of any
(9:39:12 AM) khem: RP__: so every feed provided will have its own PR
server right ?
(9:39:18 AM) RP__: khem: yes
(9:39:24 AM) khem: same package can have different PRs
(9:39:30 AM) khem: from different feeds
(9:39:38 AM) fray: you can share a PR server as well
(9:39:45 AM) RP__: khem: yes, the data would become associated with
the feed/distro
(9:40:07 AM) RP__: fray: assuming you share build configuration too
(9:40:16 AM) fray: yes
(9:40:37 AM) bluelightning: handily this also can take care of distro
policy changes that influence package contents
(9:40:37 AM) fray: I'm referring two two (or more) groups creating
packages that are compatible, same distro config..
(9:41:06 AM) RP__: fray: right
(9:41:12 AM) RP__: Onto d if nothing else on this one...?
(9:41:34 AM) RP__: khem: I think d was yours?
(9:41:49 AM) fray: (brb have to check the basement again)
(9:41:52 AM) khem: I havent submitted a feature request
(9:43:12 AM) Jefro: khem - 3d is layers discussion
(9:43:15 AM) RP__: khem: Could you elaborate on what "layers
discussions, specifically meta-oe and oe-core" means ?
(9:44:19 AM) khem: I wanted to discuss on making meta-oe an add on
which can operate in may distros
(9:44:41 AM) RP__: khem: I think that is the intent?
(9:44:44 AM) khem: and if we can find patches that can move into
OE-Core and make it a better fit
(9:44:53 AM) khem: yes.
(9:45:08 AM) khem: lot of time people are using recipes from meta-oe
into their own overlays
(9:45:24 AM) khem: and not using the layer
(9:45:42 AM) RP__: khem: I agree we need to track down the reasons for
that and fix it
(9:45:49 AM) fray: (back)
(9:46:02 AM) RP__: I'd also like to start promoting something like
combo-layer to allow people to build up collections of metadata
(9:46:03 AM) bluelightning: I think a lot of that will be solved by
the systemd split out
(9:46:08 AM) RP__: and to share the control files
(9:46:21 AM) RP__: I know we haven't done that with yocto yet, its on
my todo list
(9:46:33 AM) RP__: well, somewhere between bluelightning and I :)
(9:46:35 AM) koen: speaking of layers...
(9:46:39 AM) fray: I know we (WR) are taking individual recipes from
meta-oe..  we simply can't support all of meta-oe.. but we can support
individual recipes from it..
(9:46:57 AM) koen: can people please stop combining distro and regular recipes?
(9:47:09 AM) koen: e.g. like baerion did till bluelightning fixed it?
(9:47:18 AM) koen: and gaucasomethign is still doing
(9:47:37 AM) bluelightning: fray: as time goes on I hope we can split
out various logical groups out of meta-oe, e.g. the meta-networking
proposal
(9:47:37 AM) RP__: fray: This is why I'm wondering about at least
providing a way to do with tools and a config file so its obvious how
its done
(9:47:59 AM) RP__: koen: have you talked to them about it? I agree we
should promote best practise
(9:48:02 AM) khem: I think making meta-oe to glue right on top of
oe-core without changing much of its properties would be desirable
(9:48:12 AM) bluelightning: khem: agreed
(9:48:18 AM) fray: no disagreement here..
(9:48:24 AM) RP__: khem: I don't think there is any disagreement,
we're even working on it afaict
(9:48:49 AM) koen: with meta-systemd split it we should work on making
meta-oe yocto approved
(9:49:29 AM) RP__: koen: That would be an interesting test of the
approval process :)
(9:49:48 AM) koen: I poked davest about it
(9:50:05 AM) khem: on layers . there was a proposal for
meta-networking, this is fine graining the layer split I guess
(9:50:09 AM) RP__: koen: I heard ;-)
(9:50:42 AM) RP__: khem: I think the criteria for layer splitting
needs to be related to maintainership
(9:50:43 AM) bluelightning: khem: yes, plus WR offering to resurrect
some OE-classic recipes and maintain the layer (with help)
(9:50:44 AM) koen: the layer vs repo discussion was nice
(9:51:07 AM) RP__: If we can have someone (or a small group) step up
and willing to maintain a chunk of data, that is a good thing IMO and
we should encourage it
(9:51:46 AM) bluelightning: that brings up another point; is there any
progress on the hardware + setup for community-focused OE
autobuilders?
(9:52:13 AM) khem: RP__: yes,
(9:52:26 AM) RP__: Ok, we're drifting a little in topic to 4c (infrastructure)
(9:52:31 AM) RP__: 4a wasn't done yet
(9:52:40 AM) bluelightning: ah yes sorry let's leave it for 4c
(9:52:47 AM) RP__: 4b I think we're also good on
(9:52:49 AM) koen: that reminds me, I need to send $$$ to Tom for the
new autobuilder disks
(9:52:51 AM) RP__: which brings us to 4c :)
(9:52:55 AM) bluelightning: heh
(9:53:06 AM) khem: on 4c. not much on autobuilders. Tom K has been
trying to wotk on it
(9:53:26 AM) RP__: I think the hardware is there, its a setup issue?
(9:53:48 AM) khem: yes, setting up buildbot
(9:54:02 AM) khem: and space for sstate etc.
(9:54:42 AM) RP__: Any other business?
(9:54:47 AM) khem: I have made sure that systems are able to build
angstrom images
(9:54:52 AM) khem: and also in ramfs
(9:54:55 AM) RP__: or anything further we need to discuss on above topics?
(9:55:19 AM) khem: nothing from my end
(9:55:23 AM) bluelightning: nothing here thanks
(9:55:49 AM) fray: nothing here
(9:55:54 AM) koen: what happended to the sstate distro issue?
(9:55:57 AM) koen: and kergoths patches?
(9:56:32 AM) bluelightning: koen: could you remind us of the details / link?
(9:56:50 AM) koen: you can't share sstate-native and -cross between distros
(9:56:57 AM) koen: e.g. debian stable and fedora 16
(9:57:16 AM) RP__: koen: Its next on my list after I fix some fetcher
mirrors issues
(9:57:18 AM) fray: thought that was still being worked on...
(9:57:35 AM) RP__: koen: there is still an open bug on it
(9:57:42 AM) koen: it dropped off my radar and I just remembered it
after khem brought up sstate mirroring
(9:58:03 AM) RP__: koen: Yocto just started using multi-os autobuilders too
(9:58:12 AM) RP__: koen: so we're going to hit it hard from tonight
(9:58:43 AM) ***RP__ thinks he might at least have a -native/-cross
workaround people can use
(9:59:10 AM) ***RP__ notes we're nearly out of time
(9:59:27 AM) fray: yup, and I et to go back to the basement.. whee
(9:59:55 AM) khem: ttyl
(10:00:00 AM) fray: later
(10:00:22 AM) Jefro: fray - stay dry!
(10:00:25 AM) ***RP__ closes the meeting, thanks all

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


