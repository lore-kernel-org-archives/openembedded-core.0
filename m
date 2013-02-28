Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1UAxEv-0001pE-IR; Thu, 28 Feb 2013 07:45:14 +0100
Received: by mail-wi0-f175.google.com with SMTP id l13so7262823wie.14
	for <multiple recipients>; Wed, 27 Feb 2013 22:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=UPFL8Ckb4O5/9cMmynxWzyR6TmcmWIsfOjhXJjAHUJM=;
	b=Bn3aTysF1wRn2ATH6Cu77JeEY+4+DaiWffWSn5OBLExqgQbo8eeFBkO+o2epaloVSX
	VEwyh/uyWLqk5vodNvxp44glCnlytOWj3+N7EZMlv9AFQ3jafgds77EoTHiHjOHy9+wO
	YNbDYXlcRzvjtpKwhHYOKFX0NxhACrfrLtsstXlL9JVGtxX/8tat3PukEejaNNPhNYXG
	7krAX5kP3iDfntwQ7ER8cEtYXjgxNRCAhrLHR87tiUdrGKdY5Z0+fjK1wK9h1vTVsE+c
	tcy75vvBW7qwbT983Swj8YDlbVbnJC39ff2QSWPqO/xuIt0KeZPmm8VUu6cZnJ47H+FI
	T2UA==
MIME-Version: 1.0
X-Received: by 10.180.103.65 with SMTP id fu1mr8370181wib.4.1362032931892;
	Wed, 27 Feb 2013 22:28:51 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.180.106.167 with HTTP; Wed, 27 Feb 2013 22:28:51 -0800 (PST)
Date: Wed, 27 Feb 2013 22:28:51 -0800
X-Google-Sender-Auth: jpxaQb3X1PrGMcbL3gz-Cl54yQA
Message-ID: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC minutes 12 February 2013
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
X-List-Received-Date: Thu, 28 Feb 2013 06:45:18 -0000
X-List-Received-Date: Thu, 28 Feb 2013 06:45:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
12 February 2013

Attendees:
  Richard (RP)
  Koen (koen)
  Khem (khem)
  Fray (fray)
  Paul (bluelightning)

Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair
fray
___________________________________
2. new issues

a. mailing list outage
no one sure what went wrong, probably disk space
main problem is nobody around w/admin
 (too few admins at linuxtogo)
possible transition to LF or YP
** list addresses would not change
=> jefro volunteers to help if possible
=> jefro to talk to board + mhalstead & ka6sox

b. meta-oe appends/overlayed recipes RFC
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043925.html
=> Paul to talk to Chris about a release
no avr32 support in public layers

___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. document whitespace changes to the shell
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
also https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> need to de-dup these

 c. SMART has replaced zypper (was documenting RPM and package feeds)
Paul wrote:
https://wiki.yoctoproject.org/wiki/Smart_Repository_Setup

 d. patchwork queue
=> Paul to talk to scottrif about adding to docs

 e. raise ntp with the Yocto Project [RP]
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial
=> RP/Jefro to raise at next AB

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
=> jefro/khem to talk to wmat for help

 c. 1.4 planning
systemd into master - still in progress

________________________________________________________________
Raw Transcript

(8:59:47 AM) Jefro: good morning all
(9:00:40 AM) bluelightning: hi Jefro, fray, RP, koen-
(9:01:57 AM) Jefro: I'm not sure who is actually here
(9:02:03 AM) Jefro: I'll ping khem also
(9:02:06 AM) fray: I'm here
(9:02:30 AM) RP: Morning all!
(9:03:37 AM) fray: morning..
(9:04:08 AM) koen-: morning all
(9:04:32 AM) bluelightning: hi
(9:04:35 AM) bluelightning: ok so we are just missing khem then
(9:04:52 AM) fray: I think so..
(9:05:03 AM) Jefro: I just pinged him, no response so he is probably in traffic
(9:05:03 AM) fray: for the agenda, is there any thing we need to
discuss in relationship to the mail list outtage/
(9:05:25 AM) bluelightning: I think we should have it on the agenda yes
(9:05:35 AM) Jefro: yup, it's there
(9:05:38 AM) RP: I have no idea what happened, not sure if anyone else does
(9:05:45 AM) Jefro: any other new issues? I'll put them on before I pastebin it
(9:06:07 AM) fray: only other thing perhaps is the meta-oe
appends/overlayed recipes RFC..
(9:06:14 AM) fray: but I'm not sure we have anything ot discuss here
(9:07:02 AM) bluelightning: the solutions for most parts seem pretty clear
(9:07:09 AM) fray: ok
(9:07:18 AM) bluelightning: there are a couple of unresolved questions
still though
(9:07:37 AM) Jefro: ok, here it is: http://pastebin.com/PvgKvYMf
(9:08:02 AM) RP: I chaired the last one so someone else today ;-)
(9:08:36 AM) fray: I can do it
(9:09:00 AM) Jefro: fray thanks
(9:09:20 AM) fray: ok then.. I'd suggest we hold off on hte mailig
list outtage topic for a bit and see if Khem gets through traffic..
(9:09:22 AM) fray: ok?
(9:09:36 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:09:36 AM) mode (+v khem) by ChanServ
(9:09:43 AM) fray: hey and here he is!
(9:09:48 AM) bluelightning: nice :)
(9:09:51 AM) fray: ok.. back.. on topic then
(9:09:54 AM) khem: yes, hi all
(9:09:58 AM) bluelightning: hi khem
(9:10:04 AM) fray: khem: http://pastebin.com/PvgKvYMf
(9:10:07 AM) fray: just gettign started
(9:10:13 AM) fray: 2a - mailing list outtage
(9:10:30 AM) fray: As RP mentioned earlier.. nobody is even sure if
anyone knows what went wrong..
(9:10:35 AM) khem: thanks
(9:10:57 AM) bluelightning: the first problem as with last time is
that nobody with admin privileges could be raised for several hours
(9:11:25 AM) khem: no one on US has admin privs
(9:11:26 AM) bluelightning: that's not the fault of the folks with
admin privs, it's that there are too few such people for the
linuxtogo.org servers
(9:11:32 AM) fray: There are two folks who admin privileges?  Florian and?
(9:11:33 AM) khem: so even if we were awake we could not help
(9:11:44 AM) khem: I think RP is
(9:12:21 AM) Jefro: what was the issue that brought it down?
(9:12:35 AM) khem: is ltg maintained well
(9:12:46 AM) koen-: I suspect ltg ran out of diskspace again
(9:12:58 AM) koen-: the backup script seems to need 200GB free
(9:13:00 AM) fray: Symptom wise, that wouldn't surprise me..
(9:13:02 AM) koen-: which there isn't
(9:13:16 AM) koen-: I couldn't upload packages to the angstrom feeds due to that
(9:13:30 AM) koen-: after a few days there was 170GiB available again
(9:13:32 AM) khem: I wonder if it would make sense to move the mls to oe.org
(9:13:42 AM) fray: a few people on IRC were wondering why Linux
Foundation resources (amili servers) aren't being used.. since much of
the other infrastructure has transitioned
(9:13:45 AM) ***RP is not an ltg admin
(9:14:02 AM) khem: gm RP
(9:14:06 AM) fray: amili -> mail
(9:14:10 AM) khem: somehow I thought you were
(9:14:43 AM) RP: We could host the OE list on the yp server if it would help
(9:14:47 AM) koen-: florian, nils and pb are admins
(9:14:57 AM) RP: khem: I am for OE and YP but not ltg
(9:15:01 AM) khem: I think if ltg is not recoursed enough then we
might have these kind of issues often
(9:15:29 AM) khem: if its running out of disk space e.g.
(9:16:00 AM) fray: I know that the usage pattern of both oe-core and
oe-dev have really picked up.. (lots more discussion and patches then
say two years or so ago)
(9:16:09 AM) fray: that may certainly be contributing..
(9:16:24 AM) fray: ok.. so is there anything as the oe-tsc that we
should do or recommend to the board?
(9:16:45 AM) koen-: florian/nils have offered to give admin privs to
people wanting to look after it
(9:17:21 AM) Jefro: I have access to -members (in order to prune) but
not ssh access, so I don't think that counts
(9:17:27 AM) bluelightning: that would be a good first step
(9:17:41 AM) Jefro: I'd be happy to volunteer but it would also
require a small bit of mailman training
(9:17:54 AM) bluelightning: if additional hardware is needed OE should
probably look to pay for it (and request donations for same if needed)
(9:17:58 AM) RP: well, the question is whether we have anyone willing
to help with the admin load of another server
(9:17:59 AM) fray: ya.. getting another person in NA would likely help
the situation..
(9:18:23 AM) fray: is this something that can have a call-out on the
member's list?
(9:18:24 AM) khem: yeah I think we dont know state of ltg. May be its
good enough to handle stuff
(9:18:26 AM) Jefro: I'll take the AR and follow up. I need to learn
more about mailman anyway.
(9:18:36 AM) RP: I know the YP has Michael but I'd really prefer the
lists be hosted on the YP server in those circumstances
(9:18:36 AM) khem: I would suggest to move the services under oe.org
(9:18:54 AM) khem: yp.org is also ok
(9:19:03 AM) fray: I'm not against that either..
(9:19:12 AM) RP: khem: lists.openembedded.org could point at a YP server
(9:19:23 AM) khem: RP: yes
(9:19:27 AM) khem: thats ok by me
(9:19:32 AM) bluelightning: that also sounds OK to me
(9:19:34 AM) RP: Jefro: It does sound more like a general sysadmin
issue. If its out of diskspace, would you know which files to delete?
(9:19:40 AM) khem: if we get better maintenance
(9:19:46 AM) khem: nothing like that
(9:19:58 AM) Jefro: RP not at this point. I'm willing to learn, but it
would probably be better if Michael could do it.
(9:20:06 AM) RP: So it sounds like we need to talk to the board and
Michael. Any volunteers to do that?
(9:20:26 AM) Jefro: that's an AR I can handle :)
(9:20:33 AM) fray: ok, it's you.. :)
(9:20:44 AM) fray: anything else on this topic then?
(9:20:49 AM) khem: Jefro is volunteered
(9:20:54 AM) RP: Technically we need to discuss with the YP too but
I'll take responsibility there and say its fine.
(9:21:28 AM) fray: ok then..  2b -- meta-oe appends/overlayed recipes RFC..
(9:21:32 AM) RP: Jefro: I think the board would agree, right? :)
(9:21:56 AM) Jefro: I would be shocked if the board had any problems,
but we can mention it next week
(9:22:38 AM) bluelightning: so, the issues with this that are still in
question are: tslib; xserver-nodm-init, and gst-ffmpeg/libav
(9:22:42 AM) fray: I see good progress in discussions on the mailing
list -- is there anything we need to discuss here, status/lingering
questions?  I'd certainly like to see the appends go away for the most
part..
(9:23:02 AM) RP: I'd like to thank Paul for raising the issue :)
(9:23:04 AM) fray: Is the PACKAGECONFIG stuff enough for those?  or?
(9:23:04 AM) bluelightning: for reference, the RFC:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043925.html
(9:23:26 AM) RP: tslib is probably a case for putting pressure on
Chris for a release
(9:23:37 AM) bluelightning: RP: that's what I was thinking
(9:23:55 AM) bluelightning: I can take the AR to do that
(9:23:55 AM) RP: We could take the ffmpeg/libav stuff into the core
subject to correct license tags
(9:24:17 AM) RP: xserver-nodm-init I don't know the history of,
probably needs someone to resolve the differences
(9:24:20 AM) RP: It does need to be done
(9:24:20 AM) koen-: bluelightning: feel free to drop the avr32 patch in libmad
(9:24:34 AM) bluelightning: koen-: ok... is it no longer of value then?
(9:25:28 AM) fray: so it sounds like me, we have a clear path for
everything except xserver-nodm-init?
(9:25:42 AM) koen-: bluelightning: no avr32 support in public layers
(9:26:09 AM) bluelightning: koen-: well, there are a few references,
but you're right, no machines that I'm aware of that use that
TARGET_ARCH
(9:26:55 AM) koen-: exactly
(9:27:00 AM) bluelightning: I'd also note generally I'm still waiting
to hear back from Martin Jansa since I figured he might have an
opinion on the RFC
(9:27:17 AM) RP: re: xserver-nodm-init, I probably know some of the
history if there are specific questions
(9:27:46 AM) bluelightning: well, the general question is how can we
eliminate the duplication
(9:27:51 AM) RP: I think its a case of nobody wants to touch it :/
(9:28:00 AM) fray: :)
(9:28:07 AM) bluelightning: so far that has been the pattern, it has
been raised numerous times
(9:28:18 AM) RP: I'd propose deleting the meta-oe version
(9:28:22 AM) RP: see who complains :)
(9:28:27 AM) fray: there ya go.. :)
(9:28:42 AM) bluelightning: JaMa at least would probably have
something to say about that :)
(9:28:43 AM) koen-: RP: martin and I tried to get the meta-oe version
into oe-core a year ago
(9:29:16 AM) fray: I think the key thing, from the original goal of
meta-oe (way back when we first met on oe-core/meta-oe) was to use it
as a temporary space for appends (as necessary).. key being temporary,
until it could be put into oe-core (or dropped)
(9:29:16 AM) koen-: RP: but the oe-core maintainer couldn't grasp our
usecase and it was before the big X.org cleanup
(9:29:51 AM) fray: with the cleanup, does it make sense to try again?
(9:29:52 AM) bluelightning: fray: I don't think that purpose ought to
be supported anymore
(9:30:12 AM) bluelightning: just causes too much mess
(9:30:17 AM) fray: bluelightning I'm inclined to agree with you..
(9:30:26 AM) koen-: systemd-user-sessions are a much better way to do it
(9:30:34 AM) RP: koen-: So rather than explain it further you gave up?
(9:30:36 AM) ***koen- has a ton of recipes to make that work
(9:30:42 AM) fray: I was originally thinking experimental features,
etc.. but always with an eye of getting things into oe-core
(9:30:43 AM) koen-: RP: not really
(9:30:54 AM) koen-: RP: after a while we hit the usual brick wall
(9:31:02 AM) RP: koen-: "usual"?
(9:31:07 AM) koen-: and then we focused on merging the meta-oe X.org stuff
(9:31:26 AM) bluelightning: fray: if people want a shared layer to do
that, I've no objection... as long as it's not the same layer that has
useful stable additional recipes as meta-oe does
(9:31:45 AM) fray: ya, and I think that's one of the things that has changed..
(9:31:55 AM) fray: meta-oe is a lot more stable then it had originally
been thought to be..
(9:32:03 AM) fray: (not a complaint mind you!)
(9:32:09 AM) khem: fray: meta-oe should be seen as extention of oe-core
(9:32:42 AM) RP: My main concern with it has been the mix of distro
policy and recipes
(9:33:03 AM) RP: We're reaching a point where that is nearly resolved
and I think we need to maintain that
(9:33:19 AM) fray: RP, that is the place I'm seeing more focus on from
you and others..  distro policy settings vs simply recipe
integration..  it's a good thing and as you said, we need to maintain
this work..
(9:33:50 AM) fray: I think it speaks highly of the project and users
that distro policy is an issue vs "I can't integrate recipes cause
it's too hard"
(9:34:52 AM) fray: ok then.. what are the next steps to this..
(9:35:11 AM) RP: Its why the YP compatible status spells this out, its
one of the hardest things to achieve yet it also helps the users the
most
(9:35:15 AM) fray: Finish up the work for the packages other then the
xservers-nodm-init..
(9:35:25 AM) fray: work on getting that integrated or dropped as a
separate item?
(9:35:33 AM) bluelightning: fray: well, we've resolved everything
except the xserver-nodm-init, that needs further input from those that
currently use the meta-oe version
(9:35:45 AM) bluelightning: fray: I'm working on patchsets to tackle
everything else
(9:35:46 AM) RP: I don't know what the differences are so its hard to commit
(9:35:51 AM) RP: comment
(9:36:00 AM) fray: and focus on only doing bbappends in oe-core when
specifically necessary -- otherwise it should be in oe-core?
(9:36:14 AM) RP: I would point out that a step by step series of
logical changes does help me a lot with review
(9:36:36 AM) RP: simply copying the meta-oe version over the oe-core
one will not be helpful
(9:37:06 AM) RP: meld is great for creating that kind of thing
(9:37:39 AM) bluelightning: http://pastebin.com/e8DyTP1M
(9:38:45 AM) RP: so rootless X support is one difference
(9:38:45 AM) bluelightning: I can't get much from that diff I have to say
(9:38:58 AM) bluelightning: but I'm not particularly familiar with the
problem space
(9:39:00 AM) RP: and one is machine specific, the other is allarch
(9:39:11 AM) RP: It might be possible just to rename one of them
(9:39:11 AM) khem: hmmm oe-core one is machine_arch specfic
(9:39:21 AM) khem: but meta-oe is allarch
(9:39:27 AM) RP: If angstrom and shr use it in their feeds, I'll take
a rename to the core one
(9:39:37 AM) RP: since there are less distro feed issues with core
(9:40:01 AM) RP: khem: its due to the rootless X support which works
on some machines, not others
(9:40:30 AM) bluelightning: presumably machines with drivers that support KMS ?
(9:40:33 AM) RP: bluelightning: are the scripts themselves different?
(9:40:36 AM) khem: INITSCRIPT_PARAMS change is probablt disto specific
(9:40:42 AM) khem: it should move to distro layers
(9:41:00 AM) RP: bluelightning: Intel gen graphics supports it basically
(9:41:08 AM) RP: khem: sane defaults are fine
(9:41:16 AM) RP: khem: distros can then change if needed/wanted
(9:41:50 AM) khem: yes
(9:41:58 AM) khem: however we have
(9:41:58 AM) khem: -INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
(9:41:59 AM) khem: +INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
(9:41:59 AM) khem: +INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
(9:42:09 AM) bluelightning: RP: yes
(9:42:11 AM) bluelightning: RP: http://pastebin.com/MmPKzZ26
(9:43:10 AM) fray: ok.. lets take this to the mailing list, and go on
to the next topic(s)
(9:43:23 AM) fray: 3a -- janitor/qa bugs.. I don't have anything here
(9:43:26 AM) bluelightning: yep, I think that's probably best
(9:43:29 AM) khem:        yes
(9:43:59 AM) fray: 3b -- has anyone gotten to this yet?  if not we
should keep it on and I'll try to get to it after ELC
(9:44:17 AM) RP: Just to round off, I suspect we should try and make
that recipe allarch for the machines that don't support rootless X
(9:44:28 AM) RP: there don't appear to be many other significant differences
(9:45:34 AM) RP: fray: no one has got to it that I know of
(9:45:38 AM) fray: ok..
(9:45:48 AM) fray: 3c  then.. does anyone remember what this one is
about (RPM and package feeds)?
(9:46:02 AM) RP: fray: documenting them?
(9:46:18 AM) fray: Ahh, very well could be..  Jefro can you add that to the item
(9:46:27 AM) khem: fray: it was probably documenting how to setup
feeds using smart/rpm
(9:46:32 AM) bluelightning: FWIW I did write
https://wiki.yoctoproject.org/wiki/Smart_Repository_Setup
(9:46:37 AM) fray: bluelightning I havn't gotten to that, have you?
(9:46:44 AM) bluelightning: that's a start at least
(9:47:02 AM) fray: excellent..  ok.. we should add the reference to
that as well as the start of whatever we do..
(9:47:09 AM) RP: What else remains?
(9:47:09 AM) fray: ok.. 3d -- patchwork queue?
(9:47:10 AM) bluelightning: we probably ought to have that in the
manual, I can take an AR to talk to Scott about that
(9:47:16 AM) fray: thanks
(9:47:25 AM) RP: bluelightning: please do, it'd be good to get it in there
(9:47:34 AM) RP: Scott loves me this week :/
(9:47:37 AM) bluelightning: re patchwork, I think Martin is doing a
good job of keeping on top of it now; I'm continuing to help when I
notice things
(9:47:41 AM) Jefro: fray added to my notes
(9:48:10 AM) khem: bluelightning: yes I am very happy with
meta-openembedded queue is always sane
(9:48:12 AM) bluelightning: (note, we're talking about the main OE
patchwork, not OE-Core / bitbake)
(9:48:12 AM) fray: bluelightning does 3d need to remain on the issues
list, or is it under control?
(9:48:16 AM) RP: otavio was asking about patchwork for one of his layers
(9:48:18 AM) khem: remove it
(9:48:22 AM) bluelightning: fray: I think we can drop it now
(9:48:25 AM) fray: ok
(9:48:38 AM) fray: 3e - NTP -- RP did you get a chance to talk to the YP?
(9:48:41 AM) bluelightning: khem: yes I think Otavio might be pinging you soon
(9:48:48 AM) RP: fray: AB meeting next week
(9:48:51 AM) fray: ok..
(9:48:57 AM) khem: bluelightning: yes he has :)
(9:48:59 AM) fray: 3f then.. oe-classic recipe migration status
(9:49:06 AM) RP: Jefro: this is on the agenda, right?
(9:49:21 AM) khem: I have contributed a few migrations from oe-classic
(9:49:21 AM) ***Jefro looks
(9:49:29 AM) khem: into different layers
(9:49:39 AM) Jefro: RP yes, 3f
(9:49:39 AM) RP: I have a few migrations for oe-classic, need to post them...
(9:49:46 AM) RP: I assume i just send to the oe-devel list?
(9:49:48 AM) bluelightning: RP: please do
(9:49:58 AM) RP: Jefro: I mean the AB meeting agenda?
(9:50:00 AM) khem: I think we now have a good set I feel
(9:50:02 AM) bluelightning: RP: yes, with [meta-oe] prefix
(9:50:15 AM) ***RP must remember to do that
(9:50:18 AM) bluelightning: FWIW I'm continuing to keep the wiki page up-to-date
(9:50:29 AM) RP: it mostly perl modules
(9:50:31 AM) Jefro: RP ah - yes it is (one of the only things on the
AB agenda atm)
(9:50:40 AM) RP: Jefro: ok, cool
(9:50:42 AM) fray: so 3f should stay on the agenda for a bit longer?
(9:50:43 AM) bluelightning: I'll note that a few bits that have been
dropped from OE-Core recently have not yet made it into meta-oe
(9:51:05 AM) fray: bluelightning, does that need a tracking item -- or
are we good?
(9:51:16 AM) RP: bluelightning: Beat up Ross?
(9:51:26 AM) bluelightning: RP: I pinged Ross about it, but am unsure
if he's going to post patches or not
(9:51:44 AM) RP: bluelightning: ok, I'd assumed this was being
handled. Need to make sure things don't get lost
(9:52:00 AM) fray: jefro, I'd suggest a tracking / issues agenda item
then for next time..
(9:52:05 AM) fray: oe-core items (removed) going to meta-oe
(9:52:12 AM) bluelightning: might as well
(9:52:15 AM) Jefro: fray ok
(9:52:16 AM) RP: bluelightning: get a definitive answer out of Ross,
if he hasn't time, let me know, you/I will probably have to
(9:52:23 AM) bluelightning: RP: ok, will do
(9:52:37 AM) fray: 3g then -- is this a duplicate of 3c?
(9:52:46 AM) RP: fray: looks to be
(9:53:00 AM) fray: I'd say drop 3c then -- add the reference to pauls
page to 3g.. for next time
(9:53:12 AM) fray: ok any other lingering issues?
(9:53:28 AM) bluelightning: we still have wiki spam issues
(9:53:35 AM) bluelightning: I guess that's 4b
(9:53:46 AM) fray: ok.. lets just jump to 4b then..
(9:53:51 AM) khem: yes wiki spam issue is still there
(9:53:59 AM) khem: we need to cut open registration
(9:54:00 AM) RP: How are the people getting accounts?
(9:54:00 AM) khem: that helps
(9:54:04 AM) bluelightning: we're starting to see more actual spam
content being added
(9:54:07 AM) bluelightning: RP: not sure
(9:54:08 AM) fray: I thought open regs were already disabled
(9:54:21 AM) khem: RP: someone with account has to sponsor
(9:54:24 AM) khem: on mailing list
(9:54:35 AM) RP: sounds like its an old version of the wiki and needs upgrading
(9:54:42 AM) RP: probably has some hole in it :/
(9:54:51 AM) bluelightning: wouldn't be too surprising
(9:55:01 AM) khem: RP: its media wiki I think from last year
(9:55:01 AM) RP: I know when I looked, I noted it was old
(9:55:09 AM) RP: khem: way too old :(
(9:55:14 AM) Jefro: it could also be that a legitimate person's
account has been compromisaed and that is being used to sponsor
(9:55:14 AM) khem: heh I guess
(9:55:14 AM) bluelightning: is it hosted on ltg or oe servers?
(9:55:19 AM) RP: bluelightning: oe
(9:55:23 AM) khem: I am not familiar with wiki upgrade
(9:55:31 AM) khem: but RP if you or someone knows it
(9:55:35 AM) khem: it would be nice
(9:55:51 AM) RP: khem: I've never done it before in my life. I have
enough general software background to fudge it
(9:55:53 AM) Jefro: I know someone with wiki experience & can check to
see if he can help
(9:56:11 AM) khem: I can see if wmat has some time
(9:56:14 AM) fray: sounds like a good suggestion
(9:56:18 AM) Jefro: khem :) that's who I was thinking of
(9:56:27 AM) khem: Jefro: cool ping him
(9:56:33 AM) Jefro: doing right now
(9:56:46 AM) RP: I suspect an upgrade will fix some of the problems
(9:56:54 AM) khem: hopefully
(9:57:17 AM) khem: turnkey linux has good wiki appliances
(9:57:19 AM) fray: ok.. any other infrastructure issues?  (we already
covered mailing list)
(9:57:37 AM) khem: fray: 3g could be closed
(9:57:44 AM) khem: I missed if it was already discussed
(9:57:48 AM) fray: khem, the documentation bit isn't done yet
(9:58:21 AM) khem:
https://wiki.yoctoproject.org/wiki/Smart_Repository_Setup isnt it
enough ?
(9:58:47 AM) khem: more documentation is always nice so keep it open
:) I dont mind
(9:58:50 AM) fray: it needs to end up in the manual -- and at the
least a link on the oe-core site..
(9:58:54 AM) khem: I se
(9:58:55 AM) khem: e
(9:59:26 AM) fray: ok.. 4a then.. oe-core release?
(9:59:38 AM) fray: (we've got 1 minute left)  ;)
(9:59:39 AM) khem: on systemd, I am trying to port over the meta-oe
bbappends to systemd class of oe-core
(10:00:18 AM) fray: 4c -- systemd --  khem, does it look like
everything will be ported in time for the "spring" release of oe-core?
(10:00:36 AM) RP: the -rc2 did happen, it did get rerun a second time
as I wasn't happy with the first build
(10:00:42 AM) RP: Its now been released
(10:00:49 AM) fray: excellent..
(10:00:51 AM) RP: we're trending ok for M4
(10:00:53 AM) khem: fray: I am trying
(10:00:55 AM) fray: ok
(10:01:03 AM) RP: lots of postinstall changes but looking good at the moment
(10:01:04 AM) khem: fray: hope is to have it in 1.4 done
(10:01:14 AM) fray: ...and with that, times up...  anything else
before we all flee?
(10:01:22 AM) khem: nothing frm me
(10:01:23 AM) RP: we need sort out the remaining pieces of systemd but
again, its trending well
(10:01:23 AM) bluelightning: I've got nothing else
(10:01:29 AM) ***RP is done
(10:01:37 AM) fray: excellent..
(10:01:40 AM) fray: meeting done then..
(10:01:42 AM) fray: thanks all!
(10:01:49 AM) khem: thanks all

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


