Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RnCZa-0007Ck-EF; Tue, 17 Jan 2012 18:11:50 +0100
Received: by iabz21 with SMTP id z21so3351093iab.6
	for <multiple recipients>; Tue, 17 Jan 2012 09:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=ErW/9S99Z56G0lXTRXw/v5AShM7WRCg2rCKNZb5JIOo=;
	b=iywKLrr3Hux+M6pSjXLdiK7EeK3/tHSnJyJIBNiA+ZQLeKXDWy4jn4I/FPcEsCJU9N
	5CBT6/B/murwtAeSYV2ikmHz5RPUfj2pblsohe/NsPYlxOA5S4Gj00JQ7XLa4YkTdG1B
	peR0XnLyIDoGWI+8JNU/8h3ptSFrypMGsFSDM=
MIME-Version: 1.0
Received: by 10.50.15.161 with SMTP id y1mr22107779igc.4.1326819851042; Tue,
	17 Jan 2012 09:04:11 -0800 (PST)
Sender: jefro.net@gmail.com
Received: by 10.50.203.1 with HTTP; Tue, 17 Jan 2012 09:04:10 -0800 (PST)
Date: Tue, 17 Jan 2012 09:04:10 -0800
X-Google-Sender-Auth: MPgRhCy8BT8IvUTnB8L9FrSqY2U
Message-ID: <CA+YB3rbx7stJ35pXVSq9pDxKSujs-Rb400HNJ7NcCVut41nXNQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC Meeting 03-Jan-2012
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
X-List-Received-Date: Tue, 17 Jan 2012 17:11:51 -0000
Content-Type: multipart/alternative; boundary=14dae9340c59e6ff7f04b6bc511c

--14dae9340c59e6ff7f04b6bc511c
Content-Type: text/plain; charset=ISO-8859-1

OE TSC Meeting 03-Jan-2012

Attendees: Paul, Mark, Tom, Richard
Apologies: Khem
Notes: Jefro (not present during meeting)

______________________________________________________________________________________
Agenda & Results

0) Welcome Paul
==> Jefro: update meeting invitation
  [[NOTE: I don't have the invitation on my calendar! is it a zombie?]]

Agree on meeting chair
--> Mark
==> RP to send log to Jefro

psplash - update-alternatives
--> build multiple psplash executables, one for each required image
generally happy with update-alternatives to be used for this purpose

License Field
--> adopting SPDX namespace is reasonable
--> debate between doing a global (oe-core) switch to SPDX namings at this
point or continuing to using mappings to export the SPDX namings..
--> not a compelling reason at this time to
    *) Do a global change
    *) Enable a QA warning
    *) Plan for a QA error
--> nice to create a -disabled- QA class to check this stuff that people
can enable for themselves

DISTRO_FEATURES (
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/10941)
==> continue discussion on main mailing list

Items deferred to next meeting:

Further discussion - trivial patches
Status report on oe-core
Infrastructure
Action Review:
   Khem/Fray: Flagging on wiki for OE version
   Fray: Yocto non-gplv3 testing
   Khem: OE default source mirror

Next meeting: 17-Jan-2012

______________________________________________________________________________________
Raw Transcript

(17:04:08) bluelightning [~paul@pdpc/supporter/professional/bluelightning]
entered the room.
(17:04:14) fray: as Song said on the Yocto call.. we're all still
recovering from the holidays.. ;)
(17:04:23) fray: I'm trying to remember what I was doing prior to
disappearing for a week
(17:04:36) fray: a very nice and relaxing week.. (but I'm ready to "do"
something again)
(17:04:40) bluelightning: hi guys
(17:04:46) fray: welcome..
(17:04:56) fray: (if there is a meeting today) this is your first meeting
then?
(17:05:06) bluelightning: it would be yes :)
(17:06:24) fray: I think we technically have enough for a quorum.. but I'm
not sure it makes sense to meet..
(17:06:57) bluelightning: I do have some issues to raise but I think it
would be better if there were more people to discuss them
(17:07:23) Tartarus [trini@pixelshelf.com] entered the room.
(17:07:24) mode (+v Tartarus) by ChanServ
(17:07:31) Tartarus: So I guess there is one this week, heh
(17:07:32) fray: ok.. pinging Tom worked.. ;)
(17:07:45) fray: I just pinged Khem as well
(17:08:51) mode (+v bluelightning) by ChanServ
(17:09:04) RP__: welcome to the TSC bluelightning! :)
(17:09:12) bluelightning: RP__: thanks :)
(17:09:12) Tartarus: Yes, welcome bluelightning!
(17:09:39) bluelightning: is there anything I need to know right now? I
guess I need to join the mailing list?
(17:11:05) Tartarus: yeah, join the ML
(17:11:11) fray: yup.. that is pretty much it..
(17:11:13) Tartarus: And I guess we need to get jefro to update the
calendar invite
(17:11:25) fray: ahh yes..
(17:12:09) RP__: bluelightning: we're currently meeting at this time for an
hour once every other week
(17:12:28) RP__: We're been missing Jefro recently as I'm not sure he can
make this time due to a conflict :(
(17:12:40) fray: ya.. :(
(17:13:18) RP__: bluelightning: what's your preferred address for the tsc
list?
(17:13:35) bluelightning: RP__: @linux.intel one
(17:13:45) RP__: bluelightning: ok, I'll sub you
(17:13:49) bluelightning: RP__: thanks
(17:14:35) RP__: bluelightning: you should be on it now
(17:14:50) RP__: So, agenda?
(17:14:59) RP__: I think everyone is recovering after the holidays :/
(17:15:24) Tartarus: Yeah
(17:16:09) RP__: bluelightning: FWIW, we normally come up with an agenda
and then run through it
(17:16:24) RP__: bluelightning: did you have some topics you wanted to
bring up?
(17:16:32) bluelightning: RP__: yes I had a couple
(17:17:21) bluelightning: the first was what to do about psplash, whether
we should use the update-alternatives method that a couple of people seem
to like
(17:18:42) RP__: 1) Agree on meeting chair
(17:18:42) RP__: 2) psplash - update-alternatives
(17:18:42) RP__: 3) Status report on oe-core
(17:18:42) RP__: 4) Infrastructure
(17:19:02) RP__: Beth also wanted me to bring up license fields
(17:19:05) fray: (action items from the last meeting)
(17:19:15) bluelightning: the second was to try to move forward on the
issue of DISTRO_FEATURES expansion
(17:20:18) RP__: http://www.openembedded.org/wiki/TSC
(17:20:33) RP__: bluelightning: expansion? you mean extending the list?
(17:20:56) RP__: fray: were there any?
(17:20:58) bluelightning: RP__: yes, avoiding pain for distro maintainers
(17:21:25) RP__:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014563.html
(17:21:30) fray: khem and I to talk to the person who suggested the
flagging on the wiki
(17:21:43) fray: (quick update, I don't believe that has happened, so it's
still a TODO)
(17:21:49) RP__: and we ran out of time on the trivial patch discussion
(17:22:01) fray: ahh yes
(17:22:03) bluelightning: RP__:
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/10941
(17:22:13) bluelightning: last msg is where we're currently at
(17:22:32) bluelightning: am happy to continue the discussion to the
mailing list as long as someone responds
(17:22:37) RP__: bluelightning: did you read the TSC discussion on this?
(17:22:53) RP__: bluelightning: I can't remember where we left off :(
(17:23:06) bluelightning: RP__: I believe I did at the time but I might
need to refresh my memory
(17:23:18) fray: ohh my other action from last meeting..  Check on the
status of non GPLv3 testing..
(17:23:23) RP__: ok, does a meeting make sense today given where we are at?
(17:23:41) fray: there is a test run -- but there is some kind of error so
it's not being run regularly (or it is an is erroring)..
(17:23:49) fray: RP__ yes I think so
(17:25:29) ***RP__ is putting a better agenda together
(17:26:37) RP__: Agree on meeting chair
(17:26:37) RP__: psplash - update-alternatives
(17:26:37) RP__: License Field
(17:26:37) RP__: DISTRO_FEATURES (
http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/10941)
(17:26:37) RP__: Further discussion - trivial patches
(17:26:37) RP__: Status report on oe-core
(17:26:37) RP__: Infrastructure
(17:26:37) RP__: Action Review:
(17:26:37) RP__:   Khem/Fray: Flagging on wiki for OE version
(17:26:37) RP__:   Fray: Yocto non-gplv3 testing
(17:26:37) RP__:   Khem: OE default source mirror
(17:27:03) RP__: anyone want to chair?
(17:27:18) fray: I can if you want
(17:27:22) RP__: bluelightning: we're normally better organised than this,
sorry
(17:27:31) bluelightning: RP__: no worries :)
(17:27:33) RP__: fray: ok :)
(17:27:33) fray: (truely we are)  ;)
(17:27:48) fray: ok.. so item 1, meeting chair done.. (just to verify,
someone is capturing the log to send to Jefro?)
(17:27:55) ***RP__ will do so
(17:28:07) fray: ok.. item 2.. psplash -- bluelightning?
(17:28:57) bluelightning: so it would be nice if we could make it easy to
customise the psplash within distro/other customisation layers
(17:29:36) fray: the issue as I understand it, how to provide the one file
that includes the image correct?
(17:29:46) bluelightning: fray: kind of
(17:29:58) fray: the file itself is compiled in?  or loaded at runtime?
(17:30:03) RP__: fray: I think some people want to have multiple psplash
recipes for the different images
(17:30:07) bluelightning: it's compiled in, that makes it a little tricky
(17:30:09) bluelightning: when it was discussed on the mailing list koen
proposed we use his scheme which uses update-alternatives to switch between
psplash executables
(17:30:10) RP__: fray: compiled in
(17:30:12) fray: ok
(17:30:36) fray: my concern with u-a is that it still requires you to have
a custom (set) of psplash executables..
(17:30:37) bluelightning: personally I think update-alternatives is a
little bit of an overkill for something where only one ought to be
installed into an image
(17:30:45) fray: it almost sounds like we need a combination of the two..
(17:31:04) RP__: allowing the default psplash header to be overridden
easily would certainly be an improvement
(17:31:05) fray: one, a simple way to specify one (or more) image files..
and then a u-a to specify the "right" one to use
(17:31:22) bluelightning: RP__: my patch did improve that slightly
(17:31:29) fray: if given a set of splash files -- it should fairly easy to
iterate over them, I'd hope
(17:31:36) fray: then use the order to specify the u-a...
(17:32:00) fray: (I understand why koen wants multiple splash files.. I've
had similar customer requests in the past)
(17:32:04) RP__: The question is whether u-a makes sense for psplash
(17:32:23) bluelightning: fray: can you articulate the use case?
(17:32:30) fray: example.. one radio created for a car maker who has
multiple brands..  when the radio is first initialized it detects the brand
and selects the correct splash
(17:33:05) bluelightning: fray: hmm, but the same image is used for all of
those brands? no other customisation?
(17:33:09) fray: correct
(17:33:25) bluelightning: have to say I'm surprised, but fair enough
(17:33:49) fray: some image.. everything is controled by settings within
the radio that are determined based on initial "programming" of radio
settings when either first powered up -- or installed in the vehicle
(17:34:12) fray: (this is common today with the "MyGig" radios that
Chrysler uses..  not they do NOT run Linux...)
(17:34:50) bluelightning: fray: ok, so the determining setting is something
that might come from a boot parameter? or some location in nvram?
(17:35:20) fray: ...short answer -- yes
(17:35:45) bluelightning: just trying to figure out how we can make this
useful in the context of OE-core
(17:35:50) fray: the FS would contain all of the branded components, and it
would be selected prior to the customer getting it -- but that doesnt
change the contents of hte disk
(17:36:07) RP__: The question is whether u-a would provide for the variety
of ways in which people might want to customise things or are we better off
keeping out of this for OE-Core
(17:36:09) fray: I think best way is select a set of branded files -- and
then use the u-a..
(17:36:14) fray: anything beyond that gets to be very custom
(17:37:21) bluelightning: so psplash needs to be modified to read a
separate file for the image?
(17:37:48) RP__: There is next to no code in pslash
(17:37:55) fray: What I'm thinking is that we build multiple psplash
exectuables -- for each image
(17:37:59) fray: ('er.. graphic)
(17:38:18) fray: then dynamically package them into seperate packages using
u-a to set the order..
(17:38:36) RP__: Tartarus: any thoughts?
(17:38:45) Tartarus: nope
(17:38:46) fray: then the user could simply set something that says
"SPLASHFILE = file://foo1 file://foo2 ... file://fooN"
(17:38:58) bluelightning: hmm ok, that shouldn't be too tricky
(17:39:14) fray: then leave the default alone w/ oe branding and it's easy
to rebrand
(17:39:51) bluelightning: ok, so we're generally happy with u-a being used
for this?
(17:40:16) RP__: bluelightning: reluctantly
(17:40:17) fray: I think this is one of the cases where it makes sense
(17:40:25) bluelightning: ok
(17:40:26) fray: (it's overkill for most users though)
(17:40:31) RP__: you can make a case for u-a anywhere
(17:41:14) bluelightning: ok thanks guys
(17:41:33) RP__: so license fields - Did anyone read Beth's proposals?
(17:41:57) RP__: The question is what to do about the LICENSE field - do we
encourage any standardisation
(17:42:00) fray: yes -- I think it's good... I expect corner cases.. but
the obvious ones have likely been flushed out
(17:42:23) fray: I think we need to encourage it.  If SPDX is the standard
naming we choose.. then we use that + an alternative namespace for thins
that don't "fit"
(17:42:34) RP__: I'd suggest the answer is yes, we'd like to see
standardisation but I'd propose we adopt SPDX with the addition that we map
"v" to "-"
(17:42:56) RP__: So we don't have to change all our GPLv2 to GPL-2
(17:43:06) Tartarus: Well
(17:43:19) Tartarus: Might that not be a pain to want now, for other
benefits?
(17:43:20) fray: I was expecting we'd have a pass over everything.. and
then warn for things that don't match a known name..
(17:43:29) Tartarus: Or no, SPDX using tools won't be groking these files?
(17:43:30) fray: Tartarus thats my current thinking..
(17:43:47) fray: Tartarus SPDX tooling won't directly grok recipes.. those
are ours..
(17:44:04) fray: SPDX tooling will need an XML SPDX file to grok.. one that
we can point to via the recipe..
(17:44:17) RP__: Any time we pass something to SPDX tools the v to -
mapping is straightforward
(17:44:30) fray: (and at some point, I'd expect we're going to want to
mandate the inclusion of such files.. but until the tooling exists.. there
is nothing to mandate)
(17:44:52) Tartarus: OK, so, continuing down the devils advocate path
(17:45:05) Tartarus: is there a reason other than not wanting to change a
bunch of files?
(17:45:09) fray: teh place where mapping would be needed is validation
tools.. things that read in the SPDX data (once it exists) and compares our
source/binary package declarations vs what the SPDX file says
(17:45:23) Tartarus: bikeshedding and all that, SPDX chose - for a reason
(17:45:42) Tartarus: Maybe we should just say we're adopting their standard
(with "+ for stuff that doesn't fit")
(17:45:52) Tartarus: rather than adopting except we like vN not -N
(17:46:21) fray: The discussion Paul and I and Beth have had on the mailing
list is:
(17:46:34) fray: SPDX naming w/ && and || designations..
(17:46:34) RP__: Tartarus: I just hate the idea of forcing users to update
metadata everywhere for a "v" to "-" change
(17:46:54) RP__: Tartarus: I don't mind other bits and cleaning up licenses
in general but that change seems more annoying than useful
(17:46:57) fray: along with an alternative namespace for things that don't
fit.. such as "other:Adobe:Reader"
(17:47:05) fray: prefix:company:license"
(17:47:34) RP__: Tartarus: its easier for people to spend time changing
metadata if there is a clear benefit to it
(17:48:15) fray: ya.. we still havn't hit the clear benefit area.. but I
expect there to be one
(17:48:20) Tartarus: Right, so I'm saying the clear benefit is "follow the
standard"
(17:48:41) Tartarus: Yeah, we could just fix it up in our export tool
(17:48:43) fray: by itself.. the change will do nothing since we don't
(yet) having tooling beyond white/black list -- correct?
(17:48:56) RP__: Tartarus: Is there any reason the - won't work or would
cause confusion?
(17:49:07) RP__: fray: correct
(17:49:43) Tartarus: RP__: The - or the v ?  My assumption is that the SPDX
folks already spent hour arguing v vs - and came to a conclusion that - is
best
(17:49:48) fray: I'm worried about the confusion bit mysel..
(17:49:52) Tartarus: I personally like LICvN
(17:50:24) bluelightning: I have to say I do too, but for none other than
aesthetic reasons
(17:50:24) RP__: Tartarus: personally I do to...
(17:50:55) fray: (I'm quickly skimming to see if there is anything noted
beyond aestetics)
(17:51:01) RP__: I've been around a few flag day type changes before for OE
and I just find them painful every time
(17:51:27) RP__: I appreciate this isn't quite a flag day but the only want
to do it is for people to start seeing tons of hard errors :(
(17:51:29) fray: they call what we're discussing the "SPDX License List
short form identifier"
(17:51:30) Tartarus: If the answer is that no, we don't see using SPDX
names as-is is enough of a benefit to do the search and replace then OK,
we'll just not do it until there is a clear benefit, other than just using
the standard
(17:52:07) fray: can I propose that we suggest future packages following
this SPDX License List short form identifies names.. :)
(17:52:18) RP__: I think mapping against their license types and building
up a standard for the LICENSE field is a good thing and there is a benefit
there
(17:52:25) fray: and at some point we validate and warn..  then we can
error if/when the tooling makes it reasonable?
(17:52:34) RP__: but mapping 1:1 with their names, I'm seeing no strong
reason for
(17:52:51) RP__: fray: don't warn unless we're going to force a switch
(17:53:03) RP__: we have way more important warning messages to fix and
this would drown them out
(17:53:07) fray: RP__ yes.. I meant that as a precursor to a switch, some
time in the future..
(17:53:17) fray: I wouldn't mind a (disabled) QA test now though
(17:53:18) ***RP__ wishes people would pay attention to warning messages
(17:53:19) Tartarus: I'd suggest that at some point we'll have people
writing recipes that have SPDX info and we'll see 'incorrect' LICENSE
fields? :)
(17:53:58) RP__: I'd like to see a list of known types we accept in the
field
(17:54:00) bluelightning: I think we already have SPDX naming mixed in
don't we?
(17:54:07) RP__: bluelightning: we do
(17:54:14) fray: FYI.. it simply states the identifier and version number
should be separated by a "-"
(17:54:28) fray: so they are using that to indicate a parsing point but
that is all I see
(17:54:40) fray: FYI it's Appendix I on the spdx-1.0 specification
(17:54:57) fray: so they have GPL-2.0 and GPL-2.0+  later meaning that
version or greater
(17:54:59) RP__: fray: right, its likely so you can automatically split the
version from the main license
(17:55:14) bluelightning: aha, that would make sense
(17:55:15) fray: they also have things like GPL-3.0-with-GCC-exception
(17:55:27) RP__: and we support GPLv2 GPLv2.0 (with + variants)
(17:55:41) RP__: fray: I think we've started adopting those
(17:55:59) fray: ya.. if we did this (even w/ v = -)  then GPLv2 is
invalid..
(17:56:19) RP__: fray: We currently have a mapping table
(17:56:29) fray: ya.. I would expect we'll need to continue to have that
(17:56:38) fray: perhaps the mappign table is the right way to do the v ->
-?
(17:56:45) fray: then ask people to switch to -?
(17:56:52) RP__: fray:
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/license.bbclass
(17:57:13) fray: ahh yes I see..
(17:57:40) fray: ok.. so do we have a conclusion on this topic?
(17:58:13) fray: I'll summarize what I see then...
(17:58:29) fray: We still think SPDX naming and what Beth is proposing is
reasonable..
(17:58:58) fray: There is debate between doing a global (oe-core) switch to
SPDX namings at this point or continuing to using mappings to export the
SPDX namings..
(17:59:23) fray: other then risk of confusion, there is not a compelling
reason at this time to *) Do a global change  *) Enable a QA warning  *)
Plan for a QA error
(17:59:42) fray: (it might be nice to create a -disabled- QA class to check
this stuff that people can enable for themselves)
(17:59:50) fray: do you agree?  did I miss anything?
(18:00:28) Tartarus: Sounds right
(18:00:45) fray: Ok.. so Beth is on the right track, we're non-commital
beyond that for now.. and we should keep monitoring..
(18:00:59) fray: ok.. it's 12 (central)..  Do we want to continue or do we
need to call it?
(18:01:14) ***RP__ has to be somewhere else now :(
(18:01:24) fray: ok.. then we'll call it and defer the other items..
(18:01:36) bluelightning: sounds OK to me
(18:01:37) fray: if any of the items are pressing we should call a meeting
for next week -- otherwise next meeting in 2
(18:01:52) RP__: I don't think we did much with the action items :(
(18:02:09) RP__: status of OE-Core hasn't changed much over the holidays
(18:02:22) fray: agreed
(18:02:24) RP__: DISTRO_FEATURES is the main pressing item
(18:02:37) RP__: I'd suggest we try and continue that on the maining list
(18:02:48) RP__: maybe we can all try and have more discussion on that
topic there?
(18:02:51) fray: ok.. sounds good to me..
(18:02:56) bluelightning: agreed, hopefully with people coming back from
holiday they will be able to respond
(18:03:18) RP__: sounds like a plan
(18:03:28) RP__: so meeting in a fortnight?
(18:03:37) fray: yup -- unless we decide otherwise
(18:03:40) bluelightning: yep
(18:03:41) fray: (via mailing list)
(18:03:44) RP__: right
(18:03:58) ***RP__ sends the log to jefro

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--14dae9340c59e6ff7f04b6bc511c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse:collapse;color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px"><div>OE TSC Meetin=
g 03-Jan-2012</div><div><br></div><div>Attendees: Paul, Mark, Tom, Richard<=
/div>
<div>Apologies: Khem</div><div>Notes: Jefro (not present during meeting)</d=
iv><div><br></div><div>____________________________________________________=
__________________________________</div><div>Agenda &amp; Results</div>
<div><br></div><div>0) Welcome Paul</div><div>=3D=3D&gt; Jefro: update meet=
ing invitation</div><div>=A0 [[NOTE: I don&#39;t have the invitation on my =
calendar! is it a zombie?]]</div><div><br></div><div>Agree on meeting chair=
</div>
<div>--&gt; Mark</div><div>=3D=3D&gt; RP to send log to Jefro</div><div><br=
></div><div>psplash - update-alternatives</div><div>--&gt; build multiple p=
splash executables, one for each required image</div><div>generally happy w=
ith update-alternatives to be used for this purpose</div>
<div><br></div><div>License Field</div><div>--&gt; adopting SPDX namespace =
is reasonable</div><div>--&gt; debate between doing a global (oe-core) swit=
ch to SPDX namings at this point or continuing to using mappings to export =
the SPDX namings..</div>
<div>--&gt; not a compelling reason at this time to=A0</div><div>=A0 =A0 *)=
 Do a global change =A0</div><div>=A0 =A0 *) Enable a QA warning =A0</div><=
div>=A0 =A0 *) Plan for a QA error</div><div>--&gt; nice to create a -disab=
led- QA class to check this stuff that people can enable for themselves</di=
v>
<div><br></div><div>DISTRO_FEATURES (<a href=3D"http://comments.gmane.org/g=
mane.comp.handhelds.openembedded.core/10941" target=3D"_blank" style=3D"col=
or:rgb(17,85,204)">http://comments.gmane.org/gmane.comp.handhelds.openembed=
ded.core/10941</a>)</div>
<div>=3D=3D&gt; continue discussion on main mailing list</div><div><br></di=
v><div>Items deferred to next meeting:</div><div><br></div><div>Further dis=
cussion - trivial patches</div><div>Status report on oe-core</div><div>Infr=
astructure</div>
<div>Action Review:</div><div>=A0 =A0Khem/Fray: Flagging on wiki for OE ver=
sion</div><div>=A0 =A0Fray: Yocto non-gplv3 testing</div><div>=A0 =A0Khem: =
OE default source mirror</div><div><br></div><div>Next meeting: 17-Jan-2012=
</div><div>
<br></div><div>____________________________________________________________=
__________________________</div><div>Raw Transcript</div><div><br></div><di=
v>(17:04:08) bluelightning [~paul@pdpc/supporter/professional/bluelightning=
] entered the room.</div>
<div>(17:04:14) fray: as Song said on the Yocto call.. we&#39;re all still =
recovering from the holidays.. ;)</div><div>(17:04:23) fray: I&#39;m trying=
 to remember what I was doing prior to disappearing for a week</div><div>
(17:04:36) fray: a very nice and relaxing week.. (but I&#39;m ready to &quo=
t;do&quot; something again)</div><div>(17:04:40) bluelightning: hi guys</di=
v><div>(17:04:46) fray: welcome..</div><div>(17:04:56) fray: (if there is a=
 meeting today) this is your first meeting then?</div>
<div>(17:05:06) bluelightning: it would be yes :)</div><div>(17:06:24) fray=
: I think we technically have enough for a quorum.. but I&#39;m not sure it=
 makes sense to meet..</div><div>(17:06:57) bluelightning: I do have some i=
ssues to raise but I think it would be better if there were more people to =
discuss them</div>
<div>(17:07:23) Tartarus [<a href=3D"mailto:trini@pixelshelf.com" target=3D=
"_blank" style=3D"color:rgb(17,85,204)">trini@pixelshelf.com</a>] entered t=
he room.</div><div>(17:07:24) mode (+v Tartarus) by ChanServ</div><div>(17:=
07:31) Tartarus: So I guess there is one this week, heh</div>
<div>(17:07:32) fray: ok.. pinging Tom worked.. ;)</div><div>(17:07:45) fra=
y: I just pinged Khem as well</div><div>(17:08:51) mode (+v bluelightning) =
by ChanServ</div><div>(17:09:04) RP__: welcome to the TSC bluelightning! :)=
</div>
<div>(17:09:12) bluelightning: RP__: thanks :)</div><div>(17:09:12) Tartaru=
s: Yes, welcome bluelightning!</div><div>(17:09:39) bluelightning: is there=
 anything I need to know right now? I guess I need to join the mailing list=
?</div>
<div>(17:11:05) Tartarus: yeah, join the ML</div><div>(17:11:11) fray: yup.=
. that is pretty much it..</div><div>(17:11:13) Tartarus: And I guess we ne=
ed to get jefro to update the calendar invite</div><div>(17:11:25) fray: ah=
h yes..</div>
<div>(17:12:09) RP__: bluelightning: we&#39;re currently meeting at this ti=
me for an hour once every other week</div><div>(17:12:28) RP__: We&#39;re b=
een missing Jefro recently as I&#39;m not sure he can make this time due to=
 a conflict :(</div>
<div>(17:12:40) fray: ya.. :(</div><div>(17:13:18) RP__: bluelightning: wha=
t&#39;s your preferred address for the tsc list?</div><div>(17:13:35) bluel=
ightning: RP__: @linux.intel one</div><div>(17:13:45) RP__: bluelightning: =
ok, I&#39;ll sub you</div>
<div>(17:13:49) bluelightning: RP__: thanks</div><div>(17:14:35) RP__: blue=
lightning: you should be on it now</div><div>(17:14:50) RP__: So, agenda?</=
div><div>(17:14:59) RP__: I think everyone is recovering after the holidays=
 :/</div>
<div>(17:15:24) Tartarus: Yeah</div><div>(17:16:09) RP__: bluelightning: FW=
IW, we normally come up with an agenda and then run through it</div><div>(1=
7:16:24) RP__: bluelightning: did you have some topics you wanted to bring =
up?</div>
<div>(17:16:32) bluelightning: RP__: yes I had a couple</div><div>(17:17:21=
) bluelightning: the first was what to do about psplash, whether we should =
use the update-alternatives method that a couple of people seem to like</di=
v>
<div>(17:18:42) RP__: 1) Agree on meeting chair</div><div>(17:18:42) RP__: =
2) psplash - update-alternatives</div><div>(17:18:42) RP__: 3) Status repor=
t on oe-core</div><div>(17:18:42) RP__: 4) Infrastructure</div><div>(17:19:=
02) RP__: Beth also wanted me to bring up license fields</div>
<div>(17:19:05) fray: (action items from the last meeting)</div><div>(17:19=
:15) bluelightning: the second was to try to move forward on the issue of D=
ISTRO_FEATURES expansion</div><div>(17:20:18) RP__:=A0<a href=3D"http://www=
.openembedded.org/wiki/TSC" target=3D"_blank" style=3D"color:rgb(17,85,204)=
">http://www.openembedded.org/wiki/TSC</a></div>
<div>(17:20:33) RP__: bluelightning: expansion? you mean extending the list=
?</div><div>(17:20:56) RP__: fray: were there any?</div><div>(17:20:58) blu=
elightning: RP__: yes, avoiding pain for distro maintainers</div><div>(17:2=
1:25) RP__:=A0<a href=3D"http://lists.linuxtogo.org/pipermail/openembedded-=
core/2011-December/014563.html" target=3D"_blank" style=3D"color:rgb(17,85,=
204)">http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/=
014563.html</a></div>
<div>(17:21:30) fray: khem and I to talk to the person who suggested the fl=
agging on the wiki</div><div>(17:21:43) fray: (quick update, I don&#39;t be=
lieve that has happened, so it&#39;s still a TODO)</div><div>(17:21:49) RP_=
_: and we ran out of time on the trivial patch discussion</div>
<div>(17:22:01) fray: ahh yes</div><div>(17:22:03) bluelightning: RP__:=A0<=
a href=3D"http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/=
10941" target=3D"_blank" style=3D"color:rgb(17,85,204)">http://comments.gma=
ne.org/gmane.comp.handhelds.openembedded.core/10941</a></div>
<div>(17:22:13) bluelightning: last msg is where we&#39;re currently at</di=
v><div>(17:22:32) bluelightning: am happy to continue the discussion to the=
 mailing list as long as someone responds</div><div>(17:22:37) RP__: blueli=
ghtning: did you read the TSC discussion on this?</div>
<div>(17:22:53) RP__: bluelightning: I can&#39;t remember where we left off=
 :(</div><div>(17:23:06) bluelightning: RP__: I believe I did at the time b=
ut I might need to refresh my memory</div><div>(17:23:18) fray: ohh my othe=
r action from last meeting.. =A0Check on the status of non GPLv3 testing..<=
/div>
<div>(17:23:23) RP__: ok, does a meeting make sense today given where we ar=
e at?</div><div>(17:23:41) fray: there is a test run -- but there is some k=
ind of error so it&#39;s not being run regularly (or it is an is erroring).=
.</div>
<div>(17:23:49) fray: RP__ yes I think so</div><div>(17:25:29) ***RP__ is p=
utting a better agenda together</div><div>(17:26:37) RP__: Agree on meeting=
 chair</div><div>(17:26:37) RP__: psplash - update-alternatives</div><div>
(17:26:37) RP__: License Field</div><div>(17:26:37) RP__: DISTRO_FEATURES (=
<a href=3D"http://comments.gmane.org/gmane.comp.handhelds.openembedded.core=
/10941" target=3D"_blank" style=3D"color:rgb(17,85,204)">http://comments.gm=
ane.org/gmane.comp.handhelds.openembedded.core/10941</a>)</div>
<div>(17:26:37) RP__: Further discussion - trivial patches</div><div>(17:26=
:37) RP__: Status report on oe-core</div><div>(17:26:37) RP__: Infrastructu=
re</div><div>(17:26:37) RP__: Action Review:</div><div>(17:26:37) RP__: =A0=
 Khem/Fray: Flagging on wiki for OE version</div>
<div>(17:26:37) RP__: =A0 Fray: Yocto non-gplv3 testing</div><div>(17:26:37=
) RP__: =A0 Khem: OE default source mirror</div><div>(17:27:03) RP__: anyon=
e want to chair?</div><div>(17:27:18) fray: I can if you want</div><div>(17=
:27:22) RP__: bluelightning: we&#39;re normally better organised than this,=
 sorry</div>
<div>(17:27:31) bluelightning: RP__: no worries :)</div><div>(17:27:33) RP_=
_: fray: ok :)</div><div>(17:27:33) fray: (truely we are) =A0;)</div><div>(=
17:27:48) fray: ok.. so item 1, meeting chair done.. (just to verify, someo=
ne is capturing the log to send to Jefro?)</div>
<div>(17:27:55) ***RP__ will do so</div><div>(17:28:07) fray: ok.. item 2..=
 psplash -- bluelightning?</div><div>(17:28:57) bluelightning: so it would =
be nice if we could make it easy to customise the psplash within distro/oth=
er customisation layers</div>
<div>(17:29:36) fray: the issue as I understand it, how to provide the one =
file that includes the image correct?</div><div>(17:29:46) bluelightning: f=
ray: kind of</div><div>(17:29:58) fray: the file itself is compiled in? =A0=
or loaded at runtime?</div>
<div>(17:30:03) RP__: fray: I think some people want to have multiple pspla=
sh recipes for the different images</div><div>(17:30:07) bluelightning: it&=
#39;s compiled in, that makes it a little tricky</div><div>(17:30:09) bluel=
ightning: when it was discussed on the mailing list koen proposed we use hi=
s scheme which uses update-alternatives to switch between psplash executabl=
es</div>
<div>(17:30:10) RP__: fray: compiled in</div><div>(17:30:12) fray: ok</div>=
<div>(17:30:36) fray: my concern with u-a is that it still requires you to =
have a custom (set) of psplash executables..</div><div>(17:30:37) bluelight=
ning: personally I think update-alternatives is a little bit of an overkill=
 for something where only one ought to be installed into an image</div>
<div>(17:30:45) fray: it almost sounds like we need a combination of the tw=
o..</div><div>(17:31:04) RP__: allowing the default psplash header to be ov=
erridden easily would certainly be an improvement</div><div>(17:31:05) fray=
: one, a simple way to specify one (or more) image files.. and then a u-a t=
o specify the &quot;right&quot; one to use</div>
<div>(17:31:22) bluelightning: RP__: my patch did improve that slightly</di=
v><div>(17:31:29) fray: if given a set of splash files -- it should fairly =
easy to iterate over them, I&#39;d hope</div><div>(17:31:36) fray: then use=
 the order to specify the u-a...</div>
<div>(17:32:00) fray: (I understand why koen wants multiple splash files.. =
I&#39;ve had similar customer requests in the past)</div><div>(17:32:04) RP=
__: The question is whether u-a makes sense for psplash</div><div>(17:32:23=
) bluelightning: fray: can you articulate the use case?</div>
<div>(17:32:30) fray: example.. one radio created for a car maker who has m=
ultiple brands.. =A0when the radio is first initialized it detects the bran=
d and selects the correct splash</div><div>(17:33:05) bluelightning: fray: =
hmm, but the same image is used for all of those brands? no other customisa=
tion?</div>
<div>(17:33:09) fray: correct</div><div>(17:33:25) bluelightning: have to s=
ay I&#39;m surprised, but fair enough</div><div>(17:33:49) fray: some image=
.. everything is controled by settings within the radio that are determined=
 based on initial &quot;programming&quot; of radio settings when either fir=
st powered up -- or installed in the vehicle</div>
<div>(17:34:12) fray: (this is common today with the &quot;MyGig&quot; radi=
os that Chrysler uses.. =A0not they do NOT run Linux...)</div><div>(17:34:5=
0) bluelightning: fray: ok, so the determining setting is something that mi=
ght come from a boot parameter? or some location in nvram?</div>
<div>(17:35:20) fray: ...short answer -- yes</div><div>(17:35:45) bluelight=
ning: just trying to figure out how we can make this useful in the context =
of OE-core</div><div>(17:35:50) fray: the FS would contain all of the brand=
ed components, and it would be selected prior to the customer getting it --=
 but that doesnt change the contents of hte disk</div>
<div>(17:36:07) RP__: The question is whether u-a would provide for the var=
iety of ways in which people might want to customise things or are we bette=
r off keeping out of this for OE-Core</div><div>(17:36:09) fray: I think be=
st way is select a set of branded files -- and then use the u-a..</div>
<div>(17:36:14) fray: anything beyond that gets to be very custom</div><div=
>(17:37:21) bluelightning: so psplash needs to be modified to read a separa=
te file for the image?</div><div>(17:37:48) RP__: There is next to no code =
in pslash</div>
<div>(17:37:55) fray: What I&#39;m thinking is that we build multiple pspla=
sh exectuables -- for each image</div><div>(17:37:59) fray: (&#39;er.. grap=
hic)</div><div>(17:38:18) fray: then dynamically package them into seperate=
 packages using u-a to set the order..</div>
<div>(17:38:36) RP__: Tartarus: any thoughts?</div><div>(17:38:45) Tartarus=
: nope</div><div>(17:38:46) fray: then the user could simply set something =
that says &quot;SPLASHFILE =3D file://foo1 file://foo2 ... file://fooN&quot=
;</div>
<div>(17:38:58) bluelightning: hmm ok, that shouldn&#39;t be too tricky</di=
v><div>(17:39:14) fray: then leave the default alone w/ oe branding and it&=
#39;s easy to rebrand</div><div>(17:39:51) bluelightning: ok, so we&#39;re =
generally happy with u-a being used for this?</div>
<div>(17:40:16) RP__: bluelightning: reluctantly</div><div>(17:40:17) fray:=
 I think this is one of the cases where it makes sense</div><div>(17:40:25)=
 bluelightning: ok</div><div>(17:40:26) fray: (it&#39;s overkill for most u=
sers though)</div>
<div>(17:40:31) RP__: you can make a case for u-a anywhere</div><div>(17:41=
:14) bluelightning: ok thanks guys</div><div>(17:41:33) RP__: so license fi=
elds - Did anyone read Beth&#39;s proposals?</div><div>(17:41:57) RP__: The=
 question is what to do about the LICENSE field - do we encourage any stand=
ardisation</div>
<div>(17:42:00) fray: yes -- I think it&#39;s good... I expect corner cases=
.. but the obvious ones have likely been flushed out</div><div>(17:42:23) f=
ray: I think we need to encourage it. =A0If SPDX is the standard naming we =
choose.. then we use that + an alternative namespace for thins that don&#39=
;t &quot;fit&quot;</div>
<div>(17:42:34) RP__: I&#39;d suggest the answer is yes, we&#39;d like to s=
ee standardisation but I&#39;d propose we adopt SPDX with the addition that=
 we map &quot;v&quot; to &quot;-&quot;</div><div>(17:42:56) RP__: So we don=
&#39;t have to change all our GPLv2 to GPL-2</div>
<div>(17:43:06) Tartarus: Well</div><div>(17:43:19) Tartarus: Might that no=
t be a pain to want now, for other benefits?</div><div>(17:43:20) fray: I w=
as expecting we&#39;d have a pass over everything.. and then warn for thing=
s that don&#39;t match a known name..</div>
<div>(17:43:29) Tartarus: Or no, SPDX using tools won&#39;t be groking thes=
e files?</div><div>(17:43:30) fray: Tartarus thats my current thinking..</d=
iv><div>(17:43:47) fray: Tartarus SPDX tooling won&#39;t directly grok reci=
pes.. those are ours..</div>
<div>(17:44:04) fray: SPDX tooling will need an XML SPDX file to grok.. one=
 that we can point to via the recipe..</div><div>(17:44:17) RP__: Any time =
we pass something to SPDX tools the v to - mapping is straightforward</div>
<div>(17:44:30) fray: (and at some point, I&#39;d expect we&#39;re going to=
 want to mandate the inclusion of such files.. but until the tooling exists=
.. there is nothing to mandate)</div><div>(17:44:52) Tartarus: OK, so, cont=
inuing down the devils advocate path</div>
<div>(17:45:05) Tartarus: is there a reason other than not wanting to chang=
e a bunch of files?</div><div>(17:45:09) fray: teh place where mapping woul=
d be needed is validation tools.. things that read in the SPDX data (once i=
t exists) and compares our source/binary package declarations vs what the S=
PDX file says</div>
<div>(17:45:23) Tartarus: bikeshedding and all that, SPDX chose - for a rea=
son</div><div>(17:45:42) Tartarus: Maybe we should just say we&#39;re adopt=
ing their standard (with &quot;+ for stuff that doesn&#39;t fit&quot;)</div=
>
<div>(17:45:52) Tartarus: rather than adopting except we like vN not -N</di=
v><div>(17:46:21) fray: The discussion Paul and I and Beth have had on the =
mailing list is:</div><div>(17:46:34) fray: SPDX naming w/ &amp;&amp; and |=
| designations..</div>
<div>(17:46:34) RP__: Tartarus: I just hate the idea of forcing users to up=
date metadata everywhere for a &quot;v&quot; to &quot;-&quot; change</div><=
div>(17:46:54) RP__: Tartarus: I don&#39;t mind other bits and cleaning up =
licenses in general but that change seems more annoying than useful</div>
<div>(17:46:57) fray: along with an alternative namespace for things that d=
on&#39;t fit.. such as &quot;other:Adobe:Reader&quot;</div><div>(17:47:05) =
fray: prefix:company:license&quot;</div><div>(17:47:34) RP__: Tartarus: its=
 easier for people to spend time changing metadata if there is a clear bene=
fit to it</div>
<div>(17:48:15) fray: ya.. we still havn&#39;t hit the clear benefit area..=
 but I expect there to be one</div><div>(17:48:20) Tartarus: Right, so I&#3=
9;m saying the clear benefit is &quot;follow the standard&quot;</div><div>
(17:48:41) Tartarus: Yeah, we could just fix it up in our export tool</div>=
<div>(17:48:43) fray: by itself.. the change will do nothing since we don&#=
39;t (yet) having tooling beyond white/black list -- correct?</div><div>
(17:48:56) RP__: Tartarus: Is there any reason the - won&#39;t work or woul=
d cause confusion?</div><div>(17:49:07) RP__: fray: correct</div><div>(17:4=
9:43) Tartarus: RP__: The - or the v ? =A0My assumption is that the SPDX fo=
lks already spent hour arguing v vs - and came to a conclusion that - is be=
st</div>
<div>(17:49:48) fray: I&#39;m worried about the confusion bit mysel..</div>=
<div>(17:49:52) Tartarus: I personally like LICvN</div><div>(17:50:24) blue=
lightning: I have to say I do too, but for none other than aesthetic reason=
s</div>
<div>(17:50:24) RP__: Tartarus: personally I do to...</div><div>(17:50:55) =
fray: (I&#39;m quickly skimming to see if there is anything noted beyond ae=
stetics)</div><div>(17:51:01) RP__: I&#39;ve been around a few flag day typ=
e changes before for OE and I just find them painful every time</div>
<div>(17:51:27) RP__: I appreciate this isn&#39;t quite a flag day but the =
only want to do it is for people to start seeing tons of hard errors :(</di=
v><div>(17:51:29) fray: they call what we&#39;re discussing the &quot;SPDX =
License List short form identifier&quot;</div>
<div>(17:51:30) Tartarus: If the answer is that no, we don&#39;t see using =
SPDX names as-is is enough of a benefit to do the search and replace then O=
K, we&#39;ll just not do it until there is a clear benefit, other than just=
 using the standard</div>
<div>(17:52:07) fray: can I propose that we suggest future packages followi=
ng this SPDX License List short form identifies names.. :)</div><div>(17:52=
:18) RP__: I think mapping against their license types and building up a st=
andard for the LICENSE field is a good thing and there is a benefit there</=
div>
<div>(17:52:25) fray: and at some point we validate and warn.. =A0then we c=
an error if/when the tooling makes it reasonable?</div><div>(17:52:34) RP__=
: but mapping 1:1 with their names, I&#39;m seeing no strong reason for</di=
v>
<div>(17:52:51) RP__: fray: don&#39;t warn unless we&#39;re going to force =
a switch</div><div>(17:53:03) RP__: we have way more important warning mess=
ages to fix and this would drown them out</div><div>(17:53:07) fray: RP__ y=
es.. I meant that as a precursor to a switch, some time in the future..</di=
v>
<div>(17:53:17) fray: I wouldn&#39;t mind a (disabled) QA test now though</=
div><div>(17:53:18) ***RP__ wishes people would pay attention to warning me=
ssages</div><div>(17:53:19) Tartarus: I&#39;d suggest that at some point we=
&#39;ll have people writing recipes that have SPDX info and we&#39;ll see &=
#39;incorrect&#39; LICENSE fields? :)</div>
<div>(17:53:58) RP__: I&#39;d like to see a list of known types we accept i=
n the field</div><div>(17:54:00) bluelightning: I think we already have SPD=
X naming mixed in don&#39;t we?</div><div>(17:54:07) RP__: bluelightning: w=
e do</div>
<div>(17:54:14) fray: FYI.. it simply states the identifier and version num=
ber should be separated by a &quot;-&quot;</div><div>(17:54:28) fray: so th=
ey are using that to indicate a parsing point but that is all I see</div>
<div>(17:54:40) fray: FYI it&#39;s Appendix I on the spdx-1.0 specification=
</div><div>(17:54:57) fray: so they have GPL-2.0 and GPL-2.0+ =A0later mean=
ing that version or greater</div><div>(17:54:59) RP__: fray: right, its lik=
ely so you can automatically split the version from the main license</div>
<div>(17:55:14) bluelightning: aha, that would make sense</div><div>(17:55:=
15) fray: they also have things like GPL-3.0-with-GCC-exception</div><div>(=
17:55:27) RP__: and we support GPLv2 GPLv2.0 (with + variants)</div><div>
(17:55:41) RP__: fray: I think we&#39;ve started adopting those</div><div>(=
17:55:59) fray: ya.. if we did this (even w/ v =3D -) =A0then GPLv2 is inva=
lid..</div><div>(17:56:19) RP__: fray: We currently have a mapping table</d=
iv>
<div>(17:56:29) fray: ya.. I would expect we&#39;ll need to continue to hav=
e that</div><div>(17:56:38) fray: perhaps the mappign table is the right wa=
y to do the v -&gt; -?</div><div>(17:56:45) fray: then ask people to switch=
 to -?</div>
<div>(17:56:52) RP__: fray:=A0<a href=3D"http://git.yoctoproject.org/cgit.c=
gi/poky/tree/meta/classes/license.bbclass" target=3D"_blank" style=3D"color=
:rgb(17,85,204)">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classe=
s/license.bbclass</a></div>
<div>(17:57:13) fray: ahh yes I see..</div><div>(17:57:40) fray: ok.. so do=
 we have a conclusion on this topic?</div><div>(17:58:13) fray: I&#39;ll su=
mmarize what I see then...</div><div>(17:58:29) fray: We still think SPDX n=
aming and what Beth is proposing is reasonable..</div>
<div>(17:58:58) fray: There is debate between doing a global (oe-core) swit=
ch to SPDX namings at this point or continuing to using mappings to export =
the SPDX namings..</div><div>(17:59:23) fray: other then risk of confusion,=
 there is not a compelling reason at this time to *) Do a global change =A0=
*) Enable a QA warning =A0*) Plan for a QA error</div>
<div>(17:59:42) fray: (it might be nice to create a -disabled- QA class to =
check this stuff that people can enable for themselves)</div><div>(17:59:50=
) fray: do you agree? =A0did I miss anything?</div><div>(18:00:28) Tartarus=
: Sounds right</div>
<div>(18:00:45) fray: Ok.. so Beth is on the right track, we&#39;re non-com=
mital beyond that for now.. and we should keep monitoring..</div><div>(18:0=
0:59) fray: ok.. it&#39;s 12 (central).. =A0Do we want to continue or do we=
 need to call it?</div>
<div>(18:01:14) ***RP__ has to be somewhere else now :(</div><div>(18:01:24=
) fray: ok.. then we&#39;ll call it and defer the other items..</div><div>(=
18:01:36) bluelightning: sounds OK to me</div><div>(18:01:37) fray: if any =
of the items are pressing we should call a meeting for next week -- otherwi=
se next meeting in 2</div>
<div>(18:01:52) RP__: I don&#39;t think we did much with the action items :=
(</div><div>(18:02:09) RP__: status of OE-Core hasn&#39;t changed much over=
 the holidays</div><div>(18:02:22) fray: agreed</div><div>(18:02:24) RP__: =
DISTRO_FEATURES is the main pressing item</div>
<div>(18:02:37) RP__: I&#39;d suggest we try and continue that on the maini=
ng list</div><div>(18:02:48) RP__: maybe we can all try and have more discu=
ssion on that topic there?</div><div>(18:02:51) fray: ok.. sounds good to m=
e..</div>
<div>(18:02:56) bluelightning: agreed, hopefully with people coming back fr=
om holiday they will be able to respond</div><div>(18:03:18) RP__: sounds l=
ike a plan</div><div>(18:03:28) RP__: so meeting in a fortnight?</div><div>
(18:03:37) fray: yup -- unless we decide otherwise</div><div>(18:03:40) blu=
elightning: yep</div><div>(18:03:41) fray: (via mailing list)</div><div>(18=
:03:44) RP__: right</div><div>(18:03:58) ***RP__ sends the log to jefro</di=
v>
<div class=3D"yj6qo ajU" style=3D"outline-style:none;outline-width:initial;=
outline-color:initial;padding-top:10px;padding-right:0px;padding-bottom:10p=
x;padding-left:0px;width:22px;margin-top:2px;margin-right:0px;margin-bottom=
:0px;margin-left:0px">
</div></span><div><br></div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro=
.net/blog" target=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Co=
mmunity Manager @Intel <a href=3D"http://yoctoproject.org" target=3D"_blank=
">http://yoctoproject.org</a></div>
<br>

--14dae9340c59e6ff7f04b6bc511c--
