Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1Q7j9J-0003yc-3m; Thu, 07 Apr 2011 08:57:02 +0200
Received: by wye20 with SMTP id 20so2099544wye.6
	for <multiple recipients>; Wed, 06 Apr 2011 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=t37SJUFq22EGZebc0fYGpG3J1s3h+489i1q1jXDBVHY=;
	b=eGI20G6VDpwrwTx5vkO9Ex5ae0+zqpelt+bdpRkzHHjF7z3hSFMmiy2g/uharSd5Fn
	cq/3MBNOUgV/0+CDffqTehlhtXqYM72gFvLKDHUE0auqxgNV6xpuEr71aGDEnGyZSuzo
	VMJXVfrGRAel5hRNztwnIZcHZIiGOUHNmVKrU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=RFnt0n/UFf3eyOcmxap0S46Q9In3Hc3xDY+V2ZFik9F1swsToAbIejtVgYoKYFW+Yx
	Gjjk7Ptw8+nMvnO1yOdDTSl2uJsSZgz9l5D0FniNIRKECBZSL7jRHzWI/pz9eAhSqy2c
	QS+9cB+v7WmTsnHUNHzYc8Pm3aKXAq5OHuea4=
MIME-Version: 1.0
Received: by 10.216.67.199 with SMTP id j49mr481839wed.59.1302159293241; Wed,
	06 Apr 2011 23:54:53 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.216.89.201 with HTTP; Wed, 6 Apr 2011 23:54:53 -0700 (PDT)
Date: Wed, 6 Apr 2011 23:54:53 -0700
X-Google-Sender-Auth: IMpDOR4lzOykpgqOLzDeyZvM-2s
Message-ID: <BANLkTi=zXSf-r50H-f=m68=tghS7AN4Yvw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	tsc <tsc@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: MINUTES: OpenEmbedded Technical Steering Committee, 31 March 2011
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
X-List-Received-Date: Thu, 07 Apr 2011 06:57:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

** NOTE: no IRC meeting Thurs 4/7 or 4/14 - F2F meeting Sun 4/10 instead

MINUTES: OpenEmbedded Technical Steering Committee, 31 March 2011
___________________________________
 01) Agree on meeting chair

 //stefan
___________________________________
 02) Status report on oe-core

 some folks building with oe-core
 koen split out last angstrom pieces yesterday, so ready to go
** AI: send to email list
 RP & Khem - fix branding first
 RP says can do in person at collab meeting
 tom - post on the 10th? khem: after elc, in ml & irc
     - let's make sure the meeting notes reflect that we intend to do
   the "come on in!" msg post ELC

action items:
  general: encourage more distros to participate in oe-core
  general: invite more people to meta-oe on the oe-devel mailing list
  interested parties: discuss documentation
//all partially done, continued to next week as described
  Jefro volunteers to wikify checklist if someone sends
//not done, continued to next week
___________________________________
 03) Status report on pull model, contrib repo and guidelines

action items:
  khem will try to write up how to use contrib repos
//not done, continued to next week
  Mark hopes to post commit/patch policy guidelines tomorrow, has feedback
to incorporate
//doc is in third round, ** oe-tsc please read
//discussion re COO - fray will rework
  Koen would like to copy oe-core guidelines as much as possible for meta-oe
layer
___________________________________
 04) Status report on board support layer guidelines

action items:
  Richard has action to write proposal for YP steering group, won't have
answer until their meeting
// will happen at YSG F2F
___________________________________
 05) Status report on version retention policy and interaction with
 oe-core / meta-oe / $distro layers

previous action items:
  Tom will wiki it
//done, remove 06 next week

___________________________________
 06) Status on layer splitting of metadata

action items:
  general: keep discussions going
  RP: will take notes of experiences and needs
//point to oe-core readme as official policy(fray)
// tooling to go on the F2F agenda
___________________________________
 07) DISTRO_FEATURE/MACHINE_FEATURE/libc features and other
    "flags" discussion
  [ Proposed: Tom Rini ]

action item:
  all: discuss on mailing list
//still waiting for input, continue to next week
___________________________________
 08) Continue discussion on posting of policies and guidelines

//RP has further things to contribute
//fray - should post in wiki, reference from repo, (handbook?)
** move to F2F
___________________________________
 09) Continue discussions on infrastructure items

action item:
  Jefro: write a blurb describing the change for a TSC member to post
  //continue to next week
___________________________________
 10) Last patchwork weekend for patchwork.or.org mid april.
  [ Proposed: Stefan ]

   After this weekend we should remove all patches from it and only
   use patches.oe.org from now.

action item:
   Stefan will send out mails for this.
(12:48:33 PM) koen: I'd say, plan it, announce it, do it
___________________________________
new item: when does this meeting happen? (EU is now on DST)

** new time proposed: Monday 1900UTC
** decide at f2f about week of elc
** NOTE: no meeting Thurs 4/7 or 4/14; physical meetup Sun 4/10

RAW MEETING TRANSCRIPT

(12:03:39 PM) khem: who is volunteering to chair ?
(12:03:41 PM) stefan_schmidt: ok, then lets start.
(12:03:47 PM) stefan_schmidt: I can chair if folks like
(12:04:00 PM) khem: ok stefan_schmidt it is
(12:04:06 PM) koen: I'm here
(12:04:09 PM) ***stefan_schmidt gets the agenda up on pastebin
(12:04:13 PM) fray: ok with stefan
(12:04:17 PM) fray: (who's logging?)
(12:04:59 PM) stefan_schmidt: http://pastebin.com/8wT7Nk7y
(12:05:17 PM) stefan_schmidt: ok, 02) oe-core status
(12:05:22 PM) stefan_schmidt: what do we have here?
(12:05:27 PM) ***RP__ has a log
(12:05:46 PM) khem: I am working on mostly oe-core+meta-oe
(12:05:49 PM) stefan_schmidt: for me 02 looks like last week. Any changes?
(12:05:54 PM) khem: getting uclibc support
(12:05:56 PM) RP__: In some ways its been a quiet week
(12:06:16 PM) RP__: Yocto has been busy releasing and respinning things
which eats time
(12:06:16 PM) ***Jefro is logging
(12:06:23 PM) fray: yup.. next week is collab summit, followed by ELC..
(12:06:28 PM) Tartarus: OK, so
(12:06:34 PM) Tartarus: I think this is appropriate for 02
(12:06:39 PM) RP__: khem: what about uclibc?
(12:06:53 PM) Tartarus: Are we ready to send the "come on and give
oe-core+stuff a try, it's all rather working now" message?
(12:06:57 PM) khem: RP__: I am getting it to work in oe-core + meta-oe +
angstrom
(12:07:02 PM) Tartarus: Or do we need a few more things in like uclibc?
(12:07:11 PM) khem: RP__: I am already building images for all supported
qemus
(12:07:18 PM) fray: Tartarus last time I tried it (last week) there were
still a few issues left..  but I think we're REALLY close..
(12:07:53 PM) khem: Tartarus: yes we can send that
(12:08:06 PM) khem: I think references are working well
(12:08:09 PM) khem: its the machine overlays
(12:08:10 PM) stefan_schmidt: I think we can start pointing it out more
often at least
(12:08:12 PM) koen: Tartarus: I split out the last piece from
angstrom-layers today, so angstrom is read to go
(12:08:23 PM) fray: I think the big thing if we open it is to mention
"branding" issues as a few of the other things we've talked about are still
TBD.. but we'd like others to start using it
(12:08:33 PM) stefan_schmidt: anyone takes this AI to send out the mail?
(12:08:53 PM) khem: RP__: there are few changes needed in oe-core to support
uclibc
(12:08:58 PM) RP__: Would the widespread encouragement be better after we
fix the branding?
(12:09:06 PM) khem: I would say yet
(12:09:08 PM) khem: yes
(12:09:12 PM) khem: fix the branding first
(12:09:14 PM) RP__: I'm hoping we can do that in person
(12:09:21 PM) fray: thats really my only concern at this point
(12:09:25 PM) Tartarus: So post the 10th?
(12:09:40 PM) khem: yeah I think it would be better to post it after ELC
(12:09:42 PM) RP__: Tartarus: I'd say after ELC, to ensure people are around
(12:09:52 PM) Tartarus: ok
(12:09:57 PM) RP__: (mailing lists, irc etc)
(12:10:24 PM) Tartarus: lets make sure the meeting notes reflect that we
intend to do the "come on in!" msg post ELC
(12:10:26 PM) stefan_schmidt: sounds good to me
(12:10:33 PM) ***Jefro will do
(12:10:48 PM) fray: yup agreed
(12:11:13 PM) stefan_schmidt: hmm, will we have a meeting next week then?
(12:11:24 PM) stefan_schmidt: all but me should be together anyway
(12:11:29 PM) fray: I'd suggest the next meeting is the in-person on Sunday
(12:11:34 PM) stefan_schmidt: ok
(12:11:53 PM) stefan_schmidt: you agree on who is sending the mail to
welcome more people to oe-core there?
(12:12:22 PM) Jefro: stefan will not be there in person. We may be able to
conference him in with skype etc.
(12:12:52 PM) fray: ya.. I'd suggest that if we can arrange it
(12:13:07 PM) stefan_schmidt: Jefro: just do it without me. Sunday will not
work for me anyway.
(12:13:16 PM) stefan_schmidt: last diploma exam on monday...
(12:13:18 PM) Jefro: ok
(12:13:23 PM) Jefro: (good luck!)
(12:13:30 PM) stefan_schmidt: thx
(12:13:40 PM) fray: ok, on to 3?
(12:13:45 PM) stefan_schmidt: yes
(12:14:02 PM) stefan_schmidt: khem: did you have time for the contrib repo
write up?
(12:14:10 PM) khem: no I did not do it
(12:14:14 PM) khem: keep it open
(12:14:24 PM) fray: my status, I finally got the patch/commit msg guidelines
revised and posted to oe-devel.  TSC members, be sure to read over it.  the
major change was adding the concept of "Integrated-by" to indicate imported,
but not changed..
(12:14:33 PM) fray: otherwise it should be just additional explanation and
formatting
(12:14:58 PM) koen: fray: it is *long*, though
(12:14:59 PM) khem: Integrated-by ?
(12:15:13 PM) khem: how about Ported-by does that fit
(12:15:26 PM) fray: koen, thats one of my concerns..  most of it is examples
or explanation
(12:15:30 PM) koen: cherry-picbb
(12:15:33 PM) koen: bhseddeeby
(12:15:47 PM) fray: I avoided cherry picked-by because this is also for
patches..
(12:16:01 PM) RP__: You know, I'm less worried by long documentation
(12:16:01 PM) fray: and Ported-by I'm not sure makes as much sense..
Integrated or Imported make more sense to be
(12:16:11 PM) koen: integrated it fine by me
(12:16:19 PM) fray: the key thing is to simply state "I didn't make any
changes, so it's not my code"
(12:16:22 PM) ***koen goes out to search for new keyboard batteries
(12:16:55 PM) khem: fray: that may not be true since one might make changes
to auger it in
(12:17:08 PM) fray: for those, I'd expect a signed-off-by line
(12:17:11 PM) khem: but yes this key is good to have
(12:17:18 PM) khem: ok
(12:17:30 PM) RP__: fray: why add the integrated by line, what purpose does
that have?
(12:17:35 PM) fray: Integrated-by is unique to the no-changes addition of a
patch or commit.. (I suspect way more common for patches)
(12:17:45 PM) RP__: fray: I'm just trying to figure out why we need that
info?
(12:18:09 PM) fray: RP__ a few people approached me and suggested it.. but
the one person who explained why mentioned it goes back to the provenance of
the code.. if the person who integrated it didn't modify it.. then the
provenance is unaffected..
(12:18:12 PM) khem: I think Signoff is ok since it will be tested by the
person
(12:18:47 PM) fray: If you don't think it's necessary -- we can go back to
the simple signed-off-by usage...
(12:18:50 PM) RP__: fray: We do talk about developer COO somewhere which is
also what Signed-off-by means
(12:18:57 PM) RP__: (Certificate of Origin)
(12:19:26 PM) RP__: fray: So there is a specific legal meaning attached to
SoB lines
(12:19:55 PM) RP__: fray: I'm just worried that by deviating from that, we
create problems for ourselves
(12:20:04 PM) fray: I think that's for us to determine.. I'm not sure we can
say legal meaning.. but it can help determine it
(12:20:28 PM) koen: I think SOB is enough
(12:20:29 PM) RP__: fray: By adding that line, you agree that one of the
things in the CoO is true about the origin of the code
(12:20:58 PM) RP__: whether that has legal meaning is not something we need
to cover, I know that various people do believe it adds value due to the
structure though
(12:21:08 PM) RP__: We should link to the COO in that document
(12:21:45 PM) fray: I'm a bit impartial about this.. but I was convinced by
someone that there was an actual difference ebtween integrated-by and
signed-off-by..  I'm happen to revert that section to signed-off-by...
(12:21:59 PM) RP__: http://www.pokylinux.org/doc/poky-handbook.html right at
the end
(12:22:49 PM) fray: likely the correction then is to include that statement
from the poky-handbook..
(12:23:59 PM) stefan_schmidt: fray: so you will rework it
(12:24:07 PM) fray: Yes, I will..
(12:24:10 PM) stefan_schmidt: anything else for 03?
(12:24:36 PM) khem: fray: I think you will get more feedback as you have
posted it to ml
(12:24:58 PM) fray: khem, I hope so...  I think it's getting really close to
what i was thinking when I staretd the document
(12:25:03 PM) ***stefan_schmidt looks at the clock. 36 min and 7 more items.
(12:25:11 PM) fray: yup.. I'm done w/ 03
(12:25:39 PM) stefan_schmidt: RP__: Did the Steering group meeting happen
already?
(12:25:41 PM) RP__: The steering group met but it was the first meeting with
a lot to get through. BSPs will be discussed at the f2f
(12:25:58 PM) stefan_schmidt: ok, so 04, stays as is
(12:26:03 PM) RP__: yes
(12:26:04 PM) stefan_schmidt: on to 05
(12:26:26 PM) stefan_schmidt: Tartarus: Did you had time for your AI?
(12:26:30 PM) Tartarus: yes
(12:26:43 PM) Tartarus: close up #5
(12:26:43 PM) stefan_schmidt: so its done for now?
(12:26:47 PM) stefan_schmidt: cool
(12:26:58 PM) Jefro: remove from list for next week?
(12:27:05 PM) stefan_schmidt: Jefro: yes, please
(12:27:07 PM) stefan_schmidt: 06
(12:27:08 PM) fray: new AI then is to point the oe-core readme to that as
THE policy (or has that been done)?
(12:27:26 PM) stefan_schmidt: We had some start with meta-efl and friends
(12:29:04 PM) stefan_schmidt: is the meta-efl layer is moving in a good
direction or do we need improvements here?
(12:29:15 PM) stefan_schmidt: to support layers to work together that is
(12:30:24 PM) stefan_schmidt: silence seems to mean all is good? :P
(12:30:41 PM) RP__: meta-efl looks ok so far to me but I've only looked at
the surface
(12:30:44 PM) khem: Its a bit different to work with many layers
(12:30:46 PM) koen: martin sends good pull requests and I merge them
(12:30:52 PM) RP__: How is Martin finding it?
(12:30:53 PM) koen: meta-efl still needs cleanup
(12:30:59 PM) khem: I think new user experience is going to be more
difficuly
(12:31:23 PM) khem: From my person experiences its quite hard to grasp when
you begin with
(12:31:25 PM) koen: RP__: martin said I responded quick enough to questions
and pull requests, so he's fine with me managing it
(12:31:36 PM) khem: changes overlap in layers etc.
(12:31:42 PM) khem: I dont know how to make that better
(12:31:45 PM) RP__: koen: and how was the experience for you?
(12:31:58 PM) fray: khem -- is there some type of documentation (wiki
walkthrough) or something we might be able to add to make this a bit easier
for folks to understand?
(12:32:07 PM) RP__: khem: It should get better as more things exist and
documentation changes to reflect it
(12:32:28 PM) fray: RP__ ya, thats what I'm still thinking as well..  the
transition is the painful bit
(12:32:29 PM) khem: RP__: I am worried about steep curve oe had should not
become steeper
(12:32:48 PM) RP__: khem: I think there will be a kink with things getting
easier afterwards
(12:32:49 PM) koen: RP__: I need to find how to to 'git merge' with -s, but
otherwise it's quite ok
(12:32:52 PM) khem: When I asked users they just want one blob
(12:33:07 PM) khem: they are least interested in get this layer from here
that from there thing
(12:33:13 PM) RP__: khem: This is why I wanted to keep the poky integration
repo
(12:33:16 PM) Tartarus: so everyone needs an oebb.sh type thing
(12:33:33 PM) khem: Tartarus: yes thats one way to get it
(12:33:33 PM) fray: khem, I would agree.. for end users they want a single
download..  developers are willing to put up with more..
(12:33:33 PM) RP__: khem: It may be we automate a similar stype OE repo like
poky?
(12:33:37 PM) khem: I tried git submodules
(12:33:39 PM) khem: it works
(12:33:46 PM) koen: Tartarus: or teach bitbake to fetch layers
(12:33:58 PM) fray: I've had the opinion the project needs to be responsible
for making it "easier" to use specific layers or components as the case my
be...
(12:34:10 PM) stefan_schmidt: where do we stand with tools evaluation (repo,
submodules and friends)? Did some people work on this?
(12:34:18 PM) RP__: What I'd like to agree on is common tooling to do this
(12:34:19 PM) fray: bitbake fetching layers isn't actually a bad
enhancement..
(12:34:49 PM) stefan_schmidt: I agree that we _need_ common tooling for this
(12:34:57 PM) koen: stefan_schmidt: I wrote my own with awk and sh, it
works, khem tried submodules, that also works
(12:35:01 PM) stefan_schmidt: without it it will just be frustrating for
users/developers
(12:35:11 PM) RP__: fray: its the wrong piece of the puzzle to be doing it
in a way though
(12:35:29 PM) fray: from a pure OE perspective -- we need common tooling for
all OE created, hosted, managed layers..
(12:35:53 PM) fray: for non-oe controlled systems.. I think the best we can
do is suggest a way to do it.. but there are going to be lots of ways to
implement it..
(12:35:55 PM) RP__: koen: works well enough for nothing else to be needed or
are we going to find issues as we scale it?
(12:36:17 PM) fray: RP__ what I was thinking was in the bblayers file to
specify a URL.. it it could yank that as use it for the layer.. (but it's an
enahnement.. and certainly not one I've thought through)
(12:36:39 PM) koen: RP__: I think we need to work on a toplevel project that
has layertools
(12:36:49 PM) RP__: koen: agreed
(12:36:52 PM) fray: agreed
(12:36:55 PM) koen: RP__: users/distros can fork it to add branding
(12:36:56 PM) khem: keep in mind that most of oe devs and users may not be
git savvy
(12:37:15 PM) koen: I went the setup-scripts.git route, but I'm open for
other things
(12:37:18 PM) Tartarus: Yeah, it needs to be simple on the end users to get
to what they need
(12:37:19 PM) RP__: koen: or make it customisable? ;-)
(12:37:26 PM) koen: RP__: same difference
(12:37:38 PM) ***Jefro suggests that the details of all this may be better
to discuss in person next week - we will have up to 5 hours
(12:37:41 PM) fray: one such layer tool is a way to combine the pieces
(bbappend, etc) via the layers that the user will run, so they can see the
final recipe.. (it's REALLY useful to be able to visualise that)
(12:37:47 PM) fray: yup
(12:38:06 PM) ***koen agrees with Jefro
(12:38:10 PM) stefan_schmidt: ok, tooloing at face to face meeting
(12:38:15 PM) stefan_schmidt: #7
(12:38:17 PM) khem: I have been trying to convince users to use this kind of
setup
(12:38:18 PM) ***RP__ too, should go on the f2f agenda
(12:38:35 PM) stefan_schmidt: DISTRO_FEATURE/MACHINE_FEATURE/libc features
and other flogs
(12:38:38 PM) stefan_schmidt: flags
(12:38:40 PM) koen: for #7 we need to rekindle the ml discussion
(12:38:45 PM) Tartarus: waiting for input from everyone, still
(12:38:48 PM) Tartarus: poke everyone :)
(12:38:49 PM) stefan_schmidt: When do we want to start this discussion?
(12:38:50 PM) RP__: yes, we've not managed that this week :/
(12:38:54 PM) RP__: Tartarus: sorry :/
(12:39:02 PM) koen: stefan_schmidt: it was started last week, but died
(12:39:05 PM) fray: Tartarus sorry I missed the start of discussion email..
I'll go back / read and comment
(12:39:07 PM) stefan_schmidt: so moving as is to next week?
(12:39:23 PM) khem: DISTROs are fairly independent I wonder if there is a
whitebox way to apply distro features into oe-core
(12:39:25 PM) Tartarus: stefan_schmidt: yeah
(12:39:33 PM) stefan_schmidt: koen: ok, let me phrase it this way "get into
the details of the discussion"
(12:40:37 PM) stefan_schmidt: 08) Continue discussion on posting of policies
and guidelines
(12:41:15 PM) koen: stuff got posted this week
(12:41:21 PM) stefan_schmidt: :)
(12:41:35 PM) stefan_schmidt: I wondered what fits under this item.
(12:41:45 PM) RP__: I have some further things to write down and contribute,
I'm actually finding time to do these kind of things atm too :)
(12:41:48 PM) fray: 2 weeks ago it was where and when to post..
(12:42:02 PM) stefan_schmidt: ah, ok
(12:42:05 PM) fray: I think the when was decided.. the were (in wiki) all of
the guidelines go wasn't resolved yet..
(12:42:40 PM) koen: wiki/handbook/repo are the 3 options, right?
(12:42:52 PM) stefan_schmidt: yes
(12:43:06 PM) fray: we had decided to post the guidelines in the wiki, and
references them from the repo.. (I'm not sure we mentioned the handbook) [2
weeks ago]
(12:43:30 PM) fray: but it was the structure in wiki... so that referencing
them was easy that was still TBD
(12:45:19 PM) fray: not sure anyone has an answer -- so we can bring this up
at the F2F..
(12:45:21 PM) koen: what do we need to discuss here?
(12:45:27 PM) koen: what, fray said :)
(12:45:39 PM) stefan_schmidt: moved to f2f meeting
(12:45:55 PM) ***Jefro noted
(12:46:23 PM) stefan_schmidt: 09) Continue discussions on infrastructure
items
(12:46:25 PM) koen: 9?
(12:46:27 PM) Jefro: 09 - not done, sorry - way too busy this week with
yocto 1.0
(12:46:32 PM) stefan_schmidt: Jefro: ok
(12:46:42 PM) stefan_schmidt: Jefro: next week possible?
(12:46:50 PM) Jefro: if someone wants to summarize I'd be glad to clean it
up, otherwise it'll be next week
(12:47:04 PM) stefan_schmidt: I think next week is fine
(12:48:00 PM) khem: are we thru the agenda ?
(12:48:13 PM) koen: 10
(12:48:18 PM) koen: patchwork weekend
(12:48:33 PM) koen: I'd say, plan it, announce it, do it
(12:48:38 PM) khem: yes me too
(12:48:39 PM) fray: only other item is what time is this meeting?  "when we
started it this week" or an hour later?  ;)
(12:48:53 PM) khem: this time works for me
(12:49:11 PM) koen: I don't have a strong opinion on the time
(12:49:11 PM) stefan_schmidt: I would prefer this time
(12:49:18 PM) stefan_schmidt: if it fits all
(12:49:21 PM) fray: (either works for me)
(12:49:22 PM) Tartarus: I can keep this time
(12:49:23 PM) koen: a slight preference for this weeks time
(12:49:27 PM) stefan_schmidt: wrt 10, yes, will do so
(12:49:39 PM) Tartarus: only concern about a patchwork weekend is ELC and
all of that
(12:49:49 PM) Jefro: move back to 1900UTC - only RP has not responded
(12:49:55 PM) fray: ya.. I think anything we do needs to be after ELC right?
(12:49:59 PM) RP__: well, I'm find with now
(12:50:02 PM) RP__: er, fine
(12:50:07 PM) stefan_schmidt: Tartarus: it has to wait until mid april
anyway
(12:50:12 PM) RP__: so no meeting next week due to the f2f
(12:50:14 PM) stefan_schmidt: Tartarus: need to pass my exam first
(12:50:20 PM) RP__: The week after, I will be on a plane at this time
(12:50:33 PM) RP__: So I send my apologies now :)
(12:50:34 PM) koen: me too
(12:50:40 PM) koen: different plane, propably
(12:50:44 PM) khem: I have one thing that was not on agenda Stefan Sledz is
asking to host a branch where the access should be allowed to devs from his
company
(12:50:50 PM) stefan_schmidt: RP__: heh, ok
(12:50:50 PM) fray: I was going to suggest we cancel the meeting on Thr the
7th..
(12:50:55 PM) fray: similarly I'll likely be a on a plane
(12:50:56 PM) ***RP__ booked the wrong route home and isn't happy about it
:/
(12:51:12 PM) ***Jefro notes no meeting on Thurs Apr 7
(12:51:14 PM) RP__: khem: a branch of what?
(12:51:18 PM) khem: yes a branch
(12:51:21 PM) fray: sorry not 7th.. I meant 14th.. (week of ELC)
(12:51:27 PM) koen: khem: sounds like BSP hosting ;)
(12:51:31 PM) fray: Apr 7th meeting is replaced by the F2F
(12:51:31 PM) khem: yes
(12:51:35 PM) stefan_schmidt: decide the next meeting during f2f and just
inform me
(12:51:39 PM) khem: I answered him to approach board
(12:51:39 PM) RP__: khem: a repo or a branch?
(12:51:46 PM) khem: and sponsor OE with funds :)
(12:51:53 PM) stefan_schmidt: khem: it works like the BSP stuff I would say
(12:52:02 PM) koen: khem: according to the charter the board doesn't have a
say in those matters
(12:52:03 PM) stefan_schmidt: khem: which needs to be decided...
(12:52:15 PM) khem: stefan_schmidt: so who does
(12:52:17 PM) khem: TSC ?
(12:52:18 PM) RP__: yocto might also be an option depending on various
things
(12:52:22 PM) Tartarus: Oh ya, I'm taking the 14th off from the computer
(12:52:25 PM) Tartarus: So, I would miss that one too
(12:52:30 PM) koen: khem: the TSC has full power of tech and infra
(12:52:34 PM) khem: lets have no meeting on 14th
(12:52:48 PM) khem: since we would have had F2F
(12:52:53 PM) stefan_schmidt: khem: I think we wait on the YP steering group
and then we can decide it
(12:52:56 PM) khem: no meeting for couple of weeks
(12:53:22 PM) khem: since it has different people accessing it and its a
branch not repo
(12:53:33 PM) khem: Its a bit of spaghetti
(12:53:36 PM) stefan_schmidt: hmm
(12:53:52 PM) khem: a separate repo would be cleaner
(12:53:53 PM) koen: khem: gitolite supports branch based ACLs
(12:53:58 PM) khem: koen: it does
(12:54:04 PM) stefan_schmidt: that will be for oe-core or what?
(12:54:13 PM) khem: do we take this approach or not
(12:54:23 PM) khem: no its for classic oe
(12:54:29 PM) khem: the last release
(12:54:56 PM) khem: so end result is we dont have a decision on how to
handle it yet
(12:54:57 PM) khem: right
(12:54:59 PM) koen: if it's for the release, they can do pull requests :)
(12:55:07 PM) khem: I suggested so
(12:55:18 PM) khem: but they dont want to have internal git infra
(12:55:31 PM) khem: so they would let few devs push into this new branch
(12:55:42 PM) khem: from where they can pull into their own release branch
(12:55:48 PM) khem: which already is on oe.org
(12:56:06 PM) stefan_schmidt: hmm, for buglabs I avoided suhc things by
using github for our stuff on top of 2011.03-maintenance
(12:56:09 PM) RP__: In general I'd like to see us encouraging more of that
kind of thing
(12:56:16 PM) stefan_schmidt: that allows all devs to commit
(12:56:20 PM) RP__: (using OE repos)
(12:56:29 PM) stefan_schmidt: And I only merge in
(12:56:38 PM) RP__: I know its added infrastructure load but its also added
project coherence
(12:56:39 PM) koen: RP__: on e.g. github or oe.org
(12:56:45 PM) RP__: oe.org
(12:56:58 PM) koen: I'm all for it
(12:57:01 PM) khem: RP__: they can always pull into the release branch they
have on oe.org
(12:57:04 PM) RP__: I think getting more visible coherence and collaboration
would be good for OE and this is one way to focus it
(12:57:13 PM) khem: to where they have the contrib repos is the question
(12:57:14 PM) koen: oh, before we close, I didn't get any response on my
.dev RO mail
(12:57:19 PM) RP__: Whether its git.oe.org or git.yp.org I'm indifferent on
(12:57:42 PM) RP__: koen: I'm not sure we ever actually discussed that?
(12:57:56 PM) stefan_schmidt: koen: I have mixed feelings closing it down
right after the first release with oe-core
(12:58:12 PM) stefan_schmidt: especially due to pull vs. push change comming
with it
(12:58:18 PM) RP__: I think more transition may be needed :/
(12:58:21 PM) Tartarus: Are we still doing TSC meeting stuff?
(12:58:22 PM) koen: stefan_schmidt: It's the only sane way as the OE project
(12:58:30 PM) koen: stefan_schmidt: we can delay the release of course
(12:58:37 PM) stefan_schmidt: Tartarus: two more minutes :)
(12:58:40 PM) RP__: I think we should look at it nearer the time
(12:58:44 PM) RP__: See how things are going
(12:58:55 PM) koen: it makes no sense to do oe-core releases and still have
.dev
(12:58:57 PM) khem: I would give enough time for transition
(12:59:03 PM) stefan_schmidt: koen: as RP__ says. Lets see how good it pans
out the next weeks
(12:59:04 PM) RP__: Tartarus: We've covering something TSC related that
wasn't on the agenda
(12:59:13 PM) Tartarus: k
(12:59:27 PM) stefan_schmidt: koen: I agree with the idea just see some
problems with it. Maybe potential problems
(12:59:52 PM) koen: I already know which people are going to complain
(12:59:54 PM) stefan_schmidt: Should we put this on the agenda for the next
meeting after f2f?
(12:59:59 PM) Tartarus: yes
(1:00:02 PM) khem: koen: we need to have a working solution with momentum to
make it RP
(1:00:04 PM) khem: RO
(1:00:06 PM) koen: and I also already know I don't give a damn about their
opinion
(1:00:33 PM) khem: heh
(1:00:54 PM) khem: I think it matters that all devs are on board with
oe-core before it goes ro imp
(1:01:06 PM) koen: since those people are not contributing to the project
anymore
(1:01:21 PM) koen: khem: all active devs
(1:01:23 PM) fray: khem, thats where I am leaning as well...  which is
another reason we need to get oe-core "used" ASAP..
(1:01:30 PM) khem: koen: yes all active devs
(1:01:35 PM) khem: and I know who they are
(1:01:45 PM) koen: but the TSC needs to have a clear and strong signal
(1:01:55 PM) khem: that I agree
(1:01:55 PM) Tartarus: yes
(1:01:56 PM) koen: which might involve delaying the release
(1:02:12 PM) stefan_schmidt: still I want to watch a bit more how people get
over to oe-vore before forcing them
(1:02:15 PM) khem: may be we should make clear on plans after oe release
based on oe-core
(1:02:31 PM) RP__: I think now is the wrong time to make a decision on this
(1:02:43 PM) khem: yes I think contribution to oe.dev should reduce as
people adopt oe-core+oe-meta
(1:02:46 PM) RP__: We need OECore to be successfully used by people, then we
can talk about this
(1:02:50 PM) Tartarus: yes
(1:02:53 PM) koen: RP__: exactly
(1:02:54 PM) khem: exactly
(1:03:01 PM) Tartarus: certainly post the come on in! email
(1:03:11 PM) stefan_schmidt: ok, so we need to spread the word and then
decide
(1:03:19 PM) khem: koen: lets make oe-meta+oe-core+angstrom appealing enough
(1:03:25 PM) stefan_schmidt: sounds like an agenda item for after the f2f
meeting :)
(1:03:32 PM) khem: I am sure it will happen its matter of time
(1:03:45 PM) stefan_schmidt: time is over guys, rest on ml
(1:03:51 PM) khem: ok
(1:04:02 PM) khem: RP__: I have a question on yocto-kernel
(1:04:08 PM) stefan_schmidt: I wish you a good and productive time at the
conferences
(1:04:47 PM) RP__: khem: go for it
(1:04:48 PM) khem: RP__: it needs elfutils for perf stuff but elfutils can
not be compiled with uclibc since its using obstack feature from glibc
(1:04:58 PM) RP__: stefan_schmidt: I wish you could be there, good luck with
the exams!
(1:05:02 PM) khem: so I need a way to disable perf if one is using uclibc
(1:05:05 PM) stefan_schmidt: RP__: thanks
(1:05:07 PM) koen: stefan_schmidt: good luck!
(1:05:14 PM) stefan_schmidt: koen: thanks
(1:05:17 PM) khem: stefan_schmidt: good luck with exams
(1:05:24 PM) Tartarus: good luck stefan_schmidt!
(1:05:30 PM) koen: khem: we have a linux-yocto session planned at ELC :)
(1:05:36 PM) koen: khem: or rather, are plaaning one
(1:05:40 PM) stefan_schmidt: then I only need to get the diploma thesis done
and finally I'm off the university :)
(1:05:44 PM) koen: anyway, I need to go
(1:05:51 PM) khem: koen: ok
(1:06:01 PM) stefan_schmidt: ok, I'm closing the meeting here. Yocto kernel
stuff is not TSC
(1:06:05 PM) stefan_schmidt: night folks
(1:06:18 PM) RP__: khem: ok, it shouldn't be hard just to make those tasks
do nothing for the uclibc case
(1:06:20 PM) khem: RP__: currently it includes perf-tools.inc to add those
tasks and deps
(1:06:23 PM) fray: :)
(1:06:27 PM) RP__: stefan_schmidt: 'night!

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

