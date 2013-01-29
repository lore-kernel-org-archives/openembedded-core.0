Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Tzzzi-0002vp-48; Tue, 29 Jan 2013 02:28:14 +0100
Received: by mail-lb0-f177.google.com with SMTP id go11so58177lbb.22
	for <multiple recipients>; Mon, 28 Jan 2013 17:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=KDN3i30Jfc7qzb4XLgGig3mGwuFekN3Eo8ibqMmnFkg=;
	b=XfC3R/lOpiWNm/pvXjCqvMrAM60cqDGl8biYb6O48hQelHDHL9APpyX+XOB3JYCCIn
	tdWxiFLq24XaXwUVGGSGaFLbdWRx/ls9rMG9VKfmn5mcrvIStftIZpOpDwg3svHdpHrf
	Ssg1Dj3Trt0ySEDzamujDmj8qMCXxfrDhSZ9EzDwsy7SSpO8cza1HbRSk2ukrCB+j7XI
	LxCIujerZpJPVA1VCS9RwtvIvjmsEfcEY5lexlYr9Ua5Qjhw6Ug6aobcO8mvI8zEL93s
	FycNXKwKm4X2CZNuxh7sH4E+cXyU7O82vWwH9u2YLgj4KxDkS6dhZ5SHMtcixB+uQSqQ
	WqNg==
MIME-Version: 1.0
X-Received: by 10.152.108.195 with SMTP id hm3mr14977223lab.17.1359421954403; 
	Mon, 28 Jan 2013 17:12:34 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.112.79.13 with HTTP; Mon, 28 Jan 2013 17:12:34 -0800 (PST)
Date: Mon, 28 Jan 2013 17:12:34 -0800
X-Google-Sender-Auth: lnDIp-Pmrfl20n7tHKJPu8skRz4
Message-ID: <CA+YB3rYnsCwsGuFdb=kxKMDZ9Xia-XQf7UQET2bCz-cwsCPXsw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 4 Dec 2012
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
X-List-Received-Date: Tue, 29 Jan 2013 01:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
4 December 2012

Attendees: Mark, Paul, Richard, Khem
Apologies: Koen
Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair
bluelightning
___________________________________
2. new issues

 a. RFC for the secondary toolchain (fray)
secondary toolchain info was added to Wiki
- http://www.openembedded.org/wiki/Adding_a_secondary_toolchain

 b. RPM and package feeds
bluelightning: Mark and I have been working on Smart integration
patches are being sent out

 c. patchwork queue
    bluelightning did a massive clearout of patchwork, got rid of 3 pages
    a number of oe-classic patches left
    koen notes that git hooks catch only 80% of patches, and then only
for master
    known to fail with accented names
=> koen to go through what is left in patchwork for meta-oe
=> bluelightning to send note to ml re oe-classic patches
bluelightning I'm keeping an eye on the queue and tidying it
haven't sent out a mail about the OE-Classic patches yet but will try
to do so this week
some issues with git -M

 d. raise ntp with the Yocto Project [RP]
paul patch to remove default to pool.ntp.org, now in meta-networking
master and req for danny
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial

 f. wiki
bluelightning did much work based on meetings in Barcelona
RP helped by deleting some old information

 g. oe-classic recipe migration status
paul and martin updating, khem working as well
http://www.openembedded.org/wiki/OE-Classic_Recipes_A-I
http://www.openembedded.org/wiki/OE-Classic_Recipes_J-Z

 h. FILESDIR & FILESPATH: FILESDIR deprecated, time to remove
and prune out the remaining FILESDIR references
=> paul to add FILESDIR to recipe migration info
 http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
=> RP write OVERRIDES change patch soon, then done
will drop code entirely from bitbake in 1-2 releases

 i. SMART replacing zypper
patches being sent for review today
=> paul to document how to use smart, set up remote feed
fray notes that smart does not support delta-rpms (zypper did)
___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. pre/post install scripting (fray)
Laurentiu Palcu working on this

 c. document whitespace changes to the shell
    RP edited OE style guide with new info, linked to YP
=> fray to update patch guidelines
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
also https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> need to de-dup these

___________________________________
4. status

 a. oe-core release
1.4 is open for development now

 b. infrastructure
Tom & Martin working on setting up jenkins
Michael helping with cgit load issues
pending: autobuilder
=> khem to ping Martin for some cycles

 c. 1.4 planning
   PR issues - in progress
setup instructions needed
proposal is to close out the open bugs, document things and announce a
date we stop taking PR bumps
RP sent RFC about incremental numbers in PV from git fetcher
  to use same db as PR server rather than bitbake's builtin code
  Constantin to send patch implementing, RP to merge at same time
    stop taking PR bumps
pre/post install scripting - in progress, Laurentiu working
SMART - nearly done, patches submitting today
systemd into master - in progress, Radu has WIP branch on poky-contrib

________________________________________________________________
Raw Transcript

(8:56:58 AM) mode (+v Jefro) by ChanServ
(8:58:05 AM) bluelightning
[~paul@pdpc/supporter/professional/bluelightning] entered the room.
(8:58:15 AM) bluelightning: hi fray, Jefro, RP
(8:58:28 AM) RP: hi bluelightning
(8:59:30 AM) fray: I'm here.. but will be distracted for a minute or
so.. need to send this review request to the oe list
(8:59:35 AM) ***bluelightning is hoping for an improved turnout for
this meeting...
(9:00:13 AM) Jefro: bluelightning hope so. I sent a reminder yesterday
afternoon.
(9:00:23 AM) bluelightning: Jefro: yep saw that, thanks
(9:00:29 AM) fray: bluelightning ok.. the bug fix portion of the smart
integration is sent..
(9:00:35 AM) ***fray is no longer distracted.. :)
(9:00:50 AM) bluelightning: cool :)
(9:01:25 AM) khem [4281e024@gateway/web/freenode/ip.66.129.224.36]
entered the room.
(9:01:33 AM) khem: here I am
(9:01:49 AM) khem is now known as Guest27453
(9:01:59 AM) Guest27453: power blip yesterday meant my machine running
IRC is offline
(9:02:27 AM) bluelightning: hi khe- I mean Guest27453
(9:02:42 AM) fray: :)
(9:02:44 AM) Guest27453: yeah I am powering that box up
(9:03:27 AM) Jefro: anyone seen koen?
(9:04:50 AM) bluelightning: I've pinged him
(9:05:30 AM) Guest27453 is now known as khem__
(9:05:51 AM) khem__: ah there I unfurled my tail a bit and it likes it
(9:06:21 AM) Jefro: last agenda is here: http://pastebin.com/MkgaJpbc
(9:07:25 AM) bluelightning: khem__: :)
(9:07:29 AM) bluelightning: I'll chair if nobody else wants to
(9:07:36 AM) Jefro: I added an agenda item to trim down the agenda, it
is getting unwieldy - but that can be just for me ;)
(9:07:38 AM) RP: bluelightning: go for it ;-)
(9:07:40 AM) fray: works for me
(9:07:49 AM) bluelightning: Jefro: good idea, it is getting a bit long
(9:07:54 AM) RP: Jefro: it is getting a bit long
(9:08:08 AM) ***Jefro hears an echo...
(9:08:21 AM) bluelightning: so, 2a - RFC for the secondary toolchain
(9:08:33 AM) fray: 2a - secondary toolchain info was added to Wiki -
http://www.openembedded.org/wiki/Adding_a_secondary_toolchain
(9:08:50 AM) fray: Not sure if we as the TSC need to do anything
further on this or we can likely drop it..
(9:09:08 AM) ***Jefro will report & drop
(9:09:12 AM) bluelightning: if it's been mentioned on the mailing list
I think we can say we're done on that one
(9:09:28 AM) fray: I thought I sent it out.. if not, I will..
(9:09:31 AM) ***fray checks
(9:09:34 AM) bluelightning: ok, cool
(9:09:46 AM) RP: sounds good to me, call it done
(9:09:46 AM) bluelightning: 2b. RPM and package feeds
(9:10:03 AM) fray: yes it was sent out 11/13
(9:10:10 AM) fray: RFC: Secondary Toolchain -- Followup
(9:10:23 AM) bluelightning: Mark and I have been working on Smart
integration for this, patches are in the process of being sent out
(9:10:28 AM) RP: I think that is being tracked fine on the mailing
list, we can drop from TSC agenda?
(9:10:39 AM) bluelightning: yep I agree
(9:10:46 AM) fray: Sounds fine with me
(9:10:49 AM) ***Jefro drops from agenda
(9:10:59 AM) bluelightning: 2c. patchwork
(9:11:15 AM) bluelightning: I'm keeping an eye on the queue and tidying it
(9:11:32 AM) bluelightning: haven't sent out a mail about the
OE-Classic patches yet but will try to do so this week
(9:11:34 AM) RP: bluelightning: cool. I have to admit I don't track it
(9:11:40 AM) khem__: I havent seen any updates to patchwork that can
fix the accented char issue
(9:11:50 AM) bluelightning: (this is the OE one, I don't touch the
OE-Core / bitbake ones)
(9:11:51 AM) khem__: I have been keeping an eye on it
(9:12:21 AM) khem__: bluelightning: OE-Core ones are fine some of them
get closed automatically but may not be all
(9:12:21 AM) bluelightning: khem__: I've also noticed another pattern,
git patches sent with -M that only move files are ignored too
(9:13:05 AM) bluelightning: ok, let's leave this one on the agenda for
the time being I think
(9:13:06 AM) khem__: I asked for closing down the OE-Core from pw but
folks use it as reference for cherry picking or citing in mails etc.
(9:13:42 AM) khem__: I will see if I can raise some bugs on pw ml
(9:13:52 AM) bluelightning: khem__: thanks, that would be great
(9:14:22 AM) bluelightning: if no further comments, 2d - raise ntp
with the Yocto Project
(9:14:46 AM) RP: not done yet. Jefro - can you add to the next AB
meeting agenda?
(9:15:00 AM) bluelightning: FYI I produced a patch to remove the
default to pool.ntp.org and this is now in meta-networking master;
it's been requested for danny as well
(9:15:17 AM) RP: bluelightning: sounds good
(9:15:23 AM) Jefro: RP will do
(9:15:32 AM) bluelightning: so the immediate need is addressed but a
reasonable default for where we want ntp might still be worth having
(9:15:54 AM) RP: bluelightning: well, OE should really register a pool
and we'll see what YP wants to do
(9:16:10 AM) bluelightning: depends what the utility of such a pool is
(9:16:16 AM) khem__: I think we can use COMMERCIAL_LICENSE var to
guard the default servers for time being
(9:16:18 AM) khem__: isnt it
(9:16:24 AM) fray: sorry one note on the 2d..
(9:16:41 AM) fray: in respnse to an OE (netperf) item.. I suggested
that the license flag we want to use in "non-commercial"
(9:16:51 AM) fray: I think this fits well with what we talked about
for the ntp configuration as well..
(9:17:02 AM) fray: if the non-commerical flag is not set, then we
don't want to use our ntp config
(9:17:36 AM) bluelightning: that sounds reasonable
(9:17:55 AM) bluelightning: if it's not set we can default to the new
behaviour of nothing configured
(9:18:07 AM) fray: my interpretation is:  commercial means I'm willing
to deal with commercial requirements..  non-commercial means, I'm not
building a commercial device
(9:18:15 AM) fray: there is a lot of area between the two.. ;)
(9:19:09 AM) ***Jefro notes that 2e is a duplicate of 2a
(9:19:22 AM) bluelightning: yep, we can drop 2e I think
(9:19:26 AM) fray: ahh yes..
(9:19:39 AM) RP: yes, duplication
(9:19:51 AM) bluelightning: if nothing further on 2d... 2f - wiki
(9:19:52 AM) fray: one further comment.. no response from the mailing
list on that..  so I assume everyone thinks it fine (until someone
finds a bug, and then we'll address it)
(9:20:03 AM) RP: fray: yes
(9:20:10 AM) bluelightning: yep sounds reasonable to me
(9:20:17 AM) RP: For 2f, does the TSC need to track this further?
(9:20:27 AM) bluelightning: no I think that can be dropped as well
(9:20:47 AM) RP: bluelightning: perhaps as a final action, draw
attention to the fact it has been cleaned up?
(9:20:51 AM) fray: I agree drop it... we just need to keep doing it
occasionally..
(9:20:56 AM) bluelightning: yes I need to send out a general note
about what we did and what still needs to be done but that's an AR for
me
(9:21:19 AM) RP: bluelightning: sounds good. I'd also point out its
not the TSC's job to do this so others can/should help
(9:21:35 AM) bluelightning: RP: right, I think we were just getting desperate :)
(9:21:37 AM) fray: agreed
(9:21:55 AM) ***Jefro makes a note to add it back in periodically
(9:21:55 AM) RP: bluelightning: indeed, it was a mess and reflected
badly on the project
(9:21:55 AM) bluelightning: ok, 2g - OE-Classic recipe migration status
(9:22:31 AM) bluelightning: I'm keeping the wiki pages on this
up-to-date and I noticed Martin has edited it recently for his
submissions as well
(9:22:33 AM) bluelightning:
http://www.openembedded.org/wiki/OE-Classic_Recipes_A-I
(9:22:40 AM) bluelightning:
http://www.openembedded.org/wiki/OE-Classic_Recipes_J-Z
(9:22:44 AM) fray: excellent..
(9:23:03 AM) bluelightning: we're slowly chipping away at these
(9:23:23 AM) khem__: thats good I hope we are forward porting the
recipes to appropriate layers
(9:23:28 AM) RP: I think I'd largely let demand for recipes govern the migration
(9:23:32 AM) bluelightning: I sent out an email to the lists about it
so the community is aware
(9:23:44 AM) bluelightning: yes, it's going to be demand-driven at this point
(9:23:46 AM) RP: its fine to have some numbers but there is little
point in migrating something unusued
(9:23:53 AM) bluelightning: agreed
(9:24:27 AM) khem__: I have few forward ported recipes myself which I
should post soon
(9:24:35 AM) bluelightning: khem__: great!
(9:25:23 AM) bluelightning: I think we can also drop 2g from the
agenda, does that sound reasonable?
(9:25:31 AM) bluelightning: (for future meetings I mean)
(9:25:52 AM) khem__: yes
(9:25:57 AM) RP: yes
(9:26:07 AM) bluelightning: ok, 2h -  FILESDIR & FILESPATH
(9:26:13 AM) RP: and for h, there were some issues with FILESDIR
(9:26:30 AM) RP: deep deep voodoo going on in there that nobody
realised without looking deeply at the code
(9:26:45 AM) RP: For now, I've bandaided the fetcher and proceeded to
drop FILESDIR
(9:27:01 AM) RP: It was way too non-obvious what was going on
(9:27:26 AM) RP: I've merged patches to simplify FILESDIR a lot, I
still need to simplify the list of OVERRIDES that get used to expand
it
(9:28:28 AM) ***Jefro wonders why this is the first TSC meeting in
which the term "deep deep voodoo" has turned up
(9:28:34 AM) bluelightning: I haven't seen too much in the way of
fallout, one or two patches for the native ${PN} / ${BPN} thing in
meta-oe
(9:28:38 AM) khem__: RP: why dont be just drop it early before 1.4
(9:28:47 AM) khem__: I mean FILESDIR
(9:28:50 AM) RP: khem__: its effectively gone now
(9:29:04 AM) RP: khem__: I just hardcoded the voodoo openly in the fetcher
(9:29:11 AM) khem__: ok cool
(9:29:15 AM) RP: so its less like black magic now
(9:29:21 AM) bluelightning: AR to me - add FILESDIR to recipe migration info
(9:29:32 AM) RP: bluelightning: already done ;-)
(9:29:42 AM) bluelightning: RP: the other migration page ;0
(9:29:50 AM) bluelightning:
http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
(9:29:50 AM) khem__: We need to inform other layers too
(9:29:56 AM) khem__: and give some time to adapt
(9:30:20 AM) bluelightning: I'm not sure it was that widely used fortunately
(9:30:21 AM) RP: bluelightning: ah, right, I thought you meant 1.3 -> 1.4
(9:30:27 AM) RP: it hopefully wasn't
(9:30:44 AM) RP: the main issue was the way it was used in bitbake.conf
(9:30:46 AM) RP: that is now dead
(9:30:53 AM) RP: (removed)
(9:31:20 AM) RP: so I'll hopefully write the OVERRIDES change patch
sometime soon and we can call this cleanup done
(9:31:33 AM) RP: I'll give it a bitbake release or two and then drop
the code entirely from bitbake
(9:31:34 AM) khem__: ok
(9:31:42 AM) bluelightning: great
(9:31:59 AM) bluelightning: ok, shall we also drop 2i - smart ?
(9:32:22 AM) khem__: is smart committed already ?
(9:32:45 AM) bluelightning: khem__: patches are just being sent out
for review today
(9:32:55 AM) khem__: are there any instructions for people using
zypper to migrate to it ?
(9:33:13 AM) khem__: or need there any instructions
(9:33:33 AM) bluelightning: there aren't... I wonder if we need to
provide any though
(9:34:00 AM) khem__: some document for how to use it like we had
zypper document on yocto wiki IIRC
(9:34:30 AM) bluelightning: we should definitely have some
documentation that describes how to use smart, set up a remote feed
etc. yes
(9:34:38 AM) khem__: exactly
(9:34:50 AM) bluelightning: ok, another AR for me to at least enter a
bug for that
(9:34:59 AM) bluelightning: (I seem to be collecting these :)
(9:35:14 AM) fray: :)
(9:35:33 AM) fray: code is getting submitted this week.. but ya,
documentation is needed.....
(9:35:56 AM) bluelightning: ok, anything to discuss on 3a / 3b ?
(9:36:04 AM) fray: (So far the only thing I've identified that Smart
does not do that Zypper does is support for delta-rpms)
(9:36:33 AM) fray: nothing new on 3b..  I think the person doing the
work in the community has it covered right now
(9:36:45 AM) fray: do we want to remove it?
(9:36:46 AM) Jefro: who is that?
(9:36:58 AM) fray: laurentiu.palcu@intel.com
(9:37:07 AM) Jefro: excellent, thanks - I'll mention him in the notes
(9:37:29 AM) bluelightning: ok, and yes I think we can probably drop
it from future agendas
(9:37:39 AM) fray: sounds fine with me..
(9:37:43 AM) Jefro: ok. keep 3a?
(9:37:45 AM) fray: we'll bring it back if we start seeing issues there
(9:37:49 AM) fray: ya I think so
(9:37:55 AM) bluelightning: I guess so yes
(9:38:07 AM) bluelightning: 3c - document whitespace changes to the shell
(9:38:15 AM) fray: 3c, I forgot what my part was in the patch guidelines..
(9:38:31 AM) bluelightning: for reference:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
(9:38:41 AM) fray: What do I need to update there?
(9:38:53 AM) bluelightning: I'm just wondering that myself
(9:38:58 AM) fray: (my fuzzy memory was just adding a link to the
style guide...)
(9:39:10 AM) bluelightning: FWIW, I updated the migration info linked
above for this as well
(9:39:29 AM) ***Jefro notes to self to write down more details about
action items in future notes
(9:39:41 AM) fray: what is the style guide link and I'll add it
(9:40:33 AM) bluelightning: http://www.openembedded.org/wiki/Styleguide
(9:40:48 AM) bluelightning: I note that the Yocto Project also has
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
(9:41:02 AM) fray: thanks.. I'll simply add a comment that says the
commit/patch policy does not address code style, see the styleguide
(9:41:11 AM) bluelightning: seems like someone ought to de-dupe those
two but I'm not taking that AR
(9:41:13 AM) bluelightning: ;)
(9:41:52 AM) ***RP isn't either right now
(9:42:10 AM) RP: Jefro: perhaps note it needs doing
(9:42:28 AM) ***Jefro will note - may have a resource to help with that
(9:42:42 AM) bluelightning: awesome
(9:43:01 AM) bluelightning: I think we can drop 3d as well, that's
already been covered
(9:43:32 AM) bluelightning: so, on to 4a - oe-core status, anything to
discuss on that?
(9:44:44 AM) bluelightning: RP: ^
(9:44:47 AM) fray: my bit of 3c is now done..
(9:45:05 AM) Jefro: 4a next release isn't until April, right
(9:45:20 AM) bluelightning: indeed
(9:45:26 AM) fray: AFAIK, yes
(9:45:59 AM) fray: 4c -- PR issues -- any progress on this or is it
still delayed?  (same w/ the systemd)
(9:46:28 AM) bluelightning: no progress that I'm aware of, but I have
to admit I'm not sure who's working on it (goes to check...)
(9:46:36 AM) khem__: is someone working on systemd migration yet
(9:46:36 AM) RP: We have the M1 release of YP
(9:47:02 AM) RP: There are some bugs but they're being worked on and
nothing too surprising given the changes we pulled in of which there
were lots
(9:47:08 AM) khem__: I have something working with oe-core as of now.
(9:47:10 AM) RP: So I don't really have too much to add
(9:47:29 AM) bluelightning: khem__: yes, Radu Moisan is working on it
I believe possibly with help from Ross Burton, I'm not sure
(9:47:30 AM) RP: fray: PR server is actively being worked on
(9:47:34 AM) khem__: RP: there is a dependency of systemd on fetchers
(9:47:40 AM) khem__: git gitver thing
(9:47:40 AM) fray: excellent
(9:47:46 AM) RP: khem__: why is that needed?
(9:47:51 AM) RP: it should be tangential
(9:48:04 AM) bluelightning: it's not needed, it's just a feature of
the meta-systemd recipe for it
(9:48:18 AM) khem__: RP: I dont particulatly am interested in that but
in its current form I mean
(9:48:19 AM) RP: We looked through the open bugs related to PR server
and can't reproduce them. We have some theories about setup issues
that possibly lead to them
(9:48:39 AM) bluelightning: RP: including koen's "PR going backwards" one ?
(9:48:50 AM) RP: bluelightning: yes, couldn't reproduce with a clean sstate
(9:49:10 AM) khem__: I would propose to enable it early
(9:49:20 AM) RP: So right now, I think I'm going to propose we stop
taking PR changes say in a week
(9:49:26 AM) fray: ya.. PR server is something that is going to cause
initial pain.. we need to tke that soon
(9:49:29 AM) khem__: fine with that
(9:49:40 AM) bluelightning: what we're still missing is setup
instructions I think
(9:49:43 AM) fray: no problem here.. just need to give folks the heads up
(9:49:45 AM) RP: I think we need to get this shake down tested and
there is only one way this will happen
(9:49:53 AM) RP: bluelightning: yes, I actually have a WIP with this
(9:49:56 AM) bluelightning: (which was something I was supposed to do IIRC)
(9:50:05 AM) RP: waiting on me to sort them out, like too many things
(9:51:05 AM) Jefro: any major features missing on 4c?
(9:51:14 AM) RP: so the proposal is to close out the open bugs,
document things and announce a date we stop taking PR bumps
(9:51:35 AM) RP: For systemd, Radu has a WIP branch on poky-contrib
(9:51:42 AM) khem__: RP: yes thats good summary
(9:52:02 AM) khem__: I will try to play with system branch
(9:52:05 AM) RP: Jefro: lots of smaller things, those are the big ones offhand
(9:52:13 AM) Jefro: RP ok, good
(9:52:35 AM) RP: oh, for the PR server, I sent out an RFC about the
incremental numbers in PV from the fecterh
(9:52:50 AM) RP: I'm proposing we use the same database as the PR
server for this rather than bitbake's inbuilt code
(9:53:01 AM) RP: since we then get data import/export and network
connectivity for it
(9:53:34 AM) bluelightning: I didn't comment but I think it's a
sensible idea; preserving that info next to sstate can be a little
tricky and isn't currently documented I don't think
(9:53:37 AM) RP: I think Constantin will be sending out a patch
implementing that. I'm planning to merge that at the same time as we
stop taking PR dumps
(9:53:52 AM) RP: bluelightning: this is why I want one place we handle
this stuff, not two
(9:54:03 AM) fray: that sounds good to me
(9:54:08 AM) RP: we have several related open bugs and this rounds things out
(9:55:14 AM) bluelightning: ok; so only remaining item we haven't
discussed is 4b - infrastructure ; anything to report on that? khem__?
(9:55:33 AM) khem__: nothing from me. cgit has been seeing some load
(9:55:38 AM) khem__: issues
(9:55:47 AM) bluelightning: ah ok, I hadn't noticed this time
(9:55:49 AM) khem__: Michael has been helping out
(9:56:04 AM) Jefro: was jenkins successfully set up?
(9:56:10 AM) khem__: no news on autobuilder
(9:56:21 AM) khem__: I will ping Martin to get some of his cycles
(9:56:59 AM) khem__: I have not been able to do a lot in past few weeks
(9:57:16 AM) bluelightning: ok that's it for the agenda - 3 mins left,
anything else to discuss?
(9:58:16 AM) fray: I'm good..
(9:59:34 AM) bluelightning: ok, I think we're done
(9:59:39 AM) bluelightning: thanks everyone
(9:59:44 AM) Jefro: cool - thanks all
(9:59:54 AM) fray: excellent..thanks!

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


