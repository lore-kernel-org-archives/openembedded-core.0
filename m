Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1TdPVS-0002B4-E5; Tue, 27 Nov 2012 19:03:39 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so8789431iad.6
	for <multiple recipients>; Tue, 27 Nov 2012 09:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=Wrzulf32zsZ2I7eib2+wRBiHHUSklqJzKBs55ymUHQ4=;
	b=DzerOGFhlLeWwCP9OrK1W/GXRRx5wXxcp8e3mj050HQZQOIKhDJhoDODPQ9miaUJMy
	D4fpx19VN91lpqINjV0XdCJC2iIVLCJdZ5/8wYkRwiGr12anxXmaHHB1DtGcEhfuWVD4
	5a5geui9XJ55EIMxVNx2I6jwln9D36EfzaUQ3E7u9Krdp/ZfmLrR0DBiNJtm1C2/PyWq
	Ou7N9ondns5tLggokDFkTW68UQt2//udaAoMX7eEmgiSuogLM5rg7XiaSq7kEDf6rzmE
	kKSyZqruBsgFIB8UY1tKuEPLA6vdeHNITvQCIGXE1hQNREWB7VwKTSDFNeGUeTVIGzzB
	tl/A==
MIME-Version: 1.0
Received: by 10.50.152.240 with SMTP id vb16mr16705626igb.45.1354038564340;
	Tue, 27 Nov 2012 09:49:24 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.64.147.37 with HTTP; Tue, 27 Nov 2012 09:49:24 -0800 (PST)
Date: Tue, 27 Nov 2012 09:49:24 -0800
X-Google-Sender-Auth: qyFV3khcY0BCEeso6CFMXzg5-HI
Message-ID: <CA+YB3rbpwsD05-u-VTFBXTAHo54BU92b6=MrY6+3j1is8wNfAw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: Minutes: OE TSC 23 Oct 2012
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
X-List-Received-Date: Tue, 27 Nov 2012 18:03:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
23 October 2012

Attendees: Koen, Paul, Khem, Richard
Apologies: Mark
Notes: Jefro
________________________________________________________________
Agenda & Results

1. pick a chair
bluelightning
___________________________________
2. new issues

 a. Meetup at ELCE
-> OE general assembly Weds eve 5pm, Yocto Project Developer day Thurs

 b. RFC for the secondary toolchain (fray)
    how to document as best practice?
        possibly sample secondary toolchain layer as template
        no changes to oe-core, possibly add an include file
-> in progress

 c. RPM and package feeds
        packages_rpm, rootfs_rpm doesn't use Zypper
        fray proposes replacing with SMART after 1.3 release
        smaller footprint, python based
        -> fray will write proposal after 1.3
-> in progress

d. patchwork queue
    bluelightning did a massive clearout of patchwork, got rid of 3 pages
    a number of oe-classic patches left
    koen notes that git hooks catch only 80% of patches, and then only
for master
    known to fail with accented names
=> koen to go through what is left in patchwork for meta-oe
=> bluelightning to send note to ml re oe-classic patches
___________________________________
3. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"

 b. pre/post install scripting (fray)
     holding for 1.4

 c. document whitespace changes to the shell
    RP edited OE style guide with new info, linked to YP
        => fray to update patch guidelines

 d. documentation
    need someone to work on OE wiki pages
        RP, bluelightning, fray to hopefully work on it together
-> attempt to find time at ELCE
___________________________________
4. status

 a. oe-core release
        at -rc3 now, -rc4 tomorrow, hi-priority issues identified
        release branches exist
        issues with 3.4.10 on ARM, bumped to 3.4.11 (uniprocessor)
        new bugzilla category for image deployment issues
-> good to go with the branch as it stands now
-> 1.4 is open for development now
-> merging systemd into master is on 1.4 feature list

 b. infrastructure
    disks failed last week
    Tom & Martin working on setting up jenkins

 c. 1.4 planning
   PR issues
   pre/post install scripting
   SMART
   systemd into master

________________________________________________________________
Raw Transcript:


(9:05:32 AM) RP: Who do we have?
(9:05:54 AM) Jefro: I am in another phone meeting concurrently but
will stay on here for notes. Agenda at http://pastebin.com/rF7Hppaf
(note: I switched New & Lingering issues)
(9:07:06 AM) koen: present
(9:07:48 AM) RP: I'm also double booked. This week is crzay crazy
crazy for meetings :(
(9:07:53 AM) RP: Do we have much to talk about
(9:07:58 AM) RP: fray: ping?
(9:08:01 AM) RP: bluelightning: ping?
(9:08:22 AM) bluelightning: I wanted to raise OE patchwork
(9:08:29 AM) bluelightning: specifically the queue
(9:08:34 AM) koen: judging from the agenda, no new items
(9:09:03 AM) RP: 1.4 update: I think we're good to go with the branch
as it stands now
(9:09:08 AM) RP: er, 1.3 update
(9:10:53 AM) RP: and 1.4 is open for development now and work has started
(9:11:47 AM) koen: hmm, that means I need to send a "volunteers
wanted" mail for meta-oe 1.3 branch
(9:12:44 AM) koen: shall we skip to patchworK?
(9:12:58 AM) bluelightning: I'll assume so
(9:13:09 AM) bluelightning: I had a massive clearout of patchwork the other day
(9:13:19 AM) koen: yay!
(9:13:34 AM) bluelightning: got rid of about 3 pages of
merged/superseded/invalid stuff
(9:14:05 AM) bluelightning: so what we're left with is a number of
patches for OE-Classic which I'm not sure what we want to do with
(9:14:08 AM) koen: the git hooks only catch about 80% of the patches
and only for master
(9:14:27 AM) bluelightning: and some unmerged patches for meta-oe some
of which go back a few months
(9:15:36 AM) bluelightning: koen: indeed... do you know how it does
the comparison?
(9:15:41 AM) RP: are we talking about oe-core or oe-classic here?
(9:16:03 AM) koen: bluelightning: no, but iirc it's the script that
comes with patchwork
(9:16:13 AM) bluelightning: RP: we're talking about the OE patchwork
which includes patches for OE-Classic, meta-oe and other layers on top
of OE-Core that aren't OE-Core
(9:16:16 AM) koen: bluelightning: it is know to fail with accented names
(9:16:33 AM) koen: known*
(9:16:55 AM) RP: bluelightning: So what is the question?
(9:17:01 AM) bluelightning: koen: ok, I was wondering if for example
it handled additional signed-off-by being added
(9:17:33 AM) bluelightning: RP: there are two questions: 1) can we
deal with the queue of meta-oe patches especially the old ones
(9:17:56 AM) bluelightning: and 2) what do we do with the OE-Classic
patches? is it worth keeping them around?
(9:18:05 AM) bluelightning: some of them were never replied to
(9:18:10 AM) RP: Is anyone using oe-classic now?
(9:18:19 AM) bluelightning: RP: I suspect they still are yes
(9:18:30 AM) bluelightning: s/they/a number of people/
(9:18:38 AM) RP: someone needs to step up to do the work, that is the
main problem
(9:19:07 AM) RP: and I don't know who would have time/enough interest
to do it :(
(9:20:09 AM) bluelightning: I'm happy to spend time on this, what is
missing is the mandate
(9:20:15 AM) bluelightning: for 1) the question is for those that
haven't had feedback are they acceptable to be merged or not?
(9:20:37 AM) bluelightning: or have they just been missed?
(9:21:04 AM) RP: bluelightning: a question for koen I think...
(9:21:15 AM) ***RP isn't sure anyone else has the context
(9:21:22 AM) koen: most likely they have been missed
(9:21:42 AM) koen: I usually wait a few days and if they don't get
feedback -> apply
(9:22:09 AM) koen: bluelightning: the addition of SOBs and acks
happens when downloading the patch from patchwork, not in the git hook
(9:22:32 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:22:33 AM) mode (+v khem) by ChanServ
(9:22:41 AM) bluelightning: koen: yes, I mean is the additional
signed-off-by enough to convince the hook script that the patch is
different
(9:23:17 AM) khem: good morning guys
(9:23:23 AM) khem: I am a bit late :)
(9:23:28 AM) bluelightning: hi khem
(9:23:30 AM) koen: bluelightning: I think it copes with that
(9:23:36 AM) bluelightning: koen: ok
(9:24:34 AM) bluelightning: koen: so will you have time to go through
what is left in patchwork for meta-oe?
(9:26:15 AM) koen: yes
(9:27:20 AM) bluelightning: great, thanks... let me know if you would
like me to help at all
(9:27:40 AM) RP: hi khem, we don't appear to be having a meeting that
is structured particularly well today
(9:27:47 AM) RP: several of us are being pulled in different directions
(9:27:51 AM) khem: bluelightning: your patch is big I think its being
ignored by pw we have had such issues in past
(9:28:05 AM) bluelightning: khem: oh well, hopefully koen sees it anyway ;)
(9:28:15 AM) khem: RP: yes me too :)
(9:28:29 AM) khem: bluelightning: sometimes I have to send pull requests
(9:28:33 AM) khem: for meta-oe
(9:28:38 AM) khem: just for reasons
(9:28:51 AM) bluelightning: I usually use pull requests but for single
patches I'm a bit lazy
(9:28:55 AM) koen: bluelightning: if the coverletter shows up, I see it
(9:29:08 AM) koen: bluelightning: cc me directly if you want to make sure :)
(9:29:36 AM) bluelightning: koen: ok, I'll keep that in mind, thanks
(9:30:12 AM) khem: RP: I mentioned this issue with multimachine builds
where uderlying arch is same e.g. many intel machines or say armv7
based machines. Is this a model we intend to make work
(9:30:25 AM) khem: or what is recommendation there
(9:30:46 AM) RP: khem: Its a bug we need to find and fix
(9:30:53 AM) RP: khem: I was meaning to reply
(9:30:55 AM) khem: RP: hmm OK
(9:31:26 AM) khem: I kind of need to solve this problem if its a bug
them I dont have to change the deploying design
(9:31:34 AM) bluelightning: for 2) the OE-Classic patches I guess I'll
send out an email to the list
(9:31:36 AM) khem: thanks
(9:31:48 AM) RP: bluelightning: sounds like a good plan
(9:32:05 AM) khem: bluelightning: OE-Classic patches I think only the
release branch is active
(9:32:25 AM) khem: bluelightning: are there more ?
(9:32:36 AM) bluelightning: khem: right, the general call would be "if
anyone wants these, please repost for the maintenance branch"
(9:32:43 AM) bluelightning: khem: more?
(9:33:09 AM) khem: I thought you were addressing to some pending patches
(9:33:24 AM) khem: Tom R has been taking good care of release branch
(9:33:34 AM) bluelightning: khem: indeed he has
(9:33:36 AM) khem: it still builds on ubuntu 12.10
(9:33:53 AM) khem: I just built angstrom 2010 a week ago
(9:34:07 AM) bluelightning: khem: there's a queue of patches that were
apparently posted for master though
(9:34:26 AM) bluelightning: khem: have a look at the recently cleaned
patchwork queue and you'll see what I mean
(9:34:33 AM) khem: bluelightning: we should guide the submitter to
post against release branch yes
(9:34:40 AM) khem: if there is a need
(9:34:49 AM) khem: for those in branch
(9:34:59 AM) khem: bluelightning: ah ok :)
(9:36:26 AM) bluelightning: so, should we go through the rest of the agenda?
(9:36:38 AM) khem: have we discussed merging systemd into master post 1.3
(9:37:15 AM) bluelightning: it's been alluded to in past meetings
(9:37:21 AM) RP: khem: its on the 1.4 feature list
(9:41:10 AM) RP: So anything else we need to talk about?
(9:41:22 AM) bluelightning: going through the agenda: 2a I think was
handled last time
(9:41:22 AM) RP: Sorry I'm getting a bit distracted
(9:41:33 AM) RP: yes
(9:41:46 AM) bluelightning: Any comments on 2b?
(9:41:49 AM) RP: I think 2b/c are in progress, not much to talk about
(9:42:37 AM) bluelightning: ok, let's skip to 3d then (3 a-c seem to
be just reminders)
(9:42:41 AM) RP: no change on any of 3) either
(9:42:53 AM) RP: I've not had any time for 3d, we probably need to set
a date.time
(9:42:59 AM) bluelightning: RP: do we want to schedule any time at or
around ELCE for the OE wiki or do you want to do it before then?
(9:43:23 AM) RP: bluelightning: You know my travel schedule, I'm not
sure I will have time any time soon :(
(9:43:46 AM) bluelightning: right, let's just assume it will be at ELCE then
(9:43:58 AM) bluelightning: I'll try to get make a start beforehand
(9:44:17 AM) bluelightning: RP: anything on 4a?
(9:44:32 AM) RP: bluelightning: I covered that at the start
(9:44:50 AM) RP: The issues were addressed with ARM, -rc4 is a lot better
(9:44:56 AM) RP: should be released on time
(9:45:14 AM) bluelightning: ok; 4b: infrastructure... any comments?
(9:46:47 AM) bluelightning: no?
(9:47:15 AM) bluelightning: ok, let's move on to 4c then
(9:47:37 AM) bluelightning: anything further for the 1.4 planning?
(9:50:28 AM) Jefro: the 1.4 list is just a bucket to put things in & a
reminder to put things in it
(9:50:54 AM) bluelightning: ok, I guess if anyone has any feature
requests they haven't already filed, get them in ASAP
(9:52:07 AM) RP: yes, I'd second that
(9:56:12 AM) bluelightning: ok, 5 minutes left, anything else? or
should we just close it there?
(9:56:23 AM) bluelightning: well, 4 minutes
(9:56:38 AM) RP: I don't have anything
(9:58:19 AM) bluelightning: ok, let's call it there... thanks all
(10:02:18 AM) RP: thanks all

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


