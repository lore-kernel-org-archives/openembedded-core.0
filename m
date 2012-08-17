Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1T2Ow7-0000mK-4t; Fri, 17 Aug 2012 17:58:11 +0200
Received: by yenm1 with SMTP id m1so4499618yen.6
	for <multiple recipients>; Fri, 17 Aug 2012 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=bOSGUnMuFseJkRYejiWF0acTnwrO69pRwMEPe5X8MjA=;
	b=mrIIbnnrMPANM7wjzHuPmY7FGkvubhJrUnf0QvlvkHtpyfE8xyelOhvBfwVmL774kX
	J+gDb473qbseCgSJvnELoTQtxcuyWaH80TEN0wUlPv+q3tq1/uF7M2Ov/MNf/rYra23r
	tQ719pv85tdlOUi4W880yB76G7ZyGw3mi6U4S+g7qjlIAfHxBSmnIgTegtBhxVZEtHMP
	lKhvPTzPm3Ogewn7YLVtk2xcXkLCysuUxnUZlatD0gqCrmfG+ArK3eRrQiRi7hv9IPpt
	B8NDUW4lZetWW2cXCH56bSwKSIi0Y8HVEQ8crWDlOM9lrSJ+OQjooxUjhJQ8UWsXeNd/
	Ds9g==
MIME-Version: 1.0
Received: by 10.50.237.66 with SMTP id va2mr2445372igc.65.1345218370746; Fri,
	17 Aug 2012 08:46:10 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.50.231 with HTTP; Fri, 17 Aug 2012 08:46:10 -0700 (PDT)
Date: Fri, 17 Aug 2012 08:46:10 -0700
X-Google-Sender-Auth: FjESWM_ZjBC6jF-W1sv-kLhnaVE
Message-ID: <CA+YB3rZMtzLB11sOf_R9CuLzgiFW+mDD0pPdON5VReyJ5kFNWw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: Minutes: OE-TSC 14 August 2012
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
X-List-Received-Date: Fri, 17 Aug 2012 15:58:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
14 August 2012

Attendees: Mark, Khem, Richard, Paul
Apologies: Koen

________________________________________________________________
Agenda & Results

1. pick a chair - RP

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
 -> continue
 b. discuss communication with OE community about release-oriented phases
 -> continue
 c. pre/post install scripting (fray)
 => keep watching mailing list for issues - continue

3. new issues

a. systemd
 => discuss on mailing list (all)
 => bluelightning to send out current status to list - done
 => bluelightning to create enhancement bug in Yocto bugzilla to
implement gitpkgv  - done

b. PR bumps
 => koen to investigate server & report back
 => bluelightning to test on autobuilder infrastructure
 => bluelightning to document setup steps on wiki

 c. package.bbclass whitespace
 some fallout, some positive comments - also see 3e
 (keep on future agendas?)

d. meta-networking
 => continue discussion on mailing list

e. whitespace changes to the shell (Martin)
  ref: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html
-> Reluctant conclusion: tabs for shell, 4 spaces for python.
=> Need to ensure well documented

 f. libexecdir changes?
  proposal to configure libexecdir differently for some distro configs
  TSC involvement unnecessary, send patches

 g. bitbake UI (knotty) changes
  knotty2 now default
 => needs documentation

4. status

a. Should we still support separation of / and /usr?

b.  khem to file enhancement request for python devshell  (done)

c. oe-core release
      there will be discussion on the list about release process

d. infrastructure
      mailing list issue (koen) - board is coping with it, keep on
agenda -  needs addressing urgently along with control of the other
mailing lists + related infrastructure
  DNS issue from upstream provider resolved
  mailing lists need some admin attention, particularly oe-members
  => Jefro to volunteer to help with oe-members
  Khem requests mailman archives text-only display, will talk to Phil/Florian

________________________________________________________________
Raw Transcript

(8:58:35 AM) bluelightning: hi Jefro
(8:58:40 AM) RP [~richard@83.217.123.106] entered the room.
(8:58:42 AM) Jefro: good morning bluelightning
(8:59:01 AM) RP: hi all
(9:00:40 AM) RP: khem said he may be 10 mins late
(9:01:10 AM) RP: fray did mention networking problems, not sure if he'll be here
(9:01:19 AM) Jefro: RP good morning - ok
(9:01:23 AM) fray [U2FsdGVkX1@gate.crashing.org] entered the room.
(9:01:23 AM) Jefro: Agenda is here: http://piratepad.net/6IpZMN36lr
(9:01:23 AM) mode (+o fray) by ChanServ
(9:01:31 AM) Jefro: goodmorning koen
(9:01:37 AM) ***fray is here.. but having networking issues today.. so
I might disappear.. :(
(9:01:54 AM) Jefro: hi fray - network problems suck
(9:01:59 AM) RP: Martin asked us to discuss whitespace changes to shell
(9:02:17 AM) fray: it's "better" since I have a cable running from the
server lab to my office.... but even then I'm getting glitches..
(9:02:23 AM) fray: something is wrong w/ the office network
(9:04:12 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:04:13 AM) mode (+v khem) by ChanServ
(9:04:21 AM) RP: welcome khem
(9:04:26 AM) khem: hi
(9:04:31 AM) RP: so we have everyone
(9:04:36 AM) RP: although koen seems quiet
(9:04:52 AM) Jefro: khem: agenda at http://piratepad.net/6IpZMN36lr
(9:04:53 AM) khem: I cant chair
(9:04:58 AM) khem: ok
(9:05:03 AM) RP: ok, who is chairing?
(9:05:20 AM) fray: I can't w/ my networking issues today
(9:05:24 AM) RP: ok, I will
(9:05:41 AM) RP: Are there any issues in 2 that we have updates on?
(9:05:56 AM) ***RP isn't aware of any and will move on unless someone interrupts
(9:05:59 AM) fray: only that I'm still swamped..
(9:06:15 AM) RP: 3a
(9:06:32 AM) RP: systemd
(9:06:57 AM) RP: The enhancement bug to gitpkgv was added to the bugzilla
(9:07:23 AM) RP: Paul also sent out the update I believe
(9:07:47 AM) RP: ok, 3b
(9:08:03 AM) RP: I don't think bluelightning has had a chance here
(9:08:07 AM) RP: and nothing from Koen?
(9:08:18 AM) RP: 3c: Package whitespace
(9:08:18 AM) bluelightning: no progress on my end for that one
(9:08:27 AM) RP: Martin has asked we consider shell whitespace
(9:08:42 AM) RP: Personally, I'm not keen to rock the boat on the
shell whitespace issues
(9:08:58 AM) fray: ya.. I'm definitely more hesitent there..
(9:09:02 AM) RP: The tabs vs spaces in python were important as python
is whitespace delimited
(9:09:07 AM) RP: shell is a different question
(9:09:17 AM) fray: mind you, as a janitorial task, the whitespace for
shell functions in classes and such should still be "fixed"
(9:09:27 AM) fray: but I see that purely as janitorial vs functional defect
(9:09:38 AM) RP: I think the downsides of breaking patch application
and patch backporting to 1.2 outweigh any nice feelings about using
spaces
(9:10:00 AM) RP: So I'm not in favour of changing the current
situation and think we should maintain the current policy
(9:10:21 AM) fray: ya.. cleanup whitespace as (shell) functionals are revised..
(9:10:37 AM) fray: many can be safely done.. but it really is a
cleanup as appropriate task..
(9:10:44 AM) RP: fray: well, I don't even want to do that, just
continue with the current policy, tabs n shell functions
(9:10:50 AM) RP: and change anything that doesn't match over time
(9:10:54 AM) bluelightning: RP: are there any options for patch
application that ignore whitespace differences?
(9:11:09 AM) fray: I'm more referring to the tab, 3 space, 4 space,
all intermingled..
(9:11:18 AM) RP: bluelightning: it can be done and some commands
accept the options but git am doesn't like it for example
(9:11:27 AM) fray: makes it really hard to work on some of the files..
that's the cleanup (as the functions are worked on) that I'm
suggestign
(9:11:28 AM) RP: It would create a world of pain for people handling the patches
(9:11:32 AM) bluelightning: hmm ok
(9:11:47 AM) fray: but it's purely cosmetic vs functional
(9:12:28 AM) bluelightning: seems to me we have to look at this from a
cost/benefit perspective
(9:13:26 AM) RP: agreed, and I don't see a massive benefit
(9:13:36 AM) bluelightning: benefits here are only consistency with
python functions; costs are making the change and ongoing significant
patch backporting hassle for a number of people
(9:14:04 AM) RP: and I do feel strongly about this as one of the
people who would be significantly impacted by this
(9:14:20 AM) RP: its also significantly more of the codebase than the
python changes affected
(9:14:36 AM) RP: python functions were mainly in a few core classes
(9:14:48 AM) khem: so tab for shell and 4 spaces for python ?
(9:14:53 AM) RP: khem: yes
(9:15:01 AM) RP: at least that is my vote
(9:15:17 AM) khem: lets document it in bold letters and may be modify
th syntax checker
(9:15:34 AM) RP: I understand why people would like to do differently
but I don't think the benefits worth it
(9:15:47 AM) fray: no objections from me..
(9:15:52 AM) RP: khem: agreed, we should publicise that more
(9:15:55 AM) khem: RP: its a hard thing
(9:16:05 AM) khem: to use two styles in same metadata
(9:16:20 AM) bluelightning: I'm agreed, it's not worth changing atm
(9:16:27 AM) RP: ok, I think we have a decision there
(9:16:32 AM) RP: 3f, libexecdir
(9:16:53 AM) RP: This should be configurable and I don't see it as an issue
(9:17:03 AM) fray: this is an issue that has come up recently..  there
is a proposal to configure libexecdir differently (in some distro
configurations)
(9:17:12 AM) RP: Yes, we should run some test builds and ensure
everything does respect it
(9:17:14 AM) fray: but this is going to require fixing a number of
recipes, and likely additional sanity checks
(9:17:17 AM) bluelightning: assuming the libexecdir variable is being
used everywhere
(9:17:30 AM) bluelightning: (everywhere it needs to be)
(9:17:30 AM) RP: fray: I'd say run tests, send patches
(9:17:35 AM) fray: RP, I did some basic work with Denzil, and it's hit
and miss.. a lot of things seem to have hard coded (internal to the
resipe) libexecdir..
(9:17:41 AM) khem: fray: whats the usecase really
(9:17:58 AM) RP: I don;t think this needs TSC involvement, just send patches
(9:18:00 AM) fray: People who want compatibility with things from
"other" distributions that do not use an explicit libexecdir
(9:18:29 AM) fray: I thoguht I'd bring it up to the TSC because it may
involve quite a few recipe patches.. but if thats not an issue we can
continue on..
(9:18:48 AM) khem: I am fine as long as we dont enforce some rules aroud it
(9:18:53 AM) RP: fray: I don't think there is any disagreeement to
fixing hardcoded path issues
(9:19:04 AM) khem: like /lib and /usr/lib we ddi
(9:19:10 AM) bluelightning: seems reasonable to me to fix these where
they are found
(9:19:10 AM) khem: no
(9:19:26 AM) fray: ya.. it's more then just the removal of the
${prefix} element...
(9:19:37 AM) fray: again, we can moe on if there is no issue..
(9:19:45 AM) RP: ok, I added 3g : bitbake knotty changes
(9:20:02 AM) RP: I just want to give the heads up I'm planning to make
knotty2 the default UI for bitbake
(9:20:32 AM) RP: I think this will be a positive thing and you can get
the existing behaviour with  bitbake xxx | cat for example
(9:20:47 AM) RP: I've heard positive comments about it
(9:21:00 AM) khem: RP: what is default now
(9:21:08 AM) RP: If nobody has objections/concerns we can move on
(9:21:13 AM) RP: khem: "knotty"
(9:21:27 AM) khem: ok I have no issues tere
(9:21:35 AM) bluelightning: just as a note, we have BITBAKE_UI to
change the default if people want to force it back
(9:21:45 AM) RP: knotty2 is just different in that it suppresses some
output on the console and uses termios to print a summary of currently
running tasks
(9:22:14 AM) RP: bluelightning: I'm tempted just to make it all
"knotty" and remove the knotty2 option
(9:22:34 AM) bluelightning: RP: ok... given that knotty2 works like
knotty in the non-terminal case that seems reasonable
(9:22:44 AM) RP: bluelightning: need to think through the exact
mechanism but partly I want to consolodate the codebases
(9:22:50 AM) bluelightning: well, non-interactive terminal
(9:22:54 AM) RP: make some maintenance issues easier
(9:22:56 AM) khem: yeah if changes arent so radical, but be aware if
people have automation arounf bb outputs
(9:23:18 AM) fray: long as non-terminal mode works the same way, I
think this is fine
(9:23:24 AM) RP: So looking at section 4, a, b and c look ongoing and unchanged
(9:23:29 AM) RP: fray: it continues as before
(9:23:42 AM) fray: RP, agreed (re 4)
(9:23:42 AM) RP: 4d we need to talk about
(9:24:02 AM) RP: two issues - the DNS problems and the oe-members mailing list
(9:24:17 AM) khem: I think ml is working ok now
(9:24:21 AM) RP: Does anyone have info about the DNS problems?
(9:24:22 AM) fray: any word on the DNS problems, cause?
(9:24:28 AM) RP: Anything we need to do there
(9:24:30 AM) bluelightning: I have second hand info
(9:24:35 AM) khem: provider mucked it
(9:24:49 AM) khem: I think last night it got fixed
(9:24:55 AM) khem: have to ask crofton
(9:25:00 AM) khem: to be sure
(9:25:01 AM) bluelightning: basically the upstream provided made a
config mistake and the DNS entries for list.openembedded.org ended up
pointing to the wrong machine
(9:25:16 AM) fray: ok
(9:25:45 AM) bluelightning: it does highlight that only a select few
have access to admin some of our critical services
(9:26:21 AM) fray: is there any type of key repository/safe that
people on the board could access if necessary..  (i.e. the people
disappear or get hit by a bus scenerio)
(9:26:32 AM) bluelightning: good question
(9:26:50 AM) bluelightning: if not, I suspect it would be the TSC's
responsibility to establish such procedures
(9:27:20 AM) RP: I think we do need to figure that in connection with DNS
(9:27:39 AM) fray: there should be some type of method IMHO.  I'm not
saying we (the TSC) need access to the items, but the board should be
able to recover and establish control over critical resources, if
necessary (mailing list is the most critical IMHO)
(9:27:48 AM) khem: I think having some redundancy is good there
(9:28:06 AM) RP: The servers themselves I think we're ok with
(9:28:11 AM) khem: but I dont see lot of need to have some thing more
complicated
(9:28:16 AM) bluelightning: no, I'm definitely not angling for access
personally.. but there needs to be several people with access
(9:28:16 AM) RP: The DNS, I think Philip takes care of atm
(9:28:31 AM) RP: We should ask him whether he has thought about this
(9:28:41 AM) khem: RP: as long as there is a backup or two we should be fine
(9:28:41 AM) fray: ya.. that is adequate for me..
(9:28:50 AM) khem: just make sure they dont travel in same bus :)
(9:28:55 AM) RP: I think he suggested SPI as one solution but that
would be a big change for OE and outside the TSC remit
(9:29:18 AM) RP: well for l2g infrastructure, we have Florian, Phil
and others for example
(9:29:20 AM) bluelightning: as part of this issue we need to get back
in control of some of the mailing lists (inc oe-members)
(9:29:43 AM) RP: and likewise for other OE machines, we have Tom, Khem
and Michael Halsted also has access in case of emergencies
(9:29:52 AM) RP: bluelightning: that is the next topic
(9:30:01 AM) RP: so for DNS, I think we need to talk to Philip
(9:30:16 AM) RP: For mailing lists, I think we need to figure out
someone to maintain the oe-members list
(9:30:31 AM) RP: I've personally looked after bitbake-devel and
openembedded-core
(9:30:47 AM) RP: We should have a couple of people for each list ideally
(9:30:58 AM) bluelightning: sounds like a good idea
(9:31:13 AM) Jefro: "look after" in the sense of helping people
recover passwords, or in the sense of daily monitoring, kicking off
trolls, etc
(9:31:32 AM) fray: yup
(9:31:36 AM) RP: Jefro: well, in the case of oe-members, ensuring ev
members make it there
(9:31:59 AM) RP: but also help with both daily monitoring and also
general maintenance
(9:32:20 AM) RP: I think for example oe-members is still looked after
by Graeme who is no longer active in the project
(9:32:22 AM) Jefro: I may be able to help as long as serious daily
monitoring is not a hard requirement - already watching a few lists
(9:32:43 AM) RP: Jefro: It shouldn't require much and can be split
between people
(9:32:52 AM) ***RP doesn't mind helping out with oe-members
(9:33:05 AM) ***RP is also already and admin for a few lists
(9:33:43 AM) khem: RP: talking of ml. It would be nice if it displayed
raw text on archive
(9:33:54 AM) RP: khem: which lists?
(9:33:55 AM) khem: so I could use mbox from there
(9:34:02 AM) khem: oe-devel
(9:34:13 AM) khem: or oe-core
(9:34:19 AM) khem: generally patchwork helps
(9:34:40 AM) khem: now a days a bit
(9:34:41 AM) RP: khem: I think mailman messes with the archives quite badly :(
(9:34:48 AM) Jefro: khem you can download the tarball for plain text
(9:34:55 AM) RP: khem: that is something to talk to Phil/Florian about
(9:35:12 AM) Jefro: I don't think mailman can display plain text
per-message, but could be wrong about that
(9:35:40 AM) RP: ok, so anything else we need to cover on this?
(9:35:43 AM) khem: jefro it can
(9:35:47 AM) bluelightning: worth remembering also that linuxtogo
still has an open request for help with admin tasks
(9:35:49 AM) RP: or on any other topics for that matter?
(9:36:00 AM) fray: nothing from me
(9:36:16 AM) khem: nothing from me
(9:37:49 AM) bluelightning: nothing from me either
(9:37:55 AM) RP: If there isn't anything else I will close the meeting then
(9:37:57 AM) RP: thanks all

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


