Return-Path: <jefro.net@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 23F8A6023E;
	Tue, 18 Jun 2013 23:47:23 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id fo12so4000217lab.25
	for <multiple recipients>; Tue, 18 Jun 2013 16:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=8QTWQT5VMO+3iCUzoCmfJB2Rv6sHFN0xI+TTvZ9CKrg=;
	b=pEI+VwsXTrdZkDFFCx7DodnRVSa5TpC1SurlLLeZLMZEYJ1MsRhgIxJ6cJUnvTfIrZ
	GO3BRv/j3WR8SLwH5hSMre0SwNTo5P/iVaTLd1ccXjSAWKnDIuuqKIp4mOpFwho7Hruw
	CVIq2tj1hwollpUHhucInZ85IuZv625BY8EODv4InyvMgXSnbxXmuQnTtmtKa0JC2d0u
	5jPwsMyIZGUblHBOZp1XtJPWiHA15VETJ5icYvDPRzbd5aGdpUBMuRIEBTJDXk/grNOC
	0T3VnxV6Fpdfd1N8ZXymodZaZsA9RhSffz6TYMky0qdpFeP7xiJiJNIeLgOtlO4I2Z7w
	AnJA==
X-Received: by 10.112.201.138 with SMTP id ka10mr1636043lbc.72.1371599243997; 
	Tue, 18 Jun 2013 16:47:23 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.30.146 with HTTP; Tue, 18 Jun 2013 16:47:03 -0700 (PDT)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Tue, 18 Jun 2013 16:47:03 -0700
X-Google-Sender-Auth: JZsSxKv2OB42oedPqzwwdwWz90A
Message-ID: <CA+YB3rbofZAcCyUm37pBqBoNyshotwFjf43-Tgs1wkWUSBb4jg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 18 June 2013
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2013 23:47:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
18 June 2013

Attendees:
  Koen (koen)
  Fray (fray)
  Paul (bluelightning)
  Khem (khem)
  Richard (RP)
Apologies:

Notes: Jefro

Agenda at a glance:

1. pick a chair
2. new issues
3. lingering issues
    a. role of the TSC
    b. elections
4. projects in progress - status
    a. oe-core release
    b. meta-oe appends/overlayed recipes RFC
    c. python 3
    d. release status notification
5. infrastructure
    a. oe.org flooded
6. projects deferred
    a. raise awareness of "janitor" list, QA "bugs"
    b. document whitespace changes to the shell
    c. raise ntp with the Yocto Project [RP]

________________________________________________________________
Agenda & Results

1. pick a chair
    bluelightning

___________________________________
2. new issues

a. eglibc
    http://www.eglibc.org/archives/patches/msg01268.html
    maintainers (Mentor) removing differences btw eglibc, upstream glibc
    would like to deprecate & remove option groups
        then unable to configure items out
        potentially ruining poky-tiny and others
->    poll users to see if actually being used
    alternatively, find someone willing to maintain
    khem proposes replacing option groups with pure kconfig
=>    raise eglibc issues on mailing list (fray)
=>    get kconfig stuff discussed and proposed to glibc (khem)

___________________________________
3. lingering issues

a. role of the TSC
    (http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/038756.html)
    proposal: monthly IRC meeting to replace one of the bi-weekly TSC
meetings, open to all
    split the TSC role in two.. have a infrastructure, etc TSC similar
to now.. as well as 'resolve technical conflicts'
    defer vote
=>     post RFC on mailing list (RP) - drafted & reviewed, sent to mailing lists

b. elections
=>    jefro to flag the board, recommend defer elections until after 3a (DONE)

___________________________________
4. projects in progress - status

a. oe-core release
    release status emails very well received
->    Khem seems to have found part of the problem w/ gcc 4.8 (and ARM)
->    also a gcc 4.8 patch from Bruce
    into M2 now
    bitbake wrapper script removed
    python 2.7 now required - problem for CentOS 6.4
        mitigated by buildtools-tarball, will cover in docs

b. meta-oe appends/overlayed recipes RFC
    still remaining: busybox and gst-ffmpeg bbappends, xserver-nodm-init
    Warning: PRINC is deprecated, the use of the PR server is
recommended, see ...
=>    issue warning, plan to make it an error in 1.5, revisit before
release (RP)
=>    document PRINC - PR server migration steps (fray)
=>    proposal: error and a disable flag, revise RFC patch (fray)
    RFC switching wholeheartedly to libav (bluelightning) sent, a few responses
->    two bbappends left: gst-ffmpeg (bluelightning) and busybox (khem)
    also tslib (overlay), bluelightning pinging kergoth

c. python 3
    need to start informing people of it -now-
->    currently tackling 2.7.3 first
    probably 2.7.3 in 1.5, move to python 3 in 1.6

d. release status notification
=>    maintain a wiki page to summarize release goals (jefro)

___________________________________
5. infrastructure

a. oe.org flooded
=> investigate YP hosting, kernel.org mirror (jefro)
    reporting system when there are issues, make sure the appropriate
people are notified
    monitor for now
->    investigation underway & recommendation made


___________________________________
6. projects deferred

a. raise awareness of "janitor" list, QA "bugs"
    defer to after 1.4

b. document whitespace changes to the shell
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> still need to de-dup these, need a volunteer
    ask for volunteers after 1.4 (jefro)

c. raise ntp with the Yocto Project [RP]
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial
    no default set after Paul's changes
    RP raised with YP AB
=> going to mailing lists & someone should write a proposal
=> fray will send to list after 1.4


________________________________________________________________
Raw Transcript

(9:00:19 AM) fray: Hello
(9:00:26 AM) Jefro: good morning
(9:00:27 AM) koen: hi
(9:00:31 AM) RP: Hi all
(9:00:50 AM) Jefro: looks like we are just waiting for khem - agenda
is at http://pastebin.com/jeeGWbYu
(9:01:35 AM) bluelightning: hi all
(9:03:18 AM) Jefro: no response from khem, he may be driving - give
him a few mins?
(9:07:21 AM) ***fray reads the libtool 'hate' threads and approves..
(9:07:52 AM) fray: I just wonder if removing the .la (and even
libtool) what repurcussions that may have in changes in the way the
build works.. :(
(9:08:05 AM) fray: another couple minutes or should we get going?
(9:08:40 AM) koen: it might break AIX versions from the early 1990s
(9:08:49 AM) bluelightning: Jefro: FYI I think you need to update the
contents for section 4 in the agenda
(9:09:14 AM) fray: well, my experience a few years ago showed that if
you remove the .la files, then host contamination seems 'worse'..
(since libtool would fall back to the .la file on the host)
(9:09:27 AM) Jefro: oops, the top part may be out of sync
(9:09:48 AM) RP: In many ways I'd prefer to remove libtool rather than
the .la files...
(9:09:55 AM) Jefro: agenda in 1 minute
(9:09:57 AM) fray: :)
(9:10:25 AM) fray: here are still some things that use the ltdl...
that'd be the only other place that would worry me if we killed off
libtool..
(9:11:27 AM) Jefro: fixed agenda: http://pastebin.com/xZZ6h2Q3
(9:11:32 AM) RP: fray: right, I have some ideas what we could do to that
(9:12:16 AM) bluelightning: let's make a start
(9:12:21 AM) fray: ok
(9:12:50 AM) bluelightning: who will chair?
(9:13:05 AM) ***fray is very distracted currently.. so I'd be a bad chair
(9:13:05 AM) bluelightning: I can do it if noone else wants to
(9:13:25 AM) bluelightning: ok, it's me
(9:13:36 AM) bluelightning: any new issues?
(9:13:46 AM) RP: I've just drafted http://pastebin.com/FNtm93pF
(9:13:59 AM) RP: which is a response to one of my actions
(9:14:14 AM) RP: Sorry not to have done this sooner, I'm open to comments on it
(9:15:15 AM) RP: bluelightning: nothing new from me
(9:15:31 AM) fray: that looks fine to me
(9:15:51 AM) fray: bluelightning no new issues here
(9:16:30 AM) bluelightning: RP: draft looks fine to me apart from
"figuring that our," -> "figuring that out," ?
(9:17:37 AM) bluelightning: ok so 3a - role of the TSC
(9:17:53 AM) bluelightning: any other comments on this? presumably RP
can send that out and we wait for the response
(9:18:04 AM) RP: bluelightning: corrected, well spotted
(9:18:35 AM) Jefro: going to members list or -devel?
(9:18:48 AM) RP: Jefro: members + oe-core was my plan
(9:19:22 AM) Jefro: that sounds good - maybe cc the "tsc" list
(9:19:46 AM) RP: Jefro: right
(9:20:38 AM) bluelightning: OK, I guess we're done on 3a; 3b looks done as well
(9:20:58 AM) Jefro: yes, I talked to Philip
(9:21:36 AM) fray: 4a -- Khem seems to have found part of the problem
w/ gcc 4.8 (and ARM)
(9:21:59 AM) bluelightning: right, I also saw a patch from Bruce
(9:22:01 AM) fray: I'm still locally testing gcc 4.8.1, but I think
many of the issues have been resolved...
(9:22:20 AM) fray: (e500v2 ICE was the other thing I was tracking)
(9:22:43 AM) bluelightning: is that solved as well or still being worked on?
(9:22:58 AM) fray: I havn't gotten to the point of reproducing success
or failure..
(9:23:03 AM) bluelightning: ah ok
(9:23:41 AM) bluelightning: re status, I think we're out of the M1
stabilisation now, right?
(9:23:45 AM) RP: If the gcc 4.8 hang is fixed for arm, we'd probably
change the default at that point
(9:23:53 AM) RP: bluelightning: yes, we're into M2 now
(9:24:08 AM) RP: biggest change is the bitbake wrapper script removal
(9:24:16 AM) RP: long talked about, now merged
(9:24:19 AM) bluelightning: indeed
(9:24:37 AM) bluelightning: and accompanying requirement of python 2.7.3+
(9:24:43 AM) RP: buildtools-tarball is available for people needing to
run on systems that don't have the minimum version requriements
(9:24:51 AM) fray: Note on that..
(9:25:00 AM) fray: there are still a lot of 'modern' systems that
don't mean minimum versions..
(9:25:04 AM) fray: I.e. latest CentOS 6.4
(9:25:15 AM) ***bluelightning has verified buildtools-tarball works on
centos 6.4 btw
(9:25:27 AM) fray: I havn't used the buildtools-tarball, yet.. but
building local versions of the affected items is working here
(9:25:28 AM) bluelightning: (that's what I use on my main build machine)
(9:25:38 AM) RP: fray: right, that is unfortunate :/
(9:25:48 AM) RP: fray: we've put off python 2.7 for years though...
(9:26:08 AM) fray: I think the key thing is that we just need to make
it -very- clear to newbies how/where to get their buildtools-tarball..
:)
(9:26:23 AM) ***fray hasn't realized quite how out of date CentOS 6.4 was
(9:26:33 AM) RP: fray: yes, I have flagged this with Scott (tech
writer) that its something we need to cover well
(9:26:40 AM) fray: good enough
(9:27:54 AM) bluelightning: ok, if that's it for status; on to 4b -
meta-oe appends/overlayed recipes RFC
(9:28:30 AM) RP: bluelightning: do we still need that on the agenda?>
(9:28:47 AM) bluelightning: to be honest I think it needs to stay
until it's sorted out
(9:29:00 AM) RP: bluelightning: its not sorted yet? :/
(9:29:04 AM) bluelightning: no :/
(9:30:13 AM) RP: bluelightning: anything the TSC can do to help?
(9:30:33 AM) bluelightning: FWIW, patches have been sent to move
xinput-calibrator to OE-Core which should pave the way to removing the
overlayed xserver-nodm-init
(9:30:56 AM) fray: good
(9:31:00 AM) bluelightning: other than that, the two bbappends left
are still gst-ffmpeg and busybox
(9:31:22 AM) bluelightning: khem was going to look into the busybox
one but I'm guessing he's been pretty busy with the gcc issue as well
as being away
(9:31:57 AM) bluelightning: gst-ffmpeg I guess is on my plate to
resolve after the RFC I sent out
(9:32:03 AM) RP: gst-ffmpeg needs to become a PACKAGECONFIG?
(9:32:49 AM) bluelightning: well, gst-(ffmpeg|libav) is a separate
plugin for gstreamer
(9:33:36 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:33:36 AM) mode (+v khem) by ChanServ
(9:33:36 AM) bluelightning: the plan is to move to gst-libav in
OE-Core, bring in libav as well and then we don't need the bbappend in
meta-oe which just switches gst-ffmpeg over to external libav
(9:33:51 AM) RP: ok, seems reasonable
(9:34:27 AM) Jefro: good morning khem
(9:34:41 AM) ***khem was hiding for being late
(9:34:42 AM) khem: gm all
(9:34:48 AM) bluelightning: hi khem
(9:34:59 AM) fray: :)  We briefly metnioned gcc 4.8..
(9:35:10 AM) fray: ARM may be resolved.. e500v2 I havn't had time to
check if its working or not yet
(9:35:13 AM) bluelightning: khem: http://pastebin.com/xZZ6h2Q3
(9:35:21 AM) fray: anything else to report?
(9:35:32 AM) bluelightning: khem: and draft email which RP will send
for TSC role: http://pastebin.com/FNtm93pF
(9:35:54 AM) RP: "has sent" now :)
(9:35:58 AM) bluelightning: ok :)
(9:36:02 AM) bluelightning: thanks
(9:36:18 AM) bluelightning: khem: we are on 4b
(9:36:44 AM) bluelightning: there is one other overlayed recipe -
tslib; I never got a response from Chris on creating a new stable
release upstream, will ping again today
(9:37:21 AM) fray: I thought I saw something that it had.. but I might
be thinking of something else. (to the list a couple weeks ago)
(9:37:53 AM) bluelightning: if so, he hasn't tagged it in his repo on github
(9:37:58 AM) bluelightning: anything else on the other items within 4b
(PRINC etc.) ?
(9:38:03 AM) fray: then I'm thinking of something else
(9:38:20 AM) fray: the document bit I did was in the RFC patch I sent out..
(9:38:24 AM) fray: I think that stalled out though..
(9:38:48 AM) fray: (or did I sign up for something else that I've
completely forgotten?)
(9:39:38 AM) fray: There is a PR server item that I'm not sure is
quite as cleanly documented as it probably should be.. (unless I'm
misunderstadning the issue)
(9:39:54 AM) bluelightning: well we do need to tell people clearly
what they need to do
(9:40:08 AM) fray: If you are using a PR server, and write out a
shared state.. someone else uses that shared state.. their PR numbers
could be out of sync
(9:40:30 AM) fray: I don't know what happens in that case.. do they
get odd PR numbers from the sstate, or does it trigger rebuilds of the
package(s)?
(9:40:33 AM) RP: fray: didn't you say you'd send out a PRINC patch
which errored but could be disabled?
(9:40:50 AM) fray: RP, I thought I had.. if not.. that's my next TODO action
(9:41:38 AM) RP: fray: I don't remember seeing it :/
(9:41:45 AM) RP: which isn't to say you didn't...
(9:41:47 AM) fray: ok.. put it down as my action.. it slipped
(9:42:57 AM) bluelightning: ok, let's move on to 3c - python 3
(9:43:03 AM) bluelightning: RP: anything to report on that?
(9:43:39 AM) RP: bluelightning: We're tackling 2.7.3 first which sets
the scene for python 3
(9:43:52 AM) bluelightning: right
(9:43:56 AM) bluelightning: sorry I meant 4c
(9:44:01 AM) RP: As things stand we're probably sticking with 2.7.3
for 1.5 and then go to 3 in 1.6
(9:44:07 AM) bluelightning: ok
(9:44:17 AM) fray: seems reasonable to me.. the checks all seem to be
working, and I've not heard a rush of complaints..
(9:44:32 AM) RP: If I find some time I might push in some more python
3 migration patches
(9:44:41 AM) RP: but there are other more pressing issues
(9:44:53 AM) bluelightning: indeed
(9:45:03 AM) RP: I'm happy we have a rough plan at this point and
understand the issues in moving to 3.x
(9:45:30 AM) fray: Ohh.. I just remembered there is one new issue...
(9:45:32 AM) bluelightning: RP: yes, you've done a lot of good groundwork there
(9:45:37 AM) fray: (not related to python)  :)
(9:45:48 AM) bluelightning: fray: ok let's handle that now
(9:46:05 AM) fray: New issue is toolchain focused.. currently Mentor
is maintaining much of the eglibc branch..
(9:46:15 AM) fray: they're working on removing the differences between
eglibc and upstream glibc..
(9:46:28 AM) fray: the option groups are the biggest change, and
they'd like to deprecate them (and eventually remove)
(9:46:57 AM) RP: fray: meaning its no longer possible to configure
different pieces in/out?
(9:46:59 AM) fray: Right now the biggest user of them is OE..  So
we're going to need to decide if it's actually being used (poll the
users), if we think they're still needed and help set some direction
(9:47:05 AM) fray: RP, that is exactly what they want to remove
(9:47:16 AM) RP: fray: that would destroy poky-tiny :(
(9:47:18 AM) fray: another alternative is to find someone willing to
maintain that work
(9:47:26 AM) fray: RP, yes it would.. and I suspect other distros..
(9:47:32 AM) RP: fray: there is no chance of getting it into glibc?
(9:47:44 AM) fray: the option groups in my experience is not a large
user base.. but those who want it, really need it
(9:47:51 AM) fray: RP, not that I know of..
(9:47:56 AM) fray: let me find the thread quickly.. just a sec
(9:48:34 AM) fray: http://www.eglibc.org/archives/patches/msg01268.html
(9:48:38 AM) fray: thats the start fo the thread
(9:48:40 AM) RP: khem: any extra background?
(9:48:47 AM) fray: so far I'm the only one to pipe in an object..
(9:49:45 AM) fray: I see a new class of 32-bit 'microcontroller' like
processors coming out.. they're very constrained, but people want to
run Linux on them..
(9:50:06 AM) fray: but what I don't know is if this is a hobbiest
thing, or something people making products (those with the dollars to
help fund the effort) want..
(9:50:20 AM) fray: If it's a hobbiest thing, then we may need some
community involvement to help this..
(9:50:22 AM) khem: RP: I am going to send kconfig patches
(9:50:44 AM) khem: RP: my proposal would be to get rid of option
groups and replace it with pure kconfig
(9:50:47 AM) fray: khem, that's one part of it..  but the underlying
option group mechanism is the real concern..
(9:51:23 AM) khem: current implementation is based tickling underlying
option groups using kconfig
(9:51:23 AM) fray: khem, that is fine -- but it's maining the if's,
and everything throughout the code that is the real maintenance/merge
concern
(9:51:54 AM) fray: (I'd prefer a full kconfig based approach myself..
but it's maintaining --or-- killing off the ability to even configure
eglibc at that level is the concern
(9:52:09 AM) khem: fray: yes, Now I dont know if it really matters if
libc can be trimmed in this day and age
(9:52:18 AM) bluelightning: surely that's part of the essence of
eglibc in the first place?
(9:52:19 AM) fray: anyway, there is the heads up.. spread the word..
if you care, speak up..
(9:52:33 AM) RP: I will mention this to a few people
(9:52:48 AM) fray: bluelightning now that the controllers of the glibc
source based are more open to embedded systems -- they aren't having
to do as much ports and similar work..
(9:52:49 AM) khem: bluelightning: thats one but the real one is/was
support for cross testing and cross compiling and non-desktop arches
(9:53:00 AM) fray: so they are merging the differences together, which
one of the largest maintenance items is the confgiurability section
(9:53:10 AM) bluelightning: ok
(9:53:11 AM) bluelightning: fray: thanks for raising this
(9:53:26 AM) fray: here was a post on the list about what remain as
the differences, they're actually small these days
(9:53:32 AM) fray: (by features that is)
(9:53:38 AM) RP: fray: can you mention this on the mailing list?
(9:53:46 AM) fray: give me the action, I'll forward it on
(9:53:57 AM) RP: fray: thanks
(9:54:05 AM) bluelightning: ok, running short of time
(9:54:14 AM) RP: If we have users out there, we should try and tell them
(9:54:19 AM) bluelightning: 4d - release status notification
(9:54:22 AM) bluelightning: Jefro: any update?
(9:54:33 AM) ***Jefro looks around and whistles
(9:54:45 AM) Jefro: no - too many other things. I'll try to get to it
before next meeting
(9:54:59 AM) bluelightning: Jefro: it's ok, we don't hold you to any
higher standard than the rest of us who routinely drop items on this
list :)
(9:55:20 AM) Jefro: I may need some help & will ping people
relentlessly as needed
(9:55:25 AM) bluelightning: please do
(9:55:48 AM) bluelightning: 5a - oe.org flooded
(9:56:00 AM) fray: anything new, or just still monitoring..
(9:56:03 AM) Jefro: that was dropped back to "monitor"
(9:56:09 AM) fray: I've not noticed any service disruptions in a while now
(9:56:11 AM) bluelightning: I'm a bit detached but it seems like
things are OK now... do we need this item?
(9:56:23 AM) Jefro: can remove - I'll keep my AR in mind
(9:57:02 AM) bluelightning: thanks... the only thing I can think of is
to have more of a reporting system when there are issues, make sure
the appropriate people are notified if they aren't already being
(9:57:17 AM) RP: I think there is an infrastructure mailing list
(9:57:28 AM) bluelightning: we do usually get pretty quick feedback
when the site is slow/down/broken
(9:57:32 AM) Jefro: there is a YP infrastructure list, not sure about OE
(9:57:55 AM) Jefro: in fulfilling my AR I'll talk to Michael & Tom about options
(9:58:06 AM) bluelightning: I think there is a linuxtogo mailing list
specifically for the infrastructure, but that only covers that portion
of the OE infrastructure
(9:58:29 AM) bluelightning: ok, that covers the non-deferred items
(9:58:32 AM) bluelightning: any closing comments?
(9:58:46 AM) Jefro: note that deferred items will probably remain so
until after RP gets back
(9:59:13 AM) bluelightning: (I'll just mention I took Martin's AR in
reply to last meeting's minutes about having the layer index record
OE-Classic recipe info, and that work is in progress)
(9:59:14 AM) ***RP is expecting everything to be resolved by then :)
(9:59:29 AM) Jefro: hehe
(10:00:24 AM) bluelightning: ok, that's time... thanks everyone

