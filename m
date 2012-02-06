Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RuYP2-0000Jb-Nh; Tue, 07 Feb 2012 00:55:21 +0100
Received: by iaby12 with SMTP id y12so9865817iab.6
	for <multiple recipients>; Mon, 06 Feb 2012 15:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=1dUw4/PdIY70y/ruIZbIDw+IkBTFLsHTYXu1omSlLRo=;
	b=K3UajKgqtCIAeIj5HL5gc7LgWkruk/Gps3QgRNvCqdpP2D4/zxHnI1freJYMCTxMCQ
	450p66DG+/C0GCOMrg6MfAG/mNkvaVkywycI1CXxFrbs+0b5o5WPen3zGhb7C5KUNoRg
	2lV4shWlFsAP1Q2KR+BJ0Bl5CEs1eN/9GCW0k=
MIME-Version: 1.0
Received: by 10.42.146.202 with SMTP id k10mr19337938icv.13.1328572038127;
	Mon, 06 Feb 2012 15:47:18 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.209.9 with HTTP; Mon, 6 Feb 2012 15:47:18 -0800 (PST)
Date: Mon, 6 Feb 2012 15:47:18 -0800
X-Google-Sender-Auth: O6wpaKZukGDflYfg7CtW62I9Aeg
Message-ID: <CA+YB3rZD5QS=aVtAiA_Jiqqfu4Pg3G6ojF=o2iYN4b1r3ZOXvw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes: 30 January 2012
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
X-List-Received-Date: Mon, 06 Feb 2012 23:55:21 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8e9c641f5104b85448c2

--90e6ba6e8e9c641f5104b85448c2
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
30 January, 2012

Attending: Khem, Richard, Mark, Tom, Paul
Minutes: Jefro

1. pick a chair
Paul

2. new issues
   a. meta-oe organisation discussion
      too wide in scope, images that work with oe-core break with meta-oe
      discussion ongoing on mailing list
      Paul to ping Koen for feedback

   b. elections
      fray is next, RP will tickle board -> done

   c. distro features
      all to reply to paul's email
=>    Paul to file bug to implement distro features backfill
=>    Paul to file bug to implement psplash issue already discussed

   d. gitpkgv.bbclass merge
      good functionality, needs some work to be accepted

   e. meta-ti working with oe-core
      positive discussion on meta-ti list

3. TSC meetup at ELC
   jefro to set up breakfast Thurs morning 8am -> done
   NOTE: if members can't get there on time, can arrange a later session
=> bring thoughts to ELC for retrospective

4. Status report on oe-core
     better sstate reuse reported by Koen and others
=>   communicate to oe-core list in late Feb, agendize

5. Infrastructure
     melo has retired
     patchwork issues - less value for bitbake & oe-core

6. Action Review:
   Khem/Fray: Flagging on wiki for OE version
   Khem: OE default source mirror


Raw Transcript:


[17:07] --> You have joined the channel #oe-tsc (~paul@pdpc
/supporter/professional/bluelightning).
[17:07] <fray> :)
[17:08] *** Channel modes: no colors allowed, no messages from outside,
topic protection
[17:08] *** This channel was created on 14/02/2011 14:28.
[17:08] <RP__> bingo!
[17:08] <RP__> (full house)
[17:08] <bluelightning> sorry guys
[17:08] <khem> on agenda items I would like to add meta-oe organisation
discussion
[17:08] <RP__> Jefro: has an agenda at http://pastebin.com/vef1520V
[17:08] <Jefro> khem: ok
[17:09] <RP__> we need someone with four legs?
[17:09] <Jefro> should we dive in? who wants to chair?
[17:09] <RP__> or alternatively, I like chesterfields (as a type of chair)
[17:10] * fray suggestions bluelightning
[17:10] <fray> suggests even
[17:10] <bluelightning> ok, I'll do it
[17:10] * Jefro notes bluelightning as taskmaster
[17:11] <bluelightning> ok, so we have Khem's item to add to the agenda
[17:12] <Jefro> bluelightning: agenda in brief: meta-oe, elections, distro
features, tsc meetup, oe-core status, infrastructure, deferred items from
last time
[17:12] <bluelightning> ok, let's discuss meta-oe then
[17:12] * RP__ had forgotten to ping the board but has done so now
[17:13] * Jefro marks that one "done"
[17:13] <bluelightning> I presume you all saw the discussion on the mailing
list which I started?
[17:13] <fray> yes, I did not comment as I saw active participation from
others (non TSC others)
[17:13] <RP__> bluelightning: which list?
[17:13] <fray> I have no additional comments, I think it looked good..
[17:13] <bluelightning> RP__: oe-devel
[17:13] <khem> so for experiment I added meta-oe to layers and did a
core-image-sato build on oe-core and it did not boot where as pure oe-core
works well
[17:13] <fray> (I assume this is the pulseaudio/distro features one
correct?)
[17:14] <khem> fray: meta-oe seems to infringe too much into oe-core
[17:14] <bluelightning>
http://article.gmane.org/gmane.comp.handhelds.openembedded/50131
[17:14] <bluelightning> fray: no, this is another thing
[17:15] <fray> ohh, no I didn't see that one
[17:15] <khem> so there is a discussion to divide it down
[17:15] <bluelightning> khem: it's just an organisation issue as well as
the general need to merge/justify items currently in there
[17:15] <fray> I saw the talk of the reorginization of meta-oe..  The
original talk from last week was reasonable..
[17:15] <fray> it's an orginizational issues as well as a "we don't want
that to become a dumping ground" issue
[17:15] <khem> yes, we need to reorganize the layer a bit so that it
becomes a nicer addon
[17:16] <khem> and may be split it into different layers
[17:16] <fray> perhaps the answer is simply we need to keep re-evaluating
it at release points of oe-core?
[17:16] <khem> I have locally moved toolchain bits into a separate layer
[17:16] <khem> fray: yes
[17:17] <bluelightning> I think that's a good idea
[17:17] <RP__> I am worried that images that work with oe-core, break with
meta-oe
[17:17] <khem> right now it engulfs too much ranging from toolchains to
bootloaders
[17:17] <bluelightning> indeed
[17:17] <RP__> Do we know why?
[17:17] <khem> its too wide in its scope
[17:18] <RP__> is the proposal one repo with different elements that can be
added in or different repos?
[17:19] <RP__> I think I'd be in favour of splitting, if it remains one repo
[17:19] <khem> one repo with different meta-*
[17:19] <khem> yes
[17:19] <RP__> that does seem reasonable given the different functionality
areas identified
[17:19] <bluelightning> RP__: fine with one repo, just multiple layers
[17:19] <fray> multiple layers - one repository?
[17:19] <khem> I think we need to make meta-retired meta-extra
meta-toolchain for sure
[17:20] <fray> i.e. you check out meta-oe -- and get meta-oe/meta-....
[17:20] <khem> no
[17:20] <fray> then the user can choose to include all of meta-oe or just
components?
[17:20] <khem> meta-openembedded/meta-*
[17:20] <khem> fray: they will be independent layers
[17:21] <RP__> fray: I think khem means yes
[17:21] <fray> what I was thinking is if the bblayers includes
meta-openembedded they would get all of the items.. otherwise they could
selectively include just the bits they want
[17:21] <khem> just managed unders one repo meta-openemebedded like we do
for meta-gnome etc.
[17:21] <bluelightning> fray: it could be set up to work that way but I'm
not sure there's much value in it
[17:21] <khem> fray: meta-openembedded = repo
[17:21] <fray> ya, I think we're talking the same thing on the repo side..
[17:21] <khem> not layer
[17:21] <RP__> fray: bblayers needs  a config file and I'm not sure we're
tried the "all" approach you've described
[17:21] <fray> bluelightning value is that it doesn't change existing
behavior.. but gives more flexibility
[17:21] <RP__> fray: it could probably be made to work but likely will
confuse people
[17:21] <fray> RP__, I thought you could include other files within the
one..
[17:22] <bluelightning> fray: meta-openembedded already consists of
multiple layers, of which meta-oe is one (and the one we're discussing here)
[17:22] <fray> so the layers.conf of meta-openembedded would include the
ones from the sub layers.. (maybe it's not that easy)
[17:22] <khem> I am seeing folks asking for recipes on yocto lists which
are there in meta-oe
[17:22] <khem> but they can not use it easlity
[17:22] <fray> ahh, ok.. I understand
[17:22] <khem> since meta-oe will bring them more than what they need
[17:22] <bluelightning> yes, it's hard to recommend meta-oe as a layer just
for the additional recipes right now
[17:22] <RP__> So why are we discussing this? Is the list at deadlock?
[17:22] <khem> correct
[17:22] <fray> what I've done before is pull just the recipes out of
meta-oe I need, but I don't normally use the layer as-is
[17:23] <RP__> or did that thread reach a conclusion?
[17:23] <bluelightning> I'm not sure it is a deadlock
[17:23] <khem> its not deadlock,
[17:23] <RP__> the problem is a lack of conclusion?
[17:23] <khem> we need to find someone to look after new layers
[17:23] <RP__> I'm trying to figure out what our role as the TSC is here
[17:24] <bluelightning> the thread has largely petered out, but I did not
see a response from the current meta-oe maintainer
[17:24] <bluelightning> perhaps I should ping koen
[17:24] <khem> yes
[17:24] <RP__> bluelightning: do that and see where we're at
[17:24] <bluelightning> ok
[17:24] <-- Jefro has left this server (Ping timeout: 240 seconds).
[17:24] --> Jefro__ has joined this channel (43cb5922@gateway
/web/freenode/session).
[17:24] <Jefro__> sorry all - I'm back now
[17:25] <-- Jefro__ has left this server (Changing host).
[17:25] --> Jefro__ has joined this channel (43cb5922@gateway
/web/freenode/ip.67.203.89.34).
[17:25] <bluelightning> let's move onto the next item.. elections
[17:25] <khem> ok move on
[17:25] <fray> I'm up next, RP pinged.. anything else?
[17:25] <RP__> btw, on a related note, I should give the group a heads up
on a discussion on #yocto with otavio recently
[17:26] <khem> RP__: on what topic
[17:26] <RP__> he wanted to merge gitpkgv.bbclass into oe-core as is. I
suggested that some of it should really be integrated with the bitbake
fetcher first
[17:26] <bluelightning> ok sounds like the elections issue is done, so
let's cover that now
[17:26] <RP__> He is rather unhappy about this and wants to do that "later"
[17:27] <RP__> He is going to bring this up on the mailing list and if I
maintain my stance, probably bring to the TSC
[17:27] <fray> I think it's reasonable for him ot bring it up and do it
that way..
[17:27] <khem> but I think its good idea to have gitpkgv as a functionality
[17:27] <fray> I'm not familiar with the actual implementation though..
[17:27] <bluelightning> RP__: he did post the patch FYI, not sure if you
saw it
[17:27] <RP__> bluelightning: ok, I need to give feedback then
[17:28] <RP__> I agree its good functionality, I just think it should be
adapted to fit into the fetcher cleanups and other work being done to
improve things in OE-Core
[17:28] <khem> RP__: nod
[17:28] <bluelightning> so onto the next issue - distro features
[17:28] <RP__> fetcher functionality in one place with a standardised API
is a good thing IMO
[17:28] <bluelightning> I agree
[17:29] <khem> RP__: yes fetchers is right place
[17:29] <RP__> I just wanted to bring this up here since I suspect there
will be some friction
[17:29] <fray> just to verify, point of the code is a smaller (more simpl)
PV right?
[17:29] <RP__> fray: yes
[17:29] <RP__> bluelightning: where is that at now?
[17:29] <fray> ok..  I've heard of a lot of requests for that from
coworkers.. ;)
[17:30] <RP__> fray: well, its a smaller PV in the output packages
[17:30] <RP__> fray: The PV used in the build system is still long
[17:30] <bluelightning> RP__: waiting for "someone" (probably me) to
implement it as discussed I think
[17:30] <fray> yes..  thats what people have requested from me before..
 (they don't care so much about the internal values)
[17:30] <RP__> bluelightning: that's what I thought
[17:30] <fray> but I agree, start with the fetcher and work toward the
package creation is the best approach..
[17:31] <bluelightning> AR to me - file a bug to implement distro features
backfill
[17:31] * Jefro__ notes bluelightning
[17:31] <bluelightning> another AR - file a bug to implement psplash issue
discussed 2 meetings ago as well
[17:31] <bluelightning> (also to me)
[17:31] <fray> Ahh I thought that had been done already.. :)
[17:32] * RP__ would like to note for the record the positive thread on the
meta-ti list about their layer working with OE-Core and not depending on
meta-angstrom/meta-oe
[17:32] <bluelightning> yes, I'm very happy to hear that's being worked on
[17:32] <RP__> that would be nice progress towards the layer model really
starting to work
[17:33] <fray> very cool..
[17:33] * RP__ thought it worth acknowledging here :)
[17:33] <bluelightning> ok, let's move onto "TSC meetup"
[17:33] <khem> yes indeed
[17:33] <Tartarus> ELC, I'll be there, not for yocto dev day tho
[17:33] <Tartarus> iirc the invite went out for the 15th, AM tho, yes?
[17:34] <RP__> None of these things made my calender :(
[17:34] <fray> I'll be at ELC for Yocto Dev Day (Tuesday) through Friday
[17:34] * RP__ notes to self to import them
[17:34] * bluelightning won't be there but has confirmed the TSC meeting
invite assuming teleconf availability
[17:35] * RP__ will be there Tue-Fri
[17:35] <khem> I am registed starting yocto dday
[17:36] <RP__> Anything specific we need to discuss?
[17:36] <Jefro__> you should have a calendar invitation for Weds morning
8am, and I have a room reserved.  we can meet earlier for a full breakfast
if there is the desire to do so.
[17:36] <fray> Unlike last year, I can't think of anything other then
normal meeting stuff..
[17:36] <Tartarus> I'll probably be there right around 8, depending on
airport shuttle, etc
[17:36] <Tartarus> iirc I land 7:15a or so
[17:36] <fray> if we do want to work on rearranging meta-oe, it might make
sense towork on it in person
[17:37] <khem> I will try to be there by 8 traffic permitting
[17:37] * RP__ will be there by 8 or earlier depending on the jetlag
[17:37] * RP__ suspects he could make 5 quite easily :/
[17:37] <khem> heh
[17:38] <fray> :)
[17:38] <khem> 5a will be a bit late for me :)
[17:38] <RP__> A kind of retrospective might be useful
[17:38] <Jefro__> there will be a continental breakfast for those who can
eat at the crack of 8
[17:38] <Jefro__> continental lunch for RP
[17:38] <RP__> What is going well and anything we need to improve
[17:38] <RP__> Jefro__: :)
[17:39] <khem> RP__: yes. and any new ideas
[17:39] <RP__> A lot has happened in the last 18 months :)
[17:39] <khem> RP__: per recipe sysroots e.g. :)
[17:39] <RP__> khem: there is an ehancement bug for it
[17:40] <RP__> but it would be good to discuss priorities and so on
[17:40] <fray> ya.. I think a recap would be good for the year.. do we have
any obligation (or desire) to report to the board/e.V. members what we as
the TSC have done/observed for the past year?
[17:40] <khem> RP__: I would like to see a meta-benchmark
[17:40] <RP__> fray: we have no obligation but nothing to stop us either
[17:40] <fray> ok.. might be worth us doing...
[17:40] <bluelightning> khem: feel free to tack that onto the mailing list
discussion, there's already recipes-benchmark in meta-oe
[17:40] <fray> bullet points, that kind of thing..
[17:41] <RP__> AR: Everyone: To bring thoughts to ELC
[17:41] <fray> yup
[17:41] <bluelightning> ok, shall we move onto OE-core status?
[17:41] <khem> ok
[17:42] <RP__> we're pretty green onmaster
[17:42] <RP__> proposed patches have thrown up regressions so we're trying
to fix before merging
[17:42] <RP__> fixed some nasty useradd+sstate issues last week
[17:42] <RP__> also finally got to the bottom of the machine switching
sstate issue
[17:42] <fray> RP__ the fix was before or after the version bump on bitbake
(requires version)
[17:43] <fray> ?
[17:43] <RP__> Koen+Martin have reported better sstate reuse now
[17:43] <bluelightning> RP__: excellent!
[17:43] <khem> I am working on kmod in hiatus
[17:43] <RP__> fray: after
[17:44] <khem> RP__: I have used sstate quite a bit now its been decent on
me
[17:44] <RP__> khem: great :)
[17:44] <khem> I actually keep *native* and *cross*
[17:44] <khem> and delete everything
[17:45] <RP__> Its taking some work but I think its really starting to help
[17:45] <khem> that just builds the target bits quite fast
[17:45] <RP__> any questions/concerns on oe-core?
[17:45] <khem> RP__: I wish if I could tell category of recipes to rebuild
even when using sstate
[17:46] <RP__> khem: based on what?
[17:46] <khem> RP__: may be recipe names
[17:46] <RP__> khem: you can invalidate the sstate cache in interesting
ways by changing the checksums
[17:46] * Jefro__ says time check: 15 mins left
[17:46] <RP__> khem: you know about -c cleansstate
[17:46] <khem> RP__: yes
[17:47] <khem> RP__: I guess its not that urgent of a need since stuff I do
is not common anyway
[17:48] <Jefro__> RP__ question - how much of this behavior is documented?
[17:48] <RP__> Jefro__: everything I've talked about
[17:48] <RP__> Jefro__: I worked with Scott to document sstate
[17:48] <Jefro__> ok, cool - in yocto docs? will oe folks think to look
there?
[17:48] <khem> someone should summarize sstate in detail if not yet done in
wiki
[17:49] <khem> how to use it and how to not use it. etc.
[17:49] <RP__> khem: its in the manuals
[17:49] <khem> ok
[17:49] <RP__> khem: based on an email from me
[17:49] <RP__> so the docs are out there for anyone to find
[17:49] <RP__> Jefro__: I'd hope they would
[17:50] <RP__> Jefro__: At this point its the most complete manual set on
the subject
[17:50] <bluelightning> ok, remaining issues are "infrastructure" and
deferred items from last time ("Flagging on wiki for OE version", "OE
default source mirror")
[17:50] <bluelightning> shall we try to cover those in 10mins?
[17:51] <khem> both my ARs are still open
[17:51] <RP__> I'm not sure there is much to cover about infrastructure
[17:51] <khem> not much but old melo has retired
[17:52] <khem> on patchwork I think with bitbake there is a problem
[17:52] <khem> since it catches bitbake-devel ml and commit mails also go
to bitbake-devel
[17:52] <khem> it catches the patches both the times
[17:53] <khem> it is preferred to have commit mail be sent to bitbake-devel
?
[17:53] <fray> Hmm.. patchwork doesn't have a way to determine it's the
same patch?
[17:53] <khem> fray: no
[17:53] <khem> although it would be neat
[17:54] <khem> but there is patch and then commits etc.
[17:54] <fray> ok.. for some reason I thought it kept an md5sum or
something of the patch and used that to correlate original patches and
updates..
[17:54] <RP__> Part of the problem is likely that some of us send bitbake
patches with a path prefix of bitbake/
[17:54] <khem> fray: well yes but in this case mail is sent after the patch
has been closed
[17:54] <fray> Ahh I see.. ok
[17:54] <RP__> I just strip it off but it probably confuses patchwork
[17:55] <fray> would it be possible to tag the patches from Saul/RP that
are integration patches (vs original work) and blacklist them?
[17:55] <bluelightning> just filter out "CONSOLIDATED PULL" ?
[17:56] <bluelightning> I think he always includes that in the subject of
0/x at least
[17:56] <fray> thats kind of what I was thinking
[17:56] <khem> actually there is less value for bitbake and oe-core in
patchwork
[17:56] <khem> only people refer to them sometimes
[17:56] <bluelightning> well, oe-core is not handled at all and that means
it's full of old patches
[17:56] <khem> only meta-oe uses it effectively to manage patches we can
even turn it off for bb and oe-core
[17:57] <fray> ya, sounds like we either need to filter it for consolidated
pulls -- or simply avoid the issue by turning it off as khem says..
[17:58] <khem> I guess I can ask the ml and get opinions on having pw
turned on for bb and oe-core
[17:58] <fray> I don't see a lot of references in the mailing list ot
patchwork (for oe-core)..
[17:58] <khem> fray: yes its occasional
[17:58] <khem> on IRC etc.
[17:58] <fray> ahh ok..
[17:59] <fray> I'd sugges tthen we start with the filter approach, and if
that doesn't work try something else.. I assume it uses something like
procmail to get access to the mail messages..
[17:59] <fray> if so we should be able to filter certain emails easily.. if
not, I'm not sure
[17:59] <khem> I think its useless if its not used there is no point in
tracking the patches
[17:59] <RP__> The workflow I've been using doesn't use patchwork
[17:59] <fray> I think it all comes down to member usage.. if people want
to use it, and we can support it.. we should..
[17:59] <khem> but if people think its so critical we can keep it
[17:59] <khem> RP__: yes thats why
[18:00] <fray> but we don't current use it -- so in that case, if it's not
useful we just disable it
[18:00] <khem> yes
[18:00] <bluelightning> khem: if we had the commit hook it would be useful
so that missed patches can at least be viewed
[18:00] <bluelightning> otherwise it's more or less worthless
[18:00] <fray> I have no objection to removing it from oe-core/bb other
then oe users who want it
[18:00] * RP__ has pretty good records of missed patches :/
[18:00] <khem> bluelightning: the way patches flow in ml its hard
[18:01] <RP__> its why my inbox is growing out of control :(
[18:01] * bluelightning did not mean to cast any aspersions
[18:01] <khem> since patches go into ml and then Saul picks them and
resends them to same ml
[18:01] <khem> its a bit not pw like
[18:01] <bluelightning> fair enough, if the tool doesn't really work
there's not much point in keeping it
[18:02] <khem> I would think so
[18:02] <bluelightning> I think we have a standing order to evaluate
patchwork and tools like it but we haven't got to that yet
[18:02] <khem> we can keep it only for meta-oe
[18:02] <khem> since thats handling the patches with it
[18:03] <bluelightning> plus any other layer that uses oe-devel ml for
patches (I use it for meta-handheld / meta-opie FWIW)
[18:03] <bluelightning> or rather, I keep it up-to-date for those layers
[18:03] <khem> yes infact any patches that go into oe-devel are groked
[18:04] * RP__ needs to go I'm afraid
[18:04] <RP__> I think we're pretty much done anyway
[18:04] <RP__> ?
[18:04] <khem> btw. Phil mentioned this on IRC that yocto point to oe.org to
obtain sources probably it should use github mirror addy
[18:04] <fray> ya, I think we are..
[18:05] <bluelightning> I think we've covered our agenda at least
[18:05] <khem> yes
[18:05] <khem> adjourned
[18:05] <fray> khem, I thought that pointer from yocto to oe.org was
deliberate, as Yocto is based on oe-core, and OE board? has input into
Yocto.. (i.e. consider it joint marketing?)
[18:06] <khem> fray: he meant for git
[18:06] <Jefro__> cool - could someone please send me the full transcript?
[18:06] <bluelightning> Jefro__: yep I can do that
[18:06] <Jefro__> bluelightning thanks

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e8e9c641f5104b85448c2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse:collapse;color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px"><div>OpenEmbedded =
Technical Steering Committee</div><div>30 January, 2012</div><div><br></div=
>
<div>Attending: Khem, Richard, Mark, Tom, Paul</div><div>Minutes: Jefro</di=
v><div><br></div><div>1. pick a chair</div><div>Paul</div><div><br></div><d=
iv>2. new issues</div><div>=A0 =A0a. meta-oe organisation discussion</div><=
div>
=A0 =A0 =A0 too wide in scope, images that work with oe-core break with met=
a-oe</div><div>=A0 =A0 =A0 discussion ongoing on mailing list</div><div>=A0=
 =A0 =A0 Paul to ping Koen for feedback</div><div><br></div><div>=A0 =A0b. =
elections</div><div>
=A0 =A0 =A0 fray is next, RP will tickle board -&gt; done</div><div><br></d=
iv><div>=A0 =A0c. distro features</div><div>=A0 =A0 =A0 all to reply to pau=
l&#39;s email</div><div>=3D&gt; =A0 =A0Paul to file bug to implement distro=
 features backfill</div>
<div>=3D&gt; =A0 =A0Paul to file bug to implement psplash issue already dis=
cussed</div><div><br></div><div>=A0 =A0d. gitpkgv.bbclass merge</div><div>=
=A0 =A0 =A0 good functionality, needs some work to be accepted</div><div><b=
r></div><div>
=A0 =A0e. meta-ti working with oe-core</div><div>=A0 =A0 =A0 positive discu=
ssion on meta-ti list</div><div><br></div><div>3. TSC meetup at ELC</div><d=
iv>=A0 =A0jefro to set up breakfast Thurs morning 8am -&gt; done</div><div>=
=A0 =A0NOTE: if members can&#39;t get there on time, can arrange a later se=
ssion</div>
<div>=3D&gt; bring thoughts to ELC for retrospective</div><div><br></div><d=
iv>4. Status report on oe-core</div><div>=A0 =A0 =A0better sstate reuse rep=
orted by Koen and others</div><div>=3D&gt; =A0 communicate to oe-core list =
in late Feb, agendize</div>
<div><br></div><div>5. Infrastructure</div><div>=A0 =A0 =A0melo has retired=
</div><div>=A0 =A0 =A0patchwork issues - less value for bitbake &amp; oe-co=
re</div><div><br></div><div>6. Action Review:</div><div>=A0 =A0Khem/Fray: F=
lagging on wiki for OE version</div>
<div>=A0 =A0Khem: OE default source mirror</div><div><br></div><div><br></d=
iv><div>Raw Transcript:</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>
<div>[17:07] --&gt; You have joined the channel #oe-tsc (~paul@pdpc/support=
er/professional/bluelightning).</div><div>[17:07] &lt;fray&gt; :)</div><div=
>[17:08] *** Channel modes: no colors allowed, no messages from outside, to=
pic protection</div>
<div>[17:08] *** This channel was created on 14/02/2011 14:28.</div><div>[1=
7:08] &lt;RP__&gt; bingo!</div><div>[17:08] &lt;RP__&gt; (full house)</div>=
<div>[17:08] &lt;bluelightning&gt; sorry guys</div><div>[17:08] &lt;khem&gt=
; on agenda items I would like to add meta-oe organisation discussion</div>
<div>[17:08] &lt;RP__&gt; Jefro: has an agenda at=A0<a href=3D"http://paste=
bin.com/vef1520V" target=3D"_blank" style=3D"color:rgb(17,85,204)">http://p=
astebin.com/vef1520V</a></div><div>[17:08] &lt;Jefro&gt; khem: ok</div><div=
>[17:09] &lt;RP__&gt; we need someone with four legs?</div>
<div>[17:09] &lt;Jefro&gt; should we dive in? who wants to chair?</div><div=
>[17:09] &lt;RP__&gt; or alternatively, I like chesterfields (as a type of =
chair)</div><div>[17:10] * fray suggestions bluelightning=A0</div><div>[17:=
10] &lt;fray&gt; suggests even</div>
<div>[17:10] &lt;bluelightning&gt; ok, I&#39;ll do it</div><div>[17:10] * J=
efro notes bluelightning as taskmaster</div><div>[17:11] &lt;bluelightning&=
gt; ok, so we have Khem&#39;s item to add to the agenda</div><div>[17:12] &=
lt;Jefro&gt; bluelightning: agenda in brief: meta-oe, elections, distro fea=
tures, tsc meetup, oe-core status, infrastructure, deferred items from last=
 time</div>
<div>[17:12] &lt;bluelightning&gt; ok, let&#39;s discuss meta-oe then</div>=
<div>[17:12] * RP__ had forgotten to ping the board but has done so now</di=
v><div>[17:13] * Jefro marks that one &quot;done&quot;</div><div>[17:13] &l=
t;bluelightning&gt; I presume you all saw the discussion on the mailing lis=
t which I started?</div>
<div>[17:13] &lt;fray&gt; yes, I did not comment as I saw active participat=
ion from others (non TSC others)</div><div>[17:13] &lt;RP__&gt; bluelightni=
ng: which list?</div><div>[17:13] &lt;fray&gt; I have no additional comment=
s, I think it looked good..</div>
<div>[17:13] &lt;bluelightning&gt; RP__: oe-devel</div><div>[17:13] &lt;khe=
m&gt; so for experiment I added meta-oe to layers and did a core-image-sato=
 build on oe-core and it did not boot where as pure oe-core works well</div=
>
<div>[17:13] &lt;fray&gt; (I assume this is the pulseaudio/distro features =
one correct?)</div><div>[17:14] &lt;khem&gt; fray: meta-oe seems to infring=
e too much into oe-core</div><div>[17:14] &lt;bluelightning&gt;=A0<a href=
=3D"http://article.gmane.org/gmane.comp.handhelds.openembedded/50131" targe=
t=3D"_blank" style=3D"color:rgb(17,85,204)">http://article.gmane.org/gmane.=
comp.handhelds.openembedded/50131</a></div>
<div>[17:14] &lt;bluelightning&gt; fray: no, this is another thing</div><di=
v>[17:15] &lt;fray&gt; ohh, no I didn&#39;t see that one</div><div>[17:15] =
&lt;khem&gt; so there is a discussion to divide it down</div><div>[17:15] &=
lt;bluelightning&gt; khem: it&#39;s just an organisation issue as well as t=
he general need to merge/justify items currently in there</div>
<div>[17:15] &lt;fray&gt; I saw the talk of the reorginization of meta-oe..=
 =A0The original talk from last week was reasonable..</div><div>[17:15] &lt=
;fray&gt; it&#39;s an orginizational issues as well as a &quot;we don&#39;t=
 want that to become a dumping ground&quot; issue</div>
<div>[17:15] &lt;khem&gt; yes, we need to reorganize the layer a bit so tha=
t it becomes a nicer addon</div><div>[17:16] &lt;khem&gt; and may be split =
it into different layers</div><div>[17:16] &lt;fray&gt; perhaps the answer =
is simply we need to keep re-evaluating it at release points of oe-core?</d=
iv>
<div>[17:16] &lt;khem&gt; I have locally moved toolchain bits into a separa=
te layer</div><div>[17:16] &lt;khem&gt; fray: yes</div><div>[17:17] &lt;blu=
elightning&gt; I think that&#39;s a good idea</div><div>[17:17] &lt;RP__&gt=
; I am worried that images that work with oe-core, break with meta-oe</div>
<div>[17:17] &lt;khem&gt; right now it engulfs too much ranging from toolch=
ains to bootloaders</div><div>[17:17] &lt;bluelightning&gt; indeed</div><di=
v>[17:17] &lt;RP__&gt; Do we know why?</div><div>[17:17] &lt;khem&gt; its t=
oo wide in its scope</div>
<div>[17:18] &lt;RP__&gt; is the proposal one repo with different elements =
that can be added in or different repos?</div><div>[17:19] &lt;RP__&gt; I t=
hink I&#39;d be in favour of splitting, if it remains one repo</div><div>
[17:19] &lt;khem&gt; one repo with different meta-*</div><div>[17:19] &lt;k=
hem&gt; yes</div><div>[17:19] &lt;RP__&gt; that does seem reasonable given =
the different functionality areas identified</div><div>[17:19] &lt;blueligh=
tning&gt; RP__: fine with one repo, just multiple layers</div>
<div>[17:19] &lt;fray&gt; multiple layers - one repository?</div><div>[17:1=
9] &lt;khem&gt; I think we need to make meta-retired meta-extra meta-toolch=
ain for sure</div><div>[17:20] &lt;fray&gt; i.e. you check out meta-oe -- a=
nd get meta-oe/meta-....</div>
<div>[17:20] &lt;khem&gt; no</div><div>[17:20] &lt;fray&gt; then the user c=
an choose to include all of meta-oe or just components?</div><div>[17:20] &=
lt;khem&gt; meta-openembedded/meta-*</div><div>[17:20] &lt;khem&gt; fray: t=
hey will be independent layers</div>
<div>[17:21] &lt;RP__&gt; fray: I think khem means yes</div><div>[17:21] &l=
t;fray&gt; what I was thinking is if the bblayers includes meta-openembedde=
d they would get all of the items.. otherwise they could selectively includ=
e just the bits they want</div>
<div>[17:21] &lt;khem&gt; just managed unders one repo meta-openemebedded l=
ike we do for meta-gnome etc.</div><div>[17:21] &lt;bluelightning&gt; fray:=
 it could be set up to work that way but I&#39;m not sure there&#39;s much =
value in it</div>
<div>[17:21] &lt;khem&gt; fray: meta-openembedded =3D repo</div><div>[17:21=
] &lt;fray&gt; ya, I think we&#39;re talking the same thing on the repo sid=
e..</div><div>[17:21] &lt;khem&gt; not layer</div><div>[17:21] &lt;RP__&gt;=
 fray: bblayers needs =A0a config file and I&#39;m not sure we&#39;re tried=
 the &quot;all&quot; approach you&#39;ve described</div>
<div>[17:21] &lt;fray&gt; bluelightning value is that it doesn&#39;t change=
 existing behavior.. but gives more flexibility</div><div>[17:21] &lt;RP__&=
gt; fray: it could probably be made to work but likely will confuse people<=
/div>
<div>[17:21] &lt;fray&gt; RP__, I thought you could include other files wit=
hin the one..</div><div>[17:22] &lt;bluelightning&gt; fray: meta-openembedd=
ed already consists of multiple layers, of which meta-oe is one (and the on=
e we&#39;re discussing here)</div>
<div>[17:22] &lt;fray&gt; so the layers.conf of meta-openembedded would inc=
lude the ones from the sub layers.. (maybe it&#39;s not that easy)</div><di=
v>[17:22] &lt;khem&gt; I am seeing folks asking for recipes on yocto lists =
which are there in meta-oe</div>
<div>[17:22] &lt;khem&gt; but they can not use it easlity</div><div>[17:22]=
 &lt;fray&gt; ahh, ok.. I understand</div><div>[17:22] &lt;khem&gt; since m=
eta-oe will bring them more than what they need</div><div>[17:22] &lt;bluel=
ightning&gt; yes, it&#39;s hard to recommend meta-oe as a layer just for th=
e additional recipes right now</div>
<div>[17:22] &lt;RP__&gt; So why are we discussing this? Is the list at dea=
dlock?</div><div>[17:22] &lt;khem&gt; correct</div><div>[17:22] &lt;fray&gt=
; what I&#39;ve done before is pull just the recipes out of meta-oe I need,=
 but I don&#39;t normally use the layer as-is</div>
<div>[17:23] &lt;RP__&gt; or did that thread reach a conclusion?</div><div>=
[17:23] &lt;bluelightning&gt; I&#39;m not sure it is a deadlock</div><div>[=
17:23] &lt;khem&gt; its not deadlock,</div><div>[17:23] &lt;RP__&gt; the pr=
oblem is a lack of conclusion?</div>
<div>[17:23] &lt;khem&gt; we need to find someone to look after new layers<=
/div><div>[17:23] &lt;RP__&gt; I&#39;m trying to figure out what our role a=
s the TSC is here</div><div>[17:24] &lt;bluelightning&gt; the thread has la=
rgely petered out, but I did not see a response from the current meta-oe ma=
intainer</div>
<div>[17:24] &lt;bluelightning&gt; perhaps I should ping koen</div><div>[17=
:24] &lt;khem&gt; yes</div><div>[17:24] &lt;RP__&gt; bluelightning: do that=
 and see where we&#39;re at</div><div>[17:24] &lt;bluelightning&gt; ok</div=
>
<div>[17:24] &lt;-- Jefro has left this server (Ping timeout: 240 seconds).=
</div><div>[17:24] --&gt; Jefro__ has joined this channel (43cb5922@gateway=
/web/freenode/session).</div><div>[17:24] &lt;Jefro__&gt; sorry all - I&#39=
;m back now</div>
<div>[17:25] &lt;-- Jefro__ has left this server (Changing host).</div><div=
>[17:25] --&gt; Jefro__ has joined this channel (43cb5922@gateway/web/freen=
ode/ip.67.203.89.34).</div><div>[17:25] &lt;bluelightning&gt; let&#39;s mov=
e onto the next item.. elections</div>
<div>[17:25] &lt;khem&gt; ok move on</div><div>[17:25] &lt;fray&gt; I&#39;m=
 up next, RP pinged.. anything else?</div><div>[17:25] &lt;RP__&gt; btw, on=
 a related note, I should give the group a heads up on a discussion on #yoc=
to with otavio recently</div>
<div>[17:26] &lt;khem&gt; RP__: on what topic</div><div>[17:26] &lt;RP__&gt=
; he wanted to merge gitpkgv.bbclass into oe-core as is. I suggested that s=
ome of it should really be integrated with the bitbake fetcher first</div>
<div>[17:26] &lt;bluelightning&gt; ok sounds like the elections issue is do=
ne, so let&#39;s cover that now</div><div>[17:26] &lt;RP__&gt; He is rather=
 unhappy about this and wants to do that &quot;later&quot;</div></span><spa=
n class=3D"Apple-style-span" style=3D"border-collapse:collapse;color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px">[17:27] &lt;RP__&gt; H=
e is going to bring this up on the mailing list and if I maintain my stance=
, probably bring to the TSC</span><span class=3D"Apple-style-span" style=3D=
"border-collapse:collapse;color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:13px"><div>
[17:27] &lt;fray&gt; I think it&#39;s reasonable for him ot bring it up and=
 do it that way..</div><div>[17:27] &lt;khem&gt; but I think its good idea =
to have gitpkgv as a functionality</div><div>[17:27] &lt;fray&gt; I&#39;m n=
ot familiar with the actual implementation though..</div>
<div>[17:27] &lt;bluelightning&gt; RP__: he did post the patch FYI, not sur=
e if you saw it</div><div>[17:27] &lt;RP__&gt; bluelightning: ok, I need to=
 give feedback then</div><div>[17:28] &lt;RP__&gt; I agree its good functio=
nality, I just think it should be adapted to fit into the fetcher cleanups =
and other work being done to improve things in OE-Core</div>
<div>[17:28] &lt;khem&gt; RP__: nod</div><div>[17:28] &lt;bluelightning&gt;=
 so onto the next issue - distro features</div><div>[17:28] &lt;RP__&gt; fe=
tcher functionality in one place with a standardised API is a good thing IM=
O</div>
<div>[17:28] &lt;bluelightning&gt; I agree</div><div>[17:29] &lt;khem&gt; R=
P__: yes fetchers is right place</div><div>[17:29] &lt;RP__&gt; I just want=
ed to bring this up here since I suspect there will be some friction</div>
<div>[17:29] &lt;fray&gt; just to verify, point of the code is a smaller (m=
ore simpl) PV right?</div><div>[17:29] &lt;RP__&gt; fray: yes</div><div>[17=
:29] &lt;RP__&gt; bluelightning: where is that at now?</div><div>[17:29] &l=
t;fray&gt; ok.. =A0I&#39;ve heard of a lot of requests for that from cowork=
ers.. ;)</div>
<div>[17:30] &lt;RP__&gt; fray: well, its a smaller PV in the output packag=
es</div><div>[17:30] &lt;RP__&gt; fray: The PV used in the build system is =
still long</div><div>[17:30] &lt;bluelightning&gt; RP__: waiting for &quot;=
someone&quot; (probably me) to implement it as discussed I think</div>
<div>[17:30] &lt;fray&gt; yes.. =A0thats what people have requested from me=
 before.. =A0(they don&#39;t care so much about the internal values)</div><=
div>[17:30] &lt;RP__&gt; bluelightning: that&#39;s what I thought</div><div=
>
[17:30] &lt;fray&gt; but I agree, start with the fetcher and work toward th=
e package creation is the best approach..</div><div>[17:31] &lt;bluelightni=
ng&gt; AR to me - file a bug to implement distro features backfill</div>
<div>[17:31] * Jefro__ notes bluelightning=A0</div><div>[17:31] &lt;bluelig=
htning&gt; another AR - file a bug to implement psplash issue discussed 2 m=
eetings ago as well</div><div>[17:31] &lt;bluelightning&gt; (also to me)</d=
iv>
<div>[17:31] &lt;fray&gt; Ahh I thought that had been done already.. :)</di=
v><div>[17:32] * RP__ would like to note for the record the positive thread=
 on the meta-ti list about their layer working with OE-Core and not dependi=
ng on meta-angstrom/meta-oe</div>
<div>[17:32] &lt;bluelightning&gt; yes, I&#39;m very happy to hear that&#39=
;s being worked on</div><div>[17:32] &lt;RP__&gt; that would be nice progre=
ss towards the layer model really starting to work</div><div>[17:33] &lt;fr=
ay&gt; very cool..</div>
<div>[17:33] * RP__ thought it worth acknowledging here :)</div><div>[17:33=
] &lt;bluelightning&gt; ok, let&#39;s move onto &quot;TSC meetup&quot;</div=
><div>[17:33] &lt;khem&gt; yes indeed</div><div>[17:33] &lt;Tartarus&gt; EL=
C, I&#39;ll be there, not for yocto dev day tho</div>
<div>[17:33] &lt;Tartarus&gt; iirc the invite went out for the 15th, AM tho=
, yes?</div><div>[17:34] &lt;RP__&gt; None of these things made my calender=
 :(</div><div>[17:34] &lt;fray&gt; I&#39;ll be at ELC for Yocto Dev Day (Tu=
esday) through Friday</div>
<div>[17:34] * RP__ notes to self to import them</div><div>[17:34] * blueli=
ghtning won&#39;t be there but has confirmed the TSC meeting invite assumin=
g teleconf availability</div><div>[17:35] * RP__ will be there Tue-Fri</div=
>
<div>[17:35] &lt;khem&gt; I am registed starting yocto dday</div><div>[17:3=
6] &lt;RP__&gt; Anything specific we need to discuss?</div><div>[17:36] &lt=
;Jefro__&gt; you should have a calendar invitation for Weds morning 8am, an=
d I have a room reserved. =A0we can meet earlier for a full breakfast if th=
ere is the desire to do so.</div>
<div>[17:36] &lt;fray&gt; Unlike last year, I can&#39;t think of anything o=
ther then normal meeting stuff..</div><div>[17:36] &lt;Tartarus&gt; I&#39;l=
l probably be there right around 8, depending on airport shuttle, etc</div>
<div>[17:36] &lt;Tartarus&gt; iirc I land 7:15a or so</div><div>[17:36] &lt=
;fray&gt; if we do want to work on rearranging meta-oe, it might make sense=
 towork on it in person</div><div>[17:37] &lt;khem&gt; I will try to be the=
re by 8 traffic permitting</div>
<div>[17:37] * RP__ will be there by 8 or earlier depending on the jetlag</=
div><div>[17:37] * RP__ suspects he could make 5 quite easily :/</div><div>=
[17:37] &lt;khem&gt; heh</div><div>[17:38] &lt;fray&gt; :)</div><div>[17:38=
] &lt;khem&gt; 5a will be a bit late for me :)</div>
<div>[17:38] &lt;RP__&gt; A kind of retrospective might be useful</div><div=
>[17:38] &lt;Jefro__&gt; there will be a continental breakfast for those wh=
o can eat at the crack of 8</div><div>[17:38] &lt;Jefro__&gt; continental l=
unch for RP</div>
<div>[17:38] &lt;RP__&gt; What is going well and anything we need to improv=
e</div><div>[17:38] &lt;RP__&gt; Jefro__: :)</div><div>[17:39] &lt;khem&gt;=
 RP__: yes. and any new ideas</div><div>[17:39] &lt;RP__&gt; A lot has happ=
ened in the last 18 months :)</div>
<div>[17:39] &lt;khem&gt; RP__: per recipe sysroots e.g. :)</div><div>[17:3=
9] &lt;RP__&gt; khem: there is an ehancement bug for it</div><div>[17:40] &=
lt;RP__&gt; but it would be good to discuss priorities and so on</div><div>
[17:40] &lt;fray&gt; ya.. I think a recap would be good for the year.. do w=
e have any obligation (or desire) to report to the board/e.V. members what =
we as the TSC have done/observed for the past year?</div><div>[17:40] &lt;k=
hem&gt; RP__: I would like to see a meta-benchmark</div>
<div>[17:40] &lt;RP__&gt; fray: we have no obligation but nothing to stop u=
s either</div><div>[17:40] &lt;fray&gt; ok.. might be worth us doing...</di=
v><div>[17:40] &lt;bluelightning&gt; khem: feel free to tack that onto the =
mailing list discussion, there&#39;s already recipes-benchmark in meta-oe</=
div>
<div>[17:40] &lt;fray&gt; bullet points, that kind of thing..</div><div>[17=
:41] &lt;RP__&gt; AR: Everyone: To bring thoughts to ELC</div><div>[17:41] =
&lt;fray&gt; yup</div><div>[17:41] &lt;bluelightning&gt; ok, shall we move =
onto OE-core status?</div>
<div>[17:41] &lt;khem&gt; ok</div><div>[17:42] &lt;RP__&gt; we&#39;re prett=
y green onmaster</div><div>[17:42] &lt;RP__&gt; proposed patches have throw=
n up regressions so we&#39;re trying to fix before merging</div><div>[17:42=
] &lt;RP__&gt; fixed some nasty useradd+sstate issues last week</div>
<div>[17:42] &lt;RP__&gt; also finally got to the bottom of the machine swi=
tching sstate issue</div><div>[17:42] &lt;fray&gt; RP__ the fix was before =
or after the version bump on bitbake (requires version)</div><div>[17:43] &=
lt;fray&gt; ?</div>
<div>[17:43] &lt;RP__&gt; Koen+Martin have reported better sstate reuse now=
</div><div>[17:43] &lt;bluelightning&gt; RP__: excellent!</div><div>[17:43]=
 &lt;khem&gt; I am working on kmod in hiatus</div><div>[17:43] &lt;RP__&gt;=
 fray: after</div>
<div>[17:44] &lt;khem&gt; RP__: I have used sstate quite a bit now its been=
 decent on me</div><div>[17:44] &lt;RP__&gt; khem: great :)</div><div>[17:4=
4] &lt;khem&gt; I actually keep *native* and *cross*</div><div>[17:44] &lt;=
khem&gt; and delete everything</div>
<div>[17:45] &lt;RP__&gt; Its taking some work but I think its really start=
ing to help</div><div>[17:45] &lt;khem&gt; that just builds the target bits=
 quite fast</div><div>[17:45] &lt;RP__&gt; any questions/concerns on oe-cor=
e?</div>
<div>[17:45] &lt;khem&gt; RP__: I wish if I could tell category of recipes =
to rebuild even when using sstate</div><div>[17:46] &lt;RP__&gt; khem: base=
d on what?</div><div>[17:46] &lt;khem&gt; RP__: may be recipe names</div>
<div>[17:46] &lt;RP__&gt; khem: you can invalidate the sstate cache in inte=
resting ways by changing the checksums</div><div>[17:46] * Jefro__ says tim=
e check: 15 mins left</div><div>[17:46] &lt;RP__&gt; khem: you know about -=
c cleansstate</div>
<div>[17:46] &lt;khem&gt; RP__: yes</div><div>[17:47] &lt;khem&gt; RP__: I =
guess its not that urgent of a need since stuff I do is not common anyway</=
div><div>[17:48] &lt;Jefro__&gt; RP__ question - how much of this behavior =
is documented?</div>
<div>[17:48] &lt;RP__&gt; Jefro__: everything I&#39;ve talked about</div><d=
iv>[17:48] &lt;RP__&gt; Jefro__: I worked with Scott to document sstate</di=
v><div>[17:48] &lt;Jefro__&gt; ok, cool - in yocto docs? will oe folks thin=
k to look there?</div>
<div>[17:48] &lt;khem&gt; someone should summarize sstate in detail if not =
yet done in wiki</div><div>[17:49] &lt;khem&gt; how to use it and how to no=
t use it. etc.</div><div>[17:49] &lt;RP__&gt; khem: its in the manuals</div=
>
<div>[17:49] &lt;khem&gt; ok</div><div>[17:49] &lt;RP__&gt; khem: based on =
an email from me</div><div>[17:49] &lt;RP__&gt; so the docs are out there f=
or anyone to find</div><div>[17:49] &lt;RP__&gt; Jefro__: I&#39;d hope they=
 would</div>
<div>[17:50] &lt;RP__&gt; Jefro__: At this point its the most complete manu=
al set on the subject</div><div>[17:50] &lt;bluelightning&gt; ok, remaining=
 issues are &quot;infrastructure&quot; and deferred items from last time (&=
quot;Flagging on wiki for OE version&quot;, &quot;OE default source mirror&=
quot;)</div>
<div>[17:50] &lt;bluelightning&gt; shall we try to cover those in 10mins?</=
div><div>[17:51] &lt;khem&gt; both my ARs are still open</div><div>[17:51] =
&lt;RP__&gt; I&#39;m not sure there is much to cover about infrastructure</=
div>
<div>[17:51] &lt;khem&gt; not much but old melo has retired</div><div>[17:5=
2] &lt;khem&gt; on patchwork I think with bitbake there is a problem</div><=
div>[17:52] &lt;khem&gt; since it catches bitbake-devel ml and commit mails=
 also go to bitbake-devel</div>
<div>[17:52] &lt;khem&gt; it catches the patches both the times</div><div>[=
17:53] &lt;khem&gt; it is preferred to have commit mail be sent to bitbake-=
devel ?</div><div>[17:53] &lt;fray&gt; Hmm.. patchwork doesn&#39;t have a w=
ay to determine it&#39;s the same patch?</div>
<div>[17:53] &lt;khem&gt; fray: no</div><div>[17:53] &lt;khem&gt; although =
it would be neat</div><div>[17:54] &lt;khem&gt; but there is patch and then=
 commits etc.</div><div>[17:54] &lt;fray&gt; ok.. for some reason I thought=
 it kept an md5sum or something of the patch and used that to correlate ori=
ginal patches and updates..</div>
<div>[17:54] &lt;RP__&gt; Part of the problem is likely that some of us sen=
d bitbake patches with a path prefix of bitbake/</div><div>[17:54] &lt;khem=
&gt; fray: well yes but in this case mail is sent after the patch has been =
closed</div>
<div>[17:54] &lt;fray&gt; Ahh I see.. ok</div><div>[17:54] &lt;RP__&gt; I j=
ust strip it off but it probably confuses patchwork</div><div>[17:55] &lt;f=
ray&gt; would it be possible to tag the patches from Saul/RP that are integ=
ration patches (vs original work) and blacklist them?</div>
<div>[17:55] &lt;bluelightning&gt; just filter out &quot;CONSOLIDATED PULL&=
quot; ?</div><div>[17:56] &lt;bluelightning&gt; I think he always includes =
that in the subject of 0/x at least</div><div>[17:56] &lt;fray&gt; thats ki=
nd of what I was thinking</div>
<div>[17:56] &lt;khem&gt; actually there is less value for bitbake and oe-c=
ore in patchwork</div><div>[17:56] &lt;khem&gt; only people refer to them s=
ometimes</div><div>[17:56] &lt;bluelightning&gt; well, oe-core is not handl=
ed at all and that means it&#39;s full of old patches</div>
<div>[17:56] &lt;khem&gt; only meta-oe uses it effectively to manage patche=
s we can even turn it off for bb and oe-core</div><div>[17:57] &lt;fray&gt;=
 ya, sounds like we either need to filter it for consolidated pulls -- or s=
imply avoid the issue by turning it off as khem says..</div>
<div>[17:58] &lt;khem&gt; I guess I can ask the ml and get opinions on havi=
ng pw turned on for bb and oe-core</div><div>[17:58] &lt;fray&gt; I don&#39=
;t see a lot of references in the mailing list ot patchwork (for oe-core)..=
</div>
<div>[17:58] &lt;khem&gt; fray: yes its occasional</div><div>[17:58] &lt;kh=
em&gt; on IRC etc.</div><div>[17:58] &lt;fray&gt; ahh ok..</div><div>[17:59=
] &lt;fray&gt; I&#39;d sugges tthen we start with the filter approach, and =
if that doesn&#39;t work try something else.. I assume it uses something li=
ke procmail to get access to the mail messages..</div>
<div>[17:59] &lt;fray&gt; if so we should be able to filter certain emails =
easily.. if not, I&#39;m not sure</div><div>[17:59] &lt;khem&gt; I think it=
s useless if its not used there is no point in tracking the patches</div>
<div>[17:59] &lt;RP__&gt; The workflow I&#39;ve been using doesn&#39;t use =
patchwork</div><div>[17:59] &lt;fray&gt; I think it all comes down to membe=
r usage.. if people want to use it, and we can support it.. we should..</di=
v>
<div>[17:59] &lt;khem&gt; but if people think its so critical we can keep i=
t</div><div>[17:59] &lt;khem&gt; RP__: yes thats why</div><div>[18:00] &lt;=
fray&gt; but we don&#39;t current use it -- so in that case, if it&#39;s no=
t useful we just disable it</div>
<div>[18:00] &lt;khem&gt; yes</div><div>[18:00] &lt;bluelightning&gt; khem:=
 if we had the commit hook it would be useful so that missed patches can at=
 least be viewed</div><div>[18:00] &lt;bluelightning&gt; otherwise it&#39;s=
 more or less worthless</div>
<div>[18:00] &lt;fray&gt; I have no objection to removing it from oe-core/b=
b other then oe users who want it</div><div>[18:00] * RP__ has pretty good =
records of missed patches :/</div><div>[18:00] &lt;khem&gt; bluelightning: =
the way patches flow in ml its hard</div>
<div>[18:01] &lt;RP__&gt; its why my inbox is growing out of control :(</di=
v><div>[18:01] * bluelightning did not mean to cast any aspersions</div><di=
v>[18:01] &lt;khem&gt; since patches go into ml and then Saul picks them an=
d resends them to same ml</div>
<div>[18:01] &lt;khem&gt; its a bit not pw like</div><div>[18:01] &lt;bluel=
ightning&gt; fair enough, if the tool doesn&#39;t really work there&#39;s n=
ot much point in keeping it</div><div>[18:02] &lt;khem&gt; I would think so=
</div>
<div>[18:02] &lt;bluelightning&gt; I think we have a standing order to eval=
uate patchwork and tools like it but we haven&#39;t got to that yet</div><d=
iv>[18:02] &lt;khem&gt; we can keep it only for meta-oe</div><div>[18:02] &=
lt;khem&gt; since thats handling the patches with it</div>
<div>[18:03] &lt;bluelightning&gt; plus any other layer that uses oe-devel =
ml for patches (I use it for meta-handheld / meta-opie FWIW)</div><div>[18:=
03] &lt;bluelightning&gt; or rather, I keep it up-to-date for those layers<=
/div>
<div>[18:03] &lt;khem&gt; yes infact any patches that go into oe-devel are =
groked</div><div>[18:04] * RP__ needs to go I&#39;m afraid</div><div>[18:04=
] &lt;RP__&gt; I think we&#39;re pretty much done anyway</div><div>[18:04] =
&lt;RP__&gt; ?</div>
<div>[18:04] &lt;khem&gt; btw. Phil mentioned this on IRC that yocto point =
to=A0<a href=3D"http://oe.org/" target=3D"_blank" style=3D"color:rgb(17,85,=
204)">oe.org</a>=A0to obtain sources probably it should use github mirror a=
ddy</div>
<div>[18:04] &lt;fray&gt; ya, I think we are..</div><div>[18:05] &lt;blueli=
ghtning&gt; I think we&#39;ve covered our agenda at least</div><div>[18:05]=
 &lt;khem&gt; yes</div><div>[18:05] &lt;khem&gt; adjourned</div><div>[18:05=
] &lt;fray&gt; khem, I thought that pointer from yocto to=A0<a href=3D"http=
://oe.org/" target=3D"_blank" style=3D"color:rgb(17,85,204)">oe.org</a>=A0w=
as deliberate, as Yocto is based on oe-core, and OE board? has input into Y=
octo.. (i.e. consider it joint marketing?)</div>
<div>[18:06] &lt;khem&gt; fray: he meant for git</div><div>[18:06] &lt;Jefr=
o__&gt; cool - could someone please send me the full transcript?</div><div>=
[18:06] &lt;bluelightning&gt; Jefro__: yep I can do that</div><div>[18:06] =
&lt;Jefro__&gt; bluelightning thanks</div>
</span><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/b=
log" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Communit=
y Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_blank">http=
://yoctoproject.org</a></div>
<br>

--90e6ba6e8e9c641f5104b85448c2--
