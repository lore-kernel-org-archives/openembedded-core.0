Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QblkF-0003ki-J1; Wed, 29 Jun 2011 05:47:20 +0200
Received: by iym10 with SMTP id 10so797471iym.6
	for <multiple recipients>; Tue, 28 Jun 2011 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=w/lYvsZ+IMSjmghc83QVj2fWu+1ymXqvD6rYMRevdoY=;
	b=FnWxhKb9V8KcU+Il9tbsiPyb/qdS+783E2fEG4S1+lay8vUy9+CLAZZdaXDb4afJQk
	hhOtnK6kSBXnGsEDImnQAJmV7JPWM/R9zoyfHq/Dmo1S9o//uDTFJ+iVBnPZdChoUi68
	gvQxGFOoUaiMopqkbRoatYuUPgl0zpX3USepU=
MIME-Version: 1.0
Received: by 10.42.223.198 with SMTP id il6mr305977icb.271.1309319016068; Tue,
	28 Jun 2011 20:43:36 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.222.66 with HTTP; Tue, 28 Jun 2011 20:43:36 -0700 (PDT)
Date: Tue, 28 Jun 2011 20:43:36 -0700
X-Google-Sender-Auth: wQQRfYIX5wDu9VSd0bvhz2FyIy4
Message-ID: <BANLkTimo46GYafhohjgr8JSvTEYgmNr73Q@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 23-Jun-2011
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
X-List-Received-Date: Wed, 29 Jun 2011 03:47:20 -0000
Content-Type: multipart/alternative; boundary=20cf30549613d9b70504a6d19695

--20cf30549613d9b70504a6d19695
Content-Type: text/plain; charset=ISO-8859-1

MINUTES: OE-TSC meeting 23-Jun-2011

Attendees: Richard, Tom, Khem, Koen, Mark, Stefan
Notes: Jefro

Agenda & Action Items

01) choose a meeting chair

stefan

02) new topics

Discussion about more (or more complex) building before pushing changes to
master (Tartarus)

new features in OE-Core and bitbake changes needed to support them (RP)

03) action items from last week

  --> patches appearing on oe-dev, khem to send email regarding "put stuff
in meta-oe"
not done yet

  --> Tom to change strategy for maint branch, oe.dev master to
oe-core/meta-oe/layer
done

  --> promote devs to participate on oe-user - on agenda for next week
done

04) TSC structure & elections

  --> RP to send a note to board asking for status on prior message
done, board has responded & will start elections this week

05) Status updates
      - oe-core
  Saul out. RP: working code out there as a foundation for multilib which is
great
  not so great was the backlog of patches, RP is almost through them
  complicated by Yocto infrastructure issues
  lack of testing is an issue - some discussion about adding testing to
patches prior to commit
  Tom suggests that there is already a policy for updates, but some things
came from sstate - lesson learned
--> (all) think twice about pull requests
  RP: 1. multilib - there is a plan and rough code out there
         some bitbake changes and oe-core dependenies on those
     ok this cycle but we probably need to stop doing this and get better
organised before 1.14 in October
     Changes + a bitbake min ver bump, warn people now
  2. patterns email - current state of our core classes depressing
     full of horrible hacks for PACKAGE_ARCH, BASE_PACKAGE_ARCH...
 know how to clean it up but not how to do so without breaking backwards
compatibility
 heirarchical definition of a arch -> multilib -> tune -> BSP/machine
 mechanics easy, transition is hard
 multilib exposes a lot of design issues
 discuss in email
  fray has gotten all of the patches out to fix the majority of the
permission/owners/group issues..
  only thing remaining is symlink vs actualy directory ownership

  - bsp guidelines
clarify - using layers for BSPs
      - metadata layer splitting
      - infrastructure
melo having issues
fallback github seems to have worked
  khem working on making libtirpc be a drop in replacement for glibc rpc but
much work required

RAW TRANSCRIPT


12:59 <+Jefro> sounds like a quorum:  RP__ stefan_schmidt Tartarus koen khem
12:59 <+stefan_schmidt> lets wait some minutes for fray
13:00 <+stefan_schmidt> he was just out for getting lunch
13:00 *** fray is here now
13:00 <+stefan_schmidt> great
13:00 <+stefan_schmidt> chair?
13:01 <+Jefro> http://pastebin.com/bZfpaqvN is the agenda
13:01 <+stefan_schmidt> i can chair if nobody wants
13:01 <+Jefro> stefan_schmidt wins the chair going into round 2
13:01 <+khem> ok
13:01 <+stefan_schmidt> new topics anyone?
13:02 <+stefan_schmidt> (02) new topics)
13:02 <+Tartarus> Yeah, I think I have a new topic
13:02 <+stefan_schmidt> shot
13:02 <+Tartarus> Discussion about more (or more complex) building before
pushing changes to master
13:02 <+RP__> We should probably talk about new features in OE-Core and
bitbake changes needed to support them
13:02 <+Tartarus> I'll also say maybe it's a bit of an over-react to the
glibc thing
13:03 <+RP__> Tartarus: Say when and I'll explain why I did that :)
13:03 <+Tartarus> Yeah, lets just talk about it when we get to it, that's
all
13:03 <+Tartarus> All I've got for new topics
13:03 <+RP__> I sent out that patterns in class hackery email
13:03 <+stefan_schmidt> that fits in 5
13:04 <+stefan_schmidt> so we put this in status updates
13:04 <+stefan_schmidt> any more topics?
13:04 <+RP__> none here
13:04 <+fray> nothing here
13:05 <+stefan_schmidt> ok, closed
13:05 <+stefan_schmidt> 03) action items from last week
13:05 <+Tartarus> OK, for my AI I updated the wiki page and sent out the
email (which noted that this is just spelling out the policy more clearly,
it didn't say oe.dev only before, just "relevant upstream")
13:05 <+Tartarus> So that's done.
13:05 <+stefan_schmidt> ok
13:06 <+stefan_schmidt> can be off list next week
13:06 *** Jefro notes
13:06 <+khem> my AR for oe-users is also done
13:06 <+stefan_schmidt> oe-user is also done as it got closed
13:06 <+stefan_schmidt> right :)
13:06 <+khem> list is r/o now well sort off
13:06 <+stefan_schmidt> with a notice posting to dev
13:06 <+stefan_schmidt> ok, not worth an AR any more
13:06 <+stefan_schmidt> can go off list as well
13:07 <+stefan_schmidt> khem:  --> patches appearing on oe-dev, khem to send
email regarding "put stuff in meta-oe"
13:07 <+khem> stefan_schmidt: I did not do that yet
13:07 <+stefan_schmidt> khem: ok, so this one we are keeping
13:07 <+stefan_schmidt> am I to fast?
13:07 <+RP__> stefan_schmidt: no :)
13:07 <+stefan_schmidt> good
13:08 <+khem> although it means building/testing using oe-core
13:08 <+stefan_schmidt> 04) TSC structure & elections
13:08 <+RP__> For 04 I have a reply from the board saying they accepted our
proposal and will be starting the election process this week
13:08 <+stefan_schmidt> ok, good
13:08 *** Jefro notes
13:08 <+RP__> So nothing further for the TSC to do, its in the hands of the
board
13:08 <+stefan_schmidt> So we wait for a mail from them on members
13:08 <+fray> sounds good
13:09 <+stefan_schmidt> wow, the AR going away today...
13:09 <+stefan_schmidt> that brings us to 5
13:09 <+stefan_schmidt> 05) Status updates
13:09 *** Jefro notes 80% of agenda covered in 10 minutes, a new record
13:10 <+fray> :)  We're getting better
13:10 <+RP__> well, we did put all the discssion in 5)
13:10 <+stefan_schmidt> psst, don't tell anyone
13:11 <+stefan_schmidt> RP__: Tartarus you guys want to start with the
testing and eglibc change
13:11 <+stefan_schmidt> ?
13:11 <+khem> on status. I am working on making libtirpc be a drop in
replacement for glibc rpc buts its not so straight forward
13:11 <+khem> it needs lot of work
13:11 <+Tartarus> Lets get general status bits out first
13:12 <+RP__> ok. Its been a bit of a hard week for me and OE-Core since
Saul is away and I've been trying to resolve multilib
13:13 <+RP__> There is now actual working code out there as a foundation for
multilib which is great, not so great was the backlog of patches
13:13 <+Tartarus> I've started kicking the oe-core + meta-oe tires harder
and thinking about what I can do about getting more builds to happen on a
weekend-basis
13:13 <+RP__> I am clearing most of it (I think) but we had the odd hiccup
and we need to stabilise
13:13 <+fray> I think I've gotten all of the patches out to fix the majority
of the permission/owners/group issues.. only thing remaining is symlink vs
actualy directory ownership.. (after the meeting if anyone has a minute or
two I'm looking for suggestions )
13:14 <+RP__> Its been complicated by Yocto build machine moves and power
outages
13:14 <+RP__> and a bug which took out some of the builders
13:14 <+Tartarus> RP__: So, to jump ahead, the usual process is that Saul
throws things at the build machines and then a pull request, but, no Saul,
build machine issues, stuff happened
13:14 <+Tartarus> ?
13:15 <+RP__> Tartarus: pretty much
13:15 <+Tartarus> OK, I think that's a good enough answer
13:15 <+RP__> I was conscious I was getting behind with pull requests and
things we're looking like they were getting out of control. I therefore
merged it assuming it had been a little more tested than it had. As soon as
it was clear there were issues, it got reverts of the appropriate pieces.
13:15 <+Tartarus> Maybe we can try and find a backup Saul?
13:15 <+Tartarus> Let him have some vacation now and again and otherwise
ease the burden
13:15 <+RP__> Tartarus: I really would like to get to the point where we
have a few people acting to review/batch up patches
13:16 <+khem> I think when a pull request it send folks with machine power
can pick and test too
13:16 <+khem> and provide feedback
13:16 <+Tartarus> RP__: Yeah
13:16 <+fray> ya, would be nice
13:16 <+stefan_schmidt> and they would need to report to let people know
about failure/success
13:16 <+RP__> khem: This doesn't change the fact people do need to test
changes before posting them though. For things like eglibc I think we need
to start stating what testing has/has not been done
13:17 <+khem> RP__: I did build and boot of all qemus
13:17 <+fray> I think there are a series of changes we should probably
styart requesting "testing" info
13:17 <+RP__> At least then we can make more informed decisions about when
something has been tested ready to merge
13:17 <+RP__> khem: which images though?
13:17 <+fray> package managers, toolchain...
13:17 <+Tartarus> Well, stop
13:17 *** koen finally got qemu working on his osx machine
13:17 <+Tartarus> We have an update policy
13:17 <+khem> RP__: I used console-image from angstrom
13:17 <+RP__> khem: even mentioning what we'd tested would he
13:17 <+Tartarus> And eglibc pretty clearly falls into the infrastructure
and needs a full test side
13:17 <+Tartarus> So, why didn't we follow it?
13:18 <+RP__> Tartarus: my fault I guess, I assumed it had more testing than
it had :/
13:18 <+khem> RP__: but I guess since most of stuff was from shared state
many things did not pop up
13:18 <+koen> so we all screwed up and learnt our lesson
13:18 <+Tartarus> khem, yeah, that doesn't fit into the policy
13:18 <+fray> ya, thats the way I took it
13:18 <+RP__> khem: Its a detail like that I need - it was from sstate :(
13:19 <+fray> it was reverted quick enough and we had enough people actively
using it that we dealt with it quickly
13:19 <+RP__> sstate does exclude toolchain from the hashes by default :(
13:19 <+khem> I realised it later when fray posted
13:19 <+fray> RP__ even hashbasic?
13:19 <+khem> best for toolchain changes is to build from scratch
13:19 <+fray> 'er basichash I mean
13:19 <+RP__> fray: not 100% sure about that, it should have caught eglibc
13:20 <+khem> but then it might screw someone who is using shared state so
it has to be done both ways
13:20 <+fray> mine (I'm using basichash) did detect a change and started
rebuilding everything.. which is why the rpc failure happened
13:20 <+stefan_schmidt> so, what did we learn?
13:20 <+RP__> So lessons are: I need to ask more questions and people need
to provide more info about what testing has been done
13:20 <+stefan_schmidt> more and wider testing for stuff like eglibc
13:21 <+koen> and libc upgrades shouldn't be replaces
13:21 <+khem> and folks could test the pull requests too so we are
preemptive and not reactive
13:21 <+stefan_schmidt> maybe get some other people on board like saul doing
patch collecting and builing
13:21 <+koen> and new versions shouldn't be the default for $period of time
13:21 <+fray> koen, I think thats a good idea (for the future)..
13:21 <+RP__> fray: ok, that is good at least
13:22 <+RP__> fray: I think it stops at the gcc boundary so it will rebuild
for libc but not gcc
13:22 <+fray> ok
13:22 <+RP__> Its programmable
13:22 <+Tartarus> koen: So, in sum, we need to follow the upgrade policy we
wrote and agreed on
13:23 <+khem> I think we should define miimum checkin criteria
13:23 <+koen> Tartarus: basically, yes
13:24 <+RP__> This is also a wakeup call for the team as I'm never going to
catch everything bad
13:24 <+RP__> So please think twice about pull requests. A pull request is
saying you consider something ready to go in
13:24 <+fray> one question though -- in the future when this happens agin
(something fundamental breaks and we need to revert) does anyone else have
permissions to be able to do the revert if you are not available?
13:25 <+Tartarus> Well, here's the flip side
13:25 <+fray> RP__ ya I only send patches when I'm ready to go (or clearly
label them as such)..  I send links to the tree if I want review.. hopefully
thats reasonable approach
13:25 <+Tartarus> barring vacation, is it that big of a deal?
13:25 <+Tartarus> And we can assume RP won't merge and run
13:25 <+fray> Tartarus honestly, I don't think it is..
13:25 <+RP__> I do try and be around if something tricky is going in
13:25 <+RP__> and do hold things if I'm not around
13:26 <+RP__> This is the development tree too, not a release/stable branch
13:26 <+Tartarus> Exactly
13:26 <+fray> agreed
13:26 <+Tartarus> So I think we're OK with as soon as RP is awake enough to
push the revert, if needed
13:26 <+koen> and otherwise we can tell people to rollback manually
13:26 <+RP__> People can easily do that locally too
13:27 <+fray> I really don't think was really such a big deal.. we've
learned lessons and will do better next time..
13:27 <+fray> RP__ yup.. which is why I posted the revert as quickly as I
did
13:27 *** koen was pinning 2.12 anyway
13:27 <+RP__> I'm of the opinion that we can become too afraid to make
changes and that is sometimes worse than making bad changes and having to
revert occasionally
13:28 <+RP__> If you look at the number of reverts we've made its relatively
low
13:28 <+fray> yup
13:28 <+khem> if you dont  make mistakes you havent done anything :)
13:28 <+RP__> Very low in fact, I *hate* reverts
13:28 <+koen> do right, do wrong, but at least to somethign :)
13:28 <+RP__> right :)
13:29 <+stefan_schmidt> so that covers the oe-core part of 5 this week
13:29 <+khem> I wish more folks could try out the patches and add acks or
tested-bys
13:29 <+khem> but except Saul no one does
13:29 <+stefan_schmidt> - bsp guidelines
13:29 <+RP__> stefan_schmidt: Can I touch on the things I mentioned earlier
13:29 <+RP__> ?
13:29 <+stefan_schmidt> RP__: sure, go ahead
13:29 <+Tartarus> khem, we need to perhaps make it easier somehow?
13:30 *** Tartarus hmms
13:30 <+RP__> multilib - there is a plan and rough code out there
13:30 <+khem> Tartarus: how ?
13:30 <+RP__> anyone interested should read it :)
13:30 *** fray notes RPM multilib support is next on his agenda.. so I'll be
giving this a try
13:30 <+fray> (soon)
13:30 <+RP__> Secondly, we have some bitbake changes and oe-core dependenies
on those
13:30 <+khem> we need it for opkg and deb as well
13:31 <+RP__> We currently do need bitbake master anyway
13:31 <+Tartarus> khem: that's the hard question, I agree
13:31 <+RP__> I'm therefore of the opinion this is going to be ok this cycle
but we probably need to stop doing this and get better organised
13:31 <+RP__> and get onto a 1.14 release by October
13:31 <+RP__> Any objections to that rough plan?
13:31 <+Tartarus> RP__: I think so long as you don't make the changes on a
Friday and of course be careful to do a test with just oe-core (yes,
yes...), just fix the ugly hackish bits
13:31 <+fray> RP__ ya, we need a way to keep the requiremetns ins ync
13:32 <+RP__> I did manage this once so far this cycle and people got
informed when they *needed* the new bitbake version
13:33 <+RP__> I'm trying to batch some changes to avoid doing this more than
a couple of more times
13:33 <+stefan_schmidt> thats good
13:33 <+Tartarus> Lets aim for...
13:33 <+Tartarus> Not July 4th but the week after
13:33 <+Tartarus> Changes + a bitbake min ver bump
13:33 <+Tartarus> and warn people now, even
13:34 <+RP__> I can send out as many warning emails as I like, I doubt
anyone will actually pay attention :)
13:34 <+RP__> Anyhow I think we agree on what to do and I just wanted to
mention what is likely to happen
13:35 <+RP__> Second thing was the patterns email I sent out
13:35 <+RP__> I find the current state of our core classes depressing to be
honest
13:35 <+RP__> full of horrible hacks for PACKAGE_ARCH, BASE_PACKAGE_ARCH and
friends :(
13:35 <+khem> I agree
13:35 <+fray> the hacks and hard-coded arch definitions worries me a lot
13:36 <+RP__> I know how to clean it up but not how to do so without
breaking backwards compatibility :(
13:36 <+fray> recipe compatibility (to me) is the key item.. and even that
isn't expected to be 100%
13:36 <+RP__> There are also some little pieces of previous cleanups missing
such as making cross packages move into the native workdir and have the
targetarch as a suffix to PN
13:36 <+khem> RP__: you mean with bb semantic changes
13:36 <+fray> the key thing from a user perspective is when something
changes (incompatible) tell me what it is and how to deal with it in my code
13:37 <+RP__> khem: machine.conf file definitions is the main issue
13:37 <+RP__> khem: I can deal with the bitbake issues
13:37 <+stefan_schmidt> So problems with BSP layers
13:37 <+RP__> machine.conf files should not be setting TARGET_ARCH IMO
13:37 <+RP__> yes
13:38 <+Tartarus> Maybe a 1.2 or whatever the next release is thing?
13:38 <+koen> RP__: so what should be setting it then?
13:38 <+RP__> koen: something new
13:38 <+khem> We need arch files
13:38 <+RP__> koen: for the same reason you want BASE_PACKAGE_ARCH not to
change
13:38 <+RP__> Tartarus: well, there is that argument and also the shouldn't
we fix this now before we get more users
13:39 <+fray> khem, come back to my suggestion for a heirarchical definition
of a arch -> multilib -> tune -> BSP/machine
13:39 <+RP__> I don't really want to discuss how we fix it, that is easy
13:39 <+RP__> its how to transition
13:39 <+khem> fray: yes thats good
13:39 <+fray> one of the complaints I've heard about potentially adding
"more" config files is that people don't necessarily see the logic of where
things are being set today
13:40 <+fray> local.conf makes sense.. bitbake.conf makes sense.. its the
stuff in the middle that people get confused by when theyre trying to create
a distro, patch, etc..
13:40 <+khem> RP__: I think with releases regularly we can break some
backward compatibility
13:40 <+Tartarus> RP__: I would go with we have a lot to do for this release
13:40 <+Tartarus> and not all that much time
13:40 <+Tartarus> Lets get multilib really solid
13:40 <+RP__> Tartarus: I'm leaning the other way
13:40 -!- Jefro ~Jefro@cust-67-203-89-34.static.o1.com has quit [Ping
timeout: 240 seconds]
13:40 <+RP__> I think multilib will be a mess without this
13:41 <+fray> Tartarus I'm not sure we'll be able to get multilib solid
without "fixing" the variable mess
13:41 <+Tartarus> I agree multilib will make the current mess clear
13:41 <+fray> multilib exposes a lot of design issues
13:41 <+RP__> Each time I work on one of these classes I add more hackery
around previous mess
13:41 <+Tartarus> How many big items do you want in the air at once?
13:41 <+RP__> Well, I don't know
13:41 <+RP__> I do want to make the issue clear though
13:42 <+fray> (for infrastructure -- not recipe stuff).. I see these are two
seperate work items, that go together..
13:42 <+fray> we focus on one.. adapt the other until they're in sync
13:42 <+khem> I kind of think that we should clear the classes for these
excess vars
13:42 <+khem> first
13:42 <+RP__> I can probably do this so that anyone using tune include files
from oe-core will continue to work
13:42 <+RP__> khem: We can't clear them until we have stable values for them
to use
13:43 <+fray> khem, get the classes cleaned up so the multilib hacks are at
a minimum..
13:43 <+fray> classes/variables
13:43 <+RP__> khem: e.g. when you change TARGET_ARCH now, the original value
is gone
13:43 <+RP__> so ok, we add a copy of the value
13:43 <+RP__> but do this for 5 variables in 5 different classes under
different conditions and your head hurts :(
13:43 <+khem> RP__: thats a design problem though
13:44 <+RP__> khem: one which is rooted in the machine files
13:44 <+fray> (BTW way we did that in our non-OE based system is define
everything as FOO_variant... then the core set such as TARGET_ARCH get
evaluated to TARGET_ARCH_variant before each recipe is built)
13:44 *** stefan_schmidt shows the 15 minutes left sign around
13:44 <+RP__> Let me make this a call to action via email
13:45 <+RP__> Anything else under status updates?
13:45 <+stefan_schmidt> - bsp guidelines?
13:45 <+fray> but it means that the set of things that are "specific" to a
'variant' are always overriden -- if we do the same, we'll need to detect if
someone is playing with that and give them santiy or some other guide
13:45 <+stefan_schmidt> - metadata layer splitting?
13:45 <+stefan_schmidt> - infrastructure?
13:46 <+fray> infrastructure -- other then melo having issues this week..
the fallback github seems to have worked..  I didn't see development drop
off due to that..
13:46 <+fray> (in otherwords I'm happy with the fall back plan)
13:46 <+koen> almost nothing going into .dev anyway
13:46 <+RP__> Tom is having various difficulties I think :/
13:46 <+koen> something seems to be DOS'ing melo
13:47 <+RP__> I think its those gcc commits
13:47 <+RP__> overload cgit
13:47 <+RP__> all you need is a few of them and a webbot
13:48 <+fray> github seems to be able to handle it at least...
13:48 <+RP__> fray: I'm hoping its an isolated issue
13:48 <+fray> same...
13:49 <+stefan_schmidt> layer splitting and bsp guidelines?
13:49 <+RP__> Since its quiet another question: How are people finding
OE-Core compared to .dev?
13:49 <+khem> going back to eglibc issue .. So for core recipes e.g.
toolchain I would say we require additional 2 tested-bys minimum
13:50 <+Tartarus> oe-core + meta-oe makes me pine for bbclass.bbappend, but
I agree with what we came to a conclusion on before
13:50 <+khem> RP__: it seems nicers
13:51 <+khem> RP__: but I guess with oe.dev folks had lot more choice of
machines as they were collectively maintained
13:51 <+fray> khem, I'm happy to do that if we feel it's necessary -- I'm
willing to relax that as in "new versions" or "major changes"
13:51 <+RP__> tbh I think we've learnt our lesson
13:52 <+khem> RP__: when I have more machine built in same tmpdir then bb
runque generation slows down very much
13:52 <+khem> have you observed that
13:52 <+RP__> khem: no :/
13:52 <+khem> RP__: e.g. I have all supported qemus
13:52 <+koen> and bitbake tkaes half a gig of ram
13:53 <+khem> when its only 1 then its very fast
13:53 <+RP__> Does wiping tmp/cache speed it up again/
13:53 <+RP__> ?
13:53 <+khem> havent tried but I can give it a shot
13:54 <+khem> RP__: and cache dir is in both tmp and tmp-eglibc
13:54 <+RP__> khem: yes
13:54 *** stefan_schmidt shows the 5 minutes left sign. Last orders.
13:54 <+RP__> khem: bonus marks for pinointing the specific file
13:55 <+RP__> khem: I suspect the codeparser cache
13:55 <+RP__> stefan_schmidt: I think we're done tbh?
13:55 <+stefan_schmidt> I'm wondering a bit where we stand with the BSP
guidelines
13:55 <+RP__> khem: time bitbake xxx-image -n might help btw
13:55 <+stefan_schmidt> We had them in the topics since the beginning
13:56 <+khem> RP__: yes I deleted the cache lets see
13:56 <+RP__> stefan_schmidt: there is the BSP developers guide
13:56 <+fray> I'm done.. if you have a few minutes I just want to mention a
small topic and see if anyone has input
13:56 <+RP__> (which Yocto has)
13:56 <+fray> (outside the meeting)
13:56 <+stefan_schmidt> RP__: I know. And what is the guidelines reference
in the agenda about?
13:56 <+RP__> stefan_schmidt: it was specifically about using layers for
bsps iirc
13:56 <+stefan_schmidt> ah, ok
13:57 <+RP__> so related to the layer splitting topic
13:57 <+stefan_schmidt> so that is missing
13:57 <+stefan_schmidt> anyway, to late for this meeting


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--20cf30549613d9b70504a6d19695
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-f=
amily: arial, sans-serif; font-size: 13px; ">MINUTES: OE-TSC meeting 23-Jun=
-2011</span><span class=3D"Apple-style-span" style=3D"border-collapse: coll=
apse; font-family: arial, sans-serif; font-size: 13px; "><div>
<br></div></span><span class=3D"Apple-style-span" style=3D"border-collapse:=
 collapse; font-family: arial, sans-serif; font-size: 13px; "><div>Attendee=
s: Richard, Tom, Khem, Koen, Mark, Stefan</div><div>Notes: Jefro</div><div>
<br></div></span><span class=3D"Apple-style-span" style=3D"border-collapse:=
 collapse; font-family: arial, sans-serif; font-size: 13px; "><div>Agenda &=
amp; Action Items</div><div><br></div><div>01) choose a meeting chair</div>
<div><br></div><div>stefan</div><div><br></div><div>02) new topics</div><di=
v><br></div><div>Discussion about more (or more complex) building before pu=
shing changes to master (Tartarus)</div><div><br></div><div>new features in=
 OE-Core and bitbake changes needed to support them (RP)</div>
<div><br></div><div>03) action items from last week</div><div><br></div><di=
v>=A0 --&gt; patches appearing on oe-dev, khem to send email regarding &quo=
t;put stuff in meta-oe&quot;</div><div>not done yet</div><div><br></div><di=
v>
=A0 --&gt; Tom to change strategy for maint branch, oe.dev master to oe-cor=
e/meta-oe/layer</div><div>done</div><div><br></div><div>=A0 --&gt; promote =
devs to participate on oe-user - on agenda for next week</div><div>done</di=
v>
<div><br></div><div>04) TSC structure &amp; elections</div><div><br></div><=
div>=A0 --&gt; RP to send a note to board asking for status on prior messag=
e</div><div>done, board has responded &amp; will start elections this week<=
/div>
<div><br></div><div>05) Status updates</div><div>=A0 =A0 =A0 - oe-core</div=
><div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0Saul out. RP: w=
orking code out there as a foundation for multilib which is great</div><div=
><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0not so great was the=
 backlog of patches, RP is almost through them</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0complicated by Y=
octo infrastructure issues</div><div><span style=3D"white-space: pre-wrap; =
">	</span>=A0=A0lack of testing is an issue - some discussion about adding =
testing to patches prior to commit</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0Tom suggests tha=
t there is already a policy for updates, but some things came from sstate -=
 lesson learned</div><div>--&gt;<span style=3D"white-space: pre-wrap; ">	</=
span>(all) think twice about pull requests</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0RP: 1. multilib =
- there is a plan and rough code out there</div><div><span style=3D"white-s=
pace: pre-wrap; ">	</span>=A0=A0 =A0 =A0 =A0 some bitbake changes and oe-co=
re dependenies on those</div>
<div><span style=3D"white-space: pre-wrap; ">		</span>=A0=A0 =A0 ok this cy=
cle but we probably need to stop doing this and get better organised before=
 1.14 in October</div><div><span style=3D"white-space: pre-wrap; ">		</span=
>=A0=A0 =A0 Changes + a bitbake min ver bump, warn people now</div>
<div><span style=3D"white-space: pre-wrap; ">		</span>=A0=A02. patterns ema=
il - current state of our core classes depressing</div><div><span style=3D"=
white-space: pre-wrap; ">		</span>=A0=A0 =A0 full of horrible hacks for PAC=
KAGE_ARCH, BASE_PACKAGE_ARCH...</div>
<div><span style=3D"white-space: pre-wrap; ">			</span>=A0know how to clean=
 it up but not how to do so without breaking backwards compatibility</div><=
div><span style=3D"white-space: pre-wrap; ">			</span>=A0heirarchical defin=
ition of a arch -&gt; multilib -&gt; tune -&gt; BSP/machine</div>
<div><span style=3D"white-space: pre-wrap; ">			</span>=A0mechanics easy, t=
ransition is hard</div><div><span style=3D"white-space: pre-wrap; ">			</sp=
an>=A0multilib exposes a lot of design issues</div><div><span style=3D"whit=
e-space: pre-wrap; ">			</span>=A0discuss in email</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0fray has gotten =
all of the patches out to fix the majority of the permission/owners/group i=
ssues..=A0</div><div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0=
only thing remaining is symlink vs actualy directory ownership</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0</div><div><span=
 style=3D"white-space: pre-wrap; ">	</span>=A0=A0- bsp guidelines</div><div=
><span style=3D"white-space: pre-wrap; ">			</span>clarify - using layers f=
or BSPs</div>
<div>=A0 =A0 =A0 - metadata layer splitting</div><div>=A0 =A0 =A0 - infrast=
ructure</div><div><span style=3D"white-space: pre-wrap; ">			</span>melo ha=
ving issues</div><div><span style=3D"white-space: pre-wrap; ">			</span>fal=
lback github seems to have worked<span style=3D"white-space: pre-wrap; ">	<=
/span>=A0=A0</div>
<div><span style=3D"white-space: pre-wrap; ">	</span>=A0=A0khem working on =
making libtirpc be a drop in replacement for glibc rpc but much work requir=
ed</div><div><br></div><div>RAW TRANSCRIPT</div><div><br></div><div><br></d=
iv>
<div>12:59 &lt;+Jefro&gt; sounds like a quorum: =A0RP__ stefan_schmidt Tart=
arus koen khem</div><div>12:59 &lt;+stefan_schmidt&gt; lets wait some minut=
es for fray</div><div>13:00 &lt;+stefan_schmidt&gt; he was just out for get=
ting lunch</div>
<div>13:00 *** fray is here now</div><div>13:00 &lt;+stefan_schmidt&gt; gre=
at</div><div>13:00 &lt;+stefan_schmidt&gt; chair?</div><div>13:01 &lt;+Jefr=
o&gt;=A0<a href=3D"http://pastebin.com/bZfpaqvN" target=3D"_blank" style=3D=
"color: rgb(0, 0, 204); ">http://pastebin.com/bZfpaqvN</a>=A0is the agenda<=
/div>
<div>13:01 &lt;+stefan_schmidt&gt; i can chair if nobody wants</div><div>13=
:01 &lt;+Jefro&gt; stefan_schmidt wins the chair going into round 2</div><d=
iv>13:01 &lt;+khem&gt; ok</div><div>13:01 &lt;+stefan_schmidt&gt; new topic=
s anyone?</div>
<div>13:02 &lt;+stefan_schmidt&gt; (02) new topics)</div><div>13:02 &lt;+Ta=
rtarus&gt; Yeah, I think I have a new topic</div><div>13:02 &lt;+stefan_sch=
midt&gt; shot</div><div>13:02 &lt;+Tartarus&gt; Discussion about more (or m=
ore complex) building before pushing changes to master</div>
<div>13:02 &lt;+RP__&gt; We should probably talk about new features in OE-C=
ore and bitbake changes needed to support them</div><div>13:02 &lt;+Tartaru=
s&gt; I&#39;ll also say maybe it&#39;s a bit of an over-react to the glibc =
thing</div>
<div>13:03 &lt;+RP__&gt; Tartarus: Say when and I&#39;ll explain why I did =
that :)</div><div>13:03 &lt;+Tartarus&gt; Yeah, lets just talk about it whe=
n we get to it, that&#39;s all</div><div>13:03 &lt;+Tartarus&gt; All I&#39;=
ve got for new topics</div>
<div>13:03 &lt;+RP__&gt; I sent out that patterns in class hackery email</d=
iv><div>13:03 &lt;+stefan_schmidt&gt; that fits in 5</div><div>13:04 &lt;+s=
tefan_schmidt&gt; so we put this in status updates</div><div>13:04 &lt;+ste=
fan_schmidt&gt; any more topics?</div>
<div>13:04 &lt;+RP__&gt; none here</div><div>13:04 &lt;+fray&gt; nothing he=
re</div><div>13:05 &lt;+stefan_schmidt&gt; ok, closed</div><div>13:05 &lt;+=
stefan_schmidt&gt; 03) action items from last week</div><div>13:05 &lt;+Tar=
tarus&gt; OK, for my AI I updated the wiki page and sent out the email (whi=
ch noted that this is just spelling out the policy more clearly, it didn&#3=
9;t say oe.dev only before, just &quot;relevant upstream&quot;)</div>
<div>13:05 &lt;+Tartarus&gt; So that&#39;s done.</div><div>13:05 &lt;+stefa=
n_schmidt&gt; ok</div><div>13:06 &lt;+stefan_schmidt&gt; can be off list ne=
xt week</div><div>13:06 *** Jefro notes</div><div>13:06 &lt;+khem&gt; my AR=
 for oe-users is also done</div>
<div>13:06 &lt;+stefan_schmidt&gt; oe-user is also done as it got closed</d=
iv><div>13:06 &lt;+stefan_schmidt&gt; right :)</div><div>13:06 &lt;+khem&gt=
; list is r/o now well sort off</div><div>13:06 &lt;+stefan_schmidt&gt; wit=
h a notice posting to dev</div>
<div>13:06 &lt;+stefan_schmidt&gt; ok, not worth an AR any more</div><div>1=
3:06 &lt;+stefan_schmidt&gt; can go off list as well</div><div>13:07 &lt;+s=
tefan_schmidt&gt; khem: =A0--&gt; patches appearing on oe-dev, khem to send=
 email regarding &quot;put stuff in meta-oe&quot;</div>
<div>13:07 &lt;+khem&gt; stefan_schmidt: I did not do that yet</div><div>13=
:07 &lt;+stefan_schmidt&gt; khem: ok, so this one we are keeping</div><div>=
13:07 &lt;+stefan_schmidt&gt; am I to fast?</div><div>13:07 &lt;+RP__&gt; s=
tefan_schmidt: no :)</div>
<div>13:07 &lt;+stefan_schmidt&gt; good</div><div>13:08 &lt;+khem&gt; altho=
ugh it means building/testing using oe-core</div><div>13:08 &lt;+stefan_sch=
midt&gt; 04) TSC structure &amp; elections</div><div>13:08 &lt;+RP__&gt; Fo=
r 04 I have a reply from the board saying they accepted our proposal and wi=
ll be starting the election process this week</div>
<div>13:08 &lt;+stefan_schmidt&gt; ok, good</div><div>13:08 *** Jefro notes=
</div><div>13:08 &lt;+RP__&gt; So nothing further for the TSC to do, its in=
 the hands of the board</div><div>13:08 &lt;+stefan_schmidt&gt; So we wait =
for a mail from them on members</div>
<div>13:08 &lt;+fray&gt; sounds good</div><div>13:09 &lt;+stefan_schmidt&gt=
; wow, the AR going away today...</div><div>13:09 &lt;+stefan_schmidt&gt; t=
hat brings us to 5</div><div>13:09 &lt;+stefan_schmidt&gt; 05) Status updat=
es</div>
<div>13:09 *** Jefro notes 80% of agenda covered in 10 minutes, a new recor=
d</div><div>13:10 &lt;+fray&gt; :) =A0We&#39;re getting better</div><div>13=
:10 &lt;+RP__&gt; well, we did put all the discssion in 5)</div><div>13:10 =
&lt;+stefan_schmidt&gt; psst, don&#39;t tell anyone</div>
<div>13:11 &lt;+stefan_schmidt&gt; RP__: Tartarus you guys want to start wi=
th the testing and eglibc change</div><div>13:11 &lt;+stefan_schmidt&gt; ?<=
/div><div>13:11 &lt;+khem&gt; on status. I am working on making libtirpc be=
 a drop in replacement for glibc rpc buts its not so straight forward</div>
<div>13:11 &lt;+khem&gt; it needs lot of work</div><div>13:11 &lt;+Tartarus=
&gt; Lets get general status bits out first</div><div>13:12 &lt;+RP__&gt; o=
k. Its been a bit of a hard week for me and OE-Core since Saul is away and =
I&#39;ve been trying to resolve multilib</div>
<div>13:13 &lt;+RP__&gt; There is now actual working code out there as a fo=
undation for multilib which is great, not so great was the backlog of patch=
es</div><div>13:13 &lt;+Tartarus&gt; I&#39;ve started kicking the oe-core +=
 meta-oe tires harder and thinking about what I can do about getting more b=
uilds to happen on a weekend-basis</div>
<div>13:13 &lt;+RP__&gt; I am clearing most of it (I think) but we had the =
odd hiccup and we need to stabilise</div><div>13:13 &lt;+fray&gt; I think I=
&#39;ve gotten all of the patches out to fix the majority of the permission=
/owners/group issues.. only thing remaining is symlink vs actualy directory=
 ownership.. (after the meeting if anyone has a minute or two I&#39;m looki=
ng for suggestions )</div>
<div>13:14 &lt;+RP__&gt; Its been complicated by Yocto build machine moves =
and power outages</div><div>13:14 &lt;+RP__&gt; and a bug which took out so=
me of the builders</div><div>13:14 &lt;+Tartarus&gt; RP__: So, to jump ahea=
d, the usual process is that Saul throws things at the build machines and t=
hen a pull request, but, no Saul, build machine issues, stuff happened</div=
>
<div>13:14 &lt;+Tartarus&gt; ?</div><div>13:15 &lt;+RP__&gt; Tartarus: pret=
ty much</div><div>13:15 &lt;+Tartarus&gt; OK, I think that&#39;s a good eno=
ugh answer</div><div>13:15 &lt;+RP__&gt; I was conscious I was getting behi=
nd with pull requests and things we&#39;re looking like they were getting o=
ut of control. I therefore merged it assuming it had been a little more tes=
ted than it had. As soon as it was clear there were issues, it got reverts =
of the appropriate pieces.</div>
<div>13:15 &lt;+Tartarus&gt; Maybe we can try and find a backup Saul?</div>=
<div>13:15 &lt;+Tartarus&gt; Let him have some vacation now and again and o=
therwise ease the burden</div><div>13:15 &lt;+RP__&gt; Tartarus: I really w=
ould like to get to the point where we have a few people acting to review/b=
atch up patches</div>
<div>13:16 &lt;+khem&gt; I think when a pull request it send folks with mac=
hine power can pick and test too</div><div>13:16 &lt;+khem&gt; and provide =
feedback</div><div>13:16 &lt;+Tartarus&gt; RP__: Yeah</div><div>13:16 &lt;+=
fray&gt; ya, would be nice</div>
<div>13:16 &lt;+stefan_schmidt&gt; and they would need to report to let peo=
ple know about failure/success</div><div>13:16 &lt;+RP__&gt; khem: This doe=
sn&#39;t change the fact people do need to test changes before posting them=
 though. For things like eglibc I think we need to start stating what testi=
ng has/has not been done</div>
<div>13:17 &lt;+khem&gt; RP__: I did build and boot of all qemus</div><div>=
13:17 &lt;+fray&gt; I think there are a series of changes we should probabl=
y styart requesting &quot;testing&quot; info</div><div>13:17 &lt;+RP__&gt; =
At least then we can make more informed decisions about when something has =
been tested ready to merge</div>
<div>13:17 &lt;+RP__&gt; khem: which images though?</div><div>13:17 &lt;+fr=
ay&gt; package managers, toolchain...</div><div>13:17 &lt;+Tartarus&gt; Wel=
l, stop</div><div>13:17 *** koen finally got qemu working on his osx machin=
e</div>
<div>13:17 &lt;+Tartarus&gt; We have an update policy</div><div>13:17 &lt;+=
khem&gt; RP__: I used console-image from angstrom</div><div>13:17 &lt;+RP__=
&gt; khem: even mentioning what we&#39;d tested would he</div><div>13:17 &l=
t;+Tartarus&gt; And eglibc pretty clearly falls into the infrastructure and=
 needs a full test side</div>
<div>13:17 &lt;+Tartarus&gt; So, why didn&#39;t we follow it?</div><div>13:=
18 &lt;+RP__&gt; Tartarus: my fault I guess, I assumed it had more testing =
than it had :/</div><div>13:18 &lt;+khem&gt; RP__: but I guess since most o=
f stuff was from shared state many things did not pop up</div>
<div>13:18 &lt;+koen&gt; so we all screwed up and learnt our lesson</div><d=
iv>13:18 &lt;+Tartarus&gt; khem, yeah, that doesn&#39;t fit into the policy=
</div><div>13:18 &lt;+fray&gt; ya, thats the way I took it</div><div>13:18 =
&lt;+RP__&gt; khem: Its a detail like that I need - it was from sstate :(</=
div>
<div>13:19 &lt;+fray&gt; it was reverted quick enough and we had enough peo=
ple actively using it that we dealt with it quickly</div><div>13:19 &lt;+RP=
__&gt; sstate does exclude toolchain from the hashes by default :(</div>
<div>13:19 &lt;+khem&gt; I realised it later when fray posted=A0</div><div>=
13:19 &lt;+fray&gt; RP__ even hashbasic?</div><div>13:19 &lt;+khem&gt; best=
 for toolchain changes is to build from scratch=A0</div><div>13:19 &lt;+fra=
y&gt; &#39;er basichash I mean</div>
<div>13:19 &lt;+RP__&gt; fray: not 100% sure about that, it should have cau=
ght eglibc</div><div>13:20 &lt;+khem&gt; but then it might screw someone wh=
o is using shared state so it has to be done both ways</div><div>13:20 &lt;=
+fray&gt; mine (I&#39;m using basichash) did detect a change and started re=
building everything.. which is why the rpc failure happened</div>
<div>13:20 &lt;+stefan_schmidt&gt; so, what did we learn?</div><div>13:20 &=
lt;+RP__&gt; So lessons are: I need to ask more questions and people need t=
o provide more info about what testing has been done</div><div>13:20 &lt;+s=
tefan_schmidt&gt; more and wider testing for stuff like eglibc</div>
<div>13:21 &lt;+koen&gt; and libc upgrades shouldn&#39;t be replaces</div><=
div>13:21 &lt;+khem&gt; and folks could test the pull requests too so we ar=
e preemptive and not reactive</div><div>13:21 &lt;+stefan_schmidt&gt; maybe=
 get some other people on board like saul doing patch collecting and builin=
g</div>
<div>13:21 &lt;+koen&gt; and new versions shouldn&#39;t be the default for =
$period of time</div><div>13:21 &lt;+fray&gt; koen, I think thats a good id=
ea (for the future)..</div><div>13:21 &lt;+RP__&gt; fray: ok, that is good =
at least</div>
<div>13:22 &lt;+RP__&gt; fray: I think it stops at the gcc boundary so it w=
ill rebuild for libc but not gcc</div><div>13:22 &lt;+fray&gt; ok</div><div=
>13:22 &lt;+RP__&gt; Its programmable</div><div>13:22 &lt;+Tartarus&gt; koe=
n: So, in sum, we need to follow the upgrade policy we wrote and agreed on<=
/div>
<div>13:23 &lt;+khem&gt; I think we should define miimum checkin criteria=
=A0</div><div>13:23 &lt;+koen&gt; Tartarus: basically, yes</div><div>13:24 =
&lt;+RP__&gt; This is also a wakeup call for the team as I&#39;m never goin=
g to catch everything bad</div>
<div>13:24 &lt;+RP__&gt; So please think twice about pull requests. A pull =
request is saying you consider something ready to go in</div><div>13:24 &lt=
;+fray&gt; one question though -- in the future when this happens agin (som=
ething fundamental breaks and we need to revert) does anyone else have perm=
issions to be able to do the revert if you are not available?</div>
<div>13:25 &lt;+Tartarus&gt; Well, here&#39;s the flip side</div><div>13:25=
 &lt;+fray&gt; RP__ ya I only send patches when I&#39;m ready to go (or cle=
arly label them as such).. =A0I send links to the tree if I want review.. h=
opefully thats reasonable approach</div>
<div>13:25 &lt;+Tartarus&gt; barring vacation, is it that big of a deal?</d=
iv><div>13:25 &lt;+Tartarus&gt; And we can assume RP won&#39;t merge and ru=
n</div><div>13:25 &lt;+fray&gt; Tartarus honestly, I don&#39;t think it is.=
.</div>
<div>13:25 &lt;+RP__&gt; I do try and be around if something tricky is goin=
g in</div><div>13:25 &lt;+RP__&gt; and do hold things if I&#39;m not around=
</div><div>13:26 &lt;+RP__&gt; This is the development tree too, not a rele=
ase/stable branch</div>
<div>13:26 &lt;+Tartarus&gt; Exactly</div><div>13:26 &lt;+fray&gt; agreed</=
div><div>13:26 &lt;+Tartarus&gt; So I think we&#39;re OK with as soon as RP=
 is awake enough to push the revert, if needed</div><div>13:26 &lt;+koen&gt=
; and otherwise we can tell people to rollback manually</div>
<div>13:26 &lt;+RP__&gt; People can easily do that locally too</div><div>13=
:27 &lt;+fray&gt; I really don&#39;t think was really such a big deal.. we&=
#39;ve learned lessons and will do better next time..</div><div>13:27 &lt;+=
fray&gt; RP__ yup.. which is why I posted the revert as quickly as I did</d=
iv>
<div>13:27 *** koen was pinning 2.12 anyway</div><div>13:27 &lt;+RP__&gt; I=
&#39;m of the opinion that we can become too afraid to make changes and tha=
t is sometimes worse than making bad changes and having to revert occasiona=
lly</div>
<div>13:28 &lt;+RP__&gt; If you look at the number of reverts we&#39;ve mad=
e its relatively low</div><div>13:28 &lt;+fray&gt; yup</div><div>13:28 &lt;=
+khem&gt; if you dont =A0make mistakes you havent done anything :)</div><di=
v>
13:28 &lt;+RP__&gt; Very low in fact, I *hate* reverts</div><div>13:28 &lt;=
+koen&gt; do right, do wrong, but at least to somethign :)</div><div>13:28 =
&lt;+RP__&gt; right :)</div><div>13:29 &lt;+stefan_schmidt&gt; so that cove=
rs the oe-core part of 5 this week</div>
<div>13:29 &lt;+khem&gt; I wish more folks could try out the patches and ad=
d acks or tested-bys</div><div>13:29 &lt;+khem&gt; but except Saul no one d=
oes</div><div>13:29 &lt;+stefan_schmidt&gt; - bsp guidelines</div><div>
13:29 &lt;+RP__&gt; stefan_schmidt: Can I touch on the things I mentioned e=
arlier</div><div>13:29 &lt;+RP__&gt; ?</div><div>13:29 &lt;+stefan_schmidt&=
gt; RP__: sure, go ahead</div><div>13:29 &lt;+Tartarus&gt; khem, we need to=
 perhaps make it easier somehow?</div>
<div>13:30 *** Tartarus hmms</div><div>13:30 &lt;+RP__&gt; multilib - there=
 is a plan and rough code out there</div><div>13:30 &lt;+khem&gt; Tartarus:=
 how ?</div><div>13:30 &lt;+RP__&gt; anyone interested should read it :)</d=
iv>
<div>13:30 *** fray notes RPM multilib support is next on his agenda.. so I=
&#39;ll be giving this a try</div><div>13:30 &lt;+fray&gt; (soon)</div><div=
>13:30 &lt;+RP__&gt; Secondly, we have some bitbake changes and oe-core dep=
endenies on those</div>
<div>13:30 &lt;+khem&gt; we need it for opkg and deb as well</div><div>13:3=
1 &lt;+RP__&gt; We currently do need bitbake master anyway</div><div>13:31 =
&lt;+Tartarus&gt; khem: that&#39;s the hard question, I agree</div><div>
13:31 &lt;+RP__&gt; I&#39;m therefore of the opinion this is going to be ok=
 this cycle but we probably need to stop doing this and get better organise=
d</div><div>13:31 &lt;+RP__&gt; and get onto a 1.14 release by October</div=
>
<div>13:31 &lt;+RP__&gt; Any objections to that rough plan?</div><div>13:31=
 &lt;+Tartarus&gt; RP__: I think so long as you don&#39;t make the changes =
on a Friday and of course be careful to do a test with just oe-core (yes, y=
es...), just fix the ugly hackish bits</div>
<div>13:31 &lt;+fray&gt; RP__ ya, we need a way to keep the requiremetns in=
s ync</div><div>13:32 &lt;+RP__&gt; I did manage this once so far this cycl=
e and people got informed when they *needed* the new bitbake version</div>
<div>13:33 &lt;+RP__&gt; I&#39;m trying to batch some changes to avoid doin=
g this more than a couple of more times</div><div>13:33 &lt;+stefan_schmidt=
&gt; thats good</div><div>13:33 &lt;+Tartarus&gt; Lets aim for...</div>
<div>13:33 &lt;+Tartarus&gt; Not July 4th but the week after</div><div>13:3=
3 &lt;+Tartarus&gt; Changes + a bitbake min ver bump</div><div>13:33 &lt;+T=
artarus&gt; and warn people now, even</div><div>13:34 &lt;+RP__&gt; I can s=
end out as many warning emails as I like, I doubt anyone will actually pay =
attention :)</div>
<div>13:34 &lt;+RP__&gt; Anyhow I think we agree on what to do and I just w=
anted to mention what is likely to happen</div><div>13:35 &lt;+RP__&gt; Sec=
ond thing was the patterns email I sent out</div><div>13:35 &lt;+RP__&gt; I=
 find the current state of our core classes depressing to be honest</div>
<div>13:35 &lt;+RP__&gt; full of horrible hacks for PACKAGE_ARCH, BASE_PACK=
AGE_ARCH and friends :(</div><div>13:35 &lt;+khem&gt; I agree</div><div>13:=
35 &lt;+fray&gt; the hacks and hard-coded arch definitions worries me a lot=
</div>
<div>13:36 &lt;+RP__&gt; I know how to clean it up but not how to do so wit=
hout breaking backwards compatibility :(</div><div>13:36 &lt;+fray&gt; reci=
pe compatibility (to me) is the key item.. and even that isn&#39;t expected=
 to be 100%</div>
<div>13:36 &lt;+RP__&gt; There are also some little pieces of previous clea=
nups missing such as making cross packages move into the native workdir and=
 have the targetarch as a suffix to PN</div><div>13:36 &lt;+khem&gt; RP__: =
you mean with bb semantic changes=A0</div>
<div>13:36 &lt;+fray&gt; the key thing from a user perspective is when some=
thing changes (incompatible) tell me what it is and how to deal with it in =
my code</div><div>13:37 &lt;+RP__&gt; khem: machine.conf file definitions i=
s the main issue</div>
<div>13:37 &lt;+RP__&gt; khem: I can deal with the bitbake issues</div><div=
>13:37 &lt;+stefan_schmidt&gt; So problems with BSP layers</div><div>13:37 =
&lt;+RP__&gt; machine.conf files should not be setting TARGET_ARCH IMO</div=
>
<div>13:37 &lt;+RP__&gt; yes</div><div>13:38 &lt;+Tartarus&gt; Maybe a 1.2 =
or whatever the next release is thing?</div><div>13:38 &lt;+koen&gt; RP__: =
so what should be setting it then?</div><div>13:38 &lt;+RP__&gt; koen: some=
thing new</div>
<div>13:38 &lt;+khem&gt; We need arch files=A0</div><div>13:38 &lt;+RP__&gt=
; koen: for the same reason you want BASE_PACKAGE_ARCH not to change</div><=
div>13:38 &lt;+RP__&gt; Tartarus: well, there is that argument and also the=
 shouldn&#39;t we fix this now before we get more users</div>
<div>13:39 &lt;+fray&gt; khem, come back to my suggestion for a heirarchica=
l definition of a arch -&gt; multilib -&gt; tune -&gt; BSP/machine</div><di=
v>13:39 &lt;+RP__&gt; I don&#39;t really want to discuss how we fix it, tha=
t is easy</div>
<div>13:39 &lt;+RP__&gt; its how to transition</div><div>13:39 &lt;+khem&gt=
; fray: yes thats good=A0</div><div>13:39 &lt;+fray&gt; one of the complain=
ts I&#39;ve heard about potentially adding &quot;more&quot; config files is=
 that people don&#39;t necessarily see the logic of where things are being =
set today</div>
<div>13:40 &lt;+fray&gt; local.conf makes sense.. bitbake.conf makes sense.=
. its the stuff in the middle that people get confused by when theyre tryin=
g to create a distro, patch, etc..</div><div>13:40 &lt;+khem&gt; RP__: I th=
ink with releases regularly we can break some backward compatibility=A0</di=
v>
<div>13:40 &lt;+Tartarus&gt; RP__: I would go with we have a lot to do for =
this release</div><div>13:40 &lt;+Tartarus&gt; and not all that much time</=
div><div>13:40 &lt;+Tartarus&gt; Lets get multilib really solid</div><div>
13:40 &lt;+RP__&gt; Tartarus: I&#39;m leaning the other way</div><div>13:40=
 -!- Jefro ~<a href=3D"mailto:Jefro@cust-67-203-89-34.static.o1.com" target=
=3D"_blank" style=3D"color: rgb(0, 0, 204); ">Jefro@cust-67-203-89-34.stati=
c.o1.com</a>=A0has quit [Ping timeout: 240 seconds]</div>
<div>13:40 &lt;+RP__&gt; I think multilib will be a mess without this</div>=
<div>13:41 &lt;+fray&gt; Tartarus I&#39;m not sure we&#39;ll be able to get=
 multilib solid without &quot;fixing&quot; the variable mess</div><div>
13:41 &lt;+Tartarus&gt; I agree multilib will make the current mess clear</=
div><div>13:41 &lt;+fray&gt; multilib exposes a lot of design issues</div><=
div>13:41 &lt;+RP__&gt; Each time I work on one of these classes I add more=
 hackery around previous mess</div>
<div>13:41 &lt;+Tartarus&gt; How many big items do you want in the air at o=
nce?</div><div>13:41 &lt;+RP__&gt; Well, I don&#39;t know</div><div>13:41 &=
lt;+RP__&gt; I do want to make the issue clear though</div><div>13:42 &lt;+=
fray&gt; (for infrastructure -- not recipe stuff).. I see these are two sep=
erate work items, that go together..</div>
<div>13:42 &lt;+fray&gt; we focus on one.. adapt the other until they&#39;r=
e in sync</div><div>13:42 &lt;+khem&gt; I kind of think that we should clea=
r the classes for these excess vars</div><div>13:42 &lt;+khem&gt; first</di=
v>
<div>13:42 &lt;+RP__&gt; I can probably do this so that anyone using tune i=
nclude files from oe-core will continue to work</div><div>13:42 &lt;+RP__&g=
t; khem: We can&#39;t clear them until we have stable values for them to us=
e</div>
<div>13:43 &lt;+fray&gt; khem, get the classes cleaned up so the multilib h=
acks are at a minimum..</div><div>13:43 &lt;+fray&gt; classes/variables</di=
v><div>13:43 &lt;+RP__&gt; khem: e.g. when you change TARGET_ARCH now, the =
original value is gone</div>
<div>13:43 &lt;+RP__&gt; so ok, we add a copy of the value</div><div>13:43 =
&lt;+RP__&gt; but do this for 5 variables in 5 different classes under diff=
erent conditions and your head hurts :(</div><div>13:43 &lt;+khem&gt; RP__:=
 thats a design problem though</div>
<div>13:44 &lt;+RP__&gt; khem: one which is rooted in the machine files</di=
v><div>13:44 &lt;+fray&gt; (BTW way we did that in our non-OE based system =
is define everything as FOO_variant... then the core set such as TARGET_ARC=
H get evaluated to TARGET_ARCH_variant before each recipe is built)</div>
<div>13:44 *** stefan_schmidt shows the 15 minutes left sign around</div><d=
iv>13:44 &lt;+RP__&gt; Let me make this a call to action via email</div><di=
v>13:45 &lt;+RP__&gt; Anything else under status updates?</div><div>13:45 &=
lt;+stefan_schmidt&gt; - bsp guidelines?</div>
<div>13:45 &lt;+fray&gt; but it means that the set of things that are &quot=
;specific&quot; to a &#39;variant&#39; are always overriden -- if we do the=
 same, we&#39;ll need to detect if someone is playing with that and give th=
em santiy or some other guide</div>
<div>13:45 &lt;+stefan_schmidt&gt; - metadata layer splitting?</div><div>13=
:45 &lt;+stefan_schmidt&gt; - infrastructure?</div><div>13:46 &lt;+fray&gt;=
 infrastructure -- other then melo having issues this week.. the fallback g=
ithub seems to have worked.. =A0I didn&#39;t see development drop off due t=
o that..</div>
<div>13:46 &lt;+fray&gt; (in otherwords I&#39;m happy with the fall back pl=
an)</div><div>13:46 &lt;+koen&gt; almost nothing going into .dev anyway</di=
v><div>13:46 &lt;+RP__&gt; Tom is having various difficulties I think :/</d=
iv>
<div>13:46 &lt;+koen&gt; something seems to be DOS&#39;ing melo</div><div>1=
3:47 &lt;+RP__&gt; I think its those gcc commits</div><div>13:47 &lt;+RP__&=
gt; overload cgit</div><div>13:47 &lt;+RP__&gt; all you need is a few of th=
em and a webbot</div>
<div>13:48 &lt;+fray&gt; github seems to be able to handle it at least...</=
div><div>13:48 &lt;+RP__&gt; fray: I&#39;m hoping its an isolated issue</di=
v><div>13:48 &lt;+fray&gt; same...</div><div>13:49 &lt;+stefan_schmidt&gt; =
layer splitting and bsp guidelines?</div>
<div>13:49 &lt;+RP__&gt; Since its quiet another question: How are people f=
inding OE-Core compared to .dev?</div><div>13:49 &lt;+khem&gt; going back t=
o eglibc issue .. So for core recipes e.g. toolchain I would say we require=
 additional 2 tested-bys minimum=A0</div>
<div>13:50 &lt;+Tartarus&gt; oe-core + meta-oe makes me pine for bbclass.bb=
append, but I agree with what we came to a conclusion on before</div><div>1=
3:50 &lt;+khem&gt; RP__: it seems nicers</div><div>13:51 &lt;+khem&gt; RP__=
: but I guess with oe.dev folks had lot more choice of machines as they wer=
e collectively maintained=A0</div>
<div>13:51 &lt;+fray&gt; khem, I&#39;m happy to do that if we feel it&#39;s=
 necessary -- I&#39;m willing to relax that as in &quot;new versions&quot; =
or &quot;major changes&quot;</div><div>13:51 &lt;+RP__&gt; tbh I think we&#=
39;ve learnt our lesson</div>
<div>13:52 &lt;+khem&gt; RP__: when I have more machine built in same tmpdi=
r then bb runque generation slows down very much</div><div>13:52 &lt;+khem&=
gt; have you observed that</div><div>13:52 &lt;+RP__&gt; khem: no :/</div>
<div>13:52 &lt;+khem&gt; RP__: e.g. I have all supported qemus</div><div>13=
:52 &lt;+koen&gt; and bitbake tkaes half a gig of ram</div><div>13:53 &lt;+=
khem&gt; when its only 1 then its very fast</div><div>13:53 &lt;+RP__&gt; D=
oes wiping tmp/cache speed it up again/</div>
<div>13:53 &lt;+RP__&gt; ?</div><div>13:53 &lt;+khem&gt; havent tried but I=
 can give it a shot</div><div>13:54 &lt;+khem&gt; RP__: and cache dir is in=
 both tmp and tmp-eglibc</div><div>13:54 &lt;+RP__&gt; khem: yes</div><div>
13:54 *** stefan_schmidt shows the 5 minutes left sign. Last orders.</div><=
div>13:54 &lt;+RP__&gt; khem: bonus marks for pinointing the specific file<=
/div><div>13:55 &lt;+RP__&gt; khem: I suspect the codeparser cache</div>
<div>13:55 &lt;+RP__&gt; stefan_schmidt: I think we&#39;re done tbh?</div><=
div>13:55 &lt;+stefan_schmidt&gt; I&#39;m wondering a bit where we stand wi=
th the BSP guidelines</div><div>13:55 &lt;+RP__&gt; khem: time bitbake xxx-=
image -n might help btw</div>
<div>13:55 &lt;+stefan_schmidt&gt; We had them in the topics since the begi=
nning</div><div>13:56 &lt;+khem&gt; RP__: yes I deleted the cache lets see<=
/div><div>13:56 &lt;+RP__&gt; stefan_schmidt: there is the BSP developers g=
uide</div>
<div>13:56 &lt;+fray&gt; I&#39;m done.. if you have a few minutes I just wa=
nt to mention a small topic and see if anyone has input</div><div>13:56 &lt=
;+RP__&gt; (which Yocto has)</div><div>13:56 &lt;+fray&gt; (outside the mee=
ting)</div>
<div>13:56 &lt;+stefan_schmidt&gt; RP__: I know. And what is the guidelines=
 reference in the agenda about?</div><div>13:56 &lt;+RP__&gt; stefan_schmid=
t: it was specifically about using layers for bsps iirc</div><div>13:56 &lt=
;+stefan_schmidt&gt; ah, ok</div>
<div>13:57 &lt;+RP__&gt; so related to the layer splitting topic</div><div>=
13:57 &lt;+stefan_schmidt&gt; so that is missing</div><div>13:57 &lt;+stefa=
n_schmidt&gt; anyway, to late for this meeting</div><div><br></div></span><=
br>
-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/blog" target=3D"_blank"=
>http://jefro.net/blog</a><div>Yocto Project Community Manager @Intel <a hr=
ef=3D"http://yoctoproject.org" target=3D"_blank">http://yoctoproject.org</a=
></div>
<br>

--20cf30549613d9b70504a6d19695--
