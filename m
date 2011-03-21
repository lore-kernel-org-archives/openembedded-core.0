Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Q1l7m-0001CX-JP; Mon, 21 Mar 2011 20:50:46 +0100
Received: by fxm19 with SMTP id 19so5832439fxm.6
	for <multiple recipients>; Mon, 21 Mar 2011 12:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=+DdLf1x4u7SpliFFkXTz/GlAkpOJMWeiJ6uSShEvN+0=;
	b=mC6q2V1gYZww5mSSELWchjFhMpC9687BdKUhkZR0HYXlbyyGBgDTnEIpulYO/6YD/Z
	K+1HoLjRdK2PSa+ce8br1f6zHVGIfY3YhfjKbyFkAAeMScfF0CQ4VeV5cv+HwOIKL2ny
	KdqeiBia7a7G8N8u5f5cihHmXIVGz+THymtlE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=lB1WQkntzwrlzY5ee/qnREgxWQ7iDNL9tf4bxANtn+Rl2xWWom4N6oSogh8GNcHl8h
	V4QO2jLoc9zI8+BqPC9hUZJYqcYFWJ1RtXVhtLIdjRJanTmd0LcVhBwfcSyILljghA22
	6Iaj3v4vwh3RUzuq6BLhJhOK5fnN6f2gWyYg4=
MIME-Version: 1.0
Received: by 10.223.27.18 with SMTP id g18mr2888723fac.52.1300736937279; Mon,
	21 Mar 2011 12:48:57 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.223.125.83 with HTTP; Mon, 21 Mar 2011 12:48:56 -0700 (PDT)
Date: Mon, 21 Mar 2011 12:48:56 -0700
X-Google-Sender-Auth: Y12Qm0Ln6nQRUKn389-BQm34PXI
Message-ID: <AANLkTi=zzGdVHSAuvE9gZ-ETWA8T5ATm5NhTzf=Fx3m+@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	tsc <tsc@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Minutes, OE TSC meeting, March 10 2011
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
X-List-Received-Date: Mon, 21 Mar 2011 19:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Attendance: Mark Hatle, Richard Purdie, Khem Raj, Tom Rini, Stefan Schmidt,
Koen Kooi,
Secretary: Jeff Osier-Mixon (non-voting)
_____________________________________________________________________________
AGENDA WITH DISCUSSION RESULTS

 01) Agree on meeting chair

Koen this time, Khem volunteered next time
___________________________________
 02) Status report on oe-core

Mark: changes going in, still looking for rpm build issue reported by Khem &
Denys, yocto bug 890
Khem is able to use oe-core with angstrom, has blogged on setup and also
created wiki page on oe->oe-core sync
Mark: yocto master syncing regularly
(1:12:39 PM) koen:
http://wiki.openembedded.org/index.php/List_of_OE_Features_For_oe-core
(1:12:51 PM) koen:
http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-angstrom-for-qemu/
Koen will poke Khem for gcc update re meta-toolchain issue
outstanding issues:
  1-bitbake sync
  2-s/yocto/oe-core/ and s/poky/??/ (Khem thinks ?? = oe)
take discussion on that to the ml
AI: Jefro volunteers to wikify checklist if someone sends
AI: Koen to send email gathering input for checklist (sent before meeting
ended)
Mark: we've still got things we have to do before oe-core is "good enough"
to present as 'done' IMHO
 not gotten the branding and cleanup which I think we have to do before it's
'good enough'
AI: discussion for branding & recipe split to mailing list, Richard
responded to Koen's post already

___________________________________
 03) Status report on pull model, contrib repo and guidelines

Mark hopes to post commit/patch policy guidelines tomorrow, has feedback to
incorporate
contrib repo now visible, pull model seems to be working
  devs free to use own public repos
  nice to do, pull req script to figure out url dynamically
Koen would like to copy oe-core guidelines as much as possible for meta-oe
layer

___________________________________
 04) Status report on board support layer guidelines

no feedback from Richard on yocto side yet, agreed to use yocto guidelines
minus scary linux-yocto requirement
need to find out lf position on bsp postings, feed to oe board
  non-LF memeber postings
AI: continued, Richard to report back, send to board
AI: Richard has action to write proposal for YP steering group, won't have
answer until their meeting
___________________________________
 05) Status report on version retention policy and interaction with
 oe-core / meta-oe / $distro layers

Tom posted to ml, Koen likes doc from Mark & Tom
 +/- ready to wikify
Koen doesn't like micromanaging & docing all use cases
TSC needs to define what is in what category
AI: Tom will wiki it
___________________________________
 06) Status on layer splitting of metadata

Khem using meta-oe layer, need to keep working on it - kitchen sink?
Koen - plan is to populate initially & evaluate
make pull strategy offiical by copying oe-core guidelines
Koen volunteers to be pullmaster
Richard reasonable to have clear areas of ownership, doc'd in meta-oe
must plan for higher activity in future
Koen: split recipes ok, but layers inside meta-oe not necessary yet
splitting criteria?
  1. willing maintainers (koen) following established quality guidelines
(tom)
  2. systems/related functionality (fray)
  3. layer non-interdependence (koen)
split into layers now? Koen says little experience with layers in oe
community & with maintainers
Richard if structure could accomodate now, better for future
Khem - arrange like oe-core, meta and meta-xxx structure?
AI: Koen will move data in repo down a level into meta-oe now
___________________________________
 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other
    "flags" discussion
  [ Proposed: Tom Rini ]

Tom: agree on problem scope & move to ml
need OE to meet needs of distros that maintain a feed
as well as useers that care more about initial build
important that feed people don't waste time debugging things
that nonfeed people introduce
fray: documenting flags as part of feed is necessary
signature code is starting point for both use cases
Mark is also concerned about namespace pollution btw flags
Richard - this is also on post-1.0 yocto list
AI: Tom to move to ml
___________________________________
 07) Continue discussion on posting of policies and guidelines

Mark: where to post and when?
AI: Khem to highlight the oe-core ml on oe-dev, tell poeple about discussion
suggest wiki for text, ml for discussion

___________________________________
 08) Continue discussions on infrastructure items

issues were to be raised on ml, no one did
Koen: admins sent doc requesting hw/funding, kick to board & LF?
Richard did pass it on to LF and is discussing hw options
Tom King made a draft on what is needed for future to replace oestats
Khem: autobuilder or tinderbox functionality still missing
oe infrastruc on machines shared with 4 other projects
tom requesting all 5 projects find funding

___________________________________
 09) How are we going to deal with the parts of OE that are not part of
OE-core. (Frans)

 discussed in earlier line items

_____________________________________________________________________________
TRANSCRIPT

(12:59:13 PM) Tartarus: Just about now'ish right?
(12:59:59 PM) Jefro: 1 minute
(1:00:01 PM) Jefro: Khem sends apologies, so we are just waiting for tom and
stefan
(1:00:08 PM) Jefro: oop, hi Tom :)
(1:01:10 PM) Jefro: until stefan arrives, I suggest starting on 01) Agree on
meeting chair
(1:01:37 PM) Tartarus: First can we get the "final" agenda
posted/pastebined?
(1:01:44 PM) Jefro: 1 second
(1:02:45 PM) Jefro: agenda is at http://pastebin.com/vjaiK3K3
(1:03:42 PM) fray: works for me
(1:03:50 PM) fray: before we begin we need someone to log
(1:04:14 PM) Jefro: I will log, if that is ok with everyone
(1:04:20 PM) khem [~khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net]
entered the room.
(1:04:20 PM) mode (+v khem) by ChanServ
(1:04:28 PM) Tartarus: Works for me
(1:04:37 PM) Jefro: alert: khem no longer sends apologies and has arrived on
time
(1:05:01 PM) khem: crazy work
(1:05:45 PM) Jefro: khem: agenda is at http://pastebin.com/vjaiK3K3
(1:06:26 PM) Tartarus: So, I'd suggest koen or khem as everyone else has had
a turn as the chair so far
(1:06:40 PM) koen: I'll chair
(1:06:51 PM) Jefro: 01) completed
(1:06:56 PM) koen: let's wait 4 minutes for stefan and then begin
(1:07:12 PM) koen: Jefro: double check: you'll be doing the minutes and
logging, right?
(1:07:20 PM) fray: I thought Stefan said last week he wouldn't make it..
(1:07:26 PM) Jefro: koen - yes, I have volunteered
(1:07:30 PM) ***fray double checks
(1:08:28 PM) koen: fray: I don't really recall, so let's wait till ten past
the hour :)
(1:08:34 PM) khem: next week I will chair so 01 for next week is done too
(1:08:39 PM) fray: can't find it
(1:09:21 PM) Jefro: with 8 more agenda items, I suggest continuing
(1:09:26 PM) koen: should the chairman send out an agenda for next week, or
can we talk Jefro into doin gthat?
(1:09:45 PM) khem: chairman can do it
(1:10:06 PM) koen: OK, let's get started with 02) Status report on oe-core
(1:10:58 PM) fray: Changes are still going in... but I've not had a lot of
time to work with it.. I'm looking for the RPM build issue reported by both
Khem and Denys..  bug 890 in the yocto bug system
(1:11:08 PM) khem: lets see. I am finally able to use OE-core effectively
with angstrom
(1:11:34 PM) khem: I have done a small weblog on how to get setup
(1:11:35 PM) fray: Yocto (master) is syncing regularly..
(1:11:53 PM) khem: and also created a page on wiki for outstanding OE ->
oe-core syncs
(1:12:00 PM) khem: I dont think anyone else filled in anything
(1:12:13 PM) koen: I only have a problem with meta-toolchain on the
buildhost at work, but I'll poke khem to update gcc in meta-oe to see if
that will fix it
(1:12:16 PM) Tartarus: Where is your blog post and that page?
(1:12:30 PM) khem: on the ml
(1:12:32 PM) khem: oe-devel
(1:12:39 PM) koen:
http://wiki.openembedded.org/index.php/List_of_OE_Features_For_oe-core
(1:12:51 PM) koen:
http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-angstrom-for-qemu/
(1:13:22 PM) koen: From the top of my head, outstanding items:
(1:13:23 PM) khem: we can collect stuff in the wiki and let people chose on
what they would chose to do
(1:13:28 PM) koen: 1) bitbake sync
(1:13:30 PM) khem: add their name for ownership
(1:13:41 PM) koen: 2) s/yocto/oecore/ and s/poky/something/
(1:13:55 PM) khem: it should be oe I think
(1:13:58 PM) khem: in all cases
(1:14:14 PM) khem: or OpenEmbedded where elaboration is needed
(1:14:19 PM) koen: let's that take discussion to the ml
(1:14:19 PM) fray: ya, I think thats the direction.. but I agree.. we need
to start posting and updating a checklist.. or we're going to miss stuff..
(1:14:56 PM) koen: who wants the action item to elaborate teh checklist and
post it?
(1:15:11 PM) Jefro: if someone sends me a list, I'll wikify it
(1:15:13 PM) ***khem volunteers Tartarus
(1:15:19 PM) fray: I'm swamped until early next week
(1:15:29 PM) ***Tartarus is also swamped
(1:15:42 PM) koen: should we put it in the 1.0 or 1.1 MS for yocto?
(1:16:19 PM) fray: I'm thinking to OE specific items should be in the oe
wiki.. and we can work with the yocto side to track whatever they feel is
necessary as well..
(1:16:21 PM) khem: yocto ?
(1:16:34 PM) khem: ah right
(1:16:35 PM) fray: we've still got things we have to do before oe-core is
"good enough" to present as 'done' IMHO
(1:16:56 PM) khem: yes we are not there yet
(1:17:25 PM) fray: (I do see progress -- just we've not gotten the branding
and cleanup which I think we have to do before it's 'good enough')
(1:18:06 PM) koen: the discussion for the branding and recipe split is best
done on the core ml IMO
(1:18:10 PM) koen: any objections to that?
(1:18:11 PM) fray: koen agreed
(1:18:14 PM) Tartarus: agree
(1:18:20 PM) khem: agreed
(1:18:34 PM) Jefro: does someone have an action item to write to the ml for
that?
(1:18:59 PM) koen: RP responded to my post about it, so it is already going
on
(1:19:03 PM) Jefro: ok
(1:19:40 PM) koen: I'll send an email to gather input for the checklist
(1:19:59 PM) koen: unless there are any other items, let's move to 03)
Status report on pull model, contrib repo and guidelines
(1:20:35 PM) fray: I did not get my AI of posting the commit/patch
policy/guidelines.. I'll get to it hopefully tomorrow.. (I did get
additional feedback though which I'd like to incorporate)
(1:21:21 PM) Jefro: fray: I am working on similar contribution guidelines
for yocto, I'd be glad to sync with yours
(1:21:56 PM) fray: yes, we should.. we discussed last week using the
guidelines as a base.. then layers can deviate from the in documented ways
(documented by the layer that is)
(1:22:26 PM) fray: as Khem mentioned before, the contrib repo is now
visible.. I don't know if anyone is using it yet though..
(1:22:36 PM) fray: pull model seems to be working as well..
(1:22:36 PM) khem: I am using
(1:22:45 PM) koen: fray: people are using it already
(1:22:47 PM) fray: perfect.. then we've at least got one user...
(1:22:54 PM) fray: even better.
(1:22:56 PM) khem: I saw Martin use it
(1:23:08 PM) khem: but devs are free to use their own public repos
(1:23:18 PM) fray: yup..  we need to make that clear as well
(1:23:18 PM) khem: its just a convenience for devs
(1:23:18 PM) koen: As meta-oe leader I would like to copy the oe-core
guidelines as much as possible
(1:23:29 PM) Tartarus: esp if someone makes the pull request script figure
out its url dynamically :)
(1:23:40 PM) khem: correct
(1:23:45 PM) fray: would be nice to add that to the "list of things to do"
 ;)
(1:24:34 PM) fray: on to the next?
(1:24:45 PM) khem: Yes
(1:25:01 PM) fray: 04) Status report on board support layer guidelines
(1:25:17 PM) fray: I haven't seen anything back from the board -- or RP on
the Yocto side yet.. so I don't think there is anything to report yet..
(1:25:24 PM) koen: I think we agreed to use the yocto one, minus the scary
linux-yocto stuff
(1:25:34 PM) Tartarus: Shall we ping the board about an anwser?
(1:25:39 PM) Tartarus: Just to keep things rolling
(1:25:55 PM) fray: we need to find out the LF position on BSP postings..
then feed that to the OE board
(1:26:08 PM) fray: (that non-LF member positings of BSPs)
(1:26:40 PM) fray: so I'd keep the action open for RP to report back.. then
we send it to the board
(1:26:51 PM) khem: right pinging board would be nice
(1:27:45 PM) fray: ok.. on to 05?
(1:27:50 PM) Jefro: 1 quick...
(1:27:57 PM) koen: Jefro: yes?
(1:28:52 PM) koen: 05) Status report on version retention policy and
interaction with oe-core / meta-oe / $distro layers
(1:28:57 PM) Tartarus: OK
(1:29:03 PM) Tartarus: I posted the TSC bit to the ML
(1:29:06 PM) Tartarus: got some feedback/questions
(1:29:08 PM) koen: I like the document fray and Tartarus came up with
(1:29:11 PM) Tartarus: and agenda items
(1:29:13 PM) khem: I think we need a strategy to retire versions
(1:29:16 PM) khem: from oe-core
(1:29:27 PM) Tartarus: I think we're +/- ready to wiki it
(1:29:34 PM) fray: ya, I think that was what I got out of some of the
oe-devel questions
(1:29:35 PM) koen: I would like to say that I'm not fond of micro-managing
and documenting all the usecases
(1:29:47 PM) Tartarus: It's boiling down to "need the TSC to define what is
in what catagory" and "guess we need to see how it goes in practice"
(1:29:52 PM) fray: and yes, I agree I think we're close enough to wiki it..
and continue to revise based on feedback
(1:30:00 PM) fray: Tartarus agreed
(1:30:25 PM) Tartarus: So next AI, I'll take it
(1:30:26 PM) Tartarus: wiki it
(1:30:30 PM) koen: right
(1:30:37 PM) fray: ok
(1:30:43 PM) koen: 6) Status on layer splitting of metadata ?
(1:30:59 PM) khem: I have been using meta-oe layer happily
(1:31:02 PM) RP__: Sorry, lost track of time :(
(1:31:06 PM) khem: should we keep populating it
(1:31:12 PM) koen: khem: yes
(1:31:17 PM) khem: RP__: welcome
(1:31:28 PM) fray: no problem.. we've got one question for you on 04 -- did
you get info from the LF on their position on non-LF members posting BSPs?
(1:31:39 PM) khem: koen: should we aim to make it the rest-of-oe-layer
(1:31:53 PM) RP__: I have the action to write a proposal for the steering
group who will then discuss it at their first meeting
(1:32:03 PM) fray: ok
(1:32:10 PM) RP__: So we probably won't get an answer until after they meet
(1:32:12 PM) fray: back to 06 -- yes I think we need to keep working on
meta-oe..
(1:32:17 PM) koen: khem: my original plan is to populate it further and
continially evaluate it
(1:32:30 PM) khem: koen: ok
(1:32:31 PM) fray: it seems to be going along well from my outsider view
(I've only been using oe-core so far)
(1:32:57 PM) khem: koen: ok
(1:33:10 PM) koen: I think we need to make it the pull strategy official by
copying the oe-core guidelines
(1:33:20 PM) khem: koen: yes I agree to that
(1:33:26 PM) RP__: I must admit I'd thought we'd already dicussed a lot
about meta-oe
(1:33:27 PM) koen: I volunteer to be pullmaster or whatever it's called
(1:33:48 PM) koen: RP__: yes, we did, but some people only read what they
want
(1:33:48 PM) RP__: I think for meta-oe, it is probably reasonable to have
areas of ownership
(1:33:56 PM) fray: I personally like the pull model, I'm just worried the
churn may be too high in meta-oe..  So 1) who will handle the pulls?  and 2)
are there too many for one (or a small group) to handle?
(1:34:07 PM) fray: RP__ ya, that was going to be my next comment -- so I
agree
(1:34:21 PM) RP__: Those areas of ownership need to be clear
(1:34:28 PM) RP__: documented in meta-oe actually
(1:34:31 PM) fray: the question then in areas of ownership, will there be a
breakdown recipes-* like oe-core?  or is it still fairly flat?
(1:34:53 PM) koen: fray:
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/
(1:34:54 PM) RP__: I'm imagining multiple layers in meta-oe along themes
(1:35:07 PM) RP__: e.g. one kind of like the graveyard we discussed
(1:35:22 PM) fray: ahh, I didn't realize you'd already broken it up.....
(1:35:23 PM) khem: RP__: we can have a meta-graveyard
(1:35:32 PM) fray: so then it should be easier to assign "ownership"..
(1:35:32 PM) khem: but meta-oe should be a better one
(1:35:56 PM) koen: right now both the number or recipes and patches are
small
(1:36:03 PM) RP__: koen: so are you saying no layers in meta-oe, just a
split of recipes?
(1:36:22 PM) koen: RP__: at the moment no split is needed yet
(1:36:33 PM) RP__: koen: agreed, I'm just thinking ahead
(1:36:40 PM) koen: bit I certainly for see e.g. gnome getting its own layer
(1:36:43 PM) fray: I think as the size grows, adding more layers may become
necessary.. but we should finish the split and go ahead with the existing
directior for now..
(1:36:52 PM) khem: I think eventually a split might be needed though
(1:36:53 PM) fray: koen, yup matches my thinking currently
(1:37:02 PM) khem: what should be the splitting criteria
(1:37:14 PM) koen: I think willing maintainers would be one
(1:37:30 PM) fray: "systems" or related functionality.. that enables a
maintainer and/or user to more logically/easily use the component..
(1:37:32 PM) Tartarus: Do we really need more than that?
(1:37:37 PM) koen: and layer interdependance another
(1:37:47 PM) RP__: Do we want to have the meta-oe layout reflect this now?
(1:37:49 PM) koen: or rather non-interdependance
(1:37:53 PM) Tartarus: willing maintainers (following the normal/established
elsewhere quality guildelines)
(1:38:13 PM) koen: RP__: I really don't know
(1:38:21 PM) RP__: That is my main concern
(1:38:38 PM) koen: there's too little experience with layers in the OE
community
(1:38:46 PM) koen: and way too little maintainer experience
(1:39:00 PM) RP__: I think whats worrying me is its hard for someone to say
"I want to maintain a TV UI layer"
(1:39:03 PM) fray: I think thats something that will come with time and a
desire to control specific areas..
(1:39:17 PM) RP__: if the structure could accomodate that now, I think we'd
help things in future
(1:39:22 PM) RP__: opie and gpe spring to mind
(1:39:27 PM) fray: ya
(1:39:41 PM) khem: so I think making a meta and meta-xxx structure would be
better
(1:39:48 PM) khem: iow arrange it like oe-core ?
(1:40:06 PM) koen: shall we call it meta-oe to avoid confusion?
(1:40:09 PM) fray: I think the arrangement of recipes-* is a good one.....
(1:40:12 PM) RP__: I think we need to move the data in the repo down a level
into a meta-oe now, yes
(1:40:25 PM) RP__: Better to take the pain now than later
(1:40:29 PM) koen: I'll take that AI if people agree
(1:40:31 PM) khem: I agree
(1:40:40 PM) Tartarus: agree
(1:41:30 PM) ***RP__ is obviously in favour :)
(1:41:35 PM) fray: agree
(1:41:54 PM) koen: ok
(1:41:56 PM) fray: 07 then?
(1:42:07 PM) RP__: We can then put something in place saying the meta-oe is
maintained by X model and by Y people
(1:42:11 PM) khem: Do we have a mechanism to track ABI between layers ?
(1:42:25 PM) RP__: khem: It needs to be written really
(1:42:41 PM) khem: ok
(1:42:43 PM) fray: I don't think we do..  and yes, I suggest document it for
now
(1:43:07 PM) RP__: FWIW, in the post 1.0 yocto time frame I'm boxing some
time to look at this. I'd also like to talk about it in person, kind of
brainstorning maybe at the SF meeting
(1:43:17 PM) khem: good idea
(1:43:40 PM) Jefro: (is this still #6, layer splitting? I'll note for SF
agenda)
(1:43:43 PM) RP__: (makes two things for the meeting agenda - renaming
things in oecore, an interactive session and also brainstorming layers)
(1:43:44 PM) khem: may be we should keep preparing agenda for F2F along the
way
(1:43:51 PM) fray: (still 6)
(1:45:27 PM) fray: ok.. 07 now?
(1:45:39 PM) ***fray wants to get to the flags discussion.. :)
(1:45:43 PM) ***Jefro notices there are two 07s on the agenda - first one is
DISTRO_FEATURE
(1:45:46 PM) koen: 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and
other "flags" discussion
(1:45:48 PM) Tartarus: So, for 07 I think I'd like to agree on the problem
scope here and then move it to the ML.
(1:45:48 PM) Tartarus: What I'm trying to say is that we need a way to get
OE to meet both the needs of distributions that maintain a feed (and have
end users that create feeds) and users that care much more about initial
build time/space than feeds.  And it's important that the feed use case
people not have to waste time debugging problems introduced by a user that
put up a feed and turned off things like someone in the second case would
do.  Can we all agree that we need to modi
(1:46:10 PM) Tartarus: Historically there's been some talks about this and
an evolving opinion about what we'll allow and not allow
(1:46:12 PM) koen: you got cut off at 'modi'
(1:46:25 PM) Tartarus: Can we all agree that we need to modify things to
allow for both use cases?
(1:46:58 PM) fray: Documenting the expected "flags" as part of the feed I
think is needed..
(1:47:05 PM) Tartarus: And, I think with the signature code we've got in
oe-core, we've got the starting point for being able to fit both cases
(1:47:14 PM) Tartarus: fray, right, but that's not enough
(1:47:17 PM) fray: I have another concern about this and that is namespace..
 I'm really worried about namespace pollution between the different types of
flags we have
(1:47:22 PM) RP__: Tartarus: I agree we do need to handle this, I think we
just need to do it carefully and it needs a thought out plan
(1:47:29 PM) Tartarus: If someone ignores that, changes the flags, we can't
have the distro people waste time debugging the problem
(1:47:46 PM) Tartarus: RP__, agree, it won't be easy
(1:47:55 PM) RP__: Tartarus: checksums might help in some ways
(1:47:57 PM) Tartarus: But I want agreement from everyone that it's
something we need to solve
(1:48:06 PM) RP__: "send me the siginfo file for what you built"
(1:48:07 PM) fray: one possible way to do this is be sure to include the
configuration elements in the checksum, and then embed the checksum into the
package "somehow" (RPM packages have a method to do this already).. the only
concern is we need tools that can verify these things based on the policy
the user cares about
(1:48:14 PM) Tartarus: wait a minute fray :)
(1:48:19 PM) Tartarus: I want the real discussion on the ML
(1:48:27 PM) Tartarus: I just want agreement to tackle the problem now
(1:48:29 PM) Tartarus: brainstorm on the ML
(1:48:32 PM) Tartarus: and maybe more in SF
(1:48:37 PM) RP__: Tartarus: No argument from me, we need a solution. FWIW
its on the post 1.0 list of things yocto wants to look at
(1:48:47 PM) koen: I agree that we need to tackle it
(1:48:48 PM) fray: yes, we need to tackle this.. :)  I'm happy with the
mailing list for initial and move the discussion to in-person is SF as well
(1:48:56 PM) Tartarus: OK
(1:48:59 PM) koen: now is the time to come up with something consistent
between layers
(1:49:00 PM) Tartarus: khem, agree?
(1:49:01 PM) RP__: My only requirement is that we need to do it with some
kind of discussed plan
(1:49:08 PM) Tartarus: RP__, agreed
(1:49:09 PM) ***khem is reading
(1:49:20 PM) Jefro: Tartarus has action item to move this to the mailing
list?
(1:49:24 PM) khem: Yes agree
(1:49:28 PM) Tartarus: Jefro: Agreed :)
(1:49:29 PM) koen: read for 07) Continue discussion on posting of policies
and guidelines ?
(1:49:42 PM) Tartarus: ready for 07b :)
(1:49:48 PM) fray: purpose was where do we post them, and when...
(1:50:02 PM) fray: I think we may already have the when figured out.. the
where may still need some discussion or not?
(1:50:28 PM) RP__: fray: the oe-core list is probably where this kind of
architecture discussion needs to happen
(1:50:30 PM) fray: ohh ya, and when it's posted what makes it a draft vs
actual policy..  those kinds of things..
(1:50:32 PM) koen: I think the ml(s) are good for further discussing
(1:50:52 PM) fray: yup
(1:50:52 PM) RP__: Can someone volunteer to highlight the oe-core mailing
list on oe-dev and tell people discussion is going to happen there?
(1:50:56 PM) Jefro: I suggest mailing lists for discussion, but wiki for
actual text, with notations to describe draft vs. official
(1:51:18 PM) khem: RP__: I can do that
(1:51:40 PM) fray: Jefro thats what I was thinking as well..  just need a
where for things.. (and maybe some of this is already decided, but last time
I looked it wasnt completely clear to me)
(1:51:46 PM) RP__: The workflow I can envisage is we discuss, on the ml and
f2f, then we publish a draft. That then either becomes final or gets ammeded
until it becomes final
(1:51:51 PM) RP__: khem:  thanks
(1:52:00 PM) koen: RP__: sounds like a plan
(1:52:14 PM) ***Jefro can volunteer to take a look at the existing wiki and
suggest structural changes, but not until after Yocto 1.0 madness
(1:52:15 PM) ***RP__ has tried to do this in the past for things that are
considered "architecture"
(1:52:16 PM) koen: anything else, or should we go to 08) Continue
discussions on infrastructure items ?
(1:53:16 PM) fray: Jefro, thats fine.. my specific issues isn't with the oe
wiki in general, just the policies and how they relate to the oe-core,
meta-oe and related going forward..
(1:53:29 PM) fray: koen, ya 08 is fine
(1:53:55 PM) koen: OK, 08) Continue discussions on infrastructure items
(1:54:04 PM) fray: I'm not sure what else is needed in 08 at this point..
but we left last weeks meeting saying we'd raise some issues on the ML.. but
I'm not sure anyone did
(1:54:05 PM) koen: let's tackle actual hw first
(1:54:54 PM) koen: the admins send out a doc requesting hw and/or funding
(1:54:59 PM) koen: kick that to the board and LF?
(1:55:11 PM) RP__: koen: has the board responded to that yet?
(1:55:17 PM) RP__: I did pass it on the the LF
(1:55:25 PM) koen: RP__: it only went out to philip and me on the OE side
(1:55:35 PM) RP__: The trouble is Yocto is also hw constrained at the
moment, hard as that might be to believe :/
(1:55:45 PM) Tartarus: Er
(1:55:47 PM) Tartarus: Where did this go?
(1:55:53 PM) Tartarus: Did I miss a members email?
(1:55:56 PM) RP__: I am discussing hardware options with people
(1:55:56 PM) koen: no
(1:56:24 PM) Tartarus: Any reason it didn't go to the members list?  Or, why
is this TSC related?
(1:56:25 PM) koen: Tartarus: Tom King made a draft on what is needed for the
future
(1:56:38 PM) khem: I think autobuilder or some sort of tinderbox like
functionality is what we are missing
(1:56:40 PM) Tartarus: So we aren't yet at the point of soliciting funds?
(1:56:40 PM) koen: it kinda is TSC related since it involved autobuilders
and stuff
(1:57:22 PM) Tartarus: I know Tom King has been working on something to
replace the old oestats thing I helped overwhelm, heh
(1:57:45 PM) RP__: The trouble is the OE infrastructure is on machines
shared with four other projects
(1:57:55 PM) khem: yes
(1:57:57 PM) khem: indeed
(1:58:03 PM) RP__: So Tom is requesting all five projects find some funds
(1:58:17 PM) ***koen suggests killing bugzilla to free up some space
(1:58:28 PM) RP__: koen: ;-)
(1:58:33 PM) Tartarus: If we can get an "official" request for Funds I'll of
course see if I can get any, no promises of course
(1:58:37 PM) khem: koen: space is not that big a problem
(1:59:22 PM) ***Jefro has another meeting in 1 min
(1:59:26 PM) khem: We are out of time I guess
(1:59:28 PM) koen: khem: I was only being half serious
(1:59:42 PM) Tartarus: I think we can call it then
(1:59:46 PM) fray: lets plan to move the last item nearer the beginning next
time... and follow up on the status items as well..
(1:59:47 PM) Tartarus: got almost everything talked about
(1:59:48 PM) Jefro: I suggest that 09 was discussed earlier
(1:59:49 PM) khem: its hard to get tangents in write only meetings :)
(1:59:58 PM) fray: :)
(2:00:02 PM) koen: yes, 09 was discussed in earlier meetings
(2:00:12 PM) koen: and put in minutes
(2:00:14 PM) koen: and in mails
(2:00:15 PM) Jefro: earlier in this meeting as well, unless I misunderstood
what it meant
(2:00:29 PM) fray: other then that, I'm good to call it as well..
(2:00:40 PM) khem: I would like to see OE-core support more arches and more
libs is that viable goal
(2:00:56 PM) ***khem always have closing question
(2:01:03 PM) fray: I'd like the arches, (multi)libs documented.. :)  So I
know whats all there.. ;)
(2:01:22 PM) khem: I can document them
(2:01:23 PM) fray: koen -- just don't want to leave it hanging, even if
there are still open issues..  thats my only concern
(2:01:39 PM) koen: true
(2:01:43 PM) Tartarus: *ding*
(2:01:49 PM) Tartarus: time for MLs and so on, and normal channels
(2:01:50 PM) Tartarus left the room.
(2:01:51 PM) fray: khem, that should be part of the on-going oe-core
guidelines/policies stuff..
(2:01:55 PM) fray: yup.. meeting over ..



-- 
Jeff Osier-Mixon
Yocto Community Manager @Intel

