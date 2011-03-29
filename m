Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Q4dZJ-0005LQ-LP; Tue, 29 Mar 2011 20:23:05 +0200
Received: by fxm19 with SMTP id 19so499553fxm.6
	for <multiple recipients>; Tue, 29 Mar 2011 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=2nW5rZsJSevIabbDRHW/DJJ2NUKug33imEpce7vmFxQ=;
	b=G9D+GaWQlTKAX8cIkOSKfsWncnWV1f+/1HeogTWQFJsIuLPdV560S/6IhmG1+sL3ma
	SHISSR2ciId5G6Vfb/bvoSXp6mnVnhEqMIMjkpqJ6b2HR5RgnnIabXNvf5Ns7LpuKRCw
	37P9w2mohcWy+/qek5/DcUf8IZ8LT4C4VVPg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=UYNyhDY0IzKyPSIOQaTYBw4veyBhACCjrRV43NQ/ut3QcQnw8Ln1DR4Hu3r3A+Ckn9
	dFBDGD/0qVWZYh1IQVdpJxHgWyft8kNZVqmxlKhmEimNBBijVo0tMa0m4qbZrmxWJY7L
	hBOof2qOIJVwbNu4sKzK8QcOSeV2NeBWlQIRE=
MIME-Version: 1.0
Received: by 10.223.57.5 with SMTP id a5mr123834fah.90.1301422867093; Tue, 29
	Mar 2011 11:21:07 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.223.58.139 with HTTP; Tue, 29 Mar 2011 11:21:07 -0700 (PDT)
Date: Tue, 29 Mar 2011 11:21:07 -0700
X-Google-Sender-Auth: tot2w_ELTcAG5TW570Zf9HT8Tkk
Message-ID: <AANLkTi=uaOkP9ac8sXxkpUE8jUd0fyFtuXUZX63wxb4o@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE-TSC minutes, 25 March 2011
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
X-List-Received-Date: Tue, 29 Mar 2011 18:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OpenEmbedded Technical Steering Committee, 24 March 2011

Attendees: Tom, Khem, Koen, Stefan, Richard
Apologies: Mark
Secretary: Jefro

 01) Agree on meeting chair (Khem had previously volunteered)
___________________________________
 02) Status report on oe-core

process going well, developers migrating
Khem suggests need to accelerate meta-oe to bring more users over
Koen still pushing items from meta-oe to oe-core
Koen: now 3 oe-core distros: poky, angstrom, and shr
Khem suggests creating separate repos for different distros
biggest barrier to entry is lack of documentation
RP & Khem discussed documentation thoughts, more needed

action items:
  general: encourage more distros to participate in oe-core
  general: invite more people to meta-oe on the oe-devel mailing list
  interested parties: discuss documentation

previous action items:
Koen to send email gathering input for checklist (sent before meeting ended)
//done
Jefro volunteers to wikify checklist if someone sends
// not done yet - no response on mailing list
discussion for branding & recipe split to mailing list, Richard responded to
Koen
// proceeding as shown above
___________________________________
 03) Status report on pull model, contrib repo and guidelines

Mark's draft commit/patch guidelines well received, not yet finalized
still need to wikify

action item:
  khem will try to write up how to use contrib repos

previous action items:
Mark hopes to post commit/patch policy guidelines tomorrow, has feedback to
incorporate
// not yet done, but soon - action item continued
Koen would like to copy oe-core guidelines as much as possible for meta-oe
layer
// pending on above
___________________________________
 04) Status report on board support layer guidelines

previous action items:
Richard has action to write proposal for YP steering group, won't have
answer until their meeting
// YP steering group meeting next week - action item continued
___________________________________
 05) Status report on version retention policy and interaction with
 oe-core / meta-oe / $distro layers

previous action items:
Tom will wiki it
// not yet - action item continued
___________________________________
 06) Status on layer splitting of metadata

meta-efl created a discussion
better layer tooling needed

action items:
  general: keep discussions going
  RP: will take notes of experiences and needs

previous action items:
Koen volunteers to be pullmaster
Koen will move data in repo down a level into meta-oe now
//done
___________________________________
 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other
    "flags" discussion
  [ Proposed: Tom Rini ]

Some discussion on ml

action item:
  all: discuss on mailing list

previous action items:
Tom to move to ml
//done
___________________________________
 08) Continue discussion on posting of policies and guidelines

previous action items:
AI: Khem to highlight the oe-core ml on oe-dev, tell people about discussion
//done, no response yet

___________________________________
 09) Continue discussions on infrastructure items

Bugzilla is dead, meaning it has been taken offline
Khem added message directing people to use the mailing list for bugs
Tom K will work on making database RO

action item:
  Jefro: write a blurb describing the change for a TSC member to post

_______________________________________________________________
TRANSCRIPT:


(1:07:12 PM) khem: so item 1. Where do we stand with oe-core
(1:07:36 PM) koen: agenda: http://pastebin.com/51VBKfMk
(1:07:41 PM) RP__: Good question. How are people finding things at the
moment?
(1:07:51 PM) Jefro1: koen - thanks
(1:08:01 PM) khem: http://pastebin.com/zWCWCPHg is agenda
(1:08:07 PM) khem: oh thank koen
(1:08:09 PM) stefan_schmidt: RP__: I think the progress is good
(1:08:21 PM) stefan_schmidt: faster reaction on patches and more people
contributing
(1:08:24 PM) koen: gettting more OE hackers on board (e.g. Martin)
(1:08:37 PM) RP__: From where I am things are looking reasonable
(1:09:04 PM) khem: yes I think we have to accelerate meta-oe to bring more
users over
(1:09:08 PM) RP__: Reaction time should be resolved now I have some workflow
and the yocto connection is established and rolling
(1:09:16 PM) RP__: More users does seem like the next move
(1:09:23 PM) koen: I'm still doing a lousy job at pushing things from
meta-oe to oe-core, but the diff is getting less
(1:09:27 PM) stefan_schmidt: khem: agreed, thats what is missing
(1:09:50 PM) RP__: I am trying to give patches some time on the mailing list
for comments before merging them where I think its appropriate
(1:10:06 PM) khem: yes thats right thing to do
(1:10:06 PM) ***stefan_schmidt thinks many people are in waiting position
before doing real work on oe-core
(1:10:12 PM) RP__: koen: I can't talk given the bitbake situation, but
likewise, its getting better I think
(1:10:25 PM) RP__: fray sorted a key pseudo related piece recently
(1:10:36 PM) koen: there's meta-shr now
(1:10:47 PM) koen: so there are 3 distros for oe-core now: poky, angstrom
and shr
(1:10:55 PM) khem: koen: meta-oe is a good testing pad before pushing oe
changes into oe-core
(1:11:00 PM) RP__: I helped fix a blocking issue on meta-shr so it should be
working better now
(1:11:03 PM) koen: http://git.shr-project.org/git/?p=meta-shr.git;a=summary
(1:11:18 PM) khem: I am working on getting uclibc-git/0.9.32/nptl into
meta-oe
(1:11:37 PM) koen: as said above, we just need more people to work on
oe-core and meta-oe
(1:11:46 PM) stefan_schmidt: ok, so we all see progress
(1:11:49 PM) khem: I wanted to encourage other distros on oe to use oe-core
(1:11:57 PM) stefan_schmidt: any concrete steps for more users
(1:11:58 PM) khem: e.g. slugos kaeilos
(1:12:23 PM) RP__: khem: remember that slugos focuses more on stability
(1:12:26 PM) koen: khem: kaeios is easy, just cp meta-angstrom meta-kaailos
and s/angstrom/kaeilos/g
(1:12:47 PM) khem: RP__: yes oe-core is just fit for slugos
(1:13:07 PM) khem: koen: Should we create separate repos for different
distros ?
(1:13:12 PM) RP__: khem: so they might prefer to move around a release
stabilisation point rather than now when we're in a bit more of a
development mindset
(1:13:13 PM) Tartarus: khem: yes
(1:13:19 PM) khem: well its maintainers call where they want to host it
though
(1:13:19 PM) Tartarus: distros are meta-distroname
(1:13:32 PM) khem: RP__: ok
(1:13:33 PM) Tartarus: Unless we want to encourage distros within meta-oe,
which i don't know if we do
(1:13:36 PM) Tartarus: did we talk about that?
(1:13:41 PM) koen: yes, we don't want that
(1:13:47 PM) khem: I think distros are clearly a separate layer
(1:13:57 PM) RP__: I don't mind if a distro wants to create a layer there
with some policy
(1:14:09 PM) RP__: equally I don't mind the separation
(1:14:16 PM) khem: hmm like kaelos is mostly angstrom
(1:14:36 PM) RP__: What I care about is clear ownership and namespace
(1:14:48 PM) khem: I think micro has some uniqueness but not sure about
minimal
(1:15:06 PM) koen: khem: he angstrom devs have a betting pool how soon Marco
rips off changes from angstrom after each commit we do
(1:15:09 PM) Tartarus: Lets set micro/minimal aside for now :)
(1:15:13 PM) stefan_schmidt: ok, so we try to encourage other distros
(1:15:27 PM) khem: yes
(1:15:47 PM) stefan_schmidt: anything else for 1?
(1:15:48 PM) Jefro1: is there an action item for any particular person on
this?
(1:15:54 PM) koen: personally, I would say that if a distro needs
encouraging at this point it doesn't bode well forthe future
(1:16:31 PM) Tartarus: Well, i dunno koen
(1:16:33 PM) khem: OE has a quilt patch where it create symlinks to patches
instead of copying them
(1:16:34 PM) Tartarus: Here's a maybe AI
(1:16:50 PM) khem: I was thinking of bringing that in if its useful
(1:16:55 PM) Tartarus: How much longer until we want to do an open call or
whatever of "Hey, come get over in oe-ore/meta-$whatever and kick the tires
folks!"
(1:17:05 PM) Tartarus: We still don't have docs for getting started, do we?
(1:17:07 PM) RP__: khem: I thought we did that in oecore already? :/
(1:17:16 PM) khem: RP no
(1:17:25 PM) khem: and oe-core patches dont rewind properly
(1:17:29 PM) khem: if a patch failes
(1:17:35 PM) khem: in some cases
(1:17:36 PM) RP__: Tartarus: Perhaps the gating factor at the moment is the
docs?
(1:17:39 PM) Tartarus: I think we've probably got folks sitting on the side
waiting for a "we think the core is usable enough now to start poking for
everyone"
(1:18:05 PM) Tartarus: RP__: docs and an open invitation that folks should
expect something to work out of the box, that's in the docs, yes
(1:18:13 PM) khem: I think biggest problem for users I am envisioning is
where to start
(1:18:20 PM) Tartarus: khem, yeah
(1:18:24 PM) Tartarus: It used to just be bitbake nano
(1:18:32 PM) Tartarus: but that howto needs an update or two, for
oe-core/etc
(1:18:38 PM) Jefro1: I suggest action item: document how to get started with
oe-core on the wiki, and announce to the list
(1:18:43 PM) khem: so different distros should take and AR to spread the
word
(1:19:21 PM) RP__: I think that is a good start
(1:19:34 PM) RP__: Lets try and feed this a little gradually rather than
have a thundering herd :)
(1:19:44 PM) khem: ok
(1:20:04 PM) koen: Let's start with inviting people to meta-oe
(1:20:11 PM) koen: they can kick that tire :)
(1:20:31 PM) khem: should we add a new ml for meta-oe
(1:20:46 PM) khem: or use existing oe-devel with properl subject prefix
(1:21:02 PM) RP__: I suspect oe-devel is the right list for this
(1:21:09 PM) stefan_schmidt: I agree
(1:21:11 PM) khem: ok
(1:21:12 PM) Tartarus: Yeah, we talked before
(1:21:14 PM) Tartarus: no sep list
(1:21:23 PM) stefan_schmidt: If it gets to much we can still start new list
(1:21:26 PM) khem: lets use [meta-oe] prefix to make it clear
(1:21:36 PM) khem: although patchwork would not like it
(1:21:48 PM) koen: the readme says oe-core: Chttp://
cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/README :)
(1:21:49 PM) RP__: I think if people start posting patches there and pulling
them it will get attention in its own right too
(1:21:54 PM) koen: (that can be changed of course)
(1:22:10 PM) RP__: Lets fix the README then :)
(1:22:24 PM) khem: ok so koen sent email for getting checklist
(1:22:34 PM) khem: what do we have  on that subject
(1:22:58 PM) ***khem is still on item 2 sub bullets
(1:24:17 PM) khem: Jefro1: did you get checklist compiled
(1:24:34 PM) RP__: Mark knows he has things to do and in his email said he'd
get to them soon and appologised
(1:24:42 PM) khem: ok
(1:24:49 PM) Jefro1: khem - not yet
(1:25:00 PM) khem: ok we keep it open. Next is branding
(1:25:24 PM) khem: is there a preferece ?
(1:25:28 PM) koen: I still haven't made the time to rename some poky bits
(1:25:45 PM) khem: ok so we will look upto you koen
(1:26:07 PM) khem: anything on recipe split ?
(1:26:13 PM) koen: I don't use any of the poky scripts TBH
(1:26:21 PM) khem: right
(1:26:31 PM) RP__: So does poky take them separately?
(1:26:50 PM) stefan_schmidt: so branding is not such a high prio and we are
just waiting for patches wrt this?
(1:26:58 PM) koen: I still think sato goes into meta-oe, since we have it in
OE as well, but I'm open to suggestions
(1:26:59 PM) RP__: One topic I've been thinking about is documentation too.
I really want to split off the yocto docs into a separate repo
(1:27:41 PM) khem: hmm so documentation will be available on yocto only
(1:27:54 PM) RP__: khem: well, depends what we do and how
(1:27:54 PM) khem: since yocto will have different policies ?
(1:28:07 PM) RP__: khem: The trouble is there are large chunks which are not
oecore
(1:28:21 PM) khem: RP__: I see yes
(1:28:38 PM) khem: so may be divide that and remove the non oecore
(1:29:02 PM) khem: and create a separate yocto-docs repo upto you
(1:29:15 PM) khem: should we assign an AR to RP__
(1:29:43 PM) RP__: The other trouble is the current git merge issues are a
nightmare for our tech writer
(1:30:00 PM) khem: I see
(1:30:23 PM) khem: but one feature of oecore should be "its well documented"
(1:31:03 PM) khem: I would say dividing it into two would be one way
(1:31:27 PM) RP__: khem: There are two competing goals - document OECore and
document Poky (the combined set of things)
(1:31:45 PM) khem: I understand
(1:31:51 PM) RP__: If you restrict one manual to only talk about OECore, it
makes writing flowing documentation hard
(1:32:32 PM) RP__: I don't have a good answer here yet, I suspect its not as
simple as splitting into two
(1:32:32 PM) khem: you can have two volumes one describing OE core another
describing yocto/poky may be
(1:32:43 PM) khem: I guess yes
(1:33:13 PM) RP__: khem: Its thing like when you want to talk about distro
config example files
(1:33:19 PM) khem: but if oe-core is described as oe-core is in a separate
repo should be ok as well I would think
(1:33:57 PM) RP__: khem: I did think this would be much easier than it is
before I tried to split it up :/
(1:34:02 PM) Jefro1: documenting separate projects that intertwine is a
known issue for a technical writer - but yocto only has one, resources
highly limited
(1:34:35 PM) Jefro1: RP__ I'd be happy to discuss docs offline
(1:34:59 PM) khem: so I guess we need to separate out
(1:35:03 PM) RP__: Lets not rathole on this now but yes, more discussion
needed
(1:35:04 PM) khem: ok
(1:35:06 PM) ***stefan_schmidt points out that we only have 26 min left for
5 items
(1:35:24 PM) khem: we are onto 3
(1:35:41 PM) khem: did Mark post the commit policy
(1:35:53 PM) RP__: I think we've seen a version?
(1:36:01 PM) RP__: Not sure it was the final one?
(1:36:04 PM) stefan_schmidt: it was well received
(1:36:05 PM) Jefro1: there is a draft floating around, I don't think he has
put it on the wiki
(1:36:15 PM) khem: ok lets keep that open
(1:37:07 PM) stefan_schmidt: For the pull model: I think it works well for
oe-core and 2011.03 so far
(1:37:13 PM) khem: do we have more on guidelines for pull model and repo
(1:37:40 PM) Tartarus: I think we still need to wikify whatever we're doing
(1:37:43 PM) RP__: khem: I think this is what fray has been working on?
(1:37:45 PM) stefan_schmidt: not sure about contrib repos as koen and /me
are using external git servers for our branches
(1:37:59 PM) RP__: We do have a contrib repo there...
(1:38:02 PM) Tartarus: stefan_schmidt: They're up and working, and optional
(1:38:09 PM) RP__: For 4), the YP steering meeting is scheduled for early
next week and I will have a proposal for them
(1:38:13 PM) Tartarus: khem and I (and martin and chris larson and others)
have been using it
(1:38:29 PM) khem: RP__: was that for item 04 ?
(1:38:41 PM) stefan_schmidt: cool, I'm fine with the contrib repos. Was just
wondering who is using them
(1:38:42 PM) RP__: khem: yes
(1:38:55 PM) RP__: stefan_schmidt: I post patches there too
(1:38:56 PM) khem: Tartarus: we need to document how-to use contrib repo
somewhere
(1:38:57 PM) Tartarus: Might be nice to make it easier for
create-pull-request to reference an external repo, but that's minor I think
(1:39:01 PM) Tartarus: khem, yes
(1:39:10 PM) RP__: Tartarus: send patches ;-)
(1:39:17 PM) Tartarus: RP__:  on my list, heh
(1:39:23 PM) RP__: Tartarus: I've talked to others and we want to make it
configurable
(1:39:37 PM) khem: yes may be a env var or somesuch
(1:39:44 PM) Tartarus: Anyhow
(1:39:59 PM) khem: I will try to do a writeup on using contrib repos
(1:40:00 PM) RP__: Tartarus: user defaults, then repo defaults, then script
fall back
(1:40:15 PM) Tartarus: khem: k
(1:40:27 PM) koen: are we ready for 05)?
(1:40:28 PM) khem: ok moving on 04 is covered unless someone has more inputs
atm
(1:40:44 PM) khem: moving to 05 then
(1:40:55 PM) khem: version retention policy
(1:41:15 PM) koen: I think we all agreed and want it in the wiki
(1:41:38 PM) khem: ok is someone owning to document it there
(1:41:52 PM) khem: ah tom
(1:41:53 PM) stefan_schmidt: Tartarus is iirc
(1:41:58 PM) Tartarus: I own it, yes
(1:42:02 PM) stefan_schmidt: ah, its even in the agenda :)
(1:42:07 PM) Tartarus: So AI to me, put it on the wiki
(1:42:14 PM) Tartarus: suggested page name?
(1:42:20 PM) Tartarus: Just Version_Retention_Policy ?
(1:42:27 PM) khem: Version Retetion Policy
(1:42:28 PM) stefan_schmidt: sounds good
(1:42:36 PM) khem: with spellcheck
(1:42:36 PM) Tartarus: k
(1:42:52 PM) khem: moving on to 06
(1:43:07 PM) khem: layer splitting
(1:43:17 PM) koen: the meta-efl thing kicked off a discussion
(1:43:25 PM) khem: yes
(1:43:33 PM) RP__: it did :)
(1:43:37 PM) koen: I think we can continue discussion in that thread
(1:43:41 PM) khem: ok
(1:43:50 PM) khem: and report next week of outcome
(1:43:51 PM) RP__: Was there any fundamental disagreement in that thread
though?
(1:44:02 PM) khem: I think no
(1:44:04 PM) koen: RP__: not AFAIK
(1:44:05 PM) stefan_schmidt: I don't think so
(1:44:26 PM) stefan_schmidt: but it raises the prio for better layer tooling
to keep all the blocks together
(1:44:34 PM) RP__: right, just checking I wasn't missing something :)
(1:44:43 PM) RP__: agreed, we need better layer toolcing
(1:44:54 PM) Tartarus: We need to note up what we need in tools
(1:45:04 PM) Tartarus: Best practices and all of that too
(1:45:09 PM) ***RP__ notes Yocto 1.1 planning is open and layer tooling is
on the list
(1:45:24 PM) RP__: but yes, we need to note requirements like this and come
up with some kind of plan
(1:45:24 PM) khem: may be a bill of recipes from everylayer
(1:45:28 PM) stefan_schmidt: RP__: Seen it. Is it your task or someone else?
(1:45:57 PM) RP__: stefan_schmidt: I own it from an architecture point of
view but I'm very open to ideas, discussion and help
(1:46:09 PM) stefan_schmidt: RP__: ok
(1:46:21 PM) khem: RP__: OK so I guess we can keep discussions going and
gather experiences with layers
(1:46:24 PM) RP__: I don't think it will be a solved overnight problem but
we need a plan
(1:46:28 PM) khem: I guess its premature as of now
(1:46:41 PM) RP__: I'm happy to take notes of experiences and needs
(1:46:42 PM) stefan_schmidt: sure, we need to learn what we need while going
(1:47:03 PM) khem: so moving to 07
(1:47:22 PM) khem: Tartarus: on features
(1:47:26 PM) stefan_schmidt: oh, the always loved topic :)
(1:47:30 PM) Tartarus: OK
(1:47:36 PM) Tartarus: Started discussion on ML, later than I wanted
(1:47:41 PM) khem: ok
(1:47:43 PM) Tartarus: waiting for real discussion and I assume folks are
busy
(1:47:55 PM) khem: any feedbacks you would like to discuss
(1:48:20 PM) Tartarus: Looking for more details from RP__ and fray who I
think have both thought about this before
(1:48:40 PM) khem: I think posix is a good diving point
(1:48:43 PM) RP__: Tartarus: Ah, yes. Sorry, I've not had time to start
writing down things on that subject
(1:48:44 PM) khem: from libc pov
(1:49:00 PM) Tartarus: khem, so you're thinking on the libc config point
(1:49:04 PM) khem: yes
(1:49:05 PM) Tartarus: Yeah, also needs discussion
(1:49:16 PM) Tartarus: but to me, that's a sub-point of the big problem of
controlling what we do and don't build
(1:49:28 PM) RP__: to me too
(1:49:32 PM) koen: I've been thinking about how to use a checksum for it all
(1:49:43 PM) Tartarus: OK, so I'm waiting for everyone to chime in on the ML
(1:49:46 PM) Tartarus: please do :)
(1:49:55 PM) RP__: The checksums already capture any configuration
information
(1:50:09 PM) koen: for me a build/checksum/tmp would be a good start
(1:50:10 PM) khem: chris was doing a patch for bb
(1:50:18 PM) khem: to use checksumming for recipes
(1:50:19 PM) koen: change somethign and it's a rebuild in a different dir
(1:50:36 PM) RP__: koen: which somethings though? :)
(1:51:19 PM) khem: I think we should keep it churning on ml for a while
(1:51:19 PM) RP__: Anyhow, I think we need to take this up on the mailing
list
(1:51:47 PM) khem: for my AI I did send emails to all mls informing about
oe-core
(1:52:38 PM) RP__: khem: much response?
(1:52:48 PM) khem: RP__: no response
(1:52:55 PM) RP__: khem: :/
(1:53:03 PM) khem: RP__: I send it to oe-users list
(1:53:04 PM) khem: too
(1:53:13 PM) RP__: Has anyone looked much at oe-lite btw?
(1:53:19 PM) koen: no
(1:53:21 PM) Jefro1: it is hard to get people excited about policies &
guidelines
(1:53:21 PM) khem: I guess it did its part of informing
(1:53:33 PM) khem: I have not looked at oe-lite
(1:53:52 PM) RP__: Esben keeps mentioning it and wanting to merge into OE
(1:54:11 PM) koen: RP__: the unpaid yocto employee remark cracked me up
(1:54:15 PM) khem: I guess we should encourange him to port it over to some
extent
(1:54:23 PM) khem: so we can see benefits
(1:54:28 PM) RP__: The trouble is he radically "simplified" things by
removing things like package management :/
(1:54:41 PM) khem: yeah
(1:54:45 PM) koen: RP__: recipe based sysroots create a huge potential for
rootfs breakage
(1:54:58 PM) RP__: koen: yes, advantages and disadvantages
(1:54:59 PM) koen: RP__: e.g. libnl1 and libnl2
(1:55:29 PM) khem: I think if we cache complete autoconf vars that will be
helpful in deterministic builds
(1:55:35 PM) RP__: koen: If we ever do recipe bases sysroots, they need to
be optional
(1:55:58 PM) koen: RP__: if we do them, the distro becomes even more
important :)
(1:56:16 PM) RP__: khem: there are several ways to approach that problem.
The correct approach is to use various approaches I think :)
(1:56:33 PM) RP__: (swabber, recipe specific sysroot, autoconf cache etc)
(1:56:39 PM) Tartarus: So, what item is this on the agenda?
(1:56:52 PM) RP__: Tartarus: We're derailing slightly :/
(1:56:53 PM) koen: RP__: is running tasks under qemu on the 1.1 list?
(1:56:54 PM) khem: I will read that thread
(1:56:55 PM) RP__: my fault, sorry
(1:56:58 PM) Tartarus: :)
(1:57:01 PM) Tartarus: So, next AI?
(1:57:10 PM) khem: Infra
(1:57:16 PM) RP__: koen: not really, we've been trying to escape that
(1:57:23 PM) koen: 8) Continue discussions on infrastructure items
(1:57:30 PM) koen: RP__: ok
(1:57:37 PM) koen: bugzilla is dead
(1:57:41 PM) khem: on infra I added a message to bugzilla to direct people
to use ml
(1:57:56 PM) RP__: koen: no reason it couldn't be on there if someone wanted
it for a good reason but its not there atm
(1:57:57 PM) khem: and Tom K will work on making database ro
(1:58:02 PM) koen: Jefro1 will write some blurb, but we need to send it
(1:58:12 PM) Jefro1: yep
(1:58:27 PM) RP__: We're going to get hate mail about the bugzilla, people
know that, right?
(1:58:31 PM) koen: RP__: introspection (we'll dicuss on the ml further)
(1:58:38 PM) khem: should we have oe-core bugs reported in yocto bugz
(1:58:52 PM) ***RP__ mutters darkly about introspection
(1:59:02 PM) koen: RP__: the question is, will we get hatemail from people
that actually matter to the project?
(1:59:25 PM) Tartarus: I asked for and got 72h after saying we need
volunteers
(1:59:31 PM) khem: I think I was maintaining bugz for past years and have no
more appetite
(1:59:31 PM) Jefro1: RP__ re hate mail - why do you think I opted out of
posting the notice? ;)
(1:59:32 PM) Tartarus: and got none
(1:59:32 PM) Tartarus: So
(1:59:58 PM) RP__: I do think its fair to do this, I just want to ensure
people realise the implications
(2:00:06 PM) khem: we have one min left
(2:00:11 PM) RP__: Someone needs to make a decision and that is us
(2:00:18 PM) RP__: and I think its the right decision
(2:00:27 PM) khem: We are not deleting it anyway
(2:00:31 PM) RP__: Re: OECore bugs in the yocto bugzilla, I'm ok with that
(2:00:42 PM) RP__: as long as its clear they are OECore bugs, not meta-oe
(2:00:57 PM) khem: that will be hard
(2:01:07 PM) khem: I think you cant stop folks
(2:01:25 PM) khem: and some wont be able to make judgement
(2:01:33 PM) khem: so you need to triage them hard
(2:01:34 PM) RP__: khem: Well, bugs not in OECore/poky will just get closed
as invalid
(2:01:53 PM) RP__: I'm happy to do that, I just want to make it clear what
the expectation is
(2:02:18 PM) Jefro1: RP__ out of curiosity, how many bugs in the db are not
in oe-core or poky?
(2:02:20 PM) khem: may be it needs more discussion
(2:02:38 PM) RP__: Jefro1: none atm as it was the poky bugzilla originally
(2:03:15 PM) Jefro1: thus no loss of information?
(2:03:26 PM) RP__: Jefro1: no
(2:03:27 PM) khem: ok should we carry it over to ml and ask devs about
opinion
(2:03:33 PM) khem: ie. oe-core ml
(2:03:35 PM) RP__: khem: on what exactly?
(2:03:51 PM) RP__: khem: I'm trying to work out which question we're
wondering about
(2:04:05 PM) khem: oecore category in yocto bugz
(2:04:14 PM) khem: I think its upto yocto too
(2:04:50 PM) RP__: Well, Yocto and OECore are going to remain pretty much in
sync so should see the same bugs
(2:04:51 PM) khem: but should not yocto oe-core folks have a say that what I
was thinking
(2:05:11 PM) stefan_schmidt: I have to leave. We have all points of the
agenda covered?
(2:05:19 PM) khem: ok
(2:05:21 PM) RP__: stefan_schmidt: yes, thanls!
(2:05:23 PM) khem: I think we are done
(2:05:34 PM) Jefro1: I'll send out minutes hopefully this afternoon
(2:05:36 PM) khem: the meeting is officially adjourned

-- 
Jeff Osier-Mixon
Yocto Project Community Manager @Intel




-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

