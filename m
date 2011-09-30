Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1R9hhG-0000SS-IL; Fri, 30 Sep 2011 20:20:31 +0200
Received: by iadx2 with SMTP id x2so2207478iad.6
	for <multiple recipients>; Fri, 30 Sep 2011 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=TO7z5eMLidk8SHUV9HhT9t0dBRGsTK4ZSmtCQ8ra3W0=;
	b=m1GN2wuA5c73hc0dcGz2n8kup4XgRKJQgpkANPvXtB3bdc5YFJzFHBfKCcyfS64F6E
	K97KolwBBkpOT4d3XnCDiqzYU6TZFzOv3Mn1RXRR6VpM5YsbS2+FCUgcg4hm+jkSNwHv
	j9ZBtFIGpt/qfZf3wBxg5PpyCeug0JglLwntM=
MIME-Version: 1.0
Received: by 10.42.144.67 with SMTP id a3mr3176732icv.104.1317406498993; Fri,
	30 Sep 2011 11:14:58 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.240.8 with HTTP; Fri, 30 Sep 2011 11:14:58 -0700 (PDT)
Date: Fri, 30 Sep 2011 11:14:58 -0700
X-Google-Sender-Auth: kSzBaSqtH_oacr9W9soFU6u5eSk
Message-ID: <CA+YB3rZ0JEq2zY21kiQmUx3YFj6CYHoR0Pvg6O70UM=Mh1TN+Q@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 29-Sep-2011
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
X-List-Received-Date: Fri, 30 Sep 2011 18:20:31 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e856a65b78004ae2c9a46

--90e6ba6e856a65b78004ae2c9a46
Content-Type: text/plain; charset=ISO-8859-1

These minutes will be available soon on the OE wiki

MINUTES: OE-TSC meeting 29-Sep-2011

Attending: Mark, Richard, Khem
Apologies: Tom, Koen
Notes: Jefro

--------------------------------------------------------
Agenda

1. pick a moderator
2. agenda items
   a. continuing minutes issues
   b. patchwork replacement
   c. patches to classic OE, tracking into layers?

3. status on open subjects
   a. release
   b. git

--------------------------------------------------------
1. Jefro

2. a. some minutes not making it to mailing list, Jefro to post on wiki
   b. yocto evaluating gerrit, possible patchwork replacement for OE, khem
will research
   c. acknowledged need for more resources, oe-core being tracked well

3. a. release coming together
   b. git moving to its final destination we expect no use visible problems
except for RP
      khem ok's RPs changes, fray hasn't looked yet

--------------------------------------------------------
Raw Transcript

(12:57:11 PM) khem: I have to be go at 1:30 though which is half way
(1:04:28 PM) khem: koen is travelling last time he said
(1:04:42 PM) khem: but I dont remember if he was to be back today
(1:04:44 PM) fray: sorry I'm late.. just got home
(1:04:45 PM) khem: or wednesday
(1:05:06 PM) fray: (was at ESC Boston giving a Yocto presentation... and yes
I mentioned oe and oe-core as well)  ;)
(1:05:20 PM) khem: hello fray
(1:05:32 PM) khem: how was ESC
(1:05:35 PM) ***RP__ has put off some stuff to be here now so I hope this is
going to be worthwhile...
(1:05:51 PM) RP__: Jefro: Did you manage to get wiki admin rights?
(1:06:02 PM) RP__: well, edit rights even
(1:06:10 PM) khem: RP__: is it for oe.wiki
(1:06:13 PM) Jefro: RP__ not yet - still working on that
(1:06:17 PM) RP__: khem: yes
(1:06:20 PM) Jefro: khem do you happen to have admin rights?
(1:06:30 PM) RP__: Jefro: You could ask khem/fray ;-)
(1:06:33 PM) khem: Jeffro, I dont think so
(1:06:37 PM) RP__: and someone could bump me whilst they're at it
(1:06:40 PM) RP__: khem: you do
(1:06:55 PM) fray: I don't have admin rights either..
(1:06:57 PM) khem: Jefro: but I do have some super cow powers
(1:07:19 PM) khem: so Jefro needs to be added ?
(1:07:34 PM) RP__:
http://wiki.openembedded.org/index.php?title=Special:ListUsers&group=bureaucrat
(1:07:36 PM) Jefro: I have an account, I just need to have editing/creating
rights
(1:07:46 PM) Jefro: and Richard needs to have his rights bumped
(1:07:47 PM) khem: ok
(1:07:53 PM) fray: for editing Khem found the right person to bump me up
(1:07:57 PM) khem: I can take it to next level
(1:08:00 PM) khem: consider it done
(1:08:00 PM) Jefro: if you think he is trustworthy, that is
(1:08:10 PM) RP__: khem: can you bump me whilst you're in there please
(1:08:13 PM) Jefro: khem awesome, thanks
(1:08:32 PM) RP__: people keep asking me for things...
(1:08:42 PM) khem: RP__: if I figure out yes
(1:09:45 PM) Jefro: with three people there is a quorum, do you guys want to
meet?
(1:09:50 PM) RP__: ok, so we have enough for a quorum but we lose khem in 20
mins
(1:09:58 PM) RP__: what do we need to talk about?
(1:10:07 PM) Jefro: better be a quick one.  agenda items?
(1:10:27 PM) RP__: I think Phil's question about minutes and so forth needs
an answer. I think Jefro is on that and my thanks for taking care of it :)
(1:11:02 PM) RP__: The release seems to be coming together and I'm feeling
better about the quality
(1:11:04 PM) fray: I thought we had released all of the minutes for the
meetings we -did- have.. there were a number where we didn't achive quorum
(1:11:12 PM) khem: Jefro whats your login
(1:11:13 PM) RP__: I'm trying to communicate the situation better on the
mailing lists
(1:11:18 PM) RP__: summaries and so on
(1:11:23 PM) Jefro: RP__ yes, I am ready to post all the minutes since
March, just need a login.  khem:  Jefro
(1:11:59 PM) Jefro: there are two instances where email I sent to the lists
didn't get disseminated
(1:11:59 PM) RP__: fray: I don't think they've been making the lists. Jefro
needs to figure out why. You're not posting to the lists@linuxtogo.org address
are you?
(1:12:26 PM) Jefro: it was either pilot error on my part, or something
clogged in the ethertubes.  I post to..
(1:13:03 PM) Jefro: openembedded-core <
openembedded-core@lists.openembedded.org>,
(1:13:03 PM) Jefro: openembedded-devel@lists.openembedded.org,
(1:13:03 PM) Jefro: tsc <tsc@lists.openembedded.org>
(1:13:29 PM) RP__: those should be fine
(1:13:38 PM) RP__: posting from the address you're subbed with?
(1:13:47 PM) Jefro: yes:  jefro@jefro.net
(1:14:29 PM) RP__: Jefro: dunno then. we need to watch this though
(1:14:44 PM) Jefro: the two that appear to be missing from the lists are in
my Sent box, so make of that what you will.  (as official signed-off
versions) I will be adding them to the wiki from here on out, and will
double-check the archive each week to make sure it has gone out.
(1:15:00 PM) Jefro: I have had mysterious email issues before. Maybe I
pissed off the google gods.
(1:15:15 PM) fray: ...maybe google doesn't like OE?  ;)
(1:15:55 PM) khem: I would like to bring up have patchwork replaced with
something
(1:16:53 PM) Jefro: I have an AR to make sure minutes are settled & will
report back next week.  Should we move to khem's issues with patchwork?
(1:17:03 PM) fray: ya
(1:17:11 PM) khem: Jefro: you should be good with wiki now
(1:17:23 PM) RP__: Yocto people plan to evaluate gerrit
(1:17:54 PM) RP__: we're waiting on sysadmin resources to set it up. We've
spent out sysadmin credit getting the kernel.org/linuxfoundation server mess
resoled
(1:17:58 PM) khem: since we are moving the OE services to a new server it
could be that we drop patchwork and not go through hassles of setting it up
(1:17:58 PM) RP__: resolved
(1:19:06 PM) khem: koen uses patchwork for his maintenance activity so some
alternative would be nice to have
(1:19:25 PM) khem: ok gerrit seems a plausible thing
(1:19:54 PM) khem: I have not used it thus far but may be we should plan on
setting some pilot project using it
(1:20:26 PM) RP__: khem: that is yocto's plan
(1:20:53 PM) khem: RP__: ok
(1:21:39 PM) fray: just from an OE admin resources point of view.. does it
make sense to let the Yocto folks get it going there and then see if it's
useful and bring it into OE if it is?  (or do we not want to wait on Yocto
to do a first pilot?)
(1:22:11 PM) khem: depends when yocto has pilots going
(1:22:21 PM) khem: I would prefer something soon
(1:22:38 PM) ***RP__ suspects it would be early novemeber
(1:22:53 PM) RP__: release takes preference right now
(1:22:59 PM) khem: ok
(1:23:19 PM) khem: I will read about it in coming days
(1:23:24 PM) khem: just to understand the beast
(1:24:07 PM) RP__: khem: sounds like a plan
(1:24:14 PM) RP__: Anything else we need to touch upon?
(1:25:05 PM) khem: RP__: folks post patches to oe against classic oe tree I
dont know if we are doing a good job of tracking them into layers
(1:25:44 PM) RP__: khem: I'm only tracking oe-core atm, not enough bandwidth
to do more
(1:26:21 PM) fray: likewise, for the most part I'm tracking oe-core, and
specific other things I notice like prelink and toolchain issues..
(1:26:32 PM) khem: RP__: if someone could do once a week review of oe-dev ml
for such patches would suffice
(1:26:57 PM) ***khem is dirt deep in work
(1:27:26 PM) RP__: khem: I think people need to be encouraged to start using
OE core...
(1:27:50 PM) fray: rp__ my expectation is that with the stable release
people (working on anything but existing product) should switch to oe-core
(1:27:54 PM) RP__: khem: rely on me to go find the patches, rebase them
against a different tree, post them on the oe-core list for review and then
merge them isn't faire
(1:27:58 PM) fray: since that will be the latest "Stable"
(1:28:05 PM) khem: RP__: most of them are these patches are however from
folks who deployed oe.dev release as I see
(1:28:18 PM) khem: yes folks has been asking for oe.core stable
(1:28:32 PM) RP__: khem: Its called 2011.1 :)
(1:28:36 PM) khem: so I see the branch that should bring in some more people
(1:28:37 PM) fray: I told the crowd at ESC Boston "in a few weeks"  ;)
(1:28:44 PM) fray: lets hope I didn't lie
(1:29:49 PM) RP__: Did anyone have a chance to look at my performance
tweaks?
(1:30:06 PM) RP__: Any concerns about disabling NLS for cross tools? I'm
wondering native next...
(1:30:13 PM) RP__: also parallel make install
(1:30:17 PM) khem: Another FYI is that git will be moving to its final
destination we expect no use visible problems except for RP
(1:30:20 PM) RP__: dropping help2man-native
(1:30:34 PM) khem: RP__: those changes look good.
(1:30:52 PM) fray: RP__ I havn't reviewed them due to my absense.. but I
expect to
(1:30:54 PM) khem: I dont know if disabling NLS would be good or not
(1:31:14 PM) khem: since it might not emit errors in right language
(1:31:15 PM) RP__: khem: given we force the C locale, we currently don't use
nls
(1:31:20 PM) khem: oh
(1:31:23 PM) khem: right
(1:31:43 PM) khem: well do we use that for cross gcc ?
(1:31:49 PM) khem: or target parts of it
(1:32:03 PM) RP__: target pieces would use NLS
(1:32:07 PM) fray: ya.. ridding hte host tooling of locales isn't a bad
idea.. the only thing is there will likely be some folks who want localized
messages when doing cross development.. but if it's difficult -- it's likely
not worth the effrort
(1:32:22 PM) khem: yes Japan comes to mind
(1:32:33 PM) khem: ok I have to leave
(1:32:37 PM) fray: I don't see it as useful for anything but the toolchain
(1:32:42 PM) RP__: ok, ttfn khem!
(1:32:46 PM) khem: I will read the minutes
(1:32:48 PM) khem: ttyl
(1:32:52 PM) fray: ttyl!
(1:33:12 PM) RP__: fray: SDK toolchain is find, target toolchain is fine.
cross toolchain, we currently force it to run with the C locale
(1:33:26 PM) RP__: so we can parse error output for things like host
contamination
(1:33:40 PM) fray: it's the people writing apps (external of
bitbake/oe-core) that are the ones I suspect would want them
(1:33:40 PM) RP__: so it would need big fixes to make locales work properly
there
(1:33:48 PM) fray: inside of bitbake/oe-core.. we absolutely should for the
C locale
(1:34:05 PM) fray: (that is should -force- the C locale)
(1:34:13 PM) RP__: right, it does
(1:34:20 PM) Jefro: khem - thanks for wiki!
(1:35:59 PM) RP__: I think we can probably close the meeting there
(1:36:20 PM) Jefro: sounds good - meeting officially adjourned, minutes
later today

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e856a65b78004ae2c9a46
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgb(255, 255, 255); "><div>These minutes =
will be available soon on the OE wiki</div><div><br></div><div>MINUTES: OE-=
TSC meeting 29-Sep-2011</div>
<div><br></div><div>Attending: Mark, Richard, Khem</div><div>Apologies: Tom=
, Koen</div><div>Notes: Jefro</div><div><br></div><div>--------------------=
------------------------------------</div><div>Agenda</div><div><br></div>
<div>1. pick a moderator</div><div>2. agenda items</div><div>=A0 =A0a. cont=
inuing minutes issues</div><div>=A0 =A0b. patchwork replacement</div><div>=
=A0 =A0c. patches to classic OE, tracking into layers?</div><div><br></div>=
<div>3. status on open subjects</div>
<div>=A0 =A0a. release</div><div>=A0 =A0b. git</div><div>=A0 =A0</div><div>=
--------------------------------------------------------</div><div>1. Jefro=
</div><div><br></div><div>2. a. some minutes not making it to mailing list,=
 Jefro to post on wiki</div>
<div>=A0 =A0b. yocto evaluating gerrit, possible patchwork replacement for =
OE, khem will research</div><div>=A0 =A0c. acknowledged need for more resou=
rces, oe-core being tracked well</div><div><br></div><div>3. a. release com=
ing together</div>
<div>=A0 =A0b. git moving to its final destination we expect no use visible=
 problems except for RP</div><div>=A0 =A0 =A0 khem ok&#39;s RPs changes, fr=
ay hasn&#39;t looked yet</div><div><br></div><div>-------------------------=
-------------------------------</div>
<div>Raw Transcript</div><div><br></div><div>(12:57:11 PM) khem: I have to =
be go at 1:30 though which is half way</div><div>(1:04:28 PM) khem: koen is=
 travelling last time he said</div><div>(1:04:42 PM) khem: but I dont remem=
ber if he was to be back today</div>
<div>(1:04:44 PM) fray: sorry I&#39;m late.. just got home</div><div>(1:04:=
45 PM) khem: or wednesday</div><div>(1:05:06 PM) fray: (was at ESC Boston g=
iving a Yocto presentation... and yes I mentioned oe and oe-core as well) =
=A0;)</div>
<div>(1:05:20 PM) khem: hello fray</div><div>(1:05:32 PM) khem: how was ESC=
</div><div>(1:05:35 PM) ***RP__ has put off some stuff to be here now so I =
hope this is going to be worthwhile...</div><div>(1:05:51 PM) RP__: Jefro: =
Did you manage to get wiki admin rights?</div>
<div>(1:06:02 PM) RP__: well, edit rights even</div><div>(1:06:10 PM) khem:=
 RP__: is it for oe.wiki</div><div>(1:06:13 PM) Jefro: RP__ not yet - still=
 working on that</div><div>(1:06:17 PM) RP__: khem: yes</div><div>(1:06:20 =
PM) Jefro: khem do you happen to have admin rights?</div>
<div>(1:06:30 PM) RP__: Jefro: You could ask khem/fray ;-)</div><div>(1:06:=
33 PM) khem: Jeffro, I dont think so</div><div>(1:06:37 PM) RP__: and someo=
ne could bump me whilst they&#39;re at it</div><div>(1:06:40 PM) RP__: khem=
: you do</div>
<div>(1:06:55 PM) fray: I don&#39;t have admin rights either..</div><div>(1=
:06:57 PM) khem: Jefro: but I do have some super cow powers</div><div>(1:07=
:19 PM) khem: so Jefro needs to be added ?</div><div>(1:07:34 PM) RP__:=A0<=
a href=3D"http://wiki.openembedded.org/index.php?title=3DSpecial:ListUsers&=
amp;group=3Dbureaucrat" target=3D"_blank" style=3D"color: rgb(0, 0, 204); "=
>http://wiki.openembedded.org/index.php?title=3DSpecial:ListUsers&amp;group=
=3Dbureaucrat</a></div>
<div>(1:07:36 PM) Jefro: I have an account, I just need to have editing/cre=
ating rights</div><div>(1:07:46 PM) Jefro: and Richard needs to have his ri=
ghts bumped</div><div>(1:07:47 PM) khem: ok</div><div>(1:07:53 PM) fray: fo=
r editing Khem found the right person to bump me up</div>
<div>(1:07:57 PM) khem: I can take it to next level</div><div>(1:08:00 PM) =
khem: consider it done</div><div>(1:08:00 PM) Jefro: if you think he is tru=
stworthy, that is</div><div>(1:08:10 PM) RP__: khem: can you bump me whilst=
 you&#39;re in there please</div>
<div>(1:08:13 PM) Jefro: khem awesome, thanks</div><div>(1:08:32 PM) RP__: =
people keep asking me for things...</div><div>(1:08:42 PM) khem: RP__: if I=
 figure out yes</div><div>(1:09:45 PM) Jefro: with three people there is a =
quorum, do you guys want to meet?</div>
<div>(1:09:50 PM) RP__: ok, so we have enough for a quorum but we lose khem=
 in 20 mins</div><div>(1:09:58 PM) RP__: what do we need to talk about?</di=
v><div>(1:10:07 PM) Jefro: better be a quick one. =A0agenda items?</div><di=
v>
(1:10:27 PM) RP__: I think Phil&#39;s question about minutes and so forth n=
eeds an answer. I think Jefro is on that and my thanks for taking care of i=
t :)</div><div>(1:11:02 PM) RP__: The release seems to be coming together a=
nd I&#39;m feeling better about the quality</div>
<div>(1:11:04 PM) fray: I thought we had released all of the minutes for th=
e meetings we -did- have.. there were a number where we didn&#39;t achive q=
uorum</div><div>(1:11:12 PM) khem: Jefro whats your login</div><div>(1:11:1=
3 PM) RP__: I&#39;m trying to communicate the situation better on the maili=
ng lists</div>
<div>(1:11:18 PM) RP__: summaries and so on</div><div>(1:11:23 PM) Jefro: R=
P__ yes, I am ready to post all the minutes since March, just need a login.=
 =A0khem: =A0Jefro</div><div>(1:11:59 PM) Jefro: there are two instances wh=
ere email I sent to the lists didn&#39;t get disseminated</div>
<div>(1:11:59 PM) RP__: fray: I don&#39;t think they&#39;ve been making the=
 lists. Jefro needs to figure out why. You&#39;re not posting to the=A0<a h=
ref=3D"mailto:lists@linuxtogo.org" target=3D"_blank" style=3D"color: rgb(0,=
 0, 204); ">lists@linuxtogo.org</a>=A0address are you?</div>
<div>(1:12:26 PM) Jefro: it was either pilot error on my part, or something=
 clogged in the ethertubes. =A0I post to..</div><div>(1:13:03 PM) Jefro: op=
enembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">openembedded-core@=
lists.openembedded.org</a>&gt;,</div>
<div>(1:13:03 PM) Jefro:=A0<a href=3D"mailto:openembedded-devel@lists.opene=
mbedded.org" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">openembedd=
ed-devel@lists.openembedded.org</a>,</div><div>(1:13:03 PM) Jefro: tsc &lt;=
<a href=3D"mailto:tsc@lists.openembedded.org" target=3D"_blank" style=3D"co=
lor: rgb(0, 0, 204); ">tsc@lists.openembedded.org</a>&gt;</div>
<div>(1:13:29 PM) RP__: those should be fine</div><div>(1:13:38 PM) RP__: p=
osting from the address you&#39;re subbed with?</div><div>(1:13:47 PM) Jefr=
o: yes: =A0<a href=3D"mailto:jefro@jefro.net" target=3D"_blank" style=3D"co=
lor: rgb(0, 0, 204); ">jefro@jefro.net</a></div>
<div>(1:14:29 PM) RP__: Jefro: dunno then. we need to watch this though</di=
v><div>(1:14:44 PM) Jefro: the two that appear to be missing from the lists=
 are in my Sent box, so make of that what you will. =A0(as official signed-=
off versions) I will be adding them to the wiki from here on out, and will =
double-check the archive each week to make sure it has gone out.</div>
<div>(1:15:00 PM) Jefro: I have had mysterious email issues before. Maybe I=
 pissed off the google gods.</div><div>(1:15:15 PM) fray: ...maybe google d=
oesn&#39;t like OE? =A0;)</div><div>(1:15:55 PM) khem: I would like to brin=
g up have patchwork replaced with something</div>
<div>(1:16:53 PM) Jefro: I have an AR to make sure minutes are settled &amp=
; will report back next week. =A0Should we move to khem&#39;s issues with p=
atchwork?</div><div>(1:17:03 PM) fray: ya</div><div>(1:17:11 PM) khem: Jefr=
o: you should be good with wiki now</div>
<div>(1:17:23 PM) RP__: Yocto people plan to evaluate gerrit</div><div>(1:1=
7:54 PM) RP__: we&#39;re waiting on sysadmin resources to set it up. We&#39=
;ve spent out sysadmin credit getting the=A0<a href=3D"http://kernel.org/li=
nuxfoundation" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">kernel.o=
rg/linuxfoundation</a>=A0server mess resoled</div>
<div>(1:17:58 PM) khem: since we are moving the OE services to a new server=
 it could be that we drop patchwork and not go through hassles of setting i=
t up</div><div>(1:17:58 PM) RP__: resolved</div><div>(1:19:06 PM) khem: koe=
n uses patchwork for his maintenance activity so some alternative would be =
nice to have</div>
<div>(1:19:25 PM) khem: ok gerrit seems a plausible thing</div><div>(1:19:5=
4 PM) khem: I have not used it thus far but may be we should plan on settin=
g some pilot project using it</div><div>(1:20:26 PM) RP__: khem: that is yo=
cto&#39;s plan</div>
<div>(1:20:53 PM) khem: RP__: ok</div><div>(1:21:39 PM) fray: just from an =
OE admin resources point of view.. does it make sense to let the Yocto folk=
s get it going there and then see if it&#39;s useful and bring it into OE i=
f it is? =A0(or do we not want to wait on Yocto to do a first pilot?)</div>
<div>(1:22:11 PM) khem: depends when yocto has pilots going</div><div>(1:22=
:21 PM) khem: I would prefer something soon</div><div>(1:22:38 PM) ***RP__ =
suspects it would be early novemeber</div><div>(1:22:53 PM) RP__: release t=
akes preference right now</div>
<div>(1:22:59 PM) khem: ok</div><div>(1:23:19 PM) khem: I will read about i=
t in coming days</div><div>(1:23:24 PM) khem: just to understand the beast<=
/div><div>(1:24:07 PM) RP__: khem: sounds like a plan</div><div>(1:24:14 PM=
) RP__: Anything else we need to touch upon?</div>
<div>(1:25:05 PM) khem: RP__: folks post patches to oe against classic oe t=
ree I dont know if we are doing a good job of tracking them into layers</di=
v><div>(1:25:44 PM) RP__: khem: I&#39;m only tracking oe-core atm, not enou=
gh bandwidth to do more</div>
<div>(1:26:21 PM) fray: likewise, for the most part I&#39;m tracking oe-cor=
e, and specific other things I notice like prelink and toolchain issues..</=
div><div>(1:26:32 PM) khem: RP__: if someone could do once a week review of=
 oe-dev ml for such patches would suffice</div>
<div>(1:26:57 PM) ***khem is dirt deep in work</div><div>(1:27:26 PM) RP__:=
 khem: I think people need to be encouraged to start using OE core...</div>=
<div>(1:27:50 PM) fray: rp__ my expectation is that with the stable release=
 people (working on anything but existing product) should switch to oe-core=
</div>
<div>(1:27:54 PM) RP__: khem: rely on me to go find the patches, rebase the=
m against a different tree, post them on the oe-core list for review and th=
en merge them isn&#39;t faire</div><div>(1:27:58 PM) fray: since that will =
be the latest &quot;Stable&quot;</div>
<div>(1:28:05 PM) khem: RP__: most of them are these patches are however fr=
om folks who deployed oe.dev release as I see</div><div>(1:28:18 PM) khem: =
yes folks has been asking for oe.core stable</div><div>(1:28:32 PM) RP__: k=
hem: Its called 2011.1 :)</div>
<div>(1:28:36 PM) khem: so I see the branch that should bring in some more =
people</div><div>(1:28:37 PM) fray: I told the crowd at ESC Boston &quot;in=
 a few weeks&quot; =A0;)</div><div>(1:28:44 PM) fray: lets hope I didn&#39;=
t lie</div>
<div>(1:29:49 PM) RP__: Did anyone have a chance to look at my performance =
tweaks?</div><div>(1:30:06 PM) RP__: Any concerns about disabling NLS for c=
ross tools? I&#39;m wondering native next...</div><div>(1:30:13 PM) RP__: a=
lso parallel make install</div>
<div>(1:30:17 PM) khem: Another FYI is that git will be moving to its final=
 destination we expect no use visible problems except for RP</div><div>(1:3=
0:20 PM) RP__: dropping help2man-native</div><div>(1:30:34 PM) khem: RP__: =
those changes look good.</div>
<div>(1:30:52 PM) fray: RP__ I havn&#39;t reviewed them due to my absense..=
 but I expect to</div><div>(1:30:54 PM) khem: I dont know if disabling NLS =
would be good or not</div><div>(1:31:14 PM) khem: since it might not emit e=
rrors in right language</div>
<div>(1:31:15 PM) RP__: khem: given we force the C locale, we currently don=
&#39;t use nls</div><div>(1:31:20 PM) khem: oh</div><div>(1:31:23 PM) khem:=
 right</div><div>(1:31:43 PM) khem: well do we use that for cross gcc ?</di=
v>
<div>(1:31:49 PM) khem: or target parts of it</div><div>(1:32:03 PM) RP__: =
target pieces would use NLS</div><div>(1:32:07 PM) fray: ya.. ridding hte h=
ost tooling of locales isn&#39;t a bad idea.. the only thing is there will =
likely be some folks who want localized messages when doing cross developme=
nt.. but if it&#39;s difficult -- it&#39;s likely not worth the effrort</di=
v>
<div>(1:32:22 PM) khem: yes Japan comes to mind</div><div>(1:32:33 PM) khem=
: ok I have to leave</div><div>(1:32:37 PM) fray: I don&#39;t see it as use=
ful for anything but the toolchain</div><div>(1:32:42 PM) RP__: ok, ttfn kh=
em!</div>
<div>(1:32:46 PM) khem: I will read the minutes</div><div>(1:32:48 PM) khem=
: ttyl</div><div>(1:32:52 PM) fray: ttyl!</div><div>(1:33:12 PM) RP__: fray=
: SDK toolchain is find, target toolchain is fine. cross toolchain, we curr=
ently force it to run with the C locale</div>
<div>(1:33:26 PM) RP__: so we can parse error output for things like host c=
ontamination</div><div>(1:33:40 PM) fray: it&#39;s the people writing apps =
(external of bitbake/oe-core) that are the ones I suspect would want them</=
div>
<div>(1:33:40 PM) RP__: so it would need big fixes to make locales work pro=
perly there</div><div>(1:33:48 PM) fray: inside of bitbake/oe-core.. we abs=
olutely should for the C locale</div><div>(1:34:05 PM) fray: (that is shoul=
d -force- the C locale)</div>
<div>(1:34:13 PM) RP__: right, it does</div><div>(1:34:20 PM) Jefro: khem -=
 thanks for wiki!</div><div>(1:35:59 PM) RP__: I think we can probably clos=
e the meeting there</div><div>(1:36:20 PM) Jefro: sounds good - meeting off=
icially adjourned, minutes later today</div>
</span><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/b=
log" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Communit=
y Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_blank">http=
://yoctoproject.org</a></div>
<br>

--90e6ba6e856a65b78004ae2c9a46--
