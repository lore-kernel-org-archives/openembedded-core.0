Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QedAZ-0002sy-Cm; Thu, 07 Jul 2011 03:14:20 +0200
Received: by iym10 with SMTP id 10so485090iym.6
	for <multiple recipients>; Wed, 06 Jul 2011 18:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=QVRMhLQcwYRWw+I2IwGtfUiYOmsHybGaTFxYecIeA9k=;
	b=g9N/rgyEgwX53G2UO9XbbpKJN+5ACJJfjKr6Q74YP7zhiDGQvEUYjrATp58yyuUiPl
	H9SMrBEaqLtMN5DGS3dWFYt767ofFsKaRgyTX3wXNjgw0CAMJ9GEcQ3NXiel+deyUJmX
	GN3lsZxXdCykuU/e6dXFCe06QWsiMefJBhQO8=
MIME-Version: 1.0
Received: by 10.42.140.8 with SMTP id i8mr222620icu.446.1310001026439; Wed, 06
	Jul 2011 18:10:26 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.97.199 with HTTP; Wed, 6 Jul 2011 18:10:26 -0700 (PDT)
Date: Wed, 6 Jul 2011 18:10:26 -0700
X-Google-Sender-Auth: Ba6bx0LMx0_A95TQq5Qtv7Bmmsw
Message-ID: <CA+YB3rbFNYq138cNN1wQQ6yTXXT2rcjgQxPVxB6Eu=KXSf_jQA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 30-Jun-2011
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
X-List-Received-Date: Thu, 07 Jul 2011 01:14:20 -0000
Content-Type: multipart/alternative; boundary=90e6ba61374ad61b0e04a770614f

--90e6ba61374ad61b0e04a770614f
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OE-TSC meeting 30-Jun-2011

Attending: Mark, Koen, Tom
Guest: Richard
Notes: Jefro

Agenda & Proceedings:

01) choose a meeting chair

Jefro

02) new topics

  a) libc locale split mess, why did those patches get merged, especially
considering the outcome of last weeks meeting about core files. (koen)

RP: locale stuff was a bit of a disaster, review/test process had some
issues
need to make warnings more visible and improve bitbake logging
should really log all console output to a logfile for example

b) turning insane.bbclass back on (koen)

not a thursday/friday before a long us weekend change
requires some warning, as things will break - need help from community
--> move discussion to oe-core mailing list, tentative date July 11

c) Rein Memory consumption of bitbake. (khem)

needs someone with the time/skill to work on it - continue

03) action items from last week

  --> patches appearing on oe-dev, khem to send email regarding "put stuff
in meta-oe"
no update

05) Status updates
      - elections - ongoing
      - oe-core
      - bsp guidelines
      - metadata layer splitting
      - infrastructure

Raw Transcript:

(12:58:50 PM) Jefro: 2 minute warning. I have added agenda items from Koen
and Khem, anyone else? Who's here?
(12:59:02 PM) koen: aye
(12:59:07 PM) Tartarus: pong
(12:59:19 PM) ***fray is here now
(12:59:30 PM) Jefro: (is 3 members a quorum now?)
(1:00:11 PM) ***RP__ is here
(1:00:14 PM) Jefro: if not, lively discussion is always an option.  Khem
sent an apology - he can't make it today.
(1:00:27 PM) ***fray notes he will not be able to make next weeks meeting
(1:00:28 PM) RP__: Jefro: We regard it with bemusement :)
(1:00:44 PM) Tartarus: Shall we begin then?
(1:00:52 PM) Jefro: sure - agenda is at http://pastebin.com/mEDd7nm4
(1:01:28 PM) Jefro: ALERT - I need to leave in about 45 minutes, but someone
can send me the transcript of the lastbit if we are still going by then
(1:01:31 PM) RP__: koen: I think that sums it up :)
(1:01:49 PM) Jefro: RP__ :)
(1:02:53 PM) Jefro: quiet today...  too quiet. I'll take the driver's seat
if no one wants it.
(1:03:01 PM) koen: khem says he has no updated on his AR
(1:03:07 PM) koen: (before I forget to mention that)
(1:03:14 PM) RP__: Jefro: go for it :)
(1:03:16 PM) Jefro: koen thanks
(1:03:21 PM) ***Jefro notes Jefro as meeting chair
(1:03:49 PM) Jefro: there were three new topics, two from koen - perhaps he
had better just launch into it
(1:03:59 PM) Tartarus: no new topics here
(1:04:27 PM) fray: nothing here
(1:04:49 PM) RP__: nothing here
(1:04:59 PM) RP__: I have some comments on Koen's topics though :)
(1:05:15 PM) Jefro: I expected nothing less
(1:05:19 PM) koen: so before we burn RP__ at the stake, let's him say his
last words
(1:05:20 PM) Jefro: 2a: libc locale splitmess
(1:05:44 PM) RP__: heh :)
(1:06:13 PM) RP__: The locale stuff was a bit of a disaster, no question
about that :(
(1:06:39 PM) RP__: I don't quite think it follows from last weeks problem
though as these were two different circumstances
(1:07:10 PM) RP__: In this case we were on v3 of the patch and at least four
people had looked at the patches including myself and Phil
(1:07:50 PM) fray: ya, there was definite review..
(1:07:56 PM) RP__: There was stuff people should have spotted and didn't
(1:07:59 PM) koen: but was there testing?
(1:08:10 PM) RP__: koen: I did have it in my testing trees off and on
(1:08:29 PM) koen: an incremental image build would have shown the shlib
renaming problem at least
(1:08:45 PM) RP__: koen: I was doing builds from scratch and profiling at
the same time :/
(1:08:48 PM) fray: I think the incremental image may have been a gap in the
testing..
(1:08:51 PM) koen: a look at the buildlog would have shown all the -dbg
misses
(1:09:21 PM) RP__: koen: I know, I got distracted by other build issues like
performance which I'm still struggling to find a regression on
(1:09:29 PM) koen: unpackaged file are starting to become a pet peeve for me
:)
(1:09:39 PM) RP__: Somewhere we took a 10% hit and I can't explain how
(1:09:48 PM) RP__: koen: one topic at a time ;-)
(1:09:50 PM) fray: koen (re unpackaged files) I agree.. it's getting worse
(1:10:36 PM) RP__: I did send some rather frank emails to the Yocto team
about the locale thing asking people to learn lessons from it although the
mail I sent was to an internal list
(1:11:26 PM) koen: so another set of lessons learned?
(1:11:31 PM) RP__: So all in all, I am resolving to do better and have asked
the team to do better too
(1:11:33 PM) koen: if yes, let's move to 2b
(1:11:53 PM) RP__: koen: yes. I'd also like to see what we can do to make
certain warnings more obvious
(1:11:56 PM) Jefro: any action items from 2a other than be more careful
nexttime?
(1:11:58 PM) RP__: which leads us to 2b
(1:12:19 PM) RP__: Jefro: I think the main thing is to make warnings more
visible and improve bitbake logging
(1:12:30 PM) RP__: we should really log all console output to a logfile for
example
(1:12:50 PM) RP__: in fact someone should file that bug
(1:12:54 PM) Jefro: good point - I am very used to redirecting it to a log
(1:13:09 PM) koen: in .dev we log most qa errors to a file
(1:13:19 PM) RP__: koen: I want the whole console output
(1:13:36 PM) ***RP__ is sick of hearing complaints about that
(1:14:33 PM) koen: but back to 2b, can we turn them back on ASAP?
(1:15:02 PM) koen: basic things like the kernel ships buildarch files
(1:15:06 PM) koen: -s
(1:15:07 PM) fray: my only concern is today is Thursday and it might be
better to do it Monday..
(1:15:13 PM) fray: otherwise, yes we need to
(1:15:31 PM) Tartarus: Yes, agree with fray
(1:15:39 PM) Tartarus: it's not a thursday/friday before a long us weekend
change
(1:16:05 PM) Tartarus: s/us/US/
(1:16:19 PM) fray: even Monday may be bad due to July 4th (and July 1st
being Canada day)
(1:17:00 PM) Tartarus: yeah
(1:17:04 PM) Tartarus: Tuesday
(1:17:19 PM) Tartarus: Unless RP__ is gonna get a jump on fixing all of the
QA issues too :)
(1:17:19 PM) RP__: koen: What I don't want to do is turn that stuff back on
and have the yocto autobuilder go red across the board
(1:17:26 PM) fray: (we should likely send out a warning that things are
going to break)
(1:17:58 PM) fray: RP__ is there anyone that will go in and fix them as part
of the patch to reenable it though?  with the holiday and other things, I'm
not sure there is this particular moment..
(1:17:59 PM) RP__: This does need a process stepping through and ensureing
oe-core at least is clean, then turning them on
(1:17:59 PM) koen: RP__: people aren't fixing the problems right now, seeing
it go red might trigger people into action
(1:18:12 PM) RP__: koen: I'd at least like to warn people
(1:18:21 PM) Tartarus: RP__: how much warning?
(1:18:22 PM) fray: yes, we need to warn folks
(1:18:29 PM) Tartarus: warn today, do it Tuesday?
(1:18:39 PM) koen: but I don't want to wait till everything has been fixed
(1:18:43 PM) Tartarus: I'm with koen, this needs to cause things to go red
so people fix it
(1:18:48 PM) ***koen doesn't agree with it being turned off to start with
(1:19:01 PM) RP__: koen: I'm not sure why that happened either
(1:19:01 PM) koen: but giving people a week time can't hurt
(1:19:20 PM) RP__: Its also a question of who is going to fix this stuff
(1:19:29 PM) Tartarus: RP__, everyone once it goes red
(1:19:35 PM) Tartarus: Most stuff has a fix in oe.dev already I bet
(1:19:42 PM) RP__: I would point out the Yocto team is actually maxed out at
the moment and they do not have the bandwith this second
(1:20:04 PM) RP__: heck, I'm maxed out trying to review all the patches on
the mailing list
(1:20:22 PM) RP__: I'm just about getting to grips with the week Saul had
out :(
(1:20:23 PM) Tartarus: RP__: That "the team" is maxxed out on other stuff
speaks to koen (and my) concern
(1:20:32 PM) Tartarus: That it will take it being broken for people to get
around to fixing it
(1:20:43 PM) koen: option b) is to remove "high quality" from the website
and propoganda
(1:21:02 PM) RP__: koen: just quit with that stuff please ;-)
(1:21:09 PM) koen: ok, ok
(1:21:16 PM) RP__: I'm trying to would out a reasonable way we can do this
(1:21:20 PM) RP__: which doesn't piss people off
(1:21:54 PM) RP__: s/would/work/
(1:21:55 PM) Tartarus: Well, lets see
(1:22:30 PM) RP__: I would like a little time to figure out how bad things
are with those options turned on
(1:22:39 PM) RP__: We don't have an instant need to change this
(1:22:57 PM) koen: be glad the initial set doesn't include the LDFLAGS check
:)
(1:23:26 PM) Tartarus: RP__: How about we change it on the 11th of july?
(1:23:32 PM) Tartarus: And just look at any current log for how bad it's
going to be
(1:23:44 PM) RP__: Tartarus: That works
(1:24:04 PM) koen: if you ask nicely darren might fix kernel.bbclass before
the 11th
(1:24:18 PM) ***RP__ is going to have mutiny on his hands or needs to sort
this himself and take a weekend to do it :/
(1:24:40 PM) RP__: but I agree we need to do it
(1:24:40 PM) koen: I think it's more than a weekends work
(1:25:01 PM) RP__: koen: I don't have any more time I can physically give
(1:25:09 PM) koen: I know
(1:25:14 PM) RP__: I'm supposed to be doing other things with my weekends
too :(
(1:25:32 PM) koen: I'm just pointing out it's a big undertaking, but one
that needs to get done
(1:25:44 PM) koen: and it's not something we want you to waste your weekends
on
(1:25:47 PM) Jefro: is there anyone else in the community who can do it?
(1:26:07 PM) fray: I think the warning needs to include a plee from the
community for help
(1:26:16 PM) fray: plea even
(1:26:19 PM) RP__: it does
(1:26:57 PM) RP__: It doesn't help I'm not doing too well from a medical PoV
atm
(1:27:17 PM) koen: working weekends won't help with that
(1:28:00 PM) RP__: koen: It just means I don't do other things
(1:28:37 PM) RP__: Anyhow, my point is there are implications if we just
make the change. I think we've agreed to give some runway and there are ways
of sorting things out within that
(1:28:50 PM) koen: any volunteers who aren't named RP to write the danger,
will robinson note?
(1:28:59 PM) Jefro: RP__ needs no excuses here, I don't think. it's just a
matter of finding resources.
(1:29:01 PM) RP__: From a Yocto standpoint, multilib is a big worry atm btw
(1:30:42 PM) Tartarus: Well, lets see
(1:30:43 PM) koen: shall we move this discussion to the oe-core ml?
(1:30:49 PM) Tartarus: koen, just how horribly overloaded are you atm? :)
(1:30:54 PM) Tartarus: And that too
(1:30:56 PM) RP__: I think so
(1:31:39 PM) koen: Tartarus: spending a week at UK office next week doing
only powervr stuff
(1:32:09 PM) ***koen foresees a backlog
(1:32:14 PM) Tartarus: Well, ok, we'll ask for folks to turn it on locally
and start producing patches
(1:32:23 PM) Tartarus: See if we can't get some stuff tackled before the
11th
(1:32:26 PM) ***koen has it turned on already :)
(1:32:48 PM) koen: ready to move to 2c?
(1:33:18 PM) ***Jefro notes discussion to move to ml
(1:33:30 PM) Jefro: moving to 2c - was hoping khem would be here by now
(1:33:45 PM) Tartarus: Well, I think we can manage
(1:33:46 PM) Jefro: he wrote a letter to the tsc list about this issue.
(1:33:53 PM) Tartarus: and it sounds like RP is aware of both perf and
memory issues
(1:33:53 PM) koen: he entered a 'short' meeting 20 minutes ago
(1:33:56 PM) fray: for 2c, I wonder if the per-file dependencies are
contributing to the bloat..  this and some of the other run-time dependency
info can likely be flushed out to a file and reloaded only when needed..
(1:33:58 PM) Tartarus: time to bust out some free time and smem
(1:34:33 PM) ***RP__ is aware of the memory issue
(1:34:37 PM) Tartarus: I know chris larson has done some what's taking so
much memory profiling in the past and I think that lead to a few minor
changes too
(1:34:41 PM) RP__: it just needs someone with the time/skill to work on it
(1:34:46 PM) koen: khem and I worry that 1k recipes need 600MB already
(1:34:49 PM) fray: would be nice to have an idea of all of the variables
that are contributing to the memory usage.. then we can devise a strategy...
(1:34:51 PM) Tartarus: And it's a small set of folks with the skills :(
(1:34:53 PM) koen: what happens with 8k recipes?
(1:35:05 PM) RP__: koen: depends whether its the recipes causing the problem
(1:35:36 PM) RP__: Tartarus: at present I've seen some decidedly odd
behaviour with build times which I'm trying to get to the bottom of
(1:35:48 PM) RP__: This 10% regression I mentioned.
(1:36:17 PM) RP__: but I can only work on so much at once and the people
I've asked to try and find it can't
(1:36:33 PM) koen: so it's known and scheduled to be looked at
(1:37:02 PM) RP__: well, the build time issue is. We need to officially add
memory usage to the Yocto list
(1:37:11 PM) RP__: and find someone with time to work on it
(1:39:49 PM) Tartarus: So, I think that's that
(1:40:14 PM) Tartarus: We already had a quick update on khem's AIs and that
was all there was for AIs I think
(1:40:28 PM) Jefro: on to status?
(1:40:32 PM) Tartarus: Yeap
(1:40:42 PM) Tartarus: Anything we haven't covered already really via 2a/b/c
(1:41:06 PM) Jefro: no word on infrastructure - I have planned a meeting
with LF to discuss status on that, will report back next week
(1:41:52 PM) koen: elections seems to be "working"
(1:42:28 PM) Jefro: any other status not covered above on oe-core, metadata
splitting...
(1:42:29 PM) koen: the usual apathy
(1:43:02 PM) fray: I think we're good
(1:43:17 PM) Jefro: cool - meeting adjourned?
(1:43:24 PM) Tartarus: seconded
(1:43:42 PM) Jefro: awesome. see yall

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba61374ad61b0e04a770614f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-f=
amily: arial, sans-serif; font-size: 13px; "><div>MINUTES: OE-TSC meeting 3=
0-Jun-2011</div><div><br></div><div>Attending: Mark, Koen, Tom</div><div>Gu=
est: Richard</div>
<div>Notes: Jefro</div><div><br></div><div>Agenda &amp; Proceedings:</div><=
div><br></div><div>01) choose a meeting chair</div><div><br></div><div>Jefr=
o</div><div><br></div><div>02) new topics</div><div><br></div><div>=A0 a) l=
ibc locale split mess, why did those patches get merged, especially conside=
ring the outcome of last weeks meeting about core files. (koen)</div>
<div><br></div><div>RP: locale stuff was a bit of a disaster, review/test p=
rocess had some issues</div><div>need to make warnings more visible and imp=
rove bitbake logging</div><div>should really log all console output to a lo=
gfile for example</div>
<div>=A0=A0</div><div>b) turning insane.bbclass back on (koen)</div><div><b=
r></div><div>not a thursday/friday before a long us weekend change</div><di=
v>requires some warning, as things will break - need help from community</d=
iv>
<div>--&gt; move discussion to oe-core mailing list, tentative date July 11=
</div><div><br></div><div>c) Rein Memory consumption of bitbake. (khem)</di=
v><div><br></div><div>needs someone with the time/skill to work on it - con=
tinue</div>
<div><br></div><div>03) action items from last week</div><div><br></div><di=
v>=A0 --&gt; patches appearing on oe-dev, khem to send email regarding &quo=
t;put stuff in meta-oe&quot;</div><div>no update</div><div><br></div><div>
05) Status updates</div><div>=A0 =A0 =A0 - elections - ongoing</div><div>=
=A0 =A0 =A0 - oe-core</div><div>=A0 =A0 =A0 - bsp guidelines</div><div>=A0 =
=A0 =A0 - metadata layer splitting</div><div>=A0 =A0 =A0 - infrastructure</=
div><div><br></div><div>Raw Transcript:</div>
<div><br></div><div>(12:58:50 PM) Jefro: 2 minute warning. I have added age=
nda items from Koen and Khem, anyone else? Who&#39;s here?</div><div>(12:59=
:02 PM) koen: aye</div><div>(12:59:07 PM) Tartarus: pong</div><div>(12:59:1=
9 PM) ***fray is here now</div>
<div>(12:59:30 PM) Jefro: (is 3 members a quorum now?)</div><div>(1:00:11 P=
M) ***RP__ is here</div><div>(1:00:14 PM) Jefro: if not, lively discussion =
is always an option. =A0Khem sent an apology - he can&#39;t make it today.<=
/div>
<div>(1:00:27 PM) ***fray notes he will not be able to make next weeks meet=
ing</div><div>(1:00:28 PM) RP__: Jefro: We regard it with bemusement :)</di=
v><div>(1:00:44 PM) Tartarus: Shall we begin then?</div><div>(1:00:52 PM) J=
efro: sure - agenda is at=A0<a href=3D"http://pastebin.com/mEDd7nm4" target=
=3D"_blank" style=3D"color: rgb(0, 0, 204); ">http://pastebin.com/mEDd7nm4<=
/a></div>
<div>(1:01:28 PM) Jefro: ALERT - I need to leave in about 45 minutes, but s=
omeone can send me the transcript of the lastbit if we are still going by t=
hen</div><div>(1:01:31 PM) RP__: koen: I think that sums it up :)</div>
<div>(1:01:49 PM) Jefro: RP__ :)</div><div>(1:02:53 PM) Jefro: quiet today.=
.. =A0too quiet. I&#39;ll take the driver&#39;s seat if no one wants it.</d=
iv><div>(1:03:01 PM) koen: khem says he has no updated on his AR</div><div>
(1:03:07 PM) koen: (before I forget to mention that)</div><div>(1:03:14 PM)=
 RP__: Jefro: go for it :)</div><div>(1:03:16 PM) Jefro: koen thanks</div><=
div>(1:03:21 PM) ***Jefro notes Jefro as meeting chair</div><div>(1:03:49 P=
M) Jefro: there were three new topics, two from koen - perhaps he had bette=
r just launch into it</div>
<div>(1:03:59 PM) Tartarus: no new topics here</div><div>(1:04:27 PM) fray:=
 nothing here</div><div>(1:04:49 PM) RP__: nothing here</div><div>(1:04:59 =
PM) RP__: I have some comments on Koen&#39;s topics though :)</div><div>
(1:05:15 PM) Jefro: I expected nothing less</div><div>(1:05:19 PM) koen: so=
 before we burn RP__ at the stake, let&#39;s him say his last words</div><d=
iv>(1:05:20 PM) Jefro: 2a: libc locale splitmess</div><div>(1:05:44 PM) RP_=
_: heh :)</div>
<div>(1:06:13 PM) RP__: The locale stuff was a bit of a disaster, no questi=
on about that :(</div><div>(1:06:39 PM) RP__: I don&#39;t quite think it fo=
llows from last weeks problem though as these were two different circumstan=
ces</div>
<div>(1:07:10 PM) RP__: In this case we were on v3 of the patch and at leas=
t four people had looked at the patches including myself and Phil</div><div=
>(1:07:50 PM) fray: ya, there was definite review..</div><div>(1:07:56 PM) =
RP__: There was stuff people should have spotted and didn&#39;t</div>
<div>(1:07:59 PM) koen: but was there testing?</div><div>(1:08:10 PM) RP__:=
 koen: I did have it in my testing trees off and on</div><div>(1:08:29 PM) =
koen: an incremental image build would have shown the shlib renaming proble=
m at least</div>
<div>(1:08:45 PM) RP__: koen: I was doing builds from scratch and profiling=
 at the same time :/</div><div>(1:08:48 PM) fray: I think the incremental i=
mage may have been a gap in the testing..</div><div>(1:08:51 PM) koen: a lo=
ok at the buildlog would have shown all the -dbg misses</div>
<div>(1:09:21 PM) RP__: koen: I know, I got distracted by other build issue=
s like performance which I&#39;m still struggling to find a regression on</=
div><div>(1:09:29 PM) koen: unpackaged file are starting to become a pet pe=
eve for me :)</div>
<div>(1:09:39 PM) RP__: Somewhere we took a 10% hit and I can&#39;t explain=
 how</div><div>(1:09:48 PM) RP__: koen: one topic at a time ;-)</div><div>(=
1:09:50 PM) fray: koen (re unpackaged files) I agree.. it&#39;s getting wor=
se</div>
<div>(1:10:36 PM) RP__: I did send some rather frank emails to the Yocto te=
am about the locale thing asking people to learn lessons from it although t=
he mail I sent was to an internal list</div><div>(1:11:26 PM) koen: so anot=
her set of lessons learned?</div>
<div>(1:11:31 PM) RP__: So all in all, I am resolving to do better and have=
 asked the team to do better too</div><div>(1:11:33 PM) koen: if yes, let&#=
39;s move to 2b</div><div>(1:11:53 PM) RP__: koen: yes. I&#39;d also like t=
o see what we can do to make certain warnings more obvious</div>
<div>(1:11:56 PM) Jefro: any action items from 2a other than be more carefu=
l nexttime?</div><div>(1:11:58 PM) RP__: which leads us to 2b</div><div>(1:=
12:19 PM) RP__: Jefro: I think the main thing is to make warnings more visi=
ble and improve bitbake logging</div>
<div>(1:12:30 PM) RP__: we should really log all console output to a logfil=
e for example</div><div>(1:12:50 PM) RP__: in fact someone should file that=
 bug</div><div>(1:12:54 PM) Jefro: good point - I am very used to redirecti=
ng it to a log</div>
<div>(1:13:09 PM) koen: in .dev we log most qa errors to a file</div><div>(=
1:13:19 PM) RP__: koen: I want the whole console output</div><div>(1:13:36 =
PM) ***RP__ is sick of hearing complaints about that</div><div>(1:14:33 PM)=
 koen: but back to 2b, can we turn them back on ASAP?</div>
<div>(1:15:02 PM) koen: basic things like the kernel ships buildarch files<=
/div><div>(1:15:06 PM) koen: -s</div><div>(1:15:07 PM) fray: my only concer=
n is today is Thursday and it might be better to do it Monday..</div><div>
(1:15:13 PM) fray: otherwise, yes we need to</div><div>(1:15:31 PM) Tartaru=
s: Yes, agree with fray</div><div>(1:15:39 PM) Tartarus: it&#39;s not a thu=
rsday/friday before a long us weekend change</div><div>(1:16:05 PM) Tartaru=
s: s/us/US/</div>
<div>(1:16:19 PM) fray: even Monday may be bad due to July 4th (and July 1s=
t being Canada day)</div><div>(1:17:00 PM) Tartarus: yeah</div><div>(1:17:0=
4 PM) Tartarus: Tuesday</div><div>(1:17:19 PM) Tartarus: Unless RP__ is gon=
na get a jump on fixing all of the QA issues too :)</div>
<div>(1:17:19 PM) RP__: koen: What I don&#39;t want to do is turn that stuf=
f back on and have the yocto autobuilder go red across the board</div><div>=
(1:17:26 PM) fray: (we should likely send out a warning that things are goi=
ng to break)</div>
<div>(1:17:58 PM) fray: RP__ is there anyone that will go in and fix them a=
s part of the patch to reenable it though? =A0with the holiday and other th=
ings, I&#39;m not sure there is this particular moment..</div><div>(1:17:59=
 PM) RP__: This does need a process stepping through and ensureing oe-core =
at least is clean, then turning them on</div>
<div>(1:17:59 PM) koen: RP__: people aren&#39;t fixing the problems right n=
ow, seeing it go red might trigger people into action</div><div>(1:18:12 PM=
) RP__: koen: I&#39;d at least like to warn people</div><div>(1:18:21 PM) T=
artarus: RP__: how much warning?</div>
<div>(1:18:22 PM) fray: yes, we need to warn folks</div><div>(1:18:29 PM) T=
artarus: warn today, do it Tuesday?</div><div>(1:18:39 PM) koen: but I don&=
#39;t want to wait till everything has been fixed</div><div>(1:18:43 PM) Ta=
rtarus: I&#39;m with koen, this needs to cause things to go red so people f=
ix it</div>
<div>(1:18:48 PM) ***koen doesn&#39;t agree with it being turned off to sta=
rt with</div><div>(1:19:01 PM) RP__: koen: I&#39;m not sure why that happen=
ed either</div><div>(1:19:01 PM) koen: but giving people a week time can&#3=
9;t hurt</div>
<div>(1:19:20 PM) RP__: Its also a question of who is going to fix this stu=
ff</div><div>(1:19:29 PM) Tartarus: RP__, everyone once it goes red</div><d=
iv>(1:19:35 PM) Tartarus: Most stuff has a fix in oe.dev already I bet</div=
>
<div>(1:19:42 PM) RP__: I would point out the Yocto team is actually maxed =
out at the moment and they do not have the bandwith this second</div><div>(=
1:20:04 PM) RP__: heck, I&#39;m maxed out trying to review all the patches =
on the mailing list</div>
<div>(1:20:22 PM) RP__: I&#39;m just about getting to grips with the week S=
aul had out :(</div><div>(1:20:23 PM) Tartarus: RP__: That &quot;the team&q=
uot; is maxxed out on other stuff speaks to koen (and my) concern</div>
<div>(1:20:32 PM) Tartarus: That it will take it being broken for people to=
 get around to fixing it</div><div>(1:20:43 PM) koen: option b) is to remov=
e &quot;high quality&quot; from the website and propoganda</div><div>(1:21:=
02 PM) RP__: koen: just quit with that stuff please ;-)</div>
<div>(1:21:09 PM) koen: ok, ok</div><div>(1:21:16 PM) RP__: I&#39;m trying =
to would out a reasonable way we can do this</div><div>(1:21:20 PM) RP__: w=
hich doesn&#39;t piss people off</div><div>(1:21:54 PM) RP__: s/would/work/=
</div>
<div>(1:21:55 PM) Tartarus: Well, lets see</div><div>(1:22:30 PM) RP__: I w=
ould like a little time to figure out how bad things are with those options=
 turned on</div><div>(1:22:39 PM) RP__: We don&#39;t have an instant need t=
o change this</div>
<div>(1:22:57 PM) koen: be glad the initial set doesn&#39;t include the LDF=
LAGS check :)</div><div>(1:23:26 PM) Tartarus: RP__: How about we change it=
 on the 11th of july?</div><div>(1:23:32 PM) Tartarus: And just look at any=
 current log for how bad it&#39;s going to be</div>
<div>(1:23:44 PM) RP__: Tartarus: That works</div><div>(1:24:04 PM) koen: i=
f you ask nicely darren might fix kernel.bbclass before the 11th</div><div>=
(1:24:18 PM) ***RP__ is going to have mutiny on his hands or needs to sort =
this himself and take a weekend to do it :/</div>
<div>(1:24:40 PM) RP__: but I agree we need to do it</div><div>(1:24:40 PM)=
 koen: I think it&#39;s more than a weekends work</div><div>(1:25:01 PM) RP=
__: koen: I don&#39;t have any more time I can physically give</div><div>
(1:25:09 PM) koen: I know</div><div>(1:25:14 PM) RP__: I&#39;m supposed to =
be doing other things with my weekends too :(</div><div>(1:25:32 PM) koen: =
I&#39;m just pointing out it&#39;s a big undertaking, but one that needs to=
 get done</div>
<div>(1:25:44 PM) koen: and it&#39;s not something we want you to waste you=
r weekends on</div><div>(1:25:47 PM) Jefro: is there anyone else in the com=
munity who can do it?</div><div>(1:26:07 PM) fray: I think the warning need=
s to include a plee from the community for help</div>
<div>(1:26:16 PM) fray: plea even</div><div>(1:26:19 PM) RP__: it does</div=
><div>(1:26:57 PM) RP__: It doesn&#39;t help I&#39;m not doing too well fro=
m a medical PoV atm</div><div>(1:27:17 PM) koen: working weekends won&#39;t=
 help with that</div>
<div>(1:28:00 PM) RP__: koen: It just means I don&#39;t do other things</di=
v><div>(1:28:37 PM) RP__: Anyhow, my point is there are implications if we =
just make the change. I think we&#39;ve agreed to give some runway and ther=
e are ways of sorting things out within that</div>
<div>(1:28:50 PM) koen: any volunteers who aren&#39;t named RP to write the=
 danger, will robinson note?</div><div>(1:28:59 PM) Jefro: RP__ needs no ex=
cuses here, I don&#39;t think. it&#39;s just a matter of finding resources.=
</div>
<div>(1:29:01 PM) RP__: From a Yocto standpoint, multilib is a big worry at=
m btw</div><div>(1:30:42 PM) Tartarus: Well, lets see</div><div>(1:30:43 PM=
) koen: shall we move this discussion to the oe-core ml?</div><div>(1:30:49=
 PM) Tartarus: koen, just how horribly overloaded are you atm? :)</div>
<div>(1:30:54 PM) Tartarus: And that too</div><div>(1:30:56 PM) RP__: I thi=
nk so</div><div>(1:31:39 PM) koen: Tartarus: spending a week at UK office n=
ext week doing only powervr stuff</div><div>(1:32:09 PM) ***koen foresees a=
 backlog</div>
<div>(1:32:14 PM) Tartarus: Well, ok, we&#39;ll ask for folks to turn it on=
 locally and start producing patches</div><div>(1:32:23 PM) Tartarus: See i=
f we can&#39;t get some stuff tackled before the 11th</div><div>(1:32:26 PM=
) ***koen has it turned on already :)</div>
<div>(1:32:48 PM) koen: ready to move to 2c?</div><div>(1:33:18 PM) ***Jefr=
o notes discussion to move to ml</div><div>(1:33:30 PM) Jefro: moving to 2c=
 - was hoping khem would be here by now</div><div>(1:33:45 PM) Tartarus: We=
ll, I think we can manage</div>
<div>(1:33:46 PM) Jefro: he wrote a letter to the tsc list about this issue=
. =A0</div><div>(1:33:53 PM) Tartarus: and it sounds like RP is aware of bo=
th perf and memory issues</div><div>(1:33:53 PM) koen: he entered a &#39;sh=
ort&#39; meeting 20 minutes ago</div>
<div>(1:33:56 PM) fray: for 2c, I wonder if the per-file dependencies are c=
ontributing to the bloat.. =A0this and some of the other run-time dependenc=
y info can likely be flushed out to a file and reloaded only when needed..<=
/div>
<div>(1:33:58 PM) Tartarus: time to bust out some free time and smem</div><=
div>(1:34:33 PM) ***RP__ is aware of the memory issue</div><div>(1:34:37 PM=
) Tartarus: I know chris larson has done some what&#39;s taking so much mem=
ory profiling in the past and I think that lead to a few minor changes too<=
/div>
<div>(1:34:41 PM) RP__: it just needs someone with the time/skill to work o=
n it</div><div>(1:34:46 PM) koen: khem and I worry that 1k recipes need 600=
MB already</div><div>(1:34:49 PM) fray: would be nice to have an idea of al=
l of the variables that are contributing to the memory usage.. then we can =
devise a strategy...</div>
<div>(1:34:51 PM) Tartarus: And it&#39;s a small set of folks with the skil=
ls :(</div><div>(1:34:53 PM) koen: what happens with 8k recipes?</div><div>=
(1:35:05 PM) RP__: koen: depends whether its the recipes causing the proble=
m</div>
<div>(1:35:36 PM) RP__: Tartarus: at present I&#39;ve seen some decidedly o=
dd behaviour with build times which I&#39;m trying to get to the bottom of<=
/div><div>(1:35:48 PM) RP__: This 10% regression I mentioned.</div><div>
(1:36:17 PM) RP__: but I can only work on so much at once and the people I&=
#39;ve asked to try and find it can&#39;t</div><div>(1:36:33 PM) koen: so i=
t&#39;s known and scheduled to be looked at</div><div>(1:37:02 PM) RP__: we=
ll, the build time issue is. We need to officially add memory usage to the =
Yocto list</div>
<div>(1:37:11 PM) RP__: and find someone with time to work on it</div><div>=
(1:39:49 PM) Tartarus: So, I think that&#39;s that</div><div>(1:40:14 PM) T=
artarus: We already had a quick update on khem&#39;s AIs and that was all t=
here was for AIs I think</div>
<div>(1:40:28 PM) Jefro: on to status?</div><div>(1:40:32 PM) Tartarus: Yea=
p</div><div>(1:40:42 PM) Tartarus: Anything we haven&#39;t covered already =
really via 2a/b/c</div><div>(1:41:06 PM) Jefro: no word on infrastructure -=
 I have planned a meeting with LF to discuss status on that, will report ba=
ck next week</div>
<div>(1:41:52 PM) koen: elections seems to be &quot;working&quot;</div><div=
>(1:42:28 PM) Jefro: any other status not covered above on oe-core, metadat=
a splitting...</div><div>(1:42:29 PM) koen: the usual apathy</div><div>
(1:43:02 PM) fray: I think we&#39;re good</div><div>(1:43:17 PM) Jefro: coo=
l - meeting adjourned?</div><div>(1:43:24 PM) Tartarus: seconded</div><div>=
(1:43:42 PM) Jefro: awesome. see yall</div></span><br>-- <br>Jeff Osier-Mix=
on <a href=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/blo=
g</a><div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>

--90e6ba61374ad61b0e04a770614f--
