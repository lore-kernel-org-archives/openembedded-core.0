Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1U551t-00052j-3N; Tue, 12 Feb 2013 02:52:04 +0100
Received: by mail-lb0-f174.google.com with SMTP id l12so4988755lbo.5
	for <multiple recipients>; Mon, 11 Feb 2013 17:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=/UzyFeXIyyOv2SADNt8FFY1SGVLp2134NJxbr/iHuEo=;
	b=IJdcfVNQKU0tZTEML57uOOjqQpA1NrFfMiV+fWMbZpDvceL7b2F1NWYnAo8SZQgUIK
	xecTE8XKvCT7FVI/WQaBmN1ponOv8iuM/fipnVGO+cXPFUhpWseEba5+N33XAQOthAZ8
	u4LfonYr5UY08WrFS/DW2PPOcSI1V73RLU33Wh9g8lBh1t9j3XI2KUT9fecG4If024v6
	Z3HqL84fWqrFJPvWWIwLZk7q8lhG85vwfW9xPtUpKHENXdAWXHUp+CcaOel8pdG8NdAs
	HpeNJGL2it/3sPZG0gkKFcolwb7ouULeHMxo5Iv5N2O622YoFr5qvCcYJgyq6AYpQGnj
	Werw==
MIME-Version: 1.0
X-Received: by 10.152.114.66 with SMTP id je2mr14704837lab.40.1360632929911;
	Mon, 11 Feb 2013 17:35:29 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.112.46.8 with HTTP; Mon, 11 Feb 2013 17:35:29 -0800 (PST)
Date: Mon, 11 Feb 2013 17:35:29 -0800
X-Google-Sender-Auth: D9obPtlK69R3wXBGzY8TVNj6HJE
Message-ID: <CA+YB3ra7eeh3R3-f=YU2CB6d1nX3WA_YaDCYj6mx799qQzS4bw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OpenEmbedded Technical Steering Committee - 29 January 2013
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
X-List-Received-Date: Tue, 12 Feb 2013 01:52:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
29 January 2013

Attendees: Richard, Koen, Khem, Fray
Apologies: Paul

Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair
RP
___________________________________
2. new issues


___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. document whitespace changes to the shell
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
also https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> need to de-dup these

 c. RPM and package feeds

 d. patchwork queue

 e. raise ntp with the Yocto Project [RP]
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial
=> RP/Jefro to raise at next AB

 f. oe-classic recipe migration status
RP played with perl modules, fixed up cpan_build.bbclass

 g. SMART has replaced zypper
=> paul to document how to use smart, set up remote feed

___________________________________
4. status

 a. oe-core release
just built out and tested 1.4M3-rc1
there will likely be an rc-2
read-only rootfs work progressing (with unionfs)

 b. infrastructure
 mailing list difficulties: some have trouble with git+sendmail
   possibly they haven't confirmed their subscription before submitting
 wiki status & spambot protection
   free signups have been turned off for wiki as well as patchwork

 c. 1.4 planning
 systemd into master - still in progress

________________________________________________________________
Raw Transcript


(8:59:05 AM) mode (+v Jefro) by ChanServ
(8:59:13 AM) RP: hi Jefro
(8:59:14 AM) koen: I hope he gets well soon
(8:59:15 AM) RP: Paul can't make it today (he's unwell)
(8:59:25 AM) RP: (for Jefro's benefit)
(8:59:30 AM) Jefro: Good morning
(8:59:32 AM) ***RP too
(8:59:36 AM) Jefro: thanks - I heard Paul was sick
(9:01:47 AM) Jefro: I'm putting an agenda together from the 12/4
meeting, which was the last one
(9:02:05 AM) fray: ok
(9:02:34 AM) fray: (BTW I can't run todays meeting, when you look for
volunteers, I got tripple booked for meetings)  :P
(9:02:53 AM) RP: fray: I love it when that happens and you're told you
can just attend all of them :/
(9:03:06 AM) koen: conference call here as well
(9:03:11 AM) koen: on  mute so I can IRC and eat :)
(9:03:25 AM) ***RP clearly didn't step backwards fast enough
(9:03:30 AM) fray: hah
(9:03:37 AM) Jefro: this seems to be a growing trend
(9:03:46 AM) RP: Any word on Khem?
(9:04:07 AM) ***RP can volunteer to chair
(9:04:23 AM) RP: Does anyone have any agenda topics?
(9:05:19 AM) fray: Only thing I can think of are the follow ups to the
items fast the last meeting (and mailings around that time).. i.e.
status of the wiki, spam-bot prevention, and such..
(9:05:46 AM) koen: no, I'm still catching up on what happened the past
2 months in OE land
(9:06:09 AM) ***RP is still catching up from vacation
(9:06:34 AM) Jefro: agenda in 15 seconds...
(9:06:52 AM) ***RP recommends the recent changes to "bitbake -e" to the house
(9:06:59 AM) Jefro: http://pastebin.com/uD6bFuhY
(9:07:05 AM) RP: gives variable dependency information now :)
(9:07:27 AM) RP: ok, pick a chair - RP
(9:07:42 AM) RP: do we start or wait longer for Khem?
(9:08:16 AM) RP: Does anyone know how we're doing on the wiki status?
(9:08:41 AM) ***RP doesn't
(9:09:28 AM) RP: Looking at the lingering issues list, no comments on
3a/b/c. Not sure if anyone else has any
(9:09:39 AM) fray: pre/post install scripting item can go..  I think
that is all well in hand..
(9:09:54 AM) RP: fray: agreed, it does seem to be getting resolved atm
(9:10:04 AM) RP: For 3d, Jefro and I both failed to sort this at the
last AB meeting. We'll take an AR to do better on that
(9:10:26 AM) RP: For g, I recently played with perl modules a bit
(9:10:59 AM) RP: Need to share the files somewhere but fixed up
cpan_build.bbclass which was broken in OE-Core at some point
(9:11:07 AM) RP: 3h is now done
(9:11:13 AM) RP: was done ages ago :)
(9:11:28 AM) fray: i -- smart has replaced zypper
(9:11:29 AM) RP: and I'm not sure if 3i was documented or not - fray?
(9:11:49 AM) fray: Ya, I know Paul had a work-in-progress page
explainign how to setup a feed..
(9:11:54 AM) fray: but I don't know if it ever got finished
(9:12:10 AM) RP: perhaps leave to the next meeting for Paul to comment then...
(9:12:17 AM) fray: I'd change the description of that, but leave it
open..  SMART -has- replaced zypper.. then keeps paul's AI
(9:12:33 AM) RP: sounds good
(9:12:42 AM) RP: So moving onto 4
(9:12:57 AM) RP: OE-Core release - we just built out and tested 1.4M3-rc1
(9:13:19 AM) RP: My personal opinion is this is going to a -rc2 as
there are too many issues in -rc1 and the autobuilder isn't happy
(9:13:37 AM) fray: I do have a question..  the read-only root patches
and volatile stuff... is that going to be M4 or is it still to
fragile?
(9:14:01 AM) fray: are there any other changes that are making lots of
go-arounds and that should go in?
(9:14:02 AM) RP: Lets just say I have made my thoughts on this known
to appropriate people and hopefully some process changes will help
(9:14:33 AM) RP: fray: good questions. I know the ro-rootfs changes
and on target multilib gcc have been going around a lot
(9:14:50 AM) fray: ya, the multilib gcc is the other one I saw and
couldn't remember offhand..
(9:14:55 AM) RP: In the end I've suggested we go with unionfs for the
ro rootfs support
(9:14:59 AM) fray: my concern is that stuff doesn't get lost here..
(9:15:15 AM) fray: RP, in the past I've had problems with unionfs..  I
don't know if the stability has improved since then..
(9:15:25 AM) fray: (I've stayed away from it for the last couple of
years due to the problems..)
(9:15:28 AM) RP: fray: We've had problems with it as a mount on /
(9:15:38 AM) RP: fray: I'm hoping its good enough on /var/lib
(9:15:38 AM) fray: ya, thats where I had issues..
(9:15:49 AM) fray: ok
(9:15:51 AM) RP: Note ro-rootfs only needs it on /var/lib
(9:16:09 AM) RP: we may or may not choose to make it a / mount in future
(9:16:18 AM) fray: so still in progress -- maybe M4...
(9:16:26 AM) RP: it likely will make M4
(9:16:46 AM) RP: As for the gcc ones, I've been working on those with
Constantin and the last set posted today will go in if they don't
break on the autobuilder
(9:16:55 AM) fray: works for me..
(9:16:57 AM) RP: We've dealt with my concerns now
(9:17:05 AM) RP: Took a lot of work to get them right
(9:17:21 AM) fray: are there any other big issues with the 1.4 work
then?  I know there are a lot of small issues that together are
causing the autobuilder and related
(9:17:29 AM) RP: There are a lot of smaller things floating around,
I'm not aware of anything else big that is pending afaik
(9:17:35 AM) fray: thanks
(9:17:46 AM) RP: I did deal with the bitbake dependency tracking stuff finally
(9:17:56 AM) RP: We do have some of Jason's interactive logging stuff pending
(9:18:05 AM) fray: dependency -- variable tracking?
(9:18:07 AM) fray: or something else?
(9:18:17 AM) RP: both variable and include tracking
(9:18:20 AM) fray: ahh ok
(9:18:22 AM) RP: (from Seebs)
(9:18:24 AM) koen: speaking of gcc, on-target gcc is broken and a
security risk because OE puts --sysroot=/path/to/buildmachine into the
spec
(9:18:37 AM) RP: Jason's patches are pending a proper interactive
bitbake shell and Jason knows that
(9:18:43 AM) fray: is there anything we should be doing to advertise
this (at this time)?
(9:18:51 AM) fray: yup...
(9:19:12 AM) RP: koen: bugzilla entry for it would be appreciated
(9:19:29 AM) koen: will do, if khem doesn't beat me to it
(9:19:33 AM) RP: fray: I've been advertising bitbake -e in appropriate places
(9:19:42 AM) fray: ok
(9:19:51 AM) RP: help welcome of course
(9:20:42 AM) RP: Is there anything else pending anyone is aware of?
(9:20:54 AM) RP: I've been making an effort to try and get things rounded out
(9:21:17 AM) RP: For 4b, I don't have any comment really
(9:21:28 AM) fray: 4b -- one metion, a few people have mentioned to me
in passing they've been having problems subscribing and sending
patches to the oe-core list via git send-email..
(9:21:50 AM) fray: I don't really have any further info, but we should
see if we have a system issue -- or if it's isolated..
(9:21:51 AM) RP: fray: It usually seems to be user error on the local
mail setup?
(9:21:51 AM) Jefro: is it possible khem turned up the spam checking?
(9:22:10 AM) fray: they keep getting bounces that they're not
subscribed.. and then they resubscribe..
(9:22:18 AM) fray: for some reason there subscriptions keep going away..
(9:22:22 AM) fray: maybe spam related?
(9:22:28 AM) fray: maybe it's their mailers problem too..
(9:22:56 AM) fray: I don't know anything beyond they were complaining
that they keep subscribing and then getting subscription failures on
sending
(9:23:11 AM) RP: If anyone can track it down or provide more info,
great but I don't see what the TSC can do
(9:23:26 AM) Jefro: I'll take an AR to talk with Khem and see if there
is anything to be done
(9:23:31 AM) RP: For 4c, PR bumps and PR server, the changes all
landed. There are some migration issues and we've done work to improve
that
(9:23:34 AM) fray: Agree.. just marking it on infrastructure that if
it seems like others are having a problem -- we might have a mailer
issue
(9:23:35 AM) fray: thats it
(9:24:15 AM) fray: have setup-usage instructions been posted yet
(9:24:32 AM) RP: I don't have much more to say about 4c other than it
seems to be going to plan and we managed to clean up some nasty stuff
in bitbake at the same time as a bonus
(9:24:54 AM) RP: re: pre/post install scripting, I think again, good
progress and trending well. Ties in well with the ro-rootfs work
(9:25:06 AM) fray: ya.. that can be removed..
(9:25:14 AM) fray: ohh one note..
(9:25:16 AM) RP: SMART is now merged, a few potential issues around but in hand
(9:25:39 AM) fray: it seems like the one script that isn't being run
post-install is the update-modules..  that is something that may take
refactorign to work in a cross install environment..
(9:25:49 AM) RP: fray: we removed it?
(9:26:20 AM) fray: Hmm.. maybe my image had a bug in it then.. I
thoguht it was still there as of two weeks ago
(9:26:34 AM) Jefro: systemd status?
(9:27:01 AM) RP: fray:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=173a61826305838ba56a9da50491e657b4843f56
(9:27:13 AM) RP:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=36a64307274c5940332ceb139d2b4eff33663e29
(9:27:22 AM) RP: Jefro: getting there ;-)
(9:27:36 AM) fray: excellent..
(9:27:53 AM) RP: fray: so basically, we tweaked something else and
then removed update-modules entirely
(9:28:16 AM) RP: With systemd, we decided to merge initial support for
core-image-minimal in M3
(9:28:26 AM) RP: There is still code pending which is being worked on for M4
(9:28:51 AM) RP: So its making forward process and going as fast as we
can make it whilst still doing a good job of it
(9:29:56 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:29:59 AM) mode (+v khem) by ChanServ
(9:30:29 AM) Jefro: So, that about wraps it up
(9:30:39 AM) Jefro: (sorry, had to say that for khem's benefit)
(9:30:45 AM) fray: :)
(9:30:49 AM) RP: Jefro: Its also true!
(9:30:58 AM) RP: We have reached the end of the agenda
(9:31:00 AM) khem: sorry guys daughter is running hight fever had to
be driving her back home
(9:31:10 AM) Jefro: heh, it is, although perhaps we can discuss 4b
(9:31:11 AM) fray: khem, no worries.. Paul's sick as well..
(9:31:17 AM) khem: thats fine
(9:31:20 AM) RP: khem: any updates on the wiki and spam?
(9:31:41 AM) khem: RP: not much, Tom K talked to wmat
(9:32:00 AM) khem: and they concluded that free signups has to be turned off
(9:32:15 AM) RP: khem: ok, annoying but I can understand why :/
(9:32:20 AM) khem: we have done same for patchwork
(9:32:39 AM) RP: khem: There are also questions being raised about the
mailing list bouncing emails from people trying to send using git
commands
(9:32:57 AM) khem: yes its kind of painful to mamually delete those
bogus account
(9:33:22 AM) RP: khem: I know, I removed thousands of them from the
wiki at ELC-E
(9:33:30 AM) khem: RP: hmmm ok. I dont administer mls but I will ask Tom
(9:33:39 AM) RP: fray: any info you want to add?
(9:33:47 AM) fray: khem, it as a comment sent to me in passing by a few people..
(9:34:08 AM) khem: fray: ok, if its persistent
(9:34:09 AM) fray: I have few details other then they said they have
subscribed.. and then went to send patches using git send-email ... at
which point they got a response back that they were not subscribed to
the list..
(9:34:12 AM) fray: rinse, repeat..
(9:34:37 AM) khem: fray: hmm the ml administration is on a different server
(9:34:39 AM) fray: but thats all I have for details.. I told them if
it keeps happening to send me details, but I haven't gotten anything
back yet.. I have no idea if it's user error, their mail server or the
oe ml servers..
(9:34:47 AM) khem: and the wiki policy should not impact that
(9:35:07 AM) khem: fray: ok. sometimes elzim sends a confirmation of
subscription request
(9:35:12 AM) fray: ya.. this is unrelated to the wiki policy -- but
just another infrastructure issue.. if it's only these couple of
folks, I'd say it's something they are doing..
(9:35:19 AM) khem: and unless people confirm signus is not activated
(9:35:28 AM) fray: but we should watch and see if others complain..
(9:35:30 AM) khem: sometimes people forget that
(9:35:37 AM) khem: fray: yes definitelt
(9:35:39 AM) fray: ya could be
(9:36:05 AM) khem: I am happy with smart it figured lot of missing RDEPENDS
(9:36:21 AM) khem: so I think smartpm is a betterment
(9:36:31 AM) fray: ya.. it's been working well for me...
(9:37:13 AM) RP: If nobody has anything else I'll officially close the meeting
(9:37:26 AM) fray: sounds good to me


--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


