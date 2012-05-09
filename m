Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SSDGI-0003AI-J1; Wed, 09 May 2012 22:13:26 +0200
Received: by yenl13 with SMTP id l13so93863yen.6
	for <multiple recipients>; Wed, 09 May 2012 13:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=80ebvm7GNxmpH0PS/MGgrjfACxTI7EGpVyT9Mowt66U=;
	b=GCwImmGT8CPekzvbEnjJm7fBFWsG6BJDAH3ulBl2yn7vaW2M84terGr7JcSnwfWX6h
	Bq/ve3nhIHQFyDgeP6RmP0xWwDiNUViEGDKKJRtfMF0kUHkT0IwXy6wKCnXtkihEhOQK
	VKaCK6albo5Qf67E6Ylc9gsWbFE/UXnBhTn+F4Pyaf2okF+x1Z89e6MSt7/HTyPqPL8+
	V+53kYnFQjMM6w3/Mt5tw0SDX4H2Pu9Znf5R2cMSxTtH1wedmQQNTqIJwCPQT2OHlW6I
	pLNwygesjECFqOKvW8dTK3pAITZIwQqrlAs2qPH2x9dkayVufuamQxTc9oEcoXYh6EbZ
	gsAg==
MIME-Version: 1.0
Received: by 10.42.115.134 with SMTP id k6mr735689icq.36.1336593812484; Wed,
	09 May 2012 13:03:32 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.92.7 with HTTP; Wed, 9 May 2012 13:03:32 -0700 (PDT)
Date: Wed, 9 May 2012 13:03:32 -0700
X-Google-Sender-Auth: l4u0yO4LhmoFfGbcUo8Nobwwopk
Message-ID: <CA+YB3rbmEajx6QU8N3Ay1iyvV+xSDQTk6-C-3DrPD6fy6-jKHA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES - OE TSC 8 May 2012
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
X-List-Received-Date: Wed, 09 May 2012 20:13:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OpenEmbedded Technical Steering Committee
8 May 2012

Attending:
=A0Richard Purdie (RP)
=A0Paul Eggleton (bluelightning)
=A0Mark Hatle (fray)
=A0Koen Kooi (koen)

Apologies:
=A0Khem (khem)

Minutes: Jefro (Jefro)

________________________________________________
Agenda & Summary

1. pick a chair
fray

2. lingering issues

=A0a. raise awareness of "janitor" list, QA "bugs"
=A0=3D> fray to ping Darren & Song
=A0=3D> goal to have initial janitor communication with OE list end of May

3. new issues

=A0a. discuss communication with OE community about
=A0 =A0 =A0 =A0 =A0release-oriented phases
=A0 =3D> fray willing to manage page as TSC activity
=A0 =3D> future agenda: document release process
=A0 =3D> fray will stay in sync with Dave/RP/Song
=A0 =A0 =A0 =A0& create wiki when appropriate

=A0b. Yocto entering 1.3 planning phase
=A0 =A0 =A0tree is open, planning has begun, RP has announced to ml
=A0 =A0 =A0looking at 6-8 weeks from 1.2 to 1.2.1

=A0c. pre/post install scripting (fray)
=A0 =A0 =A0proposal to encompass in set of actions instead of shellscripts
=A0 =A0 =A0can move actions offline to some extent
=A0 =A0 =A0long term goal, lower priority
=A0 =A0 =A0if you see pre/post install scriptlets, think about whether can
=A0 =A0 =A0 =A0be done more generically as an action, try to capture

4. status

=A0a. oe-core release
=A0 =A0 =A0update-alternatives - fray hopes to share something next week
=A0 =A0 =A0 =A0too large for 1.2.1
=A0 =A0 =A0Paul added layer dependencies (LAYERVERSION & LAYERDEPENDS)
=A0 =A0 =A0batching offline possible
=A0 =3D> keep on agenda (jefro)
=A0 =A0 =A0RP needs help reviewing things
=A0 =A0 =A0 =A0discussed some policy changes to ease load
=A0 =A0 =A0release branch process
=A0 =A0 =A0 =A0sgarman putting together a candidate branch
=A0 =A0 =A0 =A0RP will merge it into oe-core denzil when ready
=A0 =A0 =A0 =A0some things pulled in ahead of master
=A0 =A0 =A0 =A0initialisation issues need to be ironed out
=A0 =A0 =A0 =A0timeframe: goal for 1.2.1 is =A06-8 weeks after 1.2

=A0b. elections
=A0 =A0 =A0thanks for service Tom
=A0 =A0 =A0welcome back Koen

=A0c. infrastructure
=A0 =A0 =A0update from Khem regarding build machine testing Angstrom
=A0 =A0 =A0mailing list admin
=A0 =A0 =A0 =A0- reports of pwds being lost, people being unsub'd from -mem=
bers
=A0 =A0 =A0 =A0koen has reported problem to the board

key:
=3D> action item (indented =3D older or remaining from prior meetings)
-> note from prior meetings

________________________________________________
Raw Transcript

(8:58:24 AM) Jefro: good morning all & welcome back koen
(8:59:06 AM) koen: hey Jefro
(9:02:23 AM) bluelightning
[~paul@pdpc/supporter/professional/bluelightning] entered the room.
(9:02:29 AM) bluelightning: hi folks
(9:02:33 AM) fray: hello..
(9:02:36 AM) RP: yes, congratulations koen :)
(9:02:39 AM) Jefro: morning fray
(9:02:44 AM) fray: congrats, welcome back
(9:02:52 AM) bluelightning: indeed, congrats koen
(9:02:54 AM) Jefro: interactive agenda at http://piratepad.net/8M1h1fJl9Y
(9:04:00 AM) bluelightning: having trouble accessing that here...
(9:04:05 AM) Jefro: although I can't get to that now
(9:04:39 AM) fray: ok, I'm back
(9:04:42 AM) Jefro: dang, I just had it, too... new agenda in 1 min
(9:05:07 AM) Jefro: if you guys want to pick a chair, i should have
the agenda up in a sec
(9:05:27 AM) ***fray can do it unless omeone else wants to
(9:05:47 AM) RP: Khem isn't going to make it. I suggest we wish him a
speedy recovery and that he be more careful in future ;-)
(9:06:15 AM) RP: fray: fine with me
(9:06:28 AM) ***koen is winding down a conference call
(9:06:30 AM) fray: RP -- absolutely
(9:06:41 AM) Jefro: ok - agenda here, but not interactive:
http://pastebin.com/hpdr4ea8
(9:06:51 AM) ***fray waits for Jefro.. =A0but while we wait.. anyone
have any new topics?
(9:07:59 AM) RP: I don't have anything specific
(9:08:14 AM) bluelightning: nothing here
(9:08:21 AM) RP: fray: you mean koen?
(9:08:25 AM) fray: Ultimate Marvel Marathon ending w/ the Avengers was
very cool.. otherwise I havn't done any real work since last
Wednesday.. ;)
(9:08:51 AM) ***fray was waiting for both, but Jefro posted the agenda
before he hit return.. ;)
(9:09:32 AM) koen: one extra item for infrastructure: mailinglist admin
(9:09:38 AM) fray: Ohh I do have one topic, assuming we have some
time... pre/post install scripting based on a question I got from
outside of OE...
(9:10:51 AM) fray: koen, ready?
(9:11:09 AM) koen: yes
(9:11:14 AM) fray: ok.. lets go..
(9:11:19 AM) fray: #1 - I volunteered
(9:11:20 AM) Jefro: ok - new agenda with latest topics at
http://pastebin.com/jKtNh4n2
(9:11:21 AM) koen: I clicked the wrong button and disconnected the call :)
(9:11:50 AM) ***RP wishes he did that more often
(9:11:53 AM) fray: #2a -- the release phases
(9:12:15 AM) fray: I need to figure out who to sync with to start
working on this..
(9:12:22 AM) RP: fray: 3a?
(9:12:37 AM) fray: sorry, brain keyboard malfunction..
(9:12:44 AM) fray: I did mean 2a - janitor list
(9:13:06 AM) fray: RP, do you know who is working on this for Yocto?
I'll take the action to sync with them and then work on the publicity
via OE
(9:13:16 AM) RP: Darren was the person who raised the idea
(9:13:28 AM) RP: fray: I'd think he'd be as good as anyone
(9:13:34 AM) fray: I believe bugs in the bugzilla (yocto) are alredy
being tagged janitor right?
(9:13:41 AM) RP: fray: correct
(9:14:13 AM) fray: ok.. I'll do that as my next step.. goal by end of
May to have initial janitor communication w/ the OE list(s)
(9:14:29 AM) fray: ok, onto 3a -- release process
(9:14:33 AM) RP: fray: sounds good, thanks
(9:14:44 AM) RP: fray: I know for this Song is working on sending something=
 out
(9:15:06 AM) RP: fray: Its been delayed as we're refining parts of the
process for 1.3 but something should be out sooner than later
(9:15:10 AM) fray: Ok. =A0I'll sync with him and I think related to
3b... the tree is open and the planning has begun right?
(9:15:30 AM) RP: Yes, and I did send out an email about this as agreed
(9:15:49 AM) fray: cool.. ok.. again, sooner the better, but I'll
hopefully start an OE wiki release phase page..
(9:15:50 AM) koen: about the release
(9:16:03 AM) koen: can someone explain to me how the oe-core release
branch for 1.2 works?
(9:16:22 AM) koen: scott g only confused me and himself further and
pointed to RP
(9:16:32 AM) RP: koen: sgarman is putting together a candidate branch,
I'll merge it to oe-core denzil when its ready
(9:17:00 AM) RP: koen: As you'll have noticed, he's pulled things in
there ahead of master and there have been a few other initialisation
issues
(9:17:09 AM) RP: koen: We need to get those ironed out
(9:17:15 AM) koen: right
(9:17:48 AM) RP: koen: clear now?
(9:18:00 AM) koen: on the process, yes
(9:18:09 AM) koen: timeframe we can debat on the oe-core list
(9:18:27 AM) RP: koen: timeframe for merging patches or for release?
(9:18:46 AM) koen: both :)
(9:18:59 AM) koen: a rough idea
(9:19:03 AM) RP: koen: patch wise I'll take a sensible looking tree
(9:19:18 AM) RP: koen: release wise we are thinking 6-8 weeks after
1.2 for 1.2.1
(9:19:23 AM) RP: koen: depends on bugs being fixed though
(9:19:56 AM) koen: for meta-oe the plan is to merge it weekly into the
denzil branch
(9:19:59 AM) fray: RP -- would the update alternatives stuff I'm
looking at be a canidate for 1.2.1? =A0I'm afraid it's likely too much
(9:20:15 AM) fray: (especially if I do the complete rework we'd talked abou=
t)
(9:20:22 AM) RP: fray: probably too big for that, we need a rework IMO
(9:20:41 AM) ***fray is trying to judge the scoping of the patches..
and this seems reasonable..
(9:21:05 AM) fray: I'm just worried, bug-wise, about the less then
steller runtime requirement/provide matching that happens today due to
this issue..
(9:21:34 AM) RP: fray: I know you had a user hitting that but that is
the only report we've had
(9:22:02 AM) koen: the release does illustrate that the layer word is
still like the wild west
(9:22:09 AM) koen: some tracking master, some denzil
(9:22:16 AM) koen: some doing nothing
(9:22:38 AM) RP: koen: the first couple of iterations through the
process do tend to be hardest...
(9:22:44 AM) RP: koen: I'm hoping it will get easier
(9:22:46 AM) koen: indeed
(9:23:11 AM) fray: I remember talking about this a couple years ago,
but did we ever come up with a compatibility value int he layer
(beyond the readme) that would prevent use with say master -- or put
up some type of a warning when not used with the branch/tag intended?
(9:23:38 AM) bluelightning: I did add layer dependencies
(9:23:44 AM) RP: Someone said to be earlier "people noticed that
master was stabilising for a while this time". I pointed out that was
the point! :)
(9:23:45 AM) bluelightning: including version numbering
(9:23:52 AM) ***koen also noticed that pretty much only oe-core,
meta-oe and martins layers do PR bumps properly
(9:23:54 AM) bluelightning: I'm not sure it's really being used though
(9:24:10 AM) fray: bluelightning ahh, I didn't realize they made it..
are they in the Yocto documentation?
(9:24:17 AM) RP: koen: This is one reason I do want to get automated PR han=
dling
(9:24:37 AM) bluelightning: fray: should be in the current
documentation I believe (/me checks...)
(9:25:03 AM) fray: I'd suggest we promote this then.. and if it's not
adequate (or used) we figure out if there is some thing better we can
suggst
(9:25:27 AM) ***RP agrees
(9:25:28 AM) koen: RP: right, but like the GNU_HASH thing, it's the
canary in the coalmine
(9:26:11 AM) RP: koen: We can just continue to advocate and
communicate best practise
(9:26:18 AM) fray: yup
(9:26:38 AM) koen: </everything is broken mode>
(9:26:39 AM) bluelightning: fray: see LAYERVERSION and LAYERDEPENDS in
the variable list in the reference manual
(9:26:44 AM) fray: IMHO advocacy, followed by requiring it (if people
use it), or modify the underlying tech if it's not right
(9:26:50 AM) fray: bluelightning thanks
(9:27:16 AM) RP: fray: yes, promoting broken tech is wrong
(9:27:36 AM) RP: if given a less broken solution anyway :)
(9:27:53 AM) fray: yup.. we know there is a need and we need to
advocate a solution... and fix it if necessary
(9:28:01 AM) fray: ok.. anything further on this?
(9:28:19 AM) koen: fray: release or layer police?
(9:28:27 AM) fray: either
(9:28:39 AM) ***fray is playing meeting chair.. ;)
(9:28:48 AM) RP: koen: Its up to the maintainers..
(9:29:26 AM) koen: I had nothing further on either
(9:29:32 AM) RP: We need to be mindful that some layers are maintained
by volunteers in their spare time. We can therefore make zero
"demands"
(9:29:47 AM) fray: yup...
(9:29:52 AM) RP: Just like I can make zero "demands" of people when
they send patches against OE-Core
(9:30:18 AM) fray: well, we can deman PR bumps and general code
quality.. (but I understand, it's a balancing act)
(9:30:37 AM) RP: Well, I can refuse a patch on given technical grounds
(9:30:53 AM) fray: ok then.. =A0shall we do 3c or skip to 4?
(9:31:04 AM) RP: skip to 4 and come back
(9:31:25 AM) fray: ok.. 4a... update-alternatives.. as mentioned
earlier it's in progres.. I hope to have something to share next
week..
(9:31:27 AM) fray: (maybe earlier)
(9:31:46 AM) fray: the idea is to implement it in a similar way as the
adduser/addgroupt to allow subpackage alternatives
(9:32:13 AM) RP: fray: When you get something vaguely working, lets
talk and do a kind of pre-review
(9:32:24 AM) fray: ok.. sounds good
(9:32:26 AM) RP: fray: I want to try and keep this simple if we can
(9:32:38 AM) koen: on that subject, we need to restart the icon-cache
and mime discussion
(9:32:42 AM) fray: the format of the alternative links is what I think
is the biggest change..
(9:32:48 AM) koen: it's taking an hour on first boot for me
(9:32:55 AM) RP: fray: maybe call the class
update-alternatives2.bbclass or something so we can break
compatibility
(9:32:56 AM) fray: koen, do those have similar pre/post install
scriptlet generation issues?
(9:33:08 AM) fray: RP, yup.. we can do that
(9:33:17 AM) koen: fray: sort of
(9:33:28 AM) fray: I was initially thinking using a different
variable, so we could preserve the compatibility...
(9:33:38 AM) koen: fray: the problem is that it only needs to get done
once at first boot, not N times
(9:33:45 AM) RP: koen: yes, I made runtime postinst type problems a P1 for =
1.3
(9:33:51 AM) koen: RP: OK
(9:33:58 AM) fray: is this a read-only root problem? =A0i.e. keeps
happening if the system can't be modified..
(9:34:09 AM) RP: fray: it will be
(9:34:13 AM) fray: ya, assuming we can run QEMU, it's possible.. just
we can't always run qemu..
(9:34:31 AM) fray: for the icon and mime case, has anyone looked into
adding a native tool to construct it?
(9:34:39 AM) RP: fray: there are multiple stages to solve it. Running
once instead of 200 times would be a good start
(9:34:45 AM) fray: :)
(9:34:45 AM) RP: fray: running it offline would be better again
(9:35:25 AM) fray: ok.. so batching it and offline are possibilities.. ok
(9:35:34 AM) RP: The trouble is the previous patches didn't take into
account all the variables. There was also some gaps in the author's
knowledge which scared me off the patches in the end :(
(9:35:45 AM) fray: jefro, we should definitely mention these in the
notes for future agenda work, under status...
(9:35:58 AM) ***Jefro ok
(9:35:59 AM) RP: I would note that I need more help with review of things
(9:36:14 AM) RP: I'm drowning trying to maintain the quality bar
(9:36:36 AM) fray: RP, ya.. I expect that to be the case with these
things.. =A0(slipping into 3c for a second) it was mentioned debian has
a core set of about 55 actions.. we might want to look at them and see
if the actions themselves [not implementation] are something we could
use to help organize this work
(9:37:05 AM) RP: fray: There are about three main pain points at the moment
(9:37:09 AM) fray: RP -- would more acked-by or reviewed-by responses help?
(9:37:50 AM) RP: fray: Yes, but I'd also like people to think about
the changes they're proposing. There are a lot of "this works for me
and I don't really care about XXX"
(9:38:07 AM) RP: As above, we can't demand they fix it but on the
other hand, it can't be me who fixes these things
(9:38:15 AM) RP: or even explains how to fix them
(9:38:25 AM) fray: ya, I certainly understand that...
(9:39:00 AM) fray: sounds like it's time to start coming up with area
maintainers to help feed and respond to people
(9:39:14 AM) RP: I'm open to ideas on how we look at this but yes, sub
maintainers were how I thought this might work
(9:40:03 AM) RP: I put this very badly in an email recently and Martin
got upset :(
(9:40:44 AM) fray: I hate to suggest more mailing lists.. but would an
oe-core-discussion list help? =A0I'm getting swamped betwen the patches
and the discussions just trying to follow things
(9:40:56 AM) fray: I'm apparently missing discussions because of this
(9:41:15 AM) bluelightning: fray: sometimes patches turn into discussions t=
hough
(9:41:18 AM) RP: fray: Its probably my fault as it happened against a
set of patches
(9:41:39 AM) fray: bluelightning ya, discussion to me is where
something relates to architecture, overall oe-core, policy, etc..
(9:41:49 AM) fray: I'm really not convinced another list is the right
answer.. but it might help
(9:42:07 AM) ***RP doubts another list would help
(9:42:27 AM) RP: fray: In particular I was frustrated at the glib
upgrade keep coming back despite it being known to break at runtime.
(9:42:52 AM) ***fray wishes he knew more about glib to help.. Hmm..
(9:43:13 AM) RP: fray: that one is in now, got it sorted at the
weekend but its just an example of an ongoing issue
(9:43:19 AM) fray: I can certainly accept more lists is not the
answer.. =A0I'm not sure I have a suggestion at this point
(9:43:58 AM) RP: Another part of this is that I'm not daring accept
patches since I know I'll end up having to spend time fixing them if
the builds break as a result. I should probably just freely revert
things :/
(9:44:35 AM) RP: Anyhow, I guess my ask is that the TSC thinks about
these things
(9:45:02 AM) fray: I'm certainly in the revert it if it doesn't work camp..
(9:45:08 AM) ***bluelightning too
(9:45:13 AM) fray: I've caused my shared of un-intended problems.. but
I won't take objects to a revert
(9:45:24 AM) fray: s/objects/offense/
(9:45:38 AM) RP: reverts tend to upset people a lot...
(9:45:46 AM) RP: "Why couldn't you just fix it"
(9:45:48 AM) bluelightning: they do pollute the history as well
(9:45:59 AM) RP: that is the thing I really dislike
(9:46:09 AM) RP: particularly if a change is going to end up going in
(9:46:26 AM) bluelightning: it depends on how far off the fix is really
(9:46:31 AM) fray: RP, I understand the why didn't you just fix it..
if it's a one-line fix.. but if it takes debugging of any kind, I
don't mind the revert.. (of course preventing it from going in first
is even better.... but not always reality)
(9:46:32 AM) bluelightning: and how serious the breakage
(9:46:56 AM) RP: I've been trying to work on the prevention front, its
just hard work
(9:47:30 AM) RP: Anyhow, just take this as a sign that I'm wondering
if we need to readjust the balances/thresholds
(9:48:31 AM) fray: I assume it is.. something has to happen... between
sub maintainers and reverts being policy, and more tools for you...
(9:48:45 AM) fray: (sorry I have to do something, be back in 1-2 minutes)
(9:49:44 AM) RP: so in Khem's update, he mentioned there is now an OE
machine doing test, of angstrom at the moment since YP has OE-Core
covered
(9:50:25 AM) RP: This sounds good, I'd be interested to know how
failures are being tracked down anf regressions fixed. Autobuilds are
a lot of work as I know all too well...
(9:50:35 AM) RP: koen: mailing list admin?
(9:50:36 AM) fray: back -- ugh office just got hit by hail..
(9:50:52 AM) RP: fray: np, just tried to move forward a bit in your absence
(9:50:55 AM) fray: np
(9:51:03 AM) koen: RP: passwords are lost and people were unsubscribed
from -members
(9:51:13 AM) koen: so our elections might have not been valid
(9:51:29 AM) RP: koen: lost by who?
(9:51:38 AM) RP: koen: and do we know who was unsubscribed?
(9:51:46 AM) koen: at least ken gilmer was
(9:51:47 AM) RP: koen: Isn't that a matter for the board?
(9:51:59 AM) koen: we're in charge of infra
(9:52:13 AM) koen: but I'm fine with moving these problems to the board
(9:52:18 AM) RP: koen: subscribed by someone or by bounce issues?
(9:52:32 AM) RP: er, unsubscribed
(9:53:35 AM) fray: Hmm, sounds like this is definitely something the
board needs to deal with.. since it involved governance and member
communications
(9:54:16 AM) RP: koen: Can you send a summary of the problem to the
board and I'd cc Phil Blundell too since he does have admin access.
I'm happy to be on cc to help facilitate if required
(9:55:44 AM) RP: We have 5 mins left btw
(9:56:02 AM) koen: I already informed crofton
(9:56:07 AM) fray: ok.. if we're done w/ that.. any other issues.. or
I'll quickly describe 3c..
(9:56:14 AM) RP: fray: go for it
(9:56:27 AM) RP: koen: did you get a response? Did he direct this to the TS=
C?
(9:56:33 AM) fray: Ok, so I was talking to someone about pre/post
install scripts.. =A0and how OE generated many of them using hte
classes..
(9:56:46 AM) fray: we got into a discussion about how currently they
are all shell based, but they don't really need to be.
(9:57:24 AM) fray: It would be interesting if all of the pre/post
actions could be encompsed into a standard set of actions (thus the
debian has about 55 actions), and then dynamically generated to fit
the best language for a package manager, or even a simple usage
situation..
(9:58:13 AM) fray: This is something that I consider a long-term goal,
but does anyone else thing this is worth pursuing, primarily starting
with what are all of the pre/post install scripts doing.. and can we
better standardize them.. and then eventually can we implement these
using generic and/or package manager specific implementations?
(9:58:43 AM) RP: fray: I think the biggest win at the moment would be
to make as much as we can happen offline
(9:59:13 AM) RP: fray: There are other developments such as those you
mention which I can see value in but they're not of the highest
priority right now
(9:59:19 AM) fray: Ya, that discussion also prompted this.. =A0if we
could collection the actions, and some how batch them -- or even
generate a system wide configuration from them.. we may have a good
performance improvement as well
(9:59:31 AM) fray: RP, I agree.. this is longer term thinking..
(9:59:40 AM) RP: fray: I know opkg has the idea of intercepts fwiw
(10:00:19 AM) fray: ok, we've got one minute.. I'll leave the
discussion with the comment.. if you see pre/post install scriptlets..
figure out if this is something that can be generically done and
benefit other packages as well.. if it can.. we may want to somehow
capture these.. (10:00:24 AM) RP: fray: it only does this for ldconfig
atm (puts in a script called ldconfig first in PATH, notices if it
gets executed, then runs at the end of the pkg operation)
(10:00:45 AM) fray: RP, ya some versions of RPM have a similar cached ldcon=
fig..
(10:01:52 AM) ***RP will give it thought
(10:02:20 AM) fray: ok.. with that.. I think we're done unless anyone
has anything else
(10:02:48 AM) fray: ok, have a good day everyone..
(10:03:31 AM) ***fray goes to check his car for hail damage.. :(
(10:03:36 AM) RP: not from me, thanks all!
(10:03:50 AM) Jefro: adios all

--=20
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


