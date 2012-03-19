Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1S9ktW-00057x-MU; Mon, 19 Mar 2012 23:17:39 +0100
Received: by iaag37 with SMTP id g37so9892458iaa.6
	for <multiple recipients>; Mon, 19 Mar 2012 15:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=k5BU3xtrypltcmMghAgfVA5mQ9LWAKAT+F9ol9+sZxs=;
	b=InrsN7PQeFeBOo1ESFr3BvzOFogyKXCF7JVoEqkbgSuAO+fTDXCLtoqAE0aMsu9QEF
	APuHlQzeluqHSbmI+8eC+YThN1s3uC47wJXrVQS0mwmBNmrWLwplHWF5W3h/Lgzo4lcp
	5YtJIPvlb7todLOmykrPFjnjjyfdRRPxRcHmBFx7oGdIxhLyu1mE29dLsMOG8PDFcEJT
	FayKvKJ8mZECLClW8MV41ZvSKHQvGolyvLTUgvkxLloJ2F8eiZtv4VwZeTh9n/7K6Qrk
	41SD4pyxhKRlfIhkoCAzLxFyi/+MnVxBo+tSOH/FVOiYjB8cOBg1s8XDi/fvS5kMlCfD
	9JPg==
MIME-Version: 1.0
Received: by 10.43.44.202 with SMTP id uh10mr7878827icb.3.1332194925671; Mon,
	19 Mar 2012 15:08:45 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.127.38 with HTTP; Mon, 19 Mar 2012 15:08:45 -0700 (PDT)
Date: Mon, 19 Mar 2012 15:08:45 -0700
X-Google-Sender-Auth: NE5gT7X1cbR808ZPgZ8XkFXIYQw
Message-ID: <CA+YB3rb2qL4q2Zrhh16aVSSx52sqYWcCnk+bRP0HZ2mvk8MOEw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 28 February 2012
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
X-List-Received-Date: Mon, 19 Mar 2012 22:17:39 -0000
Content-Type: multipart/alternative; boundary=bcaec51a76e050f4c904bb9fcd8f

--bcaec51a76e050f4c904bb9fcd8f
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
28 February, 2012

Attending: Khem, Richard, Mark, Paul
Apologies: Tom
Minutes: Jefro

________________________________________________
Agenda

1. pick a chair
   RP (by default)

2. open issues
   resolved at ELC, only status is left

3. status

   a. oe-core
      lots of churn, patches coming in heavily
      RP thinks most things merged

   b. python 3 transition
      going slowly

   c. bitbake quoting fix merged, now enforce syntax, e.g. FOO = "1"

   d. khem worked on some wiki pages last week

   e. hobv2 merged, please play with it

   f. 4.7 upgrade not yet posted (khem), hold until after April release

   g. agreement on toolchain issue:
      toolchains not in oe-core will be split out into their own layers,
      including toolchains in meta-oe

   h. collab summit, bsp summit
      coming up in April

________________________________________________
Raw Transcript

(9:00:04 AM) bluelightning: hi folks
(9:02:12 AM) RP__: hi bluelightning
(9:02:16 AM) RP__: hi khem
(9:02:19 AM) RP__: fray: ping?
(9:02:35 AM) khem: hi RP__
(9:02:37 AM) RP__: I think I saw an email saying Tom couldn't make it?
(9:02:38 AM) fray: hey I'm here..
(9:02:44 AM) fray: ya, he's out
(9:02:48 AM) khem: I will grab a cup of tea
(9:02:57 AM) RP__: cool, we have everyone who will be here then
(9:02:58 AM) khem: too many police officers on road today :)
(9:03:32 AM) ***fray is really sick last couple of days.. at least the room
stopped spinning finally
(9:03:45 AM) ***fray 's temper is a bit short though.. :(
(9:04:49 AM) RP__: fray: Sorry to hear that, I hope you have a swift
recovery
(9:05:00 AM) RP__: Jefro: do we have an agenda?
(9:05:18 AM) fray: so do I.. I'm supposed to give an intro to Yocto talk
and hands-on w/ Poky class at RTECC in Dallas next tuesday.. :P
(9:06:15 AM) RP__: fray: I'm just getting stressed out by the amount of
stuff I need to do before I go away on Saturday
(9:06:35 AM) ***RP__ found water all over the garage floor before. Seems to
be coming from the Daytona which is scary
(9:06:45 AM) fray: I understand.. I was supposed to have the hard drive
prepared for imaging yesterday..
(9:06:54 AM) RP__: Does anyone have topics for discussion?
(9:06:57 AM) fray: needless to say, I'm still working on it.. (I was
completely useless on Sunday and Montday)
(9:07:00 AM) fray: I don't have anything
(9:07:15 AM) fray: did we want to mention the wiki day?  (do we want to
schedule that yet?)
(9:07:24 AM) khem: I dont have any pressing topics
(9:07:28 AM) RP__: I think it would be good to give people some notice
(9:07:37 AM) RP__: Sometime after next week though! ;-)
(9:07:41 AM) khem: 2 weeks would be good time
(9:07:43 AM) fray: yes
(9:07:57 AM) fray: we said mid march in the ELC meetings
(9:08:12 AM) RP__: so that all approximately fits together
(9:08:22 AM) RP__: who is going to send out a proposal?
(9:08:51 AM) bluelightning: I can do it
(9:09:55 AM) Jefro: sorry - fell of the net again (*)&%
(9:10:00 AM) RP__: bluelightning: thanks
(9:10:20 AM) Jefro: we actually fulfilled the major topics at the f2f,
status is all we have to discuss today
(9:10:28 AM) RP__: Jefro: thanks
(9:10:40 AM) RP__: We've had a lot of churn with the patches coming in
rather heavily
(9:10:45 AM) RP__: I think most things have merged
(9:11:00 AM) RP__: I know there are some patches from Khem I've not taken
yet and need to discuss in more detail
(9:11:39 AM) RP__: There are some cleanups I would like to make such as the
", 1" -> ", True" substituition, use appendVar in places and so on
(9:12:06 AM) khem: RP__: is there plan to go for python 3.x for bitbake
(9:12:08 AM) RP__: I don't seem to manage to find time to get to those
though and a merge window is a bad time due to the amount of patches that
would fail to apply
(9:12:18 AM) fray: yup
(9:12:30 AM) RP__: khem: we've done a lot of the ground work so far
(9:12:36 AM) RP__: khem: so its being worked on slowly
(9:12:49 AM) khem: ok.
(9:12:50 AM) fray: we should investigate bitbake w/ python 3 after the
current release cycle..
(9:12:59 AM) fray: just to get any idea how close (or not) we are..
(9:13:24 AM) ***RP__ agrees
(9:13:33 AM) RP__: I also merged the bitbake quoting fix
(9:13:44 AM) RP__: nbbody was going to fix things until I did :/
(9:14:02 AM) fray: which quoting fix?
(9:14:11 AM) ***bluelightning has already added a note on quoting to the
metadata migration wiki page, FYI
(9:14:21 AM) khem: Generally bitbake's error recovery sucks a bit imo
(9:14:38 AM) khem: I did touch some wiki page's last week
(9:14:48 AM) khem: to mention about oe-core/oe-dev
(9:14:54 AM) RP__: fray: We now enforce FOO = "1"
(9:14:56 AM) bluelightning: khem: I'd like to think we've improved error
handling quite a bit lately, are there any outstanding error situations you
can point to?
(9:14:57 AM) khem: one of the page was getting started page
(9:15:01 AM) fray: ahh ok
(9:15:02 AM) RP__: fray: FOO = 1 wont' work
(9:15:13 AM) fray: excellent
(9:15:19 AM) RP__: khem: I think bitbake's error handling has massively
improved thanks to Paul's work
(9:15:37 AM) khem: RP__: I agree on that it has improved
(9:15:39 AM) RP__: Or my favourite: FOO = "1 \
(9:15:43 AM) bluelightning: if I've missed anything by all means highlight
it so I can attack it :)
(9:15:48 AM) RP__: with a following blank line
(9:16:01 AM) RP__: khem: right, if you see issues, file bugs
(9:16:02 AM) bluelightning: RP__: yes that's a nice one... never realised
that was legal...
(9:16:12 AM) RP__: bluelightning: it wasn't meant to be legal
(9:16:49 AM) khem: multiline strings and multiline comments are tricky even
C compilers sucked in past on them
(9:17:38 AM) RP__: So anything else we need to talk about
(9:17:41 AM) RP__: ?
(9:17:53 AM) RP__: We should be going into a bit of a stability/bug fixing
drive now
(9:18:04 AM) bluelightning: I've got nothing, most of my long-pending
patches are getting merged finally :)
(9:18:08 AM) RP__: also,hobv2 merged
(9:18:14 AM) RP__: people should play with it :)
(9:18:25 AM) Jefro: I can chime in with one thing - the Yocto event at
Collab Summit. Philip mentioned that he'd like to have several OE folks
there.
(9:18:28 AM) fray: ahh I knew hobv2 was going in soon, but it's there now?
(9:18:31 AM) ***RP__ has a stack of patches outstanding :(
(9:18:44 AM) RP__: fray: its in
(9:18:54 AM) fray: excellent!
(9:18:56 AM) RP__: fray: run "hob"
(9:19:03 AM) khem: RP__: I have a working gcc 4.7 which is uncovering
interting bugs
(9:19:15 AM) khem: so I will post fixes as I see and fix them
(9:19:29 AM) RP__: khem: I've held off the gcc patch just yet until I can
have more of a look at it
(9:19:36 AM) khem: sure.
(9:19:48 AM) khem: I did not post 4.7 upgrade yet
(9:19:53 AM) RP__: khem: we should try and push some of these fixes direct
to the upstreams
(9:19:56 AM) khem: since I wanted the prework to first go in
(9:20:12 AM) khem: RP__: yes, true
(9:20:30 AM) RP__: khem: right, I'd really like to hold 4.7 on a branch
until after the April release
(9:20:36 AM) fray: is 4.7 "stable" release out yet?  or any idea when it
will be?
(9:20:40 AM) khem: nooo
(9:20:47 AM) khem: its a prework
(9:21:02 AM) fray: I'm almost say a toolchain layer until 4.7 can be
merged.. maybe a toolchain-next layer?
(9:21:09 AM) RP__: khem: I know but we are supposed to be entering a
stablisation window at this point
(9:21:14 AM) khem: so we can use it offficially the same day its released
and help gcc find and fix some bugs in return
(9:21:32 AM) khem: RP__: that noo was meant for fray
(9:21:57 AM) RP__: fray: I think a branch should be ok
(9:22:02 AM) fray: ya, I thought 4.7 was still too far off to consider it
for right now
(9:22:16 AM) khem: RP__: the reason I did not post 4.7 patches is same
(9:22:23 AM) bluelightning: I forgot to ask people; were there significant
discussions at ELC about oe-core/meta-oe reorg that are worth discussing
here?
(9:22:37 AM) khem: I wanted prework to be in there so folks can then use
the 4.7 branch to try it out
(9:22:40 AM) ***RP__ wasn't party to those
(9:22:56 AM) khem: bluelightning: I talked a bit
(9:22:57 AM) RP__: khem: I agree we should put it somewhere obvious so
people can try it
(9:22:59 AM) khem: with koen
(9:23:11 AM) khem: RP__: master-next ?
(9:23:17 AM) khem: oh well a contrib branch is ok too
(9:23:39 AM) bluelightning: khem: ah ok... I talked to him at FOSDEM about
it as well, took some notes... haven't had a chance to formulate a coherent
plan yet
(9:23:50 AM) khem: bluelightning: I think we should keep the discussion
about sprilling meta-oe going
(9:23:52 AM) RP__: khem: it might be appropriate for master-next, yes
(9:24:12 AM) bluelightning: khem: definitely... we have a tentative plan I
think from our existing discussion
(9:24:25 AM) bluelightning: (on the mailing list)
(9:24:30 AM) khem: I think, I did some work on oe-core/meta-oe duplication
but thats pretty much it
(9:24:55 AM) bluelightning: khem: yes I saw that, thanks for that work :)
(9:25:32 AM) khem: biggest issue is toolchain for many folks
(9:25:41 AM) khem: so I think that should be the first one to be spun out
(9:25:50 AM) RP__: khem: people want 4.5?
(9:26:01 AM) khem: RP__: angstrom stable uses it
(9:26:11 AM) khem: and angstrom uses for long cycles
(9:26:15 AM) RP__: khem: with no plans to update?
(9:26:25 AM) khem: so I am expecting it to be in use for couple of years
from now at least
(9:26:57 AM) khem: RP__: I think once meta-oe releases then there would be
a chance to have 2012 angstrom
(9:27:10 AM) bluelightning: is there still concern about arm in gcc > 4.5 ?
or was that never a serious issue?
(9:27:55 AM) khem: bluelightning: no idea. I think gcc 4.5 is stable and
angstrom does not like to tinker with toolchain too much
(9:28:08 AM) bluelightning: ok
(9:28:33 AM) fray: but would anyone use 4.5 with an updated oe-core?
(9:28:46 AM) fray: I'd expect that if you stay with an older toolchain,
you'd also stay with an older oe-core/angstrom
(9:28:51 AM) bluelightning: fray: well, angstrom does right now...
(9:28:51 AM) khem: so far angstrom  has been doing that yes
(9:29:12 AM) khem: usually its not a problem
(9:29:17 AM) fray: that very well could be a distro choice, so we need to
enable the ability to do it.. but do we need it in oe-core itself?
(9:29:39 AM) khem: its not in oe-core
(9:29:44 AM) khem: its in meta-oe
(9:29:49 AM) fray: ohh ok, I misunderstood then
(9:30:02 AM) khem: same is true for eglibc 2.12
(9:30:13 AM) bluelightning: fray: it's in meta-oe, but what would make it
easier is if it was in its own layer (which may well be in the
meta-openembedded repo still)
(9:30:27 AM) fray: yes, I agree..
(9:30:29 AM) khem: and I would love to see X11 from meta-oe/oe-core merge
(9:30:44 AM) fray: at Wind River we have a tendency to make our toolchains
into layers, so they are easily replacable (upgradeable)..
(9:31:12 AM) khem: fray: yes we should have done it to start with but we
were so new to layers we were afraid of them :)
(9:31:42 AM) RP__: khem: X11?
(9:31:45 AM) fray: well there is the fine line between not enough layers
and too many.. ;)
(9:31:51 AM) RP__: khem: I thought we had most X11 things sorted now?
(9:32:07 AM) fray: I didn't realize that meta-oe had anything unique for
X11 anymore..
(9:32:18 AM) RP__: I think splitting the toolchain pieces in meta-oe apart
is a fine idea and nobody seems to object to that :)
(9:32:20 AM) fray: I thought it had been merged, other then a few utilities
(9:33:37 AM) khem: I tried core-image-sato build with meta-oe enabled
(9:33:40 AM) khem: did not work
(9:34:07 AM) RP__: khem: hmm, any idea what the issue was
(9:34:11 AM) khem: so I vehemently blamed it
(9:34:14 AM) RP__: we need to find and deal with things like this
(9:34:46 AM) khem: RP__: yes, we should but then something else pops up :)
(9:34:50 AM) fray: yes..  we should probably have someone look into meta-oe
and plan for a merge if reasonable..  or at least identify issues like this
(9:35:11 AM) khem: my point is it should be easily overlayed on oe-core and
not regress oe-core
(9:36:13 AM) RP__: khem: agreed, just need someone with some time to look
at it
(9:36:17 AM) fray: yes
(9:36:30 AM) khem: bluelightning: will you send follow up to the layer
split discussions of your meeting at FOSDEM
(9:36:43 AM) bluelightning: khem: will do yes
(9:36:57 AM) khem: that should get us some  further in decision process
(9:37:21 AM) bluelightning: khem: I think we should just press ahead on the
toolchain split out though
(9:37:35 AM) RP__: As the TSC, I think we can agree that?
(9:37:39 AM) khem: bluelightning: yeah
(9:38:03 AM) fray: yes
(9:38:05 AM) ***Jefro listens for detractors
(9:38:16 AM) khem: ok.
(9:38:45 AM) khem: Jefro: when/where is Collab Summit
(9:38:54 AM) Jefro: Collab Summit is April 3-5 in San Francisco
(9:39:07 AM) Jefro: there will be a Yocto working day all day on Weds Apr 4
(9:39:21 AM) Jefro: Collab is invitation-only- I am working to secure a
certain number of invitations
(9:39:22 AM) khem: ok and thats in Fremont ?
(9:39:40 AM) Jefro: no - there is also an invitation-only Yocto BSP Summit
in Fremont, that is on April 2
(9:39:48 AM) khem: Jefro: extend to me if you have spare :)
(9:40:00 AM) Jefro: khem I will definitely try
(9:40:09 AM) khem: both yocto/collab that is
(9:40:22 AM) khem: oh brb
(9:40:55 AM) RP__: The bsp summit is to try and get everyone on the same
page around BSPs and layers, the various definitions and so on
(9:41:21 AM) bluelightning: hmm that would be interesting...
(9:41:39 AM) RP__: if the yocto people can't reach a consensus amongst
themselves it seems crazy to involve more people in the discussion
(9:41:39 AM) Jefro: bluelightning you should have gotten an invitation. any
chance you'll be in town?
(9:41:56 AM) RP__: I don't think there is that much of an issue, just need
to get people together and spend some time talking through what we have
today
(9:42:02 AM) RP__: and then see where things go
(9:43:04 AM) bluelightning: Jefro: I'm not sure... I need to check if I'm
available, and also would depend on travel approval
(9:43:17 AM) Jefro: yes, travel will be a problem
(9:44:03 AM) Jefro: I'm planning to at least record parts of the event.
Will also talk to Mentor to see if we can let people join via webex, but
interactive participation would be limited.
(9:46:00 AM) Jefro: any other items?
(9:46:21 AM) bluelightning: khem's still afk I think
(9:46:33 AM) RP__: nothing from me
(9:46:43 AM) bluelightning: nothing from me either

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--bcaec51a76e050f4c904bb9fcd8f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><div><div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"a=
rial, sans-serif"><span class=3D"Apple-style-span" style=3D"border-collapse=
:collapse">OpenEmbedded Technical Steering Committee</span></font></div><di=
v><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-se=
rif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">28=
 February, 2012</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">Attending: Khem, Richard, Mark, Paul</span></font=
></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>Apologies: Tom</span></font></div><div><font class=3D"Apple-style-span" co=
lor=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span"=
 style=3D"border-collapse:collapse">Minutes: Jefro</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">________________________________________________<=
/span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>Agenda</span></font></div><div><font class=3D"Apple-style-span" color=3D"#=
222222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=
=3D"border-collapse:collapse"><br>
</span></font></div><div><font class=3D"Apple-style-span" color=3D"#222222"=
 face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"borde=
r-collapse:collapse">1. pick a chair</span></font></div><div><font class=3D=
"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=
=3D"Apple-style-span" style=3D"border-collapse:collapse">=A0 =A0RP (by defa=
ult)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">2. open issues</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>=A0 =A0resolved at ELC, only status is left</span></font></div><div><font =
class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><sp=
an class=3D"Apple-style-span" style=3D"border-collapse:collapse"><br>
</span></font></div><div><font class=3D"Apple-style-span" color=3D"#222222"=
 face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"borde=
r-collapse:collapse">3. status</span></font></div><div><font class=3D"Apple=
-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Ap=
ple-style-span" style=3D"border-collapse:collapse"><br>
</span></font></div><div><font class=3D"Apple-style-span" color=3D"#222222"=
 face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"borde=
r-collapse:collapse">=A0 =A0a. oe-core</span></font></div><div><font class=
=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span cl=
ass=3D"Apple-style-span" style=3D"border-collapse:collapse">=A0 =A0 =A0 lot=
s of churn, patches coming in heavily</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>=A0 =A0 =A0 RP thinks most things merged</span></font></div><div><font cla=
ss=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span =
class=3D"Apple-style-span" style=3D"border-collapse:collapse"><br>
</span></font></div><div><font class=3D"Apple-style-span" color=3D"#222222"=
 face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"borde=
r-collapse:collapse">=A0 =A0b. python 3 transition</span></font></div><div>=
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">=A0 =
=A0 =A0 going slowly</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">=A0 =A0c. bitbake quoting fix merged, now enforce=
 syntax, e.g. FOO =3D &quot;1&quot;</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">=A0 =A0d. khem worked on some wiki pages last wee=
k</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">=A0 =A0e. hobv2 merged, please play with it</span=
></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">=A0 =A0f. 4.7 upgrade not yet posted (khem), hold=
 until after April release</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">=A0 =A0g. agreement on toolchain issue:</span></f=
ont></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>=A0 =A0 =A0 toolchains not in oe-core will be split out into their own lay=
ers,</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>=A0 =A0 =A0 including toolchains in meta-oe</span></font></div><div><font =
class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><sp=
an class=3D"Apple-style-span" style=3D"border-collapse:collapse"><br>
</span></font></div><div><font class=3D"Apple-style-span" color=3D"#222222"=
 face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"borde=
r-collapse:collapse">=A0 =A0h. collab summit, bsp summit</span></font></div=
><div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, san=
s-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse=
">=A0 =A0 =A0 coming up in April</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
><br></span></font></div><div><font class=3D"Apple-style-span" color=3D"#22=
2222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"=
border-collapse:collapse">________________________________________________<=
/span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>Raw Transcript</span></font></div><div><font class=3D"Apple-style-span" co=
lor=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span"=
 style=3D"border-collapse:collapse"><br>
</span></font></div><div><font class=3D"Apple-style-span" color=3D"#222222"=
 face=3D"arial, sans-serif"><span class=3D"Apple-style-span" style=3D"borde=
r-collapse:collapse">(9:00:04 AM) bluelightning: hi folks</span></font></di=
v><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:0=
2:12 AM) RP__: hi bluelightning</span></font></div><div><font class=3D"Appl=
e-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"A=
pple-style-span" style=3D"border-collapse:collapse">(9:02:16 AM) RP__: hi k=
hem</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:02:19 AM) RP__: fray: ping?</span></font></div><div><font class=3D"Appl=
e-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"A=
pple-style-span" style=3D"border-collapse:collapse">(9:02:35 AM) khem: hi R=
P__</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:02:37 AM) RP__: I think I saw an email saying Tom couldn&#39;t make it?=
</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:02:38 AM) fray: hey I&#39;m here..</span></font></div><div><font class=
=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span cl=
ass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:02:44 AM) fr=
ay: ya, he&#39;s out</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:02:48 AM) khem: I will grab a cup of tea</span></font></div><div><font =
class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><sp=
an class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:02:57 A=
M) RP__: cool, we have everyone who will be here then</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:02:58 AM) khem: too many police officers on road today :)</span></font>=
</div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:03:32 AM) ***fray is really sick last couple of days.. at least the roo=
m stopped spinning finally</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:03:45 AM) ***fray &#39;s temper is a bit short though.. :(</span></font=
></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:04:49 AM) RP__: fray: Sorry to hear that, I hope you have a swift recov=
ery</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:05:00 AM) RP__: Jefro: do we have an agenda?</span></font></div><div><f=
ont class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"=
><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:05:=
18 AM) fray: so do I.. I&#39;m supposed to give an intro to Yocto talk and =
hands-on w/ Poky class at RTECC in Dallas next tuesday.. :P</span></font></=
div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:06:15 AM) RP__: fray: I&#39;m just getting stressed out by the amount o=
f stuff I need to do before I go away on Saturday</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:06:35 AM) ***RP__ found water all over the garage floor before. Seems t=
o be coming from the Daytona which is scary</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:06:45 AM) fray: I understand.. I was supposed to have the hard drive pr=
epared for imaging yesterday..</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:06:54 AM) RP__: Does anyone have topics for discussion?</span></font></=
div><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:0=
6:57 AM) fray: needless to say, I&#39;m still working on it.. (I was comple=
tely useless on Sunday and Montday)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:07:00 AM) fray: I don&#39;t have anything</span></font></div><div><font=
 class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><s=
pan class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:07:15 =
AM) fray: did we want to mention the wiki day? =A0(do we want to schedule t=
hat yet?)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:07:24 AM) khem: I dont have any pressing topics</span></font></div><div=
><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-ser=
if"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:=
07:28 AM) RP__: I think it would be good to give people some notice</span><=
/font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:07:37 AM) RP__: Sometime after next week though! ;-)</span></font></div=
><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:0=
7:41 AM) khem: 2 weeks would be good time</span></font></div><div><font cla=
ss=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span =
class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:07:43 AM) =
fray: yes</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:07:57 AM) fray: we said mid march in the ELC meetings</span></font></di=
v><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:0=
8:12 AM) RP__: so that all approximately fits together</span></font></div><=
div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-=
serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">=
(9:08:22 AM) RP__: who is going to send out a proposal?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:08:51 AM) bluelightning: I can do it</span></font></div><div><font clas=
s=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span c=
lass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:09:55 AM) J=
efro: sorry - fell of the net again (*)&amp;%</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:10:00 AM) RP__: bluelightning: thanks</span></font></div><div><font cla=
ss=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span =
class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:10:20 AM) =
Jefro: we actually fulfilled the major topics at the f2f, status is all we =
have to discuss today</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:10:28 AM) RP__: Jefro: thanks</span></font></div><div><font class=3D"Ap=
ple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D=
"Apple-style-span" style=3D"border-collapse:collapse">(9:10:40 AM) RP__: We=
&#39;ve had a lot of churn with the patches coming in rather heavily</span>=
</font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:10:45 AM) RP__: I think most things have merged</span></font></div><div=
><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-ser=
if"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:=
11:00 AM) RP__: I know there are some patches from Khem I&#39;ve not taken =
yet and need to discuss in more detail</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:11:39 AM) RP__: There are some cleanups I would like to make such as th=
e &quot;, 1&quot; -&gt; &quot;, True&quot; substituition, use appendVar in =
places and so on</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:06 AM) khem: RP__: is there plan to go for python 3.x for bitbake</s=
pan></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:08 AM) RP__: I don&#39;t seem to manage to find time to get to those=
 though and a merge window is a bad time due to the amount of patches that =
would fail to apply</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:18 AM) fray: yup</span></font></div><div><font class=3D"Apple-style-=
span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-sty=
le-span" style=3D"border-collapse:collapse">(9:12:30 AM) RP__: khem: we&#39=
;ve done a lot of the ground work so far</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:36 AM) RP__: khem: so its being worked on slowly</span></font></div>=
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:49 AM) khem: ok.</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:50 AM) fray: we should investigate bitbake w/ python 3 after the cur=
rent release cycle..</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:12:59 AM) fray: just to get any idea how close (or not) we are..</span>=
</font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:13:24 AM) ***RP__ agrees</span></font></div><div><font class=3D"Apple-s=
tyle-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Appl=
e-style-span" style=3D"border-collapse:collapse">(9:13:33 AM) RP__: I also =
merged the bitbake quoting fix</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:13:44 AM) RP__: nbbody was going to fix things until I did :/</span></f=
ont></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:14:02 AM) fray: which quoting fix?</span></font></div><div><font class=
=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span cl=
ass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:14:11 AM) **=
*bluelightning has already added a note on quoting to the metadata migratio=
n wiki page, FYI</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:14:21 AM) khem: Generally bitbake&#39;s error recovery sucks a bit imo<=
/span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:14:38 AM) khem: I did touch some wiki page&#39;s last week</span></font=
></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:14:48 AM) khem: to mention about oe-core/oe-dev</span></font></div><div=
><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-ser=
if"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:=
14:54 AM) RP__: fray: We now enforce FOO =3D &quot;1&quot;</span></font></d=
iv>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:14:56 AM) bluelightning: khem: I&#39;d like to think we&#39;ve improved=
 error handling quite a bit lately, are there any outstanding error situati=
ons you can point to?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:14:57 AM) khem: one of the page was getting started page</span></font><=
/div><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:1=
5:01 AM) fray: ahh ok</span></font></div><div><font class=3D"Apple-style-sp=
an" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-style=
-span" style=3D"border-collapse:collapse">(9:15:02 AM) RP__: fray: FOO =3D =
1 wont&#39; work</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:15:13 AM) fray: excellent</span></font></div><div><font class=3D"Apple-=
style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"App=
le-style-span" style=3D"border-collapse:collapse">(9:15:19 AM) RP__: khem: =
I think bitbake&#39;s error handling has massively improved thanks to Paul&=
#39;s work</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:15:37 AM) khem: RP__: I agree on that it has improved</span></font></di=
v><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:1=
5:39 AM) RP__: Or my favourite: FOO =3D &quot;1 \</span></font></div><div><=
font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif=
"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:15=
:43 AM) bluelightning: if I&#39;ve missed anything by all means highlight i=
t so I can attack it :)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:15:48 AM) RP__: with a following blank line</span></font></div><div><fo=
nt class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif">=
<span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:16:0=
1 AM) RP__: khem: right, if you see issues, file bugs</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:16:02 AM) bluelightning: RP__: yes that&#39;s a nice one... never reali=
sed that was legal...</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:16:12 AM) RP__: bluelightning: it wasn&#39;t meant to be legal</span></=
font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:16:49 AM) khem: multiline strings and multiline comments are tricky eve=
n C compilers sucked in past on them</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:17:38 AM) RP__: So anything else we need to talk about</span></font></d=
iv><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:1=
7:41 AM) RP__: ?</span></font></div><div><font class=3D"Apple-style-span" c=
olor=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-style-span=
" style=3D"border-collapse:collapse">(9:17:53 AM) RP__: We should be going =
into a bit of a stability/bug fixing drive now</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:18:04 AM) bluelightning: I&#39;ve got nothing, most of my long-pending =
patches are getting merged finally :)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:18:08 AM) RP__: also,hobv2 merged</span></font></div><div><font class=
=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span cl=
ass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:18:14 AM) RP=
__: people should play with it :)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:18:25 AM) Jefro: I can chime in with one thing - the Yocto event at Col=
lab Summit. Philip mentioned that he&#39;d like to have several OE folks th=
ere.</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:18:28 AM) fray: ahh I knew hobv2 was going in soon, but it&#39;s there =
now?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:18:31 AM) ***RP__ has a stack of patches outstanding :(</span></font></=
div><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:1=
8:44 AM) RP__: fray: its in</span></font></div><div><font class=3D"Apple-st=
yle-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple=
-style-span" style=3D"border-collapse:collapse">(9:18:54 AM) fray: excellen=
t!</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:18:56 AM) RP__: fray: run &quot;hob&quot;</span></font></div><div><font=
 class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><s=
pan class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:19:03 =
AM) khem: RP__: I have a working gcc 4.7 which is uncovering interting bugs=
</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:19:15 AM) khem: so I will post fixes as I see and fix them</span></font=
></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:19:29 AM) RP__: khem: I&#39;ve held off the gcc patch just yet until I =
can have more of a look at it</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:19:36 AM) khem: sure.</span></font></div><div><font class=3D"Apple-styl=
e-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-s=
tyle-span" style=3D"border-collapse:collapse">(9:19:48 AM) khem: I did not =
post 4.7 upgrade yet</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:19:53 AM) RP__: khem: we should try and push some of these fixes direct=
 to the upstreams</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:19:56 AM) khem: since I wanted the prework to first go in</span></font>=
</div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:20:12 AM) khem: RP__: yes, true</span></font></div><div><font class=3D"=
Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=
=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:20:30 AM) RP__:=
 khem: right, I&#39;d really like to hold 4.7 on a branch until after the A=
pril release</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:20:36 AM) fray: is 4.7 &quot;stable&quot; release out yet? =A0or any id=
ea when it will be?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:20:40 AM) khem: nooo</span></font></div><div><font class=3D"Apple-style=
-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-st=
yle-span" style=3D"border-collapse:collapse">(9:20:47 AM) khem: its a prewo=
rk</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:21:02 AM) fray: I&#39;m almost say a toolchain layer until 4.7 can be m=
erged.. maybe a toolchain-next layer?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:21:09 AM) RP__: khem: I know but we are supposed to be entering a stabl=
isation window at this point</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:21:14 AM) khem: so we can use it offficially the same day its released =
and help gcc find and fix some bugs in return</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:21:32 AM) khem: RP__: that noo was meant for fray</span></font></div><d=
iv><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-s=
erif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(=
9:21:57 AM) RP__: fray: I think a branch should be ok</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:02 AM) fray: ya, I thought 4.7 was still too far off to consider it =
for right now</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:16 AM) khem: RP__: the reason I did not post 4.7 patches is same</sp=
an></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:23 AM) bluelightning: I forgot to ask people; were there significant=
 discussions at ELC about oe-core/meta-oe reorg that are worth discussing h=
ere?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:37 AM) khem: I wanted prework to be in there so folks can then use t=
he 4.7 branch to try it out</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:40 AM) ***RP__ wasn&#39;t party to those</span></font></div><div><fo=
nt class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif">=
<span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:22:5=
6 AM) khem: bluelightning: I talked a bit</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:57 AM) RP__: khem: I agree we should put it somewhere obvious so peo=
ple can try it</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:22:59 AM) khem: with koen</span></font></div><div><font class=3D"Apple-=
style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"App=
le-style-span" style=3D"border-collapse:collapse">(9:23:11 AM) khem: RP__: =
master-next ?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:23:17 AM) khem: oh well a contrib branch is ok too</span></font></div><=
div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-=
serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">=
(9:23:39 AM) bluelightning: khem: ah ok... I talked to him at FOSDEM about =
it as well, took some notes... haven&#39;t had a chance to formulate a cohe=
rent plan yet</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:23:50 AM) khem: bluelightning: I think we should keep the discussion ab=
out sprilling meta-oe going</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:23:52 AM) RP__: khem: it might be appropriate for master-next, yes</spa=
n></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:24:12 AM) bluelightning: khem: definitely... we have a tentative plan I=
 think from our existing discussion</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:24:25 AM) bluelightning: (on the mailing list)</span></font></div><div>=
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:2=
4:30 AM) khem: I think, I did some work on oe-core/meta-oe duplication but =
thats pretty much it</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:24:55 AM) bluelightning: khem: yes I saw that, thanks for that work :)<=
/span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:25:32 AM) khem: biggest issue is toolchain for many folks</span></font>=
</div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:25:41 AM) khem: so I think that should be the first one to be spun out<=
/span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:25:50 AM) RP__: khem: people want 4.5?</span></font></div><div><font cl=
ass=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span=
 class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:26:01 AM)=
 khem: RP__: angstrom stable uses it</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:26:11 AM) khem: and angstrom uses for long cycles</span></font></div><d=
iv><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-s=
erif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(=
9:26:15 AM) RP__: khem: with no plans to update?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:26:25 AM) khem: so I am expecting it to be in use for couple of years f=
rom now at least</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:26:57 AM) khem: RP__: I think once meta-oe releases then there would be=
 a chance to have 2012 angstrom</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:27:10 AM) bluelightning: is there still concern about arm in gcc &gt; 4=
.5 ? or was that never a serious issue?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:27:55 AM) khem: bluelightning: no idea. I think gcc 4.5 is stable and a=
ngstrom does not like to tinker with toolchain too much</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:28:08 AM) bluelightning: ok</span></font></div><div><font class=3D"Appl=
e-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"A=
pple-style-span" style=3D"border-collapse:collapse">(9:28:33 AM) fray: but =
would anyone use 4.5 with an updated oe-core?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:28:46 AM) fray: I&#39;d expect that if you stay with an older toolchain=
, you&#39;d also stay with an older oe-core/angstrom</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:28:51 AM) bluelightning: fray: well, angstrom does right now...</span><=
/font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:28:51 AM) khem: so far angstrom =A0has been doing that yes</span></font=
></div><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:2=
9:12 AM) khem: usually its not a problem</span></font></div><div><font clas=
s=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span c=
lass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:29:17 AM) f=
ray: that very well could be a distro choice, so we need to enable the abil=
ity to do it.. but do we need it in oe-core itself?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:29:39 AM) khem: its not in oe-core</span></font></div><div><font class=
=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span cl=
ass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:29:44 AM) kh=
em: its in meta-oe</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:29:49 AM) fray: ohh ok, I misunderstood then</span></font></div><div><f=
ont class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"=
><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:30:=
02 AM) khem: same is true for eglibc 2.12</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:30:13 AM) bluelightning: fray: it&#39;s in meta-oe, but what would make=
 it easier is if it was in its own layer (which may well be in the meta-ope=
nembedded repo still)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:30:27 AM) fray: yes, I agree..</span></font></div><div><font class=3D"A=
pple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=
=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:30:29 AM) khem:=
 and I would love to see X11 from meta-oe/oe-core merge</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:30:44 AM) fray: at Wind River we have a tendency to make our toolchains=
 into layers, so they are easily replacable (upgradeable)..</span></font></=
div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:31:12 AM) khem: fray: yes we should have done it to start with but we w=
ere so new to layers we were afraid of them :)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:31:42 AM) RP__: khem: X11?</span></font></div><div><font class=3D"Apple=
-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Ap=
ple-style-span" style=3D"border-collapse:collapse">(9:31:45 AM) fray: well =
there is the fine line between not enough layers and too many.. ;)</span></=
font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:31:51 AM) RP__: khem: I thought we had most X11 things sorted now?</spa=
n></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:32:07 AM) fray: I didn&#39;t realize that meta-oe had anything unique f=
or X11 anymore..</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:32:18 AM) RP__: I think splitting the toolchain pieces in meta-oe apart=
 is a fine idea and nobody seems to object to that :)</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:32:20 AM) fray: I thought it had been merged, other then a few utilitie=
s</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:33:37 AM) khem: I tried core-image-sato build with meta-oe enabled</spa=
n></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:33:40 AM) khem: did not work</span></font></div><div><font class=3D"App=
le-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"=
Apple-style-span" style=3D"border-collapse:collapse">(9:34:07 AM) RP__: khe=
m: hmm, any idea what the issue was</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:34:11 AM) khem: so I vehemently blamed it</span></font></div><div><font=
 class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><s=
pan class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:34:14 =
AM) RP__: we need to find and deal with things like this</span></font></div=
>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:34:46 AM) khem: RP__: yes, we should but then something else pops up :)=
</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:34:50 AM) fray: yes.. =A0we should probably have someone look into meta=
-oe and plan for a merge if reasonable.. =A0or at least identify issues lik=
e this</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:35:11 AM) khem: my point is it should be easily overlayed on oe-core an=
d not regress oe-core</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:36:13 AM) RP__: khem: agreed, just need someone with some time to look =
at it</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:36:17 AM) fray: yes</span></font></div><div><font class=3D"Apple-style-=
span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-sty=
le-span" style=3D"border-collapse:collapse">(9:36:30 AM) khem: bluelightnin=
g: will you send follow up to the layer split discussions of your meeting a=
t FOSDEM</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:36:43 AM) bluelightning: khem: will do yes</span></font></div><div><fon=
t class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><=
span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:36:57=
 AM) khem: that should get us some =A0further in decision process</span></f=
ont></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:37:21 AM) bluelightning: khem: I think we should just press ahead on th=
e toolchain split out though</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:37:35 AM) RP__: As the TSC, I think we can agree that?</span></font></d=
iv><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:3=
7:39 AM) khem: bluelightning: yeah</span></font></div><div><font class=3D"A=
pple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=
=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:38:03 AM) fray:=
 yes</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:38:05 AM) ***Jefro listens for detractors</span></font></div><div><font=
 class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><s=
pan class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:38:16 =
AM) khem: ok.</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:38:45 AM) khem: Jefro: when/where is Collab Summit</span></font></div><=
div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-=
serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">=
(9:38:54 AM) Jefro: Collab Summit is April 3-5 in San Francisco</span></fon=
t></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:39:07 AM) Jefro: there will be a Yocto working day all day on Weds Apr =
4</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:39:21 AM) Jefro: Collab is invitation-only- I am working to secure a ce=
rtain number of invitations</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:39:22 AM) khem: ok and thats in Fremont ?</span></font></div><div><font=
 class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><s=
pan class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:39:40 =
AM) Jefro: no - there is also an invitation-only Yocto BSP Summit in Fremon=
t, that is on April 2</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:39:48 AM) khem: Jefro: extend to me if you have spare :)</span></font><=
/div><div>
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:4=
0:00 AM) Jefro: khem I will definitely try</span></font></div><div><font cl=
ass=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span=
 class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:40:09 AM)=
 khem: both yocto/collab that is</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:40:22 AM) khem: oh brb</span></font></div><div><font class=3D"Apple-sty=
le-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=3D"Apple-=
style-span" style=3D"border-collapse:collapse">(9:40:55 AM) RP__: The bsp s=
ummit is to try and get everyone on the same page around BSPs and layers, t=
he various definitions and so on</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:41:21 AM) bluelightning: hmm that would be interesting...</span></font>=
</div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:41:39 AM) RP__: if the yocto people can&#39;t reach a consensus amongst=
 themselves it seems crazy to involve more people in the discussion</span><=
/font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:41:39 AM) Jefro: bluelightning you should have gotten an invitation. an=
y chance you&#39;ll be in town?</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:41:56 AM) RP__: I don&#39;t think there is that much of an issue, just =
need to get people together and spend some time talking through what we hav=
e today</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:42:02 AM) RP__: and then see where things go</span></font></div><div><f=
ont class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"=
><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:43:=
04 AM) bluelightning: Jefro: I&#39;m not sure... I need to check if I&#39;m=
 available, and also would depend on travel approval</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:43:17 AM) Jefro: yes, travel will be a problem</span></font></div><div>=
<font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-seri=
f"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:4=
4:03 AM) Jefro: I&#39;m planning to at least record parts of the event. Wil=
l also talk to Mentor to see if we can let people join via webex, but inter=
active participation would be limited.</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:46:00 AM) Jefro: any other items?</span></font></div><div><font class=
=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span cl=
ass=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:46:21 AM) bl=
uelightning: khem&#39;s still afk I think</span></font></div>
<div><font class=3D"Apple-style-span" color=3D"#222222" face=3D"arial, sans=
-serif"><span class=3D"Apple-style-span" style=3D"border-collapse:collapse"=
>(9:46:33 AM) RP__: nothing from me</span></font></div><div><font class=3D"=
Apple-style-span" color=3D"#222222" face=3D"arial, sans-serif"><span class=
=3D"Apple-style-span" style=3D"border-collapse:collapse">(9:46:43 AM) bluel=
ightning: nothing from me either</span></font></div>
</div></div><div style=3D"border-collapse:collapse;color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:13px"><br></div>-- <br>Jeff Osier-Mixon =
<a href=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/blog</=
a><div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>

--bcaec51a76e050f4c904bb9fcd8f--
