Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1RHHuD-0000hS-PI; Fri, 21 Oct 2011 18:25:19 +0200
Received: by gyc15 with SMTP id 15so3877237gyc.6
	for <multiple recipients>; Fri, 21 Oct 2011 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=hV8tFcEmlSGsqKQTl0IsTXmruaJcG6MaYg3XrUps2As=;
	b=tpqfFg+3YKw5PLfz6yl7wvWyLo0wvbUgXdBMzMNDqj0DsRDX92rhQetbZJomWEkP6e
	udN3XOhis78ox5AkoU2CiJnmnSe19lhZ/pp+xCM4m/q/e25qzx6hwGxzqBtP8aWz7M2k
	wOdqmcOJVl9bS86rYD9H839UxR9XbTgy8WYs0=
MIME-Version: 1.0
Received: by 10.42.147.197 with SMTP id o5mr25601471icv.54.1319213959396; Fri,
	21 Oct 2011 09:19:19 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.41.165 with HTTP; Fri, 21 Oct 2011 09:19:19 -0700 (PDT)
Date: Fri, 21 Oct 2011 09:19:19 -0700
X-Google-Sender-Auth: Rm8DYEq38tWTFsxKC7P5MWPUOz0
Message-ID: <CA+YB3rZONqR9vKFiX8Nr5LzRaGa3AWztQTJZch1eoqCV=yQjzw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 20-Oct-2011
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
X-List-Received-Date: Fri, 21 Oct 2011 16:25:19 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8bce6ebe2304afd16f48

--90e6ba6e8bce6ebe2304afd16f48
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OE-TSC meeting 20-Oct-2011

Attending: Mark, Richard, Khem, Koen, Tom
Notes: Jefro
________________________________________________________
Agenda & Results

(0) GA
  - discussion about candidacy, maintainership & what to bring up & answer
at GA
  - ACTION: tsc introspection in next meeting
(1) distro fields
  - Saul planning to think about it & write proposal
(2) bugzilla
  - ACTION: Khem to shut down bugzilla, create a landing page
(4) oe-core status
  - ACTION: Khem & RP to drive tarball release to github
  - ACTION: Koen to look into git push hooks for mirroring
(6) PR stuff
  - ACTION: RP to refresh discussion on ML
(7) infrastructure status
  - server changes in process, no ETA on completion

Agendized but not discussed:
(3) oe-core with selinux, other security
(5) review tools
________________________________________________________
Raw Transcript:

(1:04:49 PM) Jefro: I think everyone is here
(1:05:54 PM) khem: topics I would like to bring up two things. Distro fields
and bring down bugzilla
(1:06:01 PM) RP__: Jefro: I think so
(1:06:02 PM) fray: ok.. so I have a potential agenda item..  oe-core with
things like selinux support... or other "security" infrastructure changes..
(1:06:15 PM) fray: (I'm happy to table that to the future as well)
(1:06:21 PM) RP__: OE-Core release (and Bitbake)
(1:06:45 PM) khem: review tools
(1:06:56 PM) RP__: There are also calls for the TSC to talk about the PR
stuff
(1:08:06 PM) Jefro: topics: (1) distro fields (2) bugzilla (3) oe-core with
selinux, other security (4) oe-core status (5) review tools (6) PR stuff
(1:09:27 PM) khem: RP__: oh lastly some infra updates too
(1:09:50 PM) Jefro: topics contd (7) infrastructure status
(1:11:20 PM) RP__: As a group is there anything we want to represent the GA?
(1:11:52 PM) khem: RP__: a short update I guess
(1:11:52 PM) fray: RP__ I have the opposite.. is there anything we want to
ask of the members at the GA?
(1:11:55 PM) khem: would be nice
(1:12:15 PM) RP__: fray: indeed, that is where I was going next :)
(1:12:33 PM) RP__: We've seen some feedback from Frans and he has some valid
questions
(1:12:50 PM) Jefro: topics (0) GA
(1:13:03 PM) RP__: Jefro: sorry ;-)
(1:13:11 PM) Jefro: :) no prob
(1:13:41 PM) RP__: So anything specific to take to the GA other than general
updates and what was said on the members list?
(1:14:04 PM) RP__: Did anyone disagree with anything said on the members
list re: the TSC?
(1:14:24 PM) Tartarus: nope
(1:14:37 PM) fray: RP__ are your eferring to the call for candidates?
(1:14:39 PM) khem: was ok. I think
(1:14:47 PM) RP__: fray: the discussion that followed, yes
(1:15:10 PM) koen: RP__: I disagree, fwiw
(1:15:20 PM) RP__: I think the summary was that there are things we are
doing well, there are some things that are less well. We're only human but
its useful to keep people's feedback in mind
(1:15:20 PM) fray: yup.. ok..
(1:15:35 PM) fray: I think many of the points there are valid..
(1:15:49 PM) koen: I still think the TSC should *NOT* have taken away
maintainership of meta-oe
(1:15:56 PM) RP__: Some things are inevitable even with the resources Yocto
brings etc, we can't do everything
(1:16:55 PM) fray: I always come back to.. maintainership of any OE project
is up to the member(s) contributing to it..
(1:17:19 PM) fray: if people want to be maintainers they need to step up and
say that.. otherwise the TSC needs to do whatever is necessary to further
the layers..
(1:17:34 PM) khem: I think we should do a TSC introspection in next meeting
(1:17:47 PM) khem: where we talk about where we lack and where we are ok
(1:17:51 PM) RP__: I think there will be further discussion at the GA - I
agree we should revisit the topic after the GA
(1:19:16 PM) RP__: Jefro: Might I suggest topic 1 unless there is more
discussion?
(1:20:34 PM) khem: I think pb's point on incubating new developers was what
stuck with me
(1:23:03 PM) RP__: khem: agreed, I think we do need to incubate new
developers
(1:30:52 PM) Jefro: ok to move to next topic? 6 to go
(1:31:19 PM) RP__: I'd suggest we do
(1:32:01 PM) RP__: For distro fields, I don't think its clear cut. I think
Saul is going to think about it and give a proposal
(1:32:19 PM) RP__: and since he uses those most heavily I'd like to hear
that feedback before we go further on that
(1:32:39 PM) RP__: so its probably fine to continue on the mailing list for
now unless anyone has any pressing comments to add?
(1:32:43 PM) koen: I have no strong opinion on the fields except that
monolithic files suck in general
(1:32:52 PM) RP__: I agree with that and I hear you
(1:33:30 PM) fray: are we talking the maintainer fields or?
(1:33:44 PM) khem: distro tracking fields file
(1:34:09 PM) RP__: fray: that and the other distro tracking data (manual
update data, other distro equivalence fields etc.)
(1:34:11 PM) fray: ok..  ya, agree.. I prefer them in the recipes (or at
least the recipes directory...)  but that can get messy
(1:34:17 PM) RP__: For bugzilla, I thought we'd agreed to shut it down?
(1:34:35 PM) fray: (oe bugzilla right?)  and yes, we had.. since it was more
or less abandoned
(1:34:58 PM) RP__: yes
(1:34:58 PM) koen: the question is about killing the instance
(1:35:05 PM) koen: it has been RO for months now
(1:35:27 PM) fray: do we have any analytics that show if people are using it
(in a RO capability) still?
(1:35:30 PM) Tartarus: Time for a little more ngix redirect magic?
(1:35:50 PM) ***koen needs to finish the ngix recipe
(1:36:04 PM) RP__: So the con of taking it down is the lack of the data
being public anymore?
(1:36:08 PM) RP__: Is anyone using it?
(1:36:22 PM) khem: RP__: there are links on mails and if people use them
then we should have a page where it gives the information
(1:36:24 PM) RP__: Is any of the data there still relevant? Are people
accessing it?
(1:36:29 PM) fray: ya.. if nobody is using it.. then I'm not concerned.. if
it's still getting used.. is it relevant?
(1:36:48 PM) khem: RP__: I have no idea, no one adds data to it but access
wise I dont know if people do
(1:37:00 PM) fray: I'm not against removing it entirely.. I just hate
historical items disappearing. especially if there may be useful data in it
to explain why something happened in the past
(1:37:29 PM) RP__: is keeping it alive read only a problem?
(1:37:35 PM) khem: fray: there are links that people used in mails and if
someone searches such mails thats the only thing that we should care since
we can not edit those links
(1:37:43 PM) khem: RP__: that server is going away
(1:37:58 PM) khem: and we need to set it up again on new server
(1:37:58 PM) RP__: khem: hard to migrate?
(1:38:07 PM) khem: RP__: I guess not
(1:38:09 PM) khem: but its work
(1:38:19 PM) RP__: khem: it might be worth the effort and easier than a
landing page for the email links?
(1:38:24 PM) khem: I personally would not want to do it
(1:38:33 PM) khem: RP__: yes a landing page
(1:38:35 PM) khem: is good
(1:38:51 PM) RP__: what I mean is its probably just as much work to
transition the data?
(1:38:57 PM) RP__: The data should be saved anyway?
(1:39:08 PM) khem: yes its there
(1:39:09 PM) fray: ya, at a minimum we should have a landing page explaining
it went away...  but I do prefer saving the data
(1:40:00 PM) khem: the databases are saved
(1:40:07 PM) khem: so it will be there
(1:40:14 PM) khem: just not visible
(1:40:27 PM) RP__: Perhaps ask on the mailing lists, see if anyone has
strong views?
(1:40:35 PM) khem: I already did
(1:40:42 PM) RP__: any response?
(1:40:53 PM) khem: most of responders were ok with it going away
(1:41:03 PM) khem: provided we have a landing page
(1:41:12 PM) fray: I'd say bring this up at the GA... but assuming we have a
landing page.. it'll go away
(1:41:27 PM) RP__: fray: not really a GA topic tbh
(1:41:43 PM) fray: I would have thought the members would be the ones to
care if it exists (or not)
(1:41:52 PM) fray: I'm not asking for a vote, just feedback
(1:42:02 PM) RP__: khem: I'm marginally in favour of setting up bugzilla to
share the data but only just if you see what I mean
(1:42:09 PM) khem: bugzilla was used by new user more often than seasoned
developes in my experience
(1:42:27 PM) khem: RP__: ok.
(1:42:40 PM) ***RP__ notes a timecheck
(1:42:55 PM) koen: I'd say a landing page is good enough
(1:43:02 PM) RP__: 5 items to go, 15 mins
(1:43:09 PM) koen: either we have a bugzilla or we don't, halfway sucks
(1:43:16 PM) ***Jefro notes the data can always be resurrected if the
complaints are loud
(1:43:38 PM) khem: I agree with koen
(1:44:03 PM) khem: and maintaining it is also some work plus the internet
traffic that comes from web crawlers
(1:44:21 PM) Jefro: if there is general agreement /me notes action item:
landing page, bugzilla removed
(1:44:32 PM) fray: no objection
(1:44:41 PM) Tartarus: no objection
(1:44:57 PM) RP__: (3) oe-core with selinux, other security (4) oe-core
status (5) review tools (6) PR stuff (7) infrastructure status
(1:45:14 PM) koen: can we move 6 up?
(1:45:17 PM) fray: we can table the discussion and move on or I can briefly
explain
(1:45:24 PM) fray: (and I'm happy to move it to the end)
(1:45:32 PM) RP__: We need to touch on 4 and 6 IMO
(1:45:53 PM) Tartarus: With 15min?  maybe just 4 and 7?
(1:46:01 PM) RP__: Do we want to release OE-Core/Bitbake? Assuming the
answer is yes, who is going to which pieces of it?
(1:46:03 PM) Tartarus: Lets start 4 tho :)
(1:46:28 PM) khem: yes release is needed
(1:46:34 PM) RP__: I have the trees in a position we could do it
(1:46:58 PM) RP__: I'd kind of like to do it in their current states since
that was was was heavily tested for Yocto 1.1
(1:47:21 PM) RP__: but I have no place to put the tarballs and I think the
release annoucement would look better coming from someone other than me?
(1:47:41 PM) khem: I think both release at same time but other layers
(1:48:06 PM) khem: RP__: I have opened the ticket to get
downloads.openembedded.org back
(1:48:12 PM) fray: yes release
(1:48:13 PM) khem: but its still pending
(1:48:19 PM) RP__: khem: ETA?
(1:48:25 PM) khem: no
(1:48:25 PM) koen: we can start with a tag in the repo
(1:48:28 PM) khem: I will ask
(1:48:30 PM) fray: can we tag now, prepare the release.. and sit on it?
(1:48:36 PM) fray: (until downloads.... is ready?)
(1:48:38 PM) koen: and put tarballs on github temporary
(1:48:41 PM) fray: what about github?
(1:48:46 PM) RP__: Call this bitbake 1.14.0 ?
(1:48:48 PM) fray: koen, ya..
(1:48:53 PM) fray: RP__ I would think so
(1:48:58 PM) khem: yes tars can be put any time
(1:48:59 PM) RP__: Its probably more than a point release at this point
(1:49:19 PM) koen: no opinion on bitbake versioning here
(1:49:28 PM) RP__: it sucks to have to use github for tarballs :/
(1:49:38 PM) RP__: khem: the problem is the DNS?
(1:49:49 PM) koen: at least github is fast
(1:50:04 PM) khem: I think yes. I thought Tom K will figure it
(1:50:19 PM) RP__: khem: Can you take the AR to drive that?
(1:50:25 PM) khem: ok
(1:50:32 PM) khem: however I am gone for next 3 weeks
(1:50:37 PM) khem: starting sunday
(1:50:53 PM) RP__: khem: hmm, will you have time before you go to ping him?
(1:51:10 PM) khem: yes surely
(1:51:20 PM) khem: hopefully we can set it us as well
(1:51:32 PM) RP__: So given no other volunteers, I guess I'll have to drive
the announcement and work through this?
(1:51:32 PM) ***Jefro notes action item for khem to drive tarball release to
github this week
(1:51:55 PM) koen: with a oe-core tag in place I can drive the meta-oe part
(1:52:05 PM) RP__: koen: ok, thanks
(1:52:09 PM) koen: (and meta-angstrom, meta-ti, setup-scripts, etc, but
that's not OE)
(1:52:31 PM) khem: RP__: I can help with announcement if you need and if its
planned before I leave
(1:53:00 PM) RP__: khem: with me moving atm, I'm not sure when/how i'm going
ot manage this :/
(1:53:10 PM) khem: sure ok
(1:53:11 PM) RP__: but I know our users are not happy and it needs to get
done
(1:53:31 PM) RP__: so, probably best to cover 7
(1:53:42 PM) koen: infra status
(1:53:43 PM) RP__: particularly if khem is missing
(1:53:50 PM) fray: I'm happy to help with the release... tell me what needs
to be done (announcements, wiki, etc).. but I don't have the git perms to do
the actual release work
(1:54:34 PM) RP__: Is the TSC happy for me to handle the announcement, I
guess that is the question. I'd not like to presume :)
(1:54:40 PM) koen:  I am
(1:54:55 PM) fray: i am
(1:55:00 PM) khem: on 7 we have moved all services to new VM
(1:55:03 PM) khem: I am ok
(1:55:03 PM) RP__: fray: I'll see how we can work this out and pull you in
if/as needed
(1:55:07 PM) fray: ok
(1:55:29 PM) RP__: khem: cool, thanks for the work you/Tom and anyone else
involved have put in!
(1:55:40 PM) ***Jefro 5 minute warning
(1:55:59 PM) khem: Tom also has build box installed and we should have
access to it soon
(1:56:05 PM) khem: but no ETA
(1:56:29 PM) RP__: khem: ok, cool :)
(1:56:51 PM) RP__: Do we want to extend the meeting to cover some of the
other topics?
(1:56:53 PM) khem: on old VM we have github mirroring crob tasks
(1:56:55 PM) RP__: or leave until next time?
(1:57:01 PM) Tartarus: next time for me
(1:57:04 PM) khem: that pb runs should move to new VM
(1:57:08 PM) khem: when he has time
(1:57:39 PM) koen: s/crob/cron/
(1:57:49 PM) koen: we should make them git push hooks
(1:58:07 PM) Jefro: any other high-priority items to discuss before GA next
week?
(1:58:07 PM) khem: yes its possible to make them hooks
(1:58:08 PM) koen: (I can look into that after ELC-E, we're going to do that
for meta-ti)
(1:58:25 PM) khem: I looked into them briefly
(1:58:50 PM) RP__: The push hooks would delay people's pushes though
wouldn't they?
(1:59:19 PM) koen: no idea, but I can look into that
(1:59:29 PM) khem: RP__: yes a bit
(1:59:33 PM) koen: Jefro: can you make that an AR for me?
(1:59:46 PM) ***Jefro notes action item for koen to look into push hooks
(2:00:03 PM) RP__: It is annoying if you have a raft of things to push out
and each one has time lag :/
(2:00:43 PM) koen: you'll be one of the 2 people affected, the other one is
me for meta-oe
(2:00:53 PM) khem: you mean multiple push ?
(2:00:57 PM) koen: and our bus factor reducers, saul, khem, etc
(2:01:06 PM) RP__: koen: right
(2:01:26 PM) RP__: It was "fun" watching the patchwork hooks slow things
down today
(2:03:04 PM) RP__: So that brings us past time :/
(2:03:05 PM) Jefro: remaining issues? I remember that Tartarus had to flee
at 2pm
(2:03:20 PM) koen: ironically the pw hooks refused to update the patch khem
sent :)
(2:03:46 PM) khem: koen: what was error ?
(2:04:02 PM) khem: was it generic error
(2:04:03 PM) koen: it couldn't correlate the patch I pushed with the one in
pw
(2:04:13 PM) khem: hmmm
(2:04:25 PM) khem: did it happen only for 1 patch or others too
(2:04:37 PM) RP__: The PR issues probably does need addressing and is a TSC
centric issue
(2:04:53 PM) RP__: We need to do that when we're all here thoug
(2:05:37 PM) khem: RP__: PR = problem report ?
(2:05:45 PM) khem: or the publicity
(2:05:55 PM) fray: package release
(2:06:06 PM) RP__: khem: The PR bumping discussion on the mailing list
(2:06:10 PM) koen: Package Revision
(2:06:12 PM) khem: oh I see
(2:07:40 PM) RP__: Are we closing the meeting?
(2:07:48 PM) koen: I still have time
(2:07:54 PM) fray: we can.. or we can discuss other things.. I have time
(2:08:07 PM) khem: I can spend some more mins
(2:08:28 PM) ***Jefro can stick around
(2:09:04 PM) fray: ok, next topic then?  PR (or is Tartarus gone?)
(2:09:24 PM) koen: I bet Tartarus is screaming at uboot
(2:09:34 PM) Tartarus: I'm semi here still
(2:09:36 PM) ***fray does that every now and then
(2:09:40 PM) Tartarus: Need to put Daughter down for a nap then run errands
(2:10:44 PM) RP__: So I think our future direction from an architecture
point of view needsto be to automate the PR bumps
(2:11:11 PM) RP__: Why? Currently its unclear which bumps are needed to
which packages and when. It also totally breaks down with layers
(2:11:28 PM) khem: RP__: I agree
(2:11:34 PM) RP__: The values would be better maintained alongside the
distro feeds that contain the used values
(2:11:38 PM) khem: so do we maintain a database or how
(2:11:44 PM) khem: ah
(2:12:00 PM) RP__: The trouble is this change will be a bit painful
(2:12:13 PM) RP__: We've put off enabling the BasicHash handler for a long
time now
(2:12:56 PM) RP__: I'd really like to see people thinking and working
towards addressing these issues. As such I refused a patch to OE core adding
manual PR increment functionality
(2:13:00 PM) khem: RP__: so if I dont have any feeds where do the initial
values come from
(2:13:19 PM) RP__: khem: We need some tools to handle some of these things
(2:13:26 PM) Tartarus: I think day 1 after a release is about when we need
to turn on the solution, or at least the current proposal
(2:13:33 PM) RP__: khem: they'd default to starting at 0
(2:13:34 PM) koen: the issue otavio raised is that the kernel.bbclass line
RP draws is arbitrary
(2:13:42 PM) Tartarus: So if basic hash should be able to get us most of the
way, time to switch
(2:13:49 PM) khem: RP__: so distro's then cant share feeds ?
(2:13:51 PM) RP__: Tartarus: I'd love to throw the BasicHash switch now
(2:13:54 PM) fray: ya.. this is something that is going to take time for
people to ome to terms with -- or object so strongly we revert..
(2:14:01 PM) Tartarus: I vote now, and am mostly afk, now
(2:14:04 PM) fray: the hash thing needs to be done ASAP..  the PR thing is
what may or may not work
(2:14:05 PM) koen: Tartarus: you will kill rebuilding from (old) tags
(2:14:08 PM) RP__: khem: only if they sync up PR data
(2:14:11 PM) fray: but I vote as soon as we tag and release
(2:14:36 PM) koen: this auto-pr things needs to be done in a branch and
merged when it works good enough
(2:14:38 PM) RP__: We do have the network PR service that we created a while
back
(2:14:57 PM) fray: I assume the auto-pr stuff is the network PR service, w/o
the network
(2:15:05 PM) koen: I think I've already shown that that network PR thingy is
worthless for any real work?
(2:15:08 PM) RP__: I think that with some not so difficult improvements to
save the data to metadata and back we can address the reproducibility issues
(2:15:28 PM) RP__: koen: Its not worthless, you've just found a usecase it
doesn't cover
(2:15:35 PM) RP__: koen: the world isn't black/white
(2:15:42 PM) RP__: fray: yes
(2:16:07 PM) koen: I'm trying to make it more black and white so that it
will go in a branch first
(2:16:09 PM) fray: ya, in that case, I'm fairly comfortable with it.. enough
to explain to the world the possible pain and to turn it on
(2:16:33 PM) RP__: fray: I do understand this will cause koen and anyone
else with distro feeds some problems
(2:16:34 PM) fray: but geting the updated hashing first is key IMHO..
(2:16:44 PM) koen: if the changes are really "not so diffucult" the branch
will be short lived
(2:16:53 PM) fray: we SHOULD be able to seed the data though with the feed
info, right?
(2:17:09 PM) RP__: fray: the feed info is the current set of PR values
(2:17:21 PM) RP__: which I guess we need to "export" to an include
(2:17:26 PM) khem: I see
(2:17:28 PM) fray: ya, current PR's which can be tied back to specific hash
values right?
(2:17:41 PM) RP__: once we can import/export the data from the PR service to
an include we should be good to go IMO
(2:17:53 PM) fray: that was my thought as well..
(2:17:54 PM) RP__: fray: hash value is distro specific
(2:18:20 PM) khem: RP__: do I assume its going to be a file or some such
that will be updated after build ?
(2:18:21 PM) RP__: So my vote is not for now instantly but very soon
(2:18:22 PM) koen: I still say it should live in a branch at first
(2:18:28 PM) RP__: once we have the import/export script
(2:18:46 PM) koen: I've seen the eglibc fallout from a recent experiment
(2:18:49 PM) RP__: and since this will happen soon, we shouldn't be taking
PR bump type features into OE-Core at this point
(2:18:55 PM) fray: koen, my only problem with "branches" is getting people
to use them
(2:19:19 PM) koen: my problem is with people knowingly breaking master using
that excuse
(2:19:50 PM) fray: well, the goal is to not knowingly break master with this
change..  but to expect (and react) to the unknown issues
(2:20:04 PM) koen: I know I'm not going to live test it in master, I'll roll
back to the release
(2:20:30 PM) koen: testing a branch is no problem
(2:20:38 PM) koen: since this will be messy
(2:20:44 PM) khem: put it in master-next
(2:20:56 PM) khem: and we can test it out
(2:20:58 PM) ***RP__ will make no comment about how long the feedback for
the network PR service took
(2:21:31 PM) koen: it was too hard to test for me, being based on poky and
all
(2:21:39 PM) koen: </lame excuse>
(2:21:56 PM) ***RP__ tries not to choke ;-)
(2:22:25 PM) RP__: So, I'm suggesting that we so look to do this stuff soon
once we have the import/export scripting working and hopefully once koen is
happy we have some kind of solution in place than can work for his usecases
(2:22:42 PM) fray: seems reasonable
(2:22:45 PM) RP__: this will rely on some mailing list discussions, testing
and some help
(2:22:53 PM) koen: and in the meantime can we apply that kernel.bbclass
path?
(2:22:57 PM) RP__: and it will be with some of the Yocto PRC team doing some
of this
(2:23:00 PM) RP__: koen: no
(2:23:02 PM) koen: I really want to remove it from meta-oe
(2:23:44 PM) koen: OTOH, I can ignore any hatemail about meta-oe overrides
now
(2:24:29 PM) RP__: koen: How many more patches will I get if I take that
one?
(2:24:58 PM) koen: to sync meta-oe classes involving PR? none
(2:25:08 PM) RP__: koen: For PR in general
(2:25:25 PM) koen: you're saying any patch touching PR will get
rejected??!?!
(2:25:53 PM) RP__: For bulk PR handling with new variables I'll reject
(2:26:07 PM) koen: there's only INC_PR and MACHINE_KERNEL_PR
(2:26:11 PM) RP__: I'll continue to grudgingly tolerate the PR bumps for now
(2:26:15 PM) koen: in classic OE
(2:26:23 PM) RP__: koen: but people want to add more
(2:26:36 PM) koen: since only otavio and I could be arsed to 'fix' PR
problems there
(2:26:58 PM) koen: RP__: 'people' don't get PR anyway
(2:27:12 PM) koen: so I wouldn't worry about magic PR helpers appearing
(2:27:30 PM) RP__: koen: so we need to start educating them and the
MACHINE_KERNEL_PR sends totally the wrong message :/
(2:27:45 PM) RP__: I know you understand the issue, others will not
(2:27:48 PM) koen: it does, but it will remove a bbclass overlay
(2:27:49 PM) khem: RP__: take it for now and then drop it when Auto PR is in
(2:28:05 PM) RP__: Then I'll be accused of breaking existing functionality
(2:28:08 PM) koen: I'm getting too much crap about it being overlayed
(2:28:31 PM) koen: (which I can now say is not my fault, pesky OE core
maintainer ;)
(2:28:38 PM) ***RP__ gets too much crap about PR values in general
(2:29:09 PM) RP__: koen: you can blame me for now, this isn't going to be
for long
(2:29:13 PM) fray: PR is one of those things you need a distribution
maintainer and policy for.. otherwise inconsistencies easily creep in.. :(
(2:29:14 PM) koen: RP__: consider that I silently 'repair' feeds a few times
a week due to oe-core messing up upgrade paths
(2:29:35 PM) RP__: koen: I have really tried to help with this
(2:29:39 PM) koen: I know
(2:29:48 PM) koen: that's why I don't report every incident
(2:29:51 PM) RP__: koen: This is also why I want to get something automated
(2:29:57 PM) khem: RP__: OK so the network PR stuff is what we want to use
here
(2:30:30 PM) koen: but please realize that in general oe-core is a huge pain
for people with a binary distro feed
(2:30:39 PM) koen: we all try hard, but we are failing
(2:30:57 PM) RP__: koen: This is why we need a change in approach
(2:31:00 PM) koen: exactly
(2:31:22 PM) khem: koen: I think having PR controlled by distro's is sane I
guess ?
(2:31:36 PM) koen: doesn't really matter where
(2:32:08 PM) fray: PR is a distribution "issue".. and we need to provide the
tools (and data) to make it easier to manager
(2:32:08 PM) koen: ideally a recipe maintainer knows best
(2:32:20 PM) koen: e.g. xorg changed abi
(2:32:32 PM) koen: so things like xf86-video-fbdev need rebuilding
(2:32:48 PM) koen: (I 'repaired' the feeds for that yesterday)
(2:33:11 PM) fray: yup these are the things that hashing and auto PR should
help with
(2:33:14 PM) fray: (I hope)
(2:33:14 PM) koen: the fs-perms.txt change in angstrom is another
(2:33:20 PM) RP__: koen: Are false positives a problem?
(2:33:26 PM) koen: RP__: not for me
(2:33:38 PM) khem: koen: I think if we rebuild more its suboptimal but ok I
think
(2:33:44 PM) RP__: koen: ok
(2:34:03 PM) koen: PR is really a "better safe than sorry" type of thing
(2:34:04 PM) RP__: We'll obviously look to not rebuild more than we need but
its going to take a little experimentation
(2:34:18 PM) khem: agree
(2:34:28 PM) RP__: the checksum code does er on the side of false positives
(2:34:54 PM) khem: RP__: why not send a proposal
(2:34:55 PM) khem: to ml
(2:35:34 PM) RP__: khem: It has been discussed before, just a while ago.
 Refreshing people's memory is probably good I guess
(2:35:39 PM) RP__: but release takes priority
(2:36:04 PM) khem: ok yes I think release should happen before this change
for sure
(2:36:27 PM) koen: I'd still like it to sit in master-next for a while
(2:36:55 PM) RP__: koen: Lets see how this goes
(2:37:10 PM) ***RP__ next needs to explain what the problem is to the Yocto
PRC people
(2:37:18 PM) khem: koen: RP__ yes master-next should have it for a while so
distro maintainers can adapt to it in background
(2:37:21 PM) ***RP__ might as well give up on a day off tomorrow
(2:37:32 PM) RP__: and the house moving thing
(2:37:48 PM) khem: RP__: you need 25th hour
(2:37:58 PM) RP__: khem: and the rest :/
(2:38:18 PM) khem: thats what it is for sleep 1 hr :)
(2:38:23 PM) khem: and work 24
(2:38:55 PM) khem: I need to make a move
(2:39:12 PM) khem: bye see u in 3 weeks
(2:39:25 PM) RP__: khem: safe travels!
(2:39:31 PM) fray: sounds good!  have a good time
(2:39:40 PM) khem: I will
(2:39:55 PM) khem: watch out me flying over eu on 26th :)
(2:40:07 PM) khem: I will wave when I am over Germany :)
(2:40:30 PM) Jefro: safe travels khem
(2:40:37 PM) khem: thx
(2:40:44 PM) khem left the room.
(2:41:02 PM) ***koen also needs to zzz soon
(2:41:36 PM) Jefro: meeting adjourned?
(2:43:12 PM) RP__: Jefro: yes! :)


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e8bce6ebe2304afd16f48
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; f=
ont-size: 13px; background-color: rgb(255, 255, 255); "><div>MINUTES: OE-TS=
C meeting 20-Oct-2011</div><div><br></div><div>Attending: Mark, Richard, Kh=
em, Koen, Tom</div>
<div>Notes: Jefro=A0</div><div>____________________________________________=
____________</div><div>Agenda &amp; Results</div><div><br></div><div>(0) GA=
=A0</div><div>=A0 - discussion about candidacy, maintainership &amp; what t=
o bring up &amp; answer at GA</div>
<div>=A0 - ACTION: tsc introspection in next meeting</div><div>(1) distro f=
ields=A0</div><div>=A0 - Saul planning to think about it &amp; write propos=
al</div><div>(2) bugzilla=A0</div><div>=A0 - ACTION: Khem to shut down bugz=
illa, create a landing page</div>
<div>(4) oe-core status</div><div>=A0 - ACTION: Khem &amp; RP to drive tarb=
all release to github</div><div>=A0 - ACTION: Koen to look into git push ho=
oks for mirroring</div><div>(6) PR stuff</div><div>=A0 - ACTION: RP to refr=
esh discussion on ML</div>
<div>(7) infrastructure status</div><div>=A0 - server changes in process, n=
o ETA on completion</div><div>=A0=A0</div><div>Agendized but not discussed:=
=A0</div><div>(3) oe-core with selinux, other security=A0</div><div>(5) rev=
iew tools=A0</div>
<div>________________________________________________________</div><div>Raw=
 Transcript:</div><div><br></div><div>(1:04:49 PM) Jefro: I think everyone =
is here</div><div>(1:05:54 PM) khem: topics I would like to bring up two th=
ings. Distro fields and bring down bugzilla</div>
<div>(1:06:01 PM) RP__: Jefro: I think so</div><div>(1:06:02 PM) fray: ok..=
 so I have a potential agenda item.. =A0oe-core with things like selinux su=
pport... or other &quot;security&quot; infrastructure changes..</div><div>
(1:06:15 PM) fray: (I&#39;m happy to table that to the future as well)</div=
><div>(1:06:21 PM) RP__: OE-Core release (and Bitbake)</div><div>(1:06:45 P=
M) khem: review tools</div><div>(1:06:56 PM) RP__: There are also calls for=
 the TSC to talk about the PR stuff</div>
<div>(1:08:06 PM) Jefro: topics: (1) distro fields (2) bugzilla (3) oe-core=
 with selinux, other security (4) oe-core status (5) review tools (6) PR st=
uff</div><div>(1:09:27 PM) khem: RP__: oh lastly some infra updates too</di=
v>
<div>(1:09:50 PM) Jefro: topics contd (7) infrastructure status</div><div>(=
1:11:20 PM) RP__: As a group is there anything we want to represent the GA?=
</div><div>(1:11:52 PM) khem: RP__: a short update I guess</div><div>(1:11:=
52 PM) fray: RP__ I have the opposite.. is there anything we want to ask of=
 the members at the GA?</div>
<div>(1:11:55 PM) khem: would be nice</div><div>(1:12:15 PM) RP__: fray: in=
deed, that is where I was going next :)</div><div>(1:12:33 PM) RP__: We&#39=
;ve seen some feedback from Frans and he has some valid questions</div>
<div>(1:12:50 PM) Jefro: topics (0) GA=A0</div><div>(1:13:03 PM) RP__: Jefr=
o: sorry ;-)</div><div>(1:13:11 PM) Jefro: :) no prob</div><div>(1:13:41 PM=
) RP__: So anything specific to take to the GA other than general updates a=
nd what was said on the members list?</div>
<div>(1:14:04 PM) RP__: Did anyone disagree with anything said on the membe=
rs list re: the TSC?</div><div>(1:14:24 PM) Tartarus: nope</div><div>(1:14:=
37 PM) fray: RP__ are your eferring to the call for candidates?</div><div>
(1:14:39 PM) khem: was ok. I think</div><div>(1:14:47 PM) RP__: fray: the d=
iscussion that followed, yes</div><div>(1:15:10 PM) koen: RP__: I disagree,=
 fwiw</div><div>(1:15:20 PM) RP__: I think the summary was that there are t=
hings we are doing well, there are some things that are less well. We&#39;r=
e only human but its useful to keep people&#39;s feedback in mind</div>
<div>(1:15:20 PM) fray: yup.. ok..</div><div>(1:15:35 PM) fray: I think man=
y of the points there are valid..</div><div>(1:15:49 PM) koen: I still thin=
k the TSC should *NOT* have taken away maintainership of meta-oe</div><div>
(1:15:56 PM) RP__: Some things are inevitable even with the resources Yocto=
 brings etc, we can&#39;t do everything</div><div>(1:16:55 PM) fray: I alwa=
ys come back to.. maintainership of any OE project is up to the member(s) c=
ontributing to it..</div>
<div>(1:17:19 PM) fray: if people want to be maintainers they need to step =
up and say that.. otherwise the TSC needs to do whatever is necessary to fu=
rther the layers..</div><div>(1:17:34 PM) khem: I think we should do a TSC =
introspection in next meeting</div>
<div>(1:17:47 PM) khem: where we talk about where we lack and where we are =
ok</div><div>(1:17:51 PM) RP__: I think there will be further discussion at=
 the GA - I agree we should revisit the topic after the GA</div><div>(1:19:=
16 PM) RP__: Jefro: Might I suggest topic 1 unless there is more discussion=
?</div>
<div>(1:20:34 PM) khem: I think pb&#39;s point on incubating new developers=
 was what stuck with me</div><div>(1:23:03 PM) RP__: khem: agreed, I think =
we do need to incubate new developers</div><div>(1:30:52 PM) Jefro: ok to m=
ove to next topic? 6 to go</div>
<div>(1:31:19 PM) RP__: I&#39;d suggest we do</div><div>(1:32:01 PM) RP__: =
For distro fields, I don&#39;t think its clear cut. I think Saul is going t=
o think about it and give a proposal</div><div>(1:32:19 PM) RP__: and since=
 he uses those most heavily I&#39;d like to hear that feedback before we go=
 further on that</div>
<div>(1:32:39 PM) RP__: so its probably fine to continue on the mailing lis=
t for now unless anyone has any pressing comments to add?</div><div>(1:32:4=
3 PM) koen: I have no strong opinion on the fields except that monolithic f=
iles suck in general</div>
<div>(1:32:52 PM) RP__: I agree with that and I hear you</div><div>(1:33:30=
 PM) fray: are we talking the maintainer fields or?</div><div>(1:33:44 PM) =
khem: distro tracking fields file</div><div>(1:34:09 PM) RP__: fray: that a=
nd the other distro tracking data (manual update data, other distro equival=
ence fields etc.)</div>
<div>(1:34:11 PM) fray: ok.. =A0ya, agree.. I prefer them in the recipes (o=
r at least the recipes directory...) =A0but that can get messy</div><div>(1=
:34:17 PM) RP__: For bugzilla, I thought we&#39;d agreed to shut it down?</=
div>
<div>(1:34:35 PM) fray: (oe bugzilla right?) =A0and yes, we had.. since it =
was more or less abandoned</div><div>(1:34:58 PM) RP__: yes</div><div>(1:34=
:58 PM) koen: the question is about killing the instance</div><div>(1:35:05=
 PM) koen: it has been RO for months now</div>
<div>(1:35:27 PM) fray: do we have any analytics that show if people are us=
ing it (in a RO capability) still?</div><div>(1:35:30 PM) Tartarus: Time fo=
r a little more ngix redirect magic?</div><div>(1:35:50 PM) ***koen needs t=
o finish the ngix recipe</div>
<div>(1:36:04 PM) RP__: So the con of taking it down is the lack of the dat=
a being public anymore?</div><div>(1:36:08 PM) RP__: Is anyone using it?</d=
iv><div>(1:36:22 PM) khem: RP__: there are links on mails and if people use=
 them then we should have a page where it gives the information</div>
<div>(1:36:24 PM) RP__: Is any of the data there still relevant? Are people=
 accessing it?</div><div>(1:36:29 PM) fray: ya.. if nobody is using it.. th=
en I&#39;m not concerned.. if it&#39;s still getting used.. is it relevant?=
</div>
<div>(1:36:48 PM) khem: RP__: I have no idea, no one adds data to it but ac=
cess wise I dont know if people do</div><div>(1:37:00 PM) fray: I&#39;m not=
 against removing it entirely.. I just hate historical items disappearing. =
especially if there may be useful data in it to explain why something happe=
ned in the past</div>
<div>(1:37:29 PM) RP__: is keeping it alive read only a problem?</div><div>=
(1:37:35 PM) khem: fray: there are links that people used in mails and if s=
omeone searches such mails thats the only thing that we should care since w=
e can not edit those links</div>
<div>(1:37:43 PM) khem: RP__: that server is going away</div><div>(1:37:58 =
PM) khem: and we need to set it up again on new server</div><div>(1:37:58 P=
M) RP__: khem: hard to migrate?</div><div>(1:38:07 PM) khem: RP__: I guess =
not</div>
<div>(1:38:09 PM) khem: but its work</div><div>(1:38:19 PM) RP__: khem: it =
might be worth the effort and easier than a landing page for the email link=
s?</div><div>(1:38:24 PM) khem: I personally would not want to do it</div>
<div>(1:38:33 PM) khem: RP__: yes a landing page</div><div>(1:38:35 PM) khe=
m: is good</div><div>(1:38:51 PM) RP__: what I mean is its probably just as=
 much work to transition the data?</div><div>(1:38:57 PM) RP__: The data sh=
ould be saved anyway?</div>
<div>(1:39:08 PM) khem: yes its there</div><div>(1:39:09 PM) fray: ya, at a=
 minimum we should have a landing page explaining it went away... =A0but I =
do prefer saving the data</div><div>(1:40:00 PM) khem: the databases are sa=
ved</div>
<div>(1:40:07 PM) khem: so it will be there</div><div>(1:40:14 PM) khem: ju=
st not visible</div><div>(1:40:27 PM) RP__: Perhaps ask on the mailing list=
s, see if anyone has strong views?</div><div>(1:40:35 PM) khem: I already d=
id</div>
<div>(1:40:42 PM) RP__: any response?</div><div>(1:40:53 PM) khem: most of =
responders were ok with it going away</div><div>(1:41:03 PM) khem: provided=
 we have a landing page</div><div>(1:41:12 PM) fray: I&#39;d say bring this=
 up at the GA... but assuming we have a landing page.. it&#39;ll go away</d=
iv>
<div>(1:41:27 PM) RP__: fray: not really a GA topic tbh</div><div>(1:41:43 =
PM) fray: I would have thought the members would be the ones to care if it =
exists (or not)</div><div>(1:41:52 PM) fray: I&#39;m not asking for a vote,=
 just feedback</div>
<div>(1:42:02 PM) RP__: khem: I&#39;m marginally in favour of setting up bu=
gzilla to share the data but only just if you see what I mean</div><div>(1:=
42:09 PM) khem: bugzilla was used by new user more often than seasoned deve=
lopes in my experience</div>
<div>(1:42:27 PM) khem: RP__: ok.</div><div>(1:42:40 PM) ***RP__ notes a ti=
mecheck</div><div>(1:42:55 PM) koen: I&#39;d say a landing page is good eno=
ugh</div><div>(1:43:02 PM) RP__: 5 items to go, 15 mins</div><div>(1:43:09 =
PM) koen: either we have a bugzilla or we don&#39;t, halfway sucks</div>
<div>(1:43:16 PM) ***Jefro notes the data can always be resurrected if the =
complaints are loud</div><div>(1:43:38 PM) khem: I agree with koen</div><di=
v>(1:44:03 PM) khem: and maintaining it is also some work plus the internet=
 traffic that comes from web crawlers</div>
<div>(1:44:21 PM) Jefro: if there is general agreement /me notes action ite=
m: landing page, bugzilla removed</div><div>(1:44:32 PM) fray: no objection=
</div><div>(1:44:41 PM) Tartarus: no objection</div><div>(1:44:57 PM) RP__:=
 (3) oe-core with selinux, other security (4) oe-core status (5) review too=
ls (6) PR stuff (7) infrastructure status</div>
<div>(1:45:14 PM) koen: can we move 6 up?</div><div>(1:45:17 PM) fray: we c=
an table the discussion and move on or I can briefly explain</div><div>(1:4=
5:24 PM) fray: (and I&#39;m happy to move it to the end)</div><div>(1:45:32=
 PM) RP__: We need to touch on 4 and 6 IMO</div>
<div>(1:45:53 PM) Tartarus: With 15min? =A0maybe just 4 and 7?</div><div>(1=
:46:01 PM) RP__: Do we want to release OE-Core/Bitbake? Assuming the answer=
 is yes, who is going to which pieces of it?</div><div>(1:46:03 PM) Tartaru=
s: Lets start 4 tho :)</div>
<div>(1:46:28 PM) khem: yes release is needed</div><div>(1:46:34 PM) RP__: =
I have the trees in a position we could do it</div><div>(1:46:58 PM) RP__: =
I&#39;d kind of like to do it in their current states since that was was wa=
s heavily tested for Yocto 1.1</div>
<div>(1:47:21 PM) RP__: but I have no place to put the tarballs and I think=
 the release annoucement would look better coming from someone other than m=
e?</div><div>(1:47:41 PM) khem: I think both release at same time but other=
 layers</div>
<div>(1:48:06 PM) khem: RP__: I have opened the ticket to get=A0<a href=3D"=
http://downloads.openembedded.org/" target=3D"_blank" style=3D"color: rgb(0=
, 0, 204); ">downloads.openembedded.org</a>=A0back</div><div>(1:48:12 PM) f=
ray: yes release</div>
<div>(1:48:13 PM) khem: but its still pending</div><div>(1:48:19 PM) RP__: =
khem: ETA?</div><div>(1:48:25 PM) khem: no</div><div>(1:48:25 PM) koen: we =
can start with a tag in the repo</div><div>(1:48:28 PM) khem: I will ask</d=
iv>
<div>(1:48:30 PM) fray: can we tag now, prepare the release.. and sit on it=
?</div><div>(1:48:36 PM) fray: (until downloads.... is ready?)</div><div>(1=
:48:38 PM) koen: and put tarballs on github temporary</div><div>(1:48:41 PM=
) fray: what about github?</div>
<div>(1:48:46 PM) RP__: Call this bitbake 1.14.0 ?</div><div>(1:48:48 PM) f=
ray: koen, ya..</div><div>(1:48:53 PM) fray: RP__ I would think so</div><di=
v>(1:48:58 PM) khem: yes tars can be put any time</div><div>(1:48:59 PM) RP=
__: Its probably more than a point release at this point</div>
<div>(1:49:19 PM) koen: no opinion on bitbake versioning here</div><div>(1:=
49:28 PM) RP__: it sucks to have to use github for tarballs :/</div><div>(1=
:49:38 PM) RP__: khem: the problem is the DNS?</div><div>(1:49:49 PM) koen:=
 at least github is fast</div>
<div>(1:50:04 PM) khem: I think yes. I thought Tom K will figure it</div><d=
iv>(1:50:19 PM) RP__: khem: Can you take the AR to drive that?</div><div>(1=
:50:25 PM) khem: ok</div><div>(1:50:32 PM) khem: however I am gone for next=
 3 weeks</div>
<div>(1:50:37 PM) khem: starting sunday</div><div>(1:50:53 PM) RP__: khem: =
hmm, will you have time before you go to ping him?</div><div>(1:51:10 PM) k=
hem: yes surely</div><div>(1:51:20 PM) khem: hopefully we can set it us as =
well</div>
<div>(1:51:32 PM) RP__: So given no other volunteers, I guess I&#39;ll have=
 to drive the announcement and work through this?</div><div>(1:51:32 PM) **=
*Jefro notes action item for khem to drive tarball release to github this w=
eek</div>
<div>(1:51:55 PM) koen: with a oe-core tag in place I can drive the meta-oe=
 part</div><div>(1:52:05 PM) RP__: koen: ok, thanks</div><div>(1:52:09 PM) =
koen: (and meta-angstrom, meta-ti, setup-scripts, etc, but that&#39;s not O=
E)</div>
<div>(1:52:31 PM) khem: RP__: I can help with announcement if you need and =
if its planned before I leave</div><div>(1:53:00 PM) RP__: khem: with me mo=
ving atm, I&#39;m not sure when/how i&#39;m going ot manage this :/</div>
<div>(1:53:10 PM) khem: sure ok</div><div>(1:53:11 PM) RP__: but I know our=
 users are not happy and it needs to get done</div><div>(1:53:31 PM) RP__: =
so, probably best to cover 7</div><div>(1:53:42 PM) koen: infra status</div=
>
<div>(1:53:43 PM) RP__: particularly if khem is missing</div><div>(1:53:50 =
PM) fray: I&#39;m happy to help with the release... tell me what needs to b=
e done (announcements, wiki, etc).. but I don&#39;t have the git perms to d=
o the actual release work</div>
<div>(1:54:34 PM) RP__: Is the TSC happy for me to handle the announcement,=
 I guess that is the question. I&#39;d not like to presume :)</div><div>(1:=
54:40 PM) koen: =A0I am</div><div>(1:54:55 PM) fray: i am</div><div>(1:55:0=
0 PM) khem: on 7 we have moved all services to new VM</div>
<div>(1:55:03 PM) khem: I am ok</div><div>(1:55:03 PM) RP__: fray: I&#39;ll=
 see how we can work this out and pull you in if/as needed</div><div>(1:55:=
07 PM) fray: ok</div><div>(1:55:29 PM) RP__: khem: cool, thanks for the wor=
k you/Tom and anyone else involved have put in!</div>
<div>(1:55:40 PM) ***Jefro 5 minute warning</div><div>(1:55:59 PM) khem: To=
m also has build box installed and we should have access to it soon</div><d=
iv>(1:56:05 PM) khem: but no ETA</div><div>(1:56:29 PM) RP__: khem: ok, coo=
l :)</div>
<div>(1:56:51 PM) RP__: Do we want to extend the meeting to cover some of t=
he other topics?</div><div>(1:56:53 PM) khem: on old VM we have github mirr=
oring crob tasks</div><div>(1:56:55 PM) RP__: or leave until next time?</di=
v>
<div>(1:57:01 PM) Tartarus: next time for me</div><div>(1:57:04 PM) khem: t=
hat pb runs should move to new VM</div><div>(1:57:08 PM) khem: when he has =
time</div><div>(1:57:39 PM) koen: s/crob/cron/</div><div>(1:57:49 PM) koen:=
 we should make them git push hooks</div>
<div>(1:58:07 PM) Jefro: any other high-priority items to discuss before GA=
 next week?</div><div>(1:58:07 PM) khem: yes its possible to make them hook=
s</div><div>(1:58:08 PM) koen: (I can look into that after ELC-E, we&#39;re=
 going to do that for meta-ti)</div>
<div>(1:58:25 PM) khem: I looked into them briefly</div><div>(1:58:50 PM) R=
P__: The push hooks would delay people&#39;s pushes though wouldn&#39;t the=
y?</div><div>(1:59:19 PM) koen: no idea, but I can look into that</div>
<div>(1:59:29 PM) khem: RP__: yes a bit</div><div>(1:59:33 PM) koen: Jefro:=
 can you make that an AR for me?</div><div>(1:59:46 PM) ***Jefro notes acti=
on item for koen to look into push hooks</div><div>(2:00:03 PM) RP__: It is=
 annoying if you have a raft of things to push out and each one has time la=
g :/</div>
<div>(2:00:43 PM) koen: you&#39;ll be one of the 2 people affected, the oth=
er one is me for meta-oe</div><div>(2:00:53 PM) khem: you mean multiple pus=
h ?</div><div>(2:00:57 PM) koen: and our bus factor reducers, saul, khem, e=
tc</div>
<div>(2:01:06 PM) RP__: koen: right</div><div>(2:01:26 PM) RP__: It was &qu=
ot;fun&quot; watching the patchwork hooks slow things down today</div><div>=
(2:03:04 PM) RP__: So that brings us past time :/</div><div>(2:03:05 PM) Je=
fro: remaining issues? I remember that Tartarus had to flee at 2pm</div>
<div>(2:03:20 PM) koen: ironically the pw hooks refused to update the patch=
 khem sent :)</div><div>(2:03:46 PM) khem: koen: what was error ?</div><div=
>(2:04:02 PM) khem: was it generic error</div><div>(2:04:03 PM) koen: it co=
uldn&#39;t correlate the patch I pushed with the one in pw</div>
<div>(2:04:13 PM) khem: hmmm</div><div>(2:04:25 PM) khem: did it happen onl=
y for 1 patch or others too</div><div>(2:04:37 PM) RP__: The PR issues prob=
ably does need addressing and is a TSC centric issue</div><div>(2:04:53 PM)=
 RP__: We need to do that when we&#39;re all here thoug</div>
<div>(2:05:37 PM) khem: RP__: PR =3D problem report ?</div><div>(2:05:45 PM=
) khem: or the publicity</div><div>(2:05:55 PM) fray: package release</div>=
<div>(2:06:06 PM) RP__: khem: The PR bumping discussion on the mailing list=
</div>
<div>(2:06:10 PM) koen: Package Revision</div><div>(2:06:12 PM) khem: oh I =
see</div><div>(2:07:40 PM) RP__: Are we closing the meeting?</div><div>(2:0=
7:48 PM) koen: I still have time</div><div>(2:07:54 PM) fray: we can.. or w=
e can discuss other things.. I have time</div>
<div>(2:08:07 PM) khem: I can spend some more mins</div><div>(2:08:28 PM) *=
**Jefro can stick around</div><div>(2:09:04 PM) fray: ok, next topic then? =
=A0PR (or is Tartarus gone?)</div><div>(2:09:24 PM) koen: I bet Tartarus is=
 screaming at uboot</div>
<div>(2:09:34 PM) Tartarus: I&#39;m semi here still</div><div>(2:09:36 PM) =
***fray does that every now and then</div><div>(2:09:40 PM) Tartarus: Need =
to put Daughter down for a nap then run errands</div><div>(2:10:44 PM) RP__=
: So I think our future direction from an architecture point of view needst=
o be to automate the PR bumps</div>
<div>(2:11:11 PM) RP__: Why? Currently its unclear which bumps are needed t=
o which packages and when. It also totally breaks down with layers</div><di=
v>(2:11:28 PM) khem: RP__: I agree</div><div>(2:11:34 PM) RP__: The values =
would be better maintained alongside the distro feeds that contain the used=
 values</div>
<div>(2:11:38 PM) khem: so do we maintain a database or how</div><div>(2:11=
:44 PM) khem: ah</div><div>(2:12:00 PM) RP__: The trouble is this change wi=
ll be a bit painful</div><div>(2:12:13 PM) RP__: We&#39;ve put off enabling=
 the BasicHash handler for a long time now</div>
<div>(2:12:56 PM) RP__: I&#39;d really like to see people thinking and work=
ing towards addressing these issues. As such I refused a patch to OE core a=
dding manual PR increment functionality</div><div>(2:13:00 PM) khem: RP__: =
so if I dont have any feeds where do the initial values come from</div>
<div>(2:13:19 PM) RP__: khem: We need some tools to handle some of these th=
ings</div><div>(2:13:26 PM) Tartarus: I think day 1 after a release is abou=
t when we need to turn on the solution, or at least the current proposal</d=
iv>
<div>(2:13:33 PM) RP__: khem: they&#39;d default to starting at 0</div><div=
>(2:13:34 PM) koen: the issue otavio raised is that the kernel.bbclass line=
 RP draws is arbitrary</div><div>(2:13:42 PM) Tartarus: So if basic hash sh=
ould be able to get us most of the way, time to switch</div>
<div>(2:13:49 PM) khem: RP__: so distro&#39;s then cant share feeds ?</div>=
<div>(2:13:51 PM) RP__: Tartarus: I&#39;d love to throw the BasicHash switc=
h now</div><div>(2:13:54 PM) fray: ya.. this is something that is going to =
take time for people to ome to terms with -- or object so strongly we rever=
t..</div>
<div>(2:14:01 PM) Tartarus: I vote now, and am mostly afk, now</div><div>(2=
:14:04 PM) fray: the hash thing needs to be done ASAP.. =A0the PR thing is =
what may or may not work</div><div>(2:14:05 PM) koen: Tartarus: you will ki=
ll rebuilding from (old) tags</div>
<div>(2:14:08 PM) RP__: khem: only if they sync up PR data</div><div>(2:14:=
11 PM) fray: but I vote as soon as we tag and release</div><div>(2:14:36 PM=
) koen: this auto-pr things needs to be done in a branch and merged when it=
 works good enough</div>
<div>(2:14:38 PM) RP__: We do have the network PR service that we created a=
 while back</div><div>(2:14:57 PM) fray: I assume the auto-pr stuff is the =
network PR service, w/o the network</div><div>(2:15:05 PM) koen: I think I&=
#39;ve already shown that that network PR thingy is worthless for any real =
work?</div>
<div>(2:15:08 PM) RP__: I think that with some not so difficult improvement=
s to save the data to metadata and back we can address the reproducibility =
issues</div><div>(2:15:28 PM) RP__: koen: Its not worthless, you&#39;ve jus=
t found a usecase it doesn&#39;t cover</div>
<div>(2:15:35 PM) RP__: koen: the world isn&#39;t black/white</div><div>(2:=
15:42 PM) RP__: fray: yes</div><div>(2:16:07 PM) koen: I&#39;m trying to ma=
ke it more black and white so that it will go in a branch first</div><div>
(2:16:09 PM) fray: ya, in that case, I&#39;m fairly comfortable with it.. e=
nough to explain to the world the possible pain and to turn it on</div><div=
>(2:16:33 PM) RP__: fray: I do understand this will cause koen and anyone e=
lse with distro feeds some problems</div>
<div>(2:16:34 PM) fray: but geting the updated hashing first is key IMHO..<=
/div><div>(2:16:44 PM) koen: if the changes are really &quot;not so diffucu=
lt&quot; the branch will be short lived</div><div>(2:16:53 PM) fray: we SHO=
ULD be able to seed the data though with the feed info, right?</div>
<div>(2:17:09 PM) RP__: fray: the feed info is the current set of PR values=
</div><div>(2:17:21 PM) RP__: which I guess we need to &quot;export&quot; t=
o an include</div><div>(2:17:26 PM) khem: I see</div><div>(2:17:28 PM) fray=
: ya, current PR&#39;s which can be tied back to specific hash values right=
?</div>
<div>(2:17:41 PM) RP__: once we can import/export the data from the PR serv=
ice to an include we should be good to go IMO</div><div>(2:17:53 PM) fray: =
that was my thought as well..</div><div>(2:17:54 PM) RP__: fray: hash value=
 is distro specific</div>
<div>(2:18:20 PM) khem: RP__: do I assume its going to be a file or some su=
ch that will be updated after build ?</div><div>(2:18:21 PM) RP__: So my vo=
te is not for now instantly but very soon</div><div>(2:18:22 PM) koen: I st=
ill say it should live in a branch at first</div>
<div>(2:18:28 PM) RP__: once we have the import/export script</div><div>(2:=
18:46 PM) koen: I&#39;ve seen the eglibc fallout from a recent experiment</=
div><div>(2:18:49 PM) RP__: and since this will happen soon, we shouldn&#39=
;t be taking PR bump type features into OE-Core at this point</div>
<div>(2:18:55 PM) fray: koen, my only problem with &quot;branches&quot; is =
getting people to use them</div><div>(2:19:19 PM) koen: my problem is with =
people knowingly breaking master using that excuse</div><div>(2:19:50 PM) f=
ray: well, the goal is to not knowingly break master with this change.. =A0=
but to expect (and react) to the unknown issues</div>
<div>(2:20:04 PM) koen: I know I&#39;m not going to live test it in master,=
 I&#39;ll roll back to the release</div><div>(2:20:30 PM) koen: testing a b=
ranch is no problem</div><div>(2:20:38 PM) koen: since this will be messy</=
div>
<div>(2:20:44 PM) khem: put it in master-next</div><div>(2:20:56 PM) khem: =
and we can test it out</div><div>(2:20:58 PM) ***RP__ will make no comment =
about how long the feedback for the network PR service took</div><div>(2:21=
:31 PM) koen: it was too hard to test for me, being based on poky and all</=
div>
<div>(2:21:39 PM) koen: &lt;/lame excuse&gt;</div><div>(2:21:56 PM) ***RP__=
 tries not to choke ;-)</div><div>(2:22:25 PM) RP__: So, I&#39;m suggesting=
 that we so look to do this stuff soon once we have the import/export scrip=
ting working and hopefully once koen is happy we have some kind of solution=
 in place than can work for his usecases</div>
<div>(2:22:42 PM) fray: seems reasonable</div><div>(2:22:45 PM) RP__: this =
will rely on some mailing list discussions, testing and some help</div><div=
>(2:22:53 PM) koen: and in the meantime can we apply that kernel.bbclass pa=
th?</div>
<div>(2:22:57 PM) RP__: and it will be with some of the Yocto PRC team doin=
g some of this</div><div>(2:23:00 PM) RP__: koen: no</div><div>(2:23:02 PM)=
 koen: I really want to remove it from meta-oe</div><div>(2:23:44 PM) koen:=
 OTOH, I can ignore any hatemail about meta-oe overrides now</div>
<div>(2:24:29 PM) RP__: koen: How many more patches will I get if I take th=
at one?</div><div>(2:24:58 PM) koen: to sync meta-oe classes involving PR? =
none</div><div>(2:25:08 PM) RP__: koen: For PR in general</div><div>(2:25:2=
5 PM) koen: you&#39;re saying any patch touching PR will get rejected??!?!<=
/div>
<div>(2:25:53 PM) RP__: For bulk PR handling with new variables I&#39;ll re=
ject</div><div>(2:26:07 PM) koen: there&#39;s only INC_PR and MACHINE_KERNE=
L_PR</div><div>(2:26:11 PM) RP__: I&#39;ll continue to grudgingly tolerate =
the PR bumps for now</div>
<div>(2:26:15 PM) koen: in classic OE</div><div>(2:26:23 PM) RP__: koen: bu=
t people want to add more</div><div>(2:26:36 PM) koen: since only otavio an=
d I could be arsed to &#39;fix&#39; PR problems there</div><div>(2:26:58 PM=
) koen: RP__: &#39;people&#39; don&#39;t get PR anyway</div>
<div>(2:27:12 PM) koen: so I wouldn&#39;t worry about magic PR helpers appe=
aring</div><div>(2:27:30 PM) RP__: koen: so we need to start educating them=
 and the MACHINE_KERNEL_PR sends totally the wrong message :/</div><div>
(2:27:45 PM) RP__: I know you understand the issue, others will not</div><d=
iv>(2:27:48 PM) koen: it does, but it will remove a bbclass overlay</div><d=
iv>(2:27:49 PM) khem: RP__: take it for now and then drop it when Auto PR i=
s in</div>
<div>(2:28:05 PM) RP__: Then I&#39;ll be accused of breaking existing funct=
ionality</div><div>(2:28:08 PM) koen: I&#39;m getting too much crap about i=
t being overlayed</div><div>(2:28:31 PM) koen: (which I can now say is not =
my fault, pesky OE core maintainer ;)</div>
<div>(2:28:38 PM) ***RP__ gets too much crap about PR values in general</di=
v><div>(2:29:09 PM) RP__: koen: you can blame me for now, this isn&#39;t go=
ing to be for long</div><div>(2:29:13 PM) fray: PR is one of those things y=
ou need a distribution maintainer and policy for.. otherwise inconsistencie=
s easily creep in.. :(</div>
<div>(2:29:14 PM) koen: RP__: consider that I silently &#39;repair&#39; fee=
ds a few times a week due to oe-core messing up upgrade paths</div><div>(2:=
29:35 PM) RP__: koen: I have really tried to help with this</div><div>(2:29=
:39 PM) koen: I know</div>
<div>(2:29:48 PM) koen: that&#39;s why I don&#39;t report every incident</d=
iv><div>(2:29:51 PM) RP__: koen: This is also why I want to get something a=
utomated</div><div>(2:29:57 PM) khem: RP__: OK so the network PR stuff is w=
hat we want to use here</div>
<div>(2:30:30 PM) koen: but please realize that in general oe-core is a hug=
e pain for people with a binary distro feed</div><div>(2:30:39 PM) koen: we=
 all try hard, but we are failing</div><div>(2:30:57 PM) RP__: koen: This i=
s why we need a change in approach</div>
<div>(2:31:00 PM) koen: exactly</div><div>(2:31:22 PM) khem: koen: I think =
having PR controlled by distro&#39;s is sane I guess ?</div><div>(2:31:36 P=
M) koen: doesn&#39;t really matter where</div><div>(2:32:08 PM) fray: PR is=
 a distribution &quot;issue&quot;.. and we need to provide the tools (and d=
ata) to make it easier to manager</div>
<div>(2:32:08 PM) koen: ideally a recipe maintainer knows best</div><div>(2=
:32:20 PM) koen: e.g. xorg changed abi</div><div>(2:32:32 PM) koen: so thin=
gs like xf86-video-fbdev need rebuilding</div><div>(2:32:48 PM) koen: (I &#=
39;repaired&#39; the feeds for that yesterday)</div>
<div>(2:33:11 PM) fray: yup these are the things that hashing and auto PR s=
hould help with</div><div>(2:33:14 PM) fray: (I hope)</div><div>(2:33:14 PM=
) koen: the fs-perms.txt change in angstrom is another</div><div>(2:33:20 P=
M) RP__: koen: Are false positives a problem?</div>
<div>(2:33:26 PM) koen: RP__: not for me</div><div>(2:33:38 PM) khem: koen:=
 I think if we rebuild more its suboptimal but ok I think</div><div>(2:33:4=
4 PM) RP__: koen: ok</div><div>(2:34:03 PM) koen: PR is really a &quot;bett=
er safe than sorry&quot; type of thing</div>
<div>(2:34:04 PM) RP__: We&#39;ll obviously look to not rebuild more than w=
e need but its going to take a little experimentation</div><div>(2:34:18 PM=
) khem: agree</div><div>(2:34:28 PM) RP__: the checksum code does er on the=
 side of false positives</div>
<div>(2:34:54 PM) khem: RP__: why not send a proposal</div><div>(2:34:55 PM=
) khem: to ml</div><div>(2:35:34 PM) RP__: khem: It has been discussed befo=
re, just a while ago. =A0Refreshing people&#39;s memory is probably good I =
guess</div>
<div>(2:35:39 PM) RP__: but release takes priority</div><div>(2:36:04 PM) k=
hem: ok yes I think release should happen before this change for sure</div>=
<div>(2:36:27 PM) koen: I&#39;d still like it to sit in master-next for a w=
hile</div>
<div>(2:36:55 PM) RP__: koen: Lets see how this goes</div><div>(2:37:10 PM)=
 ***RP__ next needs to explain what the problem is to the Yocto PRC people<=
/div><div>(2:37:18 PM) khem: koen: RP__ yes master-next should have it for =
a while so distro maintainers can adapt to it in background</div>
<div>(2:37:21 PM) ***RP__ might as well give up on a day off tomorrow</div>=
<div>(2:37:32 PM) RP__: and the house moving thing</div><div>(2:37:48 PM) k=
hem: RP__: you need 25th hour</div><div>(2:37:58 PM) RP__: khem: and the re=
st :/</div>
<div>(2:38:18 PM) khem: thats what it is for sleep 1 hr :)</div><div>(2:38:=
23 PM) khem: and work 24</div><div>(2:38:55 PM) khem: I need to make a move=
</div><div>(2:39:12 PM) khem: bye see u in 3 weeks</div><div>(2:39:25 PM) R=
P__: khem: safe travels!</div>
<div>(2:39:31 PM) fray: sounds good! =A0have a good time</div><div>(2:39:40=
 PM) khem: I will</div><div>(2:39:55 PM) khem: watch out me flying over eu =
on 26th :)</div><div>(2:40:07 PM) khem: I will wave when I am over Germany =
:)</div>
<div>(2:40:30 PM) Jefro: safe travels khem</div><div>(2:40:37 PM) khem: thx=
</div><div>(2:40:44 PM) khem left the room.</div><div>(2:41:02 PM) ***koen =
also needs to zzz soon</div><div>(2:41:36 PM) Jefro: meeting adjourned?</di=
v>
<div>(2:43:12 PM) RP__: Jefro: yes! :)</div><div><br></div><font color=3D"#=
888888"></font></span><font color=3D"#888888"></font><div><br></div>-- <br>=
Jeff Osier-Mixon <a href=3D"http://jefro.net/blog" target=3D"_blank">http:/=
/jefro.net/blog</a><div>
Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.org" =
target=3D"_blank">http://yoctoproject.org</a></div><br>

--90e6ba6e8bce6ebe2304afd16f48--
