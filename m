Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1TM1dG-0000sc-48; Wed, 10 Oct 2012 21:07:50 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so625124iac.6
	for <multiple recipients>; Wed, 10 Oct 2012 11:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=aI9Qh0YwIaup9qk3LVUvL91izRNn0wWVvDMqaOcTwMg=;
	b=jgNkQ9DbmzibzGfS6MtSSUVVFBwx1uqzR0+d2yqlGfJuXIDpanCSkZGztZBfQT162z
	TbMkrQO/tObYMbQpJFkS6KnOAqWzp9wtnqK9sqwBFW8g9mv+x2jn3T7mlaQlw4rfMOhp
	IsWRPNRh98BogRhJEwDUEnIbDFXHqIiLWCYrN/eBo+XmIkukdiaeWLCVACO+dji7fZwI
	LZlTpx88nEqNXrVQLiGisTD5nZGBtn99Iq+orcK/nqFuPoJhB2+aWe1OhPNVukhQ/rqn
	9iews3E2mMhRYQhfdNheOI65Cj6SxvR+8PK9Pn3QQgE8C25jXdSss1SC0J53SPqm8lEz
	IJGQ==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr6489442igc.45.1349895279796; Wed,
	10 Oct 2012 11:54:39 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.147.37 with HTTP; Wed, 10 Oct 2012 11:54:39 -0700 (PDT)
Date: Wed, 10 Oct 2012 11:54:39 -0700
X-Google-Sender-Auth: AmHhpUoNmqyANSA-QXoWC9O6XKU
Message-ID: <CA+YB3rZtSXVJ+CtONP_Zg_ijimwsgqBZmOs=KcM0rhjhk=4=Vg@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE TSC 25 September 2012
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
X-List-Received-Date: Wed, 10 Oct 2012 19:07:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded TSC Meeting
25 September 2012

Attendees: Richard, Mark, Koen, Paul, Khem
Notes: Jefro

________________________________________________________________
Agenda & Results

1. pick a chair
RP
___________________________________
2. lingering issues

  ALL: could use some documentation
  discussed priorities: website update, identify main pages out of date
    consistency of the contribution guidelines and new user ramp up
        bitbake manual

 a. raise awareness of "janitor" list, QA "bugs"
   working

 b. discuss communication with OE community about release-oriented phases
   RP to send email about feature freeze - DONE
        <remove from lingering issues>

 c. pre/post install scripting (fray)
    no change

 d. systemd
    discuss on mailing list (all) - scheduled for 1.4
        <remove from lingering issues>

 e. PR bumps
     => koen to investigate server & report back
     => bluelightning to test on autobuilder infrastructure
     => bluelightning to document setup steps on wiki
        some good bugs on PR bumps submitted
        lower priority due to release, PR service pushed to 1.4

 g. meta-networking
    ready to go, waiting on final repo keys to enable push
        <remove from lingering issues>

 h. whitespace changes to the shell (Martin)
    ref: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html
    -> Reluctant conclusion: tabs for shell, 4 spaces for python.
    => Need to ensure well documented & then remove

 i. meta-oe:
    meta-systemd discussed
      yoctoproject version is temporary until OE version complete
          meta-oe/meta-systemd is the official version
          yoctoproject.org blog post ameded [Jefro]
        blacklist.bbclass gone now
        kernel.bbclass pending on
          1. proper distro-wide machine-kernel-pr method
          2. proper distro-wide uimage method

___________________________________
3. new issues

 a. Meetup at ELCE
   OE general assembly Weds eve 5pm
   Yocto Project Developer day Thurs
  => possible TSC lunch/dinner TBD

 b. 1.3 branching strategy (Koen)
  -> can we cut down the get backports into the 1.3 branch from
"weeks" to "days"?
  positive first impressions on strategy, discussion about details
  sgarman doing a good job with 1.2
  discuss on mailing list

___________________________________
4. status

 a. Separation of / and /usr
    evaluate patches individually case by case, open to reevaluation if needed
    <remove from status list>

 b. oe-core release
    discussed in 2b
        branch/tag, also discussed tarballs but nowhere to host easily
        branches most useful
        website guide needs to be updated

 c. infrastructure
      -> Jefro has volunteered to help with oe-members - done
      Khem requests mailman archives text-only display

________________________________________________________________
Koen's branching strategy description:

1.3 branching strategy: can we cut down the get backports into the 1.3
branch from "weeks" to "days"?

The background:

 The 1.2 process seems to be:

* post patches
* wait a week while patches get no feedback
* ping scott
* wait a few days.
* notice patches have shown up in denzil-next
* wait N weeks
* ping scott, receive reply containing vague references to "autobuilder"
* wait another week
* notice pull request to Richard
* wait till RP wakes up, see patches go in.

For the OE-classic stable branches we had a process that boiled down
to "If no one says something bad about the patches in a 2 week period
and they don't obviously break something, they will go in".  With that
in mind I'd like to propose the following process:

* post patches
* no negative feedback in 48 hours -> apply to denzil-next
* every friday the autobuilder does its thing on denzil-next and a(n
automated) report gets mailed to the oe-core list
* Assuming it needs less than 2.5 days to finish the report gets
evaluated on monday and if good (and not negative feedback in the
meantime) a pull request gets issued.

The shortest path will be wednesday morning (european time) -> monday
evening (european time), which should be enough time to raise concerns
with the patches on the list.

The above is just a rough outline, I have no problems with running the
autobuilder every other week instead of every week, or even every day.
The main point is that the "merge windows" and test cycles are known
and that "no feedback is good feedback" will train people to speak up
early in the process.

I currently only need to support one product using 1.2, but for 1.3 it
will be at least 3 so I'd really like to spend less time being
frustrated with the process and more time on actual support. The
earlier my patches get rejected, the more time I have to fix them :)

________________________________________________________________
Raw Transcript:

(9:02:10 AM) RP: So, we need a chair and an agenda
(9:02:14 AM) Jefro: agenda is here: http://pastebin.com/pNNbbc81
(9:02:27 AM) RP: Jefro: I was hoping you'd say that :)
(9:02:41 AM) Jefro: :) glad to oblige
(9:03:15 AM) RP: Anyone feel strongly about chairing or should I?
(9:03:40 AM) koen: Jefro: I'm away from email (stupid, I know), can
you pastebin the rest of my mail about the branching as well?
(9:04:28 AM) RP: ok, I'll chair since nobody else seems to want to
(9:04:37 AM) Jefro: koen yes, will do
(9:04:41 AM) koen: thanks
(9:04:44 AM) RP: Looking down the list of lingering issues
(9:04:53 AM) RP: Is meta-networking proceeding now?
(9:05:00 AM) RP: Can we take that off the list?
(9:05:09 AM) Jefro: RP ok
(9:05:27 AM) fray: apparently my network is being slow today.. it
still si trying to load the agenda.. :(
(9:05:33 AM) RP: I believe I did 2b
(9:05:39 AM) Jefro: Koen's new issue description is here (for 3b):
http://pastebin.com/7Up9sZSq
(9:05:58 AM) Jefro: fray I can send by email if that would help
(9:06:19 AM) koen: Jefro: thanks!
(9:06:54 AM) fray: na.. it's working now
(9:06:57 AM) RP: I notice " ALL: could use some documentation" at the
top of the agenda
(9:07:08 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:07:09 AM) mode (+v khem) by ChanServ
(9:07:13 AM) Jefro: yes - it was discussed 2 weeks ago that all items
need documentation
(9:07:15 AM) khem: I am here guys
(9:07:19 AM) Jefro: hi khem
(9:07:30 AM) RP: Jefro: documentation of the items in section 2?
(9:07:30 AM) Jefro: (no bluelightning today?)
(9:07:47 AM) RP: hmm, I thought he was here :/
(9:07:53 AM) Jefro: RP yes - they all had documentation next to them.
I may have a note about that actually
(9:08:03 AM) bluelightning
[~paul@pdpc/supporter/professional/bluelightning] entered the room.
(9:08:04 AM) fray: I haven't seen much more work on the 2c item..  but
I may have missed the patch/RFC
(9:08:08 AM) bluelightning: hi folks
(9:08:15 AM) RP: hi bluelightning
(9:08:19 AM) Jefro: hi bluelightning, we we were just talkin about you
(9:08:20 AM) RP: hi khem
(9:08:22 AM) RP: http://pastebin.com/pNNbbc81
(9:08:25 AM) fray: (mentioned someone was working on 2c last meeting)
(9:08:27 AM) RP: is the agenda
(9:08:36 AM) RP: Lets start again, I'm chairing
(9:08:45 AM) Jefro: ok - I have a quick new item re documentation
(9:08:50 AM) RP: So, any additions?
(9:09:04 AM) Jefro: a community member has asked me what would be best
to jump into with respect to documentation
(9:09:45 AM) Jefro: I pointed him at the OE wiki. Is there anything
highest priority that he could help with?
(9:09:47 AM) bluelightning: well, we're desperate for an update to the
website, to make it relevant for current OE-Core
(9:10:06 AM) bluelightning: the first task is to go through and
identify the main pages that are out-of-date
(9:10:08 AM) RP: Jefro: Probably the best place to start IMO would be
the consistency of the contribution guidelines and new user ramp up.
Do we give all the info people need
(9:10:10 AM) koen: oe docs or poky docs?
(9:10:23 AM) RP: koen: there are no such things as poky docs
(9:10:23 AM) koen: since poky has docs thru mr rifenbark
(9:10:24 AM) fray: I had a few people apporach me last week about
holes in the documentation.. I asked them to file bugs on the
bugzilla.yoctoproject.org web site..
(9:10:34 AM) RP: koen: The yocto project on the other hand as some manuals
(9:10:36 AM) Jefro: bugs would be excellent
(9:10:39 AM) fray: between wiki and looking at doc bugs.. that seems
like the best use of time
(9:10:47 AM) koen: RP: about poky, yes, I know :)
(9:11:11 AM) Jefro: I plan to talk to scottrif about this as well - in
fact we spoke about it last week already
(9:11:25 AM) RP: koen: I'm just ensuring people use consistent terms
since I keep getting complaints about it
(9:11:31 AM) khem: I think also helping with bitbake manual will be good.
(9:11:47 AM) fray: ya
(9:11:57 AM) RP: khem: the bitbake manual needs someone techy to
rewrite it really though
(9:12:03 AM) Jefro: khem agreed 100% - that was the first thing that
came to mind
(9:12:20 AM) Jefro: wmat has been a tech writer for years, most
recently at montavista - I think he could handle it
(9:12:36 AM) RP: Jefro: There is just such a lot that isn't documented at all :/
(9:12:37 AM) koen: RP: I just checked, it really is all about poky
(9:12:37 AM) khem: RP: yes however there could be some content from users pov
(9:12:46 AM) Jefro: in any case, this will give me something to talk
with him about
(9:12:49 AM) RP: koen: look at the docs-in-progress
(9:12:51 AM) koen: RP: should the 'ycoto' docs use distro-less in 1.3?
(9:13:08 AM) RP: koen: no, it documents use of the reference platform
(9:13:23 AM) khem: koen: yocto is not really distroless but close enough
(9:13:30 AM) RP: koen: but its intended it should apply to most things
OE like and not mention poky specifically much
(9:13:47 AM) khem: From doc pov I think distroless will be fine
(9:13:54 AM) RP: koen: the docs-in-progress are better
(9:14:13 AM) khem: also documenting taskgroups e.g.
(9:14:19 AM) RP: packagegroups
(9:14:21 AM) khem: and bbclasses
(9:14:24 AM) koen: anyway...
(9:14:27 AM) khem: RP: mia culpa yes
(9:14:29 AM) koen: is this 2c or 2d?
(9:14:53 AM) RP: ok, picking these off
(9:15:10 AM) RP: janitor awareness (2a) no change
(9:15:16 AM) fray: yup
(9:15:25 AM) RP: 2b - communicate feature freeze was done
(9:15:39 AM) RP: 2c: postinstalls - no change
(9:15:58 AM) RP: We have has some good patches for this but too late
for 1.3 now :(
(9:16:11 AM) RP: 2d: systemd: unchanged
(9:16:26 AM) RP: 2e: Some good bug reports about PR bumps
(9:16:30 AM) koen: what's the deal with the 'yocto project' layer for systemd?
(9:16:43 AM) RP: being worked on but lower priority due to the release
and PR service being pushed to 1.4
(9:16:49 AM) fray: was going to ask about the PR bumps
(9:16:57 AM) fray: ok.. so it did get pushed back
(9:17:08 AM) RP: koen: As it mentions, it goes away when we get
systemd sorted in the core
(9:17:21 AM) koen: RP: that doesn't answer the question
(9:17:24 AM) khem: koen: I think post 1.3 we should work on merging
meta-systemd into OE-Core
(9:17:25 AM) RP: koen: It was a stop gap solution created a while ago
for meta-ivi before meta-oe sorted itself out
(9:17:31 AM) koen: why is it there and not using meta-systemd?
(9:17:32 AM) fray: ya.. I've seen multiple postings about that in
multiple places..  it's there until it's no longer needed by the IVI
folks
(9:17:53 AM) RP: koen: It didn't exist when it was created and a
dependency on meta-oe wasn't desired
(9:17:56 AM) koen: since meta-systemd has been there for weeks now,
why is it there
(9:18:00 AM) koen: ?
(9:18:02 AM) fray: meta-oe is too big..
(9:18:05 AM) koen: +still
(9:18:10 AM) bluelightning: koen: are you volunteering to help them migrate?
(9:18:12 AM) koen: fray: patches accepted
(9:18:21 AM) RP: koen: dependency on meta-oe isn't desired
(9:18:21 AM) khem: koen: as an aside we cross refer layers in meta-openembedded
(9:18:22 AM) koen: bluelightning: that would be ass backwards
(9:18:28 AM) fray: because the IVI group(s) have their own release
schedules.. which I think are wrapping up soon.. then they can 'move'
(9:19:01 AM) RP: koen: Its there until we get this sorted out which
*needs* happen in 1.4
(9:19:04 AM) bluelightning: koen: no, you're basically demanding that
they make a change they may not have time to make right now - try
reversing the situation and see if you would think the same
(9:19:09 AM) khem: I would propose that we work on getting it into
oe-core in 1.4 timeframe
(9:19:16 AM) fray: ya.. there is no reason for it to be there around 1.4
(9:19:19 AM) RP: khem: agreed, this is the plan
(9:19:26 AM) koen: bluelightning: it was created *after* the patches
to seperate out meta-systemd were posted
(9:19:42 AM) fray: I'd love to see systemd integrated as a distro feature
(9:19:46 AM) RP: koen: are you sure? It was created around May iirc
(9:19:49 AM) bluelightning: koen: have you spoken to them at all?
(9:19:49 AM) fray: koen, no it existed before then..
(9:19:52 AM) koen: RP: I'm sure
(9:20:00 AM) fray: it wasn't posted until may-ish
(9:20:00 AM) khem: koen: I think we all think that
meta-openembedded/meta-systemd is more official
(9:20:08 AM) khem: we need to work it out
(9:20:14 AM) khem: and make it more streamlined
(9:20:21 AM) koen: bluelightning: should they talk to the meta-oe
people first before doing a stupid for like that?
(9:20:37 AM) bluelightning: yes, there is no argument about
meta-openembedded/meta-systemd being the official systemd support
layer
(9:20:49 AM) khem: koen: in general I agree we should promote people
to look at layerIndex first
(9:20:50 AM) RP: koen: Well, meta-oe should have dealt better with
oe-core and not done something stupid either ;-)
(9:20:58 AM) fray: April 19th was when it was first 'posted'.. but
it'd been worked on since February as part of the GENIVI work.. but it
really doesn't matter.. the meta-oe/meta-systemd is where any new code
goes (or comes from) for oe-core
(9:21:13 AM) khem: exactly
(9:21:35 AM) koen: fray: so put that in that blog post anouncing that layer
(9:21:45 AM) khem: now that we are talking about meta-oe, koen we
should delete kernel.bbclass and blacklist.bbclass before 1.3 release
(9:21:53 AM) koen: blacklist is already gone
(9:22:02 AM) khem: whats halting kernel.bbclass
(9:22:14 AM) koen: 2 things
(9:22:16 AM) khem: if there are specific work items let me know I can help out
(9:22:24 AM) koen: 1) a proper way to use machine-kernel-pr distro wide
(9:22:37 AM) RP: I would also point out that bluelightning and I are
enforcing a new layer checklist for all new Yocto Project layers in
future
(9:22:40 AM) koen: 2) a proper way to do proper uimage stuff distro-wide
(9:22:51 AM) khem: ok which means you want something like INHERIT
(9:23:02 AM) RP: this includes commitments to sending out
announcements, clear READMEs and listing them on the index
(9:23:28 AM) khem: koen: I thought uImage was taken care of in OE-Core ?
(9:23:35 AM) koen: Jefro: can you amend the yocto blog post to include
the information where the 'official' systemd layer lives?
(9:23:38 AM) koen: khem: no
(9:23:50 AM) koen: khem: you need to set a magic var to unbreak it
(9:23:59 AM) RP: koen: so specifically, I'd like to acknowledge that
meta-systemd's entry into the world was less than ideal, we're trying
to find ways to ensure it doesn't happen again
(9:24:00 AM) Jefro:  koen - yes, I can do that
(9:24:07 AM) RP: however I also feel we're flogging a dead horse here
(9:24:20 AM) koen: RP: the blog post went live ~2 weeks ago
(9:24:25 AM) khem: koen: meta-oe is sidelined because of kernel.bbclass
(9:24:30 AM) khem: I am unable to use it
(9:24:36 AM) RP: koen: Jefro will tell you it was written months ago :/
(9:24:55 AM) koen: so it wasn't updated with all the flogging
(9:25:01 AM) RP: koen: evidently not
(9:25:03 AM) fray: (welcome to the world of automotive.. it moves -very- slowly)
(9:25:19 AM) khem: fray: but bmw's are fast :)
(9:25:35 AM) RP: koen: the point is everyone here acknowledges we need
to fix this and we are doing our best. I don't know what else you want
us to do...
(9:25:43 AM) koen: well
(9:25:49 AM) koen: I thought we were in agreement
(9:26:03 AM) koen: then months later this blog post comes online
seemingly contradicting that
(9:26:15 AM) koen: so I wonder what is going on
(9:26:19 AM) RP: koen: I don't think anything has changed, the blog
post just should have got reworded and evidently didn't
(9:26:25 AM) khem: may be do a new blogpost
(9:26:57 AM) Jefro: I can take responsibility for that. I followed up
with the blog post for ages, but never got a response (because the
team working on it was busy with a release). I added the emphasis on
"temporary" before I posted it, hoping that would be descriptive
enough.
(9:26:58 AM) RP: I had hoped to sort systemd in 1.3. For various
resource constraints it simply hasn't happened though :(
(9:27:25 AM) RP: It *will* in 1.4
(9:27:40 AM) RP: ok, is the horse dead now?
(9:27:46 AM) Jefro: RP: action items:
(9:27:47 AM) fray: yes, lets move on
(9:27:59 AM) koen: khem: btw, your root-libdir patch is wrong, /lib is
hardcoded for noarch stuff, so changing it to lib64 is wrong
(9:28:00 AM) Jefro: I can update the blog post, and we can also change
its git description to "deprecated"
(9:28:11 AM) koen: Jefro: or both
(9:28:30 AM) fray: the README in the layer also explains that it's
only temporary....
(9:28:33 AM) khem: koen: hmmm
(9:28:34 AM) Jefro: koen - yes, both
(9:28:38 AM) fray: so referring to that with the deprecation is probably good
(9:28:38 AM) koen: Jefro: a customer read the blog post and started
asking questions
(9:28:55 AM) RP: So I'm, hoping 2g, meta-networking can be removed
from the standing agenda unless anything comes up
(9:28:57 AM) khem: koen: ok do you mean hardcoded in OE
(9:29:00 AM) khem: or in systemd
(9:29:11 AM) koen: khem: systemd (and others)
(9:29:12 AM) RP: For 2h, I'm not sure we have documented everything we
should but that is the only part remaining of that
(9:29:16 AM) RP: (whitespace)
(9:29:22 AM) khem: koen: ok, I will take a look
(9:29:36 AM) fray: RP, I don't see any reason for meta-networking to
remain, unless technical or other issues start (or don't go away)
(9:29:44 AM) RP: 3a, ELC-E meet up
(9:29:46 AM) Jefro: koen - feel like helping me with a new blog post?
(9:29:50 AM) RP: I think we should have one
(9:29:51 AM) koen: khem: I'll send a patch to update to 191+fixes
later this week
(9:29:59 AM) koen: Jefro: sure, pipng me by email
(9:30:09 AM) khem: koen: btw. I have 191+ locally too
(9:30:12 AM) RP: Will we all be there?
(9:30:14 AM) koen: is the sunday dinner the meetup or a social thing?
(9:30:14 AM) fray: I havn't booked my tickets yet for ELC-E, but I
expect to be there from Monday morning (flight should land around 9am)
until Friday afternoon/evening
(9:30:29 AM) khem: koen: we need to merge that since I am sure you
would not have fixed uclibc patches
(9:30:54 AM) khem: I will be arrive on Sunday afternoon
(9:30:57 AM) bluelightning: still haven't booked my tickets either,
waiting on travel approval
(9:30:58 AM) khem: so I am good to go
(9:31:07 AM) fray: I've at least gotten the approval.. :)
(9:31:15 AM) khem: my travel is booked visa is not :)
(9:31:19 AM) ***RP is mostly approved. Long story :/
(9:31:21 AM) koen: I'll be there saturday afternoon as well
(9:31:35 AM) fray: The OE e.V meeting?  That is Thursday evening?
(9:31:39 AM) RP: I need to decide when to arrive
(9:31:53 AM) Jefro: OE eV meeting is Weds eve 5pm
(9:32:47 AM) Jefro: Yocto Dev Day is Thurs 9am - 6pm
(9:32:47 AM) fray: Wed evening.. ok..
(9:33:08 AM) fray: my main goals for being htere is meet you guys in
person, OE eV, Yocto Dev Day
(9:33:12 AM) Jefro: There are LF social events Monday & Tuesday, with
a "VIP" dinner Weds eve
(9:33:25 AM) bluelightning: fray: same here
(9:33:36 AM) RP: Jefro: so the e.V. meeting needs to be short? :)
(9:33:38 AM) khem: I am there all week
(9:33:42 AM) koen: can we hijack a yocto dev day break for a short meeting?
(9:33:44 AM) Jefro: RP ha - it better be
(9:33:46 AM) koen: e.g. lunch?
(9:33:58 AM) khem: yes Lunch would be good
(9:34:05 AM) Jefro: I was going to suggest a lunch, but not on Dev Day
(9:34:08 AM) khem: and mostly all of us will be there
(9:34:09 AM) RP: How about we do Lunch on Mon-Wed ?
(9:34:09 AM) fray: for folks on the 'intro track' there is a break
before lunch.. but RP likely won't be available.. I suspect
(9:34:12 AM) bluelightning: dev day might be a bit busy
(9:34:14 AM) fray: (Advisory Board meeting)
(9:34:18 AM) RP: I'm just thinking dev day we should socialise
(9:34:40 AM) RP: Jefro: when is the AB meeting?
(9:35:34 AM) Jefro: RP actually the AB meeting has not yet been
planned. It will almost certainly be early in the week.
(9:35:47 AM) Jefro: I would not plan any other meetings on Dev Day if
at all possible.
(9:35:58 AM) RP: I agree
(9:36:10 AM) Jefro: (We can take Yocto stuff offline)
(9:36:10 AM) RP: so Lunch on one of the conference days together?
(9:36:26 AM) koen: RP: fine by me
(9:36:35 AM) fray: ahh.. early schedule I saw showed the intro track
was presentation, AB, lunch, class(es)
(9:36:42 AM) Jefro: the schedule is here if anyone wants to see:
http://events.linuxfoundation.org/events/embedded-linux-conference-europe/schedule
(9:37:03 AM) RP: ok, nominations on which conference day once we're a
little closer and the schedule more final?
(9:37:11 AM) fray: yup
(9:37:38 AM) Jefro: You could also skip the last session on one day
and adjourn to a pub
(9:37:57 AM) Jefro: I should also let everyone know that I will not be
there, unfortunately
(9:38:10 AM) RP: Jefro: you will be missed
(9:38:25 AM) RP: so 3b, branching and OE-Core
(9:38:37 AM) koen: background on 3b: http://pastebin.com/7Up9sZSq
(9:38:40 AM) fray: Looking over the proposal, I like it..
(9:38:43 AM) RP: I agree the current process has seemed a little unwieldy
(9:39:03 AM) RP: The only concern I have is that you're assuming the
person doing this has the time and the autobuilder availability
(9:39:05 AM) fray: One of my problems with the current situation is
with the flood of 'new' development, I'm missing things requested for
old releases..
(9:39:13 AM) RP: Neither of which is true and why the delays creep in :(
(9:39:38 AM) fray: would anything be 'easier' if there was an
oe-core-stable mailing list to slow traffic for stable patches?  (I
honestly don't know if it's a good idea)
(9:39:49 AM) koen: RP: that's why the proposal is to schedule the
build on a weekend, it will have ~2.5 days to complete
(9:39:53 AM) RP: Another thing is that the stable branches have taken
a lot more patches than was originally expected
(9:40:14 AM) RP: If you ask davest for example, he'd say the right
number of patches for a stable release is about 5
(9:40:18 AM) koen: heh, I was thinking they had a lot less patches
than I expected :)
(9:40:35 AM) fray: I'd expect over the course of a stable patch for it
to be around 100-200
(9:40:43 AM) fray: stable -branch-
(9:40:46 AM) RP: koen: Right, there are some different expectations
here which is why I want to raise this
(9:40:48 AM) fray: (life span of 1-2 years)
(9:41:09 AM) RP: The TSC doesn't control engineering resources which
unfortunately the stable branch needs
(9:41:20 AM) RP: So I'd propose we discuss this on the lists
(9:41:32 AM) fray: ya.. I'm trying to think if there is anything I can
contribute (i.e. auto builder resources)
(9:41:43 AM) bluelightning: obvious, but more patches = more testing needed
(9:41:46 AM) RP: I'd like davest to understand the reasons this is
being proposed for example
(9:41:56 AM) koen: ideally a ton of people will respond with Tested-By:
(9:41:58 AM) fray: RP, that seems reasonable.. I like the proposed
scheduling... but we need the testing (machine) and people resources
(9:42:09 AM) RP: I'd also like people appreciate what sgarman has
actually done with this
(9:42:10 AM) koen: but right now it's more like: *crickets*
(9:42:32 AM) RP: koen: it may look like that but that is going to
upset Scott given how hard he has pushed some of this behind the
scenes
(9:42:46 AM) koen: RP: I meant reviews by other people
(9:43:08 AM) khem: we are setting up autobuilder on OE servers its underwork
(9:43:09 AM) RP: koen: ah, right
(9:43:11 AM) khem: that could help
(9:43:19 AM) fray: I've seen a few patches go by, but like I said, I'm
not seeing visibility on things until they appear in -next or denzil..
(9:43:28 AM) RP: the trouble is the autobuilder resources have been
sucked up with master stability
(9:43:37 AM) koen: RP: scott seems to do a good enough job for 1.2,
but the whole thing is long-winded and unpredicable
(9:43:42 AM) RP: I/Saul do rely on them rather heavily
(9:43:51 AM) RP: koen: ok, can we discuss this on the mailing list?
(9:43:54 AM) koen: sure
(9:44:08 AM) RP: koen: and showing some appreciation for the work
Scott has done would be good
(9:44:28 AM) RP: (I do think he has done well knowing what else he's been doing)
(9:44:43 AM) RP: He's setting up the ELC-E dev day machine imagess for example
(9:44:50 AM) RP: and attending IDF with demos and so on
(9:45:29 AM) RP: So conclusion for 3b: discuss on the list and point
the AB members at it resource wise
(9:45:50 AM) RP: For 4a, I think its case by case
(9:45:59 AM) RP: I turned off the QA warnings in poky
(9:46:09 AM) Jefro: does 4a still need to be on running agenda?
(9:46:10 AM) khem: which warning
(9:46:16 AM) RP: Jefro: no
(9:46:18 AM) Jefro: ok
(9:46:25 AM) RP: khem: the ones about separate / and /user
(9:46:28 AM) RP: er, /usr
(9:46:38 AM) khem: hmm I am still seeing them in poky
(9:46:45 AM) RP: For 4b, oe-core release, is there any specific question?
(9:46:49 AM) khem: well no I dont
(9:47:31 AM) khem: RP: do we plan to do tars in some download server
or just branch/tag
(9:47:52 AM) khem: I think tars can be generated from git tags too
(9:48:07 AM) bluelightning: did OE do tarballs for previous classic releases ?
(9:48:09 AM) Jefro: RP 4b is there as a status item whenever we are in
"release mode" - can skip if nothing to report - it was discussed
earlier in 2b
(9:48:15 AM) bluelightning: I don't recall
(9:48:18 AM) RP: I will branch and tag. If we have a mechanism for
tarballs I'm happy to have them
(9:48:33 AM) koen: bluelightning: compressed mtn dbs and git snapshots
with history iirc
(9:48:34 AM) RP: bluelightning: we couldn't easily host them so I
don't think it happened
(9:48:45 AM) RP: at least for OE-Core
(9:48:46 AM) khem: bluelightning: no it did not
(9:49:32 AM) bluelightning: I'm not entirely sure I see much value in
them... we don't want distros to be packaging them for example
(9:49:34 AM) koen: bluelightning: I stopped doing tarballs for
released after realizing we want people to use the branch, not the tag
(9:50:07 AM) RP: The branches are more useful I agree
(9:50:24 AM) fray: for oe-core/bitbake, branches seem the best to me..
(9:50:30 AM) RP: Having said that we get a lot of people using the YP
tarballs but those have all the components in
(9:50:36 AM) bluelightning: the only minor value is in downloading
less, but if cgit can offer downloads that should cover that
(9:50:41 AM) fray: for a "distribution".. branches and/or stable tar
balls is what end users want
(9:50:50 AM) koen: but no history, right?
(9:50:53 AM) RP: anyhow, I've no strong preference either way
(9:51:16 AM) bluelightning: koen: no, but if you want history you can
just do what everyone else does and fetch from git...
(9:51:47 AM) koen: "but I followed the guideo n the website"
(9:52:01 AM) bluelightning: in fact we would be best to encourage
people to just do that, then at least they can manage patches without
us or them going insane
(9:52:24 AM) bluelightning: koen: the guide we're responsible for
ensuring is correct, yes
(9:53:49 AM) RP: Does anyone have a specific proposal?
(9:54:30 AM) koen: if you do a tarball, include .git/
(9:54:41 AM) fray: Make sure the README is up-to-date in oe-core..
Make sure the 'quick start' on the oe wiki is functional..
(9:54:47 AM) fray: otherwise it's up to the distros.. (IMHO)
(9:55:27 AM) khem: I like branches and tags but am not averse to tars
(9:55:52 AM) fray: I prefer branches on OE, branches/tars for distros
(9:55:54 AM) RP: I agree its up to the distros ultimately
(9:56:09 AM) fray: (and of course tagging releases so they can be
reproduced)  ;)
(9:56:13 AM) RP: ok, since we're nearly out of time, anything on 4c?
(9:56:23 AM) fray: (I do use the diff from denzil to the denzil release tag)
(9:56:29 AM) RP: Jefro: did Phil* sort you out with access?
(9:56:47 AM) Jefro: RP not yet
(9:56:57 AM) Jefro: I pester him about it weekly, though :)
(9:56:59 AM) fray: BTW I got a quick update on meta-networking...
(9:57:17 AM) fray: Basically it's almost ready to go, and they're just
waiting on final repository keys to enable push.. then they can get
started
(9:57:32 AM) RP: fray: I thought we'd given the keys the green light?
(9:57:48 AM) khem: fray: meta-networking is already created isnt it
(9:57:48 AM) fray: he hasn't recieved anything yet.. he was going to
bug Michael today
(9:58:07 AM) RP: fray: ok, should be easy to sort that
(9:58:14 AM) fray: yup.. thats the only hold-up..
(9:58:20 AM) fray: sorry back to the meeting.. ;)
(9:58:22 AM) khem:
http://git.openembedded.org/meta-openembedded/tree/meta-networking
(9:58:35 AM) ***Jefro adds back 2g after all
(9:58:44 AM) RP: ok, I'm afraid I have yet another meeting to head to
(9:58:51 AM) ***fray too.. :(
(9:58:58 AM) RP: Any closing comments?
(9:59:11 AM) khem: meta-networking where is it hosted
(9:59:11 AM) RP: Jefro: remove it ;-)
(9:59:17 AM) khem: I am confused before I leave
(9:59:19 AM) bluelightning: khem: under meta-openembedded
(9:59:28 AM) bluelightning: I have one comment -
(9:59:29 AM) khem: ok so I am not confused
(9:59:32 AM) khem: thansk
(9:59:36 AM) khem: ttyl guys
(9:59:55 AM) bluelightning: the meta-systemd repo on yoctoproject.org
now has a short description marking it as "deprecated"
(10:00:15 AM) bluelightning: (I pinged Michael just before)
(10:00:19 AM) bluelightning: that's all
(10:00:23 AM) fray: ok
(10:02:03 AM) bluelightning: I'm done
(10:02:17 AM) fray: thanks all!

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


