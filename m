Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QMrki-0006xR-RR; Thu, 19 May 2011 03:10:13 +0200
Received: by qyk35 with SMTP id 35so3758244qyk.6
	for <multiple recipients>; Wed, 18 May 2011 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=5n8AGNa/TPPAMprvHCaX0DPUDatbQFhLc5OFX6IwByI=;
	b=lWq6tsvmn5Bg18dXEz8AvVOJgHBo0HRij1X1vs0dYsIz77dHNFYfOZi84wrFaMvYLV
	f+gdfPrMAEVZvTDnFDpQjXwhh8Wsb6NdHtyMWanOQomNnVvaz3AaTo+Euk2OnLnrnaoN
	0lXibaAss69fWMIn4ZoYpTN4q2ll128TId/oM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=YHW1EtBGEqN56Hdvb5uoeO4w+6yuIX50KP8sduiCNyXUK30ICBfhjbXfShcMgEezok
	Bblwvf++2udE+oZ3QXT+g/e4yRio+NK9JkMNsNBTq1nLd5klRzZq8orb8Ky9lxbqdYsK
	2AxO0Y/9Vm07JFco6wWbEA26uxByedmtzEkXw=
MIME-Version: 1.0
Received: by 10.229.205.92 with SMTP id fp28mr1894115qcb.213.1305767232812;
	Wed, 18 May 2011 18:07:12 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.229.213.200 with HTTP; Wed, 18 May 2011 18:07:12 -0700 (PDT)
Date: Wed, 18 May 2011 18:07:12 -0700
X-Google-Sender-Auth: BtM8lzUHnFAVglfP8Oj33EkcXsY
Message-ID: <BANLkTi=dUU3ynMuxBL2erSF6YHUfuPc8HQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES, OE-TSC meeting 5 May 2011
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
X-List-Received-Date: Thu, 19 May 2011 01:10:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Minutes: OpenEmbedded Technical Steering Committee meeting: 5 May 2011





     01) Agree on meeting chair


    //koen


    ___________________________________


     02) Status report on oe-core


    //got rid of srcrevs

//Paul E did some cleanup, spurious machines gone

//RP working on distroless patches

//fetch2 issues

>>khem assigned to hook commits to mailing list

>>RP to work on bitbake sync

>>decision on oe-core recommendation deferred to next TSC meeting


    ___________________________________


     03) Status report on pull model, contrib repo and guidelines


    //khem: no progress yet on creating a howto on pull requests

//upstream-status optional; yocto folks treating as mandatory

//patch script could be less vigorous on Cc list


    ___________________________________


     04) Status report on board support layer guidelines

>>Jefro to send rough document to fray this week, not done yet


    ___________________________________


     05) Status on layer splitting of metadata


    //discussion on precedence between  BBLAYER and BBPATH,
documentation of such

//docs in meta-openembedded/.../layer.conf


    ___________________________________


     06) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other


        "flags" discussion


      [ Proposed: Tom Rini ]


    >>take to mailing list


    ___________________________________


     07) Continue discussions on infrastructure items


    //yocto still has no sysadmin, infrastructure somewhat stalled

//RP working behind scenes


    ___________________________________



    elections

//several ideas floated, including adding one member to TSC, adding
non-voting members,

//moving discussions to mailing list more

>>RP to send note to list regarding wider participation





    (12:59:07 PM) koen: I volunteer to chair
(1:01:06 PM) ***Jefro notes koen as chair


    (1:01:16 PM) ***RP__ was getting caffeine


    (1:01:16 PM) koen: that's 1) done


    (1:01:31 PM) koen: when fray gets back: 2) oe-core status report


    (1:01:32 PM) Jefro: as well as 1.5) make sure RP__ has caffeine


    (1:01:54 PM) fray: almost done.. 1 more min


    (1:01:55 PM) ***khem needs to get some water before choking brb


    (1:02:14 PM) RP__: re: oe-core, we got rid of the srcrevs file :)


    (1:02:31 PM) fray: ok.. done.. when Khem gets back we're good..


    (1:02:53 PM) RP__: Paul E also wrote some patches to remove machines
    and distros from oecore which is some nice cleanup


    (1:03:05 PM) RP__: I'm mostly caught up on email so I'll be focusing
    on the distroless patches tomorrow


    (1:03:06 PM) fray: when we get to the oe-core discussion, I saw
    something from a conversation on IRC today about meta-oe and
    examples and such I want to bring up..


    (1:03:27 PM) ***RP__ is typing this on the assumption people can
    read backlog faster than I can type


    (1:03:48 PM) koen: fray: that's for 5) splitting of meta-data?


    (1:03:54 PM) khem: am here


    (1:04:24 PM) fray: seems reasonable


    (1:04:28 PM) fray: we'll do it in 5 then


    (1:04:35 PM) RP__: Any questions on where we're at with oe-core?


    (1:04:39 PM) RP__: or concerns?


    (1:04:42 PM) koen: so or 2): srcrevs in proper place, spurious
    machines gone


    (1:04:43 PM) RP__: everyone happy?


    (1:04:45 PM) Tartarus: One Q


    (1:04:49 PM) koen: s/or/for/


    (1:04:54 PM) Tartarus: What happened to hooking oe-core into the
    commit ML?


    (1:05:09 PM) Tartarus: Or since we assigned that to khem in absentia
    and no minutes yet (we understand Jefro), no action?


    (1:05:12 PM) koen: Tartarus: I think we didn't make an AI out of it


    (1:05:17 PM) RP__: Tartarus: Who was that action assigned to?


    (1:05:20 PM) ***khem did not know


    (1:05:27 PM) Tartarus: OK, sounds like what I suspected


    (1:05:27 PM) RP__: I think we need to talk to Khem about this


    (1:05:48 PM) khem: Do we want to add it to irc CIA ?


    (1:05:48 PM) fray: only oe-core question at this point is actually
    bitbake sync..  between the fetch2 and small bitbake issues.. is
    there anything else people need to be aware of?


    (1:05:52 PM) Tartarus: The kinda plan was to assign to khem since we
    know he has all the perms, but ESC has kept minutes from getting out
    before now


    (1:05:57 PM) RP__: khem: Quick summary, do you have access to be
    able to setup a commit mailing list. If not, who do we talk to?


    (1:06:01 PM) Tartarus: So this is the first he's hearing :)


    (1:06:16 PM) khem: mls are on ltg I have no admin privs on it


    (1:06:31 PM) khem: koen does


    (1:06:35 PM) koen: yes


    (1:06:40 PM) koen: but I have no access to the git hooks :)


    (1:06:48 PM) RP__: fray: bitbake sync has been a thorn for too long
    now. That is next on my todo after the distroless


    (1:06:51 PM) Tartarus: and it was re-use the same ml


    (1:06:53 PM) Tartarus: so just git hooks


    (1:06:54 PM) khem: I can set git hooks


    (1:07:15 PM) fray: RP__ good enough.. thats the only thing I keep
    seeing repeated when people mention oe-core or having problems with
    it..


    (1:07:18 PM) koen: so oe-core and meta-oe to oe-commits?


    (1:07:18 PM) khem: ok openembedded-core ml ?


    (1:07:25 PM) khem: or oe-commits


    (1:07:29 PM) Tartarus: oe-commits


    (1:07:31 PM) khem: ok


    (1:07:33 PM) khem: git it


    (1:07:38 PM) khem: consider is done next time


    (1:07:47 PM) khem: s/is/it


    (1:07:49 PM) stefan_schmidt: khem: thx


    (1:07:58 PM) RP__: This should really be under 7) but anyhow... :)


    (1:07:58 PM) koen: for the record: AI: khem will hook up commits to
    ml


    (1:08:07 PM) RP__: thanks khem :)


    (1:08:08 PM) khem: people have been asking for oe-core


    (1:08:14 PM) koen: fray: what kind of problemss?


    (1:08:15 PM) khem: when do we encourange folks


    (1:08:28 PM) khem: on TSCs behalf officially


    (1:08:38 PM) RP__: Main question now, wait untill distroless and
    bitbake is resolved?


    (1:08:41 PM) fray: koen, misc things not working, and having to
    manually set fetch2 in the nevironment..


    (1:08:45 PM) khem: ok


    (1:08:54 PM) stefan_schmidt: last time we wanted to have RP back
    from vacation


    (1:09:01 PM) RP__: fray: We have environment scripts in oecore which
    should avoid that?


    (1:09:06 PM) fray: (I thought the fetch2 thing was resolved
    already)..  what I'd like to see is the death of the Poky bitbake --
    or a clear understanding of the differences..


    (1:09:13 PM) ***RP__ is back from vacation now (sadly)


    (1:09:13 PM) khem: fray: that must be on classic OE I guess


    (1:09:21 PM) fray: RP__ I thought we did as well, but I'm stilling
    seeing people tell others on IRC they need to set fetch2 for it to
    work


    (1:09:32 PM) stefan_schmidt: hmm, if it will get resolved withi one
    week I would say wait. If not do it now.


    (1:09:45 PM) ***RP__ is aiming for a week


    (1:09:50 PM) stefan_schmidt: We are pushing the official encouraging
    back for some time now...


    (1:09:55 PM) khem: should we just call fetch2 as fetch


    (1:10:01 PM) ***RP__ is conscious of that :(


    (1:10:03 PM) fray: I'm not worried right now though.. bitbake sync
    is not forgotten so we should be ok


    (1:10:04 PM) RP__: khem: can't


    (1:10:15 PM) khem: ok


    (1:10:44 PM) khem: on oe-core status, I have been working on
    improving gettext which is almost done


    (1:10:51 PM) koen: khem: I updated setupscripts, local.conf is under
    git control now (expect some conflicts when doing git pull)


    (1:10:52 PM) khem: one patch is in ml


    (1:11:04 PM) khem: koen: noted


    (1:11:33 PM) koen: anymore for 2)?


    (1:11:56 PM) RP__: So to go back to the question, whemn do we make
    the recommendations for oe-core publicly ?


    (1:12:04 PM) stefan_schmidt: do we have a decision for the
    encouraging?


    (1:12:10 PM) RP__: I know we keep punting this, we've had good
    reasons


    (1:12:14 PM) khem: RP__: once distroless and bitbake is done


    (1:12:19 PM) stefan_schmidt: RP__: You think one week for both
    problems will do?


    (1:12:24 PM) Tartarus: Either next friday or we have a reason to
    punt at next weeks TSC


    (1:12:25 PM) ***RP__ hates to say it but I agree


    (1:12:30 PM) khem: may be distroless is more important


    (1:12:46 PM) RP__: We need to make sure people have a good
    experience


    (1:12:54 PM) koen: so after distroless or next friday, whichever
    comes first?


    (1:12:57 PM) khem: we need some documents on easy startup for folks
    to try it out


    (1:13:01 PM) stefan_schmidt: ok, decide on it next TSC?


    (1:13:19 PM) RP__: khem: Those can be worked on in parallel and I'd
    suggest someone other than me ;-)


    (1:14:11 PM) ***Jefro notes decision on oe-core recommendation
    deferred to next TSC meeting


    (1:14:21 PM) fray: I think distroless is needed.. and bitbake needs
    to work -- or be document whats "missing".. we can't require someone
    to use the poky bitbake (which I don't think is needed anyway)..


    (1:14:43 PM) koen: fray: I haven't used poky bitbake in months


    (1:14:45 PM) khem: fray: no its not needed angstrom uses upstream
    master


    (1:14:59 PM) ***fray notes he's not been using the poky bitbake with
    oe-core for more then a few weeks..


    (1:15:11 PM) fray: but the misc IRC reports make me a bit concerned


    (1:15:45 PM) koen: people suck at following instructions


    (1:15:50 PM) fray: :)


    (1:16:11 PM) RP__: bitbake does work but we need to bury that issue
    once and for all


    (1:16:13 PM) ***Jefro notes a good line for a bumper sticker


    (1:16:13 PM) koen: anymore for 2)?


    (1:16:17 PM) khem: I think we should clarify if such
    misunderstandings are seen


    (1:16:22 PM) khem: on irc


    (1:16:25 PM) RP__: koen: I'd move on


    (1:16:27 PM) koen: 3) status report on pull model, contrib repo and
    guidelines


    (1:16:58 PM) ***RP__ has nothing to add on this one at this time...


    (1:17:11 PM) koen: guidelines went out weeks ago


    (1:17:13 PM) khem: on 3. I have an AR to create a howto on
    publishing patches using pull requests and how to use contrib repors


    (1:17:26 PM) khem: I have not done it


    (1:17:41 PM) khem: that said should we have same model for meta-oe ?


    (1:17:52 PM) khem: or sending patches to ml and using pw is
    preferred


    (1:18:05 PM) stefan_schmidt: khem: up to the maintainers?


    (1:18:12 PM) fray: contrib guidelines -- I almost published rev 4,
    but sent it to paul menzel (person who commented the most on rev 3),
    and he responded back enough that I need to revise to 5.. but I
    think that should be near complete


    (1:18:27 PM) stefan_schmidt: Personally I like the cover-letter with
    pull URI but all patches as reply approach


    (1:18:39 PM) fray: biggest change is the addition of the
    upstream-status that we discussed last time.. paul had good comments
    on clarifying a number of the items there..


    (1:18:40 PM) koen: khem: there's a need for both, for small set
    (<5 patches) pw is nice, for larger pull requests


    (1:18:49 PM) stefan_schmidt: easy review on the ml and then pulling
    in. So contrib repo + patches


    (1:18:51 PM) khem: I would think so


    (1:18:59 PM) fray: he also suggested that upstream-status be a
    required field in patches, I've currently got it listed as
    optional.  (which is what we'd discussed last time)


    (1:19:07 PM) fray: I'm of the opinion optional for now, and we'll
    see how it goes..


    (1:19:10 PM) khem: right now pull scripts send out the patches as
    well to ml


    (1:19:16 PM) khem: which is kind of superset


    (1:19:46 PM) stefan_schmidt: fray: I would go for required for newly
    added patches


    (1:19:51 PM) fray: I intend to have rev 5 published to the list
    tomorrow..


    (1:20:06 PM) fray: stefan_schmidt ya, all of this is for new
    patches..  I can certainly change the verbage and make it mandatory
    for new patches..


    (1:20:15 PM) stefan_schmidt: fray: ok


    (1:20:28 PM) fray: (that was also the feedback from the yocto folks,
    they'd like it mandatory and have said they will be treating it as
    such for their contributions)


    (1:20:29 PM) koen: less people in cc: would help


    (1:20:43 PM) khem: might be just using git request-pull and send
    patches to ml approach


    (1:20:48 PM) koen: I keep having to increase the number of allowed
    recipients in mailman


    (1:21:10 PM) RP__: I must admit, the cc's are getting out of control


    (1:21:13 PM) khem: yeah sometimes I have one patch and I get 30
    emails addressed to me


    (1:21:23 PM) koen: RP__: after 25 I set it to 99


    (1:21:48 PM) koen: more on 03) or can we move on?


    (1:21:59 PM) RP__: Can someone look at making the patch script a
    little less enthusiastic about ccing people?


    (1:22:05 PM) khem: RP__: have you considered using git pull-request
    ?


    (1:22:33 PM) RP__: khem: Discuss that on the mailing list, there are
    people with viewpoints. Short answer is yes


    (1:22:44 PM) khem: ok


    (1:22:59 PM) stefan_schmidt: i'm fine with 03


    (1:23:02 PM) koen: let's move to 04) Status report on board support
    layer guidelines


    (1:23:08 PM) khem: I can take a look at pull-request script


    (1:23:38 PM) RP__: What actions do we have outstanding with bsp
    layer guidelines?


    (1:23:42 PM) fray: related to 4, but not 4 -- I've had a lot of
    people ask for these privately in the last week or so.. (ok.. 4
    people)


    (1:24:11 PM) koen: I think we need to sum up the discussions from
    ELC a bit better


    (1:24:23 PM) RP__: agreed. Who's going to do it? :)


    (1:25:04 PM) fray: I'm happy to copy-edit/correct it if someone else
    does the initial work


    (1:25:28 PM) koen: jefro put a lot in the minutes already


    (1:25:59 PM) Jefro: I can leverage from those minutes to create a
    more thorough document, but likely won't get to it until middle of
    next week


    (1:26:05 PM) fray: ya.. I'd like someone to pull out what they think
    are the right bits and send them to me.. I can take it from there
    (at least to the point of sending it out to the TSC for agreement)


    (1:26:31 PM) fray: if timing is ok, I can work with Jefro on it next
    week.. (middle/end of)


    (1:26:33 PM) Jefro: fray - action item to work on this together next
    week, circa tues afternoon or weds morning?


    (1:26:44 PM) fray: that sounds fine


    (1:27:10 PM) ***RP__ is reluctant to take on more actions right at
    the moment as I'm maxed out with various things :/


    (1:27:51 PM) ***Jefro is tempted to write "slacker" but thinks
    better of that impulse


    (1:27:52 PM) koen: besides creating that doc, anymore on 04)?


    (1:28:11 PM) fray: I'm good


    (1:28:26 PM) koen: 05) Status on layer splitting of metadata


    (1:28:36 PM) koen: fray: you have some input?


    (1:28:44 PM) fray: So the item I was referring to before is
    specifially on the BBPATH and BBLAYER in the meta-oe..


    (1:29:15 PM) fray: On the surface the BBLAYER seems to indicate the
    order that files/items are loaded.. but BBPATH within meta-oe
    actually preceeds the other paths, taking over precedence


    (1:29:15 PM) ***RP__ is missing context


    (1:29:43 PM) fray: this led to a lot of questions and a small
    discussion with a few new users, kergoth and myself earlier today..


    (1:29:52 PM) RP__: fray: BBLAYER doesn't control precedence


    (1:30:14 PM) RP__: It was never intended to either


    (1:30:27 PM) fray: what I'd like to propose with meta-oe (and other
    "oe" branded layers) is that we're absolutely sure that what we have
    is done in a way it can be an example for others.  If we have things
    in the layer that are not good examples, that it be clearly
    documented as such -- not to use them as examples as why


    (1:30:58 PM) fray: BBLAYER, I know that now, but didn't before..
    this caused confusion and specifically a problem with ordering for a
    user trying to override something in their own layer


    (1:31:03 PM) RP__: I'd imagine that most layers will give themselves
    priority over the core


    (1:31:13 PM) RP__: Its just the nature of customisations


    (1:31:14 PM) khem: yes I would think so too


    (1:31:28 PM) fray: I don't advocate code changes -- only that we
    document order and are consistent outselves with it..


    (1:31:53 PM) RP__: I do agree we should make this clear as I can
    imagine a new user getting confused by this


    (1:32:05 PM) fray: I've used it and I got confused by it... :)


    (1:32:06 PM) RP__: I do think it makes sense when you take a step
    back though


    (1:32:21 PM) koen: can someone explain the problem to me?


    (1:32:51 PM) fray: I understand it now.. but this is a place where
    what we do in meta-oe (as a primary layer) is going to affect others
    because they're going to duplicate hte layer setup and use it in
    their own.. so if we do something wrong thats going to be duplicated
    and live forever that way..


    (1:33:10 PM) fray: koen, in BBLAYERS someone had oe-core, meta-oe,
    their own layer..


    (1:33:25 PM) fray: they places some files in their own layer.. but
    meta-oe was being picked up instead of their files..


    (1:33:44 PM) koen: BBPATH needs to be that way, otherwise you can't
    override classes


    (1:33:46 PM) fray: this was due to the way BBPATH was being setup..
    someone suggested copying for meta-oe..


    (1:34:15 PM) khem: what is BBFILE_PRIORITY


    (1:34:25 PM) fray: this is exactly why we need to document in
    meta-oe WHY something is done the way it is..  so if its not an
    issue [or a layer doesn't need the ramifications] that it's clear..


    (1:34:38 PM) fray: otherwise people are going to copy and not
    understand why something is working or not..


    (1:35:22 PM) koen:
fray:http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/conf/layer.conf


    (1:35:24 PM) fray: (it was also mentioned BBPAT := ...:${BBPATH} is
    probably better implemented as BBPATH .= ...)


    (1:36:03 PM) RP__: := was there for a reason originally although I
    think we don't need to do that anymore


    (1:36:16 PM) khem: BBPATH .= ":${LAYERDIR}"


    (1:36:19 PM) koen: all hell broke lose with .= 6 months ago


    (1:36:20 PM) khem: would be good


    (1:37:09 PM) khem: and BBFILES += could be used instread of BBPATH
    :=


    (1:37:19 PM) khem: err BBFILES :=


    (1:37:46 PM) fray: anyway.. the details are less important then the
    ramifications..  we need to make sure that meta-oe (and other oe
    branded layers) are "perfect" so they can be good examples.. if
    there is something in them that shouldn't be used as an example we
    clearly document that inline "don't do this"


    (1:38:01 PM) khem: they almost are


    (1:39:09 PM) ***Jefro posits a question - who handles documentation
    in OE to make sure it is approachable, complete, correct...?


    (1:39:12 PM) fray: (BTW I spoke wrong before, you are right.. BBPATH
    of the last laster specified takes priority over "lower" layers.. so
    the ordering of BBPATH is correct..)


    (1:39:37 PM) RP__: Jefro: This has always been a problem


    (1:39:47 PM) fray: Jefro, I'm not sure.. the best I can recommend is
    we be vigilent as we do our work, and as maintainers commit
    patches..


    (1:39:48 PM) RP__: Jefro: "nobody"?


    (1:39:54 PM) fray: (and if we see anything wrong, we fix it ASAP)


    (1:40:01 PM) fray: i.e. treat it as a bug not a feature.. ;)


    (1:40:06 PM) RP__: Jefro: Its a community effort so not one specific
    person


    (1:40:19 PM) koen: so looking at
    http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/conf/layer.conf
    what more docs are needed?


    (1:40:20 PM) Jefro: RP__ fray understood - perhaps a documentation
    maintainer might be in order at some point


    (1:40:36 PM) RP__: Jefro: Its a community and no volunteers


    (1:40:40 PM) fray: koen, what I see there is fine.. that didn't get
    pasted when we were discussing it earlier


    (1:40:50 PM) RP__: Jefro: Hence why we have a tech writer on Yocto
    staff to try and help


    (1:41:10 PM) fray: the only thing (based on the earlier) is the .=
    and += as appropriate.. if we're concerned about bitbake behavior we
    deal with it as appropriate..


    (1:41:31 PM) fray: but I think we have to assume bitbake, oe-core
    and meta-oe all "work".. and if they don't fix it ASAP


    (1:42:12 PM) fray: if for instance .= didn't work.. a comment of "#
    Would prefer to use .=, but as of XXXXX it does not work properly"


    (1:42:29 PM) fray: that should make it fairly clear it's a temporary
    workaround...


    (1:42:48 PM) fray: (I just hate it when workarounds become
    perminent, especially in things people use as examples)


    (1:43:15 PM) fray: ok.. I think I covered the issue I was concerned
    with based on the earlier IRC discussion


    (1:43:16 PM) RP__: The trouble was LAYERDIR really needed immediate
    expansion


    (1:43:30 PM) RP__: kergoth added "hacks" to bitbake to make it do
    that internally


    (1:43:44 PM) khem: koen: we need to documents earch entry in
    layer.conf to make clear its purpose


    (1:43:56 PM) RP__: "hacks" in the sense that it doesn't gel well
    with the usual way bitbake works


    (1:43:57 PM) fray: if thats the reason for the := vs .=, then we
    should add that


    (1:44:03 PM) ***Jefro just remembered a 2pm appt - will leave IRC
    logging on to capture rest of meeting & will send out notes. Be
    sure to discuss voting at some point.


    (1:44:26 PM) khem: RP__: .= works well


    (1:44:29 PM) khem: now a days


    (1:45:18 PM) koen: if someone can test .= and send me a patch :)


    (1:46:00 PM) khem: koen: I will do


    (1:46:03 PM) khem: infact I have it local


    (1:46:18 PM) khem: its tested a bit but I will run more


    (1:46:37 PM) khem: are we done with agenda


    (1:46:41 PM) koen: ok


    (1:46:59 PM) koen: 06) DISTRO_FEATURE/MACHINE_FEATURE/libc features
    and other


    (1:47:04 PM) koen: can we do that on the ml?


    (1:47:10 PM) RP__: I think we need to


    (1:47:17 PM) Tartarus: That's been the AI since RP proposed the "i
    don't like it but..." idea


    (1:47:22 PM) fray: we do need to do it on the ML.. we've just been
    bad at it.. :(


    (1:47:31 PM) Tartarus: I hope that once we get other stuff that's
    higher priority sorted, this might get some attention


    (1:47:46 PM) ***fray notes question came up today is DirectFB a
    potential "feature".. </rhetorical>


    (1:47:51 PM) RP__: I've been hoping someone can come up with
    something less nasty


    (1:47:57 PM) fray: Tartarus, thats my feeling


    (1:48:12 PM) RP__: I think we do have bigger issues and we'll get to
    this


    (1:48:22 PM) koen: let's move on


    (1:48:23 PM) koen: 07) Continue discussions on infrastructure items


    (1:48:39 PM) ***RP__ notes Yocto is having sysadmin issues still :(


    (1:48:48 PM) RP__: This has a ripple effect in various ways


    (1:49:45 PM) stefan_schmidt: any items for this?


    (1:50:13 PM) khem: I have setup angstrom builds on garnet using
    oe-core


    (1:50:24 PM) khem: for 5 arches


    (1:50:43 PM) khem: its needs more automation


    (1:50:49 PM) koen: OE needs more hw and $$$$


    (1:51:33 PM) khem: It finished 5 arches in 22 hrs


    (1:51:35 PM) ***RP__ is continuing to work on more hw


    (1:51:40 PM) khem: console-image


    (1:51:47 PM) khem: so nightly is still possible


    (1:51:49 PM) RP__: koen: what else are the $$$$ for?


    (1:52:04 PM) khem: RP__: marketing may be


    (1:52:11 PM) koen: things like gbit switches


    (1:52:17 PM) koen: and hosting in europe


    (1:52:47 PM) RP__: I suspect there would be more success with
    specific targeted requests for funding those things


    (1:52:59 PM) koen: tom had a list that went to the board


    (1:53:06 PM) koen: not sure what happened to that


    (1:53:34 PM) fray: likely wroth pinking them about


    (1:53:36 PM) ***RP__ should ping Mike and find out whats going at
    the LF wrt hardware


    (1:53:40 PM) fray: 'er.. pinging them


    (1:54:03 PM) koen: And ping Sean about the blades


    (1:54:05 PM) khem: RP__: that would be nice


    (1:54:07 PM) RP__: pinking is what damaged my MGB engine :(


    (1:55:20 PM) fray: heh


    (1:56:03 PM) RP__: so before we run out of time, elections?


    (1:56:20 PM) khem: it was me up for it right ?


    (1:56:26 PM) RP__: I assume people saw the email from Frans, upset
    as we've outstayed our welcome as a TSC :/


    (1:56:29 PM) stefan_schmidt: well


    (1:56:46 PM) stefan_schmidt: I wonder for some time now if it would
    make sense for me to go first


    (1:56:48 PM) RP__: I do think we've worked well as a group
    personally speaking


    (1:56:59 PM) fray: I was surprised because for some reason I thought
    beginning of may was the first election and the election cycle took
    a month..


    (1:56:59 PM) koen: isn't frans upset with the world in general?


    (1:57:04 PM) RP__: stefan_schmidt: on what grounds?


    (1:57:09 PM) khem: heh


    (1:57:10 PM) stefan_schmidt: I don't have enough time at hand and
    you are all more involved


    (1:57:19 PM) RP__: fray: I think we've just lost track of time a
    little


    (1:57:28 PM) fray: RP__ certainly possible..


    (1:57:38 PM) khem: so lets go as planned


    (1:57:39 PM) RP__: At the end of the day, its not as if this is
    intentional, just we didn't get the organisation quite right


    (1:57:46 PM) stefan_schmidt: RP__: I like it here, no daubt. Just
    pondering if it would be better to keep khem...


    (1:58:00 PM) fray: stefan_schmidt it's important to get input into
    this from people not working on the same aspects every day.. which
    is why I think this group works well


    (1:58:05 PM) RP__: stefan_schmidt: We don't know what the vote will
    result in :)


    (1:58:34 PM) stefan_schmidt: hmm, wasn't the first one going out
    without a chance coming back as we are to much people?


    (1:58:52 PM) Tartarus: That was another valid point


    (1:59:06 PM) Tartarus: The interim TSC was previous size + 1


    (1:59:27 PM) Tartarus: So we need to sort that out before the end of
    the rolling elections for sure


    (1:59:27 PM) koen: the emails this week implied that the last one
    wasn;t getting reelected


    (1:59:37 PM) fray: in the end one person would be gone for sure...


    (1:59:38 PM) RP__: I have an idea


    (2:00:10 PM) stefan_schmidt: everybody waits :)


    (2:00:10 PM) RP__: As a TSC, we could invite wider participation in
    the meetings


    (2:00:17 PM) fray: (but as mentioned before, I'm not against
    suggesting to the board we increase the size of the TSC by 1...


    (2:00:30 PM) RP__: The expectation would be the TSC members would be
    voting and attending but others could attend and join the discussion


    (2:00:32 PM) fray: ...or as RP__ says, add non-voting TSC members..
    (we've kind of done that with Jefro already)


    (2:00:46 PM) RP__: Now this raises ugly questions like who and how


    (2:00:55 PM) RP__: but it is something we could do


    (2:01:26 PM) fray: to me it makes sense both that we ask people to
    join (if we feel their contributions can help the TSC) as well as
    other people interested in helping the TSC offer to join
    themselves..


    (2:01:38 PM) RP__: We haven't ever voted on anything as a TSC afaik
    which is different to how the TSC previously operated


    (2:01:40 PM) fray: the big thing (in the words of the LF) is the
    general rule "Don't be an asshole"


    (2:01:52 PM) fray: so far concensus has worked well


    (2:01:56 PM) RP__: fray: I just worry about people then feeling left
    out


    (2:02:04 PM) Tartarus: A big concern about adding more people is we
    can't find a good time for everyone now


    (2:02:16 PM) RP__: Tartarus: The time has to work for the elected
    members


    (2:02:27 PM) Tartarus: Yes


    (2:02:27 PM) koen: we could also move discussions more to the ml


    (2:02:27 PM) fray: well the appointed (or eventually elected) would
    set the time.. the others would have to make due..


    (2:02:30 PM) RP__: Tartarus: anyone else then becomes "if they can
    make it"


    (2:02:46 PM) fray: koen, and I think that is going to happen once we
    get beyond this initial oe-core / meta-oe bump


    (2:03:11 PM) RP__: I do think we'd benefit from wider input that the
    5. I also think the core 5 voting people makes for a good decision
    making entity


    (2:03:30 PM) fray: seems reasonable to me..


    (2:03:45 PM) fray: I'm on the TSC to give input more then to
    "vote"..


    (2:03:49 PM) RP__: Take the discussion to the mailing list?


    (2:03:56 PM) khem: yes


    (2:03:57 PM) RP__: if so, which list?


    (2:04:06 PM) khem: oe-members


    (2:04:13 PM) fray: if we are forced down into a vote, most likely
    the issue is contenious enough that we may need to be go in a
    different direction...


    (2:04:24 PM) ***fray notes he's not yet an oe-member..


    (2:04:37 PM) ***fray has sent his "application" to join the e.V.


    (2:04:51 PM) RP__: fray: A vote isn't something to be afraid of.
    I've seen much more damage from not making a decision than from
    making one


    (2:05:09 PM) stefan_schmidt: so we agree on wider audience


    (2:05:09 PM) koen: RP__: or not doing anything


    (2:05:15 PM) RP__: koen: right


    (2:05:16 PM) fray: RP__, I absolutely agree with you..  if a
    decision needs to be made, we (TSC) need to make it..


    (2:05:25 PM) ***RP__ has watched these various approaches happen


    (2:05:26 PM) fray: nothing is worse then "no decision" when you need
    one..


    (2:05:42 PM) koen: be right or be wrong, just do something


    (2:05:48 PM) khem: decisions on tech issues you mean ?


    (2:06:04 PM) RP__: things are generally self correcting. If you get
    it wrong, it usually becomes clear quickly :)


    (2:06:36 PM) RP__: ok, I'll send something to the members list about
    wider participation





    --
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

