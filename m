Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QqY5X-0000BX-CR; Tue, 09 Aug 2011 00:14:23 +0200
Received: by iyf13 with SMTP id 13so11837166iyf.16
	for <multiple recipients>; Mon, 08 Aug 2011 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=noaAJMkbqaZ2WqAHi9g+5GwQHETv6strymW5Q+SJ3kQ=;
	b=rVOUttcSTh+tGnuLTfKTSuwMolplxZYhZ7c0mIwmSYatBXsQ0d5cGWXUIvOMD9IrO+
	lPRRwezn725pR/BVWFwnK07FihkXhCWMXJwH+XDNIgny8FVuqhkUsZ4RKFqPAp/ECZZk
	ul2MSx2sxfdoyPy28/kZShh5i/0qetubP/z9g=
MIME-Version: 1.0
Received: by 10.43.49.195 with SMTP id vb3mr6005788icb.301.1312841393987; Mon,
	08 Aug 2011 15:09:53 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.164.10 with HTTP; Mon, 8 Aug 2011 15:09:53 -0700 (PDT)
Date: Mon, 8 Aug 2011 15:09:53 -0700
X-Google-Sender-Auth: dQTudzQgX2xZfTNT45FDYv3XEXU
Message-ID: <CA+YB3rYCpdSL_f1QvnqU7S=KiNfjNA=4WR_++Dia80s0+45sHg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC meeting 21-Jul-2011
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
X-List-Received-Date: Mon, 08 Aug 2011 22:14:24 -0000
Content-Type: multipart/alternative; boundary=bcaec52999a7ef612e04aa05b401

--bcaec52999a7ef612e04aa05b401
Content-Type: text/plain; charset=ISO-8859-1

OE TSC meeting 21-Jul-2011

Attendees: Koen, Khem, Richard, Tom
Apologies: Mark, Jefro

Minutes:

01) choose a meeting chair

khem

02) new topics

    - melo updates
melo VM has some issues where it was dying almost every day
per Tom its not hardware issue
over next week git will move to the final VM and other services too will
then follow

03) action items from last week

  --> mention on list about features and stabilisation (RP)
done

  --> patches appearing on oe-dev, khem to send email regarding "put stuff
in meta-oe"
done, can take further
--> write up which scripts to use (khem)

05) Status updates
      - elections
delay between elections? need info from board - duration between votes
--> TSC recommends 2 months to the board

      - oe-core
tom is beating up siteinfo and cursing perl
fray's multilib work against poky, but he also created a version against
oe-core+bitbake
--> RP to issue an RFC on fray's multilib stuff

      - bsp guidelines
Phil posted querries on linux-yocto which was discussed in detail
khem recommends a document on using tooling to extend linux-yocto to a
different machine and another doc to use linux-yocto tooling for a different
kernel sourcebase
consider having a 'normal' linux recipe in OE core that people can bbappend
Bruce volunteered
--> add status for next week

Paul Eggleton might be working on some OE wiki doc about OE-Core

     - metadata layer splitting
recipes are moving from meta-oe into oe-core somewhat smoothly
general idea is to find a way to split off sato, then rearrange the gnome
stuff on into e.g. gmae and gnome-proper and clean up spurious deps

     - infrastructure

Raw Transcript

(21:11:23) khem: Lets start
(21:11:37) RP__: fray is on vacation again
(21:11:40) Tartarus: no new agenda items here
(21:11:41) khem: we dont have scribe today so someone needs to send
transcripts [to Jefro]
(21:11:51) ***RP__ can do that
(21:11:53) koen: I'm about to fall asleep, so I'd appreciate if someone else
can chair
(21:12:05) khem: I can
(21:12:37) Tartarus: ok, khem chairs
(21:12:47) khem: any new items ?
(21:12:50) khem: for agenda
(21:12:57) koen: not from me
(21:13:12) khem: melo updates
(21:13:19) khem: I would like to add
(21:13:54) ***RP__ doesn't have additions
(21:14:39) khem: http://pastebin.com/xa37DyL5 here
(21:14:42) khem: agenda
(21:14:54) khem: I think melo will fall to infra
(21:15:09) khem: AIs from past
(21:15:11) RP__: "including Richard in case he wants to stop by"? :)
(21:16:32) ***RP__ guesses this is off an old agenda :)
(21:16:59) RP__: Last week I took an AR to mention on list about features
and stabilisation. I did that
(21:17:06) khem: yes it was I am on a console and weird things can happen
with links
(21:17:21) khem: OK we can close that AR
(21:17:50) khem: I sent email as well to request devs to post patches to new
layering structure
(21:17:56) khem: there were questions on that
(21:18:32) RP__: Did those questions get good answers?
(21:18:36) khem: no
(21:19:03) RP__: Is the problem someone just needs to write them down or is
there some unknown things which are the problem?
(21:19:07) Tartarus: There's still a need for oe-core for dummies on the oe
wiki
(21:19:17) khem: yeah as Tartarus said
(21:19:26) khem: people want step by step ramp up guide
(21:19:28) Tartarus: no offense, meant, for the log readers, nbtw
(21:19:34) Tartarus: I needed that post a while back myself :)
(21:20:09) koen: the oe-core and angstrom setupscripts might be to automated
for some people
(21:20:21) koen: (and even the 3 steps for the angstrom scripts are too much
for some)
(21:20:36) khem: I guess we need to reply to that thread
(21:21:09) khem: Moving on to Status
(21:21:32) Tartarus: Well, hang on
(21:21:36) RP__: I agree some further documentation would be good.
Unfortunately I'm maxed out atm and am not sure I can help there :(
(21:21:42) Tartarus: We need to write up "Use this script or that script or"
(21:21:44) Tartarus: and someone needs to do that
(21:22:05) khem: yes. I can take it further
(21:22:11) Tartarus: ok, thanks
(21:22:13) khem: and continue the thread
(21:22:34) khem: we will follow up on this next week.
(21:22:53) khem: Shall we move on to Status
(21:23:00) Tartarus: ok w/ me
(21:23:11) koen: the boards seemed to be confused about the elections
(21:23:13) koen: -s
(21:23:30) koen: so we can pick up the slack or wait
(21:23:34) RP__: thanks khem!
(21:23:41) khem: ok now RP is elected back does the second seat election got
announced
(21:24:02) RP__: Well, I guess the question is whether there is a delay
between the elections or not?
(21:24:24) khem: I guess we need to get this information from board
(21:25:08) RP__: Going back in time, I think we said a 6 month stable period
for the TSC was desireable so the interval was one month between
(21:25:18) khem: ok
(21:25:25) khem: which means August
(21:25:28) RP__: although at the last meeting we did talk about 2
(21:25:43) koen: but with proposal, discuss and vote it is nearly a month if
we do back to back
(21:26:13) Tartarus: I have no strong opinion either way
(21:26:29) RP__: koen: back to back it probably is then.
(21:26:29) koen: I have other things to do, so waiting is my choice
(21:26:39) khem: ok
(21:26:54) RP__: but I also don't have a really strong preference, I'm just
observing what's been previously discussed
(21:28:18) khem: do we need to recommend something to board in this regard ?
(21:28:28) koen: I think so
(21:28:36) koen: their minutes showed confusion
(21:29:33) koen: anyway
(21:29:34) khem: ok lets make it 2 months I guess that will be good for
completing the process
(21:29:36) koen: onto oe-core?
(21:30:15) khem: oe-core status it is
(21:30:38) Tartarus: Beating up siteinfo, cursing perl
(21:30:45) Tartarus: Hope to continue down the first path more, less the
second
(21:30:55) khem: I tried to make core-images work with uclibc
(21:31:01) RP__: We're getting there wit this...
(21:31:27) RP__: re: multilb, fray has done some work on writing nicer more
powerful tune files
(21:31:39) khem: cool
(21:31:41) RP__: The new versions look scary but should actually let people
do all the things they want to do
(21:31:55) RP__: I'm aiming to put out a RFC tomorrow
(21:32:03) khem: ok
(21:32:11) Tartarus: I've seen fray's work, concept seems fine
(21:32:27) RP__: I'll proactively merge the bitbake piece to try and make
this easier for people to play with since its a simple bitbake change
(21:32:49) RP__: means playing with version numbers again which I'm not so
happy about but I can't see a way around it
(21:33:09) koen: I'd like to reiterate my wish for merge requests/RFCs to be
against oe-core whenever possible
(21:33:59) Tartarus: I concurr but I know fray's stuff is vs poky
(21:34:00) khem: OK may be a message clarifying which patches go to which
list is needed
(21:34:09) Tartarus: And that was partly my point of the email I sent last
week we had little discussion about
(21:34:12) RP__: fray did make a version against oe-core +bitbake
(21:34:13) koen: since oe-core was very breakage free this week I had time
to test things
(21:34:30) koen: but since they were against poky I decided to work on
kernel 3.0rc
(21:34:48) RP__: koen: Its not that hard to apply them ;-)
(21:34:58) Tartarus: RP__: But it's not a git pull
(21:35:00) RP__: but I understand and am trying to avoid it where possible
(21:35:06) RP__: Tartarus: so?
(21:35:17) Tartarus: So our effort barriers have all changed
(21:35:34) Tartarus: "I've gotta export these patches some way to git am
them? Bah, I'll go work on something else that's calling my attention"
(21:35:54) RP__: Tartarus: just pull it into a branch and cherrypick
(21:35:55) koen: exactly
(21:36:02) ***RP__ has to do this all the time
(21:36:19) RP__: since nobody actually listens to any requests to make his
life any easier
(21:36:40) Tartarus: I'll see what the pain level is next time
(21:36:54) Tartarus: but frankly I assumed pulling poky-contrib into oe-core
would suck a bit
(21:37:01) Tartarus: So I just cloned a contrib tree
(21:37:15) RP__: Tartarus: doesn't actually matter. Means your repo has a
few extra refs in
(21:37:38) khem: I guess you get more testers if patches are already rebased
on oe-core
(21:38:01) RP__: khem: rebasing on oe-core isn't so easy when the series
touches bitbake+core+meta-yocto
(21:38:02) koen: the idea is that oe-core is the master repo, so patches
should be against that, whenever possible
(21:38:43) Tartarus: Maybe this is a + for submodule stuff?
(21:38:51) khem: so we will await next RFC on multilib
(21:38:55) Tartarus: And kergoth's make+submodule thing (and yes, I'm a bit
biased)
(21:39:00) RP__: Tartarus: I doubt that
(21:39:27) koen: I hate make
(21:39:35) koen: and I hate git submodules even more
(21:39:42) ***khem uses make+submodules in slugos
(21:39:50) Tartarus: heh
(21:40:01) Tartarus: So, moving on then, yes, we all await the next peek at
multilib
(21:40:01) khem: shall we move to next topic
(21:40:11) RP__: Bottom line is that the multilib stuff is hard enough to
develop without the branch problems. We're doing out best
(21:40:26) RP__: I'm really sorry its a pain to test and not a simple one
liner but I don't think its that big of an issue
(21:40:27) khem: agreed
(21:40:43) khem: BSP guidelines
(21:41:07) khem: Phil posted querries on linux-yocto which was discussed in
detail
(21:41:13) khem: would someone want to comment on that
(21:41:30) RP__: I read some of the thread, I saw Bruce repsonding and
haven't read the conclusion
(21:41:44) RP__: Is there something specific that needs commenting on?
(21:42:25) khem: I think a document on using tooling to extend linux-yocto
to a different machine and another doc to use linux-yocto tooling for a
different kernel sourcebase
(21:43:06) khem: I thoght it will be a nice addition to docs
(21:43:54) RP__: Was that mentioned in the thread or is this an extra
conclusion?
(21:44:02) RP__: Sorry not to be up to speed on that one :/
(21:44:05) khem: I guess that was conclusion
(21:44:27) RP__: ok, that sounds good to me
(21:44:33) koen: I think we need to consider having a 'normal' linux recipe
in OE core that people can bbappend
(21:44:37) RP__: Did anyone volunteer or do we need to find now?
(21:44:41) RP__: er, find one
(21:44:46) khem: I think Bruce did
(21:44:54) Tartarus: koen: Agreed, I thought we agreed to that a while ago.
(21:44:55) koen: bruce volunteered for large parts, if not all
(21:45:29) RP__: Lets add a status check on this to next week's agenda
(21:45:35) RP__: ^^^^ note for jefro
(21:45:36) khem: ok
(21:45:52) khem: so moving on ?
(21:45:56) RP__: btw, I think Paul Eggleton might be working on some OE wiki
doc about OE-Core
(21:46:20) khem: anything specific to layering metadata splitting
(21:46:24) ***RP__ will close on that with him tomorrow
(21:46:43) RP__: khem: I don't think it goes into specifics on that
(21:46:43) khem: thanks RP
(21:47:04) khem: RP__: I was mentioning the next topic on agenda :)
(21:47:06) RP__: khem: Just keep an eye open for it to avoid duplication
(21:47:17) RP__: khem: ah, yes ;-)
(21:48:00) khem: I have observed that recipes are moving from meta-oe into
oe-core smoothly
(21:48:21) RP__: near enough, yes :)
(21:49:04) khem: if there are no further comments on this then we can talk
about infra
(21:49:17) koen: people at work were kind of shocked when I told them new
recipes will have a tough time getting into oe-core
(21:49:23) koen: (new as in new PN, now new PV)
(21:49:35) khem: heh
(21:50:03) RP__: koen: well, this is where the layer model comes into play.
It depends what they do
(21:50:17) koen: RP__: that's what I said
(21:50:27) koen: but in general I think oe-core needs to shrink
(21:50:38) koen: I haven't come up with a workable plan, though
(21:51:04) RP__: koen: Personally, I suspect its actually about right -
enough there to actually test stuff but not so big its unmaintainable
(21:51:24) khem: I think if there are recipes that dont go into any core-*
image
(21:51:34) khem: that could move out to begin
(21:51:47) koen: I was thinking of splitting it up into more layers and then
move around a few layers between oe-core, meta-oe, yocto, etc
(21:52:11) koen: but like I said, no workable plan yet
(21:52:17) khem: ok
(21:52:32) RP__: It is a bit incestuous atm :/
(21:53:16) koen: the general idea is to find a way to split off sato, then
rearrange the gnome stuff on into e.g. gmae and gnome-proper and clean up
spurious deps
(21:53:43) khem: yeah I think just have x11 in oe-core
(21:53:44) RP__: I love the way sato is always the target for this :)
(21:53:59) koen: RP__: it's the gating item for various gnome portions
(21:54:17) ***khem will start about kde
(21:54:26) RP__: koen: Its also a good way to work out the core gnome pieces
(21:54:46) koen: RP__: see my comment about rearranging gnome stuff :)
(21:54:48) RP__: meta-gmae might be a better name for meta-gnome in core
(21:55:18) RP__: koen: I'm yet to be convinced we should remove all gnome
from the core
(21:55:20) koen: I'm not sure gmae still exists, but that's just splitting
hairs over the name :)
(21:55:40) RP__: koen: still exists, whether it actually does anything...
(21:55:44) koen: RP__: I'm not saying we should remove it, just that we
split it up, take a step back and then reshuffle
(21:55:55) koen: oe-core might end up being bigger, but better seperated
(21:56:17) RP__: moving it up a level in the tree might be better I guess
(21:56:25) RP__: its pieces like glib that get messy
(21:56:34) ***koen stops handwaving till he has a better thought out plan
(21:56:47) RP__: glib2 obviously
(21:57:00) RP__: koen: Also keep in mind timings
(21:57:16) RP__: If we do something like that it might need to be next
development cycle unless its soon
(21:57:26) koen: I know
(21:57:49) RP__: So we're nearly out of time - melo?
(21:58:21) RP__: I gather something happened but I'm unaware of what
(21:58:22) khem: someone popped here
(21:58:23) khem: sorry
(21:58:56) khem: melo VM has some issues where it was dying
(21:59:01) khem: almost everyday recently
(21:59:48) khem: per Tom its not hardware issue since other VMs are running
fine on same machine
(22:00:04) RP__: What is special about that VM?
(22:00:14) khem: nothing
(22:00:15) RP__: or is it broken software wise somehow?
(22:00:30) khem: yes it was installed long ago with ubuntu 8.04
(22:00:48) khem: and then upgraded to 10.04 but not reinstalled
(22:01:07) khem: so Tom decided that it was time to setup new
(22:01:11) koen: Tom K had a good description of the problem at ELC
(22:01:12) khem: instance
(22:01:53) RP__: ok, it sounds like Tom has a handle on it
(22:02:03) khem: and this vm has tinderbox and bugzilla and stuff installed
in weird way
(22:02:04) RP__: I have noticed there are some stale DNS entries around
(22:02:15) koen: the only issue today was that his mailinglist post got
delayed
(22:02:22) khem: thats because git got moved to different machine yesterday
(22:02:24) RP__: openembedded.net doesn't work properly now
(22:02:35) RP__: but I can guess why
(22:03:12) khem: over next week git will move to the final VM and other
services too will then follow
(22:03:35) RP__: khem: sounds good, thanks go to Tom for fixing this
(22:03:52) khem: and to cbrake and yours Truly here :)
(22:04:04) RP__: well, yes, everyone involved! :)
(22:04:20) ***RP__ wasn't sure exactly who was working on it
(22:04:49) khem: ok so we are done with agenda
(22:04:52) khem: thanks everyone
(22:05:13) khem: meeting is now closed
(22:05:17) RP__: thanks khem
(22:05:24) ***RP__ will mail jefro the logs

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--bcaec52999a7ef612e04aa05b401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-f=
amily: arial, sans-serif; font-size: 13px; ">OE TSC meeting 21-Jul-2011<div=
><br></div><div>Attendees: Koen, Khem, Richard, Tom</div><div>Apologies: Ma=
rk, Jefro</div>
<div><br></div><div>Minutes:</div><div><br></div><div><div>01) choose a mee=
ting chair</div><div><br></div><div>khem</div><div><br></div><div>02) new t=
opics</div><div><br></div><div>=A0 =A0 - melo updates</div><div><span style=
=3D"border-collapse: collapse; font-family: arial, sans-serif; font-size: 1=
3px; ">melo VM has some issues where it was dying almost every day</span></=
div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; ">per Tom its not hardware issue</span></div><div><spa=
n style=3D"border-collapse: collapse; font-family: arial, sans-serif; font-=
size: 13px; ">over next week git will move to the final VM and other servic=
es too will then follow</span></div>
<div><br></div><div>03) action items from last week</div><div><br></div><di=
v>=A0 --&gt;=A0<span style=3D"border-collapse: collapse; font-family: arial=
, sans-serif; font-size: 13px; ">mention on list about features and stabili=
sation (RP)=A0</span></div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; ">done</span></div><div><span style=3D"border-collapse=
: collapse; font-family: arial, sans-serif; font-size: 13px; "><br></span><=
/div>
<div>=A0 --&gt; patches appearing on oe-dev, khem to send email regarding &=
quot;put stuff in meta-oe&quot;=A0</div><div>done, can take further</div><d=
iv>--&gt; write up which scripts to use (khem)</div><div><br></div><div>05)=
 Status updates</div>
<div>=A0 =A0 =A0 - elections</div><div>delay between elections? need info f=
rom board - duration between votes</div><div>--&gt; TSC recommends 2 months=
 to the board</div><div><br></div><div>=A0 =A0 =A0 - oe-core</div><div>tom =
is beating up siteinfo and cursing perl</div>
<div>fray&#39;s multilib work against poky, but he also created a version a=
gainst oe-core+bitbake</div><div>--&gt; RP to issue an RFC on fray&#39;s mu=
ltilib stuff</div><div><br></div><div>=A0 =A0 =A0 - bsp guidelines</div><di=
v>
<span style=3D"border-collapse: collapse; font-family: arial, sans-serif; f=
ont-size: 13px; ">Phil posted querries on linux-yocto which was discussed i=
n detail</span></div><div><span style=3D"border-collapse: collapse; font-fa=
mily: arial, sans-serif; font-size: 13px; ">khem recommends a=A0</span><spa=
n style=3D"border-collapse: collapse; font-family: arial, sans-serif; font-=
size: 13px; ">document on using tooling to extend linux-yocto to a differen=
t machine and another doc to use linux-yocto tooling for a different kernel=
 sourcebase</span></div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; ">consider having a &#39;normal&#39; linux recipe in O=
E core that people can bbappend</span></div><div><span style=3D"border-coll=
apse: collapse; font-family: arial, sans-serif; font-size: 13px; ">Bruce vo=
lunteered</span></div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; ">--&gt; add status for next week</span></div><div><br=
></div><div><span style=3D"border-collapse: collapse; font-family: arial, s=
ans-serif; font-size: 13px; ">Paul Eggleton might be working on some OE wik=
i doc about OE-Core</span></div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; "><br></span></div><div>=A0=A0 =A0 - metadata layer sp=
litting</div><div><span style=3D"border-collapse: collapse; font-family: ar=
ial, sans-serif; font-size: 13px; ">recipes are moving from meta-oe into oe=
-core somewhat smoothly</span></div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; ">general idea is to find a way to split off sato, the=
n rearrange the gnome stuff on into e.g. gmae and gnome-proper and clean up=
 spurious deps</span></div>
<div><span style=3D"border-collapse: collapse; font-family: arial, sans-ser=
if; font-size: 13px; "><br></span></div><div>=A0 =A0 =A0- infrastructure</d=
iv></div><div><br></div><div>Raw Transcript</div><div><br></div><div><span =
style=3D"border-collapse: collapse; font-family: arial, sans-serif; font-si=
ze: 13px; ">(21:11:23) khem: Lets start<br>
(21:11:37) RP__: fray is on vacation again<br>(21:11:40) Tartarus: no new a=
genda items here<br>(21:11:41) khem: we dont have scribe today so someone n=
eeds to send transcripts [to Jefro]<br>(21:11:51) ***RP__ can do that<br>
(21:11:53) koen: I&#39;m about to fall asleep, so I&#39;d appreciate if som=
eone else can chair<br>(21:12:05) khem: I can<br>(21:12:37) Tartarus: ok, k=
hem chairs<br>(21:12:47) khem: any new items ?<br>(21:12:50) khem: for agen=
da<br>
(21:12:57) koen: not from me<br>(21:13:12) khem: melo updates<br>(21:13:19)=
 khem: I would like to add<br>(21:13:54) ***RP__ doesn&#39;t have additions=
<br>(21:14:39) khem:=A0<a href=3D"http://pastebin.com/xa37DyL5" target=3D"_=
blank" style=3D"color: rgb(0, 0, 204); ">http://pastebin.com/xa37DyL5</a>=
=A0here<br>
(21:14:42) khem: agenda<br>(21:14:54) khem: I think melo will fall to infra=
<br>(21:15:09) khem: AIs from past<br>(21:15:11) RP__: &quot;including Rich=
ard in case he wants to stop by&quot;? :)<br>(21:16:32) ***RP__ guesses thi=
s is off an old agenda :)<br>
(21:16:59) RP__: Last week I took an AR to mention on list about features a=
nd stabilisation. I did that<br>(21:17:06) khem: yes it was I am on a conso=
le and weird things can happen with links<br>(21:17:21) khem: OK we can clo=
se that AR<br>
(21:17:50) khem: I sent email as well to request devs to post patches to ne=
w layering structure<br>(21:17:56) khem: there were questions on that<br>(2=
1:18:32) RP__: Did those questions get good answers?<br>(21:18:36) khem: no=
<br>
(21:19:03) RP__: Is the problem someone just needs to write them down or is=
 there some unknown things which are the problem?<br>(21:19:07) Tartarus: T=
here&#39;s still a need for oe-core for dummies on the oe wiki<br>(21:19:17=
) khem: yeah as Tartarus said<br>
(21:19:26) khem: people want step by step ramp up guide<br>(21:19:28) Tarta=
rus: no offense, meant, for the log readers, nbtw<br>(21:19:34) Tartarus: I=
 needed that post a while back myself :)<br>(21:20:09) koen: the oe-core an=
d angstrom setupscripts might be to automated for some people<br>
(21:20:21) koen: (and even the 3 steps for the angstrom scripts are too muc=
h for some)<br>(21:20:36) khem: I guess we need to reply to that thread<br>=
(21:21:09) khem: Moving on to Status<br>(21:21:32) Tartarus: Well, hang on<=
br>
(21:21:36) RP__: I agree some further documentation would be good. Unfortun=
ately I&#39;m maxed out atm and am not sure I can help there :(<br>(21:21:4=
2) Tartarus: We need to write up &quot;Use this script or that script or&qu=
ot;<br>
(21:21:44) Tartarus: and someone needs to do that<br>(21:22:05) khem: yes. =
I can take it further<br>(21:22:11) Tartarus: ok, thanks<br>(21:22:13) khem=
: and continue the thread<br>(21:22:34) khem: we will follow up on this nex=
t week.<br>
(21:22:53) khem: Shall we move on to Status<br>(21:23:00) Tartarus: ok w/ m=
e<br>(21:23:11) koen: the boards seemed to be confused about the elections<=
br>(21:23:13) koen: -s<br>(21:23:30) koen: so we can pick up the slack or w=
ait<br>
(21:23:34) RP__: thanks khem!<br>(21:23:41) khem: ok now RP is elected back=
 does the second seat election got announced<br>(21:24:02) RP__: Well, I gu=
ess the question is whether there is a delay between the elections or not?<=
br>
(21:24:24) khem: I guess we need to get this information from board<br>(21:=
25:08) RP__: Going back in time, I think we said a 6 month stable period fo=
r the TSC was desireable so the interval was one month between<br>(21:25:18=
) khem: ok<br>
(21:25:25) khem: which means August<br>(21:25:28) RP__: although at the las=
t meeting we did talk about 2<br>(21:25:43) koen: but with proposal, discus=
s and vote it is nearly a month if we do back to back<br>(21:26:13) Tartaru=
s: I have no strong opinion either way<br>
(21:26:29) RP__: koen: back to back it probably is then.<br>(21:26:29) koen=
: I have other things to do, so waiting is my choice<br>(21:26:39) khem: ok=
<br>(21:26:54) RP__: but I also don&#39;t have a really strong preference, =
I&#39;m just observing what&#39;s been previously discussed<br>
(21:28:18) khem: do we need to recommend something to board in this regard =
?<br>(21:28:28) koen: I think so<br>(21:28:36) koen: their minutes showed c=
onfusion<br>(21:29:33) koen: anyway<br>(21:29:34) khem: ok lets make it 2 m=
onths I guess that will be good for completing the process<br>
(21:29:36) koen: onto oe-core?<br>(21:30:15) khem: oe-core status it is<br>=
(21:30:38) Tartarus: Beating up siteinfo, cursing perl<br>(21:30:45) Tartar=
us: Hope to continue down the first path more, less the second<br>(21:30:55=
) khem: I tried to make core-images work with uclibc<br>
(21:31:01) RP__: We&#39;re getting there wit this...<br>(21:31:27) RP__: re=
: multilb, fray has done some work on writing nicer more powerful tune file=
s<br>(21:31:39) khem: cool<br>(21:31:41) RP__: The new versions look scary =
but should actually let people do all the things they want to do<br>
(21:31:55) RP__: I&#39;m aiming to put out a RFC tomorrow<br>(21:32:03) khe=
m: ok<br>(21:32:11) Tartarus: I&#39;ve seen fray&#39;s work, concept seems =
fine<br>(21:32:27) RP__: I&#39;ll proactively merge the bitbake piece to tr=
y and make this easier for people to play with since its a simple bitbake c=
hange<br>
(21:32:49) RP__: means playing with version numbers again which I&#39;m not=
 so happy about but I can&#39;t see a way around it<br>(21:33:09) koen: I&#=
39;d like to reiterate my wish for merge requests/RFCs to be against oe-cor=
e whenever possible<br>
(21:33:59) Tartarus: I concurr but I know fray&#39;s stuff is vs poky<br>(2=
1:34:00) khem: OK may be a message clarifying which patches go to which lis=
t is needed<br>(21:34:09) Tartarus: And that was partly my point of the ema=
il I sent last week we had little discussion about<br>
(21:34:12) RP__: fray did make a version against oe-core +bitbake<br>(21:34=
:13) koen: since oe-core was very breakage free this week I had time to tes=
t things<br>(21:34:30) koen: but since they were against poky I decided to =
work on kernel 3.0rc<br>
(21:34:48) RP__: koen: Its not that hard to apply them ;-)<br>(21:34:58) Ta=
rtarus: RP__: But it&#39;s not a git pull<br>(21:35:00) RP__: but I underst=
and and am trying to avoid it where possible<br>(21:35:06) RP__: Tartarus: =
so?<br>
(21:35:17) Tartarus: So our effort barriers have all changed<br>(21:35:34) =
Tartarus: &quot;I&#39;ve gotta export these patches some way to git am them=
? Bah, I&#39;ll go work on something else that&#39;s calling my attention&q=
uot;<br>
(21:35:54) RP__: Tartarus: just pull it into a branch and cherrypick<br>(21=
:35:55) koen: exactly<br>(21:36:02) ***RP__ has to do this all the time<br>=
(21:36:19) RP__: since nobody actually listens to any requests to make his =
life any easier<br>
(21:36:40) Tartarus: I&#39;ll see what the pain level is next time<br>(21:3=
6:54) Tartarus: but frankly I assumed pulling poky-contrib into oe-core wou=
ld suck a bit<br>(21:37:01) Tartarus: So I just cloned a contrib tree<br>
(21:37:15) RP__: Tartarus: doesn&#39;t actually matter. Means your repo has=
 a few extra refs in<br>(21:37:38) khem: I guess you get more testers if pa=
tches are already rebased on oe-core<br>(21:38:01) RP__: khem: rebasing on =
oe-core isn&#39;t so easy when the series touches bitbake+core+meta-yocto<b=
r>
(21:38:02) koen: the idea is that oe-core is the master repo, so patches sh=
ould be against that, whenever possible<br>(21:38:43) Tartarus: Maybe this =
is a + for submodule stuff?<br>(21:38:51) khem: so we will await next RFC o=
n multilib<br>
(21:38:55) Tartarus: And kergoth&#39;s make+submodule thing (and yes, I&#39=
;m a bit biased)<br>(21:39:00) RP__: Tartarus: I doubt that<br>(21:39:27) k=
oen: I hate make<br>(21:39:35) koen: and I hate git submodules even more<br=
>
(21:39:42) ***khem uses make+submodules in slugos<br>(21:39:50) Tartarus: h=
eh<br>(21:40:01) Tartarus: So, moving on then, yes, we all await the next p=
eek at multilib<br>(21:40:01) khem: shall we move to next topic<br>(21:40:1=
1) RP__: Bottom line is that the multilib stuff is hard enough to develop w=
ithout the branch problems. We&#39;re doing out best<br>
(21:40:26) RP__: I&#39;m really sorry its a pain to test and not a simple o=
ne liner but I don&#39;t think its that big of an issue<br>(21:40:27) khem:=
 agreed<br>(21:40:43) khem: BSP guidelines<br>(21:41:07) khem: Phil posted =
querries on linux-yocto which was discussed in detail<br>
(21:41:13) khem: would someone want to comment on that<br>(21:41:30) RP__: =
I read some of the thread, I saw Bruce repsonding and haven&#39;t read the =
conclusion<br>(21:41:44) RP__: Is there something specific that needs comme=
nting on?<br>
(21:42:25) khem: I think a document on using tooling to extend linux-yocto =
to a different machine and another doc to use linux-yocto tooling for a dif=
ferent kernel sourcebase<br>(21:43:06) khem: I thoght it will be a nice add=
ition to docs<br>
(21:43:54) RP__: Was that mentioned in the thread or is this an extra concl=
usion?<br>(21:44:02) RP__: Sorry not to be up to speed on that one :/<br>(2=
1:44:05) khem: I guess that was conclusion<br>(21:44:27) RP__: ok, that sou=
nds good to me<br>
(21:44:33) koen: I think we need to consider having a &#39;normal&#39; linu=
x recipe in OE core that people can bbappend<br>(21:44:37) RP__: Did anyone=
 volunteer or do we need to find now?<br>(21:44:41) RP__: er, find one<br>
(21:44:46) khem: I think Bruce did<br>(21:44:54) Tartarus: koen: Agreed, I =
thought we agreed to that a while ago.<br>(21:44:55) koen: bruce volunteere=
d for large parts, if not all<br>(21:45:29) RP__: Lets add a status check o=
n this to next week&#39;s agenda<br>
(21:45:35) RP__: ^^^^ note for jefro<br>(21:45:36) khem: ok<br>(21:45:52) k=
hem: so moving on ?<br>(21:45:56) RP__: btw, I think Paul Eggleton might be=
 working on some OE wiki doc about OE-Core<br>(21:46:20) khem: anything spe=
cific to layering metadata splitting<br>
(21:46:24) ***RP__ will close on that with him tomorrow<br>(21:46:43) RP__:=
 khem: I don&#39;t think it goes into specifics on that<br>(21:46:43) khem:=
 thanks RP<br>(21:47:04) khem: RP__: I was mentioning the next topic on age=
nda :)<br>
(21:47:06) RP__: khem: Just keep an eye open for it to avoid duplication<br=
>(21:47:17) RP__: khem: ah, yes ;-)<br>(21:48:00) khem: I have observed tha=
t recipes are moving from meta-oe into oe-core smoothly<br>(21:48:21) RP__:=
 near enough, yes :)<br>
(21:49:04) khem: if there are no further comments on this then we can talk =
about infra<br>(21:49:17) koen: people at work were kind of shocked when I =
told them new recipes will have a tough time getting into oe-core<br>(21:49=
:23) koen: (new as in new PN, now new PV)<br>
(21:49:35) khem: heh<br>(21:50:03) RP__: koen: well, this is where the laye=
r model comes into play. It depends what they do<br>(21:50:17) koen: RP__: =
that&#39;s what I said<br>(21:50:27) koen: but in general I think oe-core n=
eeds to shrink<br>
(21:50:38) koen: I haven&#39;t come up with a workable plan, though<br>(21:=
51:04) RP__: koen: Personally, I suspect its actually about right - enough =
there to actually test stuff but not so big its unmaintainable<br>(21:51:24=
) khem: I think if there are recipes that dont go into any core-* image<br>
(21:51:34) khem: that could move out to begin<br>(21:51:47) koen: I was thi=
nking of splitting it up into more layers and then move around a few layers=
 between oe-core, meta-oe, yocto, etc<br>(21:52:11) koen: but like I said, =
no workable plan yet<br>
(21:52:17) khem: ok<br>(21:52:32) RP__: It is a bit incestuous atm :/<br>(2=
1:53:16) koen: the general idea is to find a way to split off sato, then re=
arrange the gnome stuff on into e.g. gmae and gnome-proper and clean up spu=
rious deps<br>
(21:53:43) khem: yeah I think just have x11 in oe-core<br>(21:53:44) RP__: =
I love the way sato is always the target for this :)<br>(21:53:59) koen: RP=
__: it&#39;s the gating item for various gnome portions<br>(21:54:17) ***kh=
em will start about kde<br>
(21:54:26) RP__: koen: Its also a good way to work out the core gnome piece=
s<br>(21:54:46) koen: RP__: see my comment about rearranging gnome stuff :)=
<br>(21:54:48) RP__: meta-gmae might be a better name for meta-gnome in cor=
e<br>
(21:55:18) RP__: koen: I&#39;m yet to be convinced we should remove all gno=
me from the core<br>(21:55:20) koen: I&#39;m not sure gmae still exists, bu=
t that&#39;s just splitting hairs over the name :)<br>(21:55:40) RP__: koen=
: still exists, whether it actually does anything...<br>
(21:55:44) koen: RP__: I&#39;m not saying we should remove it, just that we=
 split it up, take a step back and then reshuffle<br>(21:55:55) koen: oe-co=
re might end up being bigger, but better seperated<br>(21:56:17) RP__: movi=
ng it up a level in the tree might be better I guess<br>
(21:56:25) RP__: its pieces like glib that get messy<br>(21:56:34) ***koen =
stops handwaving till he has a better thought out plan<br>(21:56:47) RP__: =
glib2 obviously<br>(21:57:00) RP__: koen: Also keep in mind timings<br>
(21:57:16) RP__: If we do something like that it might need to be next deve=
lopment cycle unless its soon<br>(21:57:26) koen: I know<br>(21:57:49) RP__=
: So we&#39;re nearly out of time - melo?<br>(21:58:21) RP__: I gather some=
thing happened but I&#39;m unaware of what<br>
(21:58:22) khem: someone popped here<br>(21:58:23) khem: sorry<br>(21:58:56=
) khem: melo VM has some issues where it was dying<br>(21:59:01) khem: almo=
st everyday recently<br>(21:59:48) khem: per Tom its not hardware issue sin=
ce other VMs are running fine on same machine<br>
(22:00:04) RP__: What is special about that VM?<br>(22:00:14) khem: nothing=
<br>(22:00:15) RP__: or is it broken software wise somehow?<br>(22:00:30) k=
hem: yes it was installed long ago with ubuntu 8.04<br>(22:00:48) khem: and=
 then upgraded to 10.04 but not reinstalled<br>
(22:01:07) khem: so Tom decided that it was time to setup new<br>(22:01:11)=
 koen: Tom K had a good description of the problem at ELC<br>(22:01:12) khe=
m: instance<br>(22:01:53) RP__: ok, it sounds like Tom has a handle on it<b=
r>
(22:02:03) khem: and this vm has tinderbox and bugzilla and stuff installed=
 in weird way<br>(22:02:04) RP__: I have noticed there are some stale DNS e=
ntries around<br>(22:02:15) koen: the only issue today was that his mailing=
list post got delayed<br>
(22:02:22) khem: thats because git got moved to different machine yesterday=
<br>(22:02:24) RP__:=A0<a href=3D"http://openembedded.net/" target=3D"_blan=
k" style=3D"color: rgb(0, 0, 204); ">openembedded.net</a>=A0doesn&#39;t wor=
k properly now<br>
(22:02:35) RP__: but I can guess why<br>(22:03:12) khem: over next week git=
 will move to the final VM and other services too will then follow<br>(22:0=
3:35) RP__: khem: sounds good, thanks go to Tom for fixing this<br>(22:03:5=
2) khem: and to cbrake and yours Truly here :)<br>
(22:04:04) RP__: well, yes, everyone involved! :)<br>(22:04:20) ***RP__ was=
n&#39;t sure exactly who was working on it<br>(22:04:49) khem: ok so we are=
 done with agenda<br>(22:04:52) khem: thanks everyone<br>(22:05:13) khem: m=
eeting is now closed<br>
(22:05:17) RP__: thanks khem<br></span><span style=3D"border-collapse: coll=
apse; font-family: arial, sans-serif; font-size: 13px; ">(22:05:24) ***RP__=
 will mail jefro the logs</span></div></span><br>-- <br>Jeff Osier-Mixon <a=
 href=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/blog</a>=
<div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>

--bcaec52999a7ef612e04aa05b401--
