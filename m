Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1R9RR7-0001B9-42; Fri, 30 Sep 2011 02:58:45 +0200
Received: by wwf27 with SMTP id 27so1539192wwf.24
	for <multiple recipients>; Thu, 29 Sep 2011 17:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=uyIHifUnvPW9GNM9JgNsFnZkmxJk9msR3XSSQsyP6+M=;
	b=N18Hx6j6Xn9fsq8/2rqZhOT1YDKb4/ctUf/zYIUzI07paLstMJcsomi+ORr79iL9I5
	9zj2kXKwDoIkxFVLGdlHOKLwMyzoTxDrRoM5xXOwy1qD74ZnQhTgWxz+i774CVNqYd/E
	5gpqwyWZ6Dv1T3fl6eQwQivpzS/DlgynWuMNU=
MIME-Version: 1.0
Received: by 10.227.19.208 with SMTP id c16mr846565wbb.106.1317343996527; Thu,
	29 Sep 2011 17:53:16 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.180.105.42 with HTTP; Thu, 29 Sep 2011 17:53:16 -0700 (PDT)
Date: Thu, 29 Sep 2011 17:53:16 -0700
X-Google-Sender-Auth: 4_ViiffLFQsN42FhmYVtso-NsBM
Message-ID: <CA+YB3raZav1oAG8dgQoGq7c5qfa+by_miOxqzcm_ROUNRhj0-w@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: OE TSC meeting 11 August 2011 (re-send)
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
X-List-Received-Date: Fri, 30 Sep 2011 00:58:45 -0000
Content-Type: multipart/alternative; boundary=002215b0428ef5c36e04ae1e0c22

--002215b0428ef5c36e04ae1e0c22
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

OE TSC meeting 11 August 2011

Attendees: Tom, Richard, Khem, Mark
Apologies: Koen
Notes: Jefro


Minutes

01) choose a meeting chair

Tom

02) new topics

03) action items from last week

- request for focus areas for yocto, post-1.1 and beyond (RP)
still collecting input

05) Status updates

RP planning to revise local.conf.sample

      - elections

  - oe-core

  - bsp guidelines

  - "normal" linux recipe in oe-core that people can bbappend
      - metadata layer splitting

      - infrastructure
  new instance of a VM created to replace melo: 64bit, services transferrin=
g
eventually
  git currently on a temporary machine, should not be much impact
  #oe-infra on freenode used for OE infrastructure discussion
  tom k. should send email to ml when switchover is planned, as host key ma=
y
change


Raw Transcript

(1:12:50 PM) Tartarus: khem is here and that makes 3 at least, so we could
start
(1:12:52 PM) ***khem is here too
(1:14:15 PM) khem: who chairs ?
(1:15:05 PM) Tartarus: I guess I can
(1:15:06 PM) Tartarus: agenda?
(1:15:14 PM) Jefro: Tartarus is chair. Agenda is at
http://pastebin.com/nNu8anV2
(1:15:19 PM) khem: ok
(1:15:30 PM) Jefro: and yes, there is no 04.
(1:16:16 PM) Tartarus: OK, new topics, khem? RP__?
(1:16:21 PM) Tartarus: none from me
(1:16:30 PM) RP__: Nothing from me
(1:16:43 PM) khem: nothin from me. I would like to give update on new
replacement for melo
(1:17:14 PM) Tartarus: ok
(1:17:25 PM) Tartarus: So, #3
(1:17:37 PM) Tartarus: Still need more inputs for Yocto 1.1, RP__?
(1:18:09 PM) RP__: Tartarus: you mean post 1.1?
(1:18:17 PM) Tartarus: erm, yes
(1:18:28 PM) RP__: Tartarus: We're still collecting input, yes
(1:18:33 PM) fray: sorry, I missed my alarm
(1:18:46 PM) Tartarus: fray: any new AIs?
(1:18:49 PM) ***Jefro notes that fray sleeps even later than he does
(1:18:54 PM) fray: nope.. just working on bugs.. :)
(1:19:49 PM) Tartarus: RP__: Anything you need from the TSC wrt post 1.1
stuff?  Or just a gentle, or not so gentle prod in our directions
(1:19:57 PM) Tartarus: And folks reading the minutes
(1:20:16 PM) RP__: Tartarus: Nothing specific, just that if anyone has inpu=
t
into direction, now is the time to make it known
(1:20:22 PM) fray: I think the TSC needs input from members (and of course
ourselves) for direction.. and then we should provide input for the 1.1...
[if any]
(1:20:24 PM) Tartarus: So noted.
(1:20:35 PM) Tartarus: So, moving on to status updated
(1:20:40 PM) Tartarus: khem: Go ahead :)
(1:20:59 PM) khem: there is new instance of a virtual machine created
(1:21:06 PM) khem: which is meant to replace melo
(1:21:19 PM) khem: it will be a 64bit OS
(1:21:49 PM) khem: all services should transfer to it eventually
(1:21:52 PM) khem: first will be git
(1:22:08 PM) khem: git is currently on a temporary machine
(1:22:17 PM) fray: any idea of the expected downtime?
(1:22:57 PM) khem: fray: it should not be much impact for others than RP
(1:23:02 PM) fray: ok
(1:23:08 PM) khem: since github is there
(1:23:47 PM) khem: Sometimes next week we should be able to switch git over
(1:24:04 PM) khem: there is a channel called oe-infra on freenode started b=
y
Tom
(1:24:17 PM) khem: which is used for this work
(1:25:10 PM) khem: folks might see DNS issues thats what I expect
(1:25:20 PM) khem: since propagation is not that fast
(1:25:22 PM) RP__: likely the host key will change again I guess
(1:25:27 PM) khem: yes :(
(1:26:06 PM) khem: Once the switchover is planned out Tom should send email
to ml
(1:26:18 PM) RP__: khem: did we ever close out on whether the yocto servers
would be better?
(1:26:41 PM) ***RP__ knows we've discussed this several times but doesn't
know if we every reached a resolution
(1:27:08 PM) khem: I dont think so. most inclination was to have oe.org hos=
t
it
(1:27:24 PM) RP__: khem: it would still be the oe domain
(1:27:34 PM) RP__: khem: just share some infrastructure
(1:27:44 PM) khem: yes I meant serverwise
(1:28:02 PM) RP__: ok
(1:29:16 PM) khem: may be board should discuss this too
(1:29:27 PM) Tartarus: yes, this feels like a board thing
(1:29:38 PM) Tartarus: IMHO, from a technical POV we just need it working,
and reliable
(1:29:44 PM) khem: yep
(1:29:48 PM) Tartarus: The "politics" of it is a board issue
(1:30:06 PM) khem: thats all update I have
(1:30:29 PM) Tartarus: OK
(1:30:34 PM) Tartarus: RP__: any general updates?
(1:30:47 PM) khem: on infra again there is build machine that Tom is
spec'ing out for oe continuous builds
(1:30:53 PM) khem: with LF I guesss
(1:30:53 PM) RP__: Tartarus: just that we're very much in bugfixing mode at=
m
(1:31:15 PM) RP__: making a big effort to close out various issues, some of
them long standing
(1:31:39 PM) ***RP__ is about to rip local.conf.sample apart, its a disgrac=
e
as it stands
(1:32:22 PM) khem: we should also discuss after october release fate of
oe.dev
(1:32:22 PM) Jefro: (actually I have found it quite helpful)
(1:32:22 PM) Tartarus: k
(1:32:26 PM) fray: ya, I think it's due for a cleanup..
(1:32:28 PM) Tartarus: Any other updates?
(1:32:29 PM) fray: (again)  ;)
(1:32:53 PM) RP__: Jefro: I want to restructure it more than anything and
remove the pieces a new user doesn't or shouldn't have to care about
(1:33:13 PM) RP__: Tartarus: I think the mailing list has covered things
(1:33:17 PM) Tartarus: ok
(1:33:24 PM) RP__: Are there any questions for me?
(1:33:31 PM) Tartarus: Any last minute topics from anyone?
(1:33:33 PM) Tartarus: Otherwise, that's a meeting
(1:34:02 PM) RP__: So people know that some of us are at Linuxcon next week
(1:34:06 PM) khem: oh one thing I was asked by someone interested in
yocto/oe
(1:34:08 PM) RP__: I'll be on a plane the week after
(1:34:24 PM) khem: whats our security update policy
(1:34:37 PM) Tartarus: khem: Don't have one
(1:34:44 PM) RP__: khem: For any issues we're aware of we'll add patches
(1:34:50 PM) Tartarus: Ask your $vendor or pick up some work, imho
(1:35:07 PM) RP__: khem: We do track some things, we don't claim to be
perfect
(1:35:09 PM) khem: ok. so people misunderstand yocto as a vendor too
(1:35:15 PM) Tartarus: RP__: We do?  We who?
(1:35:26 PM) RP__: Tartarus: I'm speaking for Yocto
(1:35:51 PM) Tartarus: RP__: OK.  It'd be nice if what your will fix
criteria is was somewhere
(1:35:54 PM) khem: RP__: ok. but this is something may be should be written
down somewhere
(1:35:57 PM) khem: whatever we do
(1:36:02 PM) Tartarus: s/will fix/is watching for/
(1:36:07 PM) fray: The official Yocto policy as I know it, is fix it when w=
e
know about it.  We're not yet in a position to be proactive on security as =
a
group
(1:36:16 PM) RP__: Tartarus: I agree it could be better documented
(1:36:18 PM) fray: (but I think we're getting there, that may turn into a
1.1 thing)
(1:36:18 PM) RP__:
http://git.yoctoproject.org/cgit.cgi/poky/log/?qt=3Dgrep&q=3Dsecurity
(1:36:36 PM) khem: ok.
(1:36:40 PM) Tartarus: proactive hell, reactive is hard enough, even with
the cut down list in oe-core
(1:36:43 PM) Tartarus: forget meta-oe :)
(1:36:56 PM) RP__:
http://git.yoctoproject.org/cgit.cgi/poky/log/?qt=3Dgrep&q=3DCVE is better
(1:37:03 PM) Tartarus: Also, I'm not sure there's a lot of value in
proactive works these days
(1:37:17 PM) ***Tartarus did an updated scarf and digetst CVE data stuff,
back at Mentor
(1:37:25 PM) RP__: I think the basis is we're looking at any CVEs that appl=
y
to our versions
(1:37:32 PM) fray: proactive =3D we're looking for CVEs..  reactive we wait
until some finds a defect
(1:37:54 PM) Tartarus: Yeah, even that is s alot of work, even once you're
baseline OK'd
(1:38:14 PM) khem: thanks
(1:38:20 PM) ***Tartarus would be happy to talk with whomever is doing that
on the Yocto side, having done the scarf and dump CVE thing twice now
(1:38:23 PM) fray: yes, it is.. thats why we're not doing it yet.. we're
still doing infrastructure and other things.. many of the security issues
are being handled by the uprev at this point
(1:38:36 PM) RP__: Tartarus: ping Scott Garman
(1:38:40 PM) RP__: (zenlinux)
(1:38:46 PM) Tartarus: k
(1:39:13 PM) RP__: Tartarus: As you can see we are trying to include CVE
numbers in logs and so on
(1:39:24 PM) fray: ya, general method I've used is scarf CVE.. diff to last
version.. review differences.. anything that is linux (or open source) see
if we even have the package.. pawn it off to someone else who has more info
on that particular package
(1:39:53 PM) Tartarus: RP__: yeah, that's a good step
(1:40:02 PM) fray: for oe-core it's at least possible to find a maintainer.=
.
for meta-oe.. I'm not sure what we'll get
(1:40:09 PM) Tartarus: fray, the next step to me at least was to add in som=
e
filtering to make triage easier
(1:40:35 PM) RP__: Tartarus: we need more work in this area for sure
(1:40:37 PM) fray: ya.. thats the could it affect us part, or are you
talking about even more then that?
(1:40:37 PM) Tartarus: since it still sucks to triage 200 items which
happens, and 190 of them are *Windows* or *Cisco* or ...
(1:40:46 PM) fray: :)
(1:40:52 PM) Tartarus: I've done it and got some thoughts on it :)
(1:41:00 PM) Tartarus: So ping me when you guys get that far along
(1:41:10 PM) khem: yeah I love that Cisco part
(1:41:21 PM) fray: (for the record I and Tartarus were security folks at
MontaVista.. and I was the security lead at Wind River until recently..)
(1:41:39 PM) Tartarus: =85 and I did security stuff at Mentor
(1:42:03 PM) ***RP__ hereby delegates to the experts ;-)
(1:42:26 PM) fray: if/when we get to this point.. the triage and
notification that we MIGHT have a problem is way more important then
actually fixing it..  (and unfortunately is likely more time consuming)
(1:43:42 PM) Tartarus: So, I think that's enough of that
(1:43:45 PM) Tartarus: Anything else?
(1:44:10 PM) fray: nothing here
(1:44:11 PM) RP__: Not from me

--=20
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--002215b0428ef5c36e04ae1e0c22
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgb(255, 255, 255); "><div>OE TSC meeting=
 11 August 2011</div><div><br></div><div>Attendees: Tom, Richard, Khem, Mar=
k</div>
<div>Apologies: Koen</div><div>Notes: Jefro</div><div><br></div><div><br></=
div><div><span class=3D"il" style=3D"background-image: initial; background-=
attachment: initial; background-origin: initial; background-clip: initial; =
background-color: rgb(255, 255, 136); color: rgb(34, 34, 34); background-po=
sition: initial initial; background-repeat: initial initial; ">Minutes</spa=
n></div>
<div><br></div><div>01) choose a meeting chair</div><div><br></div><div>Tom=
</div><div><br></div><div>02) new topics</div><div><br></div><div>03) actio=
n items from last week</div><div><br></div><div>- request for focus areas f=
or yocto, post-1.1 and beyond (RP)</div>
<div>still collecting input</div><div><br></div><div>05) Status updates</di=
v><div><br></div><div>RP planning to revise local.conf.sample</div><div><br=
></div><div>=A0 =A0 =A0 - elections</div><div>=A0 =A0 =A0=A0</div><div><spa=
n style=3D"white-space: pre-wrap; ">	</span>=A0=A0- oe-core</div>
<div>=A0 =A0 =A0=A0</div><div><span style=3D"white-space: pre-wrap; ">	</sp=
an>=A0=A0- bsp guidelines</div><div>=A0 =A0 =A0=A0</div><div><span style=3D=
"white-space: pre-wrap; ">	</span>=A0=A0- &quot;normal&quot; linux recipe i=
n oe-core that people can bbappend</div>
<div>=A0 =A0 =A0 - metadata layer splitting</div><div><span style=3D"white-=
space: pre-wrap; ">	</span>=A0=A0</div><div>=A0 =A0 =A0 - infrastructure</d=
iv><div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0new instance =
of a VM created to replace melo: 64bit, services transferring eventually</d=
iv>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0git currently on=
 a temporary machine, should not be much impact</div><div><span style=3D"wh=
ite-space: pre-wrap; ">	</span>=A0=A0#oe-infra on freenode used for OE infr=
astructure discussion</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0tom k. should se=
nd email to ml when switchover is planned, as host key may change</div><div=
><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0</div><div><span sty=
le=3D"white-space: pre-wrap; ">	</span>=A0=A0</div>
<div>Raw Transcript</div><div><br></div><div>(1:12:50 PM) Tartarus: khem is=
 here and that makes 3 at least, so we could start</div><div>(1:12:52 PM) *=
**khem is here too</div><div>(1:14:15 PM) khem: who chairs ?</div><div>
(1:15:05 PM) Tartarus: I guess I can</div><div>(1:15:06 PM) Tartarus: agend=
a?</div><div>(1:15:14 PM) Jefro: Tartarus is chair. Agenda is at=A0<a href=
=3D"http://pastebin.com/nNu8anV2" target=3D"_blank" style=3D"color: rgb(0, =
0, 204); ">http://pastebin.com/nNu8anV2</a></div>
<div>(1:15:19 PM) khem: ok</div><div>(1:15:30 PM) Jefro: and yes, there is =
no 04.</div><div>(1:16:16 PM) Tartarus: OK, new topics, khem? RP__?</div><d=
iv>(1:16:21 PM) Tartarus: none from me</div><div>(1:16:30 PM) RP__: Nothing=
 from me</div>
<div>(1:16:43 PM) khem: nothin from me. I would like to give update on new =
replacement for melo</div><div>(1:17:14 PM) Tartarus: ok</div><div>(1:17:25=
 PM) Tartarus: So, #3</div><div>(1:17:37 PM) Tartarus: Still need more inpu=
ts for Yocto 1.1, RP__?</div>
<div>(1:18:09 PM) RP__: Tartarus: you mean post 1.1?</div><div>(1:18:17 PM)=
 Tartarus: erm, yes</div><div>(1:18:28 PM) RP__: Tartarus: We&#39;re still =
collecting input, yes</div><div>(1:18:33 PM) fray: sorry, I missed my alarm=
</div>
<div>(1:18:46 PM) Tartarus: fray: any new AIs?</div><div>(1:18:49 PM) ***Je=
fro notes that fray sleeps even later than he does</div><div>(1:18:54 PM) f=
ray: nope.. just working on bugs.. :)</div><div>(1:19:49 PM) Tartarus: RP__=
: Anything you need from the TSC wrt post 1.1 stuff? =A0Or just a gentle, o=
r not so gentle prod in our directions</div>
<div>(1:19:57 PM) Tartarus: And folks reading the=A0<span class=3D"il" styl=
e=3D"background-image: initial; background-attachment: initial; background-=
origin: initial; background-clip: initial; background-color: rgb(255, 255, =
136); color: rgb(34, 34, 34); background-position: initial initial; backgro=
und-repeat: initial initial; ">minutes</span></div>
<div>(1:20:16 PM) RP__: Tartarus: Nothing specific, just that if anyone has=
 input into direction, now is the time to make it known</div><div>(1:20:22 =
PM) fray: I think the TSC needs input from members (and of course ourselves=
) for direction.. and then we should provide input for the 1.1... [if any]<=
/div>
<div>(1:20:24 PM) Tartarus: So noted.</div><div>(1:20:35 PM) Tartarus: So, =
moving on to status updated</div><div>(1:20:40 PM) Tartarus: khem: Go ahead=
 :)</div><div>(1:20:59 PM) khem: there is new instance of a virtual machine=
 created</div>
<div>(1:21:06 PM) khem: which is meant to replace melo</div><div>(1:21:19 P=
M) khem: it will be a 64bit OS</div><div>(1:21:49 PM) khem: all services sh=
ould transfer to it eventually</div><div>(1:21:52 PM) khem: first will be g=
it</div>
<div>(1:22:08 PM) khem: git is currently on a temporary machine</div><div>(=
1:22:17 PM) fray: any idea of the expected downtime?</div><div>(1:22:57 PM)=
 khem: fray: it should not be much impact for others than RP</div><div>
(1:23:02 PM) fray: ok</div><div>(1:23:08 PM) khem: since github is there</d=
iv><div>(1:23:47 PM) khem: Sometimes next week we should be able to switch =
git over</div><div>(1:24:04 PM) khem: there is a channel called oe-infra on=
 freenode started by Tom</div>
<div>(1:24:17 PM) khem: which is used for this work</div><div>(1:25:10 PM) =
khem: folks might see DNS issues thats what I expect</div><div>(1:25:20 PM)=
 khem: since propagation is not that fast</div><div>(1:25:22 PM) RP__: like=
ly the host key will change again I guess</div>
<div>(1:25:27 PM) khem: yes :(</div><div>(1:26:06 PM) khem: Once the switch=
over is planned out Tom should send email to ml</div><div>(1:26:18 PM) RP__=
: khem: did we ever close out on whether the yocto servers would be better?=
</div>
<div>(1:26:41 PM) ***RP__ knows we&#39;ve discussed this several times but =
doesn&#39;t know if we every reached a resolution</div><div>(1:27:08 PM) kh=
em: I dont think so. most inclination was to have=A0<a href=3D"http://oe.or=
g/" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">oe.org</a>=A0host i=
t</div>
<div>(1:27:24 PM) RP__: khem: it would still be the oe domain</div><div>(1:=
27:34 PM) RP__: khem: just share some infrastructure</div><div>(1:27:44 PM)=
 khem: yes I meant serverwise</div><div>(1:28:02 PM) RP__: ok</div><div>
(1:29:16 PM) khem: may be board should discuss this too</div><div>(1:29:27 =
PM) Tartarus: yes, this feels like a board thing</div><div>(1:29:38 PM) Tar=
tarus: IMHO, from a technical POV we just need it working, and reliable</di=
v>
<div>(1:29:44 PM) khem: yep</div><div>(1:29:48 PM) Tartarus: The &quot;poli=
tics&quot; of it is a board issue</div><div>(1:30:06 PM) khem: thats all up=
date I have</div><div>(1:30:29 PM) Tartarus: OK</div><div>(1:30:34 PM) Tart=
arus: RP__: any general updates?</div>
<div>(1:30:47 PM) khem: on infra again there is build machine that Tom is s=
pec&#39;ing out for oe continuous builds</div><div>(1:30:53 PM) khem: with =
LF I guesss</div><div>(1:30:53 PM) RP__: Tartarus: just that we&#39;re very=
 much in bugfixing mode atm</div>
<div>(1:31:15 PM) RP__: making a big effort to close out various issues, so=
me of them long standing</div><div>(1:31:39 PM) ***RP__ is about to rip loc=
al.conf.sample apart, its a disgrace as it stands</div><div>(1:32:22 PM) kh=
em: we should also discuss after october release fate of oe.dev</div>
<div>(1:32:22 PM) Jefro: (actually I have found it quite helpful)</div><div=
>(1:32:22 PM) Tartarus: k</div><div>(1:32:26 PM) fray: ya, I think it&#39;s=
 due for a cleanup..</div><div>(1:32:28 PM) Tartarus: Any other updates?</d=
iv>
<div>(1:32:29 PM) fray: (again) =A0;)</div><div>(1:32:53 PM) RP__: Jefro: I=
 want to restructure it more than anything and remove the pieces a new user=
 doesn&#39;t or shouldn&#39;t have to care about</div><div>(1:33:13 PM) RP_=
_: Tartarus: I think the mailing list has covered things</div>
<div>(1:33:17 PM) Tartarus: ok</div><div>(1:33:24 PM) RP__: Are there any q=
uestions for me?</div><div>(1:33:31 PM) Tartarus: Any last minute topics fr=
om anyone?</div><div>(1:33:33 PM) Tartarus: Otherwise, that&#39;s a meeting=
</div>
<div>(1:34:02 PM) RP__: So people know that some of us are at Linuxcon next=
 week</div><div>(1:34:06 PM) khem: oh one thing I was asked by someone inte=
rested in yocto/oe</div><div>(1:34:08 PM) RP__: I&#39;ll be on a plane the =
week after</div>
<div>(1:34:24 PM) khem: whats our security update policy</div><div>(1:34:37=
 PM) Tartarus: khem: Don&#39;t have one</div><div>(1:34:44 PM) RP__: khem: =
For any issues we&#39;re aware of we&#39;ll add patches</div><div>(1:34:50 =
PM) Tartarus: Ask your $vendor or pick up some work, imho</div>
<div>(1:35:07 PM) RP__: khem: We do track some things, we don&#39;t claim t=
o be perfect</div><div>(1:35:09 PM) khem: ok. so people misunderstand yocto=
 as a vendor too</div><div>(1:35:15 PM) Tartarus: RP__: We do? =A0We who?</=
div>
<div>(1:35:26 PM) RP__: Tartarus: I&#39;m speaking for Yocto</div><div>(1:3=
5:51 PM) Tartarus: RP__: OK. =A0It&#39;d be nice if what your will fix crit=
eria is was somewhere</div><div>(1:35:54 PM) khem: RP__: ok. but this is so=
mething may be should be written down somewhere</div>
<div>(1:35:57 PM) khem: whatever we do</div><div>(1:36:02 PM) Tartarus: s/w=
ill fix/is watching for/</div><div>(1:36:07 PM) fray: The official Yocto po=
licy as I know it, is fix it when we know about it. =A0We&#39;re not yet in=
 a position to be proactive on security as a group</div>
<div>(1:36:16 PM) RP__: Tartarus: I agree it could be better documented</di=
v><div>(1:36:18 PM) fray: (but I think we&#39;re getting there, that may tu=
rn into a 1.1 thing)</div><div>(1:36:18 PM) RP__:=A0<a href=3D"http://git.y=
octoproject.org/cgit.cgi/poky/log/?qt=3Dgrep&amp;q=3Dsecurity" target=3D"_b=
lank" style=3D"color: rgb(0, 0, 204); ">http://git.yoctoproject.org/cgit.cg=
i/poky/log/?qt=3Dgrep&amp;q=3Dsecurity</a></div>
<div>(1:36:36 PM) khem: ok.</div><div>(1:36:40 PM) Tartarus: proactive hell=
, reactive is hard enough, even with the cut down list in oe-core</div><div=
>(1:36:43 PM) Tartarus: forget meta-oe :)</div><div>(1:36:56 PM) RP__:=A0<a=
 href=3D"http://git.yoctoproject.org/cgit.cgi/poky/log/?qt=3Dgrep&amp;q=3DC=
VE" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">http://git.yoctopro=
ject.org/cgit.cgi/poky/log/?qt=3Dgrep&amp;q=3DCVE</a>=A0is better</div>
<div>(1:37:03 PM) Tartarus: Also, I&#39;m not sure there&#39;s a lot of val=
ue in proactive works these days</div><div>(1:37:17 PM) ***Tartarus did an =
updated scarf and digetst CVE data stuff, back at Mentor</div><div>(1:37:25=
 PM) RP__: I think the basis is we&#39;re looking at any CVEs that apply to=
 our versions</div>
<div>(1:37:32 PM) fray: proactive =3D we&#39;re looking for CVEs.. =A0react=
ive we wait until some finds a defect</div><div>(1:37:54 PM) Tartarus: Yeah=
, even that is s alot of work, even once you&#39;re baseline OK&#39;d</div>
<div>(1:38:14 PM) khem: thanks</div><div>(1:38:20 PM) ***Tartarus would be =
happy to talk with whomever is doing that on the Yocto side, having done th=
e scarf and dump CVE thing twice now</div><div>(1:38:23 PM) fray: yes, it i=
s.. thats why we&#39;re not doing it yet.. we&#39;re still doing infrastruc=
ture and other things.. many of the security issues are being handled by th=
e uprev at this point</div>
<div>(1:38:36 PM) RP__: Tartarus: ping Scott Garman</div><div>(1:38:40 PM) =
RP__: (zenlinux)</div><div>(1:38:46 PM) Tartarus: k</div><div>(1:39:13 PM) =
RP__: Tartarus: As you can see we are trying to include CVE numbers in logs=
 and so on</div>
<div>(1:39:24 PM) fray: ya, general method I&#39;ve used is scarf CVE.. dif=
f to last version.. review differences.. anything that is linux (or open so=
urce) see if we even have the package.. pawn it off to someone else who has=
 more info on that particular package</div>
<div>(1:39:53 PM) Tartarus: RP__: yeah, that&#39;s a good step</div><div>(1=
:40:02 PM) fray: for oe-core it&#39;s at least possible to find a maintaine=
r.. for meta-oe.. I&#39;m not sure what we&#39;ll get</div><div>(1:40:09 PM=
) Tartarus: fray, the next step to me at least was to add in some filtering=
 to make triage easier</div>
<div>(1:40:35 PM) RP__: Tartarus: we need more work in this area for sure</=
div><div>(1:40:37 PM) fray: ya.. thats the could it affect us part, or are =
you talking about even more then that?</div><div>(1:40:37 PM) Tartarus: sin=
ce it still sucks to triage 200 items which happens, and 190 of them are *W=
indows* or *Cisco* or ...</div>
<div>(1:40:46 PM) fray: :)</div><div>(1:40:52 PM) Tartarus: I&#39;ve done i=
t and got some thoughts on it :)</div><div>(1:41:00 PM) Tartarus: So ping m=
e when you guys get that far along</div><div>(1:41:10 PM) khem: yeah I love=
 that Cisco part</div>
<div>(1:41:21 PM) fray: (for the record I and Tartarus were security folks =
at MontaVista.. and I was the security lead at Wind River until recently..)=
</div><div>(1:41:39 PM) Tartarus: =85 and I did security stuff at Mentor</d=
iv>
<div>(1:42:03 PM) ***RP__ hereby delegates to the experts ;-)</div><div>(1:=
42:26 PM) fray: if/when we get to this point.. the triage and notification =
that we MIGHT have a problem is way more important then actually fixing it.=
. =A0(and unfortunately is likely more time consuming)</div>
<div>(1:43:42 PM) Tartarus: So, I think that&#39;s enough of that</div><div=
>(1:43:45 PM) Tartarus: Anything else?</div><div>(1:44:10 PM) fray: nothing=
 here</div><div>(1:44:11 PM) RP__: Not from me</div></span><div><font class=
=3D"Apple-style-span" face=3D"arial, sans-serif"><br>
</font></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/blog" targ=
et=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Community Manager=
 @Intel <a href=3D"http://yoctoproject.org" target=3D"_blank">http://yoctop=
roject.org</a></div>
<br>

--002215b0428ef5c36e04ae1e0c22--
