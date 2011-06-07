Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QTkX8-0003DW-4N; Tue, 07 Jun 2011 02:52:38 +0200
Received: by iye7 with SMTP id 7so4008035iye.6
	for <multiple recipients>; Mon, 06 Jun 2011 17:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=XAl97YSrugW98yxBTNj18X81mVNueWzSw40NEn3xuwY=;
	b=COnqL3onHJW1ThS9PRtevvIE7q2YS++o600LbEaTQLC3FtK04Kbu8xMnOu5QuLy8qg
	U51sVQU7zgRZTyebULnQ3JufhRkaQjDDFeL6G94TzAlMGRmlQbXKlpI9eqccoYi9yf2b
	97jxfzceh0aztBCOzkmIfCFJDVVvvcrIHwCJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=n30nuZxTkcK42Dc68mzK6JzFk6/I7TF3c/lR4FSj9L6b1J4J+KaCAmWqm0q8+57NO5
	CKmDMU0rXHpHaKAVAJx64H8N5F3PmpiPw77xFLCvq9f1rfQzZuaattCPE9EKmRaWO2xC
	Gx5WKIX/HEkEDPuGIVduZK56Q3koUrje+NXFw=
MIME-Version: 1.0
Received: by 10.42.21.204 with SMTP id l12mr9449011icb.341.1307407760706; Mon,
	06 Jun 2011 17:49:20 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.239.136 with HTTP; Mon, 6 Jun 2011 17:49:20 -0700 (PDT)
Date: Mon, 6 Jun 2011 17:49:20 -0700
X-Google-Sender-Auth: rGaFI2efk2Gx3u4m5vAJMQ5eIU8
Message-ID: <BANLkTimyAv8Bq3KAcVpRv-zXVWQeuDLnrg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting, 19-May-2011
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
X-List-Received-Date: Tue, 07 Jun 2011 00:52:38 -0000
Content-Type: multipart/alternative; boundary=20cf301d42a2274e5f04a5149795

--20cf301d42a2274e5f04a5149795
Content-Type: text/plain; charset=ISO-8859-1

OE-TSC minutes, 19-May-2011

Attendees: Richard, Koen, Mark, Khem, Stefan
Apologies: Tom, Jefro

Agenda with notes:

00) difference between an interest group with OE-Core as a focus and the TSC

koen promotes that hands-on steering group is better than advisory interest
group
fray & RP think that made sense for oe-core, but now want to move bulk of
work to ml
RP worries that hands-on oe-core was not original charter of TSC

01) Agree on meeting chair

RP

02) Status report on oe-core

announced on mailing list
micro and slugos work towards oe-core
20-30% of the OE recipes with all the layers
stefan thinks one last .dev release
fray wouldn't suggest closing dev until oe-core release generally accepted
koen would like GNOME in before closing .dev
long term maint on 2011.03
--> GNOME discussion to ml (all)
--> release issues to ml, interest in 2011.06 (stefan)

03) Status report on pull model, contrib repo and guidelines


04) Status report on board support layer guidelines

fray: version I send out tomorrow or early next week is likely the final
then wiki

05) Status on layer splitting of metadata

consolidate oe-core and oe-devel mailing lists?
separate patches list
bitbake list on oe.org
 RP proposes bitbake-devel (checked with Chris and he is ok with this)
possibly also meta-<machine> or meta-general for hardware discussions
meta-slug has slugos stuff, meta-ti has animal boards, meta-smartphones...
--> look at migrating bitbake mailing list (RP)

06) Continue discussions on infrastructure items


Raw transcript:

(20:54:36) ***RP__ is here
(20:56:30) ***koen too
(20:56:37) ***stefan_schmidt as well
(20:56:54) ***fray is here
(20:58:34) khem: I am back
(21:01:08) RP__: ok, Tom and Jefro send their appologies
(21:01:26) RP__: we need a chair since I think we're all here
(21:01:30) stefan_schmidt: means everyone else is here
(21:01:41) ***RP__ can do it if nobody else wants to
(21:02:50) RP__: ok. Did Jeff send out an agenda?
(21:02:58) RP__: I think the mail I saw was confused?
(21:02:58) stefan_schmidt: yes
(21:03:05) stefan_schmidt: right
(21:03:11) stefan_schmidt: now an updated one :)
(21:03:15) fray: ahh was the the agenda?  ;)
(21:03:32) RP__: stefan_schmidt: when did that come out/
(21:03:32) RP__: ?
(21:04:11) stefan_schmidt: hmm, let me check
(21:04:15) RP__: Is this the mail with subject "DRAFT Minutes for 12 May
2011"?
(21:04:18) koen: I saw something on IRC that I needed to comment on
something, but I coldn't deduce what from the backlog
(21:04:24) stefan_schmidt: To me it looked like an old agenda. But maybe I
confused it.
khem koen
(21:04:32) stefan_schmidt: Not my day today anyway...
(21:05:05) RP__: koen: We talked about the difference between an interest
group with OE-Core as a focus and the TSC
(21:05:20) RP__: koen: I asked people to think about it and come back to
this meeting having thought about it
(21:05:24) koen: ah, right
(21:05:31) RP__: koen: Yours was homework :)
(21:05:45) RP__: So who has done this? :)
(21:05:59) fray: I thought about it.. but I'm not sure I have much to add..
(21:06:00) koen: the backlog said something like "were now talking about #4,
5 and 6"
(21:06:14) koen: and I needed to comment on one, but I couldn't figure out
which one
(21:06:22) fray: I think interest groups are the right answer for keeping
the TSC as a decision making body.. vs what we are mostly doing now --
implementing the direction
(21:06:38) stefan_schmidt: hmm, my mail seems to be broken. Can't find the
agenda mail right now
(21:06:40) koen: we are a *steering* group
(21:06:57) koen: I have no problems with a hands-on tsc
(21:07:07) fray: ya.. I think what we did for oe-core made sense.. but now
that it's "open", it needs to be an interest group.. the hands-on is what
got it moving..
(21:07:14) koen: but an IG would take a lot of work out of the tsc's hands
(21:07:20) RP__: koen: but I think the time is for the mailing lists to take
a greater role and this team a little bit of a lesser one
(21:07:50) koen: RP__: you might have noticed me saying "let's move that to
the ml" the past few meetings :)
(21:07:57) RP__: koen: My worry was when you look at the agenda we focused
on oe-core to pretty much the exclusion of anything else
(21:07:58) fray: :)
(21:08:07) RP__: and I worry that isn't what the TSC should be doing
(21:08:29) koen: not much to to in .dev worlds
(21:08:42) koen: frans stopped deleting stuff
(21:08:57) koen: people post scary things for review first
(21:09:05) RP__: koen: I agree, I'm just thinking we need to probably
mentally shift gear at this point a little and I'm highlighting that
(21:09:43) RP__: So, agenda wise do we feel we need to cycle through the
usual items?
(21:09:49) koen: we could do some handwaving like the previous TSC
(21:09:54) koen: rename some git branches and stuff
(21:10:42) stefan_schmidt: RP__: I would say we could either cycle or
diretcly bring up topics
(21:10:54) RP__:  01) Agree on meeting chair
(21:10:54) RP__:  02) Status report on oe-core
(21:10:54) RP__:  03) Status report on pull model, contrib repo and
guidelines
(21:10:54) RP__:  04) Status report on board support layer guidelines
(21:10:54) RP__:  05) Status on layer splitting of metadata
(21:10:54) RP__:  06) Continue discussions on infrastructure items
(21:10:58) stefan_schmidt: normally we find our way to the topics without
the agenda...
(21:11:03) koen: RP__: TBH, I consider .dev a dead end
(21:11:11) RP__: 01) - Me, nexy
(21:11:21) RP__: koen: I agree, I think the future is clear
(21:11:37) RP__: but we have the transition ahead
(21:11:38) koen: what remains is figuring out when it will go read only
(21:11:40) stefan_schmidt: 02) micor and slug os work towards oe-core
(21:11:48) ***RP__ feels the mailing list has generally been positive
(21:11:55) stefan_schmidt: shows up some things that wasn't found before.
good.
(21:12:15) stefan_schmidt: koen: first we need a last release from .dev
(21:12:16) RP__: koen: I think its still premature to discuss that atm
(21:12:34) RP__: So we're clearly on 02) btw :)
(21:12:45) RP__: We announced OE-Core
(21:12:58) fray: (btw questions about R/O switches, etc.. this is what the
TSC should be doing.. vs an IG)
(21:13:00) RP__: I wish I had more time to write more instructions but I
don't and I really could use some help there
(21:13:32) koen: RP__: we're still at 20-30% of the OE recipes with all the
layers
(21:13:43) RP__: Phil has caught some path issues which we've promptly fixed
(21:13:52) koen: personally, I'd like to get GNOME in before even thinking
about closing .dev
(21:14:03) RP__: koen: It'll take a while but we will get there
(21:14:17) RP__: Should we have the gnome discussion now?
(21:14:36) koen: that can go onto the ml :)
(21:14:43) RP__: ok
(21:15:01) khem: stefan_schmidt: we already have made last release from .dev
(21:15:08) stefan_schmidt: anything else in oe-core land this week?
(21:15:13) khem: next release is supposed to be on oe-core
(21:15:16) RP__: I think we're at least 3 months of thinking about dev
closure
(21:15:20) stefan_schmidt: khem: err, no?
(21:15:36) stefan_schmidt: khem: we did plan to have 2011.06 from it and
then going ro
(21:15:41) fray: I wouldn't suggest closing dev until we've got an oe-core
release and it's generally accepted..
(21:15:42) khem: stefan_schmidt: we have a long term maintainence on 2011.03
(21:15:43) RP__: ok, anything else on oe-core
(21:15:44) koen: with the maintenance branch doign well, we might not need a
new release
(21:15:46) stefan_schmidt: At least that is what I remember
(21:15:47) khem: it wont make much sense
(21:15:54) RP__: I'd like to thank khem for the slugos work btw :)
(21:16:22) khem: RP__: yes I wanted to experience what would it take to add
a new distro
(21:16:28) fray: One question on oe-core..
(21:16:29) khem: and surprisingly it was not much
(21:16:45) stefan_schmidt: koen, khem: That depens if people are interested
in doing another release
(21:16:54) fray: I noticed the email today about the overall changelog..
 I'm getting overwealmed with email recently..  Is there a plan to do
something similar w/ oe-core?
(21:16:57) RP__: khem: cool, that is good to know
(21:17:17) RP__: khem: I hoped and thought as much but its nice to hear it
confirmed :)
(21:17:18) koen: fray: oe-core is at the bottom of that mail :)
(21:17:20) khem: stefan_schmidt: I would refrain from another release on
.dev since we have a branch already on 2011.03 there wont be much users in
11.06
(21:17:26) fray: An announce type list with changelogs would definitately
help people keep up.. but it should definitely be automated..
(21:17:33) fray: koen, ahh heh I didn't make ti that far..
(21:17:40) RP__: fray: Wasn't that on the bottom? :)
(21:18:08) fray: I only looked at the angstrom stuff..
(21:18:09) koen: fray: alphabetically sorted, cbrake will change it next
time
(21:18:19) RP__: I'd should mention I've concentrated on some detailed patch
review over the past 24 hours so pull merging is sluggish atm
(21:18:26) RP__: normal server will resume shortly :)
(21:18:33) khem: fray: oe-commits
(21:18:48) stefan_schmidt: khem: I not against dropping the release. We just
had another plan before :)
(21:18:59) khem: RP__: on patch review I think we should decide if we want
to use patchwork or not
(21:19:07) fray: koen, my suggestion isn't to resort it.. just have
something at the top listing all of the places that will be listed..
(21:19:08) RP__: Regarding releases I'd only do them if they make sense and
there is a need
(21:19:27) RP__: khem: I've been meaning to contrast it with gerrit
(21:19:46) RP__: khem: patchwork doesn't seem to personally buy me much atm
(21:19:51) khem: releases take considerable time and I think there wont be
many users for 11.06 on .dev given there is 11.03 long term
(21:19:52) stefan_schmidt: RP__: Fine with me. We would need to find people
running the release anyway
(21:20:04) stefan_schmidt: I think khem is not interested and Tom busy with
2011.03
(21:20:23) stefan_schmidt: So maybe nobody will care nayway. But we should
at least discuss it before dropping
(21:20:43) RP__: stefan_schmidt: agreed but those sound like reasonable
reasons to me
(21:21:05) stefan_schmidt: sure, we can fir up a mail for in in some weeks
and look at the feedback
(21:21:12) RP__: stefan_schmidt: I'd take silence as acceptance ;-)
(21:21:18) khem: RP__: I would rather spend time releasing based on oe-core
(21:21:19) stefan_schmidt: Buglabs won't go for 2011.06 anyway
(21:21:25) RP__: khem: agreed
(21:21:38) RP__: ok, anything else on oe-core?
(21:21:48) RP__: pull model, contrib repo and guidelines?
(21:21:58) fray: based on the fact it's already almost 2011.06 -- and I
haven't seen anyone pushing for a release (and lots of patches going into
2011.03)  I don't know that it's needed either
(21:22:13) RP__: board support layer guidelines?
(21:22:19) fray: guidelines.. based on the feedback I've gotten so far.. the
version I send out tomorrow or early next week is likely the final...
(21:22:52) RP__: fray: sounds good. Where is the end result going?
(21:22:54) RP__: wikis?
(21:22:56) stefan_schmidt: Well, to close the release discussion here. AR:
for me sending a mail about interest in an 2011.06 release and asking for
volunteers if needed
(21:22:57) khem: We also need to consolidate oe-core and oe-devel mailing
lists
(21:23:02) khem: as we move forward
(21:23:16) fray: RP__ mailing list for final comments.. back to us for a
"vote".. and then yes.. wiki
(21:23:20) RP__: khem: I actually want to maintain some list separation for
the patches
(21:23:37) fray: I just want the final to be clearly the opinion of the TSC
before we publish to the wiki
(21:23:43) RP__: stefan_schmidt: I'd send an email out but mention low
interest and nobody taking it on?
(21:23:46) khem: RP__: yes we should have oe-patches and oe-devel separate
(21:23:47) RP__: fray: agreed
(21:24:03) RP__: khem: no, I think we need to separate oe-core as it is now
(21:24:12) RP__: one place where all oe-core changes/patches go
(21:24:15) RP__: clear separation
(21:24:16) fray: for now, I think oe-core is needed still..
(21:24:26) stefan_schmidt: RP__: I was thinking about these lines. I don't
want to push it. Just want to let people know that we may drop it due to
lack of interest
(21:24:29) RP__: which brings up a topic I wanted to raise - the bitbake
mailing list
(21:24:37) fray: if and when dev is locked down and email dies down.. then
we can consolodate
(21:24:53) khem: fray: yes
(21:25:02) RP__: should we move the bitbake list from berlios where nobody
can find it onto linux2go? or onto yocto?
(21:25:09) RP__: at the moment people don't use it as the email lags badly
on it
(21:25:21) fray: RP__ --yes--
(21:25:24) khem: RP__: yes oe.org would be ok
(21:25:30) stefan_schmidt: RP__: is it the last item on berlios?
(21:25:32) fray: I'd love it to be on oe.org
(21:25:39) RP__: stefan_schmidt: bitbake releases are there too
(21:25:50) stefan_schmidt: RP__: hmm, ok
(21:25:51) ***RP__ thinks we should move the mailing list urgently though
(21:26:16) RP__: so who can admin mailing lists and setup a bitbake one on
oe.org?
(21:26:39) stefan_schmidt: I don't have much of an opinion here, but if
people that use it more have problems these should be fixed
(21:26:40) koen: 'bitbake' is ok for the name?
(21:26:46) khem: mailman on ltg needs updated too or fixed. It given wrong
thread views
(21:26:52) RP__: koen: I don'ts ee why not
(21:26:54) fray: koen, ya, I would like "bitbake" as the name
(21:27:00) RP__: or bitbake-devel?
(21:27:07) RP__: its currently bitbake-dev I think
(21:27:19) khem: well given our convention -devel is logical
(21:27:43) fray: no objection..
(21:27:52) RP__: Anyhow, I think moving it would help people find it and
enable more bitbake discussion in the right place
(21:28:06) RP__: no objections?
(21:28:12) khem: RP__: will it also involve moving archives
(21:28:25) koen: I'm looking at the form now
(21:28:33) RP__: khem: yes, and inviting subscribers to the new list and
making the old one read-only
(21:28:41) khem: RP__: ok
(21:28:45) khem: I support that
(21:29:17) stefan_schmidt: no objection from me
(21:29:38) koen: bitbake or bitbake-devel?
(21:30:22) khem: one think that I was seeing is that lot of people have
different boards and they are currently supported in oe now they need
machine layers on top of oe-core
(21:30:45) khem: they are not supported by vendors per say
(21:31:00) khem: where to host them we need something like meta-machiens
(21:31:00) ***RP__ proposes bitbake-devel
(21:31:24) khem: yes bitbake-devel is fine on ml
(21:31:24) RP__: khem: Could that not be a directory in meta-oe?
(21:31:50) khem: RP__: yes it could be
(21:32:11) khem: so should we create another layer under meta-openembedded
(21:32:29) khem: meta-machines ?
(21:32:32) khem: or some such
(21:32:38) fray: I think it depends on if we're trying to build up meta-oe
-- or if we're trying to provide examples for new people doing work
(21:32:43) RP__: I think that makes sense atm
(21:32:56) fray: if examples and new work is the goal, then new layers (even
if they're under meta-oe) is the right approach...
(21:33:04) RP__: I think meta-oe needs to grow some of this stuff initially
then things can split out as needed
(21:33:10) fray: if we're just trying to move things forward from dev, then
meta-oe is the "obvious" answer to me
(21:33:14) khem: agreed
(21:33:21) fray: RP__ ya, thats kind of what I'm thinking as well..
(21:33:28) fray: we need machine layer examples.. but it may still be
premature
(21:34:12) khem: RP__: should it be general layer meta-misc-machines
(21:34:22) khem: or like meta-<machine>
(21:34:30) khem: I guess general
(21:34:38) RP__: probably general
(21:34:42) khem: ok
(21:34:45) RP__: we can go too far with splitting things up
(21:34:51) koen: I really don't want machines in the meta-oe repo
(21:34:56) khem: thats what I  was guessing
(21:34:57) fray: ya..  I'm a bit worried about the "over splitting"
(21:35:04) khem: right now I have almost 10 layers
(21:35:11) khem: for building 2 distros and 4 machines
(21:35:12) fray: koen, I think we need to have some... all of them, likely
not..
(21:35:14) khem: :)
(21:35:47) RP__: koen: I think it is ok as long as they are split out and
enabled separately
(21:35:49) fray: khem, my experience with layers (before oe) is that around
10 is manageable.. more starts to get confusing
(21:37:55) koen: let me put it another way
(21:38:01) RP__: ok, is there anything else we need to talk about?
(21:38:10) koen: if it lives in the meta-oe repo, I'm not going to maintain
that machine layer
(21:38:45) RP__: koen: I think that is ok, we just need to define areas of
ownership
(21:39:22) fray: koen, I think that needs to be part of the readme in the
meta-oe..  there is layer and component maintainers..
(21:39:34) fray: IMHO it's perfectly acceptable to define multiple
owners/maintainers
(21:40:12) khem: koen: we need those machines somewhere to get users using
new setup for their familiar machine
(21:40:52) koen: paulE is picking up the handhelds stuff
(21:41:06) koen: meta-smartphones has the phones
(21:41:18) koen: meta-slug has the slug
(21:41:22) khem: koen: will they under meta-openembedded  ?
(21:41:26) koen: meta-ti has the animals
(21:41:49) fray: is the real issue that people don't know where to look for
the machines?
(21:42:11) koen: I think so
(21:43:09) koen: there aren't a whole lot of useful machines left in .dev
that aren't in a layer already
(21:43:20) koen: (or have a layer planned, e.g. gumstix)
(21:43:31) fray: and I definitely want to avoid moving machines nobody is
going to use.. its the few remainers that concerns me
(21:44:27) fray: As a TSC, would it be reasonable to state.. the preferred
way of doing this is a "machine" layer.. one that contaisn on or more
related amchines..
(21:44:45) fray: in the event a machine layer will not be created, it can go
into meta-oe, but requires a named maintainer for the minimal functionality?
(21:45:05) koen: right
(21:45:24) RP__: all pieces of meta-oe need clearly named maintainers or
groups of maintainers and a defined way they make decisions
(21:45:40) khem: correct
(21:45:50) khem: no unmaintained machine is coming over thats clear
(21:46:00) fray: I'm willing to ratify that.. :)
(21:46:10) ***RP__ checked with Chris and he's fine with the bitbake list
move btw
(21:46:30) koen: sweet
(21:46:43) khem: koen: how will angstrom propose the machines it supports
(21:47:06) khem: koen: angstrom-scripts is geared to ti machines mainly ATM
(21:47:13) koen: right
(21:47:19) koen: no more machine layers around
(21:47:29) koen: till I found meta-smartphone today
(21:47:49) khem: ok so you will take them as they come and support angstrom
?
(21:47:53) khem: right
(21:48:08) koen: depends on people willing to support them for angstrom
(21:48:20) khem: ok
(21:49:12) ***stefan_schmidt feels we have covered all topics
(21:49:20) koen: it will be influenced by
http://narcissus.angstrom-distribution.org/stats.php :)
(21:49:20) khem: ok
(21:49:22) ***RP__ thinks so
(21:49:24) stefan_schmidt: Anything important left? I'm tired today...
(21:49:26) fray: yup
(21:49:31) RP__: Shall we close up?
(21:49:35) khem: yes
(21:49:36) fray: o with me
(21:49:40) RP__: Any ARs we need to capture?
(21:49:49) ***RP__ will look at migrating the bitbake mailing list
(21:49:51) khem: RP__: you should push the TMPDIR append patch
(21:49:58) RP__: thanks to koen putting the basics in place
(21:50:02) khem: it worked well here
(21:50:03) stefan_schmidt: RP__: only the one for me sending a mail wrt
release
(21:50:36) RP__: Ok, thats it folks, meeting closed :)
(21:50:46) RP__: thanks all :)
(21:50:50) khem: bye
(21:51:03) RP__: khem: and yes, I need to take that patch and some others
(21:51:10) stefan_schmidt: night all
(21:51:14) RP__: see above, I'm lagging atm, will catch up tomorrow

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org




-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--20cf301d42a2274e5f04a5149795
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><div>OE-TSC minutes, 19-May-2011</div><div><br><=
/div><div>Attendees: Richard, Koen, Mark, Khem, Stefan</div><div>Apologies:=
 Tom, Jefro</div><div><br></div><div>Agenda with notes:</div><div><br></div=
>

<div>00) difference between an interest group with OE-Core as a focus and t=
he TSC</div>
<div><br></div><div>koen promotes that hands-on steering group is better th=
an advisory interest group</div><div>fray &amp; RP think that made sense fo=
r oe-core, but now want to move bulk of work to ml</div><div>RP worries tha=
t hands-on oe-core was not original charter of TSC</div>


<div><br></div><div>01) Agree on meeting chair</div><div><br></div><div>RP<=
/div><div><br></div><div>02) Status report on oe-core</div><div><br></div><=
div>announced on mailing list</div><div>micro and slugos work towards oe-co=
re</div>


<div>20-30% of the OE recipes with all the layers</div><div>stefan thinks o=
ne last .dev release</div><div>fray wouldn&#39;t suggest closing dev until =
oe-core release generally accepted</div><div>koen would like GNOME in befor=
e closing .dev</div>


<div>long term maint on 2011.03</div><div>--&gt; GNOME discussion to ml (al=
l)</div><div>--&gt; release issues to ml, interest in 2011.06 (stefan)</div=
><div><br></div><div>03) Status report on pull model, contrib repo and guid=
elines</div>


<div><br></div><div><br></div><div>04) Status report on board support layer=
 guidelines</div><div><br></div><div>fray: version I send out tomorrow or e=
arly next week is likely the final</div><div>then wiki</div><div><br></div>


<div>05) Status on layer splitting of metadata</div><div><br></div><div>con=
solidate oe-core and oe-devel mailing lists?</div><div>separate patches lis=
t</div><div>bitbake list on <a href=3D"http://oe.org" target=3D"_blank">oe.=
org</a></div>

<div>
RP proposes bitbake-devel (checked with Chris and he is ok with this)</div>=
<div>possibly also meta-&lt;machine&gt; or meta-general for hardware discus=
sions</div><div>meta-slug has slugos stuff, meta-ti has animal boards, meta=
-smartphones...</div>


<div>--&gt; look at migrating bitbake mailing list (RP)</div><div><br></div=
><div>06) Continue discussions on infrastructure items</div><div><br></div>=
<div><br></div>Raw transcript:<div><br></div><div><div>(20:54:36) ***RP__ i=
s here</div>


<div>(20:56:30) ***koen too</div><div>(20:56:37) ***stefan_schmidt as well<=
/div><div>(20:56:54) ***fray is here</div><div>(20:58:34) khem: I am back</=
div><div>(21:01:08) RP__: ok, Tom and Jefro send their appologies</div>


<div>(21:01:26) RP__: we need a chair since I think we&#39;re all here</div=
><div>(21:01:30) stefan_schmidt: means everyone else is here</div><div>(21:=
01:41) ***RP__ can do it if nobody else wants to</div><div>(21:02:50) RP__:=
 ok. Did Jeff send out an agenda?</div>


<div>(21:02:58) RP__: I think the mail I saw was confused?</div><div>(21:02=
:58) stefan_schmidt: yes</div><div>(21:03:05) stefan_schmidt: right</div><d=
iv>(21:03:11) stefan_schmidt: now an updated one :)</div><div>(21:03:15) fr=
ay: ahh was the the agenda? =A0;)</div>


<div>(21:03:32) RP__: stefan_schmidt: when did that come out/</div><div>(21=
:03:32) RP__: ?</div><div>(21:04:11) stefan_schmidt: hmm, let me check</div=
><div>(21:04:15) RP__: Is this the mail with subject &quot;DRAFT Minutes fo=
r 12 May 2011&quot;?</div>


<div>(21:04:18) koen: I saw something on IRC that I needed to comment on so=
mething, but I coldn&#39;t deduce what from the backlog</div><div>(21:04:24=
) stefan_schmidt: To me it looked like an old agenda. But maybe I confused =
it.</div>


<div>khem koen</div><div>(21:04:32) stefan_schmidt: Not my day today anyway=
...</div><div>(21:05:05) RP__: koen: We talked about the difference between=
 an interest group with OE-Core as a focus and the TSC</div><div>(21:05:20)=
 RP__: koen: I asked people to think about it and come back to this meeting=
 having thought about it</div>


<div>(21:05:24) koen: ah, right</div><div>(21:05:31) RP__: koen: Yours was =
homework :)</div><div>(21:05:45) RP__: So who has done this? :)</div><div>(=
21:05:59) fray: I thought about it.. but I&#39;m not sure I have much to ad=
d..</div>


<div>(21:06:00) koen: the backlog said something like &quot;were now talkin=
g about #4, 5 and 6&quot;</div><div>(21:06:14) koen: and I needed to commen=
t on one, but I couldn&#39;t figure out which one</div><div>(21:06:22) fray=
: I think interest groups are the right answer for keeping the TSC as a dec=
ision making body.. vs what we are mostly doing now -- implementing the dir=
ection</div>


<div>(21:06:38) stefan_schmidt: hmm, my mail seems to be broken. Can&#39;t =
find the agenda mail right now</div><div>(21:06:40) koen: we are a *steerin=
g* group</div><div>(21:06:57) koen: I have no problems with a hands-on tsc<=
/div>


<div>(21:07:07) fray: ya.. I think what we did for oe-core made sense.. but=
 now that it&#39;s &quot;open&quot;, it needs to be an interest group.. the=
 hands-on is what got it moving..</div><div>(21:07:14) koen: but an IG woul=
d take a lot of work out of the tsc&#39;s hands</div>


<div>(21:07:20) RP__: koen: but I think the time is for the mailing lists t=
o take a greater role and this team a little bit of a lesser one</div><div>=
(21:07:50) koen: RP__: you might have noticed me saying &quot;let&#39;s mov=
e that to the ml&quot; the past few meetings :)</div>


<div>(21:07:57) RP__: koen: My worry was when you look at the agenda we foc=
used on oe-core to pretty much the exclusion of anything else</div><div>(21=
:07:58) fray: :)</div><div>(21:08:07) RP__: and I worry that isn&#39;t what=
 the TSC should be doing</div>


<div>(21:08:29) koen: not much to to in .dev worlds</div><div>(21:08:42) ko=
en: frans stopped deleting stuff</div><div>(21:08:57) koen: people post sca=
ry things for review first</div><div>(21:09:05) RP__: koen: I agree, I&#39;=
m just thinking we need to probably mentally shift gear at this point a lit=
tle and I&#39;m highlighting that</div>


<div>(21:09:43) RP__: So, agenda wise do we feel we need to cycle through t=
he usual items?</div><div>(21:09:49) koen: we could do some handwaving like=
 the previous TSC</div><div>(21:09:54) koen: rename some git branches and s=
tuff</div>


<div>(21:10:42) stefan_schmidt: RP__: I would say we could either cycle or =
diretcly bring up topics</div><div>(21:10:54) RP__: =A001) Agree on meeting=
 chair</div><div>(21:10:54) RP__: =A002) Status report on oe-core</div><div=
>


(21:10:54) RP__: =A003) Status report on pull model, contrib repo and guide=
lines</div><div>(21:10:54) RP__: =A004) Status report on board support laye=
r guidelines</div><div>(21:10:54) RP__: =A005) Status on layer splitting of=
 metadata</div>


<div>(21:10:54) RP__: =A006) Continue discussions on infrastructure items</=
div><div>(21:10:58) stefan_schmidt: normally we find our way to the topics =
without the agenda...</div><div>(21:11:03) koen: RP__: TBH, I consider .dev=
 a dead end</div>


<div>(21:11:11) RP__: 01) - Me, nexy</div><div>(21:11:21) RP__: koen: I agr=
ee, I think the future is clear</div><div>(21:11:37) RP__: but we have the =
transition ahead</div><div>(21:11:38) koen: what remains is figuring out wh=
en it will go read only</div>


<div>(21:11:40) stefan_schmidt: 02) micor and slug os work towards oe-core<=
/div><div>(21:11:48) ***RP__ feels the mailing list has generally been posi=
tive</div><div>(21:11:55) stefan_schmidt: shows up some things that wasn&#3=
9;t found before. good.</div>


<div>(21:12:15) stefan_schmidt: koen: first we need a last release from .de=
v</div><div>(21:12:16) RP__: koen: I think its still premature to discuss t=
hat atm</div><div>(21:12:34) RP__: So we&#39;re clearly on 02) btw :)</div>


<div>(21:12:45) RP__: We announced OE-Core</div><div>(21:12:58) fray: (btw =
questions about R/O switches, etc.. this is what the TSC should be doing.. =
vs an IG)</div><div>(21:13:00) RP__: I wish I had more time to write more i=
nstructions but I don&#39;t and I really could use some help there</div>


<div>(21:13:32) koen: RP__: we&#39;re still at 20-30% of the OE recipes wit=
h all the layers</div><div>(21:13:43) RP__: Phil has caught some path issue=
s which we&#39;ve promptly fixed</div><div>(21:13:52) koen: personally, I&#=
39;d like to get GNOME in before even thinking about closing .dev</div>


<div>(21:14:03) RP__: koen: It&#39;ll take a while but we will get there</d=
iv><div>(21:14:17) RP__: Should we have the gnome discussion now?</div><div=
>(21:14:36) koen: that can go onto the ml :)</div><div>(21:14:43) RP__: ok<=
/div>


<div>(21:15:01) khem: stefan_schmidt: we already have made last release fro=
m .dev</div><div>(21:15:08) stefan_schmidt: anything else in oe-core land t=
his week?</div><div>(21:15:13) khem: next release is supposed to be on oe-c=
ore</div>


<div>(21:15:16) RP__: I think we&#39;re at least 3 months of thinking about=
 dev closure</div><div>(21:15:20) stefan_schmidt: khem: err, no?</div><div>=
(21:15:36) stefan_schmidt: khem: we did plan to have 2011.06 from it and th=
en going ro</div>


<div>(21:15:41) fray: I wouldn&#39;t suggest closing dev until we&#39;ve go=
t an oe-core release and it&#39;s generally accepted..</div><div>(21:15:42)=
 khem: stefan_schmidt: we have a long term maintainence on 2011.03</div>


<div>(21:15:43) RP__: ok, anything else on oe-core</div><div>(21:15:44) koe=
n: with the maintenance branch doign well, we might not need a new release<=
/div><div>(21:15:46) stefan_schmidt: At least that is what I remember</div>


<div>(21:15:47) khem: it wont make much sense</div><div>(21:15:54) RP__: I&=
#39;d like to thank khem for the slugos work btw :)</div><div>(21:16:22) kh=
em: RP__: yes I wanted to experience what would it take to add a new distro=
</div>


<div>(21:16:28) fray: One question on oe-core..</div><div>(21:16:29) khem: =
and surprisingly it was not much</div><div>(21:16:45) stefan_schmidt: koen,=
 khem: That depens if people are interested in doing another release</div>


<div>(21:16:54) fray: I noticed the email today about the overall changelog=
.. =A0I&#39;m getting overwealmed with email recently.. =A0Is there a plan =
to do something similar w/ oe-core?</div><div>(21:16:57) RP__: khem: cool, =
that is good to know</div>


<div>(21:17:17) RP__: khem: I hoped and thought as much but its nice to hea=
r it confirmed :)</div><div>(21:17:18) koen: fray: oe-core is at the bottom=
 of that mail :)</div><div>(21:17:20) khem: stefan_schmidt: I would refrain=
 from another release on .dev since we have a branch already on 2011.03 the=
re wont be much users in 11.06</div>


<div>(21:17:26) fray: An announce type list with changelogs would definitat=
ely help people keep up.. but it should definitely be automated..</div><div=
>(21:17:33) fray: koen, ahh heh I didn&#39;t make ti that far..</div><div>


(21:17:40) RP__: fray: Wasn&#39;t that on the bottom? :)</div><div>(21:18:0=
8) fray: I only looked at the angstrom stuff..</div><div>(21:18:09) koen: f=
ray: alphabetically sorted, cbrake will change it next time</div><div>

(21:18:19) RP__: I&#39;d should mention I&#39;ve concentrated on some detai=
led patch review over the past 24 hours so pull merging is sluggish atm</di=
v>
<div>(21:18:26) RP__: normal server will resume shortly :)</div><div>(21:18=
:33) khem: fray: oe-commits</div><div>(21:18:48) stefan_schmidt: khem: I no=
t against dropping the release. We just had another plan before :)</div>


<div>(21:18:59) khem: RP__: on patch review I think we should decide if we =
want to use patchwork or not</div><div>(21:19:07) fray: koen, my suggestion=
 isn&#39;t to resort it.. just have something at the top listing all of the=
 places that will be listed..</div>


<div>(21:19:08) RP__: Regarding releases I&#39;d only do them if they make =
sense and there is a need</div><div>(21:19:27) RP__: khem: I&#39;ve been me=
aning to contrast it with gerrit</div><div>(21:19:46) RP__: khem: patchwork=
 doesn&#39;t seem to personally buy me much atm</div>


<div>(21:19:51) khem: releases take considerable time and I think there won=
t be many users for 11.06 on .dev given there is 11.03 long term</div><div>=
(21:19:52) stefan_schmidt: RP__: Fine with me. We would need to find people=
 running the release anyway</div>


<div>(21:20:04) stefan_schmidt: I think khem is not interested and Tom busy=
 with 2011.03</div><div>(21:20:23) stefan_schmidt: So maybe nobody will car=
e nayway. But we should at least discuss it before dropping</div><div>

(21:20:43) RP__: stefan_schmidt: agreed but those sound like reasonable rea=
sons to me</div>
<div>(21:21:05) stefan_schmidt: sure, we can fir up a mail for in in some w=
eeks and look at the feedback</div><div>(21:21:12) RP__: stefan_schmidt: I&=
#39;d take silence as acceptance ;-)</div><div>(21:21:18) khem: RP__: I wou=
ld rather spend time releasing based on oe-core</div>


<div>(21:21:19) stefan_schmidt: Buglabs won&#39;t go for 2011.06 anyway</di=
v><div>(21:21:25) RP__: khem: agreed</div><div>(21:21:38) RP__: ok, anythin=
g else on oe-core?</div><div>(21:21:48) RP__: pull model, contrib repo and =
guidelines?</div>


<div>(21:21:58) fray: based on the fact it&#39;s already almost 2011.06 -- =
and I haven&#39;t seen anyone pushing for a release (and lots of patches go=
ing into 2011.03) =A0I don&#39;t know that it&#39;s needed either</div><div=
>


(21:22:13) RP__: board support layer guidelines?</div><div>(21:22:19) fray:=
 guidelines.. based on the feedback I&#39;ve gotten so far.. the version I =
send out tomorrow or early next week is likely the final...</div><div>

(21:22:52) RP__: fray: sounds good. Where is the end result going?</div>
<div>(21:22:54) RP__: wikis?</div><div>(21:22:56) stefan_schmidt: Well, to =
close the release discussion here. AR: for me sending a mail about interest=
 in an 2011.06 release and asking for volunteers if needed</div><div>(21:22=
:57) khem: We also need to consolidate oe-core and oe-devel mailing lists</=
div>


<div>(21:23:02) khem: as we move forward</div><div>(21:23:16) fray: RP__ ma=
iling list for final comments.. back to us for a &quot;vote&quot;.. and the=
n yes.. wiki</div><div>(21:23:20) RP__: khem: I actually want to maintain s=
ome list separation for the patches</div>


<div>(21:23:37) fray: I just want the final to be clearly the opinion of th=
e TSC before we publish to the wiki</div><div>(21:23:43) RP__: stefan_schmi=
dt: I&#39;d send an email out but mention low interest and nobody taking it=
 on?</div>


<div>(21:23:46) khem: RP__: yes we should have oe-patches and oe-devel sepa=
rate</div><div>(21:23:47) RP__: fray: agreed</div><div>(21:24:03) RP__: khe=
m: no, I think we need to separate oe-core as it is now</div><div>(21:24:12=
) RP__: one place where all oe-core changes/patches go</div>


<div>(21:24:15) RP__: clear separation</div><div>(21:24:16) fray: for now, =
I think oe-core is needed still..</div><div>(21:24:26) stefan_schmidt: RP__=
: I was thinking about these lines. I don&#39;t want to push it. Just want =
to let people know that we may drop it due to lack of interest</div>


<div>(21:24:29) RP__: which brings up a topic I wanted to raise - the bitba=
ke mailing list</div><div>(21:24:37) fray: if and when dev is locked down a=
nd email dies down.. then we can consolodate</div><div>(21:24:53) khem: fra=
y: yes</div>


<div>(21:25:02) RP__: should we move the bitbake list from berlios where no=
body can find it onto linux2go? or onto yocto?</div><div>(21:25:09) RP__: a=
t the moment people don&#39;t use it as the email lags badly on it</div>


<div>(21:25:21) fray: RP__ --yes--</div><div>(21:25:24) khem: RP__: yes <a =
href=3D"http://oe.org" target=3D"_blank">oe.org</a> would be ok</div><div>(=
21:25:30) stefan_schmidt: RP__: is it the last item on berlios?</div><div>

(21:25:32) fray: I&#39;d love it to be on <a href=3D"http://oe.org" target=
=3D"_blank">oe.org</a></div>
<div>(21:25:39) RP__: stefan_schmidt: bitbake releases are there too</div><=
div>(21:25:50) stefan_schmidt: RP__: hmm, ok</div><div>(21:25:51) ***RP__ t=
hinks we should move the mailing list urgently though</div><div>(21:26:16) =
RP__: so who can admin mailing lists and setup a bitbake one on <a href=3D"=
http://oe.org" target=3D"_blank">oe.org</a>?</div>


<div>(21:26:39) stefan_schmidt: I don&#39;t have much of an opinion here, b=
ut if people that use it more have problems these should be fixed</div><div=
>(21:26:40) koen: &#39;bitbake&#39; is ok for the name?</div><div>(21:26:46=
) khem: mailman on ltg needs updated too or fixed. It given wrong thread vi=
ews</div>


<div>(21:26:52) RP__: koen: I don&#39;ts ee why not</div><div>(21:26:54) fr=
ay: koen, ya, I would like &quot;bitbake&quot; as the name</div><div>(21:27=
:00) RP__: or bitbake-devel?</div><div>(21:27:07) RP__: its currently bitba=
ke-dev I think</div>


<div>(21:27:19) khem: well given our convention -devel is logical</div><div=
>(21:27:43) fray: no objection..</div><div>(21:27:52) RP__: Anyhow, I think=
 moving it would help people find it and enable more bitbake discussion in =
the right place</div>


<div>(21:28:06) RP__: no objections?</div><div>(21:28:12) khem: RP__: will =
it also involve moving archives</div><div>(21:28:25) koen: I&#39;m looking =
at the form now</div><div>(21:28:33) RP__: khem: yes, and inviting subscrib=
ers to the new list and making the old one read-only</div>


<div>(21:28:41) khem: RP__: ok</div><div>(21:28:45) khem: I support that</d=
iv><div>(21:29:17) stefan_schmidt: no objection from me</div><div>(21:29:38=
) koen: bitbake or bitbake-devel?</div><div>(21:30:22) khem: one think that=
 I was seeing is that lot of people have different boards and they are curr=
ently supported in oe now they need machine layers on top of oe-core</div>


<div>(21:30:45) khem: they are not supported by vendors per say</div><div>(=
21:31:00) khem: where to host them we need something like meta-machiens</di=
v><div>(21:31:00) ***RP__ proposes bitbake-devel</div><div>(21:31:24) khem:=
 yes bitbake-devel is fine on ml</div>


<div>(21:31:24) RP__: khem: Could that not be a directory in meta-oe?</div>=
<div>(21:31:50) khem: RP__: yes it could be</div><div>(21:32:11) khem: so s=
hould we create another layer under meta-openembedded</div><div>(21:32:29) =
khem: meta-machines ?</div>


<div>(21:32:32) khem: or some such</div><div>(21:32:38) fray: I think it de=
pends on if we&#39;re trying to build up meta-oe -- or if we&#39;re trying =
to provide examples for new people doing work</div><div>(21:32:43) RP__: I =
think that makes sense atm</div>


<div>(21:32:56) fray: if examples and new work is the goal, then new layers=
 (even if they&#39;re under meta-oe) is the right approach...</div><div>(21=
:33:04) RP__: I think meta-oe needs to grow some of this stuff initially th=
en things can split out as needed</div>


<div>(21:33:10) fray: if we&#39;re just trying to move things forward from =
dev, then meta-oe is the &quot;obvious&quot; answer to me</div><div>(21:33:=
14) khem: agreed</div><div>(21:33:21) fray: RP__ ya, thats kind of what I&#=
39;m thinking as well..</div>


<div>(21:33:28) fray: we need machine layer examples.. but it may still be =
premature</div><div>(21:34:12) khem: RP__: should it be general layer meta-=
misc-machines</div><div>(21:34:22) khem: or like meta-&lt;machine&gt;</div>


<div>(21:34:30) khem: I guess general</div><div>(21:34:38) RP__: probably g=
eneral</div><div>(21:34:42) khem: ok</div><div>(21:34:45) RP__: we can go t=
oo far with splitting things up</div><div>(21:34:51) koen: I really don&#39=
;t want machines in the meta-oe repo</div>


<div>(21:34:56) khem: thats what I =A0was guessing</div><div>(21:34:57) fra=
y: ya.. =A0I&#39;m a bit worried about the &quot;over splitting&quot;</div>=
<div>(21:35:04) khem: right now I have almost 10 layers</div><div>(21:35:11=
) khem: for building 2 distros and 4 machines</div>


<div>(21:35:12) fray: koen, I think we need to have some... all of them, li=
kely not..</div><div>(21:35:14) khem: :)</div><div>(21:35:47) RP__: koen: I=
 think it is ok as long as they are split out and enabled separately</div>


<div>(21:35:49) fray: khem, my experience with layers (before oe) is that a=
round 10 is manageable.. more starts to get confusing</div><div>(21:37:55) =
koen: let me put it another way</div><div>(21:38:01) RP__: ok, is there any=
thing else we need to talk about?</div>


<div>(21:38:10) koen: if it lives in the meta-oe repo, I&#39;m not going to=
 maintain that machine layer</div><div>(21:38:45) RP__: koen: I think that =
is ok, we just need to define areas of ownership</div><div>(21:39:22) fray:=
 koen, I think that needs to be part of the readme in the meta-oe.. =A0ther=
e is layer and component maintainers..</div>


<div>(21:39:34) fray: IMHO it&#39;s perfectly acceptable to define multiple=
 owners/maintainers</div><div>(21:40:12) khem: koen: we need those machines=
 somewhere to get users using new setup for their familiar machine</div>


<div>(21:40:52) koen: paulE is picking up the handhelds stuff</div><div>(21=
:41:06) koen: meta-smartphones has the phones</div><div>(21:41:18) koen: me=
ta-slug has the slug</div><div>(21:41:22) khem: koen: will they under meta-=
openembedded =A0?</div>


<div>(21:41:26) koen: meta-ti has the animals</div><div>(21:41:49) fray: is=
 the real issue that people don&#39;t know where to look for the machines?<=
/div><div>(21:42:11) koen: I think so</div><div>(21:43:09) koen: there aren=
&#39;t a whole lot of useful machines left in .dev that aren&#39;t in a lay=
er already</div>


<div>(21:43:20) koen: (or have a layer planned, e.g. gumstix)</div><div>(21=
:43:31) fray: and I definitely want to avoid moving machines nobody is goin=
g to use.. its the few remainers that concerns me</div><div>(21:44:27) fray=
: As a TSC, would it be reasonable to state.. the preferred way of doing th=
is is a &quot;machine&quot; layer.. one that contaisn on or more related am=
chines..</div>


<div>(21:44:45) fray: in the event a machine layer will not be created, it =
can go into meta-oe, but requires a named maintainer for the minimal functi=
onality?</div><div>(21:45:05) koen: right</div><div>(21:45:24) RP__: all pi=
eces of meta-oe need clearly named maintainers or groups of maintainers and=
 a defined way they make decisions</div>


<div>(21:45:40) khem: correct</div><div>(21:45:50) khem: no unmaintained ma=
chine is coming over thats clear</div><div>(21:46:00) fray: I&#39;m willing=
 to ratify that.. :)</div><div>(21:46:10) ***RP__ checked with Chris and he=
&#39;s fine with the bitbake list move btw</div>


<div>(21:46:30) koen: sweet</div><div>(21:46:43) khem: koen: how will angst=
rom propose the machines it supports</div><div>(21:47:06) khem: koen: angst=
rom-scripts is geared to ti machines mainly ATM</div><div>(21:47:13) koen: =
right</div>


<div>(21:47:19) koen: no more machine layers around</div><div>(21:47:29) ko=
en: till I found meta-smartphone today</div><div>(21:47:49) khem: ok so you=
 will take them as they come and support angstrom ?</div><div>(21:47:53) kh=
em: right</div>


<div>(21:48:08) koen: depends on people willing to support them for angstro=
m</div><div>(21:48:20) khem: ok</div><div>(21:49:12) ***stefan_schmidt feel=
s we have covered all topics</div><div>(21:49:20) koen: it will be influenc=
ed by <a href=3D"http://narcissus.angstrom-distribution.org/stats.php" targ=
et=3D"_blank">http://narcissus.angstrom-distribution.org/stats.php</a> :)</=
div>


<div>(21:49:20) khem: ok</div><div>(21:49:22) ***RP__ thinks so</div><div>(=
21:49:24) stefan_schmidt: Anything important left? I&#39;m tired today...</=
div><div>(21:49:26) fray: yup</div><div>(21:49:31) RP__: Shall we close up?=
</div>


<div>(21:49:35) khem: yes</div><div>(21:49:36) fray: o with me</div><div>(2=
1:49:40) RP__: Any ARs we need to capture?</div><div>(21:49:49) ***RP__ wil=
l look at migrating the bitbake mailing list</div><div>(21:49:51) khem: RP_=
_: you should push the TMPDIR append patch</div>


<div>(21:49:58) RP__: thanks to koen putting the basics in place</div><div>=
(21:50:02) khem: it worked well here</div><div>(21:50:03) stefan_schmidt: R=
P__: only the one for me sending a mail wrt release</div><div>(21:50:36) RP=
__: Ok, thats it folks, meeting closed :)</div>


<div>(21:50:46) RP__: thanks all :)</div><div>(21:50:50) khem: bye</div><di=
v>(21:51:03) RP__: khem: and yes, I need to take that patch and some others=
</div><div>(21:51:10) stefan_schmidt: night all</div><div>(21:51:14) RP__: =
see above, I&#39;m lagging atm, will catch up tomorrow</div>


<div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/blog" ta=
rget=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Community Manag=
er @Intel <a href=3D"http://yoctoproject.org" target=3D"_blank">http://yoct=
oproject.org</a></div>


<br>
</div>
</div><br><br clear=3D"all"><br>-- <br>Jeff Osier-Mixon <a href=3D"http://j=
efro.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Projec=
t Community Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_b=
lank">http://yoctoproject.org</a></div>

<br>

--20cf301d42a2274e5f04a5149795--
