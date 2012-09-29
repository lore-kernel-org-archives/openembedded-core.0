Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1THlhu-0004RD-TC; Sat, 29 Sep 2012 03:19:03 +0200
Received: by iebc13 with SMTP id c13so8827644ieb.6
	for <multiple recipients>; Fri, 28 Sep 2012 18:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=RSRRp4GlStWG50zLmHzEOQJtlTFauJaRMoLVU//rsSE=;
	b=Qmh+Xj3Qmorprl1e4PM7PitsfGvbI9dHpCu/d/e5k7Kuj7KqIeInEBA8O2aa+nyulh
	mOBjk5gkYWejZ7GsBOxmaxuG6SD0d+wEVwXHnG802XwB5GsERwLIbpcY/N50HTQrrZIE
	6YN9ndgnJQtUUMI0hRV2Z4s2Gtx/SM9GCJLlSRCG/bDKU1x9yRsb/a/6ubwX2Xq8OydD
	SIt/oeeVlM0MVdbLB+7QWoxWUmKTlFk6XMDwV6lPsro7tLZliSPU+euJgvWXRkTZcdLK
	wq5faVIevDK5AS0VSmdVeJVnpSsJXHvYqkgpGVFIa3sQyGwabVGRJabVIjm5laLh/lka
	qIIA==
MIME-Version: 1.0
Received: by 10.50.189.200 with SMTP id gk8mr291500igc.65.1348880768523; Fri,
	28 Sep 2012 18:06:08 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.147.37 with HTTP; Fri, 28 Sep 2012 18:06:08 -0700 (PDT)
Date: Fri, 28 Sep 2012 18:06:08 -0700
X-Google-Sender-Auth: R_0mznXiGAIXeK1Z2idlXcp46kM
Message-ID: <CA+YB3rbprm-bqndz0c_VPxvxMzqeaO+QqiUq86Q+Z97ACj8_oQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES OE-TSC 11 September 2012
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Sep 2012 01:19:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
11 September, 2012

Attending:
  Richard Purdie (RP)
  Mark Hatle (fray)
  Koen Kooi (koen)
  Paul Eggleton (bluelightning)
  Khem Raj (khem)
________________________________________________________________
Agenda & Results

1. pick a chair - RP

2. lingering issues

  ALL: could use some documentation

 a. raise awareness of "janitor" list, QA "bugs"

 b. discuss communication with OE community about release-oriented phases
   RP to send email about feature freeze
   release date planned for "around ELCE", e.g. mid-October

 c. pre/post install scripting (fray)
   fray talked to Laurentiu, he is working on gtk icon cache first
     & optimizing for first boot

 d. systemd
     => discuss on mailing list (all)

 e. PR bumps
     => koen to investigate server & report back
     => bluelightning to test on autobuilder infrastructure
     => bluelightning to document setup steps on wiki
 PR stuff will go to the list
 ran out of time this cycle, will address in next

 f. <removed>

 g. meta-networking

 h. whitespace changes to the shell (Martin)
    ref: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html
    -> Reluctant conclusion: tabs for shell, 4 spaces for python.
    => Need to ensure well documented & then remove

 i. bitbake UI (knotty) changes
    knotty2 now default
    => Need to ensure well documented & then remove
    well liked - RP wants to plan for v3, add interaction with user in 1.4

3. new issues

 a. TSC members at ELCE
     fray, RP, koen, bluelightning, khem
         => Jefro to help plan physical meeting (Italian restaurant nearby)

4. status

a. Separation of / and /usr
    evaluate patches individually case by case, open to reevaluation if needed

b. <removed>

c. oe-core release
     there will be discussion on the list about release process
     => RP to send email

d. infrastructure
     mailing list issue (koen) - board is coping with it, keep on
     agenda -  needs addressing urgently along with control of the other
     mailing lists + related infrastructure
      -> Jefro has volunteered to help with oe-members
      Khem requests mailman archives text-only display, will talk to
Phil/Florian

________________________________________________________________
Raw Transcript:

(9:01:10 AM) Jefro: morning all - new issues while we wait for khem?
last week on 2 issues discussed, nativesdk and task rework
(9:01:43 AM) fray: sorry I couldn't make it last time.. I was on a plane
(9:01:46 AM) RP: I'm not aware of pressing things to discuss this week
(9:01:47 AM) bluelightning: I'm sure khem promised to raise something
but I don't remember what it was :(
(9:02:10 AM) fray: oe-core folks wanted us to talk / /usr split..
(9:02:17 AM) bluelightning: oh yeah that was it
(9:02:37 AM) Jefro: RP manythings on the "lingering issues" list,
maybe we can get some of those discussed
(9:03:17 AM) RP: Well, we've talked about the / /usr thing several
times. I don't know anything has changed
(9:03:57 AM) fray: I'm still of the opinion, we keep doing it for the
time being.... but there are issues we need to watch and be ware of..
(9:04:26 AM) koen: make it a DISTRO_FEATURE
(9:04:34 AM) koen: and turn off that ghastly QA "check"
(9:04:38 AM) RP: fray: right. As we deal with some of the newer
technology we can reevaluate as needed
(9:04:46 AM) RP: koen: you can turn off the QA check right now
(9:05:03 AM) fray: The one thing I would like to explore (furture
work) is creating a small "boot" system to do the module loading/init
work, and then maybe in the end the requirement I've seen is no longer
needed?
(9:05:06 AM) Jefro: Agenda at http://pastebin.com/Rb9gaAHd  (/ /usr
split is Status, 4a)
(9:05:27 AM) RP: koen:
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta-yocto/conf/distro/poky.conf
line 96 - remove those
(9:06:26 AM) RP: So pick a chair? although I'm already listed? :)
(9:06:36 AM) koen: meta/classes/insane.bbclass:WARN_QA ?= "ldflags
useless-rpaths rpaths unsafe-references-in-binaries
unsafe-references-in-scripts staticdev"
(9:06:39 AM) koen: meta/classes/insane.bbclass:ERROR_QA ?= "dev-so
debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
(9:06:47 AM) koen: it's actually set in the class for a non-poky build
(9:06:55 AM) RP: koen: those are defaults
(9:07:04 AM) RP: koen: poky changes several into errors
(9:07:16 AM) RP: koen: I don't dare do it by default since it will
probably break meta-oe
(9:08:02 AM) Jefro: RP sorry.. still pasted in from before :)
(9:08:19 AM) fray: ha
(9:08:21 AM) RP: well, since nobody else is jumping, I can do it
(9:09:02 AM) RP: on the lingering issues subjects, does anyone have
anything to add?
(9:09:19 AM) RP: Have we made it clear about the 1.3 release schedule
and feature freeze?
(9:09:34 AM) koen: was there a mail sent to oe-core and oe-devel
(9:09:35 AM) RP: I do try and talk about it at appropriate times...
(9:09:37 AM) koen: (I missed it)
(9:09:44 AM) RP: koen: probably not explicitly :/
(9:10:06 AM) fray: one item
(9:10:20 AM) Jefro: question from peanut gallery - is the release
schedule up on the OE wiki? or is it only noted in the ml?
(9:10:22 AM) fray: 1c -- I was talking to someone about that this morning..
(9:10:43 AM) RP: I will send out an email about feature freeze
(9:10:45 AM) bluelightning: Jefro: I doubt it, the OE wiki is very
very out of date in most respects
(9:10:45 AM) fray: Laurentiu Placu...
(9:10:52 AM) koen: RP: I'm completely unclear about it, besides
"release around ELC-E"
(9:10:57 AM) fray: so there is some work on that item being done..
we'll see how much
(9:11:01 AM) koen: but then again, I haven't been paying a lot of attention
(9:11:31 AM) fray: I think that is still the expected "release data"
-- around ELC-E
(9:11:38 AM) koen: I did read a glimps of the freeze in that
meta-yocto-is-named-ironically thread :)
(9:13:02 AM) RP: We're aiming for mid October for the release
(9:13:12 AM) RP: giving people some time to sort out things for ELC-E after it
(9:13:30 AM) RP: Anyhow, I will send out an email and remind Song he
was meant to do this
(9:13:54 AM) fray: speaking of ELC-E.. how many of the TSC folks will
be there.. (it's looking like I will be, but still havn't gotten
approval yet)
(9:13:55 AM) RP: fray: anything specific you want to mention?
(9:14:18 AM) RP: fray: I happen to know he is looking at postinstall
stuff and optimising it for some of the problematic uses
(9:14:30 AM) koen: I'll be in BCN from sat - fri
(9:14:35 AM) fray: Just that the first work Laurentiu is looking at is
the gtk icon cache stuff..  and sounds like he's going to be moving
out from there -- with a look at optimizing first boot (and trying to
see if we can do move on the host)
(9:15:15 AM) RP: fray: right, good optimisations and a good place to
start with this stuff IMO
(9:15:24 AM) fray: yes..
(9:15:45 AM) RP: For 2e, it sounds like Koen has experimented with the
PR bumps and found an issue which he'll report
(9:15:47 AM) bluelightning: all things going to plan I will be at
ELC-E from sun->fri I think
(9:16:14 AM) Jefro: khem will also be at ELCE
(9:16:21 AM) fray: most likely it'll be sun/mon -> fri for me..
(9:16:50 AM) ***RP should be there but I don't have confirmed travel
yet as I can't figure out exactly who to book it with :/
(9:16:54 AM) fray: if we have a quorum.. we should do an in-person
meeting (if for no other reason but a social hi)
(9:17:28 AM) bluelightning: sounds good
(9:17:35 AM) RP: It would seem appropriate
(9:17:36 AM) fray: with the member meeting, is there anything we need
to officially report?
(9:17:38 AM) Jefro: looks like everyone plans to be there. 11/4 is the
standard meeting day.
(9:17:48 AM) koen: there's a real italian restaurant nearby :)
(9:17:57 AM) ***fray gets hungry
(9:18:01 AM) bluelightning: koen: is that the tradition? :)
(9:18:20 AM) RP: koen: I appreciate the planning :)
(9:18:48 AM) Jefro: let me know if I can help with reservations etc.
(and if I don't make it, someone please take notes!)
(9:19:14 AM) RP: Jefro: Help with that would be much appreciated
(9:20:02 AM) fray: ok.. sorry to interrupt.. where were we?
(9:20:54 AM) koen: around 2e iirc
(9:21:35 AM) fray: so the PR stuff.. will that go to the list or here or?
(9:21:48 AM) koen: to the list I guess
(9:22:08 AM) koen: 2f - i seems old
(9:22:10 AM) fray: thats... I care a lot about that change.. and want
to make sure if / when we do it.. it works right
(9:22:24 AM) fray: ya.. I think that can be dropped.. we're now past 2f issues
(9:22:30 AM) koen: so 3 or 4
(9:22:42 AM) Jefro: questionh on 2e
(9:22:48 AM) Jefro: did the items mentioned ever get done?
(9:23:19 AM) bluelightning: Jefro: not on my end :(
(9:23:24 AM) RP: Sorry, I'm getting distracted by a call :(
(9:23:29 AM) RP: back in a moment
(9:23:37 AM) Jefro: RP ok
(9:23:45 AM) koen: Jefro: still WIP
(9:23:55 AM) bluelightning: Jefro: we ran out of time for this cycle
really, we're not in a position to enforce the PR server so we have
all of next cycle to test/fix it
(9:23:56 AM) Jefro: koen bluelightning ok, will keep on for next agenda
(9:24:15 AM) bluelightning: (in theory)
(9:24:30 AM) Jefro: bluelightning ok - I'll note that in the minutes,
should make sense to people
(9:24:54 AM) RP: ok, back sorry
(9:25:33 AM) RP: So any new issues?
(9:25:36 AM) RP: (3)
(9:25:55 AM) fray: I'd say the in-person BCN meeting.. but we already
discussed that
(9:25:58 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:25:58 AM) mode (+v khem) by ChanServ
(9:26:00 AM) fray: (or the possibility of it)
(9:26:03 AM) khem: Hi all,
(9:26:15 AM) khem: running late today
(9:26:22 AM) Jefro: hi khem - boy do you have a lot of action items now
(9:26:25 AM) RP: I think various items in (2) could use some
documentation and I'll keep them in mind going forward since we need
to pull together a bit on documentation
(9:26:34 AM) Jefro: (khem: not really)
(9:26:35 AM) khem: Jefro: heh ok
(9:26:44 AM) khem: blame bay area traffic
(9:26:57 AM) fray: RP -- ya, I think H and I are in that case, and
then can be remvoed
(9:27:25 AM) Jefro: fray noted
(9:27:28 AM) RP: 4a) / and /usr - basically I maintain what we've
said. Lets look at patches on a case by case basis and be open to
revaluation as things develop
(9:27:45 AM) RP: I don't think a set in stone decision makes sense one
way or another at the moment
(9:27:46 AM) bluelightning: fray: for I, knotty2 still needs documenting I guess
(9:28:08 AM) fray: yup.. I think the logical step (for my needs and
the folks who give me requiredments) are to work on a way for early
boot and transition to a single filesystem (combined / and /usr) for
the specialty uses
(9:28:12 AM) Jefro: perhaps 4a still belongs in "lingering issues"
(undecided) rather than "status" (decided)
(9:28:13 AM) fray: but that is a future thing..
(9:28:14 AM) RP: 4b can be dropped, it was filed
(9:28:26 AM) khem: RP: w.r.t /usr I think patches will come one by one
(9:28:34 AM) khem: we may not even notice
(9:28:39 AM) fray: I think it's status.. because we need to keep
watching and decide if something happens to cause us to reevaluate
(9:28:44 AM) RP: khem: consider on a case by case basis
(9:29:02 AM) RP: 4c: I'm going to send out an email
(9:29:11 AM) fray: bluelightning yes. I've been using it heavily
lately and really do like it (knotty2)
(9:29:23 AM) bluelightning: fray: it's a great improvement for sure
(9:29:34 AM) bluelightning: fray: I'm just noting that the item says
it needs documenting ;)
(9:29:37 AM) RP: and not sure there is not much to do with 4d to talk
about afaik
(9:29:45 AM) ***koen is using knotty2 with yocto1.2 all the time
(9:29:56 AM) RP: I think we need to come up with development plans for
knotty v3 :)
(9:30:02 AM) RP: adding some interaction with the user
(9:30:08 AM) RP: but that is a 1.4 thing
(9:31:43 AM) Jefro: I think that is the entire agenda unless there are
infrastructure or other new issues to discuss
(9:31:52 AM) Jefro: anything lingering from last meeting?
(9:31:54 AM) bluelightning: what happened to 4d ?
(9:32:14 AM) bluelightning: oh I see mentioned above
(9:32:32 AM) bluelightning: what is happening with the mailing list
admin stuff? has that been fixed?
(9:33:18 AM) Jefro: I have volunteered (with Philip & pb) to help,
though I don't have a password yet - Philip is out of town. will
follow up
(9:33:26 AM) RP: bluelightning: Jefro is talking with pb_ I think
(9:33:49 AM) bluelightning: ok, hopefully things are progressing
(9:35:01 AM) Jefro: will be soon. have you heard of any recent issues?
(9:36:32 AM) Jefro: hopefully that means no :)
(9:37:40 AM) Jefro: it's quiet... TOO quiet...
(9:37:49 AM) bluelightning: Jefro: no, I was just wondering if we
could declare that the issue was solved, i.e. an appropriate number of
people have access to admin the lists and messages that get blocked
for whatever reason are cleared
(9:38:31 AM) Jefro: as soon as I have access, I believe that will be the case
(9:38:33 AM) RP: I think we're probably done - have run out of things
to talk about

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


