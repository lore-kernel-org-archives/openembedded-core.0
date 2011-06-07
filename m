Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QTkU0-00034z-V8; Tue, 07 Jun 2011 02:49:25 +0200
Received: by iye7 with SMTP id 7so4006200iye.6
	for <multiple recipients>; Mon, 06 Jun 2011 17:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=jpUJVXlv7O8DsYU/lHwzTj391FSzCsgdOK+XjhHrzuI=;
	b=TQECs35iDpz3Y1o/OII2KpzXvIRdZdJ3rFl0pMg8Pq4j7eDRdSOWL2udZoxVV7V+e7
	Kw+6pxdgDVRKAp0rHcxnjtGpVF9sEOHrBITxDkK+ITp2Yb4hufRYQm1PRhTpHCZX97Nj
	OpNjHQt5BF3m6m6ps7grYrwEKojovRHj3EvVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=dLTOI+h1V7whHZH5hQN8DGROzLTfeRlEZqeB0g/ftnIbFU3+COojKVGehuO18QGVnr
	BOWN7vQz2/6nRQ9cQmybMB3Z2KJxbJd7nQ4CHzutL/LWzIp1CcHHRJOMuX2Ie89/qetR
	OINLnTFY+ytEV3y944CR9zcu1rg9E1G/mxld4=
MIME-Version: 1.0
Received: by 10.42.135.65 with SMTP id o1mr9721742ict.207.1307407566812; Mon,
	06 Jun 2011 17:46:06 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.239.136 with HTTP; Mon, 6 Jun 2011 17:46:06 -0700 (PDT)
Date: Mon, 6 Jun 2011 17:46:06 -0700
X-Google-Sender-Auth: Qclu9OGbuoEmrim66w9CSRwUzrE
Message-ID: <BANLkTinuNfOjuyAviFsbyqNwoCjQCYaGQA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 12-May-2011
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
X-List-Received-Date: Tue, 07 Jun 2011 00:49:26 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e856698b46d04a5148b45

--90e6ba6e856698b46d04a5148b45
Content-Type: text/plain; charset=ISO-8859-1

OE-TSC Minutes 12-May-2011

Attending: Richard, Koen, Khem, Tom, Mark, Stefan
Notes: Jefro


Agenda & Minutes

 01) Agree on meeting chair
stefan
___________________________________
 02) Status report on oe-core
RP__ has pushed the distroless changes
RP__ can make a post to oe-devel on behalf of the TSC? [general agreement]
RP__: Can we assume we trust me to write a suitable announcement? :) [yes]
--> AR: (RP) write oe-core announcement for the masses
___________________________________
 03) Status report on pull model, contrib repo and guidelines
main discussion already on ML
___________________________________
 04) Status report on board support layer guidelines
coming from fray soon
___________________________________
 05) Status on layer splitting of metadata
merge with 02)
___________________________________
 06) Continue discussions on infrastructure items
RP talked to the Linux Foundation today and I think we might be obtaining
some hardware in "weeks". Mike and Tom King are dealing with that
___________________________________
 07) Elections
waiting on board
___________________________________
08) RP is proposing that whilst the TSC has done good work on this and been
productive, we need to refocus and maybe spin off an interest group for
the OECore specific pieces and the original TSC focus needs to be
regained.

this TSC has operated very very differently to previous TSCs
continue as is or change
-->Koen to read up before next week
___________________________________
09) RP is also proposing that with the "distroless" configuration in place,
we're about ready to invite wider attention on OECore.
see #2 above
____________________________________
10) How should we (OE) handle non-Linux host support?  Policies, priorities,
etc.
fray: I bring this up because of the MacOS X work I did.. and now a few
other people have started in on
RP: needs to be clean, not a maintenance headache


Raw Transcript

(21:00:19) ***RP__ is here
(21:00:29) Tartarus: That's a quorum then, yeah
(21:00:43) RP__: Yes, four of us
(21:01:09) stefan_schmidt: I can chair if people like
(21:01:25) Tartarus: works for me
(21:01:26) Tartarus: thanks
(21:01:27) RP__: stefan_schmidt: no objection
(21:01:49) RP__: Jefro did send out an agenda
(21:01:51) stefan_schmidt: ok, will bring up the agenda
(21:02:02) stefan_schmidt: yeah, will but it on pastebin just as reference
(21:02:08) stefan_schmidt: with fray item added
(21:03:03) stefan_schmidt: http://pastebin.com/jTL7wr3G
(21:03:18) stefan_schmidt: We start without jefro and someone just sends him
the log?
(21:03:25) RP__: stefan_schmidt: I think so
(21:03:26) stefan_schmidt: btw, is someone logging? RP__ ?
(21:03:27) fray: seems reasonable
(21:03:32) ***RP__ has logs
(21:03:46) RP__: stefan_schmidt: I posted some additions to the agenda too?
(21:03:56) stefan_schmidt: RP__: right
(21:04:05) stefan_schmidt: i will get an updated version up
(1:06:33 PM) stefan_schmidt: http://pastebin.com/hZBRq0mS
(1:06:38 PM) stefan_schmidt: There we go
(1:06:45 PM) stefan_schmidt: Agenda with the added items
(1:06:55 PM) Jefro: stefan_schmidt awesome, thanks
(1:06:59 PM) RP__: stefan_schmidt: thanks :)
(1:07:06 PM) RP__: Jefro: stefan_schmidt is chair today
(1:07:12 PM) fray: :)
(1:07:17 PM) stefan_schmidt: Jefro: we agreed on me being the meeting chair
so far
(1:07:27 PM) Jefro: I gathered that. Stefan: congratulations
(1:07:36 PM) RP__: koen and khem send apologies
(1:08:11 PM) stefan_schmidt: so we are ready for take-off
(1:08:15 PM) RP__: stefan_schmidt: yes
(1:08:26 PM) ***stefan_schmidt stops his OE build to have better xchat
performance :)
(1:08:54 PM) stefan_schmidt: 02) OE core status update
(1:09:18 PM) ***RP__ has pushed the distroless changes
(1:09:29 PM) stefan_schmidt: RP__: I think you and koen had some discussions
about the gconf stuff
(1:09:44 PM) stefan_schmidt: raising points what should be in core and what
in other layers
(1:09:54 PM) RP__: stefan_schmidt: We did as what koen asked for conflicted
with what we'd agreed in previous tsc meetings
(1:10:04 PM) RP__: I think koen needs to be present for that discussion
though
(1:10:07 PM) stefan_schmidt: RP__: thanks for the distro less stuff. Great
in time for the meeting and, hopefully, the announcement
(1:10:19 PM) RP__: and neither of us see it as a blocking issue on OECore,
just needs discussion
(1:10:27 PM) stefan_schmidt: RP__: yeah, would make more sense
(1:11:02 PM) stefan_schmidt: RP__: I actually like to see such things coming
up from time to time to re-evaluate where to put things :)
(1:11:13 PM) fray: Assuming everyone is comfortable with the existing
changes, are we ready to formally announce it?  (I know we have more and
more people using it every week -- which is really good)
(1:11:42 PM) stefan_schmidt: fray: I think so. We waited for distro less
last week and RP__ got it ready in time
(1:11:45 PM) Tartarus: I think we must, yes
(1:11:52 PM) RP__: fray: I was getting to this and yes, I think we're about
there for that
(1:12:08 PM) RP__: So the question really is who takes the action?
(1:12:24 PM) stefan_schmidt: nothing more to 02? Then we merge in 09 here
(1:12:24 PM) ***RP__ can make a post to oe-devel on behalf of the TSC?
(1:12:33 PM) stefan_schmidt: sounds good
(1:12:45 PM) stefan_schmidt: I think it does reflect the TSC
(1:12:58 PM) RP__: Its what we minuted last week as our plan
(1:13:04 PM) stefan_schmidt: And we where set up to bring oe-core forward so
it would be good to announce it as TSC
(1:13:17 PM) RP__: Since then we've ensured bitbake is more in sync and
removed the final poky references
(1:13:31 PM) RP__: which were the things we wanted to do before announcing
(1:13:45 PM) stefan_schmidt: we are fine I would say
(1:13:54 PM) RP__: Can we assume we trust me to write a suitable
announcement? :)
(1:14:10 PM) stefan_schmidt: I do :)
(1:14:39 PM) Tartarus: Yes, we do
(1:14:56 PM) RP__: stefan_schmidt: I'd take silence as acceptance ;-)
(1:15:06 PM) ***Jefro would hope so at this point
(1:15:12 PM) fray: no problem here..
(1:15:24 PM) stefan_schmidt: ok, all for it. RP__ please do it
(1:15:38 PM) stefan_schmidt: 09 done as well?
(1:15:39 PM) ***RP__ will aim to send something out tomorrow
(1:15:42 PM) RP__: stefan_schmidt: yes
(1:15:59 PM) stefan_schmidt: AR: (RP) write oe-core announcement for the
masses
(1:16:07 PM) RP__: For 03), there has been some discussion about pull
scripts and workflow
(1:16:21 PM) RP__: I'd suggest those discussions continue for all on the
mailing list
(1:16:32 PM) stefan_schmidt: agreed
(1:16:40 PM) Tartarus: agreed
(1:16:44 PM) fray: the discussion has been growing, and I think is headed in
the right direction -- agreed
(1:16:49 PM) stefan_schmidt: khem did finish his AR regarding the commit
scripts
(1:17:03 PM) fray: the 5th version of the commit/patch message guidelines
was just posted..
(1:17:11 PM) fray: this is close to the final version -- assuming no major
comments
(1:17:11 PM) RP__: stefan_schmidt: yes, we have commit emails now so
Tartarus should be happy
(1:17:35 PM) Tartarus: yes
(1:17:52 PM) fray: just one thing to mention.. Paul Menzel has made a number
of editorial comments and improvements in the guidelines as we've gone..
(1:18:01 PM) stefan_schmidt: so fray has an eye on commit guidelines and
Tartarus, khem, Daren, etc will keep discussing the pull scripts
(1:18:18 PM) stefan_schmidt: fray: thats good
(1:19:34 PM) ***stefan_schmidt just notes that oe-core gets other distros
even before the announcement.(<pb_> in other news, though, I nearly have
some semblance of a working micro layer on top of oe-core.)
(1:19:57 PM) RP__: great :)
(1:20:01 PM) stefan_schmidt: 03 needs no more discussion here?
(1:20:10 PM) stefan_schmidt: Seems the current main topics are on the ml
(1:20:16 PM) RP__: stefan_schmidt: agreed
(1:20:27 PM) stefan_schmidt: 4) Status report on board support layer
guidelines
(1:21:02 PM) stefan_schmidt: has this moved?
(1:21:22 PM) ***RP__ doesn't know
(1:21:57 PM) stefan_schmidt: anyone has updates on this?
(1:21:59 PM) Jefro: I have an action item there to send fray a rough
document
(1:22:01 PM) Khem__ [d0dfd0f2@gateway/web/freenode/ip.208.223.208.242]
entered the room.
(1:22:08 PM) Jefro: by the end of this week - on target
(1:22:16 PM) fray: yup, so I think were slightly behind on that.. but
nothing big
(1:22:31 PM) stefan_schmidt: ok
(1:22:48 PM) stefan_schmidt: so this AR just stays and you come back next
week
(1:22:52 PM) stefan_schmidt: hi Khem__
(1:23:08 PM) fray: stefan_schmidt yup
(1:23:14 PM) stefan_schmidt: ok
(1:23:23 PM) stefan_schmidt: 05) Status on layer splitting of metadata
(1:23:45 PM) Khem__: Hi
(1:23:56 PM) Jefro: question that has bugged me for a couple of weeks on 05
- why is it different from 02?
(1:24:01 PM) Jefro: (hi Khem__)
(1:24:09 PM) Khem__: Just sneaking in on an iPad
(1:24:18 PM) fray: originally it was seperate working being done both
related to 02 and the existing oe repository..
(1:24:27 PM) stefan_schmidt: Khem__: with OE on it of course ;)
(1:24:41 PM) fray: I've take it to mean (now that "02" oe-core is down) that
it refers to moving and modifying things from the existing OE repository..
(1:24:59 PM) stefan_schmidt: Jefro: 02 was more about general oe-core
problems
(1:25:06 PM) fray: -if- everyone is in agreement thats what it means, then
we should likely re-word the topic
(1:25:12 PM) fray: (or remove it if it's no longer an issue)
(1:25:20 PM) stefan_schmidt: Its just that some of the important problems
are actually around layers :)
(1:25:27 PM) RP__: Well, I think Koen's concerns fall under this
(1:25:32 PM) RP__: (topic)
(1:25:43 PM) RP__: but we can defer that to next week or the mailing list
(1:25:50 PM) Jefro: ok, thakns. I was just wondering whether 02 and 05 can
be merged at this point, particularly after RP announces oe-core to the
list, or whether they should stay separate. Now leaning toward the latter,
but will do what you guys want.
(1:25:55 PM) RP__: I'm not aware of any other issues
(1:26:00 PM) fray: yes.. I think we need to keep an open item about layer
"issues" brought up on the mailing list or elsewhere..
(1:26:16 PM) fray: (either content of the layer, way layer is being used,
etc..)
(1:26:28 PM) fray: RP__, I'm not aware of anything else yet..
(1:27:02 PM) RP__: For 6), I talked to the Linux Foundation today and I
think we might be obtaining some hardware in "weeks". Mike and Tom King are
dealing with that
(1:27:36 PM) stefan_schmidt: Good
(1:27:43 PM) stefan_schmidt: so Tom is already involved
(1:28:03 PM) RP__: yes
(1:28:11 PM) Khem__: is this hardware for general oe use
(1:28:25 PM) RP__: Khem__: It will be for OE to decide how best to use it,
yes
(1:28:33 PM) Khem__: Ok
(1:29:05 PM) stefan_schmidt: That leaves 07, 08 and 10 open
(1:29:18 PM) stefan_schmidt: elections now or as last item?
(1:29:19 PM) ***Khem__ thinks iPad is not that iBad
(1:29:27 PM) ***Jefro suggests elections as last item
(1:29:35 PM) Jefro: Khem__ is it iRad ?
(1:29:44 PM) stefan_schmidt: Khem__: well a fancy device just for IRC ;)
(1:29:46 PM) RP__: Well, elections is easy, we're waiting on the board
(1:29:56 PM) RP__: and its kind of related to 08
(1:29:59 PM) fray: AFAIK, the board is in control over that
(1:30:04 PM) RP__: right
(1:30:17 PM) RP__: So let me talk a little about this topic
(1:30:20 PM) stefan_schmidt: voting system tests went well it seems
(1:30:26 PM) RP__: agreed, yes
(1:30:35 PM) RP__: I'm not sure how many people saw the discussion I had
after the TSC meeting last week
(1:30:47 PM) ***stefan_schmidt not
(1:30:49 PM) RP__: I raised the issue of non-voting TSC members
(1:31:01 PM) stefan_schmidt: ah, you mean on the ml
(1:31:02 PM) RP__: It was shot down with good reason but I think it was
right to ask some questions
(1:31:09 PM) RP__: yes, on the ml
(1:31:29 PM) RP__: It made me realise how this TSC has operated very very
differently to previous TSCs
(1:31:53 PM) RP__: If you look at the agenda we're very focused on a
specific topic and we're functioning more like an interest group
(1:31:53 PM) Khem__: Yes
(1:32:11 PM) stefan_schmidt: hmm
(1:32:12 PM) fray: I'd certainly agree with that
(1:32:14 PM) RP__: The original idea of the TSC was a decision breaker, not
a discussion forum as we've been doing
(1:32:21 PM) Khem__: That was the mandate to start with
(1:32:22 PM) stefan_schmidt: you mean like an oe-core IG
(1:32:26 PM) RP__: yes
(1:32:42 PM) RP__: So my question is whether its time to rethink what we're
doing and where and how we're doing it
(1:32:45 PM) stefan_schmidt: thats because we have been setup for exatcly
this task
(1:32:53 PM) Khem__: I thing technical roadmap
(1:33:01 PM) RP__: stefan_schmidt: I know, but I think now is the time to
review it
(1:33:04 PM) Khem__: Is also what ya should be involved in
(1:33:20 PM) RP__: ya?
(1:33:25 PM) fray: The more I think about it.. the more I think an oe-core
IG makes sense..  I see the TSC as the group who sets direction -- and gets
things off the ground.. but eventually the work should migrate... (with the
e.V. and users taking over...)
(1:33:25 PM) Tartarus: So, I wouldn't object to making the TSC go back to
the old "decider" role, so long as we propose an open weekly IG type meeting
(1:33:27 PM) Khem__: Typo
(1:33:46 PM) Tartarus: Since yeah, it's really good to get as many of the
folks that care popping in, focusing on issues and otherwise being social
(1:33:55 PM) fray: Would the IG allow non e.V. to participate?
(1:33:58 PM) RP__: I think what this group has been doing it useful and I
don't want to change that
(1:34:15 PM) RP__: but I think a more open meeting and detactment from the
TSC might now be a good idea
(1:34:28 PM) stefan_schmidt: fray: I think IGs should be based on technical
interest and merrits not on ev membership status
(1:34:50 PM) stefan_schmidt: fray: thats only for stuff we need to vote on
because we failed to get it done without :)
(1:35:06 PM) Tartarus: Maybe I should correct myself, I don't mean IG in the
formal sense
(1:35:07 PM) RP__: So two questions, do we create an IG for this subject and
is it open?
(1:35:07 PM) Khem__: I think unless oe is released with. Oe-core we need to
keep functioning this way a bit as well
(1:35:17 PM) Tartarus: I just mean a time where folks that care and have
opinions can come in
(1:35:18 PM) fray: stefan_schmidt thats my thinking as well..
(1:35:25 PM) RP__: Tartarus: right
(1:35:25 PM) stefan_schmidt: RP__: Subject == oe-core?
(1:35:28 PM) RP__: stefan_schmidt: yes
(1:35:33 PM) Tartarus: And there's a set of topics and it's not a free for
all
(1:35:38 PM) stefan_schmidt: RP__: I would like to see this yes.
(1:35:53 PM) RP__: I think it would need an agenda and someone driving it,
maybe a TSC member
(1:35:53 PM) stefan_schmidt: Like there is kind of an IG for infrastructure
already
(1:36:02 PM) Khem__: Until next oe release we need to be working the way we
have a bit
(1:36:06 PM) stefan_schmidt: with people from OE and yocto
(1:36:10 PM) fray: the key for the success or failure of a switch to
oe-core, is that it needs to be actively maintained by a core of folks until
it has enough users (and maintainers) to continue to drive it..
(1:36:21 PM) fray: TSC fills that role today.. IG can easily do so tomorrow
(1:36:43 PM) RP__: The TSC needs to also covering what it used to be
covering
(1:37:00 PM) fray: yup
(1:37:04 PM) RP__: Er, The TSC needs to get back to also covering what it
used to be covering
(1:37:04 PM) Khem__: Besides yocto their are handful of folks using oe-core
though it's increasing
(1:37:27 PM) Khem__: Yes I agree
(1:38:20 PM) RP__: I put this on the agenda as I really want people to start
thinking about it
(1:38:34 PM) RP__: Perhaps we do so and come back to it next week?
(1:38:45 PM) stefan_schmidt: I was just about to propose this :)
(1:38:56 PM) fray: think thats a good idea
(1:38:57 PM) stefan_schmidt: I need to think more about it and a week would
help me with it
(1:39:03 PM) Khem__: I think we should have an item to discuss weekly
activity if anything needs discussion
(1:39:09 PM) ***RP__ tries to do longer term planning as well as short and
medium :)
(1:39:52 PM) stefan_schmidt: Khem__: hmm, we could gather some of the status
items under the weekly activity item
(1:40:12 PM) Khem__: Yes week in perspective
(1:40:58 PM) fray: ya, thats likely the right topic.. we can each mention
anything we know of thats happened in the last week or so..
(1:41:02 PM) ***Jefro jefro notes new perpetual agenda item
(1:41:11 PM) stefan_schmidt: Lets try if we can make such an item next week
(1:41:18 PM) Jefro: we can call it "weekly world news"
(1:41:52 PM) stefan_schmidt: for TSC and IGs people should think about it
this week
(1:42:28 PM) Khem__: Discussions on layering tools is important going
forward
(1:42:50 PM) RP__: There are people working on layer tooling
(1:43:04 PM) RP__: based on the f2f discussions we had along with mailing
list feedback
(1:43:13 PM) stefan_schmidt: RP__: will there be an interim status update?
(1:43:40 PM) stefan_schmidt: RP__: Would be good to have an early version
before to much works goes into it to give feedback and maybe direction
(1:43:46 PM) RP__: stefan_schmidt: Its being done in stages, I'd expect to
see patches at each step
(1:43:49 PM) stefan_schmidt: I guess you are directly involved?
(1:43:58 PM) RP__: stefan_schmidt: the plans are on the wiki
(1:44:04 PM) stefan_schmidt: RP__: ok, good. Is there a repo for it?
(1:44:08 PM) RP__: stefan_schmidt: please do comment on the mailing list if
you have feedback
(1:44:15 PM) RP__: stefan_schmidt: no, there is no code
(1:44:23 PM) RP__: stefan_schmidt: hence rfcs as soon as there is some code
(1:44:27 PM) stefan_schmidt: RP__: ok, so early still ;)
(1:44:31 PM) RP__: stefan_schmidt: yes
(1:44:39 PM) stefan_schmidt: nv then I wait for some patches :)
(1:44:39 PM) Khem__: Cool thx
(1:44:41 PM) RP__: stefan_schmidt: bluelightning is leading it btw
(1:44:48 PM) RP__: so talk to him if you want specifics
(1:44:57 PM) stefan_schmidt: thanks
(1:45:13 PM) stefan_schmidt: That means we only have 10 left
(1:45:19 PM) stefan_schmidt: 10) How should we (OE) handle non-Linux host
support?  Policies, priorities, etc.
(1:45:33 PM) stefan_schmidt: fray: You have only Unix in mind or also
Windows systems?
(1:45:39 PM) fray: I bring this up because of the MacOS X work I did.. and
now a few other people have started in on..
(1:45:40 PM) ***RP__ commented on this on irc  which was that it depends how
hacky and invasive the patches are
(1:45:48 PM) Khem__: An IG will be good for it
(1:45:53 PM) stefan_schmidt: heh
(1:45:58 PM) fray: but it's not specifix to MacOS X.. it could easily be BSD
or even something like Windows (cygwin?)
(1:45:59 PM) stefan_schmidt: our first IG born  ;)
(1:46:06 PM) RP__: I'm fine with collecting up the changes and merging
anything that isn't going to be a major maintenance headache
(1:46:17 PM) RP__: please don't do windows
(1:46:18 PM) fray: what (as the TSC) do we expect for these?  what
limitations are made on this tupe of changes..
(1:46:25 PM) stefan_schmidt: but I agree with khem. Kergoroth and Koen did
also work for MacOSX
(1:46:27 PM) Tartarus: So long as it's clean
(1:46:29 PM) Tartarus: I don't think we care
(1:46:41 PM) RP__: It *needs* to be clean and not a maintenance headache
(1:46:41 PM) stefan_schmidt: and with other unix systems coming in the
patches should get less hacky as well
(1:46:42 PM) fray: my concern would be things like do we require filesystems
that are case sensative?  or will we accept changes to make case not an
issue..
(1:46:45 PM) Tartarus: And clean means the "ugly" hack for something in OSX
or Cygwin is isolated at least
(1:46:45 PM) fray: (just an example)
(1:47:20 PM) Tartarus: If it's all handled in conf/osx.conf and doesn't make
other things have 50 variables, it's fine
(1:47:22 PM) fray: thats the thing, I expect a few hacks here and there..
but what I'm not clear on is what will be acceptable.. (and perhaps the
answer is simply on a case-by-case basis we make that call)
(1:47:28 PM) stefan_schmidt: fray: I think non case sensetive fs would be to
much of a hassle
(1:47:34 PM) RP__: fray: I think it has to be case by case
(1:47:53 PM) stefan_schmidt: its just to deep into all kind of packages ...
(1:47:59 PM) Khem__: Fray in general case sensitive ness sometimes is coming
from package arcs too e.g. Makefile makefile
(1:48:12 PM) RP__: and yes, a non case sensitive file system might be
potentially too nasty
(1:48:18 PM) fray: yup..  just mentioning it as an issue I know will come up
(1:48:31 PM) Tartarus: Khem__: OT, do you see my msg?
(1:49:21 PM) stefan_schmidt: fray: gather some people around it, prepare a
contrib repo for the nasty stuff, think about cleaner solutions and bring
this forward piece by piece
(1:49:35 PM) fray: so anyway, I wasn't looking for a direct answer.. just
want to make sure when these issues pop up, as a TSC we can give direction..
and right now direction is not to overly burden maintenance on our core
Linux hosts -- and it needs to be "reasonable".. reasonable defined per
patch/change
(1:49:48 PM) fray: stefan_schmidt yup.. thats what I was thinking as well..
(1:49:54 PM) stefan_schmidt: Personally I think windows is not worth the
effort as vmare or such is easy enough for them
(1:50:14 PM) fray: stefan_schmidt agreed.. I think BSD and MacOS X are more
likely.. but....
(1:50:18 PM) RP__: and likely has better performance ;-)
(1:50:26 PM) stefan_schmidt: RP__: heh
(1:50:39 PM) stefan_schmidt: fray: I think we can take them just as all
other patches
(1:50:57 PM) fray: (on a tangent, you'd be surprised at how many folks won't
allow vmware in their corporate environments.. and similarly won't allow
Linux because it's no a support OS..)
(1:51:01 PM) Khem__: I would be interested in bad
(1:51:06 PM) Khem__: Errr bad
(1:51:10 PM) Jefro: LOL
(1:51:14 PM) fray: (luckily thats changing.. but it's reality that may cause
someone to try to do native windows support..)
(1:51:16 PM) Khem__: Spell checker
(1:51:18 PM) fray: (that someone is NOT me)
(1:51:34 PM) stefan_schmidt: fray: well, then he really will have a hard
time
(1:51:34 PM) Jefro: fray do you find that cygwin is similarly disallowed?
(1:52:01 PM) fray: Jefro, cygwin -- for the purposes of build system
emulation -- could be made to work, but is so incredibly painful, it's
unlike to be worth it..
(1:52:11 PM) stefan_schmidt: fray: I don't mind repos where patches for such
nasty things are shared, but those people should be aware that such things
can and will break quite often
(1:52:22 PM) fray: (I doubt significant changes to oe would be necessary to
support cygwin...)
(1:52:50 PM) Khem__: Yeah
(1:53:03 PM) Khem__: It's solaris or BSD
(1:53:06 PM) Khem__: Yay
(1:53:12 PM) fray: well hopefully solaris is dead.. ;)
(1:53:23 PM) fray: that just leaves BSD(s), and MacOS X
(1:53:23 PM) fray: ;)
(1:53:41 PM) fray: anyway, thats all I wanted..
(1:54:07 PM) Khem__: BSD and macs with ports might converge the changes
needed
(1:54:26 PM) stefan_schmidt: Khem__: and his BSD world around him in this
company building ;)
(1:54:58 PM) Khem__: Yes I might get nod on some work on it
(1:55:10 PM) stefan_schmidt: so we all agree that patches for this will by
case-by-case just as all other patches as well
(1:55:35 PM) Khem__: Yes
(1:55:44 PM) stefan_schmidt: we don't see urgent support for other systems
as linux but would welcome them if the patches are able to integrate it in a
sane manner
(1:55:47 PM) fray: seems reasonable to me
(1:56:32 PM) stefan_schmidt: good
(1:56:43 PM) stefan_schmidt: I think that's it for the meeting today then
(1:56:47 PM) Tartarus: Yes
(1:57:09 PM) Jefro: awesome
(1:57:12 PM) RP__: Can we minute that Koen has an action to read the
discussion on agenda item 08 in preparation for next week


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e856698b46d04a5148b45
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"moz-text-html" lang=3D"x-western"><div>OE-TSC Minutes 12-May-=
2011</div><div><br></div><div>Attending: Richard, Koen, Khem, Tom, Mark, St=
efan</div>
<div>Notes: Jefro</div><div><br></div><div><br></div><div>Agenda &amp; Minu=
tes</div><div><br></div><div><div>=A001) Agree on meeting chair</div><div>s=
tefan</div><div>___________________________________</div><div>=A002) Status=
 report on oe-core</div>

<div>RP__ has pushed the distroless changes</div><div>RP__ can make a post =
to oe-devel on behalf of the TSC? [general agreement]</div><div>RP__: Can w=
e assume we trust me to write a suitable announcement? :) [yes]</div><div>

--&gt; AR: (RP) write oe-core announcement for the masses</div><div>_______=
____________________________</div><div>=A003) Status report on pull model, =
contrib repo and guidelines</div><div>main discussion already on ML</div>

<div>___________________________________</div><div>=A004) Status report on =
board support layer guidelines</div><div>coming from fray soon</div><div>__=
_________________________________</div><div>=A005) Status on layer splittin=
g of metadata</div>

<div>merge with 02)</div><div>___________________________________</div><div=
>=A006) Continue discussions on infrastructure items</div><div>RP
 talked to the Linux Foundation today and I think we might be obtaining=20
some hardware in &quot;weeks&quot;. Mike and Tom King are dealing with that=
</div>
<div>___________________________________</div><div>=A007) Elections</div><d=
iv>waiting on board</div><div>___________________________________</div><div=
>08) RP is proposing that whilst the TSC has done good work on this and bee=
n</div>

<div>productive, we need to refocus and maybe spin off an interest group fo=
r</div><div>the OECore specific pieces and the original TSC focus needs to =
be</div><div>regained.</div><div><br></div><div>this TSC has operated very =
very differently to previous TSCs</div>

<div>continue as is or change</div><div>--&gt;Koen to read up before next w=
eek</div><div>___________________________________</div><div>09) RP is also =
proposing that with the &quot;distroless&quot; configuration in place,</div=
>

<div>we&#39;re about ready to invite wider attention on OECore.</div><div>s=
ee #2 above</div><div>____________________________________</div><div>10) Ho=
w should we (OE) handle non-Linux host support? =A0Policies, priorities, et=
c.</div>

<div>fray: I bring this up because of the MacOS X work I did.. and now a fe=
w other people have started in on</div><div>RP: needs to be clean, not a ma=
intenance headache</div><div><br></div><div><br></div><div>Raw Transcript</=
div>

<div><br></div><div>(21:00:19) ***RP__ is here</div><div>(21:00:29) Tartaru=
s: That&#39;s a quorum then, yeah</div><div>(21:00:43) RP__: Yes, four of u=
s</div><div>(21:01:09) stefan_schmidt: I can chair if people like</div>

<div>(21:01:25) Tartarus: works for me</div><div>(21:01:26) Tartarus: thank=
s</div><div>(21:01:27) RP__: stefan_schmidt: no objection</div><div>(21:01:=
49) RP__: Jefro did send out an agenda</div><div>(21:01:51) stefan_schmidt:=
 ok, will bring up the agenda</div>

<div>(21:02:02) stefan_schmidt: yeah, will but it on pastebin just as refer=
ence</div><div>(21:02:08) stefan_schmidt: with fray item added</div><div>(2=
1:03:03) stefan_schmidt: <a href=3D"http://pastebin.com/jTL7wr3G">http://pa=
stebin.com/jTL7wr3G</a></div>

<div>(21:03:18) stefan_schmidt: We start without jefro and someone just sen=
ds him the log?</div><div>(21:03:25) RP__: stefan_schmidt: I think so</div>=
<div>(21:03:26) stefan_schmidt: btw, is someone logging? RP__ ?</div><div>

(21:03:27) fray: seems reasonable</div><div>(21:03:32) ***RP__ has logs</di=
v><div>(21:03:46) RP__: stefan_schmidt: I posted some additions to the agen=
da too?</div><div>(21:03:56) stefan_schmidt: RP__: right</div><div>(21:04:0=
5) stefan_schmidt: i will get an updated version up</div>

<div>(1:06:33 PM) stefan_schmidt: <a href=3D"http://pastebin.com/hZBRq0mS">=
http://pastebin.com/hZBRq0mS</a></div><div>(1:06:38 PM) stefan_schmidt: The=
re we go</div><div>(1:06:45 PM) stefan_schmidt: Agenda with the added items=
</div>

<div>(1:06:55 PM) Jefro: stefan_schmidt awesome, thanks</div><div>(1:06:59 =
PM) RP__: stefan_schmidt: thanks :)</div><div>(1:07:06 PM) RP__: Jefro: ste=
fan_schmidt is chair today</div><div>(1:07:12 PM) fray: :)</div><div>(1:07:=
17 PM) stefan_schmidt: Jefro: we agreed on me being the meeting chair so fa=
r</div>

<div>(1:07:27 PM) Jefro: I gathered that. Stefan: congratulations</div><div=
>(1:07:36 PM) RP__: koen and khem send apologies</div><div>(1:08:11 PM) ste=
fan_schmidt: so we are ready for take-off</div><div>(1:08:15 PM) RP__: stef=
an_schmidt: yes</div>

<div>(1:08:26 PM) ***stefan_schmidt stops his OE build to have better xchat=
 performance :)</div><div>(1:08:54 PM) stefan_schmidt: 02) OE core status u=
pdate</div><div>(1:09:18 PM) ***RP__ has pushed the distroless changes</div=
>

<div>(1:09:29 PM) stefan_schmidt: RP__: I think you and koen had some discu=
ssions about the gconf stuff</div><div>(1:09:44 PM) stefan_schmidt: raising=
 points what should be in core and what in other layers</div><div>(1:09:54 =
PM) RP__: stefan_schmidt: We did as what koen asked for conflicted with wha=
t we&#39;d agreed in previous tsc meetings</div>

<div>(1:10:04 PM) RP__: I think koen needs to be present for that discussio=
n though</div><div>(1:10:07
 PM) stefan_schmidt: RP__: thanks for the distro less stuff. Great in=20
time for the meeting and, hopefully, the announcement</div>
<div>(1:10:19 PM) RP__: and neither of us see it as a blocking issue on OEC=
ore, just needs discussion</div><div>(1:10:27 PM) stefan_schmidt: RP__: yea=
h, would make more sense</div><div>(1:11:02
 PM) stefan_schmidt: RP__: I actually like to see such things coming up=20
from time to time to re-evaluate where to put things :)</div>
<div>(1:11:13 PM) fray: Assuming everyone is comfortable with the=20
existing changes, are we ready to formally announce it? =A0(I know we have
 more and more people using it every week -- which is really good)</div><di=
v>(1:11:42 PM) stefan_schmidt: fray: I think so. We waited for distro less =
last week and RP__ got it ready in time</div>
<div>(1:11:45 PM) Tartarus: I think we must, yes</div><div>(1:11:52 PM) RP_=
_: fray: I was getting to this and yes, I think we&#39;re about there for t=
hat</div><div>(1:12:08 PM) RP__: So the question really is who takes the ac=
tion?</div>

<div>(1:12:24 PM) stefan_schmidt: nothing more to 02? Then we merge in 09 h=
ere</div><div>(1:12:24 PM) ***RP__ can make a post to oe-devel on behalf of=
 the TSC?</div><div>(1:12:33 PM) stefan_schmidt: sounds good</div><div>

(1:12:45 PM) stefan_schmidt: I think it does reflect the TSC</div><div>(1:1=
2:58 PM) RP__: Its what we minuted last week as our plan</div><div>(1:13:04=
 PM) stefan_schmidt: And we where set up to bring oe-core forward so it wou=
ld be good to announce it as TSC</div>

<div>(1:13:17 PM) RP__: Since then we&#39;ve ensured bitbake is more in syn=
c and removed the final poky references</div><div>(1:13:31 PM) RP__: which =
were the things we wanted to do before announcing</div><div>(1:13:45 PM) st=
efan_schmidt: we are fine I would say</div>

<div>(1:13:54 PM) RP__: Can we assume we trust me to write a suitable annou=
ncement? :)</div><div>(1:14:10 PM) stefan_schmidt: I do :)</div><div>(1:14:=
39 PM) Tartarus: Yes, we do</div><div>(1:14:56 PM) RP__: stefan_schmidt: I&=
#39;d take silence as acceptance ;-)</div>

<div>(1:15:06 PM) ***Jefro would hope so at this point</div><div>(1:15:12 P=
M) fray: no problem here..</div><div>(1:15:24 PM) stefan_schmidt: ok, all f=
or it. RP__ please do it</div><div>(1:15:38 PM) stefan_schmidt: 09 done as =
well?</div>

<div>(1:15:39 PM) ***RP__ will aim to send something out tomorrow</div><div=
>(1:15:42 PM) RP__: stefan_schmidt: yes</div><div>(1:15:59 PM) stefan_schmi=
dt: AR: (RP) write oe-core announcement for the masses</div><div>(1:16:07 P=
M) RP__: For 03), there has been some discussion about pull scripts and wor=
kflow</div>

<div>(1:16:21 PM) RP__: I&#39;d suggest those discussions continue for all =
on the mailing list</div><div>(1:16:32 PM) stefan_schmidt: agreed</div><div=
>(1:16:40 PM) Tartarus: agreed</div><div>(1:16:44 PM) fray: the discussion =
has been growing, and I think is headed in the right direction -- agreed</d=
iv>

<div>(1:16:49 PM) stefan_schmidt: khem did finish his AR regarding the comm=
it scripts</div><div>(1:17:03 PM) fray: the 5th version of the commit/patch=
 message guidelines was just posted..</div><div>(1:17:11 PM) fray: this is =
close to the final version -- assuming no major comments</div>

<div>(1:17:11 PM) RP__: stefan_schmidt: yes, we have commit emails now so T=
artarus should be happy</div><div>(1:17:35 PM) Tartarus: yes</div><div>(1:1=
7:52
 PM) fray: just one thing to mention.. Paul Menzel has made a number of=20
editorial comments and improvements in the guidelines as we&#39;ve gone..</=
div>
<div>(1:18:01 PM) stefan_schmidt: so fray has an eye on commit=20
guidelines and Tartarus, khem, Daren, etc will keep discussing the pull=20
scripts</div><div>(1:18:18 PM) stefan_schmidt: fray: thats good</div><div>(=
1:19:34
 PM) ***stefan_schmidt just notes that oe-core gets other distros even=20
before the announcement.(&lt;pb_&gt; in other news, though, I nearly=20
have some semblance of a working micro layer on top of oe-core.)</div>
<div>(1:19:57 PM) RP__: great :)</div><div>(1:20:01 PM) stefan_schmidt: 03 =
needs no more discussion here?</div><div>(1:20:10 PM) stefan_schmidt: Seems=
 the current main topics are on the ml</div><div>(1:20:16 PM) RP__: stefan_=
schmidt: agreed</div>

<div>(1:20:27 PM) stefan_schmidt: 4) Status report on board support layer g=
uidelines</div><div>(1:21:02 PM) stefan_schmidt: has this moved?</div><div>=
(1:21:22 PM) ***RP__ doesn&#39;t know</div><div>(1:21:57 PM) stefan_schmidt=
: anyone has updates on this?</div>

<div>(1:21:59 PM) Jefro: I have an action item there to send fray a rough d=
ocument</div><div>(1:22:01 PM) Khem__ [d0dfd0f2@gateway/web/freenode/ip.208=
.223.208.242] entered the room.</div><div>(1:22:08 PM) Jefro: by the end of=
 this week - on target</div>

<div>(1:22:16 PM) fray: yup, so I think were slightly behind on that.. but =
nothing big</div><div>(1:22:31 PM) stefan_schmidt: ok</div><div>(1:22:48 PM=
) stefan_schmidt: so this AR just stays and you come back next week</div>

<div>(1:22:52 PM) stefan_schmidt: hi Khem__</div><div>(1:23:08 PM) fray: st=
efan_schmidt yup</div><div>(1:23:14 PM) stefan_schmidt: ok</div><div>(1:23:=
23 PM) stefan_schmidt: 05) Status on layer splitting of metadata</div>
<div>
(1:23:45 PM) Khem__: Hi</div><div>(1:23:56 PM) Jefro: question that has bug=
ged me for a couple of weeks on 05 - why is it different from 02?</div><div=
>(1:24:01 PM) Jefro: (hi Khem__)</div><div>(1:24:09 PM) Khem__: Just sneaki=
ng in on an iPad</div>

<div>(1:24:18 PM) fray: originally it was seperate working being done both =
related to 02 and the existing oe repository..</div><div>(1:24:27 PM) stefa=
n_schmidt: Khem__: with OE on it of course ;)</div><div>(1:24:41
 PM) fray: I&#39;ve take it to mean (now that &quot;02&quot; oe-core is dow=
n) that it=20
refers to moving and modifying things from the existing OE repository..</di=
v>
<div>(1:24:59 PM) stefan_schmidt: Jefro: 02 was more about general oe-core =
problems</div><div>(1:25:06 PM) fray: -if- everyone is in agreement thats w=
hat it means, then we should likely re-word the topic</div><div>(1:25:12 PM=
) fray: (or remove it if it&#39;s no longer an issue)</div>

<div>(1:25:20 PM) stefan_schmidt: Its just that some of the important probl=
ems are actually around layers :)</div><div>(1:25:27 PM) RP__: Well, I thin=
k Koen&#39;s concerns fall under this</div><div>(1:25:32 PM) RP__: (topic)<=
/div>

<div>(1:25:43 PM) RP__: but we can defer that to next week or the mailing l=
ist</div><div>(1:25:50
 PM) Jefro: ok, thakns. I was just wondering whether 02 and 05 can be=20
merged at this point, particularly after RP announces oe-core to the=20
list, or whether they should stay separate. Now leaning toward the=20
latter, but will do what you guys want.</div>
<div>(1:25:55 PM) RP__: I&#39;m not aware of any other issues</div><div>(1:=
26:00 PM) fray: yes.. I think we need to keep an open item about layer &quo=
t;issues&quot; brought up on the mailing list or elsewhere..</div><div>

(1:26:16 PM) fray: (either content of the layer, way layer is being used, e=
tc..)</div><div>(1:26:28 PM) fray: RP__, I&#39;m not aware of anything else=
 yet..</div><div>(1:27:02
 PM) RP__: For 6), I talked to the Linux Foundation today and I think we
 might be obtaining some hardware in &quot;weeks&quot;. Mike and Tom King a=
re=20
dealing with that</div>
<div>(1:27:36 PM) stefan_schmidt: Good</div><div>(1:27:43 PM) stefan_schmid=
t: so Tom is already involved</div><div>(1:28:03 PM) RP__: yes</div><div>(1=
:28:11 PM) Khem__: is this hardware for general oe use</div><div>(1:28:25 P=
M) RP__: Khem__: It will be for OE to decide how best to use it, yes</div>

<div>(1:28:33 PM) Khem__: Ok</div><div>(1:29:05 PM) stefan_schmidt: That le=
aves 07, 08 and 10 open</div><div>(1:29:18 PM) stefan_schmidt: elections no=
w or as last item?</div><div>(1:29:19 PM) ***Khem__ thinks iPad is not that=
 iBad</div>

<div>(1:29:27 PM) ***Jefro suggests elections as last item</div><div>(1:29:=
35 PM) Jefro: Khem__ is it iRad ?</div><div>(1:29:44 PM) stefan_schmidt: Kh=
em__: well a fancy device just for IRC ;)</div><div>(1:29:46 PM) RP__: Well=
, elections is easy, we&#39;re waiting on the board</div>

<div>(1:29:56 PM) RP__: and its kind of related to 08</div><div>(1:29:59 PM=
) fray: AFAIK, the board is in control over that</div><div>(1:30:04 PM) RP_=
_: right</div><div>(1:30:17 PM) RP__: So let me talk a little about this to=
pic</div>

<div>(1:30:20 PM) stefan_schmidt: voting system tests went well it seems</d=
iv><div>(1:30:26 PM) RP__: agreed, yes</div><div>(1:30:35 PM) RP__: I&#39;m=
 not sure how many people saw the discussion I had after the TSC meeting la=
st week</div>

<div>(1:30:47 PM) ***stefan_schmidt not</div><div>(1:30:49 PM) RP__: I rais=
ed the issue of non-voting TSC members</div><div>(1:31:01 PM) stefan_schmid=
t: ah, you mean on the ml</div><div>(1:31:02 PM) RP__: It was shot down wit=
h good reason but I think it was right to ask some questions</div>

<div>(1:31:09 PM) RP__: yes, on the ml</div><div>(1:31:29 PM) RP__: It made=
 me realise how this TSC has operated very very differently to previous TSC=
s</div><div>(1:31:53
 PM) RP__: If you look at the agenda we&#39;re very focused on a specific=
=20
topic and we&#39;re functioning more like an interest group</div>
<div>(1:31:53 PM) Khem__: Yes</div><div>(1:32:11 PM) stefan_schmidt: hmm</d=
iv><div>(1:32:12 PM) fray: I&#39;d certainly agree with that</div><div>(1:3=
2:14 PM) RP__: The original idea of the TSC was a decision breaker, not a d=
iscussion forum as we&#39;ve been doing</div>

<div>(1:32:21 PM) Khem__: That was the mandate to start with</div><div>(1:3=
2:22 PM) stefan_schmidt: you mean like an oe-core IG</div><div>(1:32:26 PM)=
 RP__: yes</div><div>(1:32:42 PM) RP__: So my question is whether its time =
to rethink what we&#39;re doing and where and how we&#39;re doing it</div>

<div>(1:32:45 PM) stefan_schmidt: thats because we have been setup for exat=
cly this task</div><div>(1:32:53 PM) Khem__: I thing technical roadmap</div=
><div>(1:33:01 PM) RP__: stefan_schmidt: I know, but I think now is the tim=
e to review it</div>

<div>(1:33:04 PM) Khem__: Is also what ya should be involved in</div><div>(=
1:33:20 PM) RP__: ya?</div><div>(1:33:25
 PM) fray: The more I think about it.. the more I think an oe-core IG=20
makes sense.. =A0I see the TSC as the group who sets direction -- and gets
 things off the ground.. but eventually the work should migrate... (with
 the e.V. and users taking over...)</div>
<div>(1:33:25 PM) Tartarus: So, I wouldn&#39;t object to making the TSC go=
=20
back to the old &quot;decider&quot; role, so long as we propose an open wee=
kly IG=20
type meeting</div><div>(1:33:27 PM) Khem__: Typo</div><div>(1:33:46 PM)=20
Tartarus: Since yeah, it&#39;s really good to get as many of the folks that=
=20
care popping in, focusing on issues and otherwise being social</div>
<div>(1:33:55 PM) fray: Would the IG allow non e.V. to participate?</div><d=
iv>(1:33:58 PM) RP__: I think what this group has been doing it useful and =
I don&#39;t want to change that</div><div>(1:34:15 PM) RP__: but I think a =
more open meeting and detactment from the TSC might now be a good idea</div=
>

<div>(1:34:28 PM) stefan_schmidt: fray: I think IGs should be based on tech=
nical interest and merrits not on ev membership status</div><div>(1:34:50 P=
M) stefan_schmidt: fray: thats only for stuff we need to vote on because we=
 failed to get it done without :)</div>

<div>(1:35:06 PM) Tartarus: Maybe I should correct myself, I don&#39;t mean=
 IG in the formal sense</div><div>(1:35:07 PM) RP__: So two questions, do w=
e create an IG for this subject and is it open?</div><div>(1:35:07 PM) Khem=
__: I think unless oe is released with. Oe-core we need to keep functioning=
 this way a bit as well</div>

<div>(1:35:17 PM) Tartarus: I just mean a time where folks that care and ha=
ve opinions can come in</div><div>(1:35:18 PM) fray: stefan_schmidt thats m=
y thinking as well..</div><div>(1:35:25 PM) RP__: Tartarus: right</div>

<div>(1:35:25 PM) stefan_schmidt: RP__: Subject =3D=3D oe-core?</div><div>(=
1:35:28 PM) RP__: stefan_schmidt: yes</div><div>(1:35:33 PM) Tartarus: And =
there&#39;s a set of topics and it&#39;s not a free for all</div><div>(1:35=
:38 PM) stefan_schmidt: RP__: I would like to see this yes.</div>

<div>(1:35:53 PM) RP__: I think it would need an agenda and someone driving=
 it, maybe a TSC member</div><div>(1:35:53 PM) stefan_schmidt: Like there i=
s kind of an IG for infrastructure already</div><div>(1:36:02 PM) Khem__: U=
ntil next oe release we need to be working the way we have a bit</div>

<div>(1:36:06 PM) stefan_schmidt: with people from OE and yocto</div><div>(=
1:36:10
 PM) fray: the key for the success or failure of a switch to oe-core, is
 that it needs to be actively maintained by a core of folks until it has
 enough users (and maintainers) to continue to drive it..</div>
<div>(1:36:21 PM) fray: TSC fills that role today.. IG can easily do so tom=
orrow</div><div>(1:36:43 PM) RP__: The TSC needs to also covering what it u=
sed to be covering</div><div>(1:37:00 PM) fray: yup</div><div>(1:37:04 PM) =
RP__: Er, The TSC needs to get back to also covering what it used to be cov=
ering</div>

<div>(1:37:04 PM) Khem__: Besides yocto their are handful of folks using oe=
-core though it&#39;s increasing</div><div>(1:37:27 PM) Khem__: Yes I agree=
</div><div>(1:38:20 PM) RP__: I put this on the agenda as I really want peo=
ple to start thinking about it</div>

<div>(1:38:34 PM) RP__: Perhaps we do so and come back to it next week?</di=
v><div>(1:38:45 PM) stefan_schmidt: I was just about to propose this :)</di=
v><div>(1:38:56 PM) fray: think thats a good idea</div><div>(1:38:57 PM) st=
efan_schmidt: I need to think more about it and a week would help me with i=
t</div>

<div>(1:39:03 PM) Khem__: I think we should have an item to discuss weekly =
activity if anything needs discussion</div><div>(1:39:09 PM) ***RP__ tries =
to do longer term planning as well as short and medium :)</div><div>(1:39:5=
2 PM) stefan_schmidt: Khem__: hmm, we could gather some of the status items=
 under the weekly activity item</div>

<div>(1:40:12 PM) Khem__: Yes week in perspective</div><div>(1:40:58 PM)
 fray: ya, thats likely the right topic.. we can each mention anything=20
we know of thats happened in the last week or so..</div><div>(1:41:02 PM) *=
**Jefro jefro notes new perpetual agenda item</div>
<div>(1:41:11 PM) stefan_schmidt: Lets try if we can make such an item next=
 week</div><div>(1:41:18 PM) Jefro: we can call it &quot;weekly world news&=
quot;</div><div>(1:41:52 PM) stefan_schmidt: for TSC and IGs people should =
think about it this week</div>

<div>(1:42:28 PM) Khem__: Discussions on layering tools is important going =
forward</div><div>(1:42:50 PM) RP__: There are people working on layer tool=
ing</div><div>(1:43:04 PM) RP__: based on the f2f discussions we had along =
with mailing list feedback</div>

<div>(1:43:13 PM) stefan_schmidt: RP__: will there be an interim status upd=
ate?</div><div>(1:43:40
 PM) stefan_schmidt: RP__: Would be good to have an early version before
 to much works goes into it to give feedback and maybe direction</div>
<div>(1:43:46 PM) RP__: stefan_schmidt: Its being done in stages, I&#39;d e=
xpect to see patches at each step</div><div>(1:43:49 PM) stefan_schmidt: I =
guess you are directly involved?</div><div>(1:43:58 PM) RP__: stefan_schmid=
t: the plans are on the wiki</div>

<div>(1:44:04 PM) stefan_schmidt: RP__: ok, good. Is there a repo for it?</=
div><div>(1:44:08 PM) RP__: stefan_schmidt: please do comment on the mailin=
g list if you have feedback</div><div>(1:44:15 PM) RP__: stefan_schmidt: no=
, there is no code</div>

<div>(1:44:23 PM) RP__: stefan_schmidt: hence rfcs as soon as there is some=
 code</div><div>(1:44:27 PM) stefan_schmidt: RP__: ok, so early still ;)</d=
iv><div>(1:44:31 PM) RP__: stefan_schmidt: yes</div><div>(1:44:39 PM) stefa=
n_schmidt: nv then I wait for some patches :)</div>

<div>(1:44:39 PM) Khem__: Cool thx</div><div>(1:44:41 PM) RP__: stefan_schm=
idt: bluelightning is leading it btw</div><div>(1:44:48 PM) RP__: so talk t=
o him if you want specifics</div><div>(1:44:57 PM) stefan_schmidt: thanks</=
div>

<div>(1:45:13 PM) stefan_schmidt: That means we only have 10 left</div><div=
>(1:45:19 PM) stefan_schmidt: 10) How should we (OE) handle non-Linux host =
support? =A0Policies, priorities, etc.</div><div>(1:45:33 PM) stefan_schmid=
t: fray: You have only Unix in mind or also Windows systems?</div>

<div>(1:45:39 PM) fray: I bring this up because of the MacOS X work I did..=
 and now a few other people have started in on..</div><div>(1:45:40 PM) ***=
RP__ commented on this on irc =A0which was that it depends how hacky and in=
vasive the patches are</div>

<div>(1:45:48 PM) Khem__: An IG will be good for it</div><div>(1:45:53 PM) =
stefan_schmidt: heh</div><div>(1:45:58 PM) fray: but it&#39;s not specifix =
to MacOS X.. it could easily be BSD or even something like Windows (cygwin?=
)</div>

<div>(1:45:59 PM) stefan_schmidt: our first IG born =A0;)</div><div>(1:46:0=
6
 PM) RP__: I&#39;m fine with collecting up the changes and merging anything=
=20
that isn&#39;t going to be a major maintenance headache</div><div>(1:46:17 =
PM) RP__: please don&#39;t do windows</div>
<div>(1:46:18 PM) fray: what (as the TSC) do we expect for these? =A0what l=
imitations are made on this tupe of changes..</div><div>(1:46:25 PM) stefan=
_schmidt: but I agree with khem. Kergoroth and Koen did also work for MacOS=
X</div>

<div>(1:46:27 PM) Tartarus: So long as it&#39;s clean</div><div>(1:46:29 PM=
) Tartarus: I don&#39;t think we care</div><div>(1:46:41 PM) RP__: It *need=
s* to be clean and not a maintenance headache</div><div>(1:46:41 PM) stefan=
_schmidt: and with other unix systems coming in the patches should get less=
 hacky as well</div>

<div>(1:46:42 PM) fray: my concern would be things like do we require=20
filesystems that are case sensative? =A0or will we accept changes to make=
=20
case not an issue..</div><div>(1:46:45 PM) Tartarus: And clean means the &q=
uot;ugly&quot; hack for something in OSX or Cygwin is isolated at least</di=
v>
<div>(1:46:45 PM) fray: (just an example)</div><div>(1:47:20 PM) Tartarus: =
If it&#39;s all handled in conf/osx.conf and doesn&#39;t make other things =
have 50 variables, it&#39;s fine</div><div>(1:47:22
 PM) fray: thats the thing, I expect a few hacks here and there.. but=20
what I&#39;m not clear on is what will be acceptable.. (and perhaps the=20
answer is simply on a case-by-case basis we make that call)</div>
<div>(1:47:28 PM) stefan_schmidt: fray: I think non case sensetive fs would=
 be to much of a hassle</div><div>(1:47:34 PM) RP__: fray: I think it has t=
o be case by case</div><div>(1:47:53 PM) stefan_schmidt: its just to deep i=
nto all kind of packages ...</div>

<div>(1:47:59 PM) Khem__: Fray in general case sensitive ness sometimes is =
coming from package arcs too e.g. Makefile makefile</div><div>(1:48:12 PM) =
RP__: and yes, a non case sensitive file system might be potentially too na=
sty</div>

<div>(1:48:18 PM) fray: yup.. =A0just mentioning it as an issue I know will=
 come up</div><div>(1:48:31 PM) Tartarus: Khem__: OT, do you see my msg?</d=
iv><div>(1:49:21
 PM) stefan_schmidt: fray: gather some people around it, prepare a=20
contrib repo for the nasty stuff, think about cleaner solutions and=20
bring this forward piece by piece</div>
<div>(1:49:35 PM) fray: so anyway, I wasn&#39;t looking for a direct=20
answer.. just want to make sure when these issues pop up, as a TSC we=20
can give direction.. and right now direction is not to overly burden=20
maintenance on our core Linux hosts -- and it needs to be &quot;reasonable&=
quot;..
 reasonable defined per patch/change</div>
<div>(1:49:48 PM) fray: stefan_schmidt yup.. thats what I was thinking as w=
ell..</div><div>(1:49:54 PM) stefan_schmidt: Personally I think windows is =
not worth the effort as vmare or such is easy enough for them</div><div>

(1:50:14 PM) fray: stefan_schmidt agreed.. I think BSD and MacOS X are more=
 likely.. but....</div><div>(1:50:18 PM) RP__: and likely has better perfor=
mance ;-)</div><div>(1:50:26 PM) stefan_schmidt: RP__: heh</div><div>(1:50:=
39 PM) stefan_schmidt: fray: I think we can take them just as all other pat=
ches</div>

<div>(1:50:57 PM) fray: (on a tangent, you&#39;d be surprised at how many=
=20
folks won&#39;t allow vmware in their corporate environments.. and similarl=
y
 won&#39;t allow Linux because it&#39;s no a support OS..)</div><div>(1:51:=
01 PM) Khem__: I would be interested in bad</div>
<div>(1:51:06 PM) Khem__: Errr bad</div><div>(1:51:10 PM) Jefro: LOL</div><=
div>(1:51:14 PM) fray: (luckily thats changing.. but it&#39;s reality that =
may cause someone to try to do native windows support..)</div><div>(1:51:16=
 PM) Khem__: Spell checker</div>

<div>(1:51:18 PM) fray: (that someone is NOT me)</div><div>(1:51:34 PM) ste=
fan_schmidt: fray: well, then he really will have a hard time</div><div>(1:=
51:34 PM) Jefro: fray do you find that cygwin is similarly disallowed?</div=
>

<div>(1:52:01 PM) fray: Jefro, cygwin -- for the purposes of build=20
system emulation -- could be made to work, but is so incredibly painful,
 it&#39;s unlike to be worth it..</div><div>(1:52:11 PM) stefan_schmidt:=20
fray: I don&#39;t mind repos where patches for such nasty things are shared=
,
 but those people should be aware that such things can and will break=20
quite often</div>
<div>(1:52:22 PM) fray: (I doubt significant changes to oe would be necessa=
ry to support cygwin...)</div><div>(1:52:50 PM) Khem__: Yeah</div><div>(1:5=
3:03 PM) Khem__: It&#39;s solaris or BSD</div><div>(1:53:06 PM) Khem__: Yay=
</div>

<div>(1:53:12 PM) fray: well hopefully solaris is dead.. ;)</div><div>(1:53=
:23 PM) fray: that just leaves BSD(s), and MacOS X</div><div>(1:53:23 PM) f=
ray: ;)</div><div>(1:53:41 PM) fray: anyway, thats all I wanted..</div>

<div>(1:54:07 PM) Khem__: BSD and macs with ports might converge the change=
s needed</div><div>(1:54:26 PM) stefan_schmidt: Khem__: and his BSD world a=
round him in this company building ;)</div><div>(1:54:58 PM) Khem__: Yes I =
might get nod on some work on it</div>

<div>(1:55:10 PM) stefan_schmidt: so we all agree that patches for this wil=
l by case-by-case just as all other patches as well</div><div>(1:55:35 PM) =
Khem__: Yes</div><div>(1:55:44
 PM) stefan_schmidt: we don&#39;t see urgent support for other systems as=
=20
linux but would welcome them if the patches are able to integrate it in a
 sane manner</div>
<div>(1:55:47 PM) fray: seems reasonable to me</div><div>(1:56:32 PM) stefa=
n_schmidt: good</div><div>(1:56:43 PM) stefan_schmidt: I think that&#39;s i=
t for the meeting today then</div><div>(1:56:47 PM) Tartarus: Yes</div>

<div>(1:57:09 PM) Jefro: awesome</div><div>(1:57:12 PM) RP__: Can we minute=
 that Koen has an action to read the discussion on agenda item 08 in prepar=
ation for next week</div><div><br></div><br>-- <br>Jeff Osier-Mixon <a href=
=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>

Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org/"=
 target=3D"_blank">http://yoctoproject.org</a></div><br>
</div></div>

--90e6ba6e856698b46d04a5148b45--
