Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id B50B860655;
	Tue, 21 May 2013 19:36:54 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id v10so1221233lbd.6
	for <multiple recipients>; Tue, 21 May 2013 12:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=pTQ8RUs/ReSKqQyTvieszpd7b2MY697Fr0+dIGDn8H8=;
	b=khoUzFmDzikc11LtdO3h2SpjzzfpiPP5O07sCBcVXmhnkBEn2T8vBqLqqLCyvKVqSx
	SDIoFIORQAszjzqaPWqmAfTa2K1GEI2vy6HSzrpf1PwGWBqkTmSWCt1Ljf6ZoUU+IEwr
	NHD4f/Gb9+SA6rPOAhswQ5SpTDhnQv3crzjJqfIxVIQv/cERrD50a0845o+E/ANtETsZ
	OE+CcSrsqndW6OT5nprUXO+EfNXY0n4gEZdjWb4V2zsemZB4j8W4NW4/zc5OGDF8Lahm
	4XWbHBoNuW6/wbNf63PVCji//hcnkSkZUe0ZeEoIX30e3hXdCpCRtnrqBfRY+5p3bzGG
	EpWg==
MIME-Version: 1.0
X-Received: by 10.152.5.37 with SMTP id p5mr2216542lap.13.1369165014589; Tue,
	21 May 2013 12:36:54 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.112.180.164 with HTTP; Tue, 21 May 2013 12:36:54 -0700 (PDT)
Date: Tue, 21 May 2013 12:36:54 -0700
X-Google-Sender-Auth: PKKsRWK7bRxYKaKJ2sb9HQnziec
Message-ID: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Tue, 21 May 2013 19:36:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
7 May 2013

Attendees:
  Koen (koen)
  Khem (khem)
  Fray (fray)
  Paul (bluelightning)
  Richard (RP)
Apologies:

Notes: Jefro

Agenda at a glance:

1. pick a chair
2. new issues
3. lingering issues
a. systemd merge unhappiness
4. projects in progress - status
a. oe-classic recipe migration status
b. oe-core release
c. systemd into master
d. meta-oe appends/overlayed recipes RFC
e. 1.5 planning
5. infrastructure
a. mailing list moving to YP server, in progress
b. oe.org flooded
6. projects deferred
a. raise awareness of "janitor" list, QA "bugs"
b. document whitespace changes to the shell
c. raise ntp with the Yocto Project [RP]

________________________________________________________________
Agenda & Results

1. pick a chair
koen
___________________________________
2. new issues

a. phil's questions about the role of the TSC
(http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/038756.html)
original charter is to look at issues, and attempt to resolve them
the pull model removed a lot of the reason the TSC was created
two functions of the TSC: working group/task force type activities and
actual decision making
 also administrative functions
TSC could chair it but make it a public IRC thing
-> proposal: monthly IRC meeting to replace one of the bi-weekly TSC
meetings, open to all
 timezone will be an issue
=> think about for next meeting

___________________________________
3. lingering issues

a. systemd merge unhappiness ~> release status notification
=> maintain a wiki page to summarize release goals (jefro)
=> status emails (RP) - ongoing

___________________________________
4. projects in progress - status

a. oe-classic recipe migration status
some recipes migrated but then kept in own layers
also cherry picking parts of layers like meta-oe
need some documentation on right way to synchronize

b. oe-core release
1.4.1 is being worked on along with 1.3.2

c. dropped

d. meta-oe appends/overlayed recipes RFC
no avr32 support in public layers
paul has patches to remove bbappends, pending discussion on ml
everything uncontested has been sent for review
qt4/qt tools stuff troublesome
-> still remaining: busybox and gst-ffmpeg bbappends, xserver-nodm-init
=> RFC switching wholeheartedly to libav (bluelightning)

e. 1.5 planning
RP on sabbatical

f. python 3
hard to support both py2 and 3
two issues: python3 on target, using p3 for bitbake
don't think we can reasonably support both
make the switch in the 1.5 timeframe?
need to start informing people of it -now-..
___________________________________
5. infrastructure

a. mailing list moving to YP server
in progress

b. oe.org flooded
    refs to oe.org git should point to github
=> fix the oe wiki and reminder to ml (khem) <= remove
=> investigate YP hosting, kernel.org mirror (jefro)

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

(8:59:19 AM) Jefro: good heavens, everyone is here
(8:59:29 AM) koen: yes
(8:59:33 AM) koen: 17:55 < koen> this must be a record, every tsc
member present 5 minutes early :)
(8:59:47 AM) ***RP is here :)
(9:00:22 AM) Jefro: there isn't some disaster I haven't heard of yet, is there?
(9:01:05 AM) Jefro: I even have an agenda: http://pastebin.com/0nSZm90B
(9:01:48 AM) koen: shall I chair?
(9:02:15 AM) RP: koen: fine with me
(9:02:24 AM) RP: Are fray, khem, bluelightning alive?
(9:02:35 AM) bluelightning: hi all, yes I'm here
(9:02:58 AM) RP: I'd like to add python3 to the agenda somewhere
(9:03:11 AM) koen: 4f ?
(9:03:55 AM) koen: no objections, so 4f  python3
(9:04:03 AM) Jefro: (added to my copy)
(9:04:10 AM) koen: let's wait a bit for khem and fray to wake up
(9:04:38 AM) fray: sorry.. I'm here
(9:05:46 AM) ***fray is busy playing with the new office build server.. :)
(9:05:48 AM) fray: was distracted
(9:06:22 AM) koen: looks like we have quorum, let's hope khem shows up soon
(9:06:45 AM) koen: 1 - pick a chair <- done
(9:06:47 AM) fray: sounds good
(9:06:48 AM) koen: 2 - New issues
(9:07:09 AM) ***RP isn't aware of any
(9:07:17 AM) koen: me neither
(9:07:22 AM) bluelightning: nor me
(9:07:26 AM) RP: Actually, I guess there is Phil's email
(9:07:37 AM) koen: which one specifically?
(9:07:38 AM) RP: His questions about the role of the TSC
(9:07:40 AM) bluelightning: oh good point
(9:07:44 AM) koen: ah that one
(9:08:03 AM) fray: Wow, I missed that one which list?
(9:08:14 AM) RP: I want to be clear for the record that this is
something that ultimately the members need to decide on
(9:08:19 AM) ***Jefro doesn't see that on the mailing list
(9:08:26 AM) koen: the mail: http://pastebin.com/wK9eNccG
(9:08:31 AM) RP: however I believe the TSC can offer an opinion
(9:08:47 AM) koen: crap, that stripped the quote levels
(9:08:48 AM) bluelightning: RP: sounds reasonable
(9:09:14 AM) koen:
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/038756.html
(9:10:33 AM) fray: I wish I had seen that earlier.. must have slipped by..
(9:10:39 AM) bluelightning: as far as being superfluous to
requirements I guess we could only point to the issues the TSC has
resolved (both with the code and infrastructure) in the recent past
(9:11:09 AM) RP: bluelightning: As I said in my reply, the TSC has
been behaving more as a task force though :/
(9:11:29 AM) RP: the trouble is we have no power to ask anyone other
than ourselves to do anything :/
(9:11:33 AM) fray: Briefly, IMHO the TSC role is to look at issues,
and attempt to resolve them..  If members bring up technical issues..
to issue guidance... but we can't 'force' anyone to do anything
specific IMHO
(9:12:01 AM) koen: what about this hypothetical:
(9:12:14 AM) koen: Yocto Project wants to do $foo for 1.6
(9:12:19 AM) koen: TSC is against $foo
(9:12:41 AM) fray: then the TSC needs to work it out......
(9:13:17 AM) fray: If it causes a rift, then that is what happens..
but the TSC should idenfity the issue.. bring it up to our YP board
member and have it brough through that way..  Worst case, the YP does
their own thing..
(9:13:28 AM) Jefro: I would guess you could also s/Yocto Project/OE
community/ there
(9:13:36 AM) khem: hi guys
(9:13:54 AM) koen: hey khem
(9:13:57 AM) fray: I really do thing of the TSC as a community
advocate.. but we don't get a lot of community input, other then the
mailing list..
(9:14:06 AM) bluelightning: that was the original goal, to resolve
technical disputes
(9:14:11 AM) fray: (and when we do, I see us bringing it up)
(9:15:00 AM) RP: koen: There is an implied understanding that the
OE-Core maintainership respects the TSC, even if other layers don't
(9:15:05 AM) fray: bluelightning ya.. and there haven't been a lot of those..
(9:15:15 AM) fray: (which IMHO is a good sign)
(9:15:32 AM) khem: well, tsc IMO can also help with some interaction
with other projects
(9:15:46 AM) koen: RP: you imply that "OE-Core maintainership" is a YP
thing, not an OE or OE/TSC thing
(9:16:02 AM) fray: RP, ya.. it's really up to the maintainers to
decide on governance flows..  but any 'official' OE layer that doesn't
follow TSC guidance seems like a problem to me.. either
misunderstanding or worse..
(9:16:22 AM) RP: koen: I don't imply either case actually
(9:16:29 AM) ***koen rereads
(9:16:33 AM) fray: the community working on the layer is the one that
sets the maintainer role.. if the community doesn't like the
direction, at least for oe layers, the TSC should be able to work with
the maintainer or worse case replace them..
(9:16:43 AM) koen: RP: you're right, sorry about that
(9:16:46 AM) fray: (and I do mean worse case.. I really never want to
push out someone willing to provide their time as maintainers0
(9:17:36 AM) RP: OE-Core was established by the TSC (as was meta-oe
and other layers as part of the restructuring OE underwent)
(9:18:20 AM) koen: so the TSC still serves a purpose
(9:18:38 AM) fray: frankly if everything ran smoothly all the time and
there was never a question, concern, etc for the TSC.. then dissolving
the TSC would be reasonable... but so far we've had agenda items that
IMHO are more then just talking points..
(9:18:44 AM) koen: but the pull model makes issues less frequent
(9:18:48 AM) RP: I put a lot of my thoughts into my reply to that email
(9:18:48 AM) fray: koen, yes I do think it does..
(9:19:00 AM) RP: but yes, the pull model removed a lot of the reason
the TSC was created
(9:19:26 AM) bluelightning: koen: the more clear delineation of distro
policy helps as well
(9:20:06 AM) RP: I do wonder if we should split out the functions the
TSC now fulfils explicitly
(9:20:22 AM) RP: As I see it there are two - the working group/task
force type activities and actual decision making
(9:20:43 AM) RP: I'd like to see the former perhaps opened up to more people
(9:20:53 AM) Jefro: I would suggest that the TSC also now serves an
administrative function. It monitors infrastructure issues, finds
resources for documentation issues, tracks major changes, and also
provides semi-weekly information updates to the mailing lists (when I
remember to send minutes out on time).
(9:21:08 AM) RP: The TSC could chair it but make it a public IRC thing
(9:21:22 AM) fray: I wouldn't object to that
(9:21:28 AM) Jefro: RP: that's a really good idea
(9:21:46 AM) bluelightning: sounds like a good idea, might help avoid
these tasks always falling on our heads :)
(9:22:26 AM) RP: I am just thinking out loud here but I think the idea
that the TSC adapt to the changes in the overall OE ecosystem is a
good one
(9:22:47 AM) RP: and I think there are some adoptions that can take place
(9:23:18 AM) Jefro: how about a monthly IRC-based open forum,
replacing one of these bi-weekly TSC meetings? time of day will be an
issue - OE is a worldwide community
(9:23:18 AM) RP: but the idea would be for more involvement of other people
(9:23:49 AM) RP: Jefro: That is roughly my thinking. We'd just have to
pick a time that works for the TSC members. If there is demand we can
consider expanding it to other timezones
(9:23:52 AM) khem: yeah IRC meeting is fine
(9:24:02 AM) khem: I think most folks are in US and EU
(9:24:09 AM) khem: so something around this time may work
(9:24:24 AM) khem: may be use the same time slot
(9:24:33 AM) koen: nearly half past, still on 2) new issues
(9:24:35 AM) khem: since we all have this time slot available
(9:24:38 AM) fray: ya.. this seems to be the best time for a lot fo stuff..
(9:25:03 AM) RP: So how about we go away and think about this. Also
see what feedback there is from members about this?
(9:25:19 AM) bluelightning: yep soliciting feedback from members would be good
(9:25:25 AM) RP: We should try and have some kind of proposal for the
next meeting? It would be best discussed on the members list though?
(9:25:29 AM) khem: yeah I think notifying ahead of time will be good
(9:25:37 AM) khem: so members can plan to attend it
(9:26:03 AM) RP: We're not agreeing to do this yet, just discuss it more widely
(9:26:30 AM) fray: ya.. this is a place to definitely ask the e.V. members
(9:26:54 AM) koen: yes, e.V. members list would be a good place
(9:26:55 AM) RP: The TSC would remain an elected decision making body
but wouldn't have scheduled meetings like we have now (instead maybe
once a quarter or something) unless a decision was needed
(9:28:01 AM) koen: not so sure about that, it's harder to see if
people are still involved or AWOL with bi-weekly meetings
(9:28:28 AM) RP: koen: we'd have the replacement irc working group meetings
(9:28:31 AM) fray: koen with-out-?
(9:28:40 AM) RP: koen: so attendance would be pretty clear still
(9:28:42 AM) koen: yes, without
(9:29:20 AM) koen:  The TSC would remain an elected decision making
body but wouldn't have scheduled meetings like we have now (instead
maybe once a quarter or something) unless a decision was needed, but
irc working group meetings will be frequent
(9:29:25 AM) koen: something like that?
(9:29:27 AM) fray: that all seems reasonable to me.. doesn't really
change what we've been doing...  just makes it clearer to the
community
(9:29:38 AM) RP: koen: yes
(9:29:49 AM) RP: irc working group meetings would replace the current
scheduled TSC meetings
(9:30:11 AM) khem: seems good
(9:30:20 AM) RP: It separates the decision making role of the TSC from
other work
(9:31:13 AM) fray: ok.. so what about the comment of an 'oe'
maintainer ignoring the TSC?
(9:31:18 AM) koen: do we need more discussion or can we move down the agenda?
(9:31:27 AM) fray: koen, I'm happy to move it down
(9:31:29 AM) RP: I'd move on with the agenda
(9:31:57 AM) koen: 3. lingering issues
(9:32:03 AM) koen: a. systemd merge unhappiness
(9:32:11 AM) RP: For 3a, I'd agreed to provide status updates. I've
now provided two of these
(9:32:24 AM) Jefro: wiki page is not yet done
(9:32:27 AM) RP: I'm trying to turn it into a habit
(9:32:50 AM) RP: Did people like/dislike them?
(9:32:52 AM) koen: and there's a discussion going on on how to do
libexec properly, which was one of the items
(9:33:13 AM) ***fray reads them and likes them..
(9:33:21 AM) RP: Right, libexec is a hard problem but the right
discussion is happening
(9:33:22 AM) fray: I've even forwarded some of the info on into my
organization..
(9:33:34 AM) RP: I need to reply to that email (was away for a few days)
(9:33:40 AM) khem: yes update email is very nice
(9:33:48 AM) bluelightning: I'm still unclear on how people using
meta-systemd view the current oe-core systemd situation - have we
resolved all issues or are there still things that need looking into?
(9:34:12 AM) bluelightning: I guess that's a question for the ml
(9:34:17 AM) koen: right
(9:34:23 AM) RP: bluelightning: yes
(9:34:36 AM) koen: so
(9:34:46 AM) koen: onto 4 then
(9:34:54 AM) koen: 4 a. oe-classic recipe migration status
(9:35:23 AM) koen: there was a discussion on keeping .incs or not, not
much else afaics
(9:35:31 AM) koen: (correct me if I missed something)
(9:35:32 AM) bluelightning: yeah, ongoing... not a huge amount of
migrations since last meeting
(9:36:03 AM) bluelightning: it's worth noting I'm aware that some
people have migrated recipes and then kept them in their own layers
(9:36:35 AM) bluelightning: which is not hugely bad but it would be
nice if they could send them somewhere more appropriate
(9:36:59 AM) RP: bluelightning: any idea why they're doing that?
Simply don't know any different?
(9:37:10 AM) koen: I bet it's easier
(9:37:15 AM) koen: no hassle with "upstreaming"
(9:37:24 AM) fray: one thing that has hit me lately (related) is when
a recipe needs something in meta-oe.. but I don't want meta-oe.. so
now I have a potential conflict..  that might be something we have to
address in the future..
(9:37:30 AM) bluelightning: RP: not sure, possibly they solved their
own issue and hadn't got around to submitting
(9:37:56 AM) RP: fray: This is something we designed combo-layer to be
able to handle - pulling out specific parts of a layer with history
(9:38:00 AM) fray: (i.e. meta-selinux provides swig.. meta-selinux is
designed to run w/ just oe-core...)  now I want to add meta-networking
components.. which require other meta-oe components (incuding swig)..
(9:38:01 AM) bluelightning: fray: but why don't you want meta-oe?
(9:38:06 AM) khem: fray: I dont want meta-oe but I need one recipe
from it approach has to change - we need to make meta-oe better
(9:38:07 AM) RP: fray: I do this locally...
(9:38:08 AM) fray: oo big
(9:38:09 AM) fray: too big
(9:38:11 AM) khem: so people can use it
(9:38:23 AM) khem: may be YP compatible one day
(9:38:28 AM) fray: RP, exactly.. I'm doing it locally.. but I havn't
seen much documentation around the 'right' way to syncronize this
stuff.. that's all
(9:38:59 AM) RP: fray: I did want to document both combo-layer and my
workflow for 1.4 but ran out of time :(
(9:39:02 AM) ***fray didn't intend to start a topic here.. just good
for thought moving forward...)  it's a real problem we need to figure
out
(9:39:04 AM) koen: so before going on a tangent
(9:39:06 AM) fray: RP, no worries..
(9:39:12 AM) koen: any other OE classic issues?
(9:39:25 AM) bluelightning: koen: no I think we're done on that specific issue
(9:39:25 AM) khem: I see more drastic changes in BSP layers e.g. to
some recipes like udev rules
(9:39:50 AM) khem: meta-oe is way more pleasant
(9:40:10 AM) RP: For 4b, I don't have much to say. 1.4.1 is being
worked on along with 1.3.2
(9:40:27 AM) bluelightning: right
(9:40:34 AM) RP: I think 4c can be dropped
(9:40:38 AM) fray: yup
(9:40:54 AM) koen: d. meta-oe appends/overlayed recipes RFC
(9:41:12 AM) bluelightning: so we're almost there on 4d
(9:42:03 AM) koen: Ross has been shuffling around the gnome stuff
(9:42:29 AM) bluelightning: still remaining: busybox and gst-ffmpeg
bbappends, and the xserver-nodm-init situation
(9:42:57 AM) bluelightning: I have failed to get anyone interested in
the busybox bbappend
(9:43:31 AM) koen: the gst-ffmpeg one is tricky
(9:43:42 AM) bluelightning: indeed
(9:43:42 AM) khem: bluelightning, I will try to get busybox issue fixed
(9:44:11 AM) koen: we'd need to ask martin about the xserver-nodm-init thing
(9:44:21 AM) bluelightning: koen: what concerns me is both ffmpeg and
libav seem to be proceeding independently
(9:44:34 AM) koen: ffmpeg shouldn't be used anymore
(9:44:58 AM) koen: libav is much more open to being used as a shared lib
(9:45:29 AM) bluelightning: perhaps we should just RFC switching
wholeheartedly to libav and see if anyone objects
(9:45:36 AM) koen: sounds good
(9:45:52 AM) bluelightning: ok I'll take that AR then
(9:46:04 AM) koen: thanks
(9:46:13 AM) koen: let's move to 4e. 1.5 planning
(9:46:16 AM) bluelightning: khem: thanks
(9:46:39 AM) fray: FYI https://wiki.yoctoproject.org/wiki/Planning
(9:46:41 AM) koen: most important point for 1.5: RP will go on sabbatical
(9:46:46 AM) fray: YP planning information has now been posted..
(9:47:00 AM) fray: this should start to give people an idea of what
work the YP is planning on
(9:47:06 AM) bluelightning: can someone expand on "RP supports
PACKAGECONFIG proposal" ?
(9:47:21 AM) RP: bluelightning: I think this was to PACKAGECONFIG more recipes
(9:47:28 AM) bluelightning: ah ok
(9:47:36 AM) RP: bluelightning: remove the need to bbappend, have
people set mode config options
(9:47:51 AM) bluelightning: and PACKAGECONFIG to enable deps on things
outside OE-Core as well presumably
(9:48:01 AM) bluelightning: (as discussed on the ml a few weeks ago)
(9:48:06 AM) fray: yup
(9:48:08 AM) RP: So yes, I have some extended leave coming up
(9:48:24 AM) RP: I'm planning to make some of the branch merging about
the only "work" thing I do
(9:48:48 AM) RP: bluelightning: that is fine as long as the defaults
reflect that
(9:49:04 AM) bluelightning: RP: right
(9:50:26 AM) RP: questions/concerns about me being away?
(9:50:59 AM) khem: RP have fun :)
(9:51:08 AM) koen: any more on 1.5 planning?
(9:51:30 AM) koen: 4f. python 3
(9:51:50 AM) koen: so I guess this is about bitbake/python3
(9:51:51 AM) khem: I have python3
(9:51:54 AM) RP: I've done some research on this. There are some nasty
changes which make it hard to support both py2 and 3
(9:52:14 AM) koen: I'd like to have a python_3.x.bb as well
(9:52:24 AM) koen: what's the problem with making it py3 only?
(9:52:25 AM) RP: There are two separate issues here
(9:52:26 AM) khem: actually python3 on target is one and then using p3
forr bitbake is another
(9:52:27 AM) koen: RHEL?
(9:52:44 AM) RP: One is the question of bitbake itself, the other is
the question of a recipe
(9:52:48 AM) fray: RHEL/CentOS is a big problem
(9:52:52 AM) RP: I'm ignoring the latter right now
(9:53:02 AM) khem: koen: I do have patches for adding p3 support on target
(9:53:08 AM) RP: The question is should the project take the plunge and go py3
(9:53:12 AM) RP: and if so, which py3 ?
(9:53:14 AM) khem: I plan to post them soon in couple of weeks
(9:53:45 AM) khem: RP: you mean python for bitbake
(9:53:50 AM) RP: We do have our standalone python tarball to support
python 2.x distros
(9:53:51 AM) RP: khem: yes
(9:53:56 AM) fray: I don't have any objection to going to p3 (whatever
version is reasonable) -- if we have a way to supply -- or help
someone get p3 on their host..
(9:54:21 AM) RP: I'm making the assumption we can get py3 recipes and
those would build for nativessdk
(9:54:37 AM) koen: khem says he has started that
(9:54:49 AM) khem: our experiences has been good with python 3.3.x
(9:54:54 AM) RP: Right, to be the harder part is bitbake itself
(9:54:58 AM) RP: s/be/me/
(9:55:15 AM) RP: Would we want to make the switch in the 1.5 timeframe?
(9:55:27 AM) khem: my recipes are for target and mostly and some -native support
(9:55:36 AM) khem: havent tried nativesdk yet
(9:55:40 AM) RP: We're increasingly trying to use modern language
features and finding old 2.x bugs :(
(9:55:46 AM) RP: I suspect Martin is seeing those for example
(9:56:02 AM) fray: I think it's reasonable to mvoe to p3 in the 1.5 time frame..
(9:56:19 AM) fray: but we need to start informing people of it -now-..
(9:56:29 AM) RP: My feeling is that we should seriously consider
updating if we can get all the pieces together
(9:56:31 AM) fray: roughly 6 months is enough time for someone to
seriously object -- or help
(9:56:32 AM) khem: RP: do we want to then not support 2.x for bitbake
or we want to keep it both
(9:56:40 AM) bluelightning: RP: do you have an idea of how much impact
it'll have on the metadata?
(9:56:45 AM) RP: khem: I don't think we can reasonably support both
(9:56:53 AM) fray: my preference is to support both -- but that sounds
unreasonable at this point
(9:56:56 AM) khem: yeah its hard
(9:57:03 AM) RP: bluelightning: there are annoyances and there will be problems
(9:57:11 AM) RP: bluelightning: not massively amounts of them
(9:57:38 AM) khem: as an experiences internal teams tried to support
both for their projects and gave up on p2
(9:58:03 AM) RP: Ok, we're running out of time
(9:58:11 AM) bluelightning: if we have to actually completely switch
to python3 and stop supporting python2-only, I've got to say I'm not
particularly keen on that..
(9:58:19 AM) RP: I'm going to propose we announce an intent to switch in 1.5
(9:58:41 AM) RP: This will only happen if each of the key requisites
comes together
(9:59:01 AM) RP: (builds work, builds aren't any slower, we have a
story for people without py3)
(9:59:24 AM) fray: yup..
(9:59:27 AM) fray: I'm happy with that
(9:59:32 AM) koen: me too
(9:59:50 AM) khem: me too
(10:00:05 AM) bluelightning: right, ok
(10:00:11 AM) RP: so we warn people now, we still need to decide on
exact specifics like which py3 we'll support
(10:00:35 AM) fray: warning should go to both bitbake-devel and all oe lists..
(10:00:41 AM) khem: yes
(10:00:42 AM) koen: I bet it will be like the py2.x version
requirements we had in the past
(10:02:11 AM) koen: anything more on 4f?
(10:02:44 AM) koen: 5a. mailing list moving to YP server, in progress
(10:02:44 AM) khem: nope
(10:03:03 AM) Jefro: 5a is in process, Michael is working with Florian
(10:03:16 AM) khem: archives are created, Michael is waitng on florian
to copy them over to yp server location
(10:03:22 AM) khem: he created for florian
(10:04:37 AM) Jefro: I think folks are drifting to their 10am meetings
(10:04:46 AM) khem: yes heh
(10:04:53 AM) khem: I have at 10:30
(10:05:01 AM) koen: 5b b. oe.org flooded
(10:05:03 AM) Jefro: for 10b I have not yet explored the possibility
of moving oe servers to yp
(10:05:22 AM) Jefro: I have also not seen a lot of complaints on the
list, so perhaps this is a lower priority item
(10:05:35 AM) fray: I think it's something we need to watch and prepare for..
(10:05:43 AM) fray: but I agree, I've seen a significant lack of complaints..
(10:06:13 AM) khem: fix the oe wiki and reminder to ml (khem) can be
removed I guess ?
(10:07:21 AM) RP: I'm afraid I need to go. I'm not sure I have much to
add to the rest of the agenda, will read scroll back later
(10:07:48 AM) Jefro: I think it's done - the rest is deferred items
(10:07:52 AM) koen: right
(10:07:52 AM) fray: np.. we can move to next time..
(10:07:55 AM) fray: thanks!
(10:07:56 AM) koen: I think we can close
(10:08:03 AM) bluelightning: thanks all
(10:08:49 AM) khem: bye

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

