Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RAoPx-0008HR-2h; Mon, 03 Oct 2011 21:43:13 +0200
Received: by iadx2 with SMTP id x2so5637868iad.6
	for <multiple recipients>; Mon, 03 Oct 2011 12:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=0fi0hCTdjrVXQWn5jAZVWuEnK5TehVx4pruwHH/Qdak=;
	b=mGxNZx+HxY3NXw2m1pWZgVprIkZ3ja83gFbFvBJwbL74ae5Id3ZBAXztw/9ioPkdls
	1LBuM9bq0a1U7DuKCiWmT3Om2Lt7BmNEzPjjZ9FR7UEbFKDsLqANomMrqMNJX39PKKTZ
	5XdlHa8jMFpHj0w5V3I8zckHt5lKE3TFFCWf8=
MIME-Version: 1.0
Received: by 10.42.178.68 with SMTP id bl4mr200851icb.17.1317670659345; Mon,
	03 Oct 2011 12:37:39 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.240.8 with HTTP; Mon, 3 Oct 2011 12:37:39 -0700 (PDT)
Date: Mon, 3 Oct 2011 12:37:39 -0700
X-Google-Sender-Auth: C9vbnG3UFuWAvcvW-dc-KizjHTo
Message-ID: <CA+YB3ram6jP_umezdGAAqZkZveqoxNh6n=y5YohabTPgY8+Ypw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 1-Sep-2011
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
X-List-Received-Date: Mon, 03 Oct 2011 19:43:13 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8f7e94ce5304ae6a1be5

--90e6ba6e8f7e94ce5304ae6a1be5
Content-Type: text/plain; charset=ISO-8859-1

My apologies for the delay on posting this one. This should complete the
set. Again, all minutes are now available at
http://www.openembedded.org/wiki/TSC

MINUTES: OE-TSC meeting 1-Sep-2011

Attending: Mark, Richard, Khem, Koen
Apologies: Tom
Notes: Jefro (not present)

--------------------------------------------------------
Agenda

1. pick a moderator
2. agenda items
   a. Yocto update
   b. oe-core release numbering

3. status on open subjects
   a. oe-core
   b. elections

--------------------------------------------------------
Results

1. Jefro

2. a. steering hard to bug fixing and stabilisation, branching shortly
    enabling free form user contrib repos on git.yp.org in 1-2 weeks
   b. oe-core to be 2011.<something> (poky is "edison")

3. a. hitting critical mass on features, people starting to use it & file
bugs
    ti somewhat confused about layers vs different repos for poky/yocto
   b. RP volunteered; alphabetical election order (Khem, Koen, Mark, Tom)


--------------------------------------------------------
Raw Transcript

(21:07:07) RP__: So I believe we have two agenda items plus the usual
rolling one
(21:07:17) RP__: Do we have anything on the rolling agenda we have a
pressing need to cover?
(21:10:37) RP__: so, since everyone is quiet I assume everyone doesn't have
much to talk about
(21:10:58) RP__: Yocto wise, we're steering hard to bug fixing and
stabilisation atm
(21:11:16) RP__: I think we'll want to branch shortly
(21:11:26) RP__: which leads into my open of what to call the branch in
oe-core
(21:12:00) RP__: The poky branch will be "edison" for this release
(21:12:23) koen: are we going to use the year.month like OE classic has?
(21:13:19) koen: I'm not terribly fond of it, but it beats plain numbers or
names
(21:14:31) RP__: I know people who hate year.month too
(21:14:35) RP__: so I doubt we can win
(21:15:10) khem [~khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net]
entered the room.
(21:15:11) mode (+v khem) by ChanServ
(21:15:24) RP__: Is that branch going to be useful to people outside Yocto?
(21:15:30) RP__: I'm hoping the answer is yes?
(21:15:32) RP__: hi khem
(21:15:36) khem: hello
(21:16:02) koen: the oe-core branch is for the OE-core release, right?
(21:16:10) khem: traffic delayed me
(21:16:11) RP__: koen: yes
(21:16:19) RP__: khem: I pasted scroll back for you
(21:16:37) RP__: There wasn't much else of interest
(21:17:03) khem: thanks
(21:17:15) RP__: How about <year>.<number>
(21:17:34) koen: 2011.r1 ?
(21:17:40) koen: 2011.1 would be confusing :)
(21:17:40) RP__: yes
(21:17:48) fray: I thought when we talked earlier it was year . month
(21:17:48) khem: rp yy.mm is nicers
(21:17:54) fray: the month was the "expected" month vs actual..
(21:18:06) fray: i.e. if we expected to release in Sept.. it's be 2011.09
(21:18:12) ***RP__ is wondering if numbers like r1 and r2 make more sense
(21:18:12) fray: even if it didn't come out til 10 or 11
(21:18:30) khem: r1 could mean release n
(21:18:31) RP__: first release in 2011, second release in 2011
(21:18:37) koen: but we agree that at least the year would be in it?
(21:18:41) fray: IMHo it should be year.<something>  I don't really care
about the something
(21:18:53) khem: yeah thats ok
(21:18:55) RP__: I think having the year is a reasonable reference frame
(21:20:00) khem: 2011r1 2011r2 ... seems reasonable
(21:20:12) koen: I'm fine with 2011<something>
(21:20:41) koen: next question, when do we ask the layer maintainers to
branch?
(21:21:04) khem: first core should be tagged/branched
(21:21:11) khem: then may be 2-3 weeks
(21:21:47) RP__: koen: I'd suggest sometime after core :)
(21:21:57) RP__: koen: The timing tbd by the layer maintainers?
(21:22:15) koen: I phrased it wrong, sorry
(21:22:29) koen: I meant when do we ask if they are going to branch
(21:22:38) koen: and if so, when
(21:23:21) RP__: koen: When OE-Core branches?
(21:23:38) RP__: and I guess another question for here is do we think
OE-Core is approaching branch point?
(21:24:04) koen: like kergoth I can't say if oe-core is getting better or
worse
(21:24:28) khem: some layers might decide not to release but trunk is always
to be followed
(21:24:51) RP__: koen: Anything that would help make your mind up in that
regard?
(21:24:54) koen: we gain multilib, but the eglibc-locale stuff tooks weeks
to debug and fix
(21:25:48) khem: RP__: how about the hash-style fixes to gcc did that make
sense ?
(21:26:07) khem: I have been occupied didnt follow ml lately
(21:26:15) fray: BTW I never posted, but I did try khem's gcc changes and
they worked fine..
(21:26:17) koen: RP__: I can't really put my finger on what's bothering me
with OE-core
(21:26:39) ***fray has been heads down in prelinker problems for the past 2
1/2 weeks so I've been out of the look on oe-core..
(21:26:42) RP__: khem: I need to look at those patches again, I think there
was something bothering me but offhand I can't remember what
(21:26:45) khem: for me bitbake's memory consumption bothers me
(21:26:49) fray: I need to get back into it this week to provide the updates
and such..
(21:27:09) RP__: koen: Any clues or you really just don't know?
(21:27:22) fray: 2-3 weeks ago I was "happy"..  not sure how things have
been since then
(21:27:36) khem: RP__: there was an problem in gcc long standing distros
hacked gcc specs but this option solved it nicely
(21:28:47) RP__: khem: right, it was the implementation, not the concept
that worried me. I think it was because you were forcing people to use the
target hash pieces rather than making it optional which was how it was
implemented originally
(21:28:58) RP__: khem: e.g. trying to remove it from darwin after those
changes would be painful
(21:29:34) RP__: khem: re: bitbake memory consumption I agree it needs
looking at
(21:29:35) koen: RP__: I've been thinking about it all week and I think
OE-core has no "real" targets like "make foo-image run well on board X" so
 various things fall between the cracks
(21:29:53) RP__: Sadly, the parallel parsing totally smashed all the
profiling ability I used to have with bitbake
(21:30:10) RP__: I'm now effectively blind wrt to performance (and memory
usage)
(21:30:55) RP__: koen: so its too generic and needs to specialise?
(21:31:16) khem: RP__: defaults remain same earlier it was implicit sysv and
now its just specified on cmdline
(21:31:16) RP__: koen: this is partly why there is real hardware in
meta-yocto fwiw
(21:31:33) RP__: khem: you're not understanding what I'm saying
(21:31:38) koen: RP__: I think more people like pb_ and me need to get
serious about oe-core and get more involved
(21:31:51) RP__: khem: You now force "--linker-hash-style" or whatever it is
into LDFLAGS
(21:32:05) RP__: koen: it is happening over time
(21:32:16) RP__: koen: pb_ is reporting bugs which is a good sign he's using
it
(21:32:24) koen: yes
(21:32:25) RP__: and the frequency is down
(21:32:36) RP__: which I'm hoping is good
(21:32:41) koen: yes
(21:33:01) koen: I'm saying that with more people like him, we'd catch bugs
earlier
(21:33:06) khem: RP__: it was foced before too. just that defualt was to not
pass anything and if you pass nothing then --hash-style=sysv is assumed
(21:33:26) RP__: khem: no, it wasn't. You could override one variable and it
wouldn't be in LDFLAGS
(21:33:26) khem: and that should work on darwin too
(21:33:44) fray: my feeling is we're hitting critical mass finally on
features and such that people are using it (and finding problems)
(21:33:45) RP__: now you have to override LDFLAGS to get rid of it
(21:33:46) koen: RP__: anyway, it's just a subjective feeling I have
(21:33:59) fray: I'm still a bit stumped on the adduser issue..  (todays
thread)  ;)
(21:34:09) RP__: koen: thats fine, I'm just interested in those feelings
(21:34:26) RP__: fray: I haven't looked at that one yet
(21:34:37) khem: -export TARGET_LDFLAGS = "-Wl,-O1
${TARGET_LINK_HASH_STYLE}"
(21:34:37) khem: +export TARGET_LDFLAGS = "-Wl,-O1
-Wl,--hash-style=${LINKER_HASH_STYLE}"
(21:34:41) ***RP__ is suffering interrupt stack overflow
(21:34:54) fray: it shows he's got a slightly different (small system) usage
then we'd been testing against..
(21:34:59) fray: which is good!
(21:35:02) RP__: khem: right. before you can set TARGET_LINK_HASH_STYLE = ""
and it removes the option from LDFLAGS
(21:35:12) khem: so what changed ?
(21:35:18) RP__: khem: how do I not pass that option to LDFLAGS after your
change?
(21:35:18) khem: default is still sysv
(21:35:35) khem: what would you gain by not passing it
(21:35:48) khem: I understand one option less on cmdline
(21:35:55) RP__: khem: general configurability regarding toolchains
(21:35:59) khem: since its default
(21:36:11) RP__: khem: We do not want to hardcode the toolchain options
(21:36:27) khem: hmmm so non GNU ld
(21:36:33) RP__: right
(21:36:40) RP__: I don't want to make assumptions in the core
(21:36:51) RP__: once we start to its a slippery slope
(21:37:06) RP__: this case may or may not be minor, its the principle
(21:37:35) RP__: fray: agreed, I'm pleased to see it
(21:37:59) koen: so, before I forget, any volunteers to poke the board about
our elections?
(21:38:17) RP__: koen: I don't mind...
(21:38:31) koen: philip asked for a description of what we wanted to help
them remember
(21:38:50) RP__: koen: description of what?
(21:39:48) RP__: koen: perhaps since you know what Philip wants you could
tell him? :)
(21:41:26) khem: on infra side git move to final destination is still
pending
(21:42:07) RP__: khem: ok
(21:42:21) RP__: Yocto git/web services have moved to their new home now
(21:42:36) khem: cool
(21:42:40) RP__: Also, gitolite now supports free form user repos
(21:42:43) koen: RP__: who will be stepping down :)
(21:42:54) khem: it was me
(21:43:12) RP__: Khem, Koen, Mark, Tom in that order?
(21:43:19) RP__: alphabetical iirc
(21:43:46) RP__: we're enabling free form user contrib repos on git.yp.org
(21:44:41) ***koen was amused by people not getting a pull model on oe-devel
this week
(21:46:33) RP__: ok, so anything left to discuss?
(21:46:57) RP__: koen: I guess if you've not been around the kernel
community it might be a bit more alien
(21:48:32) khem: RP__: the user repos ?
(21:48:33) khem: cool
(21:48:41) khem: I would use it
(21:48:54) RP__: khem: on git.yp.org?
(21:48:58) khem: RP__: yes
(21:49:21) koen: ah, that dropbear failure wasn't due to fedora 15
(21:49:46) RP__: khem: ok, we're about to trail it with a few intel people
and it will take 1-2 weeks to get cgit to show the repos but I'll ping you
then about using it
(21:49:57) khem: RP__: ok
(21:50:38) koen: RP__: what are your thoughts on ditching the combined repo
and use seperate git repos for poky/yocto in the future?
(21:50:54) RP__: koen: which combined repo?
(21:51:00) RP__: koen: you mean the -contrib ones?
(21:51:40) koen: no, poky
(21:52:08) RP__: koen: so drop the poky repo and replace it with nothing,
just scripts?
(21:52:35) koen: something like that
(21:52:39) RP__: koen: why?
(21:53:12) koen: it confuses the hell out of TI people
(21:53:14) RP__: people actually find it easy to use so I'm reluctant to
make thing harder for them
(21:53:48) RP__: koen: I'm sure they'll figure it out ;-)
(21:53:59) koen: I'm not saying it isn't easy to use
(21:54:13) koen: but it is showing a lack of faith in layers from the yocto
side
(21:54:42) RP__: I'd disagree with that
(21:55:17) RP__: and its ironic given I've done more than most people to
promote layers in the first place :)
(21:55:35) koen: but you see why I'm saying that?
(21:55:56) RP__: koen: yes, I can see why you could say it
(21:56:45) RP__: I don't have any objection to others packaging up
collections of layers, be it via scripts or an automated repo
(21:56:47) koen: I don't have strong opinions on it, just passing on the
confusion
(21:57:16) RP__: Yocto tends to the latter since its easier for newcomers to
understand
(21:57:41) koen: the layer tooling blew up, so I'm not updating the angstrom
combined repo anymore
(21:58:02) RP__: koen: thanks. I'm hoping with a little more time there will
less confusion
(21:58:41) RP__: koen: hopefully we'll iron out issues like that with the
tooling
(21:58:57) koen: if only git submodules worked....
(21:59:10) khem: koen: for my needs git submodules work
(21:59:24) RP__: ok, before we start on that I'd like to close the meeting
;-)


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e8f7e94ce5304ae6a1be5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgb(255, 255, 255); "><div>My apologies f=
or the delay on posting this one. This should complete the set. Again, all =
minutes are now available at=A0</div>
</span><span class=3D"Apple-style-span" style=3D"font-family: arial, sans-s=
erif; font-size: 13px; background-color: rgb(255, 255, 255); "><a href=3D"h=
ttp://www.openembedded.org/wiki/TSC">http://www.openembedded.org/wiki/TSC</=
a></span><div>
<font class=3D"Apple-style-span" face=3D"arial, sans-serif"><br></font><spa=
n class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; font-=
size: 13px; background-color: rgb(255, 255, 255); "><div>MINUTES: OE-TSC me=
eting 1-Sep-2011</div>
<div><br></div><div>Attending: Mark, Richard, Khem, Koen</div><div>Apologie=
s: Tom</div><div>Notes: Jefro (not present)</div><div><br></div><div>------=
--------------------------------------------------</div><div>Agenda</div>
<div><br></div><div>1. pick a moderator</div><div>2. agenda items</div><div=
>=A0 =A0a. Yocto update</div><div>=A0 =A0b. oe-core release numbering</div>=
<div><br></div><div>3. status on open subjects</div><div>=A0 =A0a. oe-core<=
/div><div>
=A0 =A0b. elections</div><div>=A0 =A0</div><div>---------------------------=
-----------------------------</div><div>Results</div><div><br></div><div>1.=
 Jefro</div><div><br></div><div>2. a. steering hard to bug fixing and stabi=
lisation, branching shortly</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0 =A0enabling fre=
e form user contrib repos on=A0<a href=3D"http://git.yp.org/" target=3D"_bl=
ank" style=3D"color: rgb(0, 0, 204); ">git.yp.org</a>=A0in 1-2 weeks</div><=
div>=A0 =A0b. oe-core to be 2011.&lt;something&gt; (poky is &quot;edison&qu=
ot;)</div>
<div><br></div><div>3. a. hitting critical mass on features, people startin=
g to use it &amp; file bugs</div><div><span style=3D"white-space: pre-wrap;=
 ">	</span>=A0=A0 =A0ti somewhat confused about layers vs different repos f=
or poky/yocto</div>
<div>=A0 =A0b. RP volunteered; alphabetical election order (Khem, Koen, Mar=
k, Tom)</div><div>=A0 =A0 =A0=A0</div><div><br></div><div>-----------------=
---------------------------------------</div><div>Raw Transcript</div><div>=
<br></div>
<div>(21:07:07) RP__: So I believe we have two agenda items plus the usual =
rolling one</div><div>(21:07:17) RP__: Do we have anything on the rolling a=
genda we have a pressing need to cover?</div><div>(21:10:37) RP__: so, sinc=
e everyone is quiet I assume everyone doesn&#39;t have much to talk about</=
div>
<div>(21:10:58) RP__: Yocto wise, we&#39;re steering hard to bug fixing and=
 stabilisation atm</div><div>(21:11:16) RP__: I think we&#39;ll want to bra=
nch shortly</div><div>(21:11:26) RP__: which leads into my open of what to =
call the branch in oe-core</div>
<div>(21:12:00) RP__: The poky branch will be &quot;edison&quot; for this r=
elease</div><div>(21:12:23) koen: are we going to use the year.month like O=
E classic has?</div><div>(21:13:19) koen: I&#39;m not terribly fond of it, =
but it beats plain numbers or names</div>
<div>(21:14:31) RP__: I know people who hate year.month too</div><div>(21:1=
4:35) RP__: so I doubt we can win</div><div>(21:15:10) khem [~<a href=3D"ma=
ilto:khem@99-57-141-118.lightspeed.sntcca.sbcglobal.net" target=3D"_blank" =
style=3D"color: rgb(0, 0, 204); ">khem@99-57-141-118.lightspeed.sntcca.sbcg=
lobal.net</a>] entered the room.</div>
<div>(21:15:11) mode (+v khem) by ChanServ</div><div>(21:15:24) RP__: Is th=
at branch going to be useful to people outside Yocto?</div><div>(21:15:30) =
RP__: I&#39;m hoping the answer is yes?</div><div>(21:15:32) RP__: hi khem<=
/div>
<div>(21:15:36) khem: hello</div><div>(21:16:02) koen: the oe-core branch i=
s for the OE-core release, right?</div><div>(21:16:10) khem: traffic delaye=
d me</div><div>(21:16:11) RP__: koen: yes</div><div>(21:16:19) RP__: khem: =
I pasted scroll back for you</div>
<div>(21:16:37) RP__: There wasn&#39;t much else of interest</div><div>(21:=
17:03) khem: thanks</div><div>(21:17:15) RP__: How about &lt;year&gt;.&lt;n=
umber&gt;</div><div>(21:17:34) koen: 2011.r1 ?</div><div>(21:17:40) koen: 2=
011.1 would be confusing :)</div>
<div>(21:17:40) RP__: yes</div><div>(21:17:48) fray: I thought when we talk=
ed earlier it was year . month</div><div>(21:17:48) khem: rp=A0<a href=3D"h=
ttp://yy.mm/" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">yy.mm</a>=
=A0is nicers</div>
<div>(21:17:54) fray: the month was the &quot;expected&quot; month vs actua=
l..</div><div>(21:18:06) fray: i.e. if we expected to release in Sept.. it&=
#39;s be 2011.09</div><div>(21:18:12) ***RP__ is wondering if numbers like =
r1 and r2 make more sense</div>
<div>(21:18:12) fray: even if it didn&#39;t come out til 10 or 11</div><div=
>(21:18:30) khem: r1 could mean release n</div><div>(21:18:31) RP__: first =
release in 2011, second release in 2011</div><div>(21:18:37) koen: but we a=
gree that at least the year would be in it?</div>
<div>(21:18:41) fray: IMHo it should be year.&lt;something&gt; =A0I don&#39=
;t really care about the something</div><div>(21:18:53) khem: yeah thats ok=
</div><div>(21:18:55) RP__: I think having the year is a reasonable referen=
ce frame</div>
<div>(21:20:00) khem: 2011r1 2011r2 ... seems reasonable</div><div>(21:20:1=
2) koen: I&#39;m fine with 2011&lt;something&gt;</div><div>(21:20:41) koen:=
 next question, when do we ask the layer maintainers to branch?</div><div>
(21:21:04) khem: first core should be tagged/branched</div><div>(21:21:11) =
khem: then may be 2-3 weeks</div><div>(21:21:47) RP__: koen: I&#39;d sugges=
t sometime after core :)</div><div>(21:21:57) RP__: koen: The timing tbd by=
 the layer maintainers?</div>
<div>(21:22:15) koen: I phrased it wrong, sorry</div><div>(21:22:29) koen: =
I meant when do we ask if they are going to branch</div><div>(21:22:38) koe=
n: and if so, when</div><div>(21:23:21) RP__: koen: When OE-Core branches?<=
/div>
<div>(21:23:38) RP__: and I guess another question for here is do we think =
OE-Core is approaching branch point?</div><div>(21:24:04) koen: like kergot=
h I can&#39;t say if oe-core is getting better or worse</div><div>(21:24:28=
) khem: some layers might decide not to release but trunk is always to be f=
ollowed</div>
<div>(21:24:51) RP__: koen: Anything that would help make your mind up in t=
hat regard?</div><div>(21:24:54) koen: we gain multilib, but the eglibc-loc=
ale stuff tooks weeks to debug and fix</div><div>(21:25:48) khem: RP__: how=
 about the hash-style fixes to gcc did that make sense ?</div>
<div>(21:26:07) khem: I have been occupied didnt follow ml lately</div><div=
>(21:26:15) fray: BTW I never posted, but I did try khem&#39;s gcc changes =
and they worked fine..</div><div>(21:26:17) koen: RP__: I can&#39;t really =
put my finger on what&#39;s bothering me with OE-core</div>
<div>(21:26:39) ***fray has been heads down in prelinker problems for the p=
ast 2 1/2 weeks so I&#39;ve been out of the look on oe-core..</div><div>(21=
:26:42) RP__: khem: I need to look at those patches again, I think there wa=
s something bothering me but offhand I can&#39;t remember what</div>
<div>(21:26:45) khem: for me bitbake&#39;s memory consumption bothers me</d=
iv><div>(21:26:49) fray: I need to get back into it this week to provide th=
e updates and such..</div><div>(21:27:09) RP__: koen: Any clues or you real=
ly just don&#39;t know?</div>
<div>(21:27:22) fray: 2-3 weeks ago I was &quot;happy&quot;.. =A0not sure h=
ow things have been since then</div><div>(21:27:36) khem: RP__: there was a=
n problem in gcc long standing distros hacked gcc specs but this option sol=
ved it nicely</div>
<div>(21:28:47) RP__: khem: right, it was the implementation, not the conce=
pt that worried me. I think it was because you were forcing people to use t=
he target hash pieces rather than making it optional which was how it was i=
mplemented originally</div>
<div>(21:28:58) RP__: khem: e.g. trying to remove it from darwin after thos=
e changes would be painful</div><div>(21:29:34) RP__: khem: re: bitbake mem=
ory consumption I agree it needs looking at</div><div>(21:29:35) koen: RP__=
: I&#39;ve been thinking about it all week and I think OE-core has no &quot=
;real&quot; targets like &quot;make foo-image run well on board X&quot; so =
=A0various things fall between the cracks</div>
<div>(21:29:53) RP__: Sadly, the parallel parsing totally smashed all the p=
rofiling ability I used to have with bitbake</div><div>(21:30:10) RP__: I&#=
39;m now effectively blind wrt to performance (and memory usage)</div><div>
(21:30:55) RP__: koen: so its too generic and needs to specialise?</div><di=
v>(21:31:16) khem: RP__: defaults remain same earlier it was implicit sysv =
and now its just specified on cmdline</div><div>(21:31:16) RP__: koen: this=
 is partly why there is real hardware in meta-yocto fwiw</div>
<div>(21:31:33) RP__: khem: you&#39;re not understanding what I&#39;m sayin=
g</div><div>(21:31:38) koen: RP__: I think more people like pb_ and me need=
 to get serious about oe-core and get more involved</div><div>(21:31:51) RP=
__: khem: You now force &quot;--linker-hash-style&quot; or whatever it is i=
nto LDFLAGS</div>
<div>(21:32:05) RP__: koen: it is happening over time</div><div>(21:32:16) =
RP__: koen: pb_ is reporting bugs which is a good sign he&#39;s using it</d=
iv><div>(21:32:24) koen: yes</div><div>(21:32:25) RP__: and the frequency i=
s down</div>
<div>(21:32:36) RP__: which I&#39;m hoping is good</div><div>(21:32:41) koe=
n: yes</div><div>(21:33:01) koen: I&#39;m saying that with more people like=
 him, we&#39;d catch bugs earlier</div><div>(21:33:06) khem: RP__: it was f=
oced before too. just that defualt was to not pass anything and if you pass=
 nothing then --hash-style=3Dsysv is assumed</div>
<div>(21:33:26) RP__: khem: no, it wasn&#39;t. You could override one varia=
ble and it wouldn&#39;t be in LDFLAGS</div><div>(21:33:26) khem: and that s=
hould work on darwin too</div><div>(21:33:44) fray: my feeling is we&#39;re=
 hitting critical mass finally on features and such that people are using i=
t (and finding problems)</div>
<div>(21:33:45) RP__: now you have to override LDFLAGS to get rid of it</di=
v><div>(21:33:46) koen: RP__: anyway, it&#39;s just a subjective feeling I =
have</div><div>(21:33:59) fray: I&#39;m still a bit stumped on the adduser =
issue.. =A0(todays thread) =A0;)</div>
<div>(21:34:09) RP__: koen: thats fine, I&#39;m just interested in those fe=
elings</div><div>(21:34:26) RP__: fray: I haven&#39;t looked at that one ye=
t</div><div>(21:34:37) khem: -export TARGET_LDFLAGS =3D &quot;-Wl,-O1 ${TAR=
GET_LINK_HASH_STYLE}&quot;</div>
<div>(21:34:37) khem: +export TARGET_LDFLAGS =3D &quot;-Wl,-O1 -Wl,--hash-s=
tyle=3D${LINKER_HASH_STYLE}&quot;</div><div>(21:34:41) ***RP__ is suffering=
 interrupt stack overflow</div><div>(21:34:54) fray: it shows he&#39;s got =
a slightly different (small system) usage then we&#39;d been testing agains=
t..</div>
<div>(21:34:59) fray: which is good!</div><div>(21:35:02) RP__: khem: right=
. before you can set TARGET_LINK_HASH_STYLE =3D &quot;&quot; and it removes=
 the option from LDFLAGS</div><div>(21:35:12) khem: so what changed ?</div>
<div>(21:35:18) RP__: khem: how do I not pass that option to LDFLAGS after =
your change?</div><div>(21:35:18) khem: default is still sysv</div><div>(21=
:35:35) khem: what would you gain by not passing it</div><div>(21:35:48) kh=
em: I understand one option less on cmdline</div>
<div>(21:35:55) RP__: khem: general configurability regarding toolchains</d=
iv><div>(21:35:59) khem: since its default</div><div>(21:36:11) RP__: khem:=
 We do not want to hardcode the toolchain options</div><div>(21:36:27) khem=
: hmmm so non GNU ld</div>
<div>(21:36:33) RP__: right</div><div>(21:36:40) RP__: I don&#39;t want to =
make assumptions in the core</div><div>(21:36:51) RP__: once we start to it=
s a slippery slope</div><div>(21:37:06) RP__: this case may or may not be m=
inor, its the principle</div>
<div>(21:37:35) RP__: fray: agreed, I&#39;m pleased to see it</div><div>(21=
:37:59) koen: so, before I forget, any volunteers to poke the board about o=
ur elections?</div><div>(21:38:17) RP__: koen: I don&#39;t mind...</div>
<div>(21:38:31) koen: philip asked for a description of what we wanted to h=
elp them remember</div><div>(21:38:50) RP__: koen: description of what?</di=
v><div>(21:39:48) RP__: koen: perhaps since you know what Philip wants you =
could tell him? :)</div>
<div>(21:41:26) khem: on infra side git move to final destination is still =
pending</div><div>(21:42:07) RP__: khem: ok</div><div>(21:42:21) RP__: Yoct=
o git/web services have moved to their new home now</div><div>(21:42:36) kh=
em: cool</div>
<div>(21:42:40) RP__: Also, gitolite now supports free form user repos</div=
><div>(21:42:43) koen: RP__: who will be stepping down :)</div><div>(21:42:=
54) khem: it was me</div><div>(21:43:12) RP__: Khem, Koen, Mark, Tom in tha=
t order?</div>
<div>(21:43:19) RP__: alphabetical iirc</div><div>(21:43:46) RP__: we&#39;r=
e enabling free form user contrib repos on=A0<a href=3D"http://git.yp.org/"=
 target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">git.yp.org</a></div><d=
iv>(21:44:41) ***koen was amused by people not getting a pull model on oe-d=
evel this week</div>
<div>(21:46:33) RP__: ok, so anything left to discuss?</div><div>(21:46:57)=
 RP__: koen: I guess if you&#39;ve not been around the kernel community it =
might be a bit more alien</div><div>(21:48:32) khem: RP__: the user repos ?=
</div>
<div>(21:48:33) khem: cool</div><div>(21:48:41) khem: I would use it</div><=
div>(21:48:54) RP__: khem: on=A0<a href=3D"http://git.yp.org/" target=3D"_b=
lank" style=3D"color: rgb(0, 0, 204); ">git.yp.org</a>?</div><div>(21:48:58=
) khem: RP__: yes</div>
<div>(21:49:21) koen: ah, that dropbear failure wasn&#39;t due to fedora 15=
</div><div>(21:49:46) RP__: khem: ok, we&#39;re about to trail it with a fe=
w intel people and it will take 1-2 weeks to get cgit to show the repos but=
 I&#39;ll ping you then about using it</div>
<div>(21:49:57) khem: RP__: ok</div><div>(21:50:38) koen: RP__: what are yo=
ur thoughts on ditching the combined repo and use seperate git repos for po=
ky/yocto in the future?</div><div>(21:50:54) RP__: koen: which combined rep=
o?</div>
<div>(21:51:00) RP__: koen: you mean the -contrib ones?</div><div>(21:51:40=
) koen: no, poky</div><div>(21:52:08) RP__: koen: so drop the poky repo and=
 replace it with nothing, just scripts?</div><div>(21:52:35) koen: somethin=
g like that</div>
<div>(21:52:39) RP__: koen: why?</div><div>(21:53:12) koen: it confuses the=
 hell out of TI people</div><div>(21:53:14) RP__: people actually find it e=
asy to use so I&#39;m reluctant to make thing harder for them</div><div>
(21:53:48) RP__: koen: I&#39;m sure they&#39;ll figure it out ;-)</div><div=
>(21:53:59) koen: I&#39;m not saying it isn&#39;t easy to use</div><div>(21=
:54:13) koen: but it is showing a lack of faith in layers from the yocto si=
de</div>
<div>(21:54:42) RP__: I&#39;d disagree with that</div><div>(21:55:17) RP__:=
 and its ironic given I&#39;ve done more than most people to promote layers=
 in the first place :)</div><div>(21:55:35) koen: but you see why I&#39;m s=
aying that?</div>
<div>(21:55:56) RP__: koen: yes, I can see why you could say it</div><div>(=
21:56:45) RP__: I don&#39;t have any objection to others packaging up colle=
ctions of layers, be it via scripts or an automated repo</div><div>(21:56:4=
7) koen: I don&#39;t have strong opinions on it, just passing on the confus=
ion</div>
<div>(21:57:16) RP__: Yocto tends to the latter since its easier for newcom=
ers to understand</div><div>(21:57:41) koen: the layer tooling blew up, so =
I&#39;m not updating the angstrom combined repo anymore</div><div>(21:58:02=
) RP__: koen: thanks. I&#39;m hoping with a little more time there will les=
s confusion</div>
<div>(21:58:41) RP__: koen: hopefully we&#39;ll iron out issues like that w=
ith the tooling</div><div>(21:58:57) koen: if only git submodules worked...=
.</div><div>(21:59:10) khem: koen: for my needs git submodules work</div>
<div>(21:59:24) RP__: ok, before we start on that I&#39;d like to close the=
 meeting ;-)</div><div><br></div></span><div><br></div>-- <br>Jeff Osier-Mi=
xon <a href=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/bl=
og</a><div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>
</div>

--90e6ba6e8f7e94ce5304ae6a1be5--
