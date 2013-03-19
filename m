Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1UHpgf-0003nZ-Jq; Tue, 19 Mar 2013 07:06:18 +0100
Received: by mail-la0-f53.google.com with SMTP id fr10so168225lab.26
	for <multiple recipients>; Mon, 18 Mar 2013 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=aVXoA6nQ7C7YL3N0jHspJqiJNoms3Y8laDGJpT9ve9A=;
	b=0381RxffxgMC4IWzUEnXxBBXBuaN3qWERnzswtJDO6Xk/sCGlj6GVrzdJCrcumJd1K
	BLzq1AiQNhEywZby7JGvZVbd9bYluwx7eUQlJ2B5d+LG6hHWpfcgRLWQWPxtoWk378Ik
	q/eE/VE9Pg0CSajmLxvGVtA6iL/mVO+WiGSjCDEMkE0DgdnRinIC93k7pA4SKTxBQScY
	YnGOQ7KR1GyTX8n6hJVcWqAVhN5c9v7CJDVyiyHO6gAxvTx80p5kngDxjhrOIHSAGUXf
	sP/8zYpM2Mqql4ivWdh3hxt9FpA5bjL2mA0xjRgHhGNkF9D3E32zyQOcn4WOEj+QNoa2
	OrxQ==
MIME-Version: 1.0
X-Received: by 10.112.26.106 with SMTP id k10mr7360953lbg.5.1363672167927;
	Mon, 18 Mar 2013 22:49:27 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.112.46.8 with HTTP; Mon, 18 Mar 2013 22:49:27 -0700 (PDT)
Date: Mon, 18 Mar 2013 22:49:27 -0700
X-Google-Sender-Auth: 41CedXxGbo3P_ozSZ-WySiENxXg
Message-ID: <CA+YB3rYNDA-3Xeh9Sw316tHYmputL5H2MrM6gOofyOnS3--F_A@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 26 February 2013
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 06:06:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
26 February 2013

Attendees:
  Koen (koen)
  Khem (khem)
  Fray (fray)
  Paul (bluelightning)
Apologies:
  Richard (RP)

Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair

___________________________________
2. new issues

a. mailing list outage
mailing list moving to OSUOSL or YP
** list addresses will not change
discussion in progress

b. meta-oe appends/overlayed recipes RFC
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043925.html
no avr32 support in public layers
NOTE: Martin responded extensively to the prior minutes

c. systemd merge unhappiness
people feel ignored and then being told they should have spoken up
in oe-core, in general as well as on systemd specifically
=> jefro to follow up with RP

d. oe.org flooded
refs to oe.org git should point to github
=> jefro to follow up with scottrif
=> khem to fix the oe wiki and reminder to ml
possible to move server at some point?
=> jefro to investigate YP hosting, kernel.org mirror

___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. document whitespace changes to the shell
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
also https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> still need to de-dup these

 c. SMART has replaced zypper (was documenting RPM and package feeds)
Paul wrote:
https://wiki.yoctoproject.org/wiki/Smart_Repository_Setup

 d. patchwork queue
=> Paul to talk to scottrif about adding to docs
not done

 e. raise ntp with the Yocto Project [RP]
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial
RP/Jefro were to raise at next AB - done
discussion underway

 f. oe-classic recipe migration status
RP played with perl modules, fixed up cpan_build.bbclass

 g. some items dropped from oe-core but not yet in meta-oe

___________________________________
4. status

 a. oe-core release

 b. infrastructure
mailing list issue described above
wiki spam issues
wiki requires updating & spam module
done

 c. 1.4 planning
systemd into master - still in progress

________________________________________________________________
Raw Transcript

(8:59:30 AM) mode (+v Jefro) by ChanServ
(8:59:52 AM) Jefro: good morning - looks quiet in here this morning
(9:02:03 AM) koenkooi: right
(9:02:12 AM) koenkooi: I might need to leave my desk for another meeting
(9:03:27 AM) koenkooi: irc on phone now
(9:03:55 AM) Jefro: koenkooi ok - if no one shows up there won't be a meeting
(9:04:52 AM) Jefro: fray are you here? I have pinged others
(9:05:07 AM) fray: ya here.. sorry
(9:05:13 AM) Jefro: ok, thanks
(9:05:19 AM) fray: was just talking to RP, sounds like he's about to
get on a plane
(9:05:36 AM) Jefro: ah, no kidding
(9:05:41 AM) Jefro: I'm putting an agenda together, but this is hardly a quorum
(9:06:07 AM) Jefro: I don't think anything is overly pressing, perhaps
it would be best to defer for a week or just skip this one
(9:06:15 AM) koenkooi: right
(9:06:27 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:06:27 AM) mode (+v khem) by ChanServ
(9:06:31 AM) Jefro: hi khem
(9:06:34 AM) bluelightning
[~paul@pdpc/supporter/professional/bluelightning] entered the room.
(9:06:35 AM) khem: Hello
(9:06:45 AM) bluelightning: hi all
(9:06:49 AM) khem: I am on train for next 10-15 mins
(9:06:50 AM) koenkooi: the only concerns I heard were social, not technical
(9:06:56 AM) bluelightning: I think RP is on a plane atm or waiting to
get on one
(9:07:03 AM) khem: then I will disconect for 5 mins and come back
(9:07:06 AM) Jefro: yes, just heard from him
(9:07:20 AM) khem: koenkooi: context ?
(9:07:36 AM) Jefro: if khem comes back then we actually have a quorum,
and I'm interested in the social issues
(9:07:39 AM) koenkooi: systemd merge unhappiness
(9:08:02 AM) fray: I'm happy to sit and wait for a quorum..
(9:08:04 AM) koenkooi: see oe-core ml
(9:08:35 AM) ***koenkooi is in a real life meeting as well
(9:08:37 AM) khem: I m here
(9:09:18 AM) Jefro: koenkooi are you able to talk about these social
issues or is the IRL meeting interfering?
(9:09:37 AM) koenkooi: I can try
(9:10:25 AM) koenkooi: the main concern is that people feel ignored
and then being told they should have spoken up
(9:10:36 AM) koenkooi: which they did
(9:11:04 AM) fray: koenkooi in general, or on systemd issues or?
(9:11:08 AM) khem: koenkooi: yes, thats a concern
(9:11:11 AM) koenkooi: both
(9:11:17 AM) khem: but I think its ok too
(9:11:26 AM) Jefro: here is an agenda: http://pastebin.com/EgkuKM22
(9:11:35 AM) khem: since if I care of something upstream I should
voice myself up
(9:12:08 AM) khem: koenkooi: but I guess it depends
(9:12:15 AM) koenkooi: the general issue is that @intel.com and
@windriver.com email addresses are a carte blanche for getting crap in
(9:12:51 AM) bluelightning: koenkooi: that is not true, patches from
both are frequently rejected
(9:12:57 AM) koenkooi: people can point out bugs during review all day
long and get ignored
(9:13:03 AM) khem: koenkooi: in oe-core you mean ? or in general
(9:13:21 AM) koenkooi: bluelightning: just repeating what people tell me
(9:13:32 AM) koenkooi: khem: oe-core
(9:13:42 AM) fray: koenkooi, I know of a bunch of WR stuff that has
NOT gone in, and likely never will  (due to various technical issues)
(9:13:59 AM) khem: bluelightning: it has happened that I reviewed
something which eventually made in without addressing my comments or
even saying if they were worthless
(9:14:16 AM) Jefro: I think it is important that there is a perception
that this is happening, whether or not the stats show it to be true
(9:14:16 AM) fray: that sounds like Saul/RP missed comments..
(9:14:22 AM) bluelightning: khem: which was this?
(9:14:33 AM) koenkooi: my main example is the opkg version patch for powervr
(9:14:45 AM) fray: I know RP has mentioned to me a few times that
things passed testing and were merged by accident.. he hadn't meant it
(9:14:46 AM) khem: but in general I guess its the amount of patches
sometimes that boggs down
(9:14:56 AM) bluelightning: khem: if that ever occurs it would be good
to follow up and ask why it was merged given not all concerns were
addressed
(9:15:01 AM) khem: bluelightning: I have to find ml pointer
(9:15:15 AM) koenkooi: personally I'm content with the proces
(9:15:28 AM) koenkooi: but a lot of people are angry
(9:15:37 AM) fray: I agree.. if something wasn't addressed.. my
assumption is that it slipped through the cracks, it wasn't
malicious..
(9:15:39 AM) koenkooi: and vent during conferences
(9:15:41 AM) khem: I guess a tiered approach would be better
(9:15:51 AM) fray: so I supply a patch to correct whatever I saw was
wrong.. but that is me
(9:16:10 AM) khem: where given part of metadata goes through a submaintainer
(9:16:13 AM) Jefro: the Linux kernel went for years with this kind of
thing happening before Linus was forced to create a hierarchy
(9:16:25 AM) koenkooi: and when I bring it up I get "some patches were
rejected" as a response
(9:16:33 AM) fray: ya.. "way back when" we discussed this, and the
issue is that we need maintainers who are willing to step up and do
this stuff..
(9:16:53 AM) Jefro: is there a perceptual difference between
"rejected" and "ignored"?
(9:17:05 AM) koenkooi: davest said we'd need to put jefro on this
(9:17:14 AM) fray: I agree breaking up the load.. especially between
userspace, kernel, classes and toolchain/tunings is likely a first
good approach
(9:17:27 AM) khem: yes, thats the way out
(9:17:38 AM) fray: I know I've seen more things "ignored" then
rejected.. but I always tell people.. resubmit..
(9:17:39 AM) khem: we thought it would stabilize after initial churn
(9:17:47 AM) khem: but it hasnt in 2 years
(9:17:50 AM) fray: and keep doing so until they tell you not to.. (my
advice for -any- project)
(9:18:00 AM) khem: I will deboard the train
(9:18:16 AM) khem: lets see if I catch gthe company wifi
(9:18:30 AM) Jefro: RP should really be here for this discussion. I
will bring it up with him and also will suggest that we hold a special
OE TSC session just to cover this sometime in the next week or two.
(9:18:46 AM) fray: Jefro, I think that's a good idea..
(9:18:54 AM) koenkooi: Jefro: can we do a phonecall tomorrow? this
phone keyboard isn't expressing it well
(9:20:00 AM) bluelightning: seems sensible, I agree RP should be
involved in this discussion
(9:20:03 AM) Jefro: Very possibly, but it really depends on RP's
schedule, I don't know what he's up to. I will follow up.
(9:20:49 AM) fray: I have no objections to a call..
(9:21:13 AM) fray: So what I see is two issues.. People believe they
are being ignored in comments and review steps -- and patches are
being dropped/ignored...
(9:21:23 AM) fray: does that primarily cover the concerns we can address?
(9:21:38 AM) koenkooi: yes
(9:22:10 AM) fray: ok.. then I'd say we let Jefro organize a meet w/
RP and we'll see what we can do.  It might be a good idea to bring in
Saul on this as well since he's doing a lot of the day-to-day patch
readiness..
(9:22:56 AM) Jefro: yes, should definitely include Saul
(9:23:39 AM) Jefro: ok - does everyone want to cover the rest of the
agenda, or punt on it for now?
(9:23:51 AM) Jefro: I know I got my ARs done :)
(9:23:57 AM) koenkooi: I say punt :)
(9:24:03 AM) fray: I'm happy w/ punt
(9:24:19 AM) fray: I think we've got a plan now for the largest issue....
(9:24:26 AM) Jefro: yes, at leat a next step
(9:24:34 AM) fray: (plan on how to proceed that is.. not necessarily fix it)
(9:25:19 AM) bluelightning: my ARs haven't been addressed yet
(9:25:21 AM) bluelightning: FYI
(9:25:32 AM) Jefro: ok
(9:25:53 AM) Jefro: but you did write the SMART repo setup doc, so
we'll let it slide for now
(9:27:17 AM) Jefro: we did discuss NTP at the Yocto Project AB, and RP
has the action to bring it to the YP mailing list
(9:27:28 AM) khem: I have another thing
(9:27:50 AM) khem: there are some references to oe.org git in yocto docs IIRC
(9:28:01 AM) khem: where to get sources
(9:28:18 AM) khem: may be that should point to github mirror ?
(9:28:45 AM) khem: in general Tom mentioned that it would be good if
we always pulled from github
(9:28:56 AM) Jefro: is oe.org being flooded?
(9:29:04 AM) khem: it seems
(9:29:30 AM) khem: Martin saw delays when he was pushing meta-oe commits
(9:29:30 AM) Jefro: github is one option, another is making the server bigger
(9:29:59 AM) khem: I guess gihub is better since we dont have the
replication problem across the globe
(9:30:11 AM) fray: my concern with github is "control".  I'm not
convinced it's the safest place for a primary server..
(secondary/backup sure)
(9:30:23 AM) koenkooi: pull server
(9:30:24 AM) Jefro: I can take the action to talk with Scott about
changing those references to github
(9:30:30 AM) koenkooi: not push server
(9:31:23 AM) fray: koenkooi ok..
(9:31:34 AM) Jefro: for now I'll talk with scott about the docs, but
that may or may not help the problem
(9:31:36 AM) fray: ya, I think it's key to tell people to use the mirror
(9:32:02 AM) fray: but I know I switch back and forth between the
git.oe.org and the github ones..
(9:32:15 AM) fray: (I usually do the initial sync from github, and
then pull's from oe)
(9:33:17 AM) Jefro: note that the main setup doc refers to git.oe.org
instead of github:
http://www.openembedded.org/wiki/OE-Core_Standalone_Setup
(9:33:26 AM) Jefro: that may be a much larger source for traffic than
the YP docs
(9:33:52 AM) Jefro: I can also take the AR to search for things like
this and change them to the github mirror
(9:34:40 AM) bluelightning: personally I think it would be nice to not
have to rely on external mirrors...
(9:35:12 AM) khem: Jefro: yes that one too
(9:35:21 AM) fray: I agree.. ultimately I think the mirrors should be
just that, mirrors.. but the primary point of access is enoughf or the
project
(9:35:24 AM) khem: Jefro: we were trying to identify what could lead to it
(9:35:42 AM) khem: using mirrors for pulling isnt bad IMO
(9:35:47 AM) fray: But this is a place where I don't know what we can do to help
(9:35:53 AM) khem: now we have pull model it makes sense
(9:36:11 AM) khem: Just change the docs to promote use of mirrors
(9:36:13 AM) khem: I guess
(9:36:21 AM) fray: khem, I think that should be our first step..
(9:36:28 AM) fray: also remind people on the mailing list..
(9:36:28 AM) khem: right
(9:36:54 AM) Jefro: who wants to take that action?
(9:37:29 AM) khem: I can edit the wiki
(9:37:43 AM) khem: but if anyone else sees references correcting them will help
(9:37:53 AM) khem: I can also send a friendly reminder to ml
(9:38:43 AM) Jefro: khem ok, thanks
(9:40:09 AM) Jefro: I can report a bit on 2a. I have contacted the OE
board as well as Tom and Michael, and it seems likely that the mailing
lists will move over to a YP server.
(9:40:18 AM) khem: yay
(9:40:19 AM) Jefro: Timing is not yet determined
(9:40:32 AM) fray: cool.. that will hopefully resolve that issue..
(9:41:01 AM) fray: (back to the git discussion, is there a reason to
discuss the git as well [someday])
(9:41:24 AM) Jefro: fray hmm - that is a good question
(9:41:48 AM) Jefro: I will mention it to Michael first, as it would be
his job to administer such a thing and I think it would probably be
hit a lot harder than an email server
(9:42:15 AM) koenkooi: 3G is flaking out, I'll drop soon
(9:42:19 AM) fray: I agree.. that and what about meta-oe and related..
 they're not essential to the YP.. so do they want the burden of
managing them all
(9:42:19 AM) Jefro: eventually something like that should happen, I would think
(9:42:28 AM) Jefro: koenkooi ok, thanks for sticking with it
(9:42:31 AM) fray: I'm not against it.. just have to do it if it makes sense
(9:42:50 AM) Jefro: another option is for OE to hire a sysadmin and
beef up servers
(9:43:02 AM) fray: is it the servers, or is it bandwidth?
(9:43:06 AM) fray: (or both)
(9:43:08 AM) Jefro: seems impossible right now, but OE does very
little fundraising, so it could happen in the future
(9:44:39 AM) khem: fray: I think its also that we have uses across the oceans
(9:44:54 AM) fray: ya... seems reasonable
(9:45:00 AM) Jefro: I wonder if it would be possible to use kernel.org
as a mirror at some point
(9:45:18 AM) khem: thats a good idea
(9:45:39 AM) Jefro: I can discuss this with the linux foundation just
to find out the possibilities
(9:45:43 AM) Jefro: are there any traffic stats at all?
(9:45:47 AM) khem: but I heard people have started to use github
mirror for kernel a lot
(9:46:06 AM) fray: at least with git, it helps prevent malicious
commits on a mirror..
(9:46:13 AM) fray: you can always verify at the original site
(9:49:11 AM) khem: yes
(9:49:45 AM) Jefro: time running short - moving on & cherry picking
through the agenda
(9:50:02 AM) Jefro: khem - we got advice from wmat to install a module
on the wiki, has that helped the spam issue at all?
(9:50:02 AM) khem: on infra side we are setting up jenkins which will
test all layers that are active besides oe-core
(9:50:11 AM) khem: Jefro: yes it has
(9:50:16 AM) khem: thanks for that
(9:50:50 AM) khem: jenkins is already setup and I am awaiting tom to
setup 2 extra slaves for regressing layers
(9:51:21 AM) khem: we plan to send mails to authors on regression
(9:51:39 AM) khem: but scripting is not done yet
(9:51:40 AM) fray: cool..  is this focused primarily on the layers, or
also oe-core?
(9:52:00 AM) khem: we believe oe-core is pounded enough on yocto AB
(9:52:06 AM) fray: ok
(9:52:09 AM) khem: its to cover other layers
(9:53:13 AM) khem: eventually we would encourange layer maintainers to
use it as pre commit criteria
(9:56:22 AM) Jefro: ok, 4 minutes - anyone have any other high priority stuff?
(9:56:30 AM) fray: i'm good
(9:57:11 AM) Jefro: ok, I'm calling it - thanks all & have a good day
(9:57:16 AM) fray: thank you!
(10:03:56 AM) bluelightning: thanks
(11:01:18 AM) khem left the room.
(11:18:01 AM) bluelightning left the room (quit: Quit: Konversation
terminated!!!111).

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


