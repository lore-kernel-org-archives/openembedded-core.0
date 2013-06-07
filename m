Return-Path: <jefro.net@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 08F946A53C;
	Fri,  7 Jun 2013 21:54:26 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id l18so10284wgh.14
	for <multiple recipients>; Fri, 07 Jun 2013 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=KSKL3Y8c1iw2Sc6Zrvf1IPEePDZk+EE6OoAzwwqecWc=;
	b=Drr2O52byxLupi+YiRL4rJSR0pJDDiDvjvF3yekvO3WXsDH/7ST62JXCu2Xa7tENli
	lZ9XsdMTBZGr+vjq2BsZ8OD3Xw+z+qyny9/wavUlqVtxrBpuNXcqk7kmFsZRkE5dLHce
	VB0ILPu8G8iNRoKMn+JNsoIkOARkUqTkOgyMgE2GywKNVjxEras0xuk6QcS5dphPMQKx
	jGCRh3OtKCMEdYEJi4oh0fW21QDSM/1+ieilboo3md2YvNAdEM114SEYy+NL9RZ2Acva
	GH1aenUVxl7U2hi9PhG+jq0NS6X0XCGAqmFGdJdlUm8LuWyO8rLwdQ3QBj0V2+NmCg1P
	SZ/A==
X-Received: by 10.194.110.73 with SMTP id hy9mr269401wjb.95.1370642066932;
	Fri, 07 Jun 2013 14:54:26 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.180.185.179 with HTTP; Fri, 7 Jun 2013 14:54:06 -0700 (PDT)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 7 Jun 2013 14:54:06 -0700
X-Google-Sender-Auth: 1gtoDM--jVz13d5-KfsoFn0bPDs
Message-ID: <CA+YB3rZ+pWVzy6_=PAa9QRTdsu+Y5OEGwdW7sLpLphnWZ-89yw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 4 June 2013
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
X-List-Received-Date: Fri, 07 Jun 2013 21:54:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
4 June 2013

Attendees:
  Koen (koen)
  Fray (fray)
  Paul (bluelightning)
  Richard (RP)
Apologies:
  Khem (khem) on vacation

Notes: Jefro

Agenda at a glance:

1. pick a chair
2. new issues
3. lingering issues
4. projects in progress - status
a. oe-classic recipe migration status
b. oe-core release
c. meta-oe appends/overlayed recipes RFC
d. 1.5 planning
e. python 3
f. release status notification
5. infrastructure
a. oe.org flooded
6. projects deferred
a. raise awareness of "janitor" list, QA "bugs"
b. document whitespace changes to the shell
c. raise ntp with the Yocto Project [RP]

________________________________________________________________
Agenda & Results

1. pick a chair
fray
___________________________________
2. new issues

a. elections
=> jefro to flag the board, recommend defer elections until 3a is decided

___________________________________
3. lingering issues

a. role of the TSC
(http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/038756.html)
proposal: monthly IRC meeting to replace one of the bi-weekly TSC
meetings, open to all
split the TSC role in two.. have a infrastructure, etc TSC similar to
now.. as well as 'resolve technical conflicts'
=> post RFC on mailing list (RP)
defer

___________________________________
4. projects in progress - status

a. oe-classic recipe migration status
drop from agenda after this

b. oe-core release
release status emails very well received
stabilisation period for 1.5 M1 now
teething issues w/ gcc 4.8
trending OK

c. meta-oe appends/overlayed recipes RFC
still remaining: busybox and gst-ffmpeg bbappends, xserver-nodm-init
many recipes (.bbappends) still using PRINC
Warning: PRINC is deprecated, the use of the PR server is recommended, see ...
=> RFC switching wholeheartedly to libav (bluelightning)
 sent, a few responses
=> issue warning, plan to make it an error in 1.5, revisit before release (RP)
=> document PRINC - PR server migration steps (fray)
=> proposal: error and a disable flag, revise RFC patch (fray)

d. 1.5 planning
planning mostly complete - bugs will be considered for next cycle at this point
RP on sabbatical
drop from agenda after this

e. python 3
need to start informing people of it -now-
loop around to decide python version etc - no current update

f. release status notification
=> maintain a wiki page to summarize release goals (jefro)

___________________________________
5. infrastructure

a. oe.org flooded
=> investigate YP hosting, kernel.org mirror (jefro)
monitor

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

(9:01:56 AM) RP: Jefro: are we due an election for me sometime around now?
(9:02:24 AM) bluelightning: hi RP, Jefro
(9:02:32 AM) fray: I thought elections were pushed to 2014
(9:02:34 AM) Jefro: RP yes - I reminded the board a while back but I
haven't seen anything happen
(9:02:40 AM) fray: ut maybe I'm off a year
(9:02:42 AM) bluelightning: hi fray
(9:02:52 AM) Jefro: fray really? I have it down for this year. RP was
last elected in 2011
(9:03:10 AM) RP: time flies...
(9:03:15 AM) fray: Moves to a two year cycle.. but ya, if 2011 was the
last election, then RP would be up
(9:03:17 AM) Jefro: it might be good to settle the ongoing role of the
TSC before going there
(9:03:27 AM) fray: I would definitely agree..
(9:03:33 AM) fray: we're once again in a transition period
(9:03:33 AM) RP: well, we need to flag to the board that this is due
(9:03:39 AM) RP: its then up to them what to do...
(9:03:46 AM) ***fray agrees
(9:03:48 AM) Jefro: I'll remind them again today
(9:03:53 AM) RP: but we need to sort this out, I agree
(9:04:07 AM) RP: I'm afraid my ARs from the last meeting slipped my mind :(
(9:04:40 AM) Jefro: my fault ...  sending out the minutes slipped MY mind
(9:04:49 AM) bluelightning: we are missing khem; koen said he might be late
(9:04:58 AM) fray: with the meeting minutes of the 21st getting ready
to go out (if they havn't) then, it should be a good tiem to send the
RFC about the change in the TSC behavior/role
(9:05:18 AM) Jefro: just need khem's ack
(9:05:22 AM) fray: So as far as that AR goes, I think yuo still have time.. :)
(9:05:27 AM) RP: fray: its a good time but I need to write them
(9:08:06 AM) Jefro: pinging khem
(9:09:06 AM) Jefro: agenda at http://pastebin.com/mjdhsaGT
(9:11:13 AM) koen [~koen@ip4da2a5ae.direct-adsl.nl] entered the room.
(9:12:20 AM) Jefro: good morning koen - agenda at http://pastebin.com/mjdhsaGT
(9:12:23 AM) Jefro: still waiting for khem
(9:13:10 AM) ***koen is waiting for dessert at the restaurant
(9:13:27 AM) fray: :)  Now you are just making me hungry.. (almost
lunch time here)
(9:15:15 AM) Jefro: In the interest of time I'd suggest getting started
(9:15:20 AM) fray: yup
(9:15:50 AM) fray: I can chair if desired..
(9:16:24 AM) Jefro: recorded - although I'm afraid we may have lost a few folks
(9:16:52 AM) fray: we still have enough here for a quorum?
(9:17:01 AM) fray: RP/bluelightnign/koen?
(9:17:28 AM) RP: I'm here
(9:17:32 AM) koen: here
(9:17:37 AM) RP: sorry just doing a few things at once :(
(9:17:50 AM) fray: NP
(9:18:00 AM) fray: ok, I assume bluelightning is similarly busy.. ok
we'll go on..
(9:18:11 AM) fray: new issues/lingering issues?
(9:18:14 AM) bluelightning: I am here, sorry
(9:18:32 AM) fray: for lingering just the email that needs to go to
the list about the role of the TC.. anything else?  (I don't think we
need further discussion)
(9:19:11 AM) bluelightning: don't think so
(9:19:37 AM) fray: ok onto 4 then..  4a - oe-classic migrations tatus,
anything new?
(9:19:52 AM) bluelightning: nothing that I'm aware of
(9:20:19 AM) fray: is there much more work to be done, or is that
project pretty much over?
(9:20:29 AM) bluelightning: there are still a lot of recipes not migrated
(9:20:38 AM) bluelightning: but there's no point in mass migration
without maintainers
(9:20:58 AM) bluelightning: plus there's a ton of cruft in OE-Classic
(9:21:05 AM) bluelightning: so not all of it would make sense to migrate anyway
(9:21:11 AM) fray: ok.. should this remain on the agenda, or should is
go away until new maintainers step up or?
(9:21:49 AM) bluelightning: I'm not sure... I don't see that there are
any future actions for the TSC for this issue
(9:22:17 AM) fray: that's what I was thinking.. so lets drop it unless
something new comes up.. (drop it from the agenda that is)
(9:22:26 AM) bluelightning: right, sounds sensible to me
(9:22:33 AM) fray: 4b -- oe-core release...
(9:23:01 AM) fray: The relase status emails from RP seem to be well recieved..
(9:24:22 AM) koen: Daves
(9:24:25 AM) koen: ehm
(9:24:39 AM) koen: saves me a lot of reading
(9:25:06 AM) fray: actually both..
(9:26:01 AM) fray: RP -- anything to add on the oe-core release?
(9:27:44 AM) RP: sorry, totally distracted, be back in 5 minutes :(
(9:28:13 AM) bluelightning: I can say something in RP's absence
(9:28:20 AM) fray: please..
(9:29:07 AM) bluelightning: we're entering a stabilisation period for 1.5 M1 now
(9:29:40 AM) bluelightning: coming towards the end of 1.4.1 although I
think I will be pulling in a few more patches
(9:29:59 AM) fray: I know we've had some teething issues w/ gcc 4.8.
ARM machines are not booting, and PPC e500(v2) are generating an ICE..
 both of which I believe are being worked on...
(9:30:06 AM) bluelightning: right
(9:30:36 AM) koen: 4.8.1 is out
(9:30:42 AM) bluelightning: indeed
(9:30:46 AM) RP: back now, reading log
(9:30:49 AM) fray: :)  I know, we need to uprev, but I've been waiting
for Khem to comment..
(9:31:06 AM) koen: Khem is on vacation
(9:31:18 AM) fray: ahh..  didn't realize that
(9:32:19 AM) RP: Yes, teething troubles with gcc 4.8 are a
frustration, we'd hoped to do the toolchain migration early
(9:32:41 AM) RP: patches are getting merged and things are moving forward
(9:33:09 AM) RP: the bigger question is whether I'm ok to take a lower
profile at the end of the month for a few weeks
(9:33:38 AM) RP: I think we're trending ok
(9:33:49 AM) fray: That's my gut feeling as well
(9:33:51 AM) RP: I'm continuing to work on the core bitbake changes
we'd like to see in 1.5 too
(9:34:16 AM) RP: the cooker configuration split seems to be stable and
working well in my new code, there are other pieces working much less
well
(9:34:39 AM) RP: memory resident bitbake is now a lot closer too, we
have standalone server mode
(9:35:45 AM) fray: ok.. 4c -- meta-oe appends/overlayed recipes RFC..
(9:36:15 AM) fray: I'm trying to remember which one this is, the PRINC
discussion?
(9:36:33 AM) RP: well, there are two parts
(9:36:55 AM) RP: I think many overlayed recipes have no been cleaned
up, not least thanks to bluelightning
(9:37:02 AM) RP: (or ones with appends)
(9:37:13 AM) RP: The PRINC discussion never really took off
(9:37:27 AM) bluelightning: we're still at the same point as we have
been now for weeks as regards appends and overlayed recipes in meta-oe
(9:37:29 AM) RP: the making it a warning does have some issues
(9:38:09 AM) fray: I just saw concern (PRINC) about the need for revs
to not go backwards, and that huge numbers of warnings/errors are
burdensome.. (I don't disagree with either BTW)..
(9:38:13 AM) fray: just not sure what to d about it
(9:39:33 AM) Jefro: I believe the plan was long-term advertisement
that warnings would turn into errors, but then to reevaluate at the
next release cycle whether to actually make that happen
(9:39:39 AM) RP: fray: I do worry that the timing with the warning for
a PR removal needs to be rather exact
(9:40:07 AM) fray: yes
(9:40:41 AM) RP: if we go the error route that is less of an issue
(9:40:47 AM) fray: The only other thing I can think of is to put in
the warning code (RFC) and have a disable flag on it..
(9:40:51 AM) RP: well, a non-issue
(9:41:17 AM) RP: How about error and a disable flag?
(9:41:58 AM) fray: I'm ok with that..
(9:42:04 AM) fray: give me the action to revise the RFC patch with that
(9:42:13 AM) RP: fray: sounds like a good plan
(9:42:14 AM) ***Jefro noted
(9:42:19 AM) RP: fray: thanks
(9:42:30 AM) fray: ok.. net
(9:42:32 AM) fray: next
(9:42:39 AM) fray: 1.5 planning..
(9:42:43 AM) fray: anything to add here?
(9:43:11 AM) bluelightning: don't think so, we're well out of planning now
(9:43:24 AM) RP: agreed, drop that from the agenda
(9:43:44 AM) ***Jefro noted
(9:43:44 AM) fray: ok..  so lets drop 4d (planning 1.5)
(9:43:45 AM) fray: 4e, python 3 -- anything new?
(9:43:45 AM) RP: and for python 3 I've no update, not had a chance to
do much with it
(9:43:52 AM) fray: np..
(9:44:04 AM) fray: 4f - release status notification ..
(9:44:10 AM) fray: did we already mention this?
(9:44:36 AM) bluelightning: yes
(9:44:47 AM) fray: ok.. 5a -- YP mailing list migration..
(9:44:54 AM) fray: AFAIK, that is now complete and working.. any concerns?
(9:45:13 AM) fray: :(
(9:45:20 AM) fray: oops wrong channel
(9:45:39 AM) Jefro: 5a is oe.org flooded, no?
(9:45:42 AM) bluelightning: I don't know of any... I believe Michael
was addressing some last cleanup issues a week ago but I should
imagine that's squared away by now
(9:46:00 AM) RP: I have noticed an increase in spam to bitbake-devel
(9:46:05 AM) fray: (I'm looking at http://pastebin.com/mjdhsaGT)
(9:46:17 AM) RP: I should mention to michael
(9:46:28 AM) RP: Its not making it to the list, only to the moderator
(9:46:34 AM) fray: I havn't noticed any more spam -- but I'm not the
moderator.. :)
(9:47:00 AM) fray: anything else we need to track ont he mailing list
migration, or should we drop it fromt he future
(9:47:16 AM) bluelightning: I saw "Tom" sent some spam yesterday... I
guess it got through because it was from a subscriber
(9:47:18 AM) fray: 5b -- oe.org flooded.. anything new to report?
(9:47:28 AM) RP: bluelightning: right
(9:47:28 AM) fray: Ohh I forgot about that..
(9:47:49 AM) Jefro: that's a watch for now, I should put it under deferred
(9:47:51 AM) RP: fray: nothing from me on 5b
(9:47:57 AM) fray: yup.. works for me..
(9:47:59 AM) Jefro: I think the spam was a Tom thing (ie I think he was hacked)
(9:48:07 AM) bluelightning: Jefro: mismatch between the top part and detail on 5
(9:48:15 AM) bluelightning: Jefro: ah, ok... doh
(9:48:16 AM) fray: we'll keep monitoring oe.org flooding.. hopefully
it isn't still continuing..
(9:48:32 AM) Jefro: bluelightning ah! thanks...
(9:48:46 AM) ***Jefro should do the agenda before 11pm Monday night
(9:48:49 AM) fray: 6 -- any status on the deferred items?
(9:48:50 AM) bluelightning: fray: git traffic was the only other issue
I was aware of there, hopefully that's OK now
(9:49:21 AM) fray: FYI, I'm still on the hook for the janitor and NTP
non-commercial.. I'm going to try to get to that before the next
meeting
(9:49:22 AM) RP: not from me
(9:49:32 AM) bluelightning: fray: we're after 1.4, I guess we should
start looking at these (or find someone else to) ?
(9:49:43 AM) Jefro: I have a note omn 6a
(9:49:44 AM) fray: a/c are my issue..
(9:49:45 AM) bluelightning: maybe the TSC role is more important though
(9:49:57 AM) RP: yes, that is the most pressing issue now IMO
(9:49:59 AM) fray: 6b could be anyone with some tech writing/editing ability
(9:50:13 AM) Jefro: I'm revising parts of the YP website and plan to
show the Janitors bugzilla section more prominently
(9:50:18 AM) fray: ya.. TSC roll is the big one
(9:50:31 AM) fray: Jefro, once you do let me know and I'll send the RFC..
(9:50:35 AM) bluelightning: we didn't mention my AR for 4c, FYI I sent
out the RFC and had a few responses but not many
(9:50:38 AM) Jefro: fray ok
(9:50:55 AM) bluelightning: (RFC on libav/ffmpeg that is)
(9:51:19 AM) fray: bluelightning sorry missed that.. as for the libav,
I'm not sure if anyone cares as long as it works..  I know I don't
have a strong opinion either way
(9:52:06 AM) fray: Do we have anyone (member/community contributor)
that really would care a lot and has an opinion?
(9:52:20 AM) bluelightning: fray: ok, I'll reply with my proposed
course of action (move to libav and have it in core)
(9:52:32 AM) fray: seems like a reasonable next step to me..
(9:52:46 AM) fray: ok, anythinge else for today.. we've got 8 minutes left
(9:52:58 AM) bluelightning: wow, efficient today, good job fray :)
(9:53:05 AM) fray: ;)
(9:53:27 AM) RP: nothing from me, thanks fray!
(9:53:36 AM) Jefro: +1
(9:53:38 AM) fray: Thanks all.. meeting over
(9:53:44 AM) bluelightning: cheers!
(9:54:03 AM) Jefro: minutes faster this time
(9:54:04 AM) koen left the room.
(11:24:18 AM) bluelightning left the room (quit: Quit: Konversation
terminated!!!111).

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

