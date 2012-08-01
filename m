Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SwhQc-0005Zr-UT; Thu, 02 Aug 2012 00:30:07 +0200
Received: by yenl13 with SMTP id l13so7161958yen.6
	for <multiple recipients>; Wed, 01 Aug 2012 15:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=NwjyQrOSuKRGYELudqqgxN+hqJ1PRyHFlSzZeoQrzFE=;
	b=RYz5QX+P9XK+cUxDZ/wbv7D4nkiaO9qqzOJ8OBV2CPYe/49AXlj2PxFNgrHLq6WVDr
	bbK5tglJTy2k7C2hOO9tT0GeP9xr7GSS2QWL6un+rshaUqiZNZR2yaxVjHRhTZxXA45N
	PkZwBt2KYZqMUKHLpBNUT61YNc5843OSdmOzVW7qIu80TrVifqxg6/6ymQzc2E8/joiB
	cbLHgzuM2BO1faA0uFGkLOahSqhjZSAZLi5PHfdeI0v0jTv9Nww7OuPZxdH6n6gWfCo9
	bJ9w9mh0Oqoj1h8vc0L0FERmHw4/4fxBf2vfNSTvznDOXebEWEtKxi8/aWq5Fzdwr/Ww
	hoxg==
MIME-Version: 1.0
Received: by 10.42.18.8 with SMTP id v8mr599142ica.34.1343859506837; Wed, 01
	Aug 2012 15:18:26 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.102.4 with HTTP; Wed, 1 Aug 2012 15:18:26 -0700 (PDT)
Date: Wed, 1 Aug 2012 15:18:26 -0700
X-Google-Sender-Auth: MjOm3EhnjTP6eoVEG3h-8dj2zBk
Message-ID: <CA+YB3rbdcfSNi4es51A0nXAK55rbPsbe3-dpVCjiJz4_q0AjaQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: Minutes: OE-TSC 31 July 2012
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
X-List-Received-Date: Wed, 01 Aug 2012 22:30:07 -0000
Content-Type: multipart/alternative; boundary=20cf304271b688782304c63bacff

--20cf304271b688782304c63bacff
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
31 July 2012

Attendees: Mark, Koen, Richard, Paul
Apologies: Khem

________________________________________________________________
Agenda & Results

1. pick a chair - bluelightning

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
 -> continue
 b. discuss communication with OE community about release-oriented phases
 -> continue
 c. pre/post install scripting (fray)
 => ask mailing list for proposals - continue

3. new issues
 a. oe-made-easy script in getting started instructions - fixed

 b. systemd
 => discuss on mailing list (all)
 => bluelightning to send out current status to list
 => bluelightning to create enhancement bug in Yocto bugzilla to implement
gitpkgv functionality in fetcher (done, bug 2872)

 c. PR bumps
 => koen to investigate server & report back
 => bluelightning to test on autobuilder infrastructure
 => bluelightning to document setup steps on wiki

 d. package.bbclass whitespace
 tabs resulting in warnings, seems better in general
 some fallout, some positive comments

 e. meta-networking
 => continue discussion on mailing list

 lengthy discussion of patches against various layers, proper handling

4. status

 a. Should we still support separation of / and /usr?

 b.  khem to file enhancement request for python devshell  (done)

 c. oe-core release
      there will be discussion on the list about release process

  d. infrastructure
      mailing list issue (koen) - board is coping with it, keep on agenda

  ________________________________________________________________
Raw Transcript

[16:57] <bluelightning> hi folks
[16:58] <koen> hey bluelightning
[16:58] --> RP__ has joined this channel (~richard@dan.rpsys.net).
[16:59] <fray> hey
[16:59] <fray> with vacation and travel, it feels like we just had a
meeting.. :P
[16:59] <bluelightning> heh
[17:00] * RP__ is wiped out today :/
[17:01] <fray> I think I've had 3 work days since the last meeting.. :P
[17:01] <koen> "Didn't we have a meeting last week?"
[17:01] * RP__ hopes nobody is expecting him to make any sense
[17:01] <fray> RP__, it's ok to sit in the corner and drool for a bit.. :)
[17:01] <RP__> two weeks ago. We agreed on the python whitespace change and
I've spent since then dealing with it
[17:02] <RP__> or so it feels like! ;-)
[17:04] <Jefro> hi all - sorry, I am here but on phone - please carry on
[17:04] <koen> any new things on the agenda or just the same?
[17:04] <Jefro> 7/17 schedule is here http://piratepad.net/QVuGPkIJZr
[17:04] <fray> I don't have anything new
[17:04] <koen> RP__: I finally have a build finished, so I can try turning
on the auto PR stuff
[17:04] <Jefro> one thing is that I still need to get notes up :/
[17:05] <RP__> koen: I'll make sure work on any issues gets prioritised...
[17:06] <RP__> ok, who is chairing
[17:06] <RP__> and has anyone heard from Khem?
[17:06] <bluelightning> I can do it, haven't done it for a while
[17:06] <fray> khem -- not this morning..
[17:06] <bluelightning> re khem, no...
[17:07] <RP__> bluelightning: go for it
[17:07] <bluelightning> ok, so 1 is done
[17:07] <RP__> I pinged khem
[17:07] <bluelightning> 2a:  raise awareness of "janitor" list, QA "bugs"
[17:08] <fray> still to be done... :(
[17:08] <RP__> ongoing
[17:08] <bluelightning> presumably same applies to 2b/c ?
[17:09] <fray> yes
[17:09] <bluelightning> ok, let's move on to 3a then
[17:09] <bluelightning> oe-made-easy script in getting started instructions
[17:09] <fray> last week we reached a decision on that.. did anyone have
the time to change hte wiki?
[17:09] <bluelightning> I think I've resolved this to my own satisfaction
[17:09] <bluelightning> yep
[17:09] <bluelightning>
http://www.openembedded.org/wiki/OpenEmbedded-Core#Getting_Started
[17:10] <bluelightning> should be more useful all around as well
[17:10] <RP__> bluelightning: looks much better, thanks!
[17:10] <fray> works for me
[17:11] <bluelightning> ok, so if there's nothing further... 3b: systemd
[17:11] <RP__> I hear progress is being made there?
[17:12] <bluelightning> well, the split happened prior to last meeting and
there hasn't been a huge amount of fall-out AFAIK, but koen can possibly
elaborate
[17:13] <bluelightning> AR for me from last time was to post an
announcement which I did not get around to though
[17:15] <RP__> bluelightning: I guess you've a reminder now :)
[17:15] <bluelightning> yes
[17:15] <bluelightning> as for remaining issues blocking moving towards the
core, there is at least gitpkgv and switching to making it a distro config
option
[17:16] <bluelightning> khem has moved libcgroup to oe-core, that's a minor
step forward
[17:16] <fray> ohh I hadn't seen that..
[17:16] <bluelightning> is there already a bug open for replicating the
gitpkgv functionality in the fetcher?
[17:17] <bluelightning> that's what will need to be done...
[17:17] <bluelightning> doesn't look like it
[17:18] <RP__> There was a kind of previous attempt. It shouldn't be hard
[17:18] <bluelightning> I wouldn't have thought so, no
[17:18] <bluelightning> ok well, AR to me to create an enhancement bug for
that
[17:19] <bluelightning> any further comments on systemd? koen, you've been
rather quiet today...
[17:20] <bluelightning> if not, let's move onto 3c: PR bumps
[17:21] <bluelightning> koen has indicated he's ready to test it
[17:21] <RP__> I think koen commented on that above, he's about to test
[17:21] <bluelightning> right
[17:21] <RP__> which is great, I look forward to the result and we will
work through any issues
[17:21] <bluelightning> I haven't talked to michael/beth about running
tests on the yocto AB infrastructure but it sounds like they have their
hands full atm
[17:23] <RP__> bluelightning: right now would be a bad time
[17:24] <fray> is there any light coming up, or does it look pretty frantic
for a while..
[17:24] <bluelightning> RP__: ok, I guess I should just make sure we have
enough docs so that they know what to do when the time comes
[17:24] <fray> I know we had talked before about sometime in august
switching, but I'm still worried we don't know enough
[17:24] <RP__> fray: I keep thinking there is light coming up :/
[17:24] <koen> can I add a 'meta-networking' item to the agenda?
[17:24] <bluelightning> koen: sure
[17:24] <koen> great
[17:25] <bluelightning> ok, well I think we're done with 3c
[17:25] <bluelightning> on to 3d: package.bbclass whitespace
[17:25] <bluelightning> presumably this is now sorted?
[17:25] <fray> I've seen some fallout on that, but in generate is seems
much better
[17:26] <bluelightning> yeah, we expected some
[17:26] <bluelightning> I don't have a handle on how much grief we caused
for other layers
[17:26] <fray> I don't think it was bad
[17:27] <fray> I figure in a few weeks as more layers roll forward, we
might get some more stuff..
[17:27] <RP__> It resulted in warnings, not errors so it shouldn't have
been too bad
[17:27] <bluelightning> it sounds like the fallout was less than expected
[17:27] <fray> the biggest thing I heard about was 3 vs 4 character
whitespace in things like package.bbclass..
[17:27] <fray> bluelightning certainly less then I expected
[17:28] <koen> I had to remove a few layers (meta-java, meta-opie) to get
things going again
[17:28] <bluelightning> koen: hmm, I was not aware that meta-opie was broken
[17:28] <bluelightning> probably because I haven't tested it since...
[17:28] <koen> bluelightning: could be an interaction issue
[17:28] <bluelightning> will look into that later
[17:28] <koen> it breaks parsing, so easy to find out :)
[17:29] <bluelightning> koen: is henning aware of the meta-java issue?
[17:29] <koen> people sent patches for it
[17:29] <koen> so I assume he is
[17:29] <bluelightning> ok, so presumably that's being handled then
[17:30] <bluelightning> any further comments?
[17:30] <RP__> FWIW I did get some positive feedback on the whitespace
change too (as in they were pleased we were fixing what can be a nasty
issue)
[17:30] <bluelightning> great :) a rare thing it seems
[17:31] <fray> RP__ that is what I got by a few people as well
[17:31] <RP__> It is nice to hear someone liking a change rather than
complaining the build broke
[17:31] <RP__> :)
[17:31] <bluelightning> :)
[17:32] <bluelightning> ok then, let's move onto 3e: meta-networking
[17:32] <fray> I think the folks who worked with the whitespace will be
happier... and those that don't probably didn't notice
[17:32] <bluelightning> koen: fire away...
[17:33] <koen> I still don't get what Joe is going on about "subtrees" and
"modules"
[17:33] <koen> I don't get a good feeling about it
[17:33] <fray> there are lots of classes of "networking"
[17:33] <RP__> I actually wondered about proposing using combo layer here
[17:33] <fray> everything from network services, to device setup, to
routing, etc..
[17:33] <koen> it looks like windriver is wanting to do their own layer and
not care about others
[17:34] <RP__> so joe maintains the layer in a git repo but that is
flattened and committed to meta-oe effectively automagically
[17:34] <bluelightning> koen: I don't think that's it at all
[17:34] <koen> which is fine, but it seems it's turning into some
half-assed arrangement now
[17:34] <koen> RP__: see, that scares me
[17:34] <RP__> koen: I would like to steer clear of submodules too fwiw and
I understand about not wanting to split up meta-oe more
[17:34] <fray> arranging the files and capabilities is needed.. dumping
them all into one big bucket isn't going to work (from a maintenance
standpoint)
[17:34] <RP__> koen: I can also see why he wants something he can clone and
use separate to meta-oe
[17:35] <koen> RP__: seperate in what way?
[17:35] <koen> RP__: no other files in the git clone?
[17:35] <RP__> koen: as a separate repository without the rest of meta-oe
[17:35] <RP__> koen: yes
[17:35] <fray> (speaking as a commercial provider for a second).. meta-oe
is a good repository of recipes for us.. but we're never going to ship
meta-oe..  we need pieces of it, but not all of it..
[17:35] <fray> simple reason, it's got too much stuff that we're simply not
willing to validate or support
[17:35] <koen> fray: which is fine
[17:36] <RP__> I will say the combo layer tooling is great and I'm using it
quite nicely
[17:36] <RP__> and it could handle this with ease, its a 1:1 mapping no
problem
[17:36] <fray> networking is something that is wanted, and we don't want to
deviate from an open source layer if possible..  (we deviate, we have more
to support)
[17:36] <koen> but when doing the actual work, you should be working on an
abstracted thing
[17:36] <koen> should *not*
[17:36] <bluelightning> one option would be to use something like
combo-layer to make the separate layer if that's what Joe would prefer; but
the layer in meta-openembedded would need to be the "master"
[17:36] <bluelightning> for community preference
[17:36] <RP__> koen: "abstracted" in what way?
[17:37] <fray> concern with any type of "combined" git repository is having
to cherry pick and manage the patches
[17:37] <koen> RP__: combo-layer/subtree/whatever
[17:37] <RP__> bluelightning: I think either can be the master, its kind of
irrelevant semantics as long as they're in sync
[17:37] <RP__> koen: meta-networking is meant to work standalone regardless
of whether its part of meta-oe, right?
[17:37] <koen> "as long as they're in sync" <- wishfull thinking
[17:37] <fray> RP__ that would be my hope
[17:37] <bluelightning> RP__: can be, sure, but you know how it's easier
for us to put stuff into bitbake / OE-Core than to try to accept patches at
both ends, the same would apply here I would think
[17:38] <RP__> koen: I will personally go and bang heads together if
they're not
[17:38] <RP__> koen: same as applied to poky = bitbake + meta-yocto +
oe-core
[17:38] <koen> RP__: that's nice, but still isn't instilling confidence
[17:38] <RP__> and yes, there is a meta-yocto now
[17:39] <RP__> bluelightning: well, presumably patches would be applied by
the maintainer to one tree and synced to the other. If there are a group of
maintainers they need to figure out the process
[17:39] <RP__> Think of the big picture here for a second
[17:39] <fray> RP__, yup select maintainers -- let them figure out the
process that works best for them
[17:40] <RP__> Monolithic layers cause immense problems with maintainership
[17:40] <bluelightning> sure
[17:40] <bluelightning> I think being a community layer there's little
chance of it remaining as only the list of recipes that WR is interested in
supporting; and Joe already acknowledges that
[17:40] <RP__> I would much prefer a larger set of well maintained layers
with specific purposes that forcing everything into one repo over
cloning/usability issues
[17:40] <bluelightning> which means there has to be some kind of separate
thing even if it's only internal to WR
[17:40] <RP__> I do get the usability concern and its why we have
combo-layer in the first place
[17:40] <koen> bluelightning: but the plan is still to make that repo a
second class citizen
[17:41] <koen> bluelightning: which is a recipe for disaster (pun not
intended)
[17:41] * bluelightning goes to check the thread
[17:41] <RP__> koen: There is no second class citizen
[17:41] <RP__> koen: is poky a second class citizen to oe-core or vice
versa, no
[17:41] <fray> (again not speaking on behalf of the oe-tsc for a second)
WR's policy is that we pull layers from open source.. if there are items in
it we don't want, can't support then we blacklist them.. we don't want to
have to cherry pick and create a "variant" of the layer
[17:41] <RP__> koen: they just have different use cases
[17:42] <RP__> sure we've had some issues getting poky/oe-core tamed but
there is 8 years of history there
[17:42] <fray> And I fully expect meta-networking to have items that WR (or
anyone else) may not want.. but vastly fewer of those items then meta-oe as
a whole
[17:42] <koen> RP__: since you mention it...
[17:42] <RP__> this shouldn't be hard by comparision
[17:42] <koen> RP__: I still see poky based pull requests on oe-core
[17:42] <bluelightning> koen: Joe states explicitly "there will never be
commits to it that don't come from commits to the meta-networking layer of
meta-openembedded"
[17:42] <koen> RP__: and people not getting the problem with that when
being told that
[17:42] <RP__> koen: As I've said, I don't actually care, I apply the patch
emails
[17:42] <bluelightning> koen: surely that's what you're after?
[17:43] <RP__> koen: People can contribute against what they're comfortable
with. I have scripts that move patches from a poky tree to OE-Core and vice
verse
[17:43] <koen> bluelightning: it sounds like it, but the other part of the
email isn't clear to me
[17:43] <koen> RP__: there shouldn't be poky based stuff on the oe-core list
[17:43] <RP__> koen: I'll just tell people to stop posting git trees
[17:44] <RP__> koen: It'll hurt me and Saul but who cares
[17:44] <bluelightning> koen: feel free to reply asking for clarification,
Joe's happy to discuss anything I think
[17:44] <fray> koen, I'm not sure i agree.. primary discussion of poky
(angstrom, or anything else) doesn't belong on oe-core.. but if it's
relevant to the oe-core direction (and that includes patches) I don't see a
problem, unless it gets disruptive
[17:44] <koen> RP__: people sending poky based patches is just as bad
[17:45] <RP__> koen: even thought they apply cleanly to OE-Core?
[17:45] <RP__> koen: I agree on the ones that touch meta-yocto and people
do get shouted at when they do that
[17:45] <koen> RP__: last time I tried they didn't
[17:45] <RP__> koen: I'd like examples please as they should and there
would be a good reason if they didn't
[17:46] <RP__> if there is a true problem there I want to understand it but
I don't understand how that can happen right now
[17:46] <RP__> With meta-networking, I suggest we ask Joe for a specific
clearly spelt out plan for it and mention the combo-layer tool
[17:47] <RP__> I think if there is a clear understanding of 100% sync, its
worth trying. The TSC can reserve the right to change that if it doesn't
work out
[17:47] <fray> (and for the record, I'm not involved w/ the meta-networking
stuff)
[17:47] <RP__> I do think we need to at least try and experiment with some
of these things
[17:47] <RP__> and also acknowledge there could be some bumps but we can
likely work through those
[17:48] <RP__> I think if we get this right, OE can grow as a project
[17:48] <fray> I agree
[17:48] <RP__> If we get this wrong, it could hurt us badly
[17:48] <bluelightning> what I think we ought not to lose sight of as well,
is that what we're gaining is additional maintained networking recipes that
we did not have before
[17:48] <RP__> by wrong I mean choose not to experiment and stagnate
[17:48] <koen> bluelightning: that's irrelevant if it breaks the complete
stack every other week
[17:48] <bluelightning> so this is not just an exercise in rearrangement,
OE stands to benefit quite a lot
[17:48] <bluelightning> koen: that's a straw man...
[17:49] <RP__> koen: If it is breaking things every week we need to
understand why and agree a way to fix that
[17:49] <RP__> koen: The TSC is here to deal with that an empowered to do so
[17:49] <fray> if/when it starts to break, the TSC needs to step in and
figure out why, and how to stop that... but until then, I don't see it as
an issue
[17:49] <koen> RP__: I'd like to try to prevent breakage :)
[17:50] <koen> then again, it's not like I have been able to do a build the
past 2 weeks
[17:50] <RP__> It has been a bad spot for various reasons. I'm hoping
things will calm down a bit now
[17:50] <RP__> and those reasons are unrelated to the maintenance of a
layer like this
[17:51] <bluelightning> koen: if you have remaining issues please report
them, don't wait two weeks...
[17:51] <koen> bluelightning: I had a deadline for a release today, so my
focus was on the denzil based stuff
[17:51] <bluelightning> koen: same applies...
[17:51] <bluelightning> if anything broken denzil is even more serious than
broken master, if that's what has occurred
[17:52] <koen> the denzil stuff works fine
[17:52] <bluelightning> right, presumably you are referring to master
breakage only
[17:53] <bluelightning> ok, so we have discussed a few things... let's move
onto the next topic
[17:53] <RP__> Part of this is about being attractive to new maintainers too
[17:53] <RP__> We need to let maintainers have some freedom in layers
whilst addressing the various constraints we need to operate in
[17:54] <RP__> I'm worried the hoops Joe is having to jump through will put
off other potential maintainers :(
[17:54] <koen> RP__: you're confusing 2 things
[17:54] <RP__> That isn't to say we shouldn't have a discussion but we do
also need to draw the line somewhere and make a decision
[17:54] <koen> Joe is jumping through hoops because his original proposal
broke a few layers in meta-openembedded badly
[17:55] <RP__> koen: Well, there are multiple angles to the discussion
[17:55] <koen> then the proposal was to put meta-networking in the
meta-openembedded repo and still break the other layers badly
[17:55] <RP__> koen: The break other layers badly piece is resolved now
though?
[17:55] <koen> I think we're at a point now were things don't break badly,
but Joe wants to do fancy subtree stuff that is destined to go wrong
[17:56] <RP__> My view is that if we do that, we should use combo layer to
manage things
[17:56] <RP__> not submodules or repo etc.
[17:57] <RP__> part of the reasoning is what we can adjust the tooling to
do what we need it to do if necessary
[17:57] <RP__> We're running out of time, I need to leave shortly
[17:58] <bluelightning> right
[17:59] <bluelightning> I don't think the remaining items need further
discussion this week
[17:59] <bluelightning> mostly ongoing
[17:59] <fray> I'm happy w/ that
[17:59] <bluelightning> any objections to closing the meeting there?
[18:00] <bluelightning> ok, I guess that's all for this meeting, folks
[18:00] <RP__> no, I'm assuming this goes back to the mailing list
[18:00] <bluelightning> right
[18:01] <fray> yup
[18:01] <bluelightning> we need to continue to help people towards a
solution

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--20cf304271b688782304c63bacff
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">OpenEmbedded Technical Steering Commi=
ttee</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">
31 July 2012</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgr=
ound-color:rgb(255,255,255)">
Attendees: Mark, Koen, Richard, Paul</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">Apologies: Khem</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">___________________________=
_____________________________________</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
Agenda &amp; Results</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">
1. pick a chair - bluelightning</div><div style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">
2. lingering issues</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">
=A0a. raise awareness of &quot;janitor&quot; list, QA &quot;bugs&quot;</div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)">=A0-&gt; continue</div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)">
=A0b. discuss communication with OE community about release-oriented phases=
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:13px;background-color:rgb(255,255,255)">=A0-&gt; continue</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
=A0c. pre/post install scripting (fray)</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">=A0=3D&gt; ask mailing list for proposals - continue</div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgr=
ound-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">3. new issues</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
=A0a. oe-made-easy script in getting started instructions - fixed</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)"><br></div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
=A0b. systemd</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">=A0=3D&gt; discuss=
 on mailing list (all)</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
=A0=3D&gt; bluelightning to send out current status to list</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">=A0=3D&gt; bluelightning to create enhancement =
bug in Yocto bugzilla to implement gitpkgv functionality in fetcher (done, =
bug 2872)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
=A0c. PR bumps</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)">=A0=3D&gt; koen t=
o investigate server &amp; report back</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
=A0=3D&gt; bluelightning to test on autobuilder infrastructure</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">=A0=3D&gt; bluelightning to document setup s=
teps on wiki</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">
=A0d. package.bbclass whitespace</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>=A0tabs resulting in warnings, seems better in general</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">
=A0some fallout, some positive comments</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)"><br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:13px;background-color:rgb(255,255,255)">
=A0e. meta-networking</div><div style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=A0=3D&gt;=
 continue discussion on mailing list</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">
=A0</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)">=A0lengthy discussion of pat=
ches against various layers, proper handling</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">4. status</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">=A0a. Should we still suppo=
rt separation of / and /usr?</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">=A0b. =A0khem to file enhan=
cement request for python devshell =A0(done)</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">=A0c. oe-core release</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">
=A0 =A0 =A0 there will be discussion on the list about release process</div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(25=
5,255,255)">
<span style=3D"white-space:pre-wrap">	</span>=A0=A0d. infrastructure</div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">=A0 =A0 =A0 mailing list issue (koen) =
- board is coping with it, keep on agenda</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
<span style=3D"white-space:pre-wrap">	</span>=A0=A0________________________=
________________________________________</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,2=
55,255)">
Raw Transcript</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
[16:57] &lt;bluelightning&gt; hi folks</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">[16:58] &lt;koen&gt; hey bluelightning</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
[16:58] --&gt; RP__ has joined this channel (~<a href=3D"mailto:richard@dan=
.rpsys.net" target=3D"_blank" style=3D"color:rgb(17,85,204)">richard@dan.rp=
sys.net</a>).</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">
[16:59] &lt;fray&gt; hey</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[16:59]=
 &lt;fray&gt; with vacation and travel, it feels like we just had a meeting=
.. :P</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[16:59] &lt;bluelightning&gt; heh</di=
v><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
13px;background-color:rgb(255,255,255)">
[17:00] * RP__ is wiped out today :/</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">[17:01] &lt;fray&gt; I think I&#39;ve had 3 work days since the last m=
eeting.. :P</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:01] &lt;koen&gt; &quot;Didn&#39;t=
 we have a meeting last week?&quot;</div><div style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,25=
5)">
[17:01] * RP__ hopes nobody is expecting him to make any sense</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">[17:01] &lt;fray&gt; RP__, it&#39;s ok to si=
t in the corner and drool for a bit.. :)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:01] &lt;RP__&gt; two weeks ago. W=
e agreed on the python whitespace change and I&#39;ve spent since then deal=
ing with it</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:02] &lt;RP__&gt; or so it feels l=
ike! ;-)</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:13px;background-color:rgb(255,255,255)">
[17:04] &lt;Jefro&gt; hi all - sorry, I am here but on phone - please carry=
 on</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)">[17:04] &lt;koen&gt; any new=
 things on the agenda or just the same?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:04] &lt;Jefro&gt; 7/17 schedule i=
s here=A0<a href=3D"http://piratepad.net/QVuGPkIJZr" target=3D"_blank" styl=
e=3D"color:rgb(17,85,204)">http://piratepad.net/QVuGPkIJZr</a></div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:04] &lt;fray&gt; I don&#39;t have=
 anything new</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:04] &lt;koen&gt; RP__: I finally have a build finished, so I can try tu=
rning on the auto PR stuff</div><div style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:0=
4] &lt;Jefro&gt; one thing is that I still need to get notes up :/</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:05] &lt;RP__&gt; koen: I&#39;ll m=
ake sure work on any issues gets prioritised...</div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rg=
b(255,255,255)">
[17:06] &lt;RP__&gt; ok, who is chairing</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,2=
55,255)">[17:06] &lt;RP__&gt; and has anyone heard from Khem?</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
[17:06] &lt;bluelightning&gt; I can do it, haven&#39;t done it for a while<=
/div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:13px;background-color:rgb(255,255,255)">[17:06] &lt;fray&gt; khem -- not=
 this morning..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:06] &lt;bluelightning&gt; re khem=
, no...</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:13px;background-color:rgb(255,255,255)">
[17:07] &lt;RP__&gt; bluelightning: go for it</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">[17:07] &lt;bluelightning&gt; ok, so 1 is done</div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgr=
ound-color:rgb(255,255,255)">
[17:07] &lt;RP__&gt; I pinged khem</div><div style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255=
)">[17:07] &lt;bluelightning&gt; 2a: =A0raise awareness of &quot;janitor&qu=
ot; list, QA &quot;bugs&quot;</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:08] &lt;fray&gt; still to be done=
... :(</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:13px;background-color:rgb(255,255,255)">
[17:08] &lt;RP__&gt; ongoing</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17=
:08] &lt;bluelightning&gt; presumably same applies to 2b/c ?</div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgr=
ound-color:rgb(255,255,255)">
[17:09] &lt;fray&gt; yes</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:09]=
 &lt;bluelightning&gt; ok, let&#39;s move on to 3a then</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">
[17:09] &lt;bluelightning&gt; oe-made-easy script in getting started instru=
ctions</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:13px;background-color:rgb(255,255,255)">[17:09] &lt;fray&gt; last=
 week we reached a decision on that.. did anyone have the time to change ht=
e wiki?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:09] &lt;bluelightning&gt; I think=
 I&#39;ve resolved this to my own satisfaction</div><div style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb=
(255,255,255)">
[17:09] &lt;bluelightning&gt; yep</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">[17:09] &lt;bluelightning&gt;=A0<a href=3D"http://www.openembedded.org/wi=
ki/OpenEmbedded-Core#Getting_Started" target=3D"_blank" style=3D"color:rgb(=
17,85,204)">http://www.openembedded.org/wiki/OpenEmbedded-Core#Getting_Star=
ted</a></div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:10] &lt;bluelightning&gt; should =
be more useful all around as well</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
[17:10] &lt;RP__&gt; bluelightning: looks much better, thanks!</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">[17:10] &lt;fray&gt; works for me</div><div =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;ba=
ckground-color:rgb(255,255,255)">
[17:11] &lt;bluelightning&gt; ok, so if there&#39;s nothing further... 3b: =
systemd</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:13px;background-color:rgb(255,255,255)">[17:11] &lt;RP__&gt; I h=
ear progress is being made there?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:12] &lt;bluelightning&gt; well, t=
he split happened prior to last meeting and there hasn&#39;t been a huge am=
ount of fall-out AFAIK, but koen can possibly elaborate</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:13] &lt;bluelightning&gt; AR for =
me from last time was to post an announcement which I did not get around to=
 though</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:15] &lt;RP__&gt; bluelightning: I=
 guess you&#39;ve a reminder now :)</div><div style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,25=
5)">
[17:15] &lt;bluelightning&gt; yes</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">[17:15] &lt;bluelightning&gt; as for remaining issues blocking moving tow=
ards the core, there is at least gitpkgv and switching to making it a distr=
o config option</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:16] &lt;bluelightning&gt; khem ha=
s moved libcgroup to oe-core, that&#39;s a minor step forward</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
[17:16] &lt;fray&gt; ohh I hadn&#39;t seen that..</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">[17:16] &lt;bluelightning&gt; is there already a bug open=
 for replicating the gitpkgv functionality in the fetcher?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:17] &lt;bluelightning&gt; that&#3=
9;s what will need to be done...</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
[17:17] &lt;bluelightning&gt; doesn&#39;t look like it</div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-c=
olor:rgb(255,255,255)">[17:18] &lt;RP__&gt; There was a kind of previous at=
tempt. It shouldn&#39;t be hard</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:18] &lt;bluelightning&gt; I would=
n&#39;t have thought so, no</div><div style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:18] &lt;bluelightning&gt; ok well, AR to me to create an enhancement bu=
g for that</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">[17:19] &lt;bluelight=
ning&gt; any further comments on systemd? koen, you&#39;ve been rather quie=
t today...</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:20] &lt;bluelightning&gt; if not,=
 let&#39;s move onto 3c: PR bumps</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
[17:21] &lt;bluelightning&gt; koen has indicated he&#39;s ready to test it<=
/div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:13px;background-color:rgb(255,255,255)">[17:21] &lt;RP__&gt; I think koe=
n commented on that above, he&#39;s about to test</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:21] &lt;bluelightning&gt; right</=
div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:13px;background-color:rgb(255,255,255)">
[17:21] &lt;RP__&gt; which is great, I look forward to the result and we wi=
ll work through any issues</div><div style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:2=
1] &lt;bluelightning&gt; I haven&#39;t talked to michael/beth about running=
 tests on the yocto AB infrastructure but it sounds like they have their ha=
nds full atm</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:23] &lt;RP__&gt; bluelightning: r=
ight now would be a bad time</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:24] &lt;fray&gt; is there any light coming up, or does it look pretty f=
rantic for a while..</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:24] &lt=
;bluelightning&gt; RP__: ok, I guess I should just make sure we have enough=
 docs so that they know what to do when the time comes</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:24] &lt;fray&gt; I know we had ta=
lked before about sometime in august switching, but I&#39;m still worried w=
e don&#39;t know enough</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:24] &lt;RP__&gt; fray: I keep thi=
nking there is light coming up :/</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
[17:24] &lt;koen&gt; can I add a &#39;meta-networking&#39; item to the agen=
da?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)">[17:24] &lt;bluelightning&gt=
; koen: sure</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:24] &lt;koen&gt; great</div><div =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;ba=
ckground-color:rgb(255,255,255)">
[17:25] &lt;bluelightning&gt; ok, well I think we&#39;re done with 3c</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:25] &lt;bluelightning&gt; on to 3=
d: package.bbclass whitespace</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:25] &lt;bluelightning&gt; presuma=
bly this is now sorted?</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:25] &lt;fray&gt; I&#39;ve seen some fallout on that, but in generate is=
 seems much better</div><div style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:26] &lt;b=
luelightning&gt; yeah, we expected some</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:26] &lt;bluelightning&gt; I don&#=
39;t have a handle on how much grief we caused for other layers</div><div s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;bac=
kground-color:rgb(255,255,255)">
[17:26] &lt;fray&gt; I don&#39;t think it was bad</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">[17:27] &lt;fray&gt; I figure in a few weeks as more laye=
rs roll forward, we might get some more stuff..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:27] &lt;RP__&gt; It resulted in w=
arnings, not errors so it shouldn&#39;t have been too bad</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
[17:27] &lt;bluelightning&gt; it sounds like the fallout was less than expe=
cted</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">[17:27] &lt;fray&gt; the bi=
ggest thing I heard about was 3 vs 4 character whitespace in things like pa=
ckage.bbclass..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:27] &lt;fray&gt; bluelightning ce=
rtainly less then I expected</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:28] &lt;koen&gt; I had to remove a few layers (meta-java, meta-opie) to=
 get things going again</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:28] =
&lt;bluelightning&gt; koen: hmm, I was not aware that meta-opie was broken<=
/div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:28] &lt;bluelightning&gt; probabl=
y because I haven&#39;t tested it since...</div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
[17:28] &lt;koen&gt; bluelightning: could be an interaction issue</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">[17:28] &lt;bluelightning&gt; will look i=
nto that later</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:28] &lt;koen&gt; it breaks parsin=
g, so easy to find out :)</div><div style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:29] &lt;bluelightning&gt; koen: is henning aware of the meta-java issue=
?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:13px;background-color:rgb(255,255,255)">[17:29] &lt;koen&gt; people se=
nt patches for it</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:29] &lt;koen&gt; so I assume he i=
s</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:13px;background-color:rgb(255,255,255)">
[17:29] &lt;bluelightning&gt; ok, so presumably that&#39;s being handled th=
en</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:13px;background-color:rgb(255,255,255)">[17:30] &lt;bluelightning&gt;=
 any further comments?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:30] &lt;RP__&gt; FWIW I did get s=
ome positive feedback on the whitespace change too (as in they were pleased=
 we were fixing what can be a nasty issue)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:30] &lt;bluelightning&gt; great :=
) a rare thing it seems</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:31] &lt;fray&gt; RP__ that is what I got by a few people as well</div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">[17:31] &lt;RP__&gt; It is nice to hea=
r someone liking a change rather than complaining the build broke</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:31] &lt;RP__&gt; :)</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
[17:31] &lt;bluelightning&gt; :)</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>[17:32] &lt;bluelightning&gt; ok then, let&#39;s move onto 3e: meta-networ=
king</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:32] &lt;fray&gt; I think the folk=
s who worked with the whitespace will be happier... and those that don&#39;=
t probably didn&#39;t notice</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:32] &lt;bluelightning&gt; koen: f=
ire away...</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">
[17:33] &lt;koen&gt; I still don&#39;t get what Joe is going on about &quot=
;subtrees&quot; and &quot;modules&quot;</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
[17:33] &lt;koen&gt; I don&#39;t get a good feeling about it</div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgr=
ound-color:rgb(255,255,255)">[17:33] &lt;fray&gt; there are lots of classes=
 of &quot;networking&quot;</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:33] &lt;RP__&gt; I actually wonde=
red about proposing using combo layer here</div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
[17:33] &lt;fray&gt; everything from network services, to device setup, to =
routing, etc..</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)">[17:33] &lt;koen&=
gt; it looks like windriver is wanting to do their own layer and not care a=
bout others</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:34] &lt;RP__&gt; so joe maintains=
 the layer in a git repo but that is flattened and committed to meta-oe eff=
ectively automagically</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:34] &lt;bluelightning&gt; koen: I=
 don&#39;t think that&#39;s it at all</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
[17:34] &lt;koen&gt; which is fine, but it seems it&#39;s turning into some=
 half-assed arrangement now</div><div style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:=
34] &lt;koen&gt; RP__: see, that scares me</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:34] &lt;RP__&gt; koen: I would li=
ke to steer clear of submodules too fwiw and I understand about not wanting=
 to split up meta-oe more</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:34] &lt;fray&gt; arranging the fi=
les and capabilities is needed.. dumping them all into one big bucket isn&#=
39;t going to work (from a maintenance standpoint)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:34] &lt;RP__&gt; koen: I can also=
 see why he wants something he can clone and use separate to meta-oe</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:35] &lt;koen&gt; RP__: seperate i=
n what way?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">
[17:35] &lt;koen&gt; RP__: no other files in the git clone?</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">[17:35] &lt;RP__&gt; koen: as a separate reposi=
tory without the rest of meta-oe</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:35] &lt;RP__&gt; koen: yes</div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">
[17:35] &lt;fray&gt; (speaking as a commercial provider for a second).. met=
a-oe is a good repository of recipes for us.. but we&#39;re never going to =
ship meta-oe.. =A0we need pieces of it, but not all of it..</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
[17:35] &lt;fray&gt; simple reason, it&#39;s got too much stuff that we&#39=
;re simply not willing to validate or support</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
[17:35] &lt;koen&gt; fray: which is fine</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,2=
55,255)">[17:36] &lt;RP__&gt; I will say the combo layer tooling is great a=
nd I&#39;m using it quite nicely</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:36] &lt;RP__&gt; and it could han=
dle this with ease, its a 1:1 mapping no problem</div><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)">
[17:36] &lt;fray&gt; networking is something that is wanted, and we don&#39=
;t want to deviate from an open source layer if possible.. =A0(we deviate, =
we have more to support)</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:36] &lt;koen&gt; but when doing the actual work, you should be working =
on an abstracted thing</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:36] &=
lt;koen&gt; should *not*</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:36] &lt;bluelightning&gt; one opt=
ion would be to use something like combo-layer to make the separate layer i=
f that&#39;s what Joe would prefer; but the layer in meta-openembedded woul=
d need to be the &quot;master&quot;</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:36] &lt;bluelightning&gt; for com=
munity preference</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:36] &lt;RP__&gt; koen: &quot;abstracted&quot; in what way?</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">[17:37] &lt;fray&gt; concern with any type o=
f &quot;combined&quot; git repository is having to cherry pick and manage t=
he patches</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:37] &lt;koen&gt; RP__: combo-laye=
r/subtree/whatever</div><div style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:37] &lt;RP__&gt; bluelightning: I think either can be the master, its k=
ind of irrelevant semantics as long as they&#39;re in sync</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
[17:37] &lt;RP__&gt; koen: meta-networking is meant to work standalone rega=
rdless of whether its part of meta-oe, right?</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
[17:37] &lt;koen&gt; &quot;as long as they&#39;re in sync&quot; &lt;- wishf=
ull thinking</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:13px;background-color:rgb(255,255,255)">[17:37] &lt;fray&gt=
; RP__ that would be my hope</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:37] &lt;bluelightning&gt; RP__: c=
an be, sure, but you know how it&#39;s easier for us to put stuff into bitb=
ake / OE-Core than to try to accept patches at both ends, the same would ap=
ply here I would think</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:38] &lt;RP__&gt; koen: I will per=
sonally go and bang heads together if they&#39;re not</div><div style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-co=
lor:rgb(255,255,255)">
[17:38] &lt;RP__&gt; koen: same as applied to poky =3D bitbake + meta-yocto=
 + oe-core</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">[17:38] &lt;koen&gt; =
RP__: that&#39;s nice, but still isn&#39;t instilling confidence</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:38] &lt;RP__&gt; and yes, there i=
s a meta-yocto now</div><div style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:39] &lt;RP__&gt; bluelightning: well, presumably patches would be appli=
ed by the maintainer to one tree and synced to the other. If there are a gr=
oup of maintainers they need to figure out the process</div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-c=
olor:rgb(255,255,255)">
[17:39] &lt;RP__&gt; Think of the big picture here for a second</div><div s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;bac=
kground-color:rgb(255,255,255)">[17:39] &lt;fray&gt; RP__, yup select maint=
ainers -- let them figure out the process that works best for them</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:40] &lt;RP__&gt; Monolithic layer=
s cause immense problems with maintainership</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">
[17:40] &lt;bluelightning&gt; sure</div><div style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255=
)">[17:40] &lt;bluelightning&gt; I think being a community layer there&#39;=
s little chance of it remaining as only the list of recipes that WR is inte=
rested in supporting; and Joe already acknowledges that</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:40] &lt;RP__&gt; I would much pre=
fer a larger set of well maintained layers with specific purposes that forc=
ing everything into one repo over cloning/usability issues</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:40] &lt;bluelightning&gt; which m=
eans there has to be some kind of separate thing even if it&#39;s only inte=
rnal to WR</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:40] &lt;RP__&gt; I do get the usa=
bility concern and its why we have combo-layer in the first place</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
[17:40] &lt;koen&gt; bluelightning: but the plan is still to make that repo=
 a second class citizen</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:41] =
&lt;koen&gt; bluelightning: which is a recipe for disaster (pun not intende=
d)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:41] * bluelightning goes to check=
 the thread</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">
[17:41] &lt;RP__&gt; koen: There is no second class citizen</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">[17:41] &lt;RP__&gt; koen: is poky a second cla=
ss citizen to oe-core or vice versa, no</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:41] &lt;fray&gt; (again not speak=
ing on behalf of the oe-tsc for a second) WR&#39;s policy is that we pull l=
ayers from open source.. if there are items in it we don&#39;t want, can&#3=
9;t support then we blacklist them.. we don&#39;t want to have to cherry pi=
ck and create a &quot;variant&quot; of the layer</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:41] &lt;RP__&gt; koen: they just =
have different use cases</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:42] &lt;RP__&gt; sure we&#39;ve had some issues getting poky/oe-core ta=
med but there is 8 years of history there</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">
[17:42] &lt;fray&gt; And I fully expect meta-networking to have items that =
WR (or anyone else) may not want.. but vastly fewer of those items then met=
a-oe as a whole</div><div style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:42] &lt;koen&gt; RP__: since you mention it...</div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color=
:rgb(255,255,255)">[17:42] &lt;RP__&gt; this shouldn&#39;t be hard by compa=
rision</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:42] &lt;koen&gt; RP__: I still se=
e poky based pull requests on oe-core</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
[17:42] &lt;bluelightning&gt; koen: Joe states explicitly &quot;there will =
never be commits to it that don&#39;t come from commits to the meta-network=
ing layer of meta-openembedded&quot;</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">
[17:42] &lt;koen&gt; RP__: and people not getting the problem with that whe=
n being told that</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:42] &lt;RP=
__&gt; koen: As I&#39;ve said, I don&#39;t actually care, I apply the patch=
 emails</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:42] &lt;bluelightning&gt; koen: s=
urely that&#39;s what you&#39;re after?</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
[17:43] &lt;RP__&gt; koen: People can contribute against what they&#39;re c=
omfortable with. I have scripts that move patches from a poky tree to OE-Co=
re and vice verse</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:43] &lt;koen&gt; bluelightning: it sounds like it, but the other part o=
f the email isn&#39;t clear to me</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
[17:43] &lt;koen&gt; RP__: there shouldn&#39;t be poky based stuff on the o=
e-core list</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">[17:43] &lt;RP__&gt;=
 koen: I&#39;ll just tell people to stop posting git trees</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:44] &lt;RP__&gt; koen: It&#39;ll =
hurt me and Saul but who cares</div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:44] &lt;bluelightning&gt; koen: feel free to reply asking for clarifica=
tion, Joe&#39;s happy to discuss anything I think</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">
[17:44] &lt;fray&gt; koen, I&#39;m not sure i agree.. primary discussion of=
 poky (angstrom, or anything else) doesn&#39;t belong on oe-core.. but if i=
t&#39;s relevant to the oe-core direction (and that includes patches) I don=
&#39;t see a problem, unless it gets disruptive</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:44] &lt;koen&gt; RP__: people sen=
ding poky based patches is just as bad</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
[17:45] &lt;RP__&gt; koen: even thought they apply cleanly to OE-Core?</div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)">[17:45] &lt;RP__&gt; koen: I agree o=
n the ones that touch meta-yocto and people do get shouted at when they do =
that</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:45] &lt;koen&gt; RP__: last time =
I tried they didn&#39;t</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:45] &lt;RP__&gt; koen: I&#39;d like examples please as they should and =
there would be a good reason if they didn&#39;t</div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rg=
b(255,255,255)">
[17:46] &lt;RP__&gt; if there is a true problem there I want to understand =
it but I don&#39;t understand how that can happen right now</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
[17:46] &lt;RP__&gt; With meta-networking, I suggest we ask Joe for a speci=
fic clearly spelt out plan for it and mention the combo-layer tool</div><di=
v style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;=
background-color:rgb(255,255,255)">
[17:47] &lt;RP__&gt; I think if there is a clear understanding of 100% sync=
, its worth trying. The TSC can reserve the right to change that if it does=
n&#39;t work out</div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:47] &lt;fray&gt; (and for the record, I&#39;m not involved w/ the meta-=
networking stuff)</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:47] &lt;RP=
__&gt; I do think we need to at least try and experiment with some of these=
 things</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:47] &lt;RP__&gt; and also acknowl=
edge there could be some bumps but we can likely work through those</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:48] &lt;RP__&gt; I think if we ge=
t this right, OE can grow as a project</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
[17:48] &lt;fray&gt; I agree</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17=
:48] &lt;RP__&gt; If we get this wrong, it could hurt us badly</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
[17:48] &lt;bluelightning&gt; what I think we ought not to lose sight of as=
 well, is that what we&#39;re gaining is additional maintained networking r=
ecipes that we did not have before</div><div style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255=
)">
[17:48] &lt;RP__&gt; by wrong I mean choose not to experiment and stagnate<=
/div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:13px;background-color:rgb(255,255,255)">[17:48] &lt;koen&gt; bluelightni=
ng: that&#39;s irrelevant if it breaks the complete stack every other week<=
/div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:48] &lt;bluelightning&gt; so this=
 is not just an exercise in rearrangement, OE stands to benefit quite a lot=
</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:48] &lt;bluelightning&gt; koen: t=
hat&#39;s a straw man...</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
[17:49] &lt;RP__&gt; koen: If it is breaking things every week we need to u=
nderstand why and agree a way to fix that</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">
[17:49] &lt;RP__&gt; koen: The TSC is here to deal with that an empowered t=
o do so</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:13px;background-color:rgb(255,255,255)">[17:49] &lt;fray&gt; if/=
when it starts to break, the TSC needs to step in and figure out why, and h=
ow to stop that... but until then, I don&#39;t see it as an issue</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:49] &lt;koen&gt; RP__: I&#39;d li=
ke to try to prevent breakage :)</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
[17:50] &lt;koen&gt; then again, it&#39;s not like I have been able to do a=
 build the past 2 weeks</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">[17:50] =
&lt;RP__&gt; It has been a bad spot for various reasons. I&#39;m hoping thi=
ngs will calm down a bit now</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:50] &lt;RP__&gt; and those reason=
s are unrelated to the maintenance of a layer like this</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">
[17:51] &lt;bluelightning&gt; koen: if you have remaining issues please rep=
ort them, don&#39;t wait two weeks...</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
[17:51] &lt;koen&gt; bluelightning: I had a deadline for a release today, s=
o my focus was on the denzil based stuff</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,2=
55,255)">
[17:51] &lt;bluelightning&gt; koen: same applies...</div><div style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-colo=
r:rgb(255,255,255)">[17:51] &lt;bluelightning&gt; if anything broken denzil=
 is even more serious than broken master, if that&#39;s what has occurred</=
div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:52] &lt;koen&gt; the denzil stuff=
 works fine</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">
[17:52] &lt;bluelightning&gt; right, presumably you are referring to master=
 breakage only</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)">[17:53] &lt;bluel=
ightning&gt; ok, so we have discussed a few things... let&#39;s move onto t=
he next topic</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:53] &lt;RP__&gt; Part of this is =
about being attractive to new maintainers too</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
[17:53] &lt;RP__&gt; We need to let maintainers have some freedom in layers=
 whilst addressing the various constraints we need to operate in</div><div =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;ba=
ckground-color:rgb(255,255,255)">
[17:54] &lt;RP__&gt; I&#39;m worried the hoops Joe is having to jump throug=
h will put off other potential maintainers :(</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
[17:54] &lt;koen&gt; RP__: you&#39;re confusing 2 things</div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)">[17:54] &lt;RP__&gt; That isn&#39;t to say we shou=
ldn&#39;t have a discussion but we do also need to draw the line somewhere =
and make a decision</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:54] &lt;koen&gt; Joe is jumping t=
hrough hoops because his original proposal broke a few layers in meta-opene=
mbedded badly</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:55] &lt;RP__&gt; koen: Well, ther=
e are multiple angles to the discussion</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
[17:55] &lt;koen&gt; then the proposal was to put meta-networking in the me=
ta-openembedded repo and still break the other layers badly</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
[17:55] &lt;RP__&gt; koen: The break other layers badly piece is resolved n=
ow though?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">[17:55] &lt;koen&gt; =
I think we&#39;re at a point now were things don&#39;t break badly, but Joe=
 wants to do fancy subtree stuff that is destined to go wrong</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:56] &lt;RP__&gt; My view is that =
if we do that, we should use combo layer to manage things</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
[17:56] &lt;RP__&gt; not submodules or repo etc.</div><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)">[17:57] &lt;RP__&gt; part of the reasoning is what we can =
adjust the tooling to do what we need it to do if necessary</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:57] &lt;RP__&gt; We&#39;re runnin=
g out of time, I need to leave shortly</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
[17:58] &lt;bluelightning&gt; right</div><div style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,25=
5)">[17:59] &lt;bluelightning&gt; I don&#39;t think the remaining items nee=
d further discussion this week</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[17:59] &lt;bluelightning&gt; mostly =
ongoing</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:13px;background-color:rgb(255,255,255)">
[17:59] &lt;fray&gt; I&#39;m happy w/ that</div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">[17:59] &lt;bluelightning&gt; any objections to closing the meet=
ing there?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[18:00] &lt;bluelightning&gt; ok, I g=
uess that&#39;s all for this meeting, folks</div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(25=
5,255,255)">
[18:00] &lt;RP__&gt; no, I&#39;m assuming this goes back to the mailing lis=
t</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:13px;background-color:rgb(255,255,255)">[18:00] &lt;bluelightning&gt; =
right</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">[18:01] &lt;fray&gt; yup</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
[18:01] &lt;bluelightning&gt; we need to continue to help people towards a =
solution</div><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefr=
o.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Project C=
ommunity Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_blan=
k">http://yoctoproject.org</a></div>
<br>

--20cf304271b688782304c63bacff--
