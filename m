Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1UILTQ-0006cM-LX; Wed, 20 Mar 2013 17:02:45 +0100
Received: by mail-la0-f54.google.com with SMTP id gw10so3154199lab.41
	for <multiple recipients>; Wed, 20 Mar 2013 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=RU+8jRGX+PZ0gEWHWhY0USJvatREHDUH81xkWAd5c2c=;
	b=ZeZY5hNLsB27MisHfkFoo01AZVlmEu+JXuZF1ZAvURl9GuYwsXNTUEDyA3Z6YPk3Ef
	JwjSckIjRlkvQlDGZt/LUDNKJsZZ+jKuJuLtYYbPQNL1r4agVAXoYEx2L2gkqvJA+D17
	7ZbuTsYKpb2zekDphxYuPM5aG+Bckj6rYpZRDVtSFdH7de/hMV5VI0m5afAsPvO3IDbf
	zm8jCVgShPxMJIMKFjM0Yk3101LV450zaO/wxP3wYdD5p30UnoSYjvs+sFNg5snhADsB
	v5H4nOY8hPfgzMLW6EoGXYa5rSq45vxhDu20AnR0fAxslQUBuaH+yXOInqFq2QpyG76y
	WlpQ==
MIME-Version: 1.0
X-Received: by 10.112.26.106 with SMTP id k10mr9579087lbg.5.1363794352943;
	Wed, 20 Mar 2013 08:45:52 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.112.46.8 with HTTP; Wed, 20 Mar 2013 08:45:52 -0700 (PDT)
Date: Wed, 20 Mar 2013 08:45:52 -0700
X-Google-Sender-Auth: _uaF81LjmMPoD1z3PQjC8_-ZO7w
Message-ID: <CA+YB3rboKsJJEiDYn_WBR8sJeDN+3XPzz7z_C+6uVMQHi8dUKg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 19 March 2013
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
X-List-Received-Date: Wed, 20 Mar 2013 16:02:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
19 March 2013

Attendees:
  Koen (koen)
  Khem (khem)
  Fray (fray)
  Paul (bluelightning)
  Richard (RP)
Apologies:

Notes: Jefro

________________________________________________________________
Agenda & Results

1. pick a chair
fray
___________________________________
2. new issues

___________________________________
3. lingering issues

a. raise awareness of "janitor" list, QA "bugs"
defer to after 1.4

b. document whitespace changes to the shell
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
http://www.openembedded.org/wiki/Styleguide
https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide
=> still need to de-dup these, need a volunteer
ask for volunteers after 1.4 (jefro)

c. SMART has replaced zypper (was documenting RPM and package feeds)
Paul wrote https://wiki.yoctoproject.org/wiki/Smart_Repository_Setup
=> khem has gotten it to work, will update the docs
=> Paul to talk to scottrif about adding to docs


d. patchwork queue
martin has put his worfklow on the wiki
http://www.openembedded.org/wiki/Patchwork
=> DROP or move to status

e. raise ntp with the Yocto Project [RP]
immediate need addressed, reasonable default needed
use LICENSE_FLAGS - non-commercial
RP raised with YP AB
=> going to mailing lists & someone should write a proposal
fray will send to list after 1.4
no default set after Paul's changes
fray: idea is we already have "commcerial flags"
lets simply define a non-commercial flag..
and then adjust NTP to pay proper attention to either value..
do not need to add the flag unless we set a default server

f. oe-classic recipe migration status
RP played with perl modules, fixed up cpan_build.bbclass
=> still needs to send some patches

g. some items dropped from oe-core but not yet in meta-oe
handled thanks to ross
=> DROP

h. mailing list outage
mailing list moving to OSUOSL or YP
list addresses will not change
discussion in progress
=> MOVE TO STATUS

i. meta-oe appends/overlayed recipes RFC
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043925.html
no avr32 support in public layers
=> paul has patches to remove bbappends, pending discussion on ml
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043964.html
everything uncontested has been sent for review
qt4/qt tools stuff troublesome

j. systemd merge unhappiness
"people feel ignored and then being told they should have spoken up"
some concern about favoritism for patches
-> This was discussed at length & will be continued in the next meeting

k. oe.org flooded
refs to oe.org git should point to github
=> jefro to follow up with scottrif
-> mentioned, need to follow up
=> khem to fix the oe wiki and reminder to ml
possible to move server at some point?
=> jefro to investigate YP hosting, kernel.org mirror
-> not done

___________________________________
4. projects in progress - status

a. oe-core release

b. infrastructure
mailing list issue described above

c. 1.4 planning
systemd into master - still in progress

________________________________________________________________
Raw Transcript

(9:58:14 AM) Jefro: good morning all - any new issues for the agenda?
(9:58:45 AM) khem: is systemd already on it ?
(9:58:54 AM) Jefro: yes, as a lingering issue
(9:59:10 AM) khem: k
(9:59:13 AM) RP_: morning all
(9:59:23 AM) khem: gm RP
(9:59:42 AM) fray: here as well
(9:59:49 AM) fray: not morning in less then a minute
(10:00:14 AM) bluelightning: morning all
(10:00:23 AM) fray: happy noon all.. ;)
(10:01:10 AM) RP_: koen: ping?
(10:02:01 AM) Jefro: koen is a ghost
(10:02:32 AM) Jefro: Here is an initial agenda - lots of lingering
issues, let's remove some today: http://pastebin.com/isxjPyH8
(10:04:26 AM) RP_: 3c, g can be dropped?
(10:04:57 AM) fray: g can.. did the 3c get posted anywhere?  I thought
originally we said we wanted a link or something from either the
mailing list (archives) or the oe wiki
(10:07:25 AM) khem: on 3c) I have got smart to work as well.
(10:07:35 AM) RP_: khem: based on the docs?
(10:07:40 AM) khem: I will put something on blog or somewhere
(10:07:41 AM) khem: yes
(10:07:49 AM) khem: RP_: docs + some more
(10:08:09 AM) RP_: We should probably try and work through some of
these and hope koen turns up for the parts I suspect he wants/needs to
participate in
(10:08:13 AM) khem: its still hard to preconfigure smart in prebuild images
(10:08:37 AM) fray: ok
(10:08:39 AM) RP_: khem: Is there anything you can contribute back to
help with this?
(10:08:47 AM) khem: RP_: I should be
(10:09:06 AM) RP_: khem: sounds good
(10:10:02 AM) Jefro: how about 3a, and who is chair today? (almost
sounds like me)
(10:10:43 AM) fray: I can if need be
(10:10:45 AM) RP_: I'm jetlagged like crazy, ill and being asked 101
different questions over various IM channels but I can do it if nobody
else wants to
(10:11:07 AM) Jefro: RP_ no worries, fray volunteered
(10:11:21 AM) fray: ok then..  2 -- new issues (I think we're past that)
(10:11:32 AM) Jefro: wow, fray is a fast chair
(10:11:55 AM) RP_: fray: no new issues afaik
(10:11:56 AM) fray: ok.. 3a.. nothing has changed that I'm aware of..
but now is likely a 'bad' time for this until 1.4 is out..
(10:12:00 AM) fray: least that's my current opinion
(10:12:06 AM) RP_: agreed
(10:12:18 AM) fray: ok.. 3b.. any process on the de-dup?
(10:12:21 AM) RP_: likewise, 2b is a question of someone finding the
time to do it
(10:12:23 AM) Jefro: defer to after 1.4?
(10:12:27 AM) fray: works for me..
(10:12:34 AM) RP_: The original point of the TSC was not to actually
do these things
(10:12:39 AM) fray: 3c we already talked about.. a bit..
(10:12:42 AM) RP_: It was just to ensure that issues got highighted
(10:12:52 AM) fray: RP_ yup..  3a especially..
(10:12:56 AM) RP_: Its rather sad nobody helps out
(10:13:28 AM) Jefro: docs and wiki pages are particularly hard to find
volunteers for
(10:13:45 AM) fray: well.. a few people have stepped up and helped
with QA style bugs... (i.e. Martin, Otavio)... but it's not
coordinated
(10:13:48 AM) RP_: Jefro: right :(
(10:13:54 AM) fray: yup.. docs are the one major hole..
(10:14:14 AM) fray: lets just note to ask for volunteers after 1.4 (or
for whoever reads the minutes)  :)
(10:14:21 AM) Jefro: ok
(10:14:28 AM) RP_: I know people do read the minutes...
(10:14:30 AM) fray: 3d patchwork..
(10:14:38 AM) bluelightning: er... I think the scottrif comment on 3d
should be for 3c
(10:14:47 AM) bluelightning: I must have missed that in the minutes last week
(10:14:50 AM) fray: yes,, I suspect so
(10:14:56 AM) RP_: bluelightning: I was wondering about context here :)
(10:15:04 AM) bluelightning: in any case I have not talked to Scott
about that yet
(10:15:12 AM) bluelightning: must do this week
(10:15:15 AM) fray: :)
(10:15:43 AM) RP_: For 3e, I did raise this with the AB who suggested
it should go to the mailing lists and someone should write a proposal
(10:15:45 AM) fray: 3d then, what is left to discuss.. I know the
meta-oe (and related) folks are using patchwork from what I've seen on
the list.. is there something we need to facilitate, or are there
still issues (maintenance)?
(10:15:51 AM) Jefro: bluelightning oops - moved
(10:16:07 AM) RP_: I took the action as the AB interface to the
technical side of the project
(10:16:09 AM) fray: 3e, do we want the discussion right now or after 1.4?
(10:16:15 AM) RP_: but if anyone wants to help out...
(10:16:19 AM) bluelightning: fray: Martin seems to be keeping on top
of patchwork, I'm still helping at times
(10:16:35 AM) RP_: fray: I think 3e isn't tied to a release cycle
(10:16:37 AM) bluelightning: I think 3d can probably be dropped
(10:16:41 AM) fray: I'd suggest we move the patchwork to status or gone..
(10:16:42 AM) RP_: bluelightning: yes, doing a good job...
(10:16:50 AM) RP_: sounds good
(10:16:51 AM) fray: just want to make sure it's being kept up with..
(10:16:55 AM) khem: martin has also put up his workflow on oe wiki
(10:16:58 AM) khem: wrt pw
(10:17:02 AM) fray: ohh nice, I didn't see that
(10:17:09 AM) RP_: The trouble is a lot of our current contributors
are maxed out :/
(10:17:13 AM) khem: I pestered him to do that
(10:17:15 AM) fray: yup
(10:17:15 AM) RP_: we need more people getting involved
(10:17:23 AM) khem: so people know about the state of patches
(10:17:58 AM) RP_: (In case my earlier comments are taken out of
context, I do appreciate the work people do on the project, I just
wish some of the low hanging fruit like docs issues sometimes got more
attention)
(10:18:10 AM) fray: RP_ ok.. for 3e, did anyone ever send out the
non-commercial license flag we suggested?  if not put my name by it..
but I likely won't get to it for a couple weeks
(10:18:13 AM) bluelightning: FYI: http://www.openembedded.org/wiki/Patchwork
(10:18:42 AM) RP_: fray: Not that I've seen
(10:18:47 AM) bluelightning: fray: for NTP it's not necessary after my
changes since it does not set a default
(10:19:09 AM) RP_: I should also document my workflow and combo-layer
(10:19:09 AM) fray: ok.. I can do it.. just for the notes here.. the
idea is we already have "commcerial flags", lets simply define a
non-commercial flag.. and then adjust NTP to pay proper attention to
either value..
(10:19:23 AM) RP_: fray: right
(10:19:36 AM) fray: (other things of course can do the same as necessary)..
(10:19:40 AM) RP_: fray: other question is whether we should develop
any registration with the ntp people
(10:19:59 AM) fray: ya.. that one I don't have an answer for.. but I
will bring it up as well
(10:20:24 AM) bluelightning: we do not need to add the flag unless we
set a default server
(10:20:33 AM) fray: yup
(10:20:44 AM) fray: I would like the default to work for non-commercial folks..
(10:20:48 AM) bluelightning: and I suspect we can't set a default
server unless we register one
(10:21:04 AM) RP_: We need to propose the different options and
explain the implications
(10:21:06 AM) bluelightning: too easy to abuse otherwise
(10:21:08 AM) fray: but you have to explicitly say I'm non-commercial
(10:21:16 AM) fray: yup
(10:22:33 AM) fray: ok.. 3f then?
(10:22:47 AM) ***RP_ still needs to send some patches
(10:23:09 AM) fray: ok.. so leave it for now..
(10:23:21 AM) fray: 3g..  oe-core to meta-oe.. is anything left, if
so.. does anyone care about the items
(10:23:24 AM) bluelightning: 3g is now handled thanks to Ross
(10:23:31 AM) RP_: right, that got done
(10:23:38 AM) fray: excellent..
(10:23:42 AM) fray: 3h.. any mailing list stuff?
(10:23:54 AM) Jefro: I have not heard an update on actually moving the lists
(10:24:11 AM) Jefro: will try to get one for next meeting
(10:24:14 AM) fray: this still an issue or should it move to status or?
(10:24:26 AM) Jefro: it is now a project in progress and should move to status
(10:24:33 AM) fray: if it's being discussed at YP/OE.. I'm happy our
part is resolved
(10:24:38 AM) RP_: I think we should move them as problems will crop
up again in the future I suspect
(10:25:00 AM) RP_: but yes, probably a status thing now
(10:25:03 AM) fray: RP_ no objection from me.. ;)
(10:25:09 AM) fray: ok  3e..
(10:25:13 AM) fray: 'er.. 3i
(10:25:28 AM) RP_: fray: I wondered if we were stuck in a loop :)
(10:25:34 AM) fray: almost..
(10:25:37 AM) RP_: bluelightning: ?
(10:25:41 AM) bluelightning: I'm concerned that removal of the
bbappends will be blocked...
(10:25:51 AM) RP_: bluelightning: blocked on what?
(10:25:53 AM) bluelightning: I have patches to do so but have not sent
them out yet
(10:26:06 AM) bluelightning: see the mailing list discussion
(10:26:27 AM) fray: tslib is the one I remember.. was there anything else?
(10:27:16 AM) fray: bluelightning is everything uncontested sent for
review?  at least we can start there, I hope
(10:27:20 AM) bluelightning:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043964.html
(10:27:36 AM) khem: w.r.t 3i some stuff should be better now that
polkit is moving out of OE-COre
(10:27:36 AM) bluelightning: fray: for tslib I have sent a mail to
chris today to ask about a new release
(10:27:52 AM) bluelightning: the ones that bother me are the qt4 and
qt tools packagegroup bbappends
(10:28:20 AM) RP_: bluelightning: We should at least get the
uncontroversial ones dealt with
(10:28:32 AM) fray: this is a place I really want to get volunteers..
the more people work with the qt4/qt tools stuff the more I'm hearing
about problems with it..
(10:28:40 AM) fray: problems being, it doesn't work the way they want
or whatever..
(10:28:42 AM) RP_: bluelightning: if the remaining ones are
problematic, the TSC could consider specific actions to break deadlock
(10:28:42 AM) khem: busybox one needs to travel into OE-COre I think
that should be ok
(10:28:52 AM) bluelightning: fray: that sounds like separate issue(s)...
(10:29:11 AM) bluelightning: RP_: I'm inclined to just post all the
patches and then we can go from there
(10:29:13 AM) fray: I think it's related to the issue in that email..
tri-state switches, the way things are controleld, etc..
(10:29:22 AM) RP_: bluelightning: agreed
(10:29:36 AM) fray: but ya, I'd say post them.. and then we deal with
issues.. I'm not expecting 100% removal of the bbappends.. but if we
can do all but a couple.. it'll be better
(10:30:04 AM) bluelightning: I really want to push for them all to be
removed, I think that's important
(10:30:14 AM) RP_: bluelightning: even pushing the switches for qt
without using PACKAGECONFIG, that should be an improvement
(10:30:45 AM) fray: ok back to agenda.. 3j?  did you (RP) get a change
to talk to jefro?
(10:30:55 AM) fray: (and I agree.. any way to add switches for
something like QT will help)
(10:31:02 AM) RP_: fray: I did read the minutes and I did talk to him a little
(10:31:27 AM) fray: I don't know what the next step is on 3j..
(10:31:54 AM) RP_: I'm a little frustrated as I did talk to people at
ELC and I was told there were a few pains, we'd work through them
(10:32:16 AM) RP_: I don't think we will reach a position on systemd
that everyone will be 100% happy with
(10:32:17 AM) fray: I think that was from before ELC.. so that might
be part of it?
(10:32:28 AM) RP_: fray: this came out afterwards
(10:32:35 AM) fray: ahh ok..
(10:33:04 AM) RP_: I am trying a bit of an experiment with systemd and
not trying to get too involved, letting others discuss and try and
resolve things
(10:33:28 AM) Jefro: I propose discussing j at the next meeting
(10:33:29 AM) RP_: We do need more people to take on more
maintainership roles within the project
(10:33:34 AM) fray: so do we keep 3j on the agenda, move to status, or
take it off and bring it back (or something similar) if need-be?
(10:33:40 AM) RP_: Jefro: why not now?
(10:33:48 AM) Jefro: we are missing the person who brought it up
(10:34:03 AM) fray: RP_, there are certain places, qt, systemd, X11..
they need domain owners....
(10:34:07 AM) RP_: Jefro: I kind of got the impression this extra
meeting was called to discuss this since it was urgent
(10:34:30 AM) RP_: fray: yes, we do well in some areas, there are big
holes however
(10:34:35 AM) Jefro: I thought so as well.  In any case, I can make
sure he gets the minutes.
(10:34:36 AM) RP_: We have a lot of diverse software
(10:34:42 AM) fray: I think the right answer is to try to find such a
domain owner, and track where we have holes.. (as best we can)
(10:34:58 AM) RP_: fray: The challenge is we can't impose
maintainership on anyone
(10:35:13 AM) RP_: and a lot of our people are overworked anyway :/
(10:35:14 AM) ***koen wanders late
(10:35:40 AM) fray: I understand that.  But if we can list where we
need maintainership help.. that might get across that we need help in
specifiic areas
(10:36:07 AM) Jefro: Hi koen - we are discussing 3j on the agenda:
http://pastebin.com/isxjPyH8
(10:37:19 AM) RP_: So there is systemd and then there is the general problem
(10:37:32 AM) fray: yup
(10:37:36 AM) RP_: I think we are making progress on the general
problem, its just slower than we need it
(10:38:03 AM) fray: ya, systemd is the immediate "new subsystem" that
needs to work well... the others we can continue to make slow-ish
progress on..
(10:38:35 AM) RP_: For systemd specifically Ross has sent out a series
proposing a way forward. Other than repeating the same arguments about
whether -systemd packages should be separate or not, there doesn't
seem to be much else being said
(10:39:23 AM) RP_: I think for the core we leave them combined for now
and if someone wants to split them out, they can. I think the combined
solution does have more technical merit than split out at this point
(10:39:58 AM) RP_: It will either be possible to use split out, or
include migration dependencies
(10:41:09 AM) RP_: There were also some comments made about Intel/WR
patches being favoured. I think this is a perception issue, partly as
there are a lot more of them. I actually feel I'm harder on those guys
(and that I can actually be harder on them)
(10:41:31 AM) khem: I think merging is better since I ma seeing more
and more packages are now including unit files in their sources
(10:42:07 AM) RP_: Its also about how much recourse I have to fix
bugs. If Intel/WR introduce bugs, I can make them fix them. I have no
such control over some other contributions :/
(10:42:28 AM) RP_: So its all a really hard balancing act but I don't
see favouritism going on...
(10:43:59 AM) RP_: Any comments from anyone?
(10:44:10 AM) fray: If anything what I see is "known contributor"
favortism.. (which IMHO is desired in OSS projects).  If you
contribute a lot, have high quality results, I expect to grant some
leeway on an issue or two..
(10:44:26 AM) koen: it's a perception issue IMO
(10:44:26 AM) Jefro: that's meritocracy
(10:44:31 AM) fray: yes
(10:44:35 AM) Jefro: it's a feature, not a bug
(10:44:45 AM) koen: but I was offended by the tone of the reactions
when I raised the issue
(10:45:06 AM) RP_: It is true that if any contributor is for example
thought of as owning a particular area, I'll act as such with patches
(10:45:19 AM) RP_: on the understanding that if things break, they
will be expected to help fix them
(10:45:20 AM) bluelightning: koen: it's a pretty serious accusation...
(10:46:12 AM) koen: bluelightning: and the initial reactions were
"that cannot be true, bye!"
(10:46:38 AM) RP_: koen: on the mailing list? or last TSC meeting?
(10:46:40 AM) bluelightning: koen: that is not a particularly accurate summary
(10:46:53 AM) koen: at ELC and at the last meeting
(10:47:09 AM) bluelightning: at least, not of the TSC meeting I was in
(10:47:55 AM) RP_: koen: well, there are two sides to this and offence
could be taken at the accusation too
(10:48:00 AM) fray: 13 minute time check BTW
(10:48:08 AM) koen: RP_: I realize that
(10:48:27 AM) RP_: koen: bottom line is that I can at least see why
people might feel there is some favouritism to certain contributors
(10:49:01 AM) RP_: koen: I certainly don't try to act that way though
and I think looking at the numbers of patches that get
rejected/reworked and so on should show that
(10:49:41 AM) RP_: Its a really hard problem, particularly when you
have to account for volume of contributions, and people's relative
responsibilities in particular areas
(10:50:11 AM) koen: another thing to keep in mind is that yocto
milestone items get more attention
(10:50:28 AM) RP_: as I said, I sometimes feel I'm being "unfairly"
hard on Intel/WR in particular :/
(10:50:30 AM) koen: and the community isn't really participating in
adding milestone items
(10:50:43 AM) RP_: I say unfairly as I plan to keep doing it :)
(10:50:58 AM) RP_: it improves quality and I think it makes sense
(10:51:26 AM) koen: so if you're only on the oe-core list you don't
get a feel for what "yocto assignees" need to be working on
(10:51:27 AM) RP_: koen: people are free to participate in that but it
has to be something they opt into
(10:51:53 AM) koen: I know, and that's isn't my point :)
(10:52:06 AM) RP_: koen: so how do we get more people involved, or how
do we better communicate it?
(10:52:23 AM) RP_: koen: I'd actually really appreciate your help in
communicating it...
(10:52:37 AM) koen: it's a combination of what you said earlier this meeting
(10:52:54 AM) koen: if there's something that needs to get done by milestone X
(10:53:06 AM) koen: and someone in intel/WR/whatever sends a patchset for that
(10:53:14 AM) koen: it's more likely to go in since:
(10:53:17 AM) koen: a) it's needed
(10:53:26 AM) koen: b) we know there are resources to fix the fallout
(10:53:39 AM) koen: am I still making sense?
(10:54:00 AM) RP_: yes
(10:54:16 AM) koen: so if you're not into yocto milestones, you don't
know about a)
(10:54:28 AM) RP_: The YP does have its schedules and plans for what
it wants to do and I do try and help them achieve that
(10:54:52 AM) RP_: That doesn't mean a free pass though, I'm known for
rejecting patches and knocking schedules off :/
(10:55:20 AM) koen: so the perception can be that favoritism exists,
while it's actually more a schedule and bandwidth thing
(10:55:33 AM) RP_: I think that is fair comment
(10:55:41 AM) RP_: koen: so what do we do about it?
(10:55:43 AM) koen: that is what I think is happening with a lot of
the perceived problems
(10:55:54 AM) fray: 5 - min
(10:56:19 AM) koen: RP_: maybe send more milestone status mails to the list
(10:56:59 AM) RP_: koen: its something to give more thought to but its
also a capacity problem :(
(10:57:06 AM) koen: I know
(10:57:11 AM) khem: RP_: smetimes people may not follow yocto ml and
only oe-core mls
(10:57:14 AM) RP_: I don't have a lot of spare bandwidth for more emails :/
(10:57:24 AM) koen: I do have related, more positive news
(10:57:31 AM) khem: and when they see a changeset adhering to yocto
milestone it can confuse
(10:58:09 AM) khem: RP_: I think CCing oe-ocre ml on yp mails would be
step in better dir
(10:58:10 AM) koen: I received a lot of emails saying how awesome the
new yocto docs are after Scott added all the "this builds poky, you
can build other distros if you want" disclaimers to it
(10:58:19 AM) khem: I see lot of update mails sent to yp ml
(10:58:21 AM) fray: is there a way we can task someone from the YP to
keep OE involved w/ the milestones (someone other then RP)..   I know
in the past we didn't do that cause OE isn't just YP.. it's a lot more
(10:58:31 AM) Jefro: I think RP was right earlier about communication.
Where are the OE release goals articulated? If nowhere, perhaps I can
maintain a wiki page to summarize these, not in the detail of the ones
on the YP page but to some level.
(10:59:03 AM) khem: yes Jefro that will be good.
(10:59:19 AM) RP_: Jefro: I think we need to talk between you and Song
and see if we can't communicate some of this better. Not sure how
exactly
(10:59:44 AM) Jefro: yes, exactly. I'm thinking of a page on the OE
wiki that would be updated for each release, not something to the
level of detail that Song maintains.
(11:00:07 AM) RP_: Jefro: wiki page won't get seen by people :/
(11:00:09 AM) fray: ya.. YP related itemse that are oe-core specific..
(11:00:29 AM) RP_: Jefro: although I guess an email when its updated might work
(11:00:37 AM) bluelightning: it might also be worth sending out
something to the OE lists explaining how the Yocto Project schedules
work, how that affects OE, that you can add feature requests at any
time to the yocto bugzilla, etc.
(11:00:57 AM) fray: ya.. might be a good idea
(11:01:07 AM) khem: RP_: I think sending to OE-Core ml the updates
that yp status meeting etc. could be helpful to folks
(11:01:13 AM) koen: as the TSC we could formally adopt the oe related
yocto goals
(11:01:16 AM) fray: we're out of time..  (we can keep going if need
be)..  3k and 4.* remain
(11:01:22 AM) koen: which would mean we finally have goals :)
(11:01:43 AM) RP_: koen: I think its been implied that we do have shared goals
(11:01:49 AM) koen: yes
(11:01:54 AM) koen: which is the problem
(11:01:57 AM) koen: it's implied
(11:01:59 AM) RP_: koen: and in setting the YP goals, attention is
paid to the OE community
(11:02:15 AM) Jefro: that is definitely true
(11:02:21 AM) koen: I'm not suggesting rubberstamping them, but I
don't expect problems formally adopting them each cycle
(11:02:41 AM) khem: I have leave now.
(11:03:02 AM) RP_: Ok, we're out of time but this is important. How
about this gets placed first on the agenda for the next meeting?
(11:03:13 AM) RP_: Gives us all some time to think about how we can
improve things
(11:03:14 AM) koen: ok by me
(11:03:14 AM) khem: but I can try to help with communications
(11:03:15 AM) Jefro: RP_ got it
(11:03:35 AM) bluelightning: next meeting, is it in a week as normally
scheduled?
(11:03:37 AM) Jefro: are we meeting next week as per the schedule?
(11:03:46 AM) fray: khem, thanks
(11:03:53 AM) Jefro: this meeting was an extra. I suggest keeping to
the original schedule but I can go either way.
(11:03:54 AM) RP_: I think we've at least identified where some of the
friction is coming from which is a good start
(11:04:00 AM) fray: either is fine with me
(11:04:05 AM) RP_: original schedule
(11:04:10 AM) RP_: since we need to talk about this :)
(11:04:12 AM) Jefro: ok - next week it is
(11:04:13 AM) bluelightning: I agree, original schedule
(11:05:35 AM) fray: ok.. meeting over.. lets pick up next week.. ok?
(11:06:32 AM) RP_: ok

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


