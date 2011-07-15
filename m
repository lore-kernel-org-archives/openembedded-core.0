Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QhnHV-0001aY-89; Fri, 15 Jul 2011 20:38:35 +0200
Received: by iyj12 with SMTP id 12so23566iyj.6
	for <multiple recipients>; Fri, 15 Jul 2011 11:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=XS4nk0G16pBJ3/A/mhhjjUerMOo0UnsATQG9kTCyRsw=;
	b=ZsphyiOll9zRXwFFKIKko6EqTKfxnLinhbYc1/IEhBDXkmvrBqx/NeaElLn4o8QAwX
	C1XNq6EnFol+gCDRbxkB8/Wjxn4esY9h1mLcGsbxFNIFTPMPGojwErvU0dk9oMVJXS27
	Vhpoo1uQI3z+1piHlOzVehf/7pys//UBqO9Yw=
MIME-Version: 1.0
Received: by 10.42.145.196 with SMTP id g4mr4042157icv.267.1310754870174; Fri,
	15 Jul 2011 11:34:30 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.96.10 with HTTP; Fri, 15 Jul 2011 11:34:30 -0700 (PDT)
Date: Fri, 15 Jul 2011 11:34:30 -0700
X-Google-Sender-Auth: m1Llg7QqvoorwhosKaP3CpimhjQ
Message-ID: <CA+YB3rb8ivdTmHp303aPGX7j3FUvLC1Wv_iCyPxhXanKq5hfZQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: Minutes, OE-TSC meeting 14-Jul-2011
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
X-List-Received-Date: Fri, 15 Jul 2011 18:38:35 -0000
Content-Type: multipart/alternative; boundary=90e6ba1efb206ca27a04a81fe6c4

--90e6ba1efb206ca27a04a81fe6c4
Content-Type: text/plain; charset=ISO-8859-1

Minutes, OE-TSC meeting 14-Jul-2011

Attendees: Richard, Tom, Koen, Mark
Apologies: Khem
Notes: Jefro

action items marked with -->

01) choose a meeting chair

RP

02) new topics

a) Rein Memory consumption of bitbake. (khem)

RP__: currently ~80mb per thread, which isn't bad
anyone who sees issues should smem bitbake and send to RP
clean build baseline would be useful
.. will message list with instructions: when bitbake is hogging, switch to
another shell and run smem
needs someone with the time/skill to work on it - continue
for lockfiles, in summary I think the lock contention is actually pretty
good

03) action items from last week

  --> patches appearing on oe-dev, khem to send email regarding "put stuff
in meta-oe"
no update

05) Status updates
      - elections
Richard re-elected
 next elections in 2 months
      - oe-core
yocto noticing some instability
 a period of stabilisation would be a good thing (eg siteinfo overhaul)
one big change is arch/tune file changes
  moved the core arch ABI stuff to the arch-<arch> files...
  and the tune-... files only contain specific core tunings
  need to keep posting discussions on the mailing list.. so people continue
to be reminded
  Tom begs for all the TSC folks to give oe-core, sans meta-oe/etc a little
love at times
  move architecture discussion to mailing list
RP working on multilib
 stabilisation effort: starting in mid August, we'll start to look for
patches with a
more stabilising viewpoint than features
 Effectively like the kernel does
At some point we will branch the release branch and then master can open for
features again
 collecting these into some kind of a "changes" document for oe -> oe-core
transition would be good
team will continue to work with devs who are working on features vs.
stabilisation
--> RP to discuss broad stabilisation & release plan on mailing list
      - bsp guidelines
larger issue is ownership and hosting
 RP open to people hosting layers on git.yp.org, but who sets things up
keeper of repos is Beth: RP acks, Beth sets up
--> Jefro/RP to work out & post to appropriate wikis
      - metadata layer splitting
replace with meta-oe, bsp layers, and "other layers"
      - infrastructure
hardware donations failed, Linux Foundation purchasing two appropriate
servers
 misc:
fray out next thurs

Raw Transcript


(1:01:13 PM) Jefro: agenda is at http://pastebin.com/wrZM31ME - wait another
few minutes for fray?
(1:02:16 PM) RP__: yes, we can give another few minutes
(1:02:27 PM) RP__: I can chair, its probably about my turn
(1:02:34 PM) RP__: any other agenda topics?
(1:02:59 PM) RP__: re: elections, I'm unsure when the next one is
(1:03:05 PM) koen: a round of applause for our newest emember?
(1:03:08 PM) koen: -e
(1:03:31 PM) RP__: koen: thanks :)
(1:03:31 PM) ***Jefro applauds at laptop, wife looks over at me suspiciously
(1:04:12 PM) RP__: bit of an anticlimax with one candidate but such is life
:)
(1:04:14 PM) Tartarus: Jefro: after following you on G+, I doubt she's
suspicous at this point :)
(1:04:37 PM) Jefro: after 15 years, there is actually little that surprises
her, but I try my best
(1:05:06 PM) Tartarus: So no new topics from me, but I have status (yay!)
(1:05:22 PM) RP__: My parents have been married for 40+ years now and that
is just scary...
(1:06:18 PM) Jefro: Tartarus - status on an exiting topic, or personal?
(1:06:41 PM) RP__: we've given fray the few minutes - should we start?
(1:07:12 PM) ***koen likes how we don't hop from wiki to wiki in this
meeting
(1:07:15 PM) Jefro: I vote yes, being a nonvoting member
(1:07:49 PM) RP__: koen: there is only one wiki
(1:07:52 PM) RP__: ok, we can start
(1:08:03 PM) Tartarus: Jefro: oe-core status stuff
(1:08:03 PM) RP__: Any additional topics? I guess not
(1:08:14 PM) Jefro: Tartarus got it
(1:08:24 PM) RP__: So memory consumption
(1:08:29 PM) RP__: I did do some checks
(1:08:55 PM) RP__: It looks to me like the runtime overhead of whats in poky
is about a 160MB bb process of which ~50% is shared
(1:09:05 PM) koen: if username.startswith('k') { OOM }
(1:09:13 PM) RP__: so 80MB per thread which isn't so bad...
(1:09:34 PM) RP__: Now whether something is going on with more layers or
machines or something I don't know but its a useful baseline
(1:09:40 PM) RP__: (I was using smem for reference)
(1:09:54 PM) RP__: The next time someone has bitbake being a pig, send me
the smem output...
(1:10:00 PM) RP__: just for interest
(1:10:20 PM) RP__: comparison from a clean build for bonus marks
(1:10:29 PM) RP__: Anything else on memory?
(1:10:37 PM) RP__: Obviously its an ongoing thing...
(1:10:37 PM) Tartarus: RP__: can you wiki up or something how to get smem to
dump what you want?
(1:11:00 PM) RP__: Tartarus: "smem" gives something usable to start with
(1:11:12 PM) Tartarus: RP__: So, just smem bitbake thing-that-is-a-hog
(1:11:14 PM) RP__: ballpark numbers at least
(1:11:20 PM) Tartarus: | mail rp@lf
(1:11:21 PM) Tartarus: :)
(1:11:44 PM) RP__: Tartarus: when bitbake is being a hog, switch to another
shell and run smem
(1:11:58 PM) Tartarus: k
(1:12:07 PM) RP__: clean build baseline would be useful and some details
about what layers are in there
(1:12:12 PM) Tartarus: With minutes I guess that's enough documentation of
what's expected
(1:12:17 PM) Tartarus: thanls
(1:12:19 PM) Tartarus: *thanks
(1:12:36 PM) RP__: I suspect specific questions would follow but its enough
to start a discussion
(1:12:59 PM) RP__: What it doesn't tell us is what is using the memory
within bitbake
(1:13:14 PM) RP__: but I'm looking into ways of finding that out
(1:13:26 PM) RP__: Also for reference I looked at our lockfile performance
(1:13:32 PM) koen: 80 megs/thread is >600MB for 8 threads
(1:13:34 PM) RP__: I wanted to check there wasn't something nasty going on
(1:13:54 PM) Tartarus: koen: Yeah, but for 8 threads what do you think
system memory is?
(1:14:02 PM) RP__: koen: but for an 8 thread system you probably have 6GB+
(1:14:08 PM) RP__: so only 10% memory
(1:14:18 PM) ***Tartarus would think 6 is kinda low
(1:14:25 PM) koen: Tartarus: 2GB over here
(1:14:31 PM) RP__: my system happens to have 6
(1:14:31 PM) Tartarus: koen: And 8 bb threads?
(1:14:36 PM) koen: yes
(1:14:41 PM) RP__: koen: 32 bit?
(1:14:45 PM) koen: 64
(1:14:51 PM) RP__: heh, ouch
(1:14:51 PM) Tartarus: how many cores?
(1:14:53 PM) koen: core2quad
(1:15:03 PM) Tartarus: heh
(1:15:08 PM) RP__: koen: you need more memory regardless of bitbake
(1:15:12 PM) ***Jefro has a system like koen's
(1:15:16 PM) Tartarus: Lets leave this for later, yeah
(1:15:18 PM) koen: some semiconductor vendor can't handles doubles sided
dimms
(1:15:23 PM) Tartarus: I would bet 8 threads isn't the optimal value
(1:15:56 PM) koen: Tartarus: with the ssd I can go over 8, unless it's asio,
qt or webkit
(1:16:12 PM) RP__: So for lockfiles, I noticed a total lock wait time of
about 80 seconds on a sato image build mostly on the do_package lock
(1:16:34 PM) RP__: max wait for anyone was 22 seconds, followed by 7
seconds, 3, 1, 1 etc
(1:16:52 PM) RP__: so in summary I think the lock contention is actually
pretty good
(1:17:43 PM) RP__: So anything else?
(1:17:49 PM) RP__: or onto action items
(1:17:57 PM) RP__: does anyone know if Khem sent email?
(1:19:04 PM) Tartarus: er
(1:19:05 PM) RP__: if someone does, let us know or we can ask khem next week
(1:19:06 PM) Tartarus: gah
(1:19:29 PM) Jefro: I'm looking, but nothing jumps out with a clearly
identifiable Subject line
(1:19:59 PM) Tartarus: I think he only said he wasn't going to be able to
make it
(1:20:02 PM) ***RP__ doesn't remember seeing anything but I only skim oe-dev
(1:20:07 PM) fray: I'm here.. sorry for being late
(1:20:20 PM) RP__: fray: hi, you have the backlog I guess
(1:20:35 PM) RP__: fray: if there is anything you want to add, please chime
in
(1:20:40 PM) RP__: fray: any topics to add?
(1:20:48 PM) RP__: Onto status updates
(1:20:50 PM) RP__: elections
(1:20:57 PM) fray: no topics..
(1:20:58 PM) RP__: I've been elected
(1:21:03 PM) fray: other then I'll be out again next Thursday
(1:21:16 PM) RP__: did we decide when the next election should be or are we
leaving this to the board?
(1:21:29 PM) RP__: fray: I'm sure Jefro will note that
(1:21:36 PM) Jefro: yup
(1:21:40 PM) koen: leave it to the board
(1:21:46 PM) koen: them seem to be awake nowadays
(1:21:51 PM) koen: they*
(1:21:54 PM) fray: it should be in 2 months (I thought).. but we may need to
remind them
(1:22:15 PM) RP__: ok, I think that is reasonable
(1:22:31 PM) fray: that is.. the call for candidates is 2 months after the
last call for candidates..
(1:22:35 PM) RP__: OE-Core status then
(1:22:54 PM) RP__: There as been quite a bit going on
(1:23:08 PM) RP__: Yocto is noticing some instability atm with all the
changes :/
(1:23:38 PM) Tartarus: Related, I'm noticing some problems running the test
classes w/ oe-core
(1:23:52 PM) Tartarus: Could just be more documentation needed
(1:23:54 PM) RP__: We're trying to fire fight the issues and we'll be
entering a period of more stabilisation soon
(1:24:10 PM) RP__: I do want to ask people about stabilisation
(1:24:25 PM) RP__: I think having a period of stabilsation for OE-Core would
be a good thing
(1:24:32 PM) fray: so far I'm seeing fewer QA and related messages then when
I went on vacation.. but there are still a few
(1:24:34 PM) Tartarus: I think it would be reasonable to ask people to say
what they tested
(1:24:38 PM) Tartarus: And ask more often, how was this tested
(1:24:43 PM) fray: Tartarus ya, I agree..
(1:24:58 PM) ***Tartarus is bad at this sometimes too, forgot to say how I
did test the siteinfo changes
(1:25:28 PM) koen: you bribed the intern?
(1:25:37 PM) fray: heh
(1:26:04 PM) fray: I think the siteinfo overhaul of oe-core will help reduce
some of the stability issues.. but itself might lead to a few short-term
issues
(1:26:11 PM) RP__: One of the big changes which I've not seen much comment
on yet is the arch/tune file changes
(1:26:13 PM) ***Tartarus notes fray recalls what he did as an "intern" :)
(1:26:33 PM) fray: seems like it's one of those things we need to keep doing
for maintenance..
(1:26:39 PM) fray: Tartarus you were never a typical "intern"
(1:26:50 PM) Tartarus: RP__: I did read the thread, looks OK to me
(1:27:04 PM) RP__: Tartarus: Did you look at the patches?
(1:27:13 PM) Tartarus: RP__: arch/tune stuff? yes.
(1:27:15 PM) fray: The overall arch/tune cleanup I think is a really good
idea.. I've been working on refining what RP__ sent out.. and have made
progress..
(1:27:19 PM) RP__: Tartarus: ok, cool
(1:27:39 PM) RP__: Both fray and I are distilling this into something better
(1:27:49 PM) fray: the main difference is I've moved the core arch ABI stuff
to  the arch-<arch> files... and the tune-... files only contain specific
core tunings..
(1:27:52 PM) RP__: Many different use cases to consider etc
(1:28:02 PM) fray: (in reality that only affects the arm
callingconvention-hard...
(1:28:32 PM) RP__: Do we think the people who need to be aware of these
changes are aware of them?
(1:28:38 PM) Tartarus: Does anyone recall what Fedora's arm7vhl is?
(1:28:47 PM) Tartarus: Is that what debian/etc calls hf?
(1:28:57 PM) Tartarus: armv7hl that is
(1:29:03 PM) fray: I would say we need to keep posting discussions on the
mailing list.. so people continue to be reminded..
(1:29:17 PM) RP__: agreed, I'm just wondering if there is anything else we
can do
(1:29:28 PM) Tartarus: just keep talking in public
(1:29:31 PM) Tartarus: that's about all you can do
(1:29:32 PM) RP__: and are we confortable as the TSC with changing the way
these files work like this
(1:29:38 PM) Tartarus: folks join in and either agree in silence or speak up
(1:29:51 PM) koen: make a patch against oe-core instead of poky would be a
start :p
(1:29:52 PM) RP__: I think its necessary and overdue but I just want to
check we are all in sync
(1:29:57 PM) Tartarus: RP__: I think the overall approach looks like it'll
help, so yes
(1:30:12 PM) RP__: koen: I explained why I did that
(1:30:20 PM) RP__: koen: If I merge the bitbake change it'll be easier
(1:30:26 PM) fray: koen, I'm working on poky due to the multilib stuff right
now.. but I intend to rebase on oe-core when I get it working.. (I'm about
50% of the way there)
(1:30:29 PM) Tartarus: koen: I'd like to put in another beg for all the TSC
folks to give oe-core, sans meta-oe/etc a little love at times, and yes that
includes me doing more :)
(1:30:48 PM) ***fray notes he usually operates in oe-core exclusively
(1:30:55 PM) Tartarus: Maybe as a future topic we can talk about yocto post
1.1 and oe-core and where we'd like to see folks work "first"
(1:31:02 PM) Tartarus: But, new big topic, so lets put that off for a week
(1:31:05 PM) Tartarus: or ML it
(1:31:15 PM) Tartarus: I could even try and start ML'ing it now
(1:31:16 PM) RP__: Tartarus: well, I would like to point out that meta-yocto
is *tiny*
(1:31:18 PM) koen: Tartarus: bare oe-core doesn't have the bits I need
(1:31:33 PM) RP__: deliberately to head off these kind of problems
(1:31:43 PM) koen: RP__: you can make it even tinier if you put atom-pc in
meta-intel
(1:31:45 PM) Tartarus: Like I said, lets start on the ML
(1:32:09 PM) Tartarus: and I'll kick it off with what I mean and what I see
as being the first answer to what I imagine both RP and koen have as
objections
(1:32:14 PM) RP__: koen: yes, I know
(1:32:26 PM) Tartarus: So, where were we?
(1:32:32 PM) RP__: OE Core status
(1:32:41 PM) Tartarus: and tune stuff, covered
(1:32:44 PM) fray: BTW for the tunings, I think the biggest thing we need to
try to get write are the tune file names and architecture settings.. (sounds
simple.. but it gets confusing quikcly)
(1:32:48 PM) Tartarus: siteinfo I guess covered well enough, i'd just add
one thing
(1:32:51 PM) fray: (ok I'm done w/ the tuning)  :)
(1:33:03 PM) Tartarus: I'm probably really going to try the "nuke the
current ones, do world again" approach
(1:33:10 PM) RP__: So multilib is being worked upon and I'll likely start
merging more pieces of it soon
(1:33:13 PM) Tartarus: There's a lot of cruft in what we do have wrt unused
recipes
(1:33:19 PM) Tartarus: and wrt not meaingful now stuff
(1:33:36 PM) RP__: Tartarus: There is certainly some junk in them
(1:33:54 PM) koen: the current arm site files only work for eabi
(1:33:59 PM) RP__: I do want to highlight this stabilisation thing a little
more clearly though
(1:34:32 PM) RP__: I'd imagine starting in mid August, we'll start to look
for patches with a more stabilising viewpoint than features
(1:34:53 PM) RP__: Effectively like the kernel does
(1:35:00 PM) RP__: It'll be the first time we've done this, obviously
(1:35:22 PM) RP__: but it does mean if you're doing feature work, it needs
to get done sooner than later or it could be a short while before it merges
(1:35:37 PM) RP__: At some point we will branch the release branch and then
master can open for features again
(1:35:45 PM) fray: koen, we only support eabi in oe-core right?
(1:35:47 PM) ***koen is still trying to figure out which things are bugs and
which are design decisions in oe-core
(1:35:51 PM) fray: (both hard and softfp calling conventions)
(1:35:56 PM) koen: fray: you can build oabi if you wish
(1:36:11 PM) fray: "How"?
(1:36:16 PM) RP__: koen: do you have some examples?
(1:36:40 PM) koen: RP__: patching out polkit in consolekit was one
(1:36:49 PM) koen: gstreamer packaging the other
(1:36:59 PM) RP__: koen: I think that was a badly through out hack
(1:37:11 PM) RP__: koen: gstreamer packaging was more of a design decision
(1:38:00 PM) RP__: koen: splitting it into a separate .inc file is straight
forward to merge
(1:38:06 PM) RP__: the naming is a tricker issue
(1:38:29 PM) koen: I'm just naming examples, not passing judgement :)
(1:38:43 PM) RP__: koen: I'm just putting them into the categories :)
(1:38:57 PM) RP__: ok - anything else on the core?
(1:39:01 PM) fray: collecting these into some kind of a "changes" document
for oe -> oe-core transition would be good
(1:39:20 PM) RP__: any issues with the above stabilisation approach?
(1:39:43 PM) RP__: fray: I'm conscious we need to do that for yocto for
transition between versions
(1:39:52 PM) koen: I'd make a generic remark about doing *libc changes a bit
different
(1:40:01 PM) koen: but we covered that in earlier meetings already
(1:40:10 PM) fray: no issues, just a comment that we need a way to work with
people who are developing and not stabilizing..
(1:40:25 PM) fray: (I doubt that will be a huge problem though -- for
oe-core)
(1:40:36 PM) RP__: fray: people can work in branches for a bit
(1:40:46 PM) fray: thats fine with me
(1:40:57 PM) koen: preferably oe-core branches
(1:41:02 PM) RP__: if it becomes an issue there are things we can do, I'd
rather solve it if its a problem though
(1:41:39 PM) RP__: some natural pressure for people to thing about
stabilisation is probably a good thing IMO
(1:41:41 PM) koen: a few weeks ago there was talk about automated testing of
branches
(1:41:44 PM) RP__: worked well for the kernel for example
(1:41:48 PM) koen: did beth get her hardware to do that?
(1:42:01 PM) RP__: hardware wise there has been a screwup :(
(1:42:25 PM) koen: RP__: working for a hw vendor myself, I'm not suprised
(1:42:27 PM) RP__: I've been assuming we'd get some and for various reasons
the hardware donation ended up being inappropriate :(
(1:42:54 PM) RP__: The LF is going to buy OE some hardware out of its own
pocket since it made promises
(1:43:02 PM) RP__: but Yocto and Beth don't get anything
(1:43:14 PM) RP__: so we're looking at alternatives
(1:43:21 PM) koen: the cloud!
(1:43:28 PM) Tartarus: Can we ask how inappropriate?
(1:43:42 PM) RP__: Tartarus: not suitable for a datacentre
(1:44:25 PM) koen: anyway, back to stabilizing
(1:44:40 PM) koen: does oe-core have some features/guidelines?
(1:44:45 PM) koen: I know yocto has
(1:44:59 PM) koen: but does oe-core have any?
(1:45:02 PM) Tartarus: Maybe it's time for for testing-next weekly branches
again?
(1:45:06 PM) RP__: koen: guidelines for what?
(1:45:13 PM) koen: stabilizing, etc
(1:45:33 PM) koen: we're conflating yocto milestones with oe-core, which
isn't strictly true
(1:45:54 PM) RP__: koen: well, I'm assuming OE-Core does want to release
alongside Yocto
(1:46:09 PM) fray: ya.. timeline wise things seemed to line up as such
(1:46:25 PM) RP__: koen: if OE-Core wants to do something different, we as a
TSC can recommend that but I'm not sure what advantage that would have?
(1:46:32 PM) koen: I'm assuming that as well, but I don't think I've seen
any traffic about that on the oe-core list
(1:46:47 PM) RP__: koen: well, what I'm leading too is a discussion of this
on the list
(1:46:54 PM) fray: last traffic I remember was discussion of a September
release of "oe" based on oe-core
(1:46:57 PM) RP__: but I wanted to talk about it here first
(1:48:07 PM) RP__: So I think the AR is for me to take this onto the mailing
list
(1:48:21 PM) RP__: assuming the TSC is ok with the broad plan
(1:49:04 PM) RP__: I'll take silence as approval
(1:49:05 PM) fray: I am
(1:49:06 PM) RP__: Anything we want to discuss on BSP/Layers?
(1:49:36 PM) RP__: and I think we already covered infrastructure above
unless there is anything else we need to talk about?
(1:49:36 PM) Jefro: fray: can bsp guidelines be removed from this list, now
that it is published
(1:50:05 PM) RP__: Jefro: perhaps layer splitting could be replaced with
meta-oe ?
(1:50:14 PM) Jefro: RP__ ok
(1:50:21 PM) RP__: and an "other layers" topic
(1:50:26 PM) fray: Jefro, not sure.. I havn't looked at any BSP stuff.. has
anyone else?
(1:50:39 PM) RP__: since I think we should have a little focus on those
specific areas
(1:50:54 PM) fray: ya.. meta-oe and "other layers" would be best
(1:50:58 PM) Jefro: I think it is possible that "bsp guidelines" was
actually "patch guidelines", which you published (and which i am adapting
for yocto)
(1:51:08 PM) RP__: The question is do we have a relatively clear idea on how
to do a BSP layer
(1:51:09 PM) Jefro: fray: will do re meta-oe and other layers
(1:51:13 PM) fray: I thought there were a seperate guide we wanted on how to
generate a BSP in a layer
(1:51:16 PM) RP__: I think at this point we do
(1:51:27 PM) Tartarus: Well, we need some sort of "start a BSP layer" type
guidelines
(1:51:34 PM) Jefro: I can just add that as a separate status topic
(1:51:43 PM) RP__: Tartarus: did the yocto stuff cover that or not?
(1:52:09 PM) Tartarus: I don't know for sure atm, but let me pose a
"hypothetical"
(1:52:25 PM) Tartarus: Freescale wants to put up support for say P2020DS
(1:52:31 PM) Tartarus: normal 32bit platform
(1:52:36 PM) Tartarus: Where's their layer go?
(1:52:45 PM) RP__: Tartarus: depends who is maintaining it really
(1:52:56 PM) RP__: Tartarus: and where they want it...
(1:52:58 PM) Tartarus: Freescale is author
(1:53:02 PM) Tartarus: What are the choices?
(1:53:15 PM) koen: github, freescale.com
(1:53:35 PM) RP__: Tartarus: They put it up somewhere at freescale, it goes
somewhere at Mentor, github, git.oe.org or git.yp.org
(1:53:39 PM) Tartarus: Is there a openembedded.org or yoctoproject.orgoption?
(1:53:57 PM) RP__: Tartarus: yp would happily take it, I can say that for
sure
(1:53:59 PM) koen: aiui the board is still against hosting layers on oe.org
(1:54:14 PM) fray: Tartarus the yp.org is expected..  oe.org is no because
of resources.. right?
(1:54:16 PM) koen: not sure how that micro layer weaseled itself onto oe.org,
but it's there
(1:54:18 PM) Tartarus: OK, and are these choices posted?
(1:54:28 PM) RP__: koen: I can understand the concern there wrt cost of
bandwidth etc
(1:54:44 PM) RP__: and server admin
(1:55:04 PM) RP__: Tartarus: I guess not clearly and we should do that.
Where is the correct place to "post" them?
(1:55:08 PM) koen: I understand their concern
(1:55:19 PM) Tartarus: RP__: wiki?
(1:55:27 PM) RP__: Tartarus: Yocto? OE?
(1:55:28 PM) koen: I'm just saying that if bw and admin is an issue, how did
that micro layer get there?
(1:55:39 PM) RP__: koen: micro layer?
(1:55:40 PM) Tartarus: Both?
(1:55:49 PM) Tartarus: Or at least a basics on OE
(1:56:01 PM) RP__: Jefro: Fancy adding something to the wikis about this?
;-)
(1:56:01 PM) Tartarus: and a "or send XXX@LF.org your info" for yocto wiki
(1:56:10 PM) Jefro: I can take action item to work this out with RP and add
to the appropriate wiki
(1:56:10 PM) Tartarus: since it's clear how to self host or use github
(1:56:19 PM) Tartarus: But if someone wants a yocto hosting, that's a yocto
wiki topic
(1:56:24 PM) RP__: Jefro: sounds like a plan
(1:56:25 PM) Jefro: there may be minor differences between the yocto version
and the oe version
(1:56:59 PM) RP__: Tartarus: I'm very open to people having layers on
git.yp.org
(1:57:05 PM) Tartarus: RP__: k
(1:57:15 PM) Tartarus: But my only point is who needs to be asked to set
things up
(1:57:20 PM) Tartarus: Presumably you have a full inbox already :)
(1:57:29 PM) Tartarus: And would be asking someone else to do the details
anyhow
(1:57:30 PM) RP__: Tartarus: keeper of repos is Beth
(1:57:34 PM) Tartarus: Bingo
(1:57:53 PM) RP__: so its me+Beth, I ack, she sets it up
(1:58:05 PM) Tartarus: Info for the yocto wiki page on this topic :)
(1:58:25 PM) ***RP__ is hoping Jefro is taking notes :)
(1:58:29 PM) Jefro: :) yes
(1:58:32 PM) Jefro: *** 2 minute warning ***
(1:58:41 PM) RP__: Yes, nearly time
(1:58:43 PM) koen: RP__: http://cgit.openembedded.org/cgit.cgi/meta-micro/
(1:58:45 PM) RP__: Any other business?
(1:59:10 PM) RP__: koen: I don't think the board said no layers
(1:59:17 PM) Tartarus: As a small note, I hope to throw a matrix of world
builds of oe-core at machines over the weekend
(1:59:24 PM) Tartarus: We'll see how much git submodule hates me of course
(1:59:32 PM) RP__: koen: I think the idea was big commercial interests would
just have better ways to do it like their own websites or YP
(1:59:32 PM) Tartarus: and if 100GB will be enough space, I hope so tho
(1:59:56 PM) RP__: Tartarus: I have noticed OE-Core seems very space hungry
:/
(2:00:06 PM) RP__: Tartarus: with or without rm_work?
(2:00:18 PM) Tartarus: RP__: Depends on what I remember in time before
pushing the button
(2:00:34 PM) RP__: Tartarus: ok, just curious who uses it really
(2:00:36 PM) Tartarus: I'd probably throw in rm_work in hopes it works,
since, bah, crap, some boxes are on 50GB still
(2:01:10 PM) RP__: Tartarus: 25GB per machine for world I think
(2:01:15 PM) RP__: without rm_work
(2:01:30 PM) Tartarus: k
(2:01:51 PM) ***koen is on a ~50gb ssd partition
(2:02:17 PM) koen: if you use that for tmp/ you can barely build one
machines at peak useage
(2:02:25 PM) RP__: and on that note I think we're done roughly on time :)

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba1efb206ca27a04a81fe6c4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><div>Minutes, OE-TSC meeting 14-Jul-2011</div><d=
iv><br></div><div>Attendees: Richard, Tom, Koen, Mark</div><div>Apologies: =
Khem</div><div>Notes: Jefro</div><div><br></div><div>action items marked wi=
th --&gt;</div>
<div><br>
</div><div>01) choose a meeting chair</div><div><br></div><div>RP</div><div=
><br></div><div>02) new topics</div><div><br></div><div>a) Rein Memory cons=
umption of bitbake. (khem)</div><div><br></div><div>RP__: currently ~80mb p=
er thread, which isn&#39;t bad</div>

<div>anyone who sees issues should smem bitbake and send to RP</div><div>cl=
ean build baseline would be useful</div><div>.. will message list with inst=
ructions: when bitbake is hogging, switch to another shell and run smem</di=
v>

<div>needs someone with the time/skill to work on it - continue</div><div>f=
or lockfiles, in summary I think the lock contention is actually pretty goo=
d</div><div><br></div><div>03) action items from last week</div><div><br>

</div><div>=A0 --&gt; patches appearing on oe-dev, khem to send email regar=
ding &quot;put stuff in meta-oe&quot;</div><div>no update</div><div><br></d=
iv><div>05) Status updates</div><div>=A0 =A0 =A0 - elections</div><div><spa=
n style=3D"white-space:pre-wrap">			</span>Richard re-elected</div>

<div><span style=3D"white-space:pre-wrap">			</span>next elections in 2 mon=
ths</div><div>=A0 =A0 =A0 - oe-core</div><div><span style=3D"white-space:pr=
e-wrap">			</span>yocto noticing some instability</div>
<div><span style=3D"white-space:pre-wrap">			</span>a period of stabilisati=
on would be a good thing (eg siteinfo overhaul)</div><div><span style=3D"wh=
ite-space:pre-wrap">			</span>one big change is arch/tune file changes</div=
>

<div><span style=3D"white-space:pre-wrap">			</span> =A0moved the core arch=
 ABI stuff to the arch-&lt;arch&gt; files...=A0</div><div><span style=3D"wh=
ite-space:pre-wrap">			</span> =A0and the tune-... files only contain speci=
fic core tunings</div>

<div><span style=3D"white-space:pre-wrap">			</span> =A0need to keep postin=
g discussions on the mailing list.. so people continue to be reminded</div>=
<div><span style=3D"white-space:pre-wrap">			</span> =A0Tom begs for all th=
e TSC folks to give oe-core, sans meta-oe/etc a little love at times</div>

<div><span style=3D"white-space:pre-wrap">			</span> =A0move architecture d=
iscussion to mailing list</div><div><span style=3D"white-space:pre-wrap">		=
	</span>RP working on multilib</div><div>
<span style=3D"white-space:pre-wrap">			</span>stabilisation effort: starti=
ng in mid August, we&#39;ll start to look for patches with a=A0</div><div><=
span style=3D"white-space:pre-wrap">				</span>more stabilising viewpoint t=
han features</div>

<div><span style=3D"white-space:pre-wrap">				</span>Effectively like the k=
ernel does</div><div><span style=3D"white-space:pre-wrap">				</span>At som=
e point we will branch the release branch and then master can open for feat=
ures again</div>

<div><span style=3D"white-space:pre-wrap">			</span>collecting these into s=
ome kind of a &quot;changes&quot; document for oe -&gt; oe-core transition =
would be good</div><div><span style=3D"white-space:pre-wrap">			</span>team=
 will continue to work with devs who are working on features vs. stabilisat=
ion</div>

<div>--&gt;<span style=3D"white-space:pre-wrap">			</span>RP to discuss bro=
ad stabilisation &amp; release plan on mailing list</div><div>=A0 =A0 =A0 -=
 bsp guidelines</div><div><span style=3D"white-space:pre-wrap">			</span>la=
rger issue is ownership and hosting</div>

<div><span style=3D"white-space:pre-wrap">			</span>RP open to people hosti=
ng layers on <a href=3D"http://git.yp.org" target=3D"_blank">git.yp.org</a>=
, but who sets things up</div><div><span style=3D"white-space:pre-wrap">			=
</span>keeper of repos is Beth: RP acks, Beth sets up</div>

<div>--&gt;<span style=3D"white-space:pre-wrap">			</span>Jefro/RP to work =
out &amp; post to appropriate wikis</div><div>=A0 =A0 =A0 - metadata layer =
splitting</div><div><span style=3D"white-space:pre-wrap">			</span>replace =
with meta-oe, bsp layers, and &quot;other layers&quot;</div>

<div>=A0 =A0 =A0 - infrastructure</div><div><span style=3D"white-space:pre-=
wrap">			</span>hardware donations failed, Linux Foundation purchasing two =
appropriate servers</div><div><span style=3D"white-space:pre-wrap">			</spa=
n></div>

<div>misc:</div><div>fray out next thurs</div><div><br></div><div>Raw Trans=
cript</div><div><br></div><div><div><br></div><div>(1:01:13 PM) Jefro: agen=
da is at <a href=3D"http://pastebin.com/wrZM31ME" target=3D"_blank">http://=
pastebin.com/wrZM31ME</a> - wait another few minutes for fray?</div>

<div>(1:02:16 PM) RP__: yes, we can give another few minutes</div><div>(1:0=
2:27 PM) RP__: I can chair, its probably about my turn</div><div>(1:02:34 P=
M) RP__: any other agenda topics?</div><div>(1:02:59 PM) RP__: re: election=
s, I&#39;m unsure when the next one is</div>

<div>(1:03:05 PM) koen: a round of applause for our newest emember?</div><d=
iv>(1:03:08 PM) koen: -e</div><div>(1:03:31 PM) RP__: koen: thanks :)</div>=
<div>(1:03:31 PM) ***Jefro applauds at laptop, wife looks over at me suspic=
iously</div>

<div>(1:04:12 PM) RP__: bit of an anticlimax with one candidate but such is=
 life :)</div><div>(1:04:14 PM) Tartarus: Jefro: after following you on G+,=
 I doubt she&#39;s suspicous at this point :)</div><div>(1:04:37 PM) Jefro:=
 after 15 years, there is actually little that surprises her, but I try my =
best</div>

<div>(1:05:06 PM) Tartarus: So no new topics from me, but I have status (ya=
y!)</div><div>(1:05:22 PM) RP__: My parents have been married for 40+ years=
 now and that is just scary...</div><div>(1:06:18 PM) Jefro: Tartarus - sta=
tus on an exiting topic, or personal?</div>

<div>(1:06:41 PM) RP__: we&#39;ve given fray the few minutes - should we st=
art?</div><div>(1:07:12 PM) ***koen likes how we don&#39;t hop from wiki to=
 wiki in this meeting</div><div>(1:07:15 PM) Jefro: I vote yes, being a non=
voting member</div>

<div>(1:07:49 PM) RP__: koen: there is only one wiki</div><div>(1:07:52 PM)=
 RP__: ok, we can start</div><div>(1:08:03 PM) Tartarus: Jefro: oe-core sta=
tus stuff</div><div>(1:08:03 PM) RP__: Any additional topics? I guess not</=
div>

<div>(1:08:14 PM) Jefro: Tartarus got it</div><div>(1:08:24 PM) RP__: So me=
mory consumption</div><div>(1:08:29 PM) RP__: I did do some checks</div><di=
v>(1:08:55 PM) RP__: It looks to me like the runtime overhead of whats in p=
oky is about a 160MB bb process of which ~50% is shared</div>

<div>(1:09:05 PM) koen: if username.startswith(&#39;k&#39;) { OOM }</div><d=
iv>(1:09:13 PM) RP__: so 80MB per thread which isn&#39;t so bad...</div><di=
v>(1:09:34 PM) RP__: Now whether something is going on with more layers or =
machines or something I don&#39;t know but its a useful baseline</div>

<div>(1:09:40 PM) RP__: (I was using smem for reference)</div><div>(1:09:54=
 PM) RP__: The next time someone has bitbake being a pig, send me the smem =
output...</div><div>(1:10:00 PM) RP__: just for interest</div><div>(1:10:20=
 PM) RP__: comparison from a clean build for bonus marks</div>

<div>(1:10:29 PM) RP__: Anything else on memory?</div><div>(1:10:37 PM) RP_=
_: Obviously its an ongoing thing...</div><div>(1:10:37 PM) Tartarus: RP__:=
 can you wiki up or something how to get smem to dump what you want?</div>

<div>(1:11:00 PM) RP__: Tartarus: &quot;smem&quot; gives something usable t=
o start with</div><div>(1:11:12 PM) Tartarus: RP__: So, just smem bitbake t=
hing-that-is-a-hog</div><div>(1:11:14 PM) RP__: ballpark numbers at least</=
div>

<div>(1:11:20 PM) Tartarus: | mail rp@lf</div><div>(1:11:21 PM) Tartarus: :=
)</div><div>(1:11:44 PM) RP__: Tartarus: when bitbake is being a hog, switc=
h to another shell and run smem</div><div>(1:11:58 PM) Tartarus: k</div>

<div>(1:12:07 PM) RP__: clean build baseline would be useful and some detai=
ls about what layers are in there</div><div>(1:12:12 PM) Tartarus: With min=
utes I guess that&#39;s enough documentation of what&#39;s expected</div>

<div>(1:12:17 PM) Tartarus: thanls</div><div>(1:12:19 PM) Tartarus: *thanks=
</div><div>(1:12:36 PM) RP__: I suspect specific questions would follow but=
 its enough to start a discussion</div><div>(1:12:59 PM) RP__: What it does=
n&#39;t tell us is what is using the memory within bitbake</div>

<div>(1:13:14 PM) RP__: but I&#39;m looking into ways of finding that out</=
div><div>(1:13:26 PM) RP__: Also for reference I looked at our lockfile per=
formance</div><div>(1:13:32 PM) koen: 80 megs/thread is &gt;600MB for 8 thr=
eads</div>

<div>(1:13:34 PM) RP__: I wanted to check there wasn&#39;t something nasty =
going on</div><div>(1:13:54 PM) Tartarus: koen: Yeah, but for 8 threads wha=
t do you think system memory is?</div><div>(1:14:02 PM) RP__: koen: but for=
 an 8 thread system you probably have 6GB+</div>

<div>(1:14:08 PM) RP__: so only 10% memory</div><div>(1:14:18 PM) ***Tartar=
us would think 6 is kinda low</div><div>(1:14:25 PM) koen: Tartarus: 2GB ov=
er here</div><div>(1:14:31 PM) RP__: my system happens to have 6</div>
<div>
(1:14:31 PM) Tartarus: koen: And 8 bb threads?</div><div>(1:14:36 PM) koen:=
 yes</div><div>(1:14:41 PM) RP__: koen: 32 bit?</div><div>(1:14:45 PM) koen=
: 64</div><div>(1:14:51 PM) RP__: heh, ouch</div><div>(1:14:51 PM) Tartarus=
: how many cores?</div>

<div>(1:14:53 PM) koen: core2quad</div><div>(1:15:03 PM) Tartarus: heh</div=
><div>(1:15:08 PM) RP__: koen: you need more memory regardless of bitbake</=
div><div>(1:15:12 PM) ***Jefro has a system like koen&#39;s</div><div>
(1:15:16 PM) Tartarus: Lets leave this for later, yeah</div>
<div>(1:15:18 PM) koen: some semiconductor vendor can&#39;t handles doubles=
 sided dimms</div><div>(1:15:23 PM) Tartarus: I would bet 8 threads isn&#39=
;t the optimal value</div><div>(1:15:56 PM) koen: Tartarus: with the ssd I =
can go over 8, unless it&#39;s asio, qt or webkit</div>

<div>(1:16:12 PM) RP__: So for lockfiles, I noticed a total lock wait time =
of about 80 seconds on a sato image build mostly on the do_package lock</di=
v><div>(1:16:34 PM) RP__: max wait for anyone was 22 seconds, followed by 7=
 seconds, 3, 1, 1 etc</div>

<div>(1:16:52 PM) RP__: so in summary I think the lock contention is actual=
ly pretty good</div><div>(1:17:43 PM) RP__: So anything else?</div><div>(1:=
17:49 PM) RP__: or onto action items</div><div>(1:17:57 PM) RP__: does anyo=
ne know if Khem sent email?</div>

<div>(1:19:04 PM) Tartarus: er</div><div>(1:19:05 PM) RP__: if someone does=
, let us know or we can ask khem next week</div><div>(1:19:06 PM) Tartarus:=
 gah</div><div>(1:19:29 PM) Jefro: I&#39;m looking, but nothing jumps out w=
ith a clearly identifiable Subject line</div>

<div>(1:19:59 PM) Tartarus: I think he only said he wasn&#39;t going to be =
able to make it</div><div>(1:20:02 PM) ***RP__ doesn&#39;t remember seeing =
anything but I only skim oe-dev</div><div>(1:20:07 PM) fray: I&#39;m here..=
 sorry for being late</div>

<div>(1:20:20 PM) RP__: fray: hi, you have the backlog I guess</div><div>(1=
:20:35 PM) RP__: fray: if there is anything you want to add, please chime i=
n</div><div>(1:20:40 PM) RP__: fray: any topics to add?</div><div>(1:20:48 =
PM) RP__: Onto status updates</div>

<div>(1:20:50 PM) RP__: elections</div><div>(1:20:57 PM) fray: no topics..<=
/div><div>(1:20:58 PM) RP__: I&#39;ve been elected</div><div>(1:21:03 PM) f=
ray: other then I&#39;ll be out again next Thursday</div><div>(1:21:16 PM) =
RP__: did we decide when the next election should be or are we leaving this=
 to the board?</div>

<div>(1:21:29 PM) RP__: fray: I&#39;m sure Jefro will note that</div><div>(=
1:21:36 PM) Jefro: yup</div><div>(1:21:40 PM) koen: leave it to the board</=
div><div>(1:21:46 PM) koen: them seem to be awake nowadays</div><div>(1:21:=
51 PM) koen: they*</div>

<div>(1:21:54 PM) fray: it should be in 2 months (I thought).. but we may n=
eed to remind them</div><div>(1:22:15 PM) RP__: ok, I think that is reasona=
ble</div><div>(1:22:31 PM) fray: that is.. the call for candidates is 2 mon=
ths after the last call for candidates..</div>

<div>(1:22:35 PM) RP__: OE-Core status then</div><div>(1:22:54 PM) RP__: Th=
ere as been quite a bit going on</div><div>(1:23:08 PM) RP__: Yocto is noti=
cing some instability atm with all the changes :/</div><div>(1:23:38 PM) Ta=
rtarus: Related, I&#39;m noticing some problems running the test classes w/=
 oe-core</div>

<div>(1:23:52 PM) Tartarus: Could just be more documentation needed</div><d=
iv>(1:23:54 PM) RP__: We&#39;re trying to fire fight the issues and we&#39;=
ll be entering a period of more stabilisation soon</div><div>(1:24:10 PM) R=
P__: I do want to ask people about stabilisation</div>

<div>(1:24:25 PM) RP__: I think having a period of stabilsation for OE-Core=
 would be a good thing</div><div>(1:24:32 PM) fray: so far I&#39;m seeing f=
ewer QA and related messages then when I went on vacation.. but there are s=
till a few</div>

<div>(1:24:34 PM) Tartarus: I think it would be reasonable to ask people to=
 say what they tested</div><div>(1:24:38 PM) Tartarus: And ask more often, =
how was this tested</div><div>(1:24:43 PM) fray: Tartarus ya, I agree..</di=
v>

<div>(1:24:58 PM) ***Tartarus is bad at this sometimes too, forgot to say h=
ow I did test the siteinfo changes</div><div>(1:25:28 PM) koen: you bribed =
the intern?</div><div>(1:25:37 PM) fray: heh</div><div>(1:26:04 PM) fray: I=
 think the siteinfo overhaul of oe-core will help reduce some of the stabil=
ity issues.. but itself might lead to a few short-term issues</div>

<div>(1:26:11 PM) RP__: One of the big changes which I&#39;ve not seen much=
 comment on yet is the arch/tune file changes</div><div>(1:26:13 PM) ***Tar=
tarus notes fray recalls what he did as an &quot;intern&quot; :)</div>
<div>
(1:26:33 PM) fray: seems like it&#39;s one of those things we need to keep =
doing for maintenance..</div><div>(1:26:39 PM) fray: Tartarus you were neve=
r a typical &quot;intern&quot;</div><div>(1:26:50 PM) Tartarus: RP__: I did=
 read the thread, looks OK to me</div>

<div>(1:27:04 PM) RP__: Tartarus: Did you look at the patches?</div><div>(1=
:27:13 PM) Tartarus: RP__: arch/tune stuff? yes.</div><div>(1:27:15 PM) fra=
y: The overall arch/tune cleanup I think is a really good idea.. I&#39;ve b=
een working on refining what RP__ sent out.. and have made progress..</div>

<div>(1:27:19 PM) RP__: Tartarus: ok, cool</div><div>(1:27:39 PM) RP__: Bot=
h fray and I are distilling this into something better</div><div>(1:27:49 P=
M) fray: the main difference is I&#39;ve moved the core arch ABI stuff to =
=A0the arch-&lt;arch&gt; files... and the tune-... files only contain speci=
fic core tunings..</div>

<div>(1:27:52 PM) RP__: Many different use cases to consider etc</div><div>=
(1:28:02 PM) fray: (in reality that only affects the arm callingconvention-=
hard...</div><div>(1:28:32 PM) RP__: Do we think the people who need to be =
aware of these changes are aware of them?</div>

<div>(1:28:38 PM) Tartarus: Does anyone recall what Fedora&#39;s arm7vhl is=
?</div><div>(1:28:47 PM) Tartarus: Is that what debian/etc calls hf?</div><=
div>(1:28:57 PM) Tartarus: armv7hl that is</div><div>(1:29:03 PM) fray: I w=
ould say we need to keep posting discussions on the mailing list.. so peopl=
e continue to be reminded..</div>

<div>(1:29:17 PM) RP__: agreed, I&#39;m just wondering if there is anything=
 else we can do</div><div>(1:29:28 PM) Tartarus: just keep talking in publi=
c</div><div>(1:29:31 PM) Tartarus: that&#39;s about all you can do</div>

<div>(1:29:32 PM) RP__: and are we confortable as the TSC with changing the=
 way these files work like this</div><div>(1:29:38 PM) Tartarus: folks join=
 in and either agree in silence or speak up</div><div>(1:29:51 PM) koen: ma=
ke a patch against oe-core instead of poky would be a start :p</div>

<div>(1:29:52 PM) RP__: I think its necessary and overdue but I just want t=
o check we are all in sync</div><div>(1:29:57 PM) Tartarus: RP__: I think t=
he overall approach looks like it&#39;ll help, so yes</div><div>(1:30:12 PM=
) RP__: koen: I explained why I did that</div>

<div>(1:30:20 PM) RP__: koen: If I merge the bitbake change it&#39;ll be ea=
sier</div><div>(1:30:26 PM) fray: koen, I&#39;m working on poky due to the =
multilib stuff right now.. but I intend to rebase on oe-core when I get it =
working.. (I&#39;m about 50% of the way there)</div>

<div>(1:30:29 PM) Tartarus: koen: I&#39;d like to put in another beg for al=
l the TSC folks to give oe-core, sans meta-oe/etc a little love at times, a=
nd yes that includes me doing more :)</div><div>(1:30:48 PM) ***fray notes =
he usually operates in oe-core exclusively</div>

<div>(1:30:55 PM) Tartarus: Maybe as a future topic we can talk about yocto=
 post 1.1 and oe-core and where we&#39;d like to see folks work &quot;first=
&quot;</div><div>(1:31:02 PM) Tartarus: But, new big topic, so lets put tha=
t off for a week</div>

<div>(1:31:05 PM) Tartarus: or ML it</div><div>(1:31:15 PM) Tartarus: I cou=
ld even try and start ML&#39;ing it now</div><div>(1:31:16 PM) RP__: Tartar=
us: well, I would like to point out that meta-yocto is *tiny*</div><div>

(1:31:18 PM) koen: Tartarus: bare oe-core doesn&#39;t have the bits I need<=
/div><div>(1:31:33 PM) RP__: deliberately to head off these kind of problem=
s</div><div>(1:31:43 PM) koen: RP__: you can make it even tinier if you put=
 atom-pc in meta-intel</div>

<div>(1:31:45 PM) Tartarus: Like I said, lets start on the ML</div><div>(1:=
32:09 PM) Tartarus: and I&#39;ll kick it off with what I mean and what I se=
e as being the first answer to what I imagine both RP and koen have as obje=
ctions</div>

<div>(1:32:14 PM) RP__: koen: yes, I know</div><div>(1:32:26 PM) Tartarus: =
So, where were we?</div><div>(1:32:32 PM) RP__: OE Core status</div><div>(1=
:32:41 PM) Tartarus: and tune stuff, covered</div><div>(1:32:44 PM) fray: B=
TW for the tunings, I think the biggest thing we need to try to get write a=
re the tune file names and architecture settings.. (sounds simple.. but it =
gets confusing quikcly)</div>

<div>(1:32:48 PM) Tartarus: siteinfo I guess covered well enough, i&#39;d j=
ust add one thing</div><div>(1:32:51 PM) fray: (ok I&#39;m done w/ the tuni=
ng) =A0:)</div><div>(1:33:03 PM) Tartarus: I&#39;m probably really going to=
 try the &quot;nuke the current ones, do world again&quot; approach</div>

<div>(1:33:10 PM) RP__: So multilib is being worked upon and I&#39;ll likel=
y start merging more pieces of it soon</div><div>(1:33:13 PM) Tartarus: The=
re&#39;s a lot of cruft in what we do have wrt unused recipes</div><div>

(1:33:19 PM) Tartarus: and wrt not meaingful now stuff</div><div>(1:33:36 P=
M) RP__: Tartarus: There is certainly some junk in them</div><div>(1:33:54 =
PM) koen: the current arm site files only work for eabi</div><div>(1:33:59 =
PM) RP__: I do want to highlight this stabilisation thing a little more cle=
arly though</div>

<div>(1:34:32 PM) RP__: I&#39;d imagine starting in mid August, we&#39;ll s=
tart to look for patches with a more stabilising viewpoint than features</d=
iv><div>(1:34:53 PM) RP__: Effectively like the kernel does</div><div>
(1:35:00 PM) RP__: It&#39;ll be the first time we&#39;ve done this, obvious=
ly</div>
<div>(1:35:22 PM) RP__: but it does mean if you&#39;re doing feature work, =
it needs to get done sooner than later or it could be a short while before =
it merges</div><div>(1:35:37 PM) RP__: At some point we will branch the rel=
ease branch and then master can open for features again</div>

<div>(1:35:45 PM) fray: koen, we only support eabi in oe-core right?</div><=
div>(1:35:47 PM) ***koen is still trying to figure out which things are bug=
s and which are design decisions in oe-core</div><div>(1:35:51 PM) fray: (b=
oth hard and softfp calling conventions)</div>

<div>(1:35:56 PM) koen: fray: you can build oabi if you wish</div><div>(1:3=
6:11 PM) fray: &quot;How&quot;?</div><div>(1:36:16 PM) RP__: koen: do you h=
ave some examples?</div><div>(1:36:40 PM) koen: RP__: patching out polkit i=
n consolekit was one</div>

<div>(1:36:49 PM) koen: gstreamer packaging the other</div><div>(1:36:59 PM=
) RP__: koen: I think that was a badly through out hack</div><div>(1:37:11 =
PM) RP__: koen: gstreamer packaging was more of a design decision</div>

<div>(1:38:00 PM) RP__: koen: splitting it into a separate .inc file is str=
aight forward to merge</div><div>(1:38:06 PM) RP__: the naming is a tricker=
 issue</div><div>(1:38:29 PM) koen: I&#39;m just naming examples, not passi=
ng judgement :)</div>

<div>(1:38:43 PM) RP__: koen: I&#39;m just putting them into the categories=
 :)</div><div>(1:38:57 PM) RP__: ok - anything else on the core?</div><div>=
(1:39:01 PM) fray: collecting these into some kind of a &quot;changes&quot;=
 document for oe -&gt; oe-core transition would be good</div>

<div>(1:39:20 PM) RP__: any issues with the above stabilisation approach?</=
div><div>(1:39:43 PM) RP__: fray: I&#39;m conscious we need to do that for =
yocto for transition between versions</div><div>(1:39:52 PM) koen: I&#39;d =
make a generic remark about doing *libc changes a bit different</div>

<div>(1:40:01 PM) koen: but we covered that in earlier meetings already</di=
v><div>(1:40:10 PM) fray: no issues, just a comment that we need a way to w=
ork with people who are developing and not stabilizing..</div><div>(1:40:25=
 PM) fray: (I doubt that will be a huge problem though -- for oe-core)</div=
>

<div>(1:40:36 PM) RP__: fray: people can work in branches for a bit</div><d=
iv>(1:40:46 PM) fray: thats fine with me</div><div>(1:40:57 PM) koen: prefe=
rably oe-core branches</div><div>(1:41:02 PM) RP__: if it becomes an issue =
there are things we can do, I&#39;d rather solve it if its a problem though=
</div>

<div>(1:41:39 PM) RP__: some natural pressure for people to thing about sta=
bilisation is probably a good thing IMO</div><div>(1:41:41 PM) koen: a few =
weeks ago there was talk about automated testing of branches</div><div>

(1:41:44 PM) RP__: worked well for the kernel for example</div><div>(1:41:4=
8 PM) koen: did beth get her hardware to do that?</div><div>(1:42:01 PM) RP=
__: hardware wise there has been a screwup :(</div><div>(1:42:25 PM) koen: =
RP__: working for a hw vendor myself, I&#39;m not suprised</div>

<div>(1:42:27 PM) RP__: I&#39;ve been assuming we&#39;d get some and for va=
rious reasons the hardware donation ended up being inappropriate :(</div><d=
iv>(1:42:54 PM) RP__: The LF is going to buy OE some hardware out of its ow=
n pocket since it made promises</div>

<div>(1:43:02 PM) RP__: but Yocto and Beth don&#39;t get anything</div><div=
>(1:43:14 PM) RP__: so we&#39;re looking at alternatives</div><div>(1:43:21=
 PM) koen: the cloud!</div><div>(1:43:28 PM) Tartarus: Can we ask how inapp=
ropriate?</div>

<div>(1:43:42 PM) RP__: Tartarus: not suitable for a datacentre</div><div>(=
1:44:25 PM) koen: anyway, back to stabilizing</div><div>(1:44:40 PM) koen: =
does oe-core have some features/guidelines?</div><div>(1:44:45 PM) koen: I =
know yocto has</div>

<div>(1:44:59 PM) koen: but does oe-core have any?</div><div>(1:45:02 PM) T=
artarus: Maybe it&#39;s time for for testing-next weekly branches again?</d=
iv><div>(1:45:06 PM) RP__: koen: guidelines for what?</div><div>(1:45:13 PM=
) koen: stabilizing, etc</div>

<div>(1:45:33 PM) koen: we&#39;re conflating yocto milestones with oe-core,=
 which isn&#39;t strictly true</div><div>(1:45:54 PM) RP__: koen: well, I&#=
39;m assuming OE-Core does want to release alongside Yocto</div><div>(1:46:=
09 PM) fray: ya.. timeline wise things seemed to line up as such</div>

<div>(1:46:25 PM) RP__: koen: if OE-Core wants to do something different, w=
e as a TSC can recommend that but I&#39;m not sure what advantage that woul=
d have?</div><div>(1:46:32 PM) koen: I&#39;m assuming that as well, but I d=
on&#39;t think I&#39;ve seen any traffic about that on the oe-core list</di=
v>

<div>(1:46:47 PM) RP__: koen: well, what I&#39;m leading too is a discussio=
n of this on the list</div><div>(1:46:54 PM) fray: last traffic I remember =
was discussion of a September release of &quot;oe&quot; based on oe-core</d=
iv>

<div>(1:46:57 PM) RP__: but I wanted to talk about it here first</div><div>=
(1:48:07 PM) RP__: So I think the AR is for me to take this onto the mailin=
g list</div><div>(1:48:21 PM) RP__: assuming the TSC is ok with the broad p=
lan</div>

<div>(1:49:04 PM) RP__: I&#39;ll take silence as approval</div><div>(1:49:0=
5 PM) fray: I am</div><div>(1:49:06 PM) RP__: Anything we want to discuss o=
n BSP/Layers?</div><div>(1:49:36 PM) RP__: and I think we already covered i=
nfrastructure above unless there is anything else we need to talk about?</d=
iv>

<div>(1:49:36 PM) Jefro: fray: can bsp guidelines be removed from this list=
, now that it is published</div><div>(1:50:05 PM) RP__: Jefro: perhaps laye=
r splitting could be replaced with meta-oe ?</div><div>(1:50:14 PM) Jefro: =
RP__ ok</div>

<div>(1:50:21 PM) RP__: and an &quot;other layers&quot; topic</div><div>(1:=
50:26 PM) fray: Jefro, not sure.. I havn&#39;t looked at any BSP stuff.. ha=
s anyone else?</div><div>(1:50:39 PM) RP__: since I think we should have a =
little focus on those specific areas</div>

<div>(1:50:54 PM) fray: ya.. meta-oe and &quot;other layers&quot; would be =
best</div><div>(1:50:58 PM) Jefro: I think it is possible that &quot;bsp gu=
idelines&quot; was actually &quot;patch guidelines&quot;, which you publish=
ed (and which i am adapting for yocto)</div>

<div>(1:51:08 PM) RP__: The question is do we have a relatively clear idea =
on how to do a BSP layer</div><div>(1:51:09 PM) Jefro: fray: will do re met=
a-oe and other layers</div><div>(1:51:13 PM) fray: I thought there were a s=
eperate guide we wanted on how to generate a BSP in a layer</div>

<div>(1:51:16 PM) RP__: I think at this point we do</div><div>(1:51:27 PM) =
Tartarus: Well, we need some sort of &quot;start a BSP layer&quot; type gui=
delines</div><div>(1:51:34 PM) Jefro: I can just add that as a separate sta=
tus topic</div>

<div>(1:51:43 PM) RP__: Tartarus: did the yocto stuff cover that or not?</d=
iv><div>(1:52:09 PM) Tartarus: I don&#39;t know for sure atm, but let me po=
se a &quot;hypothetical&quot;</div><div>(1:52:25 PM) Tartarus: Freescale wa=
nts to put up support for say P2020DS</div>

<div>(1:52:31 PM) Tartarus: normal 32bit platform</div><div>(1:52:36 PM) Ta=
rtarus: Where&#39;s their layer go?</div><div>(1:52:45 PM) RP__: Tartarus: =
depends who is maintaining it really</div><div>(1:52:56 PM) RP__: Tartarus:=
 and where they want it...</div>

<div>(1:52:58 PM) Tartarus: Freescale is author</div><div>(1:53:02 PM) Tart=
arus: What are the choices?</div><div>(1:53:15 PM) koen: github, <a href=3D=
"http://freescale.com" target=3D"_blank">freescale.com</a></div><div>(1:53:=
35 PM) RP__: Tartarus: They put it up somewhere at freescale, it goes somew=
here at Mentor, github, <a href=3D"http://git.oe.org" target=3D"_blank">git=
.oe.org</a> or <a href=3D"http://git.yp.org" target=3D"_blank">git.yp.org</=
a></div>

<div>(1:53:39 PM) Tartarus: Is there a <a href=3D"http://openembedded.org" =
target=3D"_blank">openembedded.org</a> or <a href=3D"http://yoctoproject.or=
g" target=3D"_blank">yoctoproject.org</a> option?</div><div>(1:53:57 PM) RP=
__: Tartarus: yp would happily take it, I can say that for sure</div>

<div>(1:53:59 PM) koen: aiui the board is still against hosting layers on <=
a href=3D"http://oe.org" target=3D"_blank">oe.org</a></div><div>(1:54:14 PM=
) fray: Tartarus the <a href=3D"http://yp.org" target=3D"_blank">yp.org</a>=
 is expected.. =A0<a href=3D"http://oe.org" target=3D"_blank">oe.org</a> is=
 no because of resources.. right?</div>

<div>(1:54:16 PM) koen: not sure how that micro layer weaseled itself onto =
<a href=3D"http://oe.org" target=3D"_blank">oe.org</a>, but it&#39;s there<=
/div><div>(1:54:18 PM) Tartarus: OK, and are these choices posted?</div><di=
v>
(1:54:28 PM) RP__: koen: I can understand the concern there wrt cost of ban=
dwidth etc</div>
<div>(1:54:44 PM) RP__: and server admin</div><div>(1:55:04 PM) RP__: Tarta=
rus: I guess not clearly and we should do that. Where is the correct place =
to &quot;post&quot; them?</div><div>(1:55:08 PM) koen: I understand their c=
oncern</div>

<div>(1:55:19 PM) Tartarus: RP__: wiki?</div><div>(1:55:27 PM) RP__: Tartar=
us: Yocto? OE?</div><div>(1:55:28 PM) koen: I&#39;m just saying that if bw =
and admin is an issue, how did that micro layer get there?</div><div>(1:55:=
39 PM) RP__: koen: micro layer?</div>

<div>(1:55:40 PM) Tartarus: Both?</div><div>(1:55:49 PM) Tartarus: Or at le=
ast a basics on OE</div><div>(1:56:01 PM) RP__: Jefro: Fancy adding somethi=
ng to the wikis about this? ;-)</div><div>(1:56:01 PM) Tartarus: and a &quo=
t;or send XXX@LF.org your info&quot; for yocto wiki</div>

<div>(1:56:10 PM) Jefro: I can take action item to work this out with RP an=
d add to the appropriate wiki</div><div>(1:56:10 PM) Tartarus: since it&#39=
;s clear how to self host or use github</div><div>(1:56:19 PM) Tartarus: Bu=
t if someone wants a yocto hosting, that&#39;s a yocto wiki topic</div>

<div>(1:56:24 PM) RP__: Jefro: sounds like a plan</div><div>(1:56:25 PM) Je=
fro: there may be minor differences between the yocto version and the oe ve=
rsion</div><div>(1:56:59 PM) RP__: Tartarus: I&#39;m very open to people ha=
ving layers on <a href=3D"http://git.yp.org" target=3D"_blank">git.yp.org</=
a></div>

<div>(1:57:05 PM) Tartarus: RP__: k</div><div>(1:57:15 PM) Tartarus: But my=
 only point is who needs to be asked to set things up</div><div>(1:57:20 PM=
) Tartarus: Presumably you have a full inbox already :)</div><div>(1:57:29 =
PM) Tartarus: And would be asking someone else to do the details anyhow</di=
v>

<div>(1:57:30 PM) RP__: Tartarus: keeper of repos is Beth</div><div>(1:57:3=
4 PM) Tartarus: Bingo</div><div>(1:57:53 PM) RP__: so its me+Beth, I ack, s=
he sets it up</div><div>(1:58:05 PM) Tartarus: Info for the yocto wiki page=
 on this topic :)</div>

<div>(1:58:25 PM) ***RP__ is hoping Jefro is taking notes :)</div><div>(1:5=
8:29 PM) Jefro: :) yes</div><div>(1:58:32 PM) Jefro: *** 2 minute warning *=
**</div><div>(1:58:41 PM) RP__: Yes, nearly time</div><div>(1:58:43 PM) koe=
n: RP__: <a href=3D"http://cgit.openembedded.org/cgit.cgi/meta-micro/" targ=
et=3D"_blank">http://cgit.openembedded.org/cgit.cgi/meta-micro/</a></div>

<div>(1:58:45 PM) RP__: Any other business?</div><div>(1:59:10 PM) RP__: ko=
en: I don&#39;t think the board said no layers</div><div>(1:59:17 PM) Tarta=
rus: As a small note, I hope to throw a matrix of world builds of oe-core a=
t machines over the weekend</div>

<div>(1:59:24 PM) Tartarus: We&#39;ll see how much git submodule hates me o=
f course</div><div>(1:59:32 PM) RP__: koen: I think the idea was big commer=
cial interests would just have better ways to do it like their own websites=
 or YP</div>

<div>(1:59:32 PM) Tartarus: and if 100GB will be enough space, I hope so th=
o</div><div>(1:59:56 PM) RP__: Tartarus: I have noticed OE-Core seems very =
space hungry :/</div><div>(2:00:06 PM) RP__: Tartarus: with or without rm_w=
ork?</div>

<div>(2:00:18 PM) Tartarus: RP__: Depends on what I remember in time before=
 pushing the button</div><div>(2:00:34 PM) RP__: Tartarus: ok, just curious=
 who uses it really</div><div>(2:00:36 PM) Tartarus: I&#39;d probably throw=
 in rm_work in hopes it works, since, bah, crap, some boxes are on 50GB sti=
ll</div>

<div>(2:01:10 PM) RP__: Tartarus: 25GB per machine for world I think</div><=
div>(2:01:15 PM) RP__: without rm_work</div><div>(2:01:30 PM) Tartarus: k</=
div><div>(2:01:51 PM) ***koen is on a ~50gb ssd partition</div><div>(2:02:1=
7 PM) koen: if you use that for tmp/ you can barely build one machines at p=
eak useage</div>

<div>(2:02:25 PM) RP__: and on that note I think we&#39;re done roughly on =
time :)</div></div><div><br></div></div>-- <br>Jeff Osier-Mixon <a href=3D"=
http://jefro.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>Yoct=
o Project Community Manager @Intel <a href=3D"http://yoctoproject.org" targ=
et=3D"_blank">http://yoctoproject.org</a></div>
<br>

--90e6ba1efb206ca27a04a81fe6c4--
