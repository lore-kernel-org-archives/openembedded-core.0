Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1R4dxK-000537-PX; Fri, 16 Sep 2011 21:20:11 +0200
Received: by yxj17 with SMTP id 17so6656430yxj.6
	for <multiple recipients>; Fri, 16 Sep 2011 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=lVfUAjZFTBH0PCFQYFcon5fQJWEU08N3WkqJskRnl84=;
	b=BOsnn/JMrDGnCxq8u4SWwEbjU/Hj4rcqWQxFN6a7Xshe0E5s7uPcpqIsjMTzxn0fG3
	Sa3xGJbJR6kIta0SUwrgEXcBW4kSnk2Kbtqsa0k0zX5p6d6Npm8NTQZqlCzTaLt6mtOG
	t3YzZW1hvcha4lQ/1ltoIacoPFp9FaggCEdLg=
MIME-Version: 1.0
Received: by 10.42.168.198 with SMTP id x6mr305960icy.148.1316200497006; Fri,
	16 Sep 2011 12:14:57 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.239.7 with HTTP; Fri, 16 Sep 2011 12:14:56 -0700 (PDT)
Date: Fri, 16 Sep 2011 12:14:56 -0700
X-Google-Sender-Auth: dGr4ncHrwvrGiF25sjTioYSW2p4
Message-ID: <CA+YB3rYZNAc7Nj=tRzU-V9DWxruAo3Y=aZKv2y5SybWM31w4ug@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 16 Sept 2011
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
X-List-Received-Date: Fri, 16 Sep 2011 19:20:11 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8a2013c8fe04ad13cf05

--90e6ba6e8a2013c8fe04ad13cf05
Content-Type: text/plain; charset=ISO-8859-1

NOTE: meetings are now every two weeks instead of weekly

MINUTES: OE-TSC meeting 16 Sept 2011

Attending: Tom, Mark, Richard, Koen
Apologies: Khem
Note: Jefro

--------------------------------------------------------
Agenda:
1. pick a moderator
  Jefro volunteers

2. ask for new agenda items
a. merging mailing lists
b. minutes issues, streamlining process
c. release status
d. infrastructure
e. elections
f. meta-oe ownership

3. status on open subjects

--------------------------------------------------------
Results

2a. Tom suggested merging the oe-core and oe-dev mailing lists, on request
after discussion on mailing list on Sept. 2, in order to alleviate confusion
about what sort of traffic belongs on each list. The split has proven to be
useful in terms of figuring out which patches belong where. After some
discussion, the vote was 3-1 against merging the two lists. Instead, a new
proposal is in place to rename oe-dev to oe-meta, which is a much more
popular solution.

2b. Minutes are often "too late to be useful". This is partly because
meetings have been irregular over the past several weeks, and partly because
the note-taker (Jefro) has been more or less out of touch for about a month
due to conferences and vacation.  The group acknowledges that public minutes
are a positive aspect of the TSC that need to be out on time, and that
provisions must be made when Jefro is unable to provide minutes.

2c. Richard acknowledges need to send explanatory messages to oe-core about
upcoming branch on Oct 5. The branch was discussed some time ago, but not
brought up recently.

2d. Richard's email taken out by recent infrastructure issues at the Linux
Foundation.

2e. Koen will talk to Philip about elections.

2f. There is some public confusion about how meta-oe works, as Koen has
become the de facto maintainer for all packages except meta-xfce - no one
else has stepped up for a maintainer role. Need to reiterate process to list
and make provision for backup in case Koen is unavailable. All are happy
with Koen's work, but will continue to take opportunities to invite others
to participate. People need to demonstrate ability and willingness to commit
time.

--------------------------------------------------------
Raw Transcript

(12:58:16 PM) ***Tartarus is still here
(12:58:49 PM) fray: still here as well
(12:59:12 PM) ***Jefro1 is here too, but my net connection is bouncing up
and down like a rabid Jack Russell terrier
(1:02:32 PM) RP__: So we have 3.5 TSC members
(1:02:39 PM) RP__: and Khem is missing
(1:02:58 PM) Jefro1: 3 is a quorum, I believe
(1:03:00 PM) fray: 3 is enough right?
(1:03:24 PM) RP__: it is a quorum
(1:03:34 PM) RP__: I believe we had hoped to have a full meeting though
(1:03:52 PM) RP__: For the record I'm in China next week and have no idea if
I can make this slot
(1:03:56 PM) ***RP__ suspects not
(1:04:04 PM) Tartarus: Lets try bi-weekly then
(1:04:12 PM) Tartarus: Koen will be in Dallas TX and probably busy
(1:04:40 PM) RP__: ok. Do we have an agenda?
(1:05:20 PM) Jefro1: I have been out for a few weeks - agenda items would
include (1) pick a moderator, (2) canvass for items, (3) status on open
subjects
(1:05:25 PM) Tartarus: Aside from the usual status bits, I wanted to bring
up merging the MLs
(1:06:12 PM) Jefro1: I can volunteer to moderate
(1:06:34 PM) Tartarus: I think that worked well last time you did
(1:06:57 PM) ***RP__ likes volunteers
(1:07:12 PM) ***Jefro1 likes to be liked
(1:07:15 PM) ***RP__ would like to mention minutes of meetings and
streamlining the process
(1:07:40 PM) Jefro1: ok, although I already know what you are goign to say
regarding minutes. any other agenda items?
(1:07:42 PM) RP__: We should talk about release status I guess
(1:07:51 PM) Tartarus: yeah
(1:08:05 PM) RP__: Jefro1: I've been asked top raise the topic by the
community
(1:08:14 PM) fray: I don't have any opens for this week..
(1:08:59 PM) RP__: elections I guess
(1:09:24 PM) Jefro1: going once... going twice...
(1:09:58 PM) Jefro1: ok, in order - merging mailing lists
(1:10:07 PM) Tartarus: So
(1:10:21 PM) Tartarus: I think it needs to be done, esp once we say oe
classic (aside from the maint branch) is r/o
(1:10:30 PM) Tartarus: and here lists == core and devel
(1:10:38 PM) ***RP__ strongly disagrees
(1:10:56 PM) RP__: I think the new OE structure needs a bit of a rethink
when it comes to mailing lists
(1:11:11 PM) fray: I'm very torn on merging the lists..
(1:11:35 PM) fray: I can see why people want htem merged.. but I'm afraid
the overall volume level will make it hard to figure out what is oe-core and
what is meta-oe and what is "something else"
(1:11:36 PM) RP__: Putting everything on one mailing list just forces some
people like me to need to filter it manually somehow
(1:11:47 PM) fray: ya, I will certainly have to filter it as well..
(1:12:11 PM) Tartarus: throwing meta-oe requests into another folder?
(1:12:15 PM) fray: today I read oe-core pretty completely and skim oe-dev...
I'd want to keep being able to do the same thing
(1:12:31 PM) RP__: I understand the concerns about what different lists mean
and people not wanting to miss things
(1:12:38 PM) fray: I did see a request for meta-oe to be pull based or
"meta-pull" i.e. ask for a pull, no response you push
(1:12:50 PM) RP__: but I do think that having the OE-Core list will help
people not to missing things longer term
(1:13:20 PM) fray: even the volume of oe-core list today has gotten to the
point where it's hard for me to keep up.. even more email and I think it
will lose people
(1:13:25 PM) fray: ...and lose value...
(1:13:56 PM) RP__: LKML makes an interesting example here - something that
has grown huge and has no logical way to split it up
(1:14:03 PM) Tartarus: Well, I don't think we want to hit lkml volume
(1:14:16 PM) RP__: We do have some logical ways to separate things that now
actually make sense
(1:14:16 PM) Tartarus: But, it's not that hard to sort out pull requests
into one folder or multiple folders
(1:14:20 PM) fray: ya, personally that is my fear
(1:14:23 PM) Tartarus: and keep the discussion elsewhere
(1:14:51 PM) fray: I find most of hte interesting discussions (in oe-core)
these days are associated with pull requests..
(1:14:52 PM) RP__: Tartarus: why force people to each do that themselves
rather than ask people so subscribe to the right lists?
(1:15:06 PM) RP__: and people can just as easily put two lists into one
folder
(1:15:10 PM) Tartarus: because they have to do that anyways I suspect
(1:15:25 PM) Tartarus: ie on oe-core I don't read the consolidated pull
requests, just the originals
(1:15:33 PM) Tartarus: i suspect others do as well
(1:15:55 PM) RP__: Tartarus: That much is fine but I don't see the win for
merging the oe-core patches with meta-oe and other layers
(1:16:26 PM) fray: I currently see more downside then upside
(1:17:20 PM) Tartarus: Well, I see skimming oe-dev and only fully reading
oe-core as an example of why it's a bad thing :)
(1:17:39 PM) Tartarus: We want to encourage quality everywhere
(1:17:45 PM) RP__: Tartarus: We can't force people to read more email
(1:17:47 PM) Tartarus: not just oe-core, even if meta-oe, etc, etc might be
harder
(1:17:49 PM) Tartarus: No, we can't
(1:17:59 PM) RP__: Tartarus: I'm at capacity, I can't take more patch review
(1:18:13 PM) fray: I know of a lot of projects that are using oe-core (and
subscribe to the list), but don't have any plans to use meta-oe
(1:18:18 PM) fray: so thats another issue
(1:18:37 PM) Tartarus: Well, lets call this 2-1 in favor of the split and
move on
(1:18:47 PM) Tartarus: We talked, we've seemingly voted, that's that :)
(1:18:55 PM) RP__: The plan always was make a subset of OE that leads by
example
(1:19:21 PM) RP__: I do hope the quality in meta-oe improves over time based
on this example but I don't think we can lead it as directly
(1:19:36 PM) fray: I do think it's reasonable to raise the issue in the
future.. and I do think it's reasonable to monitor this stuff more and more
(as appropriate)
(1:20:17 PM) RP__: It may be worth proposing openembedded-devel becomes
openembedded-meta
(1:20:36 PM) fray: I would certainly support that..
(1:20:37 PM) RP__: I'd hope we can all agree the devel/user thing is never
going to work
(1:20:50 PM) RP__: So the -devel bit of the name kind of becomes pointless
(1:21:17 PM) Tartarus: yeah
(1:22:25 PM) RP__: 3-0 in favour? :)
(1:22:38 PM) Tartarus: No, but we can revisit later if needed ;)
(1:22:55 PM) Jefro1: keep in mind that changing the name of a mailing list
will mess with everyone's filters
(1:23:55 PM) RP__: Jefro1: I know, but this would settle the "users get
confused" problem at least and we could start referring to it as that in
descriptions
(1:24:23 PM) RP__: Lets move on if we're not going any further with this...
(1:24:40 PM) Tartarus: Yeah
(1:24:41 PM) Tartarus: agreed
(1:24:42 PM) Jefro1: ok - no action items yet?
(1:25:01 PM) RP__: We just need to clearly summarise this in the meeting
minutes
(1:25:28 PM) RP__: Which probably brings us to the next agenda item -
meeting minutes
(1:25:54 PM) RP__: I've heard concerns from the community that the minutes
are often late to the point of being useless :(
(1:26:08 PM) RP__: Partly this is whilst Jefro1 waits for us to Ack them
(1:26:16 PM) Jefro1: partly, but mostly it is my bug
(1:26:23 PM) RP__: and I know I personally do a bad job of that bit
(1:26:29 PM) fray: I thought we were much more on time..  I.e. minutes were
going out on Monday or so.. for the Thursday meeting.. we just havn't had
the meetings recently
(1:26:47 PM) RP__: fray: I think the community would like to see something
faster like Friday
(1:26:52 PM) Jefro1: I think it was never announced that meetings were more
or less going to 2x/week
(1:27:11 PM) Jefro1: I can get raw notes out on Friday, but not if they need
to be ack'd
(1:27:29 PM) RP__: I'm wondering what we could do to speed the process up
(1:27:45 PM) Jefro1: hire me a secretary
(1:27:47 PM) Tartarus: Well, I thought part of the problem was related to
when Jefro had machine issues, trips, etc
(1:28:00 PM) RP__: Jefro1: Join the queue ;-)
(1:28:02 PM) fray: ya, Monday seemed reasonable to me...
(1:28:14 PM) Jefro1: Tartarus it is, and I am just now back
(1:28:20 PM) fray: if the members don't agree, then we should do something
about it, but I'm not sure "what" at this point..
(1:28:27 PM) RP__: I'm wondering if we could do something un-acked on the
understanding we all could publish ammendmends
(1:28:33 PM) Jefro1: but I was effectively offline for like a month
(1:28:42 PM) fray: Note it and try to do better for the next few meetings?
 if we don't improve do something else about it?
(1:29:41 PM) ***RP__ can go for that. Again, I think we do need to
communicate this back to the community though
(1:30:05 PM) RP__: A lot of the problem isn't that we don't discuss, its
that people don't see those discussions
(1:30:33 PM) RP__: If Jefro1 is unavailable again, we need to do a better
job at covering that for example
(1:30:42 PM) fray: agreed
(1:30:50 PM) Tartarus: yeah
(1:31:11 PM) Jefro1: one thing that slows me down is summarizing, as it
often involves research to find out what the heck you guys are talking
about.  I could push out the raw transcript and then ask for help in
summarizing.
(1:31:25 PM) koen: so there is a meeting today
(1:31:41 PM) koen: apologies for being late
(1:32:07 PM) RP__: koen: np, I'm pleased you're better than you were
(1:32:13 PM) fray: ahh.. no problem.. didn't think you would be joining us..
 (should we re-hash briefly what'd been discussed)?
(1:33:05 PM) RP__: Summary - we talked about joining the mailing lists and
it was 2-1 keep separate for now
(1:33:15 PM) RP__: and we're going to do better at the minutes publishing
(1:34:29 PM) RP__: release status and elections are left as topics
(1:34:44 PM) koen: I'm for keeping the lists split, fwiw
(1:35:01 PM) RP__: koen: any  extra topics?
(1:35:27 PM) RP__: I guess we can cover infrastructure too
(1:35:35 PM) koen: maybe meta-oe ownership
(1:35:48 PM) koen: but that revolves around frans being an ignorant dick
(1:36:03 PM) ***Jefro1 notes something to remove from minutes
(1:36:15 PM) ***RP__ was just thinking that
(1:36:30 PM) RP__: ok, on release status, we're about to branch
(1:37:11 PM) RP__: The infrastructure issues mean we're behind a bit on
where I'd liked to have been
(1:37:11 PM) koen: about that
(1:37:25 PM) koen: it feels like this release stuff isn't happeningin
oe-core, but in yocto
(1:37:54 PM) RP__: Hmm, that isn't for want of trying :/
(1:39:00 PM) koen: all I see on the oe-core ml is "we are going to branch"
and "we are close to MS XXXX" type of messages
(1:39:31 PM) koen: the stuff one expects to see only goes to the yocto ml
(1:39:47 PM) RP__: koen: I guess we need to put more messages on OE-Core
about what is going on
(1:39:56 PM) koen: exactly
(1:39:58 PM) RP__: Although I've not seen much traffic at all on yocto tbh
(1:40:13 PM) ***koen has 200 unread messages on the yocto list
(1:40:30 PM) RP__: It didn't help that my email has been taken out by
infrastructure issues
(1:40:45 PM) RP__: and I lost all my imap context :(
(1:40:47 PM) koen: the october 5th date was a complete suprise to me (qt4
patch thread)
(1:41:03 PM) fray: apologies, I had to step out, I'm back now
(1:42:24 PM) RP__: ok, as an action I will send out some emails. We are
pretty late in the rc cycle even now though to start taking any major
changes
(1:42:54 PM) RP__: and to be fair I did send out an email a while ago giving
the expectations about what was happening even if there weren't specific
dates in it
(1:43:15 PM) fray: we had said (likely too long ago now, thus the issue)
that end of September was the rough date for oe-core "release")
(1:43:17 PM) ***koen is guilty of not reading every email completely :)
(1:44:32 PM) RP__: ok, let me mention infrastructure
(1:44:52 PM) RP__: People have noticed the Linux Foundation is having issues
(1:45:20 PM) RP__: Yocto's infrastructure was also affected but has now been
made independent and completely rebuilt
(1:45:32 PM) fray: has any of it directly affected oe-core?  I know I've
been indirectly affected between the bugzilla, and the couple of git repos I
couldn't access right away
(1:45:56 PM) RP__: Unfortunately as I mentioned, my email is an LF account
and won't be back for a while yet. I do get the email forwarded now though
(1:46:21 PM) RP__: fray: I think the OE infrastructure was unaffected apart
from a few ssh key changes
(1:46:33 PM) RP__: and some checks
(1:46:53 PM) fray: that is what I thought.. ok..
(1:47:03 PM) RP__: The main reason Yocto was hit at all was due to being on
the LF switch which it no longer us
(1:47:35 PM) RP__: and servers were rebuilt as a precaution, no evidence of
intrusion was found on any Yocto system as far as I know
(1:48:09 PM) ***Jefro1 concurs
(1:48:13 PM) RP__: So our main issues now are lack of kernel.org servers and
my email
(1:49:00 PM) RP__: So topics left - elections and meta-oe ownership
(1:49:15 PM) RP__: koen: did you talk to Philip about elections or were you
"distracted"?
(1:49:23 PM) koen: distracted
(1:49:36 PM) RP__: koen: are you able to handle that or do you want someone
else to?
(1:49:49 PM) koen: I can handle it
(1:49:56 PM) RP__: koen: ok, thanks
(1:49:57 PM) ***koen makes a note to poke philip again
(1:50:05 PM) RP__: that leaves meta-oe ownership
(1:51:26 PM) koen: some people were under the misguided notion that they
could "vote" on pull requests
(1:51:39 PM) koen: and frans asked who died and made me band leader
(1:52:06 PM) RP__: So can we as a group summarise how meta-oe works to
refresh people's memories
(1:52:27 PM) RP__: I have to admit I don't entirely remember the specifics
myself having concentrated on oe-core so much :/
(1:52:49 PM) koen: I started it and assumed command
(1:53:03 PM) koen: then I asked around if other people wanted ownership
(1:53:04 PM) fray: what I remember is us discussing maintainer roles and
multiple maintainers.. (people who volunteer to take specific recipes or
more preferribly sets of recipes.. i.e. meta/recipe-gnome
(1:53:16 PM) koen: which turned out to be no-one
(1:53:30 PM) fray: koen, that actually surprises me a bit..
(1:53:32 PM) koen: so for all the layers I'm listed as the maintainer,
except meta-xfce
(1:53:45 PM) fray: I expected not everything would get a maintainer.. but I
was hoping people would step up for select pieces
(1:53:51 PM) koen: but only I and the admins have write acces
(1:54:04 PM) koen: fray: apart from meta-xfce noone did
(1:54:09 PM) fray: I epxected write access would be extended to other
maintainers.. :)
(1:54:21 PM) koen: fray: martin handles meta-efl inofficially
(1:54:25 PM) fray: Hmmm..
(1:54:45 PM) koen: fray: it's OE, noone wants to have responsibility, only
moan
(1:54:48 PM) RP__: I think the intent was certainly to allow people to
create things more freely there and meta-oe was aimed to be maintained by a
group - I thought that was Tom, Koen and Khem
(1:54:49 PM) fray: So for at least the ones where there are maintainers, do
we have a maintainer file to let people know who is responsible for the
pull..
(1:55:11 PM) fray: I know Tom and Khem originally expressed interest.. but
I'm not sure anymore if thats the case
(1:55:25 PM) fray: a maintainers file could be incentive for a few people to
offer their services..
(1:55:34 PM) RP__: I think Mark and myself were notionally included too but
I don't think either of us have had the time give oe-core
(1:55:45 PM) fray: I don't right now.. :(
(1:55:49 PM) fray: or I would consider it
(1:56:28 PM) RP__: koen: So what is the process by which we can take on more
owners/contributors?
(1:56:35 PM) koen: dunno
(1:56:39 PM) fray: I envisioned a [potential] hierarchy of maintainer
roles.. layer, "group", and recipe..
(1:57:14 PM) fray: I definitely see certain people contributing to select
recipes or groups of recipes.. might simply make sense to ask those folks
while they're working on it, if they're willing to take a maintainer role..
(1:57:15 PM) koen: there's a handfull people contributing to meta-oe on a
regular basis and they all seem happy with the status quo
(1:57:28 PM) fray: assuming their code checkin quality is high enough it
would give them a more direct access to the repo..
(1:57:45 PM) fray: for the people who only contribute now and then, they'd
go through the regular contributors.. but that again assumes people want to
contribute
(1:58:24 PM) RP__: So we need to reiterate that process but also so
willingness to consider bringing in other maintainers
(1:58:30 PM) RP__: s/so/show/
(1:58:31 PM) koen: part of the problem is that meta-oe is the collection of
stuff not deemed important enough for oe-core
(1:58:43 PM) fray: for the record, my vision of meta-oe is "inclusive" of
many people and projects..  but with some heirarchy to maintain the overall
integrity of the code..
(1:59:17 PM) RP__: koen: right :/
(1:59:26 PM) fray: koen, I don't think of it that way.. I simply don't think
it's "core" items.. specifically it's items either in a research phase, or
items that a subset of users will want
(1:59:36 PM) fray: the oe-core items are things that "most" or at the least
"many" users will want
(2:00:34 PM) Tartarus: So, fwiw I think koen has been doing fine
(2:00:51 PM) Tartarus: Unless he wants to spread the burden a bit, I didn't
think we needed anything more than vacation/etc backup
(2:02:03 PM) fray: I don't have a problem with koen's work.. ;)
(2:02:07 PM) koen: the people I trust are pretty much overloaded
(2:02:17 PM) fray: I just think we need to continue to take opportunities to
invite others to contribute..
(2:02:22 PM) ***koen needs to talk to Tartarus' manager soon
(2:02:30 PM) fray: volunteering doesn't seem to be working, so inviting is
likely the second best approach
(2:02:57 PM) RP__: Lets keep an open mind and an eye open for anyone who can
help...
(2:03:18 PM) RP__: but people do need to demonstrate that they have the
time/ability/commitment
(2:03:22 PM) Tartarus: heh
(2:03:34 PM) fray: RP__ exactly
(2:03:52 PM) RP__: Tartarus: I want this on the record that we're open to
it...
(2:04:05 PM) Tartarus: Yes
(2:04:07 PM) Tartarus: agreed
(2:04:19 PM) Jefro1: ...and well summarized in the minutes
(2:04:26 PM) fray: ;)
(2:04:34 PM) Jefro1: (quickly)
(2:04:49 PM) koen: for oe classic we used to say "those who do the work get
to decide"
(2:05:19 PM) fray: I think for the most part, that still holds true.. but
it's not "automatic"
(2:05:34 PM) koen: but that became massively unpopular once inactive
loudmouths figured out email
(2:06:24 PM) fray: (i.e. if your work is not adequate, it will be turned
down... hopefully with suggestions on improving it..)
(2:07:16 PM) RP__: ok, I think we're probably done?
(2:07:22 PM) RP__: nearly on time :)


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e8a2013c8fe04ad13cf05
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgb(255, 255, 255); "><div><div>NOTE: mee=
tings are now every two weeks instead of weekly</div><div><br></div>MINUTES=
: OE-TSC meeting 16 Sept 2011<br clear=3D"all">
<div></div><div><br></div><div>Attending: Tom, Mark, Richard, Koen</div><di=
v>Apologies: Khem</div><div>Note: Jefro</div><div><br></div><div>----------=
----------------------------------------------</div><div>Agenda:</div><div>
1. pick a moderator</div><div>=A0 Jefro volunteers</div><div><br></div><div=
>2. ask for new agenda items</div><div>a. merging mailing lists</div><div>b=
. minutes issues, streamlining process</div><div>c. release status</div><di=
v>
d. infrastructure</div><div>e. elections</div><div>f. meta-oe ownership</di=
v><div><br></div><div>3. status on open subjects</div><div><br></div><div>-=
-------------------------------------------------------</div><div>Results</=
div>
<div><br></div><div>2a. Tom suggested merging the oe-core and oe-dev mailin=
g lists, on request after discussion on mailing list on Sept. 2, in order t=
o alleviate confusion about what sort of traffic belongs on each list. The =
split has proven to be useful in terms of figuring out which patches belong=
 where. After some discussion, the vote was 3-1 against merging the two lis=
ts. Instead, a new proposal is in place to rename oe-dev to oe-meta, which =
is a much more popular solution.</div>
<div><br></div><div>2b. Minutes are often &quot;too late to be useful&quot;=
. This is partly because meetings have been irregular over the past several=
 weeks, and partly because the note-taker (Jefro) has been more or less out=
 of touch for about a month due to conferences and vacation. =A0The group a=
cknowledges that public minutes are a positive aspect of the TSC that need =
to be out on time, and that provisions must be made when Jefro is unable to=
 provide minutes.=A0</div>
<div><br></div><div>2c. Richard acknowledges need to send explanatory messa=
ges to oe-core about upcoming branch on Oct 5. The branch was discussed som=
e time ago, but not brought up recently.</div><div><br></div><div>2d. Richa=
rd&#39;s email taken out by recent infrastructure issues at the Linux Found=
ation.</div>
<div><br></div><div>2e. Koen will talk to Philip about elections.</div><div=
><br></div><div>2f. There is some public confusion about how meta-oe works,=
 as Koen has become the de facto maintainer for all packages except meta-xf=
ce - no one else has stepped up for a maintainer role. Need to reiterate pr=
ocess to list and make provision for backup in case Koen is unavailable. Al=
l are happy with Koen&#39;s work, but will continue to take opportunities t=
o invite others to participate. People need to demonstrate ability and will=
ingness to commit time.</div>
<div><br></div><div>-------------------------------------------------------=
-</div><div>Raw Transcript</div><div><br></div><div>(12:58:16 PM) ***Tartar=
us is still here</div><div>(12:58:49 PM) fray: still here as well</div>
<div>(12:59:12 PM) ***Jefro1 is here too, but my net connection is bouncing=
 up and down like a rabid Jack Russell terrier</div><div>(1:02:32 PM) RP__:=
 So we have 3.5 TSC members</div><div>(1:02:39 PM) RP__: and Khem is missin=
g</div>
<div>(1:02:58 PM) Jefro1: 3 is a quorum, I believe</div><div>(1:03:00 PM) f=
ray: 3 is enough right?</div><div>(1:03:24 PM) RP__: it is a quorum</div><d=
iv>(1:03:34 PM) RP__: I believe we had hoped to have a full meeting though<=
/div>
<div>(1:03:52 PM) RP__: For the record I&#39;m in China next week and have =
no idea if I can make this slot</div><div>(1:03:56 PM) ***RP__ suspects not=
</div><div>(1:04:04 PM) Tartarus: Lets try bi-weekly then</div><div>(1:04:1=
2 PM) Tartarus: Koen will be in Dallas TX and probably busy</div>
<div>(1:04:40 PM) RP__: ok. Do we have an agenda?</div><div>(1:05:20 PM) Je=
fro1: I have been out for a few weeks - agenda items would include (1) pick=
 a moderator, (2) canvass for items, (3) status on open subjects</div><div>
(1:05:25 PM) Tartarus: Aside from the usual status bits, I wanted to bring =
up merging the MLs</div><div>(1:06:12 PM) Jefro1: I can volunteer to modera=
te=A0</div><div>(1:06:34 PM) Tartarus: I think that worked well last time y=
ou did</div>
<div>(1:06:57 PM) ***RP__ likes volunteers</div><div>(1:07:12 PM) ***Jefro1=
 likes to be liked=A0</div><div>(1:07:15 PM) ***RP__ would like to mention =
minutes of meetings and streamlining the process</div><div>(1:07:40 PM) Jef=
ro1: ok, although I already know what you are goign to say regarding minute=
s. any other agenda items?</div>
<div>(1:07:42 PM) RP__: We should talk about release status I guess</div><d=
iv>(1:07:51 PM) Tartarus: yeah</div><div>(1:08:05 PM) RP__: Jefro1: I&#39;v=
e been asked top raise the topic by the community</div><div>(1:08:14 PM) fr=
ay: I don&#39;t have any opens for this week..</div>
<div>(1:08:59 PM) RP__: elections I guess</div><div>(1:09:24 PM) Jefro1: go=
ing once... going twice...</div><div>(1:09:58 PM) Jefro1: ok, in order - me=
rging mailing lists=A0</div><div>(1:10:07 PM) Tartarus: So</div><div>(1:10:=
21 PM) Tartarus: I think it needs to be done, esp once we say oe classic (a=
side from the maint branch) is r/o</div>
<div>(1:10:30 PM) Tartarus: and here lists =3D=3D core and devel</div><div>=
(1:10:38 PM) ***RP__ strongly disagrees</div><div>(1:10:56 PM) RP__: I thin=
k the new OE structure needs a bit of a rethink when it comes to mailing li=
sts</div>
<div>(1:11:11 PM) fray: I&#39;m very torn on merging the lists..</div><div>=
(1:11:35 PM) fray: I can see why people want htem merged.. but I&#39;m afra=
id the overall volume level will make it hard to figure out what is oe-core=
 and what is meta-oe and what is &quot;something else&quot;</div>
<div>(1:11:36 PM) RP__: Putting everything on one mailing list just forces =
some people like me to need to filter it manually somehow</div><div>(1:11:4=
7 PM) fray: ya, I will certainly have to filter it as well..</div><div>
(1:12:11 PM) Tartarus: throwing meta-oe requests into another folder?</div>=
<div>(1:12:15 PM) fray: today I read oe-core pretty completely and skim oe-=
dev... I&#39;d want to keep being able to do the same thing</div><div>(1:12=
:31 PM) RP__: I understand the concerns about what different lists mean and=
 people not wanting to miss things</div>
<div>(1:12:38 PM) fray: I did see a request for meta-oe to be pull based or=
 &quot;meta-pull&quot; i.e. ask for a pull, no response you push</div><div>=
(1:12:50 PM) RP__: but I do think that having the OE-Core list will help pe=
ople not to missing things longer term</div>
<div>(1:13:20 PM) fray: even the volume of oe-core list today has gotten to=
 the point where it&#39;s hard for me to keep up.. even more email and I th=
ink it will lose people</div><div>(1:13:25 PM) fray: ...and lose value...</=
div>
<div>(1:13:56 PM) RP__: LKML makes an interesting example here - something =
that has grown huge and has no logical way to split it up</div><div>(1:14:0=
3 PM) Tartarus: Well, I don&#39;t think we want to hit lkml volume</div>
<div>(1:14:16 PM) RP__: We do have some logical ways to separate things tha=
t now actually make sense</div><div>(1:14:16 PM) Tartarus: But, it&#39;s no=
t that hard to sort out pull requests into one folder or multiple folders</=
div>
<div>(1:14:20 PM) fray: ya, personally that is my fear</div><div>(1:14:23 P=
M) Tartarus: and keep the discussion elsewhere</div><div>(1:14:51 PM) fray:=
 I find most of hte interesting discussions (in oe-core) these days are ass=
ociated with pull requests..</div>
<div>(1:14:52 PM) RP__: Tartarus: why force people to each do that themselv=
es rather than ask people so subscribe to the right lists?</div><div>(1:15:=
06 PM) RP__: and people can just as easily put two lists into one folder</d=
iv>
<div>(1:15:10 PM) Tartarus: because they have to do that anyways I suspect<=
/div><div>(1:15:25 PM) Tartarus: ie on oe-core I don&#39;t read the consoli=
dated pull requests, just the originals</div><div>(1:15:33 PM) Tartarus: i =
suspect others do as well</div>
<div>(1:15:55 PM) RP__: Tartarus: That much is fine but I don&#39;t see the=
 win for merging the oe-core patches with meta-oe and other layers</div><di=
v>(1:16:26 PM) fray: I currently see more downside then upside</div><div>
(1:17:20 PM) Tartarus: Well, I see skimming oe-dev and only fully reading o=
e-core as an example of why it&#39;s a bad thing :)</div><div>(1:17:39 PM) =
Tartarus: We want to encourage quality everywhere</div><div>(1:17:45 PM) RP=
__: Tartarus: We can&#39;t force people to read more email</div>
<div>(1:17:47 PM) Tartarus: not just oe-core, even if meta-oe, etc, etc mig=
ht be harder</div><div>(1:17:49 PM) Tartarus: No, we can&#39;t</div><div>(1=
:17:59 PM) RP__: Tartarus: I&#39;m at capacity, I can&#39;t take more patch=
 review</div>
<div>(1:18:13 PM) fray: I know of a lot of projects that are using oe-core =
(and subscribe to the list), but don&#39;t have any plans to use meta-oe</d=
iv><div>(1:18:18 PM) fray: so thats another issue</div><div>(1:18:37 PM) Ta=
rtarus: Well, lets call this 2-1 in favor of the split and move on</div>
<div>(1:18:47 PM) Tartarus: We talked, we&#39;ve seemingly voted, that&#39;=
s that :)</div><div>(1:18:55 PM) RP__: The plan always was make a subset of=
 OE that leads by example</div><div>(1:19:21 PM) RP__: I do hope the qualit=
y in meta-oe improves over time based on this example but I don&#39;t think=
 we can lead it as directly</div>
<div>(1:19:36 PM) fray: I do think it&#39;s reasonable to raise the issue i=
n the future.. and I do think it&#39;s reasonable to monitor this stuff mor=
e and more (as appropriate)</div><div>(1:20:17 PM) RP__: It may be worth pr=
oposing openembedded-devel becomes openembedded-meta</div>
<div>(1:20:36 PM) fray: I would certainly support that..</div><div>(1:20:37=
 PM) RP__: I&#39;d hope we can all agree the devel/user thing is never goin=
g to work</div><div>(1:20:50 PM) RP__: So the -devel bit of the name kind o=
f becomes pointless</div>
<div>(1:21:17 PM) Tartarus: yeah</div><div>(1:22:25 PM) RP__: 3-0 in favour=
? :)</div><div>(1:22:38 PM) Tartarus: No, but we can revisit later if neede=
d ;)</div><div>(1:22:55 PM) Jefro1: keep in mind that changing the name of =
a mailing list will mess with everyone&#39;s filters</div>
<div>(1:23:55 PM) RP__: Jefro1: I know, but this would settle the &quot;use=
rs get confused&quot; problem at least and we could start referring to it a=
s that in descriptions</div><div>(1:24:23 PM) RP__: Lets move on if we&#39;=
re not going any further with this...</div>
<div>(1:24:40 PM) Tartarus: Yeah</div><div>(1:24:41 PM) Tartarus: agreed</d=
iv><div>(1:24:42 PM) Jefro1: ok - no action items yet?</div><div>(1:25:01 P=
M) RP__: We just need to clearly summarise this in the meeting minutes</div=
>
<div>(1:25:28 PM) RP__: Which probably brings us to the next agenda item - =
meeting minutes</div><div>(1:25:54 PM) RP__: I&#39;ve heard concerns from t=
he community that the minutes are often late to the point of being useless =
:(</div>
<div>(1:26:08 PM) RP__: Partly this is whilst Jefro1 waits for us to Ack th=
em</div><div>(1:26:16 PM) Jefro1: partly, but mostly it is my bug</div><div=
>(1:26:23 PM) RP__: and I know I personally do a bad job of that bit</div>
<div>(1:26:29 PM) fray: I thought we were much more on time.. =A0I.e. minut=
es were going out on Monday or so.. for the Thursday meeting.. we just havn=
&#39;t had the meetings recently</div><div>(1:26:47 PM) RP__: fray: I think=
 the community would like to see something faster like Friday</div>
<div>(1:26:52 PM) Jefro1: I think it was never announced that meetings were=
 more or less going to 2x/week</div><div>(1:27:11 PM) Jefro1: I can get raw=
 notes out on Friday, but not if they need to be ack&#39;d</div><div>(1:27:=
29 PM) RP__: I&#39;m wondering what we could do to speed the process up</di=
v>
<div>(1:27:45 PM) Jefro1: hire me a secretary</div><div>(1:27:47 PM) Tartar=
us: Well, I thought part of the problem was related to when Jefro had machi=
ne issues, trips, etc</div><div>(1:28:00 PM) RP__: Jefro1: Join the queue ;=
-)</div>
<div>(1:28:02 PM) fray: ya, Monday seemed reasonable to me...</div><div>(1:=
28:14 PM) Jefro1: Tartarus it is, and I am just now back</div><div>(1:28:20=
 PM) fray: if the members don&#39;t agree, then we should do something abou=
t it, but I&#39;m not sure &quot;what&quot; at this point..</div>
<div>(1:28:27 PM) RP__: I&#39;m wondering if we could do something un-acked=
 on the understanding we all could publish ammendmends</div><div>(1:28:33 P=
M) Jefro1: but I was effectively offline for like a month</div><div>(1:28:4=
2 PM) fray: Note it and try to do better for the next few meetings? =A0if w=
e don&#39;t improve do something else about it?</div>
<div>(1:29:41 PM) ***RP__ can go for that. Again, I think we do need to com=
municate this back to the community though</div><div>(1:30:05 PM) RP__: A l=
ot of the problem isn&#39;t that we don&#39;t discuss, its that people don&=
#39;t see those discussions</div>
<div>(1:30:33 PM) RP__: If Jefro1 is unavailable again, we need to do a bet=
ter job at covering that for example</div><div>(1:30:42 PM) fray: agreed</d=
iv><div>(1:30:50 PM) Tartarus: yeah</div><div>(1:31:11 PM) Jefro1: one thin=
g that slows me down is summarizing, as it often involves research to find =
out what the heck you guys are talking about. =A0I could push out the raw t=
ranscript and then ask for help in summarizing.=A0</div>
<div>(1:31:25 PM) koen: so there is a meeting today</div><div>(1:31:41 PM) =
koen: apologies for being late</div><div>(1:32:07 PM) RP__: koen: np, I&#39=
;m pleased you&#39;re better than you were</div><div>(1:32:13 PM) fray: ahh=
.. no problem.. didn&#39;t think you would be joining us.. =A0(should we re=
-hash briefly what&#39;d been discussed)?</div>
<div>(1:33:05 PM) RP__: Summary - we talked about joining the mailing lists=
 and it was 2-1 keep separate for now</div><div>(1:33:15 PM) RP__: and we&#=
39;re going to do better at the minutes publishing</div><div>(1:34:29 PM) R=
P__: release status and elections are left as topics</div>
<div>(1:34:44 PM) koen: I&#39;m for keeping the lists split, fwiw</div><div=
>(1:35:01 PM) RP__: koen: any =A0extra topics?</div><div>(1:35:27 PM) RP__:=
 I guess we can cover infrastructure too</div><div>(1:35:35 PM) koen: maybe=
 meta-oe ownership</div>
<div>(1:35:48 PM) koen: but that revolves around frans being an ignorant di=
ck</div><div>(1:36:03 PM) ***Jefro1 notes something to remove from minutes<=
/div><div>(1:36:15 PM) ***RP__ was just thinking that</div><div>(1:36:30 PM=
) RP__: ok, on release status, we&#39;re about to branch</div>
<div>(1:37:11 PM) RP__: The infrastructure issues mean we&#39;re behind a b=
it on where I&#39;d liked to have been</div><div>(1:37:11 PM) koen: about t=
hat</div><div>(1:37:25 PM) koen: it feels like this release stuff isn&#39;t=
 happeningin oe-core, but in yocto</div>
<div>(1:37:54 PM) RP__: Hmm, that isn&#39;t for want of trying :/</div><div=
>(1:39:00 PM) koen: all I see on the oe-core ml is &quot;we are going to br=
anch&quot; and &quot;we are close to MS XXXX&quot; type of messages</div>
<div>(1:39:31 PM) koen: the stuff one expects to see only goes to the yocto=
 ml</div><div>(1:39:47 PM) RP__: koen: I guess we need to put more messages=
 on OE-Core about what is going on</div><div>(1:39:56 PM) koen: exactly</di=
v>
<div>(1:39:58 PM) RP__: Although I&#39;ve not seen much traffic at all on y=
octo tbh</div><div>(1:40:13 PM) ***koen has 200 unread messages on the yoct=
o list</div><div>(1:40:30 PM) RP__: It didn&#39;t help that my email has be=
en taken out by infrastructure issues</div>
<div>(1:40:45 PM) RP__: and I lost all my imap context :(</div><div>(1:40:4=
7 PM) koen: the october 5th date was a complete suprise to me (qt4 patch th=
read)</div><div>(1:41:03 PM) fray: apologies, I had to step out, I&#39;m ba=
ck now</div>
<div>(1:42:24 PM) RP__: ok, as an action I will send out some emails. We ar=
e pretty late in the rc cycle even now though to start taking any major cha=
nges</div><div>(1:42:54 PM) RP__: and to be fair I did send out an email a =
while ago giving the expectations about what was happening even if there we=
ren&#39;t specific dates in it</div>
<div>(1:43:15 PM) fray: we had said (likely too long ago now, thus the issu=
e) that end of September was the rough date for oe-core &quot;release&quot;=
)</div><div>(1:43:17 PM) ***koen is guilty of not reading every email compl=
etely :)</div>
<div>(1:44:32 PM) RP__: ok, let me mention infrastructure</div><div>(1:44:5=
2 PM) RP__: People have noticed the Linux Foundation is having issues</div>=
<div>(1:45:20 PM) RP__: Yocto&#39;s infrastructure was also affected but ha=
s now been made independent and completely rebuilt</div>
<div>(1:45:32 PM) fray: has any of it directly affected oe-core? =A0I know =
I&#39;ve been indirectly affected between the bugzilla, and the couple of g=
it repos I couldn&#39;t access right away</div><div>(1:45:56 PM) RP__: Unfo=
rtunately as I mentioned, my email is an LF account and won&#39;t be back f=
or a while yet. I do get the email forwarded now though</div>
<div>(1:46:21 PM) RP__: fray: I think the OE infrastructure was unaffected =
apart from a few ssh key changes</div><div>(1:46:33 PM) RP__: and some chec=
ks</div><div>(1:46:53 PM) fray: that is what I thought.. ok..</div><div>
(1:47:03 PM) RP__: The main reason Yocto was hit at all was due to being on=
 the LF switch which it no longer us</div><div>(1:47:35 PM) RP__: and serve=
rs were rebuilt as a precaution, no evidence of intrusion was found on any =
Yocto system as far as I know</div>
<div>(1:48:09 PM) ***Jefro1 concurs</div><div>(1:48:13 PM) RP__: So our mai=
n issues now are lack of=A0<a href=3D"http://kernel.org/" target=3D"_blank"=
 style=3D"color: rgb(0, 0, 204); ">kernel.org</a>=A0servers and my email</d=
iv><div>
(1:49:00 PM) RP__: So topics left - elections and meta-oe ownership</div><d=
iv>(1:49:15 PM) RP__: koen: did you talk to Philip about elections or were =
you &quot;distracted&quot;?</div><div>(1:49:23 PM) koen: distracted</div>
<div>(1:49:36 PM) RP__: koen: are you able to handle that or do you want so=
meone else to?</div><div>(1:49:49 PM) koen: I can handle it</div><div>(1:49=
:56 PM) RP__: koen: ok, thanks</div><div>(1:49:57 PM) ***koen makes a note =
to poke philip again</div>
<div>(1:50:05 PM) RP__: that leaves meta-oe ownership</div><div>(1:51:26 PM=
) koen: some people were under the misguided notion that they could &quot;v=
ote&quot; on pull requests</div><div>(1:51:39 PM) koen: and frans asked who=
 died and made me band leader</div>
<div>(1:52:06 PM) RP__: So can we as a group summarise how meta-oe works to=
 refresh people&#39;s memories</div><div>(1:52:27 PM) RP__: I have to admit=
 I don&#39;t entirely remember the specifics myself having concentrated on =
oe-core so much :/</div>
<div>(1:52:49 PM) koen: I started it and assumed command</div><div>(1:53:03=
 PM) koen: then I asked around if other people wanted ownership</div><div>(=
1:53:04 PM) fray: what I remember is us discussing maintainer roles and mul=
tiple maintainers.. (people who volunteer to take specific recipes or more =
preferribly sets of recipes.. i.e. meta/recipe-gnome</div>
<div>(1:53:16 PM) koen: which turned out to be no-one</div><div>(1:53:30 PM=
) fray: koen, that actually surprises me a bit..</div><div>(1:53:32 PM) koe=
n: so for all the layers I&#39;m listed as the maintainer, except meta-xfce=
</div>
<div>(1:53:45 PM) fray: I expected not everything would get a maintainer.. =
but I was hoping people would step up for select pieces</div><div>(1:53:51 =
PM) koen: but only I and the admins have write acces</div><div>(1:54:04 PM)=
 koen: fray: apart from meta-xfce noone did</div>
<div>(1:54:09 PM) fray: I epxected write access would be extended to other =
maintainers.. :)</div><div>(1:54:21 PM) koen: fray: martin handles meta-efl=
 inofficially</div><div>(1:54:25 PM) fray: Hmmm..</div><div>(1:54:45 PM) ko=
en: fray: it&#39;s OE, noone wants to have responsibility, only moan</div>
<div>(1:54:48 PM) RP__: I think the intent was certainly to allow people to=
 create things more freely there and meta-oe was aimed to be maintained by =
a group - I thought that was Tom, Koen and Khem</div><div>(1:54:49 PM) fray=
: So for at least the ones where there are maintainers, do we have a mainta=
iner file to let people know who is responsible for the pull..</div>
<div>(1:55:11 PM) fray: I know Tom and Khem originally expressed interest..=
 but I&#39;m not sure anymore if thats the case</div><div>(1:55:25 PM) fray=
: a maintainers file could be incentive for a few people to offer their ser=
vices..</div>
<div>(1:55:34 PM) RP__: I think Mark and myself were notionally included to=
o but I don&#39;t think either of us have had the time give oe-core</div><d=
iv>(1:55:45 PM) fray: I don&#39;t right now.. :(</div><div>(1:55:49 PM) fra=
y: or I would consider it</div>
<div>(1:56:28 PM) RP__: koen: So what is the process by which we can take o=
n more owners/contributors?</div><div>(1:56:35 PM) koen: dunno</div><div>(1=
:56:39 PM) fray: I envisioned a [potential] hierarchy of maintainer roles..=
 layer, &quot;group&quot;, and recipe..</div>
<div>(1:57:14 PM) fray: I definitely see certain people contributing to sel=
ect recipes or groups of recipes.. might simply make sense to ask those fol=
ks while they&#39;re working on it, if they&#39;re willing to take a mainta=
iner role..</div>
<div>(1:57:15 PM) koen: there&#39;s a handfull people contributing to meta-=
oe on a regular basis and they all seem happy with the status quo</div><div=
>(1:57:28 PM) fray: assuming their code checkin quality is high enough it w=
ould give them a more direct access to the repo..</div>
<div>(1:57:45 PM) fray: for the people who only contribute now and then, th=
ey&#39;d go through the regular contributors.. but that again assumes peopl=
e want to contribute</div><div>(1:58:24 PM) RP__: So we need to reiterate t=
hat process but also so willingness to consider bringing in other maintaine=
rs</div>
<div>(1:58:30 PM) RP__: s/so/show/</div><div>(1:58:31 PM) koen: part of the=
 problem is that meta-oe is the collection of stuff not deemed important en=
ough for oe-core</div><div>(1:58:43 PM) fray: for the record, my vision of =
meta-oe is &quot;inclusive&quot; of many people and projects.. =A0but with =
some heirarchy to maintain the overall integrity of the code..</div>
<div>(1:59:17 PM) RP__: koen: right :/</div><div>(1:59:26 PM) fray: koen, I=
 don&#39;t think of it that way.. I simply don&#39;t think it&#39;s &quot;c=
ore&quot; items.. specifically it&#39;s items either in a research phase, o=
r items that a subset of users will want</div>
<div>(1:59:36 PM) fray: the oe-core items are things that &quot;most&quot; =
or at the least &quot;many&quot; users will want</div><div>(2:00:34 PM) Tar=
tarus: So, fwiw I think koen has been doing fine</div><div>(2:00:51 PM) Tar=
tarus: Unless he wants to spread the burden a bit, I didn&#39;t think we ne=
eded anything more than vacation/etc backup</div>
<div>(2:02:03 PM) fray: I don&#39;t have a problem with koen&#39;s work.. ;=
)</div><div>(2:02:07 PM) koen: the people I trust are pretty much overloade=
d</div><div>(2:02:17 PM) fray: I just think we need to continue to take opp=
ortunities to invite others to contribute..</div>
<div>(2:02:22 PM) ***koen needs to talk to Tartarus&#39; manager soon</div>=
<div>(2:02:30 PM) fray: volunteering doesn&#39;t seem to be working, so inv=
iting is likely the second best approach</div><div>(2:02:57 PM) RP__: Lets =
keep an open mind and an eye open for anyone who can help...</div>
<div>(2:03:18 PM) RP__: but people do need to demonstrate that they have th=
e time/ability/commitment</div><div>(2:03:22 PM) Tartarus: heh</div><div>(2=
:03:34 PM) fray: RP__ exactly</div><div>(2:03:52 PM) RP__: Tartarus: I want=
 this on the record that we&#39;re open to it...</div>
<div>(2:04:05 PM) Tartarus: Yes</div><div>(2:04:07 PM) Tartarus: agreed</di=
v><div>(2:04:19 PM) Jefro1: ...and well summarized in the minutes</div><div=
>(2:04:26 PM) fray: ;)</div><div>(2:04:34 PM) Jefro1: (quickly)</div><div>
(2:04:49 PM) koen: for oe classic we used to say &quot;those who do the wor=
k get to decide&quot;</div><div>(2:05:19 PM) fray: I think for the most par=
t, that still holds true.. but it&#39;s not &quot;automatic&quot;</div>
<div>(2:05:34 PM) koen: but that became massively unpopular once inactive l=
oudmouths figured out email</div><div>(2:06:24 PM) fray: (i.e. if your work=
 is not adequate, it will be turned down... hopefully with suggestions on i=
mproving it..)</div>
<div>(2:07:16 PM) RP__: ok, I think we&#39;re probably done?</div><div>(2:0=
7:22 PM) RP__: nearly on time :)</div></div><div><br></div></span><div><br>=
</div>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/blog" target=3D"_=
blank">http://jefro.net/blog</a><div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>

--90e6ba6e8a2013c8fe04ad13cf05--
