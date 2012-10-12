Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1TMi5q-0003EK-00; Fri, 12 Oct 2012 18:28:10 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so5065130ieb.6
	for <multiple recipients>; Fri, 12 Oct 2012 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=dlDNa30TDC8/wqvMx1wXjEU7ff2O7wqIwUFTN35qycw=;
	b=OzNvm3BNfE7pcs+SGGfcBRG35Ea0mSR2uPPp+P4aq2APmKxAjhRo0RgWI5sfXDqz4L
	pw6AVOOuVlYJtOJR3/u7MtgregJyJwQYRTmxA/mFeKYzvjvsMSPqEqcFz/Rsv9eVedpR
	8qaM45YpGSIBgoV5hYVIT4QBgmR8fbLRVt75m5DMr8flsc9FWfQqVA8paE9hP4gB99qZ
	P9Z0eda6taVJNKqw5FRYrJOqPrYb7/N+yHSZxaEuIntxkdMDMbTiwqNX2+f6sbGhcopV
	/717bNqvzrTE0OT4PanwOSvZBPlWzXSJPCAOiy8efkQ2ta7gRZXZooNHTWtlp10ZMNOb
	eT8g==
MIME-Version: 1.0
Received: by 10.50.173.7 with SMTP id bg7mr2648603igc.65.1350058497396; Fri,
	12 Oct 2012 09:14:57 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.147.37 with HTTP; Fri, 12 Oct 2012 09:14:57 -0700 (PDT)
Date: Fri, 12 Oct 2012 09:14:57 -0700
X-Google-Sender-Auth: xlngkoCpKsz3V9HJB8a6coJ3Ttk
Message-ID: <CA+YB3rY6F9quOa__MwK=_7zTQn=D1SR75w5bhScuYM6wg-cYYg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 9 October 2012
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
X-List-Received-Date: Fri, 12 Oct 2012 16:28:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded TSC Meeting
09 October 2012

Attendees: Koen, Paul, Mark, Khem, Richard
Notes: Jefro

________________________________________________________________
Agenda & Results

1. pick a chair
fray
___________________________________
2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. pre/post install scripting (fray)
     holding for 1.4

 c. document whitespace changes to the shell
    RP edited OE style guide with new info, linked to YP
        => fray to update patch guidelines

 d. documentation
    need someone to work on OE wiki pages
        RP, bluelightning, fray to hopefully work on it together
___________________________________
3. new issues

 a. Meetup at ELCE
   OE general assembly Weds eve 5pm, Yocto Project Developer day Thurs
        -> wing it

 b. RFC for the secondary toolchain (fray)
    how to document as best practice?
        possibly sample secondary toolchain layer as template
        no changes to oe-core, possibly add an include file

 c. RPM and package feeds
        packages_rpm, rootfs_rpm doesn't use Zypper
        fray proposes replacing with SMART after 1.3 release
        smaller footprint, python based
        -> fray will write proposal after 1.3

___________________________________
4. status

 a. oe-core release
        at -rc3 now, -rc4 tomorrow, hi-priority issues identified
        release branches exist
        issues with 3.4.10 on ARM, bumped to 3.4.11 (uniprocessor)
        new bugzilla category for image deployment issues

 b. infrastructure
    disks failed last week
    Tom & Martin working on setting up jenkins

 c. 1.4 planning
   PR issues
   pre/post install scripting
   SMART

________________________________________________________________
Raw Transcript

(8:56:58 AM) mode (+v Jefro) by ChanServ
(8:58:19 AM) fray: hey
(8:58:37 AM) Jefro: good morning
(8:58:51 AM) fray: I have an agenda item, hopefully quick -- the RFC
for the secondary toolchain..
(8:59:00 AM) Jefro: hi koen - question, do we need to keep the PR bump
issue on the agenda, or bring it back for 1.4?
(8:59:07 AM) Jefro: fray ok, added
(8:59:16 AM) koen: Jefro: 1.4 is fine by me
(8:59:29 AM) RP__ [~richard@dan.rpsys.net] entered the room.
(8:59:32 AM) koen: I have a conflict right now, so I can't say how
present I will be :(
(8:59:43 AM) RP__: ok :/
(8:59:59 AM) ***RP__ is here although its been a long day :/
(9:00:26 AM) Jefro: ok, thanks (RP - that was for whether to keep PR
bumps on the agenda for now, or revive them in 1.4)
(9:00:41 AM) bluelightning
[~paul@pdpc/supporter/professional/bluelightning] entered the room.
(9:00:47 AM) bluelightning: hi all
(9:01:08 AM) Jefro: hi bluelightning
(9:01:21 AM) Jefro: khem says he is stuck in traffic and will be here
hopefully in 5 minutes
(9:01:52 AM) bluelightning: Jefro: what, he's not on IRC from the car?
where's the commitment?
(9:01:57 AM) bluelightning: ;)
(9:02:01 AM) fray: ;)
(9:02:07 AM) ***fray will not pay his ticket.. ;)
(9:03:13 AM) RP__: Jefro: I don't quite understand the PR bumps question
(9:03:15 AM) Jefro: I'm talking to him over google chat - in his case
literally! he says there is voice to text
(9:03:18 AM) Jefro: but no IRC interface
(9:03:20 AM) Jefro: yet...
(9:03:54 AM) Jefro: RP__ right now we have PR bumps listed as a
lingering issue to discuss, but the last thing we talked about was to
push it out to 1.4, so I was wondering whether to keep it on the
agenda for this meeting
(9:04:15 AM) RP__: Jefro: no, we don't need it
(9:04:21 AM) fray: One of my former co-workers using a Samsung Note
and uses text-to-speech and speech-to-text to IRC while driving.. :P
(9:04:23 AM) Jefro: ok, thanks
(9:04:29 AM) Jefro: agenda in about 1 minute
(9:04:56 AM) Jefro: how about koen's new branching strategy?
(9:05:50 AM) RP__: I think that was to be taken to the mailing list?
(9:05:55 AM) RP__ is now known as RP
(9:06:03 AM) mode (+v RP) by ChanServ
(9:06:53 AM) Jefro: still a lingering issue for discussion? I'm paring
the agenda down quite well
(9:06:59 AM) Jefro: Any new issues anyone?
(9:07:32 AM) fray: status on the upcoming rlease is the only other
thing that comes to mind
(9:08:15 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:08:15 AM) mode (+v khem) by ChanServ
(9:08:23 AM) khem: Hi All
(9:08:37 AM) Jefro: thanks fray
(9:08:40 AM) Jefro: hi khem - any new issues?
(9:09:37 AM) Jefro: Agenda at http://pastebin.com/j8HFUy19
(9:10:04 AM) fray: BTW I can chair unless someone else wants to
(9:10:11 AM) fray: (give RP a break)
(9:10:13 AM) koen: RP: I dropped the ball on that, havne't had much
time for OE stuff the past month :(
(9:10:51 AM) RP: koen: I'm trying to speed things up regardless...
(9:11:07 AM) khem: Nothing from me
(9:11:30 AM) fray: re the PR thing, I know we'd really like it in the
1.4 release time frame.. :/
(9:11:45 AM) fray: (speaking for my employer as well as myself there)
(9:12:01 AM) khem: one thing that I wish is done with 1.3 release is
that meta-oe is independently appliable on danny
(9:12:13 AM) khem: and systemd layer can be used without meta-oe layer
(9:12:15 AM) fray: Jefro on more item.. RPM tooling and package feed stuff..
(9:12:20 AM) fray: sorry forgot about that until just not..
(9:12:53 AM) fray: ok then.. shall we get started?
(9:12:58 AM) fray: (I assume I'm chair)
(9:13:16 AM) fray: lingering issues..  anything on 2a, janitor list/bugs?
(9:13:42 AM) RP: PR issue is on the 1.4 roadmap as one of my personal
"must do" items
(9:13:49 AM) RP: likewise is systemd
(9:13:59 AM) Jefro: fray - ok, listed as 3c
(9:14:05 AM) RP: fray: nothing on 2a
(9:14:16 AM) fray: ok.. 2b -- nothing additional, I think we're
holding for 1.4 there..
(9:14:20 AM) bluelightning: khem: yes, that would be good - currently
touchscreen and mouse break just by adding meta-oe; I'm guessing
that's a udev issue but I haven't dug into it
(9:14:24 AM) RP: Jefro: agenda is nicely pruned :)
(9:14:24 AM) fray: 2c, did the whitespace stuff get documented?
(9:14:55 AM) bluelightning: fray: by "to the shell" I guess it means
python functions?
(9:15:04 AM) RP: I did put actually do something with that today!
(9:15:14 AM) fray: it was both python and shell.. :)
(9:15:22 AM) fray: 4 spaces and 1 tab..
(9:15:28 AM) RP: I edited the OE styleguide and spelt it out
(9:15:40 AM) RP: I also linked the OE guide to the YP patches one
(9:15:46 AM) bluelightning: fray: nothing actually changed with the
conventions, they have always been that way
(9:15:48 AM) RP: Ultimately we need one guide
(9:15:54 AM) fray: Jefro -- in the notes, can you put at action for me
to update the patch guidelines with that as well?
(9:16:01 AM) bluelightning: RP: great, thanks for that
(9:16:01 AM) RP: we also need to overhaul the OE wiki pages really,
its a total mess
(9:16:03 AM) Jefro: fray yup, will do
(9:16:06 AM) bluelightning: RP: indeed :(
(9:16:13 AM) fray: just occurred to me that should be listed there
(9:16:14 AM) RP: We've talked about this before but we need some
people with the time to do it
(9:16:28 AM) fray: yes.... :(
(9:16:32 AM) bluelightning: RP: I have a feeling it's going to end up
being me doing a bunch of it
(9:16:54 AM) RP: bluelightning: well, I'm happy to take a few hours
and perhaps do it together?
(9:17:01 AM) fray: any other lingering issues?
(9:17:02 AM) bluelightning: RP: sounds good
(9:17:21 AM) fray: bluelightning/RP if you pick a time.. I can try to
help.. just need to prearrange the time so I don't get interrupted
(9:17:52 AM) RP: fray: I have to admit I was leaning towards something
UK am as UK pm gets rather busy for me
(9:18:01 AM) RP: Wall to wall meetings most days now :(
(9:18:06 AM) fray: RP, thats fine.. :)
(9:18:09 AM) RP: quite depressing really
(9:18:19 AM) fray: schedule a time.. if I can do it, I will
(9:18:27 AM) fray: RP, sounds like my days.. :(
(9:19:01 AM) RP: fray: I'll talk with Paul and see what we can come up with
(9:19:05 AM) fray: ok then 3a -- meetup at ELCE
(9:19:26 AM) fray: I'm arriving first thing Monday and out on Friday
morning.. any time in there for a TSC meetup?
(9:19:28 AM) bluelightning: I'm now confirmed and booked, arriving sat
and leaving friday
(9:20:00 AM) ***fray is at the 'B Hotel' BTW.. Fira was booked..
(9:20:08 AM) RP: Likewise, I arrive Sat, leave Friday
(9:20:21 AM) Jefro: from what I understand about everyone's schedules,
breakfast or lunch is probably the best bet, or possibly dinner on
Tuesday before the social event
(9:20:28 AM) bluelightning: I'm at the Ayre, even the B was booked out
for some nights :/
(9:20:32 AM) khem: I arrive on Sat morn and I am in Fira
(9:20:32 AM) ***RP is at the Ayre
(9:20:58 AM) bluelightning: ah good, I won't be trudging back there on
my own then :)
(9:21:11 AM) RP: bluelightning: no, we both booked late :/
(9:21:33 AM) fray: ok.. any suggestions yet on a date, or should be
wing it once we are all there?
(9:21:43 AM) fray: (Lunch tuesday sounds like a good plan to me)
(9:21:45 AM) koen: wing it
(9:21:50 AM) Jefro: wow, Ayre is a long way
(9:21:52 AM) fray: --or dinner tuesday before the event--
(9:22:24 AM) Jefro: Can I ask one of you to record the meeting? Or
dial me in if it works, otherwise one of you will have to take notes
(9:22:26 AM) fray: ok  3b -- RFC on secondary toolchain
(9:22:34 AM) fray: Jefro, we can
(9:22:48 AM) fray: For this item, I added it because I assume the
discussion will take place on the list..
(9:22:54 AM) RP: Jefro: it is? :/
(9:23:15 AM) ***RP hasn't bothered looking yet, its not going to change anything
(9:23:17 AM) fray: but assuming it's generally reasonable (which I
think is the outcome so far) -- what is the right way to document this
for OE as a best practice -- or isn't that the right thing to do?
(9:23:22 AM) bluelightning: didn't look too far on the map to me,
though not right around the corner
(9:23:34 AM) fray: I was considering making a sample
secondary-toolchain layer people could use as a template..
(9:23:35 AM) Jefro: RP looks like a bit over a mile - plan on using a taxi
(9:23:45 AM) fray: any issues/concerns, or does this fit more int he
Yocto Project scale then OE?
(9:24:02 AM) RP: fray: I think having some documented way to do it is
fine, I'm hoping it doesn't need changes to the core
(9:24:07 AM) fray: B Hotel is "three blocks" whatever that translates
to in the right way
(9:24:32 AM) fray: RP -- my expectation is no changes to oe-core
itself.. but I want to make sure it works and people can use it (that
need to use it)
(9:24:41 AM) khem: fray supporting third party toolchains is OE wide
scope I think
(9:24:57 AM) fray: that is why I brought it up here and not Yocto Project..
(9:25:24 AM) fray: so assuming I have time to finish the documentation
and can show it'll minimally work.. what do I do with the results?
(9:25:46 AM) RP: fray: we can put the include file in OE-Core and document it
(9:25:55 AM) RP: depends on the output really
(9:26:00 AM) khem: fray I think we shoudl refine it more on how and
where tools will live etc.
(9:26:27 AM) khem: both toolchains will live along side earch other or
not. what will SDK look like
(9:26:30 AM) RP: Jefro: we'll arrange note taking or figure something out...
(9:26:49 AM) khem: will be provide capability to hook the toolchain
into eclipse if yes how
(9:26:54 AM) RP: fray: I assume the assumption is one toolchain is external?
(9:26:58 AM) fray: Thats what I want to document.. new layer --
secondary toolchain is along side -- installation place isn't
defined..
(9:27:10 AM) fray: I expect most of the time it'll be external, but
thats not a requirement
(9:27:19 AM) khem: fray: I think lot of details ae needed
(9:27:29 AM) khem: its more of deployment issue
(9:27:30 AM) fray: yes..
(9:27:38 AM) RP: Jefro: I suspect you have the wrong hotel, doesn't
look that far to me
(9:28:34 AM) fray: thats why I want this to be documented and a
template someone can use to get started.. this is really going to be a
screw-up if people start doing this and everything does it
differently..
(9:29:00 AM) fray: ok.. so my plan then is continue what I'm doing,
and we'll figure out where to put what I come up with in the future
(9:29:03 AM) khem: fray: I think go ahead with starting a document I would say
(9:29:09 AM) khem: and then we can work on it
(9:29:22 AM) bluelightning: fray: someone was saying there was a way
to do it in OE-Classic; anyone know anything about that?
(9:30:02 AM) fray: I missed that, but I don't have any experience w/
classic to know..
(9:30:16 AM) bluelightning: it's not an area I ever had dealings with
so I don't know either
(9:30:17 AM) RP: Wasn't this just for the kernel trick?
(9:30:24 AM) fray: I know a bunch of replies I got (personally) was to
use the CSL recipe as an example.. the people didn't understand what I
had meant by a secondayr toolchain
(9:30:24 AM) bluelightning: RP: could be
(9:30:52 AM) RP: fray: secondary *external* toolchain
(9:31:53 AM) khem: bluelightning: I dont think we could have more than
1 toolchains simulteneiously
(9:32:17 AM) khem: and yes the kernelcc was a hack yes
(9:32:29 AM) bluelightning: khem: ok, I was only going by a comment I
saw on IRC in response to this question
(9:32:29 AM) RP: khem: we did used to be able to build a kernel gcc
and then use it for the kernel
(9:32:42 AM) RP: khem: hence a gcc-cross-kernel recipe
(9:32:44 AM) fray: anyway, I'll work on that..
(9:32:50 AM) fray: anything further, otherwise next topic
(9:32:57 AM) RP: next topic
(9:33:00 AM) fray: 3 c.  RPM and package feeds..
(9:33:12 AM) fray: RP is aware of this and I think Paul as well.. but
I intend to send something out after 1.3 is done..
(9:33:27 AM) koen: what's the problem with it?
(9:33:32 AM) fray: In RPM we currently use Zypper for the package feed
mechanism.. but the packages_rpm, rootfs_rpm doesn't use Zypper and it
frankly doesn't work well..
(9:33:45 AM) khem: RP: true,
(9:33:55 AM) fray: I'm proposing that we replace it with 'SMART' which
is significantly smaller footprint and python based..
(9:34:20 AM) fray: I have something written up as to why and how this
will be done.. but I'm holding off sending it to avoid confusion in
the current release..
(9:34:28 AM) fray: this is more a heads up for the TSC and anyone
reading hte notes
(9:34:29 AM) khem: fray: I personnaly dont know much about smart who
else is using it
(9:34:51 AM) koen: fray: will there be a way to use rpm feeds without
requiring python/perl/whatever on the target?
(9:34:52 AM) fray: Mandriva was, but I don't know if they still are..
(9:34:58 AM) fray: koen, no
(9:35:11 AM) fray: You can of course use RPM directly.. but the
automated feeds won't be there..
(9:35:27 AM) khem: fray:are you proposing to replace zypper with smart ?
(9:35:36 AM) koen: I am reminded why I stick with opkg and not use deb or rpm :)
(9:35:38 AM) khem: or just for rootfs time
(9:35:51 AM) khem: koen: heh
(9:36:02 AM) fray: problem with Zypper is that it has a large number
of dependencies, many of which (and itself) are C++ based, boost is
required, and many things (not appropriate for our config) are hard
coded into it..
(9:36:05 AM) ***khem needs to use both
(9:36:10 AM) fray: for smart it's smaller, but does require python..
(9:36:36 AM) khem: fray: if smart is well mantained its ok.
(9:36:43 AM) fray: As for implementation, we would adjust rootfs_rpm
to end up using the feeds and smart for processing instead of the
existing mechanisms that we currently have.. this should make it
easier to maintain..
(9:36:56 AM) fray: similarly, SMART can be used on the target for feed
updates and such as well..
(9:36:57 AM) khem: fray: I think people know yum/zypper/apt well
(9:37:01 AM) bluelightning: we'll have to do an impact comparison but
zypper's footprint is already huge so I doubt smart will be worse
(9:37:31 AM) fray: khem, Zypper is a nightmare..  so thats out in my
mind.. I won't be spending anymore time working on it due to the
problems and lack of specific functionality I've found so far..
(9:37:58 AM) fray: yum is a problem due to political, not technical
issues.  The maintainer of Yum has indicated that he will do
everything he can to not allow yum to work with our version of RPM..
(9:38:13 AM) khem: fray: ok I take it. its a externally visible change
we have to justify it.
(9:38:17 AM) fray: (the version we choose was selected because of
various cross compilation requirements and a maintainer willing to
help us with cross issues)
(9:38:21 AM) fray: yes
(9:38:23 AM) RP: yum also has technical issues
(9:38:26 AM) khem: so make a proposal after 1.3 is released
(9:38:33 AM) RP: it is not cross friendly at all
(9:38:35 AM) khem: or may be answer to RPs call for 1.4 features
(9:38:35 AM) fray: yup.. thats what the plan is
(9:38:57 AM) fray: it's already in the Yocto Project 1.4 feature
request bucket..
(9:39:12 AM) khem: ok
(9:40:01 AM) fray: ok.. plan then is once 1.3 is done, I'll send out
my RFC and see what folks say...  I don't expect a lot of the current
members are actually using RPM and Zypper, but I'm sure some are or
have tried...
(9:40:11 AM) fray: opkg is more reasonable for most of the folks I
know using oe-core..
(9:40:23 AM) khem: fray: it will need some work on documenting the new
smart and how to use it deploy it etc. some wiki docs. But if the
feature parity is there
(9:40:31 AM) fray: that said on to 4... a - oe-core release status?
(9:40:46 AM) fray: khem, yes, I expect that will be part of the work..
since zypper has little to no current docs.. anything is better hten
we currently have
(9:40:50 AM) khem: fray: I need to use something rpm/zypper
(9:41:11 AM) khem: infact I could use rpm/smart but 1.3 doesnthave it
(9:41:29 AM) fray: 'k
(9:41:59 AM) khem: impact becomes huge for future upgrades
(9:41:59 AM) fray: RP -- oe-core status?
(9:42:12 AM) RP: W're at -rc3 with -rc4 tomorrow
(9:42:26 AM) RP: Things appear to be trending well
(9:42:46 AM) khem: RP: I will be testing cross gcc and cross eglibc on
danny soon
(9:42:49 AM) RP: still waiting on the -rc3 test report but we've
identified the high priority issues and have been targeting them
(9:43:23 AM) RP: Currently the release and master are still proceeding
together but release branches exist
(9:43:46 AM) RP: I'm trying not to open the flood gates on master as
people will forget the release as soon as I do and drown me
(9:43:48 AM) koen: ah, time to branch :)
(9:44:45 AM) RP: Biggest concern at the moment is a problem with the
3.4.10 on arm which has necessitated a hurried bump to 3.4.11
(9:44:53 AM) RP: (kernel)
(9:45:16 AM) koen: 3.4 is the gcc 4.4 or kernels for arm
(9:45:22 AM) koen: s/or/of/
(9:45:26 AM) fray: (uniprocessor problem introduced early in 3.4.x,
fixed in 3.4.11)
(9:46:58 AM) fray: ok.. 4b infrastructure status, anything?
(9:47:10 AM) RP: not here
(9:47:59 AM) Jefro: I added a section 4c: 1.4 planning, and am slowly
dumping things in there so we don't forget them
(9:48:11 AM) fray: sounds good
(9:48:11 AM) bluelightning: it would be really nice to hear something
about OE autobuilders
(9:48:14 AM) Jefro: currently: PR issues, pre/post install scripting, SMART
(9:48:28 AM) bluelightning: we've been talking about getting them for
a while but so far, not much has been happening...
(9:48:44 AM) RP: Has anyone talked to Tom recently?
(9:49:11 AM) koen: yes, when the disks failed last week
(9:49:50 AM) khem: bluelightning: Tom and Martin Jansa has been
working on setting up jenkins
(9:50:08 AM) khem: bluelightning: I havent enquired a lot more recently
(9:50:15 AM) khem: been doing something else
(9:50:41 AM) bluelightning: khem: I suspect they have been as well lately
(9:51:14 AM) khem: bluelightning: yes
(9:51:19 AM) bluelightning: (which is fine, just observing)
(9:53:49 AM) fray: ok.. anything further?  (anything more on 1.4)?
(9:54:03 AM) RP: Nothing from me.
(9:54:09 AM) bluelightning: nothing here
(9:54:13 AM) RP: I guess just a reminder about 1.4 planning
(9:54:31 AM) RP: If people have anything not in the bugzilla, we don't
know about it and won't do anything about it :)
(9:54:32 AM) khem: RP: there is a wiki page for 1.4 items ?
(9:54:38 AM) RP: khem: bugzilla
(9:54:41 AM) khem: ah there you go
(9:54:42 AM) Jefro: feel free to send me any 1.4 notes you'd like to
track in the agenda for discussion
(9:54:46 AM) khem: ok I will file bugz
(9:54:47 AM) RP: khem: enhancement requests
(9:54:51 AM) khem: yes
(9:55:09 AM) RP: khem: there is a summary page on the wiki, its
generated from the bugzilla
(9:55:23 AM) RP: (auto-generated, kind of cool)
(9:55:25 AM) khem: RP: OK I guess it uses some bugz tag ?
(9:55:41 AM) RP: khem: target milestone and status
(9:55:46 AM) fray: things labeled as enhancement and 1.4 right?
(9:56:01 AM) fray: Ohh speaking of bugzilla.. there is a new category
for image deployment issues.
(9:57:46 AM) ***RP welcomes new categories for which he's not the
default assignee :)
(9:58:00 AM) fray: :)
(9:59:09 AM) Jefro: meeting done? I need to go to the next one
(9:59:33 AM) khem: ttyl guys
(9:59:36 AM) fray: yup.. thanks!
(9:59:37 AM) fray: later
(10:01:22 AM) bluelightning: bye all
-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


