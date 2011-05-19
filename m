Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QMrlb-00075D-Nn; Thu, 19 May 2011 03:11:10 +0200
Received: by qyk35 with SMTP id 35so3758618qyk.6
	for <multiple recipients>; Wed, 18 May 2011 18:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=TW9Pkmyj677Wvc19gzfTzcTXm1HceWG6SVCAMNpyLhE=;
	b=C5zyiZtvQLIohPOq6PGBCIo9TAM7/pYY9BPP4s4qUr7GJSKNUQxOXdVK1JWYkL7prF
	FEL+cSUNGZrJX42VsMwuwrBItOwGVbC6ZGOZeqcrn/cH12FOCSza4M0lkbZVGsoInBoO
	go1sLySkOGizgtVsBy4eNyCeFuLt+HbmQh68Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=B4emOBXqcLlBZUvcrnw4pvjKvc2GyMkPzH1Xu046fOGo1nTTuW6fOOCwiXD7vsTfDW
	XjjfwH8jKXRIZ6qA4JC4zbM8/Or22l+8R8akd/sPKF0+w6I4NhZVjdk0B5oV7nnKSivn
	2qf0vL0P9HeYZp5LstrDoGafLAUvTeYMPnUT0=
MIME-Version: 1.0
Received: by 10.229.63.151 with SMTP id b23mr1942282qci.289.1305767291514;
	Wed, 18 May 2011 18:08:11 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.229.213.200 with HTTP; Wed, 18 May 2011 18:08:11 -0700 (PDT)
Date: Wed, 18 May 2011 18:08:11 -0700
X-Google-Sender-Auth: JdUSbHI7N7kKNad06zAjKpczPfA
Message-ID: <BANLkTinYBebHMsbvhrBN4B4ssLZbEwcyaA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES, OE-TSC meeting 28 Apr 2011
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
X-List-Received-Date: Thu, 19 May 2011 01:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

d p
x x 25 march
x x 10 apr f2f
x ? 28 apr
x x 5 may
? ? 12 may

AGENDA: OpenEmbedded Technical Steering Committee, 28 April 2011
___________________________________
 01) Agree on meeting chair

fray
___________________________________
  02) Followup on F2F meeting at ELC

RP started branding transformation
run through items needed before formal oe-core announcement
big remaining pieces: distroless, srcrev removal from core files
xorg imported into meta-oe, task-boot moved
general agreement on git commits to a mailing list
___________________________________
03) Status report on oe-core

action items:
  general: encourage more distros to participate in oe-core
   general: invite more people to meta-oe on the oe-devel mailing list
  interested parties: discuss documentation
  //> RP to ping mwester re slugos
 ___________________________________
 04) Status report on pull model, contrib repo and guidelines

action items:
  khem will try to write up how to use contrib repos
  Mark hopes to post commit/patch policy guidelines tomorrow, has feedback
to incorporate
    //doc is in third round, ** oe-tsc please read
    //discussion re COO - fray will rework
--> not much done here, defer to next week
___________________________________
 05) Status report on board support layer guidelines

action items:
--> document whatever is decided with respect to repo hosting
--> RP to send proposal to board
___________________________________
 06) Status on layer splitting of metadata

ongoing

action items:
  general: keep discussions going
___________________________________
 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other
    "flags" discussion
  [ Proposed: Tom Rini ]

action item:
  all: discuss on mailing list
continue discussing
___________________________________
 09) Continue discussions on infrastructure items

action item:
--> Jefro: write a blurb describing bugzilla change for a TSC member to post
still not done
___________________________________
 10) Last patchwork weekend for patchwork.or.org mid april.
  [ Proposed: Stefan ]

   After this weekend we should remove all patches from it and only
   use patches.openembedded.org from now.

action item:
   Stefan will send out mails for this.

not much progress, defer to next week
___________________________________
new item: when does this meeting happen? (EU is now on DST)

// keep at current time
___________________________________
new item: elections

will elect seats in order from the board announcement, or expand TSC to 6
members
RP will ping board


RAW TRANSCRIPT

(1:00:40 PM) *Jefro:* ...aaaand it's 1pm, and it looks like a quorum
(1:00:59 PM) *Jefro:* does everyone have the agenda?
(1:01:22 PM) *koen:* after you paste the URL :)
(1:01:29 PM) ****koen* is not on his own computer, no mail
(1:02:10 PM) *Jefro:* 1 sec
(1:02:17 PM) *RP__:* First up we need a chair
(1:02:51 PM) *RP__:* Any volunteers? I think I did the last meeting at the
f2f
(1:03:05 PM) *fray:* I can if there is a lack of volunteers.. :)
(1:03:20 PM) *stefan_schmidt:* fray: so you volunteered ;)
(1:03:27 PM) ****RP__* hands fray an extra couple of legs
(1:03:54 PM) *RP__:* Second item is "Followup on F2F meeting at ELC"
(1:03:56 PM) *Jefro:* gmail is not behaving for me today, sorry for delay
(1:04:11 PM) *RP__:* Jefro: I'll paste them until you get sorted
(1:04:16 PM) *fray:* is this the same agenda as 21-Apr meeting that didn't
happen?
(1:04:32 PM) *RP__:* fray: I suspect so
(1:04:35 PM) *Jefro:* http://pastebin.com/5pdtuwN8
(1:04:36 PM) *RP__:* I couldn't find a different one
(1:04:40 PM) *fray:* ok.. I'll assume it is until corrected..
(1:04:40 PM) *Jefro:* yes, it is the same one
(1:04:58 PM) *Jefro:* ** meeting chair is fray
(1:05:04 PM) *RP__:* stefan_schmidt: Did you have any questions about the
ELC meeting?
(1:05:05 PM) *fray:* ok then.. we selected a chair.. on to #2.. F2F follow
up
(1:05:20 PM) *RP__:* stefan_schmidt: I'm singling you out since you weren't
there ;-)
(1:05:39 PM) *stefan_schmidt:* RP__: not about the meeting notes but about
the hacking/sprint you did
(1:05:50 PM) *stefan_schmidt:* RP__: Did most of the AI git tackled there?
(1:05:57 PM) *stefan_schmidt:* It seemed a lot in the minutes...
(1:06:05 PM) *fray:* thats what i was just going to ask.. :)
(1:06:31 PM) *RP__:* Good question - I'm not sure where we stand on the
various AIs
(1:06:35 PM) *stefan_schmidt:* RP__: Its a real pity that I could not make
it. But that was the last exam. Only diploma thesis is ongoing now and then
I'm free ;)
(1:06:37 PM) *RP__:* I know I started the branding transformation
(1:06:50 PM) *RP__:* stefan_schmidt: cool :)
(1:06:50 PM) *stefan_schmidt:* yeah, seen that on the ml
(1:07:13 PM) *fray:* Jefro, do we have a specific action item list from the
F2F?
(1:07:24 PM) *stefan_schmidt:* RP__: I arranged it that the deadline is
right before ELC-E :D
(1:07:26 PM) *fray:* I know for the hacking we went through the things in
person on RP's system..
(1:07:35 PM) ****RP__* is on vacation this week do hasn't been as active wrt
changes
(1:07:52 PM) *RP__:* stefan_schmidt: nice, so you'll be free for the
conference :)
(1:07:54 PM) *Jefro:* http://pastebin.com/5wPn3YrT contains the action items
from the F2F
(1:07:59 PM) *koen:* I was planning to bribe saul to sneak in some stuff,
but RP still checks his mail
(1:08:07 PM) *RP__:* fray: All the stuff we discussed on my machine is
merged
(1:08:26 PM) *RP__:* koen: I'm not daft ;-)
(1:08:37 PM) *fray:* RP__ ok.. that I think we need to (each) run though
whats there and verify it looks good.. if so we may be ready for the more
formal come and play announcement
(1:08:55 PM) *RP__:* I tried to highlight the remaining work that was needed
(1:09:07 PM) *koen:* xorg has been imported, task-boot moved
(1:09:12 PM) *RP__:* fray: I specifically called you out to remove the
pokyisms from the rpm/zypper bits
(1:09:35 PM) *fray:* RP__ ok..I'll note that and get on it ASAP.. (hopefully
it'll be resolved before you are done w/ vacation)
(1:10:17 PM) *RP__:* fray: shouldn't be difficult but you know the code
pieces better and you might find you want to reconsolidate some of the
patches or something
(1:10:45 PM) *fray:* ok, anything further on this? my take is we're in
pretty good shape.. a bit of work remains, and we should all look and verify
what is there is what we wanted
(1:10:55 PM) *fray:* anything else on 2?
(1:11:02 PM) *RP__:* koen: When you say xorg imported, you mean to meta-oe
or you mean meta-oe and oe-core are in sync?
(1:11:10 PM) *koen:* into meta-oe
(1:11:12 PM) *stefan_schmidt:* I think other important items will come later
on the agenda anyway
(1:11:16 PM) *koen:* it's not in sync with oe-core
(1:11:24 PM) *koen:* martin and I are looking at it
(1:11:25 PM) *RP__:* koen: ok
(1:11:29 PM) *koen:* top down, so gtk+ first
(1:12:00 PM) *RP__:* The big remaining piece is the distroless operation
(1:12:06 PM) *RP__:* from the branding PoV
(1:12:14 PM) *koen:* right
(1:12:24 PM) *koen:* and that's related to the global srcrev as well, right?
(1:12:32 PM) *RP__:* I'm waiting on Ke to do the SRCREV removal from the
core files, yes
(1:13:07 PM) *RP__:* Ok, so this is leading into 03 - Status report on
oe-core
(1:13:20 PM) *RP__:*   general: encourage more distros to participate in
oe-core   general: invite more people to meta-oe on the oe-devel mailing
list   interested parties: discuss documentation
(1:13:40 PM) *RP__:* Are we ready to invite people or do we need to make any
further checks/changes?
(1:13:45 PM) *fray:* RP, ya.. lets move onto 3 and come back to 2 if
needed..
(1:14:03 PM) *koen:* some people are already confused by the meta-oe patches
sent to oe-dev
(1:14:09 PM) *stefan_schmidt:* One general point that pops up into my mind
is that I have a bit of a problem to follow the massive amount of changes
that come in
(1:14:10 PM) *fray:* I just want a quick once over on the stuff.. I've
looked at about half of the stuff there (rest of the day is all I need) and
I'll be happy I think
(1:14:30 PM) *stefan_schmidt:* No idea what we can do against it, but its
hard to follow if you only can spare some hours a week for it
(1:14:34 PM) *RP__:* stefan_schmidt: worse than OE?
(1:14:42 PM) *stefan_schmidt:* RP__: it feels worse, yes
(1:14:50 PM) *fray:* Suggestion.. unless someone finds a problem, we will
release the invite on Friday or Monday?
(1:14:58 PM) *stefan_schmidt:* RP__: Not the changes itself. They are pretty
good normally
(1:14:58 PM) *koen:* the amount is fine, but some really big changes go in
without much notice
(1:15:06 PM) *RP__:* Is this because of the posting patches on the mailing
list problem or do we really have more changes?
(1:15:09 PM) *koen:* like the change that does s/-/_/ on machine names
(1:15:14 PM) *koen:* that one was *nasty*
(1:15:16 PM) *Tartarus:* need a git commit list
(1:15:17 PM) *stefan_schmidt:* Its just so many things. As I said no real
idea how to improve this
(1:15:20 PM) *Tartarus:* or added to existing
(1:15:25 PM) *koen:* and broke feeds for every machine with a '-'
(1:15:45 PM) *RP__:* koen: Did those machines work at all anyway? The
assumption was they couldn't have been working? :/
(1:15:53 PM) *koen:* I know yocto doesn't care about feeds or upgrade paths,
but that one was crazy
(1:16:05 PM) *stefan_schmidt:* RP__: maybe because of the patches. Can't say
to much yet. It was more a feeling I got over time
(1:16:10 PM) *koen:* RP__: yes, they worked, omap4430-panda was the first
machine I tested on
(1:16:11 PM) *RP__:* koen: We do care actually, I didn't realise there was a
problem there
(1:16:53 PM) *RP__:* koen: I can only apologise and try not to do that
again, sorry
(1:17:34 PM) ****RP__* does feel the review process for patches is working
well to keep quality etc, I'm not sure if everyone agrees?
(1:17:53 PM) *koen:* it's tons better than what OE has
(1:18:10 PM) *fray:* I see more eyes paying attention.. so I think it's been
a win
(1:18:20 PM) ****koen* needs to write some 'opkg upgrade' tests for opentest
to catch things like this
(1:18:33 PM) *stefan_schmidt:* I'm quite happy. It always can be improved
thought. But that will happen over time
(1:18:43 PM) *RP__:* koen: We should find a way to test some of it with the
autobuilder too
(1:19:02 PM) *RP__:* stefan_schmidt: it can always be improved, yes :)
(1:19:13 PM) *RP__:* Ok, so are we ready to invite people or not?
(1:19:18 PM) *RP__:* Is anyone not ready?
(1:19:35 PM) *fray:* I'd like another 2 hours to look.. but everything I've
seen so far says we're ready
(1:19:37 PM) ****RP__* will be spending more time back at work from Tuesday
next week
(1:19:57 PM) *Tartarus:* So, again
(1:19:57 PM) *stefan_schmidt:* Lets wait until RP is back and then invite
more people
(1:20:01 PM) *Tartarus:* git commits going to an ML:?
(1:20:03 PM) *stefan_schmidt:* for last minute fixes :)
(1:20:03 PM) *Tartarus:* existing or new
(1:20:05 PM) *Tartarus:* i don't care
(1:20:06 PM) *RP__:* Until then I will not be around too much, I'm not sure
if that matters much ro not
(1:20:07 PM) *Tartarus:* but it's a must
(1:20:09 PM) *koen:* from the active distros in OE we only need slugos
(1:20:31 PM) *RP__:* Tartarus: Which repo, OE-Core?
(1:20:39 PM) *stefan_schmidt:* Tartarus: I would like a commit list as well.
Don't care where though
(1:20:42 PM) *Tartarus:* and meta-oe
(1:21:00 PM) *koen:* we could funnel all "important" layers commits there
(1:21:01 PM) *RP__:* same mailing list or separate?
(1:21:08 PM) *Tartarus:* same is fine
(1:21:12 PM) *Tartarus:* and would help encourage migration
(1:21:23 PM) *RP__:* OE infrastructure probably makes more sense that Yocto?
(1:21:47 PM) *RP__:* koen: Is slugos still run by Rod?
(1:21:55 PM) *stefan_schmidt:* RP__: mwester I think
(1:22:09 PM) *stefan_schmidt:* RP__: rod is mostly webos-internals nowadays
(1:22:18 PM) *RP__:* has anyone talked to mwester?
(1:22:47 PM) *Tartarus:* only vaguely a while ago
(1:23:07 PM) *RP__:* koen: do you have much contact there?
(1:23:33 PM) *koen:* only with Tom King
(1:23:54 PM) *Tartarus:* mwester is around #oe on the weekends
(1:24:24 PM) *RP__:* ok, any volunteers to talk to him about this on behalf
of the TSC?
(1:24:52 PM) *RP__:* and I'm assuming an OE-commits list would go down
better. Next question is who has list admin powers?
(1:25:20 PM) *RP__:* and then who has access to the git user to create
post-update hooks
(1:25:32 PM) ****stefan_schmidt* has neither
(1:25:54 PM) *Jefro:* RP__ were there any volunteers to talk to mwester?
(1:25:59 PM) *koen:* RP__: the complete tsc should have repo admin, no?
(1:26:03 PM) *Jefro:* just want to give an owner to the action item
(1:26:17 PM) *RP__:* koen: This isn't repo admin, you need ssh access
(1:26:24 PM) *Tartarus:* khem usually does this stuff
(1:26:35 PM) *Tartarus:* assign in absentia until he acks or nacks?
(1:26:41 PM) *Tartarus:* naks even
(1:26:42 PM) *fray:* I think that makes sense
(1:26:55 PM) ****RP__* doesn't have the hook access
(1:27:05 PM) *RP__:* or list admin access for that matter
(1:27:25 PM) *RP__:* ok, we ask khem and if that fails we talk to CLiff
(1:27:27 PM) *RP__:* or Tom
(1:27:39 PM) *RP__:* (King)
(1:28:07 PM) *RP__:* For mwester, I can vounteer to talk to him but it would
be next weekend, not this weekend as I'll be away from computers
(1:28:28 PM) *stefan_schmidt:* I don't think we are in a rush here
(1:29:03 PM) *RP__:* fray: time for 4) ? :)
(1:29:11 PM) *fray:* ok.. sounds good 4 it is..
(1:29:24 PM) *RP__:*  04) Status report on pull model, contrib repo and
guidelines   action items:   khem will try to write up how to use contrib
repos   Mark hopes to post commit/patch policy guidelines tomorrow, has
feedback to incorporate     //doc is in third round, ** oe-tsc please read
  //discussion re COO - fray will rework
(1:29:33 PM) *fray:* commit guidelines status from me.. I'm delinquent.. but
I did get some more feedback..
(1:29:49 PM) *RP__:* Did Khem do a writeup?
(1:29:57 PM) *RP__:* Jefro: Did we pull any of the Yocto pieces together?
(1:30:06 PM) *fray:* Saul sent some info about a desire to add a status to
patches to indicate if it was contributed upstream or not..
(1:30:29 PM) *RP__:* We need to pull all the Yocto and OE pieces of this
together
(1:30:30 PM) *Jefro:* RP__ still working on that - many fires burning. we
have some policies up now, some still in proces.
(1:30:35 PM) *fray:* Does anyone have any comments if thats desired or not
within the context of OE-Core? (I told him nothing in the policy prevents
that, but it wasn't a requirement -- yet)
(1:30:52 PM) *Jefro:* khem, if you'd like we can sync after this meeting
(1:31:03 PM) *stefan_schmidt:* fray: I would like to see such a tag.
(1:31:16 PM) *RP__:* fray: I'm ok with making it a strong recommendation for
OE-Core
(1:31:18 PM) *stefan_schmidt:* send upstream / not upstreamable, etc
(1:31:21 PM) *fray:* ok.. I'll add it to the proposal when I finally wrap
everything up..
(1:31:37 PM) *fray:* stefan, ya.. I don't remember the exact items off
hand.. but it's something like that..
(1:31:42 PM) *stefan_schmidt:* We have so many patches lying around that
would get clearer through this
(1:31:45 PM) *fray:* it's a very useful tag to determine what is lacking
upstream
(1:31:56 PM) ****RP__* agrees
(1:32:06 PM) *fray:* ok.. on to 5 then?
(1:32:10 PM) *stefan_schmidt:* and often you find a better way while dealing
with upstream for your hack :)
(1:32:32 PM) *koen:* gobject-introspection patches :)
(1:32:47 PM) *koen:* my bugreport is still open after how many years now?
(1:32:55 PM) *RP__:* koen: There has been movement on that though
(1:33:13 PM) *koen:* yeah, josh and I have been talking about it recently
(1:33:31 PM) *RP__:* fray: yes, BSPs
(1:33:49 PM) *RP__:* We've talked a lot of about BSPs both at the f2f and
the Yocto meetings
(1:34:01 PM) *Tartarus:* brb
(1:34:19 PM) *stefan_schmidt:* any real outcome?
(1:34:24 PM) *RP__:* I think there is general consensus that BSPs in one
place together, even if some of them are mirrors
(1:34:32 PM) *fray:* yup
(1:34:34 PM) *RP__:* is desirable
(1:34:57 PM) *koen:* bsp and layers even
(1:35:04 PM) *RP__:* koen: right
(1:35:30 PM) *fray:* anything else on BSPs, other then we have a direction
we want to go?
(1:35:53 PM) *RP__:* I think technically, the best solution might be to run
both git.yoctoproect.org and git.openembedded.org off the same server with
different "windows" on the repos
(1:36:18 PM) *RP__:* Like git.yoctoproject.org and git.pokylinux.org are
today (but the lists of repos can differ)
(1:36:23 PM) *Tartarus:* back
(1:36:45 PM) *stefan_schmidt:* all in one place sounds got. Everything else
get people nuts.
(1:37:19 PM) *RP__:* Yocto is about to move some servers around. I'd suggest
we come back to this in 2-3 weeks once the new yocto web/git server is
established
(1:37:23 PM) *stefan_schmidt:* Personally I don't care on what server they
are. More important is that it is clearly documented where.
(1:37:36 PM) *RP__:* stefan_schmidt: agreed
(1:37:55 PM) *Jefro:* action item: document whatever is decided with respect
to repo hosting. owner?
(1:38:18 PM) *RP__:* Jefro: I'll take it and I'll send a proposal from the
TSC to the members/board
(1:38:30 PM) *Jefro:* got it, thanks
(1:38:50 PM) *RP__:* but we are deliberately waiting a few weeks on this
one, not pushing it
(1:39:10 PM) *Jefro:* RP__ understood; I'll just make sure to track it
(1:39:16 PM) *stefan_schmidt:* item 6?
(1:39:18 PM) *koen:* that reminds me, what's the status on getting yocto
people to join the e.V.?
(1:39:19 PM) *RP__:* Jefro: thanks
(1:39:36 PM) *RP__:* We should ping the board to send out a call for members
(1:39:50 PM) *fray:* Ya, I need/want to join the e.V.
(1:40:20 PM) ****RP__* has sent an email to the board
(1:40:58 PM) *RP__:* 06) Status on layer splitting of metadata
(1:41:02 PM) *fray:* ok.. 06 then.. status on layer splitting of metadata
(1:41:08 PM) *RP__:* I think this is ongoing jsut fine
(1:41:23 PM) *fray:* based on the items before I'd say it continues to make
progress
(1:41:35 PM) *RP__:* 07 - We're doing a bad job of discussing it :(
(1:41:50 PM) *fray:* RP__ yes we are.. but the F2F helped..
(1:42:08 PM) *fray:* summary as I remember it.. we want distro and machine
features..
(1:42:41 PM) *fray:* lots of individual features we don't want unless they
are encapsulated in an individual recipe... and they all need a way to be
docuemnted and ccontroled.. (did I summarize that right?)
(1:43:23 PM) *Jefro:* fray that seems to jive with the notes I took
(1:43:28 PM) *fray:* (there is no 08)
(1:43:35 PM) *fray:* 09 - infrastructure items
(1:43:58 PM) *RP__:* I think we touched on the pressing infrastructure
issues above
(1:43:59 PM) *RP__:* ?
(1:44:16 PM) *fray:* yup, nothing else?
(1:44:20 PM) ****Jefro* 's action item still not done for 09
(1:44:44 PM) *stefan_schmidt:* I think the oestats / tinderbox interests
joined already and are on the yocto 1.1 agenda
(1:44:57 PM) *stefan_schmidt:* at least I saw Jay7 and Tom noted there
(1:45:29 PM) *stefan_schmidt:* for 10: Weekend was done without much
progress
(1:45:45 PM) *stefan_schmidt:* I will make an backup of the patches and then
talk to Tom King to shut it down
(1:45:57 PM) *fray:* about what was expected?
(1:46:00 PM) *stefan_schmidt:* Nobody complained on the ml whcih I take as
an "do it" :)
(1:46:19 PM) *fray:* :)
(1:46:32 PM) *RP__:* stefan_schmidt: Sounds like the way it usually goes :/
(1:46:34 PM) *stefan_schmidt:* fray: I did not expect much. Just a sign that
the old patchwork does not contain any interested stuff anymore :)
(1:46:47 PM) *fray:* yup..
(1:46:55 PM) *stefan_schmidt:* RP__: well, we have to deal with it. Backup
and shutdown. :)
(1:47:01 PM) *fray:* then the last item was meeting time..
(1:47:45 PM) *RP__:* iirc, Koen couldn't make Mondays?
(1:47:52 PM) *RP__:* stefan_schmidt: agreed
(1:47:55 PM) *Tartarus:* I guess this is as good a time as we'll get
(1:48:04 PM) *Tartarus:* unless khem really can't do 1pm his time
(1:48:12 PM) *fray:* I'm free at this meeting time or earlier if better
(1:48:14 PM) *RP__:* I have to admit this meeting time isn't that good for
me
(1:48:15 PM) *koen:* right, no mondays
(1:48:34 PM) *Tartarus:* Earlier push this to noon out west which might be
even worse for khem and jefro
(1:48:39 PM) *RP__:* "isn't good" meaning that I'm now working 3 18 hour
days a week
(1:48:41 PM) *Tartarus:* i do irregular and at home anyhow lunches so it's
less a problem
(1:49:03 PM) *Tartarus:* RP__, but is there a better day/time for you other
than monday?
(1:49:31 PM) *RP__:* Tartarus: Well, any day with a morning meeting US time
would be better but that wasn't possible for Khem iirc
(1:49:53 PM) *RP__:* I guess there is one thing we should put on the agenda
too - election of the TSC
(1:49:57 PM) *Tartarus:* Did he fill out the meeting avail poll thing we
did?
(1:49:57 PM) *Jefro:* noon thurs works for me
(1:50:13 PM) *Tartarus:* RP__, yeah 1st one is coming up
(1:50:15 PM) *Jefro:* RP__ notes agenda item for next meeting
(1:50:17 PM) *Tartarus:* Is that khem?
(1:50:22 PM) *fray:* RP__ ya, I was going to mention that as well
(1:50:25 PM) *Tartarus:* i dug it up a month ago
(1:50:27 PM) *RP__:* Tartarus: yes, he couldn't do the 8, 9 or 10 PST slots
:(
(1:50:46 PM) *Tartarus:* 11a PST would be OK here
(1:50:55 PM) *Tartarus:* But that's lunch time for fray?
(1:51:18 PM) *fray:* don't worry about lunch for me.. I'm flexible
(1:52:27 PM) *RP__:* I guess with elections coming up we should see who ends
up here then worry about this
(1:52:32 PM) ****Jefro* has a conflict at 11am PDT (note PDT right now
UTC-7, not PST)
(1:52:48 PM) *RP__:* Did we decide what order we were doing elections in?
(1:53:03 PM) *fray:* the order that the original annoucnement was in was
decided
(1:53:13 PM) *fray:* (first meeting minutes should verify that)
(1:53:18 PM) *RP__:* and did we set a date for the first one?
(1:53:25 PM) *fray:* not that I remember
(1:53:34 PM) *Tartarus:* I think so, roughly any how
(1:53:45 PM) *RP__:* I think it was "May"
(1:53:55 PM) *Tartarus:* As well
(1:53:58 PM) *stefan_schmidt:* and the every two months or was it three?
(1:54:06 PM) *koen:* every 2
(1:54:09 PM) *fray:* every 2
(1:54:17 PM) *koen:* and iirc someone volunteered to go first
(1:54:29 PM) *koen:* but I forget who
(1:54:30 PM) *fray:* I thoguth it was May or June.. but I couldn't remember
which
(1:54:32 PM) *Tartarus:* khem, iirc
(1:54:39 PM) *Tartarus:* or it was order listed in the original email
(1:54:54 PM) *koen:* the first one to step down doesn't trigger a
(re)election
(1:55:02 PM) *koen:* unless we expand to 6 permanent seats
(1:55:16 PM) *RP__:* > Election wise, we'll elect the seats in the order
from the board
(1:55:17 PM) *RP__:* > announcement email until we have 5 elected members.
We will rely on the
(1:55:17 PM) *RP__:* > board to call the first election in May.
(1:55:54 PM) *fray:* yup.. that matches my memory
(1:57:00 PM) *fray:* ok.. so was there a concensus on meeting time, or we
keep it at the same time until there is?
(1:57:07 PM) *RP__:* 1) Khem Raj 2) Koen Kooi 3) Mark Hatle 4) Richard
Purdie 5) Stefan Schmidt 6) Tom Rini
(1:57:22 PM) *Tartarus:* fray i think we're keeping it for now
(1:57:23 PM) *RP__:* keep as it is for the moment I think although I'm fine
with an earlier slot
(1:57:29 PM) *stefan_schmidt:* fray: I think we would need khem to change
it...
(1:57:43 PM) *fray:* ok.. on the time
(1:57:46 PM) *RP__:* right, we need Khem here to have this conversation I
think
(1:57:56 PM) *fray:* for the election stuff.. should we remind the board or
will they handle it?
(1:58:05 PM) *RP__:* I will ping them
(1:58:09 PM) *fray:* ok..
(1:58:20 PM) *fray:* (BTW I'm not against expanding the size of the TSC..)
(1:58:39 PM) *fray:* the group of folks working on this stuff seem to be
working very well together..
(1:59:12 PM) *stefan_schmidt:* fray: I think it was odd for making a
decision
(1:59:20 PM) *fray:* and with that.. times up.. anything else to discuss?
(1:59:32 PM) *fray:* (stefan, ya I agree but so far it's not been an issue)
(1:59:38 PM) ****stefan_schmidt* has nothing more and is ready for bed
anyway...
(1:59:48 PM) ****Jefro* notes meeting ending on time, watching carefully for
fractures in the structure of the universe
(2:00:04 PM) ****fray* says meeting over..
(2:00:05 PM) *RP__:* Jefro: I just have them in my kitchen ;-)
(2:00:09 PM) *stefan_schmidt:* night folks
(2:00:13 PM) ****fray* goes back to looking at oe-core and OS X... ;)
(2:00:15 PM) *Jefro:* RP__ LOL I knew it
(2:00:20 PM)* stefan_schmidt left the room (quit: Quit: Leaving).*
(2:00:30 PM) ****RP__* goes back to looking for patches for the air bed
(2:00:39 PM) *fray:* heh
(2:00:52 PM) ****RP__* has seen them recently, that is the annoying thing
(2:01:11 PM) *RP__:* It I can't find them I'll have to resort to grab
adhesive
(2:01:46 PM) *Jefro:* duct tape is your friend
(2:01:52 PM)* Tartarus left the room.*
(2:14:58 PM) ****RP__* settles on superglue


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

