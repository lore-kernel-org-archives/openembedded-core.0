Return-Path: <jefro.net@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0DAE760990;
	Tue, 27 Aug 2013 01:05:04 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so2960857lab.34
	for <multiple recipients>; Mon, 26 Aug 2013 18:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=z/25Xjovrt+lIsAkpyzoS42sht19wxa/jspZoBtIfc4=;
	b=khMIRxs7LqeMea77wOE2rBdZ8RtxHODjcG1g54RcVRYA9zWT47DJyO6gHQ65UPzCOR
	95y/s1S2Ke64rBTZ3yu81VSfYQM7fSYn2zmDlJVe0VdZ5OQSIGW5fZxvmyCccHEz6Zat
	/o8CpuHmbNdhyLMvlhE3oIFAQ67B4BUEuVduZK2wsvyiQHm2575p4ys+pS6xoqgQj5zv
	whCFh6DRv0dmUpbhTif85K8ZLgf3j2F3pw7gAipiJBIGOdK1ee51FfpaEtJ07MLyKKYe
	Ke0DfCNVPjIYdcHHIe74J5FYh7Qudb63WsYDqnrFH+ialxX9KARxNV8mLPxZbN0VrMNr
	40cg==
X-Received: by 10.152.120.73 with SMTP id la9mr16112767lab.3.1377565504889;
	Mon, 26 Aug 2013 18:05:04 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.57.105 with HTTP; Mon, 26 Aug 2013 18:04:44 -0700 (PDT)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Mon, 26 Aug 2013 18:04:44 -0700
X-Google-Sender-Auth: XA6BFcVrz4lBXXdyd5CzYl1sxWE
Message-ID: <CA+YB3rYu7zo0QDphEA6SSCAZKc1CGy5nNKxo7V2KX-A-W4rV4A@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OpenEmbedded TSC Minutes: 2 July 2013
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2013 01:05:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

[these are all late because I am lame]

OpenEmbedded Technical Steering Committee
2 July 2013

Attendees:
  Koen (koen)
  Fray (fray)
  Paul (bluelightning)
  Khem (khem)
  Richard (RP)
Apologies:

Notes: Jefro

Agenda at a glance:

1. pick a chair
2. new issues
3. lingering issues
    a. role of the TSC
    b. eglibc
4. projects in progress - status
    a. oe-core release
    b. meta-oe appends/overlayed recipes RFC
    c. python 3
    d. release status notification
5. infrastructure
    a. oe.org flooded
6. projects deferred
    a. raise awareness of "janitor" list, QA "bugs"
    b. document whitespace changes to the shell
    c. raise ntp with the Yocto Project [RP]

________________________________________________________________
Agenda & Results

1. pick a chair
    fray

___________________________________
2. new issues

___________________________________
3. lingering issues

a. role of the TSC
review discussion on mailing list - small response on list
elections deferred
=> community meeting discussed end of july/beginning of august
need proposed agenda on 7/16
date: 7/30 or 8/13, or week between

b. eglibc
->    poll users to see if actually being used
    alternatively, find someone willing to maintain
    khem proposes replacing option groups with pure kconfig
=>    raise eglibc issues on mailing list (fray)
=>    get kconfig stuff discussed and proposed to glibc (khem)

___________________________________
4. projects in progress - status

a. oe-core release
    current phase: M2
ICE on e500 fixed, fsl-arm has a workaround

b. meta-oe appends/overlayed recipes RFC
    still remaining: busybox and gst-ffmpeg bbappends, xserver-nodm-init
=>  PRINC: issue warning now, error in 1.5, revisit before release (RP)
=>    document PRINC - PR server migration steps (fray)
=>    proposal: error and a disable flag, revise RFC patch (fray)
    RFC switching wholeheartedly to libav (bluelightning) sent, a few responses
-> pinged kergoth, no response yet
->    two bbappends left: gst-ffmpeg (bluelightning) and busybox (khem)
    also tslib (overlay), bluelightning pinging kergoth

c. python 3
->  currently tackling 2.7.3 first
    probably 2.7.3 in 1.5, move to python 3 in 1.6

d. release status notification
=>    maintain a wiki page to summarize release goals (jefro)
-> still not done, bluelightning offered to help

___________________________________
5. infrastructure

a. oe.org flooded
    investigation underway
Michael recommends Tom's approach, pushing users to mirrors
 invisibly enabling only actual committers to bang on master
 kernel.org follows this approach

b. patchwork spam - lots of new accounts
khem working on it

___________________________________
6. projects deferred

a. raise awareness of "janitor" list, QA "bugs"
    defer to after 1.4

b. document whitespace changes to the shell
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> still need to de-dup these, need a volunteer
    ask for volunteers after 1.4 (jefro)

c. raise ntp with the Yocto Project [RP]
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial
    no default set after Paul's changes
    RP raised with YP AB
=> going to mailing lists & someone should write a proposal
=> fray will send to list after 1.4


________________________________________________________________
Raw Transcript

(8:59:00 AM) mode (+v Jefro) by ChanServ
(8:59:11 AM) bluelightning: hi koen
(8:59:17 AM) Jefro: good morning all - I should have an agenda in a few minutes
(8:59:48 AM) bluelightning: hi Jefro
(8:59:52 AM) fray: I can't remember is quorum 3 or 4?
(8:59:56 AM) bluelightning: hi fray
(9:00:13 AM) bluelightning: not sure I have to admit
(9:00:37 AM) fray: I THINK it's three..
(9:00:42 AM) Jefro: quorum = 3 in a group of 5
(9:00:44 AM) fray: since that is a majority..
(9:00:58 AM) Jefro: it was 4 when there were 6 members
(9:01:03 AM) fray: ok
(9:01:04 AM) bluelightning: ok
(9:01:12 AM) bluelightning: is khem expected today?
(9:01:55 AM) fray: not usre
(9:02:44 AM) bluelightning: let's wait a couple more minutes just in case
(9:02:48 AM) fray: ok
(9:05:25 AM) Jefro: Thanks for patience - agenda is at
http://pastebin.com/RNhF3yGL
(9:06:41 AM) Jefro: Khem will be a little bit late
(9:07:17 AM) fray: ok
(9:07:58 AM) bluelightning: ok, let's get started then
(9:08:17 AM) Jefro: chair?
(9:08:39 AM) fray: I'm willing to
(9:08:54 AM) bluelightning: go ahead :)
(9:09:10 AM) fray: ok then...
(9:09:11 AM) fray: new issues?
(9:09:34 AM) bluelightning: nothing here I don't think
(9:09:48 AM) bluelightning: well, other than patchwork accounts
(9:10:06 AM) fray: ok then
(9:10:18 AM) fray: lets go to the 3a role of the TSC... there was a
bit of discussion on the list...
(9:10:31 AM) fray: but I didn't see anyone that was overly involved in
the discussion and pushing it to any one answer..
(9:10:48 AM) bluelightning: no, it was kind of quiet
(9:11:02 AM) bluelightning: I think it's just being left up to us to decide
(9:11:09 AM) Jefro: I'm just now reading Philip's thoughtful response
- it seems to me that a lot of what he describes is community
management, i.e. non-technical.
(9:11:20 AM) fray: so my current opinion is we should likely do what
we talked about in the past.  Start a regular contributor meeting on
IRC.. and reduce the role of the TSC to the decision making and
technical issues "as-needed".  i.e. keep bi-weekly meetings scheduled,
but only hold them when we have something to talk about
(9:11:37 AM) fray: Jefro, ya I got the same impression..
(9:11:47 AM) bluelightning: seems like it's worth giving it a try at
the very least
(9:11:55 AM) fray: and at this point I think a once a month community
meeting is probably the best place to start..
(9:12:30 AM) Jefro: Also - this could be a "standing meeting" also, 10
minutes instead of 60, just to decide policy and assign a maintainer
to each issue
(9:12:54 AM) fray: my only concern with the comunity meeting is that
we have enough topics to get started.. janitorial tasks.. status
things htat people will hopefully find useful.. as well as let the
community start to drive it forward
(9:13:07 AM) fray: Jefro, ya
(9:13:52 AM) fray: so does everyone agree this should be the next step
(plan for a community meeting)  say end of july/beginning of august?
(9:16:03 AM) ***Jefro hears crickets
(9:16:03 AM) bluelightning: seems OK to me
(9:16:07 AM) bluelightning: koen: ?
(9:16:21 AM) koen: I agree
(9:17:44 AM) fray: ok.. lets plan to take this to the list and figure
out what we should do..
(9:17:56 AM) fray: ok.. 3b -- eglibc?
(9:18:47 AM) bluelightning: there wasn't a massive response
(9:18:54 AM) fray: I mean to the tsc list
(9:19:10 AM) fray: I think we'll be better planning this over the list
and figure out topics
(9:19:13 AM) bluelightning: I meant about 3b
(9:19:16 AM) bluelightning: :)
(9:19:18 AM) fray: ahh ok.. :)
(9:19:45 AM) fray: is this the option groups thing?  I didn't even see
a response other then someone didn't think it was used that much
(9:19:51 AM) bluelightning: I did try to attract Darren's attention
since it will likely affect poky-tiny, he hasn't replied
(9:19:53 AM) bluelightning: yeah
(9:20:31 AM) fray: ok..  I suggest we leave it on the list then for
another meeting or two.. and if nothing changes we can drop it
(9:20:32 AM) bluelightning: I guess khem might have something to say
about this when he arrives
(9:20:41 AM) bluelightning: sure, sounds reasonable
(9:20:50 AM) fray: ya.. as far as that goes, Khem has an action to
help sync up the stuff from the eglibc mailing list..
(9:21:03 AM) fray: ok then..  4a -- oe-core release status
(9:21:12 AM) Jefro: khem ETA 15 mins
(9:21:20 AM) fray: ok.. we can come back to the eglibc htne
(9:21:24 AM) bluelightning: ok
(9:22:04 AM) fray: M2 just ended and final builds and QA are going to
be starting soon..
(9:22:07 AM) fray: anything else?
(9:22:10 AM) bluelightning: re 4a - we've got a few issues in master
atm; Saul just pulled together a consolidated pull containing a number
of fixes
(9:23:00 AM) bluelightning: we're still seeing ICEs with some BSPs
(9:23:14 AM) fray: More then just e500?  I thoguth Khem posted a patch for that
(9:23:17 AM) bluelightning: I think there may be a plan on how to fix
those but I'm not following it closely
(9:23:49 AM) bluelightning: fsl-arm also
(9:24:00 AM) fray: didn't realize there were still ARM issues
(9:25:34 AM) bluelightning: I think khem is recommending disabling
neon for perf with older kernels such as the one in that bsp (from the
thread on the ML)
(9:25:45 AM) fray: ok
(9:25:48 AM) bluelightning: so I think that is being taken care of
(9:26:15 AM) fray: lets keep watching it.. I know I have a vested
interest in e500, and newer glibc 2.18?
(9:26:34 AM) bluelightning: I think that's it for status
(9:26:45 AM) fray: ok.  4b -- meta-oe status..
(9:26:56 AM) fray: the PRINC patch and stuff kind of died on the vine..
(9:27:02 AM) bluelightning: no movement on any of this I think
(9:27:12 AM) bluelightning: I did ping kergoth again, no reply
(9:27:16 AM) fray: ok
(9:27:21 AM) bluelightning: I imagine tslib is not high on his list
these days :)
(9:27:46 AM) koen: so what's the problem exactly with using _git and a
fixed SRCREV?
(9:28:20 AM) bluelightning: koen: it's not especially bad, it's just
that if that is stable and has been used for long enough now there
should just be a stable release
(9:28:47 AM) koen: I get that
(9:28:50 AM) bluelightning: to be honest I hadn't expected that to be
a big thing to ask...
(9:29:16 AM) koen: but if kergoth doesn't do that we can just make a
recipe for _git with a fixed srcrev
(9:29:24 AM) koen: if kergoth objects, he can spin a release
(9:29:31 AM) bluelightning: yep, if it drags out much longer that's
probably the easiest course
(9:29:56 AM) koen: the sooner we can update the recipe, the more time
we have to fix bugs :)
(9:30:12 AM) fray: ok
(9:31:15 AM) bluelightning: I'd really like it if someone would sort
out the busybox recipe...
(9:31:18 AM) fray: ok.. then 4c --  I think we're going to release 1.5
w/ 2.7.3 and it seems t be working..
(9:31:26 AM) bluelightning: (since khem seems to be occupied)
(9:32:05 AM) bluelightning: yep I think we're on target with 4c
(9:32:45 AM) fray: ok  4d -- wiki page summary
(9:33:36 AM) ***fray looks over at jefro.. ;)
(9:34:02 AM) ***bluelightning wonders if this would also help with
providing a roadmap that some folks have been asking for
(9:34:08 AM) ***Jefro looks the other way
(9:34:33 AM) ***bluelightning notes there is nobody behind jefro :)
(9:34:48 AM) fray: :)
(9:35:11 AM) Jefro: I haven't done this yet, but really need to. Does
anyone have a few minutes this week to go over the main release issues
& make sure I don't miss things?
(9:35:26 AM) ***fray unfortunately does not (this week)
(9:35:27 AM) bluelightning: Jefro: sure, I can help
(9:35:41 AM) fray: ok..  5a then git mirror approach
(9:35:41 AM) Jefro: bluelightning fantastic, thanks - I'll try to work
up a draft before Thurs
(9:35:48 AM) bluelightning: Jefro: cool
(9:35:57 AM) fray: I think the idea of a private repo for committers..
and mirrors for consumers..
(9:36:17 AM) bluelightning: if it's transparent it would seem like a
perfect solution
(9:36:25 AM) fray: I think - I -like-
(9:36:40 AM) Jefro: the kernel.org setup is invisible to users
(9:36:49 AM) fray: ya...  the only real issue then is syncing the git mirrors...
(9:37:05 AM) fray: but there are a number of solutions out there
between regular cron-jobs and push processes that can be implemented
for that
(9:38:01 AM) fray: so what, if anything is our next step to push
forward on that?  just endorse it and see if Michael/Tom or others can
implement it
(9:38:57 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:38:57 AM) mode (+v khem) by ChanServ
(9:38:58 AM) bluelightning: I guess so
(9:39:04 AM) bluelightning: hi khem
(9:39:06 AM) Jefro: hi khem - agenda is at http://pastebin.com/RNhF3yGL
(9:39:07 AM) khem: Hi All
(9:39:08 AM) fray: hey khem..
(9:39:18 AM) bluelightning: FYI, Michael is likely to be busy over the
next few weeks with Beth out
(9:39:25 AM) ***fray goes back to 3b -- eglibc
(9:39:44 AM) Jefro: (does khem have any new issues?)
(9:39:47 AM) fray: what we talked about briefly was that we got little
response to the email I sent out to raise the issue on the oe mailing
list(s)
(9:39:50 AM) fray: good point
(9:40:03 AM) khem: on 3b, I have agreed to maintain in in eglibc and
eventually in glibc
(9:41:10 AM) fray: anything further to add there? otherwise I think it's in hand
(9:41:22 AM) bluelightning: khem: thanks! :)
(9:42:14 AM) khem: no, I have to now cleanup and submit the patches for 2.19
(9:42:23 AM) fray: the next item 4a -- oe-core release  we mentioned
there are still some ICE and other issues on e500 and fsl-arm?
Everything currently in hand for that work?
(9:42:43 AM) fray: Also is the upgrade to eglibc 2.18 going to happen
sometime soon?
(9:42:57 AM) khem: ICE on e500 is fixed
(9:43:06 AM) fray: excellent
(9:43:16 AM) khem: ICE on fsl-arm is workarounded
(9:43:23 AM) khem: they are not core issues though
(9:43:31 AM) fray: ok
(9:43:38 AM) bluelightning: less red on the yp ab = good though :)
(9:43:43 AM) fray: :)
(9:44:07 AM) ***fray backs up to 3a..
(9:44:25 AM) khem: well, YP is one of many Autobuilders building OE
and some dont care for the above ICEs so they are happy
(9:44:46 AM) khem: they had different issues with gc 4.8
(9:44:56 AM) fray: We mentioned we are going to go ahead with the plan
for an open community meeting, and likely start to reduce the TSC
meetings...
(9:45:04 AM) khem: e.g. beaglebone wouldnt boot. but i have fixed those too
(9:46:42 AM) khem: do we have a structure and schedule in mind for IRC forum
(9:47:20 AM) fray: I suggested taking this to the oe-tsc list for
discussion and planning with a goal of end of July/beginning of August
for the first IRC meeting..
(9:47:39 AM) fray: which segways me into 6 -- projectes deferred.. I'd
recommend these items be on that first community agenda..
(9:48:15 AM) fray: request for 'janitor' help, volunteer for the wiki
whitespace changes, and raise the issue with the community about the
LICENSE_FLAG for non-commercial
(9:48:44 AM) Jefro: TSC will meet once again before end of July. I
suggest an agenda planning session.
(9:48:55 AM) fray: I would agree that's a good idea..
(9:49:19 AM) fray: July 16th -- we should have a proposed agenda
figured out by then.. and discuss it at that time..
(9:49:51 AM) fray: make either July 30th the TSC/community meeting
(our regular scheduled time) or Aug 13th.. or the week between
(9:52:25 AM) fray: we can finalize that stuff on the TSC list as well
as the next meetings..
(9:52:35 AM) fray: otherwise the only remaining item was the patchwork
accoutns item..
(9:56:07 AM) khem: OK that seems good timeline
(9:56:24 AM) khem: patchwork accounts yes
(9:56:36 AM) khem: pw is unable to curn spam
(9:56:52 AM) khem: so I will propose th shutdown automatic
registration competely
(9:57:01 AM) khem: and add accounts on demand
(9:57:08 AM) ***fray has no objection tot hat
(9:57:22 AM) khem: we have 150 odd accounts and 1000+ get created as spam
(9:57:34 AM) khem: in 2 weeks
(9:57:53 AM) khem: new genuine accounts per months are somewhere from 2-5
(9:58:02 AM) fray: yuck
(9:58:15 AM) khem: this is my AI
(9:58:23 AM) khem: to document the process to get account on PW
(9:58:36 AM) fray: ok..
(9:58:36 AM) Jefro: spam has gotten very bad in all sectors over the
last few weeks
(9:58:37 AM) khem: and then shutdown the automatic registration process
(9:59:10 AM) khem: I plan to send am email about the plan
(9:59:14 AM) khem: before hand
(9:59:35 AM) bluelightning: btw, adding captcha would be pretty easy
(9:59:40 AM) bluelightning: given it's a django app
(10:00:10 AM) khem: person who I was talking to said that he added a
captcha and it did not help completlely
(10:00:26 AM) khem: but then he maintains kernel subsystem patchwork
(10:00:37 AM) khem: so it might be pounded more than ours
(10:00:53 AM) khem: but I will look into that
(10:01:03 AM) khem: a good suggestion bluelightning
(10:01:22 AM) Jefro: fyi I am setting aside some time next Monday to
help with OE community management issues, and can help debug khem's
patchwork instructions, create the wiki page I was supposed to do a
month ago, etc.
(10:01:38 AM) fray: it's end of meeting time.. anything further?
(10:01:43 AM) bluelightning: nothing here
(10:01:58 AM) bluelightning: thanks fray, all
(10:02:12 AM) fray: thank you to..  later!
(10:05:03 AM) koen left the room.

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

