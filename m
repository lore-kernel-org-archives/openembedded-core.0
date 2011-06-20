Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1QYlcc-0008Is-3k; Mon, 20 Jun 2011 23:03:02 +0200
Received: by iwn19 with SMTP id 19so4448258iwn.6
	for <multiple recipients>; Mon, 20 Jun 2011 13:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type;
	bh=XDdn0Qw1/cbrZeutDm+FwNbmCFXmXHv+EBgzvbolWRQ=;
	b=uMPc7SgNOUHpjBb/WPeGbc59AVR1K2y6jGz2R2AFdLq7gc4YJUDuPwsh7XitjBiIN+
	s1WrSYjnf4gzFVBUVBUJ/j5SctYpmO6Cn++6PohVlnXMZApTth2kMcgm7fjQX4g1HE8/
	CnW7d1vm/PotMLXr+RLL1x8JjmyMsuzfoW8eQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=LcIKDyZncGIrG3El4NYxLE+FqgNsfKaMaYGO9BmW4ekEcOASuatts0JF8zjwm1HOKS
	xwF04S7fqFBixToCptbLqiaYBdXUwlZlj0ayPR6S3P3Q7VILXyiMMpglSWzwCkpZVKQB
	fSm+86M3bd80HqwgPRr/jCKOpOJj33uEeYfKk=
MIME-Version: 1.0
Received: by 10.42.161.138 with SMTP id t10mr6602710icx.3.1308603567997; Mon,
	20 Jun 2011 13:59:27 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.42.222.66 with HTTP; Mon, 20 Jun 2011 13:59:27 -0700 (PDT)
Date: Mon, 20 Jun 2011 13:59:27 -0700
X-Google-Sender-Auth: jx_N7eJGXuPjBYaOGz0rfX-0ZRQ
Message-ID: <BANLkTi=3n0+y1xoexctCfQtrqu+8ADSAwA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES: OE-TSC meeting 16-Jun-2011
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
X-List-Received-Date: Mon, 20 Jun 2011 21:03:03 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e815ed2829804a62b0297

--90e6ba6e815ed2829804a62b0297
Content-Type: text/plain; charset=ISO-8859-1

 oe-tsc minutes, 16-Jun-2011

Attending: Koen, Khem, Tom, Richard, Mark
Apologies: Stefan
Notes: Jefro

Agenda

01) choose a meeting chair

Tom

02) topics

khem: fallback source mirror for oe-core
  premirrors?  who maintains no-longer-upstream mirror?
  kitchen-sink mirror is not a benefit for oe-core, but it is beneficial for
yocto, angstrom
  "mirror" becomes a distro concept
  meta-oe is not a distro, won't have a policy
  oe-core on its own will degrade over time - ok, as oe-core -only users are
advanced?
  khem thinks adding fallback mirrors not a bad choice, given certain
constraints
  -->when we have a release we can revisit if it's appropriate there

khem: patches appearing for recipes on oe-dev:
  --> khem to send email regarding "put stuff in meta-oe"

"long" term support for 2011.03-maintenance
  --> Tom to change strategy for maint branch, oe.dev master to
oe-core/meta-oe/layer

khem: promote devs to participate in oe-user
  --> on agenda for next week

03) action items from last week

mark: posted the Commit & Policy Guidelines on the wiki, to much fanfare
tom: GNOME stuff moving along
RP: sent email to board, no response yet

04) TSC structure & elections

--> RP to send a note to board asking for status on prior message

05) Status updates
      - oe-core
  discussions about multilib, tuning files
      - bsp guidelines
      - metadata layer splitting
      - infrastructure

Raw Transcript

(1:01:00 PM) Tartarus: I'll chair, too, if no one has already volunteered
(1:01:15 PM) Jefro: hi Tartarus - no one has volunteered yet,
congratulations
(1:02:46 PM) Jefro: Agenda is at http://pastebin.com/PhJpWfjr
(1:02:52 PM) Tartarus: thanks
(1:03:01 PM) Tartarus: waiting on Khem, but, #2, new items?
(1:03:07 PM) fray: I don't hve anything to add
(1:03:14 PM) ***Tartarus has none
(1:03:25 PM) Tartarus: RP? koen? khem?
(1:03:35 PM) Tartarus: (and khem's no or new topics will move us on to #3)
(1:04:01 PM) Jefro: stefan sends apologies
(1:04:18 PM) khem: ich bin hier
(1:04:28 PM) fray: (we on 3 then?)
(1:04:40 PM) Tartarus: Well, i thought RP and koen would reply quickly ;)
(1:05:04 PM) Tartarus: RP__ ? (for making his irc client beep, presumably)
(1:06:12 PM) khem: I think fall back src mirror for oe-core
(1:06:20 PM) khem: we could talk about that
(1:06:43 PM) Tartarus: fine by me
(1:07:03 PM) fray: good topic.. I have some minor input for that
(1:07:12 PM) Tartarus: RP__, koen, ping?
(1:08:07 PM) koen: pong
(1:08:12 PM) Tartarus: new topics?
(1:09:04 PM) khem: I am seeing some new patches for recipes on oe.dev
(1:09:26 PM) khem: I guess because people adopted releases and are now
posting the updates
(1:09:38 PM) Tartarus: khem: So, you want to bring up discussion winding
down oe.dev?
(1:09:41 PM) khem: so how should we handle that
(1:10:14 PM) Tartarus: Or just that topic, new work going into oe.dev and
what to tell/remind people?
(1:10:16 PM) khem: Tartarus: yeah should we change the policy for release
branch
(1:10:23 PM) khem: where it can take patches if needed
(1:10:32 PM) khem: but the new patches what to do about those
(1:10:38 PM) Tartarus: khem, hm?
(1:10:39 PM) khem: some recipes are not in any layer
(1:10:50 PM) Tartarus: well, hang on
(1:10:56 PM) Tartarus: ok, new topic added to the list
(1:10:58 PM) koen: Tartarus: "long" term support for 2011.03-maintenance
(1:11:17 PM) khem: and I would like to promote devs to participate in
oe-user
(1:11:18 PM) Tartarus: ok, so we've got oe-core mirror, dev happening in
oe.dev and 2011.03-maint long term
(1:11:19 PM) RP__: soory brb
(1:11:40 PM) Tartarus: and promoting oe-user
(1:11:44 PM) Tartarus: got all that so far, Jefro?
(1:11:50 PM) koen: oe-user?
(1:11:54 PM) khem: ml
(1:12:10 PM) koen: didn't we say that should go away we'd only have 1 list?
(1:12:11 PM) ***fray is sorry to say he didn't know there was an oe-user
(1:12:12 PM) khem: to encourage more devs
(1:12:34 PM) Tartarus: koen: it's added to the topic list, we'll cover
history then
(1:12:40 PM) khem: fray: if you go to lists.linuxtogo.org
(1:12:47 PM) khem: and grep for OpenEmbedded
(1:12:51 PM) Tartarus: Lets move on to #3 and let RP give any new topics
when he's back again
(1:12:51 PM) khem: you will see all of them
(1:13:02 PM) fray: sounds good..
(1:13:11 PM) Tartarus: #3, AI updates
(1:13:14 PM) Tartarus: I know fray has one
(1:13:21 PM) Jefro: Tartarus - yes, I have it all
(1:13:34 PM) fray: my status update.. the Commit & Policy Guidelines were
posted on the Wiki.  An email has been sent to the oe-dev & oe-core lists
with that information on behalf of the TSC
(1:13:54 PM) fray: One minor note.  I found a small typo in one spot and
fixed it before posting the final version.  I assume that's not a problem.
 ;)
(1:14:04 PM) khem: I dont think so
(1:15:00 PM) Tartarus: Anyone else have AIs?
(1:15:20 PM) Tartarus: GNOME stuff seems to be moving along, but maybe that
was already last week
(1:15:22 PM) fray: RP had one for the election info..  I haven't seen a
response yet
(1:15:40 PM) Tartarus: Ah yes, need to see if the board replied just to RP
or something, when he's back
(1:15:41 PM) Tartarus: thanks
(1:15:52 PM) Tartarus: And elections is #4 too
(1:15:54 PM) koen: I think the election stuff is in the boards court now
(1:16:02 PM) RP__: Sorry guys, I had a phone call I needed to take
(1:16:07 PM) RP__: back now
(1:16:07 PM) Tartarus: koen: right
(1:16:09 PM) fray: I'm not sure what else we can do beyond the letter to the
board
(1:16:15 PM) khem: RP__: NMI ?
(1:16:26 PM) Tartarus: RP__: working backwards, elections stuff?  We know
the email was sent telling the board what's what
(1:17:00 PM) RP__: khem: right :/
(1:17:18 PM) Tartarus: I'd like to propose RP send the board a ping email,
since it's been a week
(1:17:23 PM) RP__: Tartarus: Afaik the board accepted it and the ball is in
their court
(1:17:29 PM) ***RP__ agrees
(1:18:08 PM) Tartarus: RP__: so, any new agenda items you want to add?
(1:18:50 PM) ***RP__ is ok with the agenda
(1:18:55 PM) Tartarus: k
(1:19:07 PM) Tartarus: So, anything more we can do for #4?  Or other AIs
from the last meeting there's status on?
(1:19:13 PM) Tartarus: I think no for #4 and #3
(1:20:42 PM) Tartarus: going once...
(1:20:54 PM) Tartarus: twice
(1:21:14 PM) Tartarus: sold!  On to #5, status updates time
(1:21:41 PM) Tartarus: oe-core, RP?
(1:22:06 PM) RP__: I'm keeping a lower profile than usual as I'm trying to
sort out various multilib work
(1:22:23 PM) RP__: The designs weren't working and we had a team member
leave so I'm trying to resolve that
(1:22:31 PM) Tartarus: OK.  Any idea when you'll poke your head out again on
multilib and ask for more?
(1:22:45 PM) RP__: Tartarus: ask for more what?
(1:22:47 PM) Tartarus: (help, comments, testers)
(1:22:54 PM) khem: he already did
(1:23:07 PM) khem: few days ago
(1:23:10 PM) Tartarus: Yes, sorry, I mean after a few days ago
(1:23:12 PM) fray: Monday was it?
(1:23:21 PM) ***khem has not yet read that long email yet
(1:23:21 PM) RP__: Tartarus: I've put some questions out for discussion
(1:23:28 PM) ***Tartarus does owe reading it over and thinking again, silly
pays the bills stuff...
(1:23:40 PM) RP__: I'm trying to implement things and discovering issues
with the proposal already though
(1:23:54 PM) Tartarus: k
(1:23:55 PM) koen: fray: you need to remember that rpm is "from the future"
and deb/ipk is "KISS"
(1:24:12 PM) Tartarus: I guess, unless you say otherwise RP__, lets go with
to the ML with multilib stuff
(1:24:21 PM) RP__: ML is fine
(1:24:28 PM) Tartarus: OK, any other status updates?
(1:24:34 PM) RP__: I just wanted to highlight I'm distracted atm and Saul is
also away for a week
(1:24:35 PM) Tartarus: infra? layers? bsp stuff?
(1:24:40 PM) RP__: please just bear with me :)
(1:24:48 PM) fray: koen, haha
(1:24:55 PM) khem: I am working on svn based 4.6 recipes for gcc
(1:25:07 PM) fray: I'm ripping my hair out currently with the directory
ownership and user/group/mode collisions..
(1:25:17 PM) fray: (luckily I have an excess of hair to pull out)
(1:25:21 PM) Tartarus: ha
(1:25:44 PM) koen: I have had people asking about sample layers/bsps
(1:25:55 PM) khem: We have converged the meta-oe gcc recipes to use bbappend
if people have not noticed
(1:26:05 PM) Tartarus: i'm starting to figure on local autobuilder and
merging stuff from oe.dev to meta-oe/etc
(1:26:10 PM) koen: a lot of people look at meta-intel and go "meh", so we
need a decent example
(1:26:40 PM) khem: I need meta-intel to build angstrom for my netbook havent
succeeded yet
(1:26:47 PM) RP__: koen: why go meh?
(1:26:55 PM) RP__: koen: We can fix something if necessary
(1:27:14 PM) khem: RP__: fix n450.conf
(1:27:23 PM) RP__: khem: cool on gcc
(1:27:28 PM) RP__: khem: fix how?
(1:27:41 PM) khem: does not work with angstrom
(1:28:16 PM) khem: $ MACHINE=n450 bitbake console-image
(1:28:16 PM) khem: ERROR: Unable to parse conf/bitbake.conf: Could not
include required file conf/machine/atom-pc.conf
(1:28:18 PM) Tartarus: khem, I think the answer is "we" need to pull stuff
out of poky if needed and into oe-core/etc
(1:28:23 PM) Tartarus: or meta-intel or ...
(1:28:24 PM) koen: RP__: meta-intel is not how someone would handle a bsp
migrating for either old-oe or something different
(1:28:36 PM) RP__: khem: ick. I'll ensure that gets fixed asap
(1:28:38 PM) koen: RP__: the biggest "problem" is linux-yocto
(1:28:49 PM) koen: RP__: and x86 is no good fit for arm in general :)
(1:29:07 PM) RP__: koen: ok, those are two things which are harder to change
(1:29:10 PM) koen: RP__: the missing atom-pc is what that mailinglist thread
was about
(1:29:24 PM) RP__: koen: I know that, I didn't realise it was breaking
something in meta-intel though
(1:29:52 PM) koen: RP__: Tom Z is adding the meta-yocto dep to README, so
the problem is a bit less severe now
(1:29:56 PM) fray: note IMHO missing atom-pc is just the tip of a problem..
 (yes it needs to be fixed, but... the definitional of the machines,
tunings, architectures, etc are very confusing today)
(1:30:18 PM) RP__: fray: please can we let that one rest for just a little
longer? ;-)
(1:30:33 PM) fray: thats fine, there are other more pressing issues
(1:30:35 PM) Tartarus: nmi from the baby, bbi2
(1:30:39 PM) khem: fray: all common arch tune files belong to oe-core I
would say
(1:30:54 PM) RP__: khem: That isn't what fray is referring to
(1:31:01 PM) fray: khem, thats fine.. but that is something else
(1:31:16 PM) RP__: khem: currently we merge architecture, ABI and tuning
information together
(1:31:25 PM) khem: yes
(1:31:26 PM) fray: read my email on the mailing list if you have questions..
(1:31:31 PM) koen: I think fra wants to take a step back and make all the
tune files look the same
(1:31:45 PM) RP__: koen: split the tune files up more
(1:31:45 PM) koen: and seperate tuning from ABI
(1:31:57 PM) fray: koen, partially.. some of it is splitting them up more..
and some of it is simply making them consistent
(1:32:13 PM) khem: yeah we need machine.conf arch.conf abi.conf
(1:32:23 PM) RP__: I'm not against any of this but I would like to have some
kind of multilib test framework alongside it
(1:32:38 PM) Tartarus: ok, she's down for a nap, back
(1:32:47 PM) khem: Tartarus: thats was quick
(1:33:00 PM) RP__: and given the currently development situation, I think
having some kind of multilib code first might be helpful
(1:33:11 PM) khem: Tartarus: dont make too much noise typing now :)
(1:33:15 PM) Tartarus: khem: I didn't say she's asleep ;)  She is however,
in her crib and will fall asleep soon
(1:33:29 PM) RP__: (I don't want to redesign tune, then find it doesn't work
for multilib and have to redesign again)
(1:33:43 PM) Tartarus: RP__: makes sense
(1:33:57 PM) fray: RP__, my fear is what is there today won't work with
multilibs -- or will introduce significant extra work
(1:34:01 PM) khem: yes multilib is part of this puzzle definitely
(1:34:09 PM) RP__: fray: I don't worry about this ;-)
(1:34:29 PM) RP__: fray: Worst case I write some very specific multilib
configs, then we generalise them later
(1:34:42 PM) RP__: We have much bigger issues around atm :(
(1:35:01 PM) RP__: e.g. there is no sane way we can have : in PN
(1:35:07 PM) fray: ya.. the permissions file & directory really worries me
as someone focused on userspace..
(1:35:20 PM) fray: I can't actually show today that from one build to the
next we'll get the same FS
(1:35:46 PM) RP__: fray: :/
(1:35:59 PM) koen: fray: the sstate repackaging changes shlibs deps from
time to time as well
(1:36:01 PM) RP__: fray: You're making progress and have a solution in mind
though?
(1:36:17 PM) RP__: koen: ?
(1:36:20 PM) koen: e.g.
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=ac74418adb163a2b5120a9220ac8668860a09fc3
(1:36:22 PM) fray: yes, I am making progress.. solution will be a mix of
distro configuration, detecting the issue, and fixing recipes
(1:36:58 PM) khem: fray: only sane way to do that is if we can schedule the
build in same sequence everytime
(1:37:07 PM) khem: otherwise nullify autoconf
(1:37:21 PM) khem: by providing cached output
(1:37:24 PM) fray: khem, the build ORDER is similar (the same within reason)
due to the build-time deps..
(1:37:38 PM) RP__: khem: I don't understand that...
(1:37:38 PM) khem: fray: even that may not be enough
(1:37:40 PM) fray: the problem is at install time, whatever creates a
directory "first" sets the permissions for the directory.. (same for files)
(1:37:42 PM) khem: depends whats staged
(1:37:57 PM) fray: this is a bug in nearly all of the recipes today..
(1:37:59 PM) khem: ups we are talking about different things nm
(1:38:17 PM) RP__: fray: A hack for now might be to add a do_install
postfunc which fixes up the owners/permissions
(1:38:22 PM) fray: good example is a lot of things in my build are creating
"/usr/lib" as 0775.. when it should be 0755.. :P
(1:38:35 PM) fray: RP__ I'm working on cleaning things in the
package.bbclass
(1:39:06 PM) khem: fray: so we can keep updating one's to umask may be
(1:39:16 PM) RP__: koen: thats rather worrying :/
(1:39:24 PM) fray: heh..  unfortunately thats not enough.. but will likely
help some..
(1:41:02 PM) Tartarus: OK, any more commentary here before we pick up the
new topics?
(1:41:09 PM) fray: nothing for me
(1:41:29 PM) koen: RP__: it's hard to reproduce, so I suspect some race
issue with sstate and the shlib code
(1:42:33 PM) RP__: koen: If you can produce a testcase...
(1:42:42 PM) RP__: Tartarus: nothing from me
(1:42:46 PM) koen: RP__: I've been trying to
(1:42:50 PM) koen: Tartarus: no, let's move on
(1:42:53 PM) Tartarus: OK, so moving on
(1:42:56 PM) Tartarus: oe-core and mirrors
(1:43:00 PM) Tartarus: Been a little talk
(1:43:20 PM) Tartarus: I didn't see anything after my suggestion of a last
resort for oe-core and making sure it's easily configurable for distros to
provide whatever they feel is best
(1:43:34 PM) Tartarus: (eg poky and angstrom making sure stuff is never
missed, if they want)
(1:43:36 PM) fray: with the mirror.. One additional comment beyond what I
sent to the list -- should we have PREMIRRORS?  I'm thinking no.. since we
want to go to the upstream.. if that fails, THEN fall back to the MIRROR
(1:44:00 PM) Tartarus: In general or?
(1:44:02 PM) fray: I don't have any issues with yocto, angstrom, or anything
else being the default fall-back..
(1:44:05 PM) fray: for oe-core
(1:44:10 PM) RP__: Tartarus: You're not clear, you're saying just to default
to what?
(1:44:23 PM) ***RP__ probably isn't 100% up to date on the email thread :/
(1:44:37 PM) Tartarus: RP__: I'm saying oe-core should have no PREMIRRORS
and a MIRRORS that's only got no longer upstream stuff
(1:44:44 PM) Tartarus: so it's a last resort
(1:44:51 PM) fray: Tartarus that should be a bare minimum...
(1:44:58 PM) RP__: Tartarus: Who maintains the no longer upstream stuff
mirror?
(1:44:59 PM) Tartarus: But let poky and angstrom and anyone else fill in
with whatever mirror they want
(1:45:07 PM) fray: but wouldn't cover the case where something "goes away"..
i.e. who adds it to the mirrors
(1:45:09 PM) RP__: We do that today...
(1:45:11 PM) Tartarus: RP__: Whomever does that today, assuming they want to
continue
(1:45:12 PM) khem: fray: yeah no premirrors
(1:45:30 PM) Tartarus: fray: The mirror shouldn't be added to easily/often,
it's a last resort
(1:45:33 PM) RP__: The question is whether OE-Core should benefit from work
done by yocto/angstrom
(1:45:36 PM) Tartarus: eg tinylogin is just not anywhere anymore?  OK, add
it
(1:45:43 PM) Tartarus: tzdata changed again? Time for a new recipe
(1:45:56 PM) khem: RP__: sources.oe.org is maintained by me and Tom K
(1:46:09 PM) fray: my concern is that if we rely (in oe-core) on the mirrors
too heavily, then missing upstreams will be "missed"...
(1:46:12 PM) Tartarus: RP__: I think the answer is that a has everything
mirror ISN'T a benefit for oe-core
(1:46:17 PM) Tartarus: It IS for angstrom, poky, etc
(1:46:22 PM) Tartarus: But oe-core we want to know when stuff moves
(1:46:47 PM) khem: yes thats my understanding too
(1:46:48 PM) Tartarus: Since that means a recipe needs work or something
really did go away
(1:46:50 PM) RP__: Tartarus: I think we're just adversely affecting users if
we do that
(1:46:52 PM) fray: I'm not against "meta-oe" having premirrors, or point to
full mirrors..  since I consider that the "distribution"
(1:47:02 PM) Tartarus: RP__: what users?  oe-core only users?
(1:47:09 PM) RP__: Tartarus: yes
(1:47:18 PM) Tartarus: We expect a certain amount of depth on people not
relying on any distro
(1:47:35 PM) Tartarus: I'd expect every distro to have or point at a real
mirror
(1:47:44 PM) khem: anybody who uses oe-core needs to have a distro hisown or
some predefined
(1:47:51 PM) fray: thats my thought.. oe-core is "not a distro".. meta-oe,
poky, angstrom, et al are
(1:47:55 PM) khem: so mirror becomes distro thing then
(1:48:07 PM) koen: meta-oe is not a distro
(1:48:13 PM) koen: it won't have any policy
(1:48:18 PM) ***khem nods
(1:48:21 PM) RP__: This means that releases of OE-Core will degrade badly
with time
(1:48:26 PM) Tartarus: RP__: why?
(1:48:47 PM) RP__: Tartarus: As things get deleted upstream, it relies on
someone adding them to the minimal mirror
(1:48:53 PM) fray: I would expect an update to oe-core, or a (supported) tag
if something goes missing upstream
(1:48:58 PM) Tartarus: No, it relies on people using the distro for that
release
(1:49:00 PM) fray:  -- or to the minimal mirror
(1:49:05 PM) Tartarus: again, jsut a release of oe-core won't be of much use
(1:49:19 PM) RP__: Tartarus: so the OE-Core release standalone degrades
badly over time
(1:49:19 PM) Tartarus: without a release of angstrom and meta-oe and so on
or poky based on it or ...
(1:49:45 PM) Tartarus: RP__: Yes, and I don't think that's a problem.
 Anyone using oe-core by itself is expected to have depth
(1:49:53 PM) Tartarus: and probably is doing their own custom distro, with
their own mirror
(1:50:00 PM) RP__: Well, I think its a bad move for usability
(1:50:09 PM) RP__: but I appear to be outvoted
(1:50:17 PM) Tartarus: We can revisit
(1:50:32 PM) Tartarus: But as an anecdote, no one's come screaming at me
saying we expect a mirror for 2011.03-maint
(1:50:46 PM) RP__: It means our messages is "you can't use OE-Core unless
you're an expect, pick a distro instead"
(1:50:46 PM) Tartarus: Since it's only supported on a defined set of combos
(1:51:07 PM) Tartarus: RP__: yes!  That's what we've all been driving at I
thought
(1:51:13 PM) Tartarus: You don't use oe-core by itself without another layer
(1:51:16 PM) fray: Thats where I thought we'd been driving as well
(1:51:26 PM) Tartarus: You use it + a distro layer + a BSP layer + ...
(1:51:27 PM) ***koen too
(1:51:31 PM) RP__: Tartarus: if that is the case why keep asking me to
ensure it works? ;-)
(1:51:46 PM) khem: RP__: I would think adding some fall back mirrors is not
a bad choice if we get notification about things coming from mirror instead
of upstream
(1:51:47 PM) koen: oe-core can validate itself, but to actually be usefull
you need extra layers
(1:51:52 PM) Tartarus: RP__: touche.  We also said that it would work at the
time at least sans distro, for validation
(1:51:53 PM) khem: that will address fray's concern
(1:52:29 PM) ***fray notes he's using oe-core for the development when we
submits patches to oe-core..
(1:52:44 PM) fray: but I expect I'll need Poky/Yocto if I'm working on a
distro or BSP
(1:52:45 PM) RP__: I just think having something with broken defaults is
nuts. We have specific checks to check SRC_URI valitidy
(1:53:45 PM) Tartarus: Like I said, we can revisit this
(1:53:51 PM) Tartarus: And maybe for a maint branch we would add some mirror
(1:53:53 PM) khem: ok
(1:54:01 PM) Tartarus: But for active development, we want failures so we
know there's a problem
(1:54:07 PM) ***khem see's RP__ 's point too
(1:54:16 PM) fray: we need to watch error reports and comments.. if people
start complaining, we should reevaluate
(1:54:26 PM) RP__: Tartarus: you said we were revisiting and no further
discussion. Make your mind up please
(1:54:49 PM) Tartarus: RP__: sorry, I mean when we have a release we can
revisit if it's appropriate there
(1:55:03 PM) khem: 5 mins left
(1:55:05 PM) Tartarus: I don't think it is, but i can see a better argument
there then now
(1:55:08 PM) Tartarus: khem: eek, thanks
(1:55:25 PM) RP__: We have people complaining now :(
(1:55:52 PM) Tartarus: Moving on while we have a few min
(1:56:02 PM) Tartarus: khem brought up the topic of people doing dev in
oe.dev rather than oe-core
(1:56:07 PM) Tartarus: What do we want to do about that?
(1:56:21 PM) Tartarus: Make a recommendation that folks do both?  Just a
general reminder that oe.dev will be winding down?
(1:56:23 PM) Tartarus: something else?
(1:56:26 PM) khem: actually there are new devs posting new recipes or
updates
(1:56:37 PM) RP__: We should be trying to ensure feature parity between
oe-dev and oe-core at a minimum
(1:56:46 PM) fray: I expect it will continue, I'm just worried that when we
freeze oe.dev these people are going to be "upset"
(1:56:52 PM) khem: so I would prefer that development to channel into new
layering setup somehow
(1:57:07 PM) RP__: I think we need to put some emails out highlighting the
siutation
(1:57:11 PM) fray: for the oe-core functionality I think thats reasonable..
for the others, is meta-oe at a point we should be trying to get people to
push stuff there?
(1:57:59 PM) khem: may be a new layer
(1:58:08 PM) khem: to keep collecting updates
(1:58:24 PM) koen: looking at the size of my bblayers.conf I'd say "put
stuff in meta-oe"
(1:58:31 PM) khem: heh
(1:58:39 PM) khem: ok
(1:58:45 PM) RP__: I think this is what meta-oe was intended for
(1:58:49 PM) khem: Thats true
(1:59:02 PM) khem: OK I will send out an email
(1:59:25 PM) Tartarus: Sounds good
(1:59:28 PM) khem: for asking oe.dev committers to also post pull requests
to meta-oe
(1:59:53 PM) RP__: khem: thanks!
(1:59:59 PM) Tartarus: OK, lets call that one done
(2:00:04 PM) Tartarus: Everyone got 5 more min?
(2:00:07 PM) khem: oki doki
(2:00:10 PM) ***koen does
(2:00:17 PM) ***Tartarus does
(2:00:22 PM) ***RP__ too
(2:00:23 PM) khem: me too
(2:00:24 PM) Tartarus: OK
(2:00:27 PM) Tartarus: So, last topic
(2:00:32 PM) Tartarus: 2011.03-maint, long term plans
(2:00:37 PM) Tartarus: koen, you brought this up, shoot
(2:01:02 PM) Tartarus: (Jefro and promoting devs to be / use the oe-users ML
more for next week pls)
(2:01:05 PM) khem: we need to define long term may be quantitatively
(2:01:23 PM) koen: if we close .dev, we need a different strategy for the
maintenance branch
(2:01:31 PM) ***Jefro noted
(2:01:36 PM) koen: e.g. "commits need to be in oe-core/meta-oe"
(2:01:54 PM) Tartarus: koen: yes, a change of from oe.dev master to
oe-core/meta-oe/relevant layer" is fine with me
(2:01:56 PM) khem: koen: yes I guess if its a common recipe in meta-oe or
core
(2:01:58 PM) Tartarus: Anything more than that?
(2:02:06 PM) koen: not from me
(2:02:12 PM) Tartarus: OK, that's easy enough
(2:02:21 PM) Tartarus: I'll update the policy now to make that an
alternative
(2:02:27 PM) Tartarus: to encourage folks to be pushing to the new place
(2:02:35 PM) khem: Tartarus: yes sooner this starts better it is
(2:02:38 PM) Tartarus: And not backport from there to oe.master for 2011.03
maint
(2:02:43 PM) khem: it can start even now
(2:02:47 PM) ***Tartarus takes the AI, will do it todayish
(2:02:54 PM) Tartarus: With that then, lets call the meeting closed
(2:02:57 PM) Tartarus: Thanks all

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--90e6ba6e815ed2829804a62b0297
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"Apple-style-span" style=3D"border-collapse: collapse; font-f=
amily: arial, sans-serif; font-size: 13px; "><div>=A0oe-tsc minutes, 16-Jun=
-2011</div><div><br></div><div>Attending: Koen, Khem, Tom, Richard, Mark</d=
iv>
<div>Apologies: Stefan</div><div>Notes: Jefro</div><div><br></div><div>Agen=
da</div><div><br></div><div>01) choose a meeting chair</div><div><br></div>=
<div>Tom</div><div><br></div><div>02) topics</div><div><br></div><div><div>
khem: fallback source mirror for oe-core</div><div>=A0 premirrors? =A0who m=
aintains no-longer-upstream mirror?</div><div>=A0 kitchen-sink mirror is no=
t a benefit for oe-core, but it is beneficial for yocto, angstrom</div><div=
>=A0 &quot;mirror&quot; becomes a distro concept</div>
<div>=A0 meta-oe is not a distro, won&#39;t have a policy</div><div>=A0 oe-=
core on its own will degrade over time - ok, as oe-core -only users are adv=
anced?</div><div>=A0 khem thinks adding fallback mirrors not a bad choice, =
given certain constraints</div>
<div>=A0 --&gt;when we have a release we can revisit if it&#39;s appropriat=
e there</div><div><br></div><div>khem: patches appearing for recipes on oe-=
dev:</div><div>=A0 --&gt; khem to send email regarding &quot;put stuff in m=
eta-oe&quot;</div>
<div><br></div><div>&quot;long&quot; term support for 2011.03-maintenance</=
div></div><div>=A0 --&gt; Tom to change strategy for maint branch, oe.dev m=
aster to oe-core/meta-oe/layer</div><div><br></div><div>khem:=A0promote dev=
s to participate in oe-user</div>
<div>=A0 --&gt; on agenda for next week</div><div><br></div><div>03) action=
 items from last week</div><div><br></div><div>mark: posted the Commit &amp=
; Policy Guidelines on the wiki, to much fanfare</div><div>tom: GNOME stuff=
 moving along</div>
<div>RP: sent email to board, no response yet</div><div><br></div><div>04) =
TSC structure &amp; elections</div><div><br></div><div>--&gt; RP to send a =
note to board asking for status on prior message</div><div><br></div><div>
05) Status updates</div><div>=A0 =A0 =A0 - oe-core</div><div>=A0 discussion=
s about multilib, tuning files</div><div>=A0 =A0 =A0 - bsp guidelines</div>=
<div>=A0 =A0 =A0 - metadata layer splitting</div><div>=A0 =A0 =A0 - infrast=
ructure</div><div><br>
</div><div>Raw Transcript</div><div><br></div><div>(1:01:00 PM) Tartarus: I=
&#39;ll chair, too, if no one has already volunteered</div><div>(1:01:15 PM=
) Jefro: hi Tartarus - no one has volunteered yet, congratulations</div>
<div>(1:02:46 PM) Jefro: Agenda is at=A0<a href=3D"http://pastebin.com/PhJp=
Wfjr" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">http://pastebin.c=
om/PhJpWfjr</a></div><div>(1:02:52 PM) Tartarus: thanks</div><div>(1:03:01 =
PM) Tartarus: waiting on Khem, but, #2, new items?</div>
<div>(1:03:07 PM) fray: I don&#39;t hve anything to add</div><div>(1:03:14 =
PM) ***Tartarus has none</div><div>(1:03:25 PM) Tartarus: RP? koen? khem?</=
div><div>(1:03:35 PM) Tartarus: (and khem&#39;s no or new topics will move =
us on to #3)</div>
<div>(1:04:01 PM) Jefro: stefan sends apologies</div><div>(1:04:18 PM) khem=
: ich bin hier</div><div>(1:04:28 PM) fray: (we on 3 then?)</div><div>(1:04=
:40 PM) Tartarus: Well, i thought RP and koen would reply quickly ;)</div>
<div>(1:05:04 PM) Tartarus: RP__ ? (for making his irc client beep, presuma=
bly)</div><div>(1:06:12 PM) khem: I think fall back src mirror for oe-core<=
/div><div>(1:06:20 PM) khem: we could talk about that</div><div>(1:06:43 PM=
) Tartarus: fine by me</div>
<div>(1:07:03 PM) fray: good topic.. I have some minor input for that</div>=
<div>(1:07:12 PM) Tartarus: RP__, koen, ping?</div><div>(1:08:07 PM) koen: =
pong</div><div>(1:08:12 PM) Tartarus: new topics?</div><div>(1:09:04 PM) kh=
em: I am seeing some new patches for recipes on oe.dev</div>
<div>(1:09:26 PM) khem: I guess because people adopted releases and are now=
 posting the updates</div><div>(1:09:38 PM) Tartarus: khem: So, you want to=
 bring up discussion winding down oe.dev?</div><div>(1:09:41 PM) khem: so h=
ow should we handle that</div>
<div>(1:10:14 PM) Tartarus: Or just that topic, new work going into oe.dev =
and what to tell/remind people?</div><div>(1:10:16 PM) khem: Tartarus: yeah=
 should we change the policy for release branch</div><div>(1:10:23 PM) khem=
: where it can take patches if needed</div>
<div>(1:10:32 PM) khem: but the new patches what to do about those</div><di=
v>(1:10:38 PM) Tartarus: khem, hm?</div><div>(1:10:39 PM) khem: some recipe=
s are not in any layer</div><div>(1:10:50 PM) Tartarus: well, hang on</div>
<div>(1:10:56 PM) Tartarus: ok, new topic added to the list</div><div>(1:10=
:58 PM) koen: Tartarus: &quot;long&quot; term support for 2011.03-maintenan=
ce</div><div>(1:11:17 PM) khem: and I would like to promote devs to partici=
pate in oe-user</div>
<div>(1:11:18 PM) Tartarus: ok, so we&#39;ve got oe-core mirror, dev happen=
ing in oe.dev and 2011.03-maint long term</div><div>(1:11:19 PM) RP__: soor=
y brb</div><div>(1:11:40 PM) Tartarus: and promoting oe-user</div><div>
(1:11:44 PM) Tartarus: got all that so far, Jefro?</div><div>(1:11:50 PM) k=
oen: oe-user?</div><div>(1:11:54 PM) khem: ml</div><div>(1:12:10 PM) koen: =
didn&#39;t we say that should go away we&#39;d only have 1 list?</div><div>
(1:12:11 PM) ***fray is sorry to say he didn&#39;t know there was an oe-use=
r</div><div>(1:12:12 PM) khem: to encourage more devs</div><div>(1:12:34 PM=
) Tartarus: koen: it&#39;s added to the topic list, we&#39;ll cover history=
 then</div>
<div>(1:12:40 PM) khem: fray: if you go to=A0<a href=3D"http://lists.linuxt=
ogo.org/" target=3D"_blank" style=3D"color: rgb(0, 0, 204); ">lists.linuxto=
go.org</a></div><div>(1:12:47 PM) khem: and grep for OpenEmbedded</div><div=
>(1:12:51 PM) Tartarus: Lets move on to #3 and let RP give any new topics w=
hen he&#39;s back again</div>
<div>(1:12:51 PM) khem: you will see all of them</div><div>(1:13:02 PM) fra=
y: sounds good..</div><div>(1:13:11 PM) Tartarus: #3, AI updates</div><div>=
(1:13:14 PM) Tartarus: I know fray has one</div><div>(1:13:21 PM) Jefro: Ta=
rtarus - yes, I have it all</div>
<div>(1:13:34 PM) fray: my status update.. the Commit &amp; Policy Guidelin=
es were posted on the Wiki. =A0An email has been sent to the oe-dev &amp; o=
e-core lists with that information on behalf of the TSC</div><div>(1:13:54 =
PM) fray: One minor note. =A0I found a small typo in one spot and fixed it =
before posting the final version. =A0I assume that&#39;s not a problem. =A0=
;)</div>
<div>(1:14:04 PM) khem: I dont think so</div><div>(1:15:00 PM) Tartarus: An=
yone else have AIs?</div><div>(1:15:20 PM) Tartarus: GNOME stuff seems to b=
e moving along, but maybe that was already last week</div><div>(1:15:22 PM)=
 fray: RP had one for the election info.. =A0I haven&#39;t seen a response =
yet</div>
<div>(1:15:40 PM) Tartarus: Ah yes, need to see if the board replied just t=
o RP or something, when he&#39;s back</div><div>(1:15:41 PM) Tartarus: than=
ks</div><div>(1:15:52 PM) Tartarus: And elections is #4 too</div><div>(1:15=
:54 PM) koen: I think the election stuff is in the boards court now</div>
<div>(1:16:02 PM) RP__: Sorry guys, I had a phone call I needed to take</di=
v><div>(1:16:07 PM) RP__: back now</div><div>(1:16:07 PM) Tartarus: koen: r=
ight</div><div>(1:16:09 PM) fray: I&#39;m not sure what else we can do beyo=
nd the letter to the board</div>
<div>(1:16:15 PM) khem: RP__: NMI ?</div><div>(1:16:26 PM) Tartarus: RP__: =
working backwards, elections stuff? =A0We know the email was sent telling t=
he board what&#39;s what</div><div>(1:17:00 PM) RP__: khem: right :/</div>
<div>(1:17:18 PM) Tartarus: I&#39;d like to propose RP send the board a pin=
g email, since it&#39;s been a week</div><div>(1:17:23 PM) RP__: Tartarus: =
Afaik the board accepted it and the ball is in their court</div><div>(1:17:=
29 PM) ***RP__ agrees</div>
<div>(1:18:08 PM) Tartarus: RP__: so, any new agenda items you want to add?=
</div><div>(1:18:50 PM) ***RP__ is ok with the agenda=A0</div><div>(1:18:55=
 PM) Tartarus: k</div><div>(1:19:07 PM) Tartarus: So, anything more we can =
do for #4? =A0Or other AIs from the last meeting there&#39;s status on?</di=
v>
<div>(1:19:13 PM) Tartarus: I think no for #4 and #3</div><div>(1:20:42 PM)=
 Tartarus: going once...</div><div>(1:20:54 PM) Tartarus: twice</div><div>(=
1:21:14 PM) Tartarus: sold! =A0On to #5, status updates time</div><div>(1:2=
1:41 PM) Tartarus: oe-core, RP?</div>
<div>(1:22:06 PM) RP__: I&#39;m keeping a lower profile than usual as I&#39=
;m trying to sort out various multilib work</div><div>(1:22:23 PM) RP__: Th=
e designs weren&#39;t working and we had a team member leave so I&#39;m try=
ing to resolve that</div>
<div>(1:22:31 PM) Tartarus: OK. =A0Any idea when you&#39;ll poke your head =
out again on multilib and ask for more?</div><div>(1:22:45 PM) RP__: Tartar=
us: ask for more what?</div><div>(1:22:47 PM) Tartarus: (help, comments, te=
sters)</div>
<div>(1:22:54 PM) khem: he already did</div><div>(1:23:07 PM) khem: few day=
s ago</div><div>(1:23:10 PM) Tartarus: Yes, sorry, I mean after a few days =
ago</div><div>(1:23:12 PM) fray: Monday was it?</div><div>(1:23:21 PM) ***k=
hem has not yet read that long email yet</div>
<div>(1:23:21 PM) RP__: Tartarus: I&#39;ve put some questions out for discu=
ssion</div><div>(1:23:28 PM) ***Tartarus does owe reading it over and think=
ing again, silly pays the bills stuff...</div><div>(1:23:40 PM) RP__: I&#39=
;m trying to implement things and discovering issues with the proposal alre=
ady though</div>
<div>(1:23:54 PM) Tartarus: k</div><div>(1:23:55 PM) koen: fray: you need t=
o remember that rpm is &quot;from the future&quot; and deb/ipk is &quot;KIS=
S&quot;</div><div>(1:24:12 PM) Tartarus: I guess, unless you say otherwise =
RP__, lets go with to the ML with multilib stuff</div>
<div>(1:24:21 PM) RP__: ML is fine</div><div>(1:24:28 PM) Tartarus: OK, any=
 other status updates?</div><div>(1:24:34 PM) RP__: I just wanted to highli=
ght I&#39;m distracted atm and Saul is also away for a week</div><div>(1:24=
:35 PM) Tartarus: infra? layers? bsp stuff?</div>
<div>(1:24:40 PM) RP__: please just bear with me :)</div><div>(1:24:48 PM) =
fray: koen, haha</div><div>(1:24:55 PM) khem: I am working on svn based 4.6=
 recipes for gcc</div><div>(1:25:07 PM) fray: I&#39;m ripping my hair out c=
urrently with the directory ownership and user/group/mode collisions..</div=
>
<div>(1:25:17 PM) fray: (luckily I have an excess of hair to pull out)</div=
><div>(1:25:21 PM) Tartarus: ha</div><div>(1:25:44 PM) koen: I have had peo=
ple asking about sample layers/bsps</div><div>(1:25:55 PM) khem: We have co=
nverged the meta-oe gcc recipes to use bbappend if people have not noticed<=
/div>
<div>(1:26:05 PM) Tartarus: i&#39;m starting to figure on local autobuilder=
 and merging stuff from oe.dev to meta-oe/etc</div><div>(1:26:10 PM) koen: =
a lot of people look at meta-intel and go &quot;meh&quot;, so we need a dec=
ent example</div>
<div>(1:26:40 PM) khem: I need meta-intel to build angstrom for my netbook =
havent succeeded yet</div><div>(1:26:47 PM) RP__: koen: why go meh?</div><d=
iv>(1:26:55 PM) RP__: koen: We can fix something if necessary</div><div>
(1:27:14 PM) khem: RP__: fix n450.conf</div><div>(1:27:23 PM) RP__: khem: c=
ool on gcc</div><div>(1:27:28 PM) RP__: khem: fix how?</div><div>(1:27:41 P=
M) khem: does not work with angstrom</div><div>(1:28:16 PM) khem: $ MACHINE=
=3Dn450 bitbake console-image</div>
<div>(1:28:16 PM) khem: ERROR: Unable to parse conf/bitbake.conf: Could not=
 include required file conf/machine/atom-pc.conf</div><div>(1:28:18 PM) Tar=
tarus: khem, I think the answer is &quot;we&quot; need to pull stuff out of=
 poky if needed and into oe-core/etc</div>
<div>(1:28:23 PM) Tartarus: or meta-intel or ...</div><div>(1:28:24 PM) koe=
n: RP__: meta-intel is not how someone would handle a bsp migrating for eit=
her old-oe or something different</div><div>(1:28:36 PM) RP__: khem: ick. I=
&#39;ll ensure that gets fixed asap</div>
<div>(1:28:38 PM) koen: RP__: the biggest &quot;problem&quot; is linux-yoct=
o</div><div>(1:28:49 PM) koen: RP__: and x86 is no good fit for arm in gene=
ral :)</div><div>(1:29:07 PM) RP__: koen: ok, those are two things which ar=
e harder to change</div>
<div>(1:29:10 PM) koen: RP__: the missing atom-pc is what that mailinglist =
thread was about</div><div>(1:29:24 PM) RP__: koen: I know that, I didn&#39=
;t realise it was breaking something in meta-intel though</div><div>(1:29:5=
2 PM) koen: RP__: Tom Z is adding the meta-yocto dep to README, so the prob=
lem is a bit less severe now</div>
<div>(1:29:56 PM) fray: note IMHO missing atom-pc is just the tip of a prob=
lem.. =A0(yes it needs to be fixed, but... the definitional of the machines=
, tunings, architectures, etc are very confusing today)</div><div>(1:30:18 =
PM) RP__: fray: please can we let that one rest for just a little longer? ;=
-)</div>
<div>(1:30:33 PM) fray: thats fine, there are other more pressing issues</d=
iv><div>(1:30:35 PM) Tartarus: nmi from the baby, bbi2</div><div>(1:30:39 P=
M) khem: fray: all common arch tune files belong to oe-core I would say</di=
v>
<div>(1:30:54 PM) RP__: khem: That isn&#39;t what fray is referring to</div=
><div>(1:31:01 PM) fray: khem, thats fine.. but that is something else</div=
><div>(1:31:16 PM) RP__: khem: currently we merge architecture, ABI and tun=
ing information together</div>
<div>(1:31:25 PM) khem: yes</div><div>(1:31:26 PM) fray: read my email on t=
he mailing list if you have questions..</div><div>(1:31:31 PM) koen: I thin=
k fra wants to take a step back and make all the tune files look the same</=
div>
<div>(1:31:45 PM) RP__: koen: split the tune files up more</div><div>(1:31:=
45 PM) koen: and seperate tuning from ABI</div><div>(1:31:57 PM) fray: koen=
, partially.. some of it is splitting them up more.. and some of it is simp=
ly making them consistent</div>
<div>(1:32:13 PM) khem: yeah we need machine.conf arch.conf abi.conf</div><=
div>(1:32:23 PM) RP__: I&#39;m not against any of this but I would like to =
have some kind of multilib test framework alongside it</div><div>(1:32:38 P=
M) Tartarus: ok, she&#39;s down for a nap, back</div>
<div>(1:32:47 PM) khem: Tartarus: thats was quick</div><div>(1:33:00 PM) RP=
__: and given the currently development situation, I think having some kind=
 of multilib code first might be helpful</div><div>(1:33:11 PM) khem: Tarta=
rus: dont make too much noise typing now :)</div>
<div>(1:33:15 PM) Tartarus: khem: I didn&#39;t say she&#39;s asleep ;) =A0S=
he is however, in her crib and will fall asleep soon</div><div>(1:33:29 PM)=
 RP__: (I don&#39;t want to redesign tune, then find it doesn&#39;t work fo=
r multilib and have to redesign again)</div>
<div>(1:33:43 PM) Tartarus: RP__: makes sense</div><div>(1:33:57 PM) fray: =
RP__, my fear is what is there today won&#39;t work with multilibs -- or wi=
ll introduce significant extra work</div><div>(1:34:01 PM) khem: yes multil=
ib is part of this puzzle definitely</div>
<div>(1:34:09 PM) RP__: fray: I don&#39;t worry about this ;-)</div><div>(1=
:34:29 PM) RP__: fray: Worst case I write some very specific multilib confi=
gs, then we generalise them later</div><div>(1:34:42 PM) RP__: We have much=
 bigger issues around atm :(</div>
<div>(1:35:01 PM) RP__: e.g. there is no sane way we can have : in PN</div>=
<div>(1:35:07 PM) fray: ya.. the permissions file &amp; directory really wo=
rries me as someone focused on userspace..</div><div>(1:35:20 PM) fray: I c=
an&#39;t actually show today that from one build to the next we&#39;ll get =
the same FS</div>
<div>(1:35:46 PM) RP__: fray: :/</div><div>(1:35:59 PM) koen: fray: the sst=
ate repackaging changes shlibs deps from time to time as well</div><div>(1:=
36:01 PM) RP__: fray: You&#39;re making progress and have a solution in min=
d though?</div>
<div>(1:36:17 PM) RP__: koen: ?</div><div>(1:36:20 PM) koen: e.g.=A0<a href=
=3D"http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=
=3Dyocto&amp;id=3Dac74418adb163a2b5120a9220ac8668860a09fc3" target=3D"_blan=
k" style=3D"color: rgb(0, 0, 204); ">http://git.angstrom-distribution.org/c=
gi-bin/cgit.cgi/testlab/commit/?h=3Dyocto&amp;id=3Dac74418adb163a2b5120a922=
0ac8668860a09fc3</a></div>
<div>(1:36:22 PM) fray: yes, I am making progress.. solution will be a mix =
of distro configuration, detecting the issue, and fixing recipes</div><div>=
(1:36:58 PM) khem: fray: only sane way to do that is if we can schedule the=
 build in same sequence everytime</div>
<div>(1:37:07 PM) khem: otherwise nullify autoconf</div><div>(1:37:21 PM) k=
hem: by providing cached output</div><div>(1:37:24 PM) fray: khem, the buil=
d ORDER is similar (the same within reason) due to the build-time deps..</d=
iv>
<div>(1:37:38 PM) RP__: khem: I don&#39;t understand that...</div><div>(1:3=
7:38 PM) khem: fray: even that may not be enough</div><div>(1:37:40 PM) fra=
y: the problem is at install time, whatever creates a directory &quot;first=
&quot; sets the permissions for the directory.. (same for files)</div>
<div>(1:37:42 PM) khem: depends whats staged</div><div>(1:37:57 PM) fray: t=
his is a bug in nearly all of the recipes today..</div><div>(1:37:59 PM) kh=
em: ups we are talking about different things nm</div><div>(1:38:17 PM) RP_=
_: fray: A hack for now might be to add a do_install postfunc which fixes u=
p the owners/permissions</div>
<div>(1:38:22 PM) fray: good example is a lot of things in my build are cre=
ating &quot;/usr/lib&quot; as 0775.. when it should be 0755.. :P</div><div>=
(1:38:35 PM) fray: RP__ I&#39;m working on cleaning things in the package.b=
bclass</div>
<div>(1:39:06 PM) khem: fray: so we can keep updating one&#39;s to umask ma=
y be</div><div>(1:39:16 PM) RP__: koen: thats rather worrying :/</div><div>=
(1:39:24 PM) fray: heh.. =A0unfortunately thats not enough.. but will likel=
y help some..</div>
<div>(1:41:02 PM) Tartarus: OK, any more commentary here before we pick up =
the new topics?</div><div>(1:41:09 PM) fray: nothing for me</div><div>(1:41=
:29 PM) koen: RP__: it&#39;s hard to reproduce, so I suspect some race issu=
e with sstate and the shlib code</div>
<div>(1:42:33 PM) RP__: koen: If you can produce a testcase...</div><div>(1=
:42:42 PM) RP__: Tartarus: nothing from me</div><div>(1:42:46 PM) koen: RP_=
_: I&#39;ve been trying to</div><div>(1:42:50 PM) koen: Tartarus: no, let&#=
39;s move on</div>
<div>(1:42:53 PM) Tartarus: OK, so moving on</div><div>(1:42:56 PM) Tartaru=
s: oe-core and mirrors</div><div>(1:43:00 PM) Tartarus: Been a little talk<=
/div><div>(1:43:20 PM) Tartarus: I didn&#39;t see anything after my suggest=
ion of a last resort for oe-core and making sure it&#39;s easily configurab=
le for distros to provide whatever they feel is best</div>
<div>(1:43:34 PM) Tartarus: (eg poky and angstrom making sure stuff is neve=
r missed, if they want)</div><div>(1:43:36 PM) fray: with the mirror.. One =
additional comment beyond what I sent to the list -- should we have PREMIRR=
ORS? =A0I&#39;m thinking no.. since we want to go to the upstream.. if that=
 fails, THEN fall back to the MIRROR</div>
<div>(1:44:00 PM) Tartarus: In general or?</div><div>(1:44:02 PM) fray: I d=
on&#39;t have any issues with yocto, angstrom, or anything else being the d=
efault fall-back..</div><div>(1:44:05 PM) fray: for oe-core</div><div>(1:44=
:10 PM) RP__: Tartarus: You&#39;re not clear, you&#39;re saying just to def=
ault to what?</div>
<div>(1:44:23 PM) ***RP__ probably isn&#39;t 100% up to date on the email t=
hread :/</div><div>(1:44:37 PM) Tartarus: RP__: I&#39;m saying oe-core shou=
ld have no PREMIRRORS and a MIRRORS that&#39;s only got no longer upstream =
stuff</div>
<div>(1:44:44 PM) Tartarus: so it&#39;s a last resort</div><div>(1:44:51 PM=
) fray: Tartarus that should be a bare minimum...</div><div>(1:44:58 PM) RP=
__: Tartarus: Who maintains the no longer upstream stuff mirror?</div><div>
(1:44:59 PM) Tartarus: But let poky and angstrom and anyone else fill in wi=
th whatever mirror they want</div><div>(1:45:07 PM) fray: but wouldn&#39;t =
cover the case where something &quot;goes away&quot;.. i.e. who adds it to =
the mirrors</div>
<div>(1:45:09 PM) RP__: We do that today...</div><div>(1:45:11 PM) Tartarus=
: RP__: Whomever does that today, assuming they want to continue</div><div>=
(1:45:12 PM) khem: fray: yeah no premirrors</div><div>(1:45:30 PM) Tartarus=
: fray: The mirror shouldn&#39;t be added to easily/often, it&#39;s a last =
resort</div>
<div>(1:45:33 PM) RP__: The question is whether OE-Core should benefit from=
 work done by yocto/angstrom</div><div>(1:45:36 PM) Tartarus: eg tinylogin =
is just not anywhere anymore? =A0OK, add it</div><div>(1:45:43 PM) Tartarus=
: tzdata changed again? Time for a new recipe</div>
<div>(1:45:56 PM) khem: RP__:=A0<a href=3D"http://sources.oe.org/" target=
=3D"_blank" style=3D"color: rgb(0, 0, 204); ">sources.oe.org</a>=A0is maint=
ained by me and Tom K</div><div>(1:46:09 PM) fray: my concern is that if we=
 rely (in oe-core) on the mirrors too heavily, then missing upstreams will =
be &quot;missed&quot;...</div>
<div>(1:46:12 PM) Tartarus: RP__: I think the answer is that a has everythi=
ng mirror ISN&#39;T a benefit for oe-core</div><div>(1:46:17 PM) Tartarus: =
It IS for angstrom, poky, etc</div><div>(1:46:22 PM) Tartarus: But oe-core =
we want to know when stuff moves</div>
<div>(1:46:47 PM) khem: yes thats my understanding too</div><div>(1:46:48 P=
M) Tartarus: Since that means a recipe needs work or something really did g=
o away</div><div>(1:46:50 PM) RP__: Tartarus: I think we&#39;re just advers=
ely affecting users if we do that</div>
<div>(1:46:52 PM) fray: I&#39;m not against &quot;meta-oe&quot; having prem=
irrors, or point to full mirrors.. =A0since I consider that the &quot;distr=
ibution&quot;</div><div>(1:47:02 PM) Tartarus: RP__: what users? =A0oe-core=
 only users?</div>
<div>(1:47:09 PM) RP__: Tartarus: yes</div><div>(1:47:18 PM) Tartarus: We e=
xpect a certain amount of depth on people not relying on any distro</div><d=
iv>(1:47:35 PM) Tartarus: I&#39;d expect every distro to have or point at a=
 real mirror</div>
<div>(1:47:44 PM) khem: anybody who uses oe-core needs to have a distro his=
own or some predefined</div><div>(1:47:51 PM) fray: thats my thought.. oe-c=
ore is &quot;not a distro&quot;.. meta-oe, poky, angstrom, et al are</div>
<div>(1:47:55 PM) khem: so mirror becomes distro thing then</div><div>(1:48=
:07 PM) koen: meta-oe is not a distro</div><div>(1:48:13 PM) koen: it won&#=
39;t have any policy</div><div>(1:48:18 PM) ***khem nods</div><div>(1:48:21=
 PM) RP__: This means that releases of OE-Core will degrade badly with time=
</div>
<div>(1:48:26 PM) Tartarus: RP__: why?</div><div>(1:48:47 PM) RP__: Tartaru=
s: As things get deleted upstream, it relies on someone adding them to the =
minimal mirror</div><div>(1:48:53 PM) fray: I would expect an update to oe-=
core, or a (supported) tag if something goes missing upstream</div>
<div>(1:48:58 PM) Tartarus: No, it relies on people using the distro for th=
at release</div><div>(1:49:00 PM) fray: =A0-- or to the minimal mirror</div=
><div>(1:49:05 PM) Tartarus: again, jsut a release of oe-core won&#39;t be =
of much use</div>
<div>(1:49:19 PM) RP__: Tartarus: so the OE-Core release standalone degrade=
s badly over time</div><div>(1:49:19 PM) Tartarus: without a release of ang=
strom and meta-oe and so on or poky based on it or ...</div><div>(1:49:45 P=
M) Tartarus: RP__: Yes, and I don&#39;t think that&#39;s a problem. =A0Anyo=
ne using oe-core by itself is expected to have depth</div>
<div>(1:49:53 PM) Tartarus: and probably is doing their own custom distro, =
with their own mirror</div><div>(1:50:00 PM) RP__: Well, I think its a bad =
move for usability</div><div>(1:50:09 PM) RP__: but I appear to be outvoted=
</div>
<div>(1:50:17 PM) Tartarus: We can revisit</div><div>(1:50:32 PM) Tartarus:=
 But as an anecdote, no one&#39;s come screaming at me saying we expect a m=
irror for 2011.03-maint</div><div>(1:50:46 PM) RP__: It means our messages =
is &quot;you can&#39;t use OE-Core unless you&#39;re an expect, pick a dist=
ro instead&quot;</div>
<div>(1:50:46 PM) Tartarus: Since it&#39;s only supported on a defined set =
of combos</div><div>(1:51:07 PM) Tartarus: RP__: yes! =A0That&#39;s what we=
&#39;ve all been driving at I thought</div><div>(1:51:13 PM) Tartarus: You =
don&#39;t use oe-core by itself without another layer</div>
<div>(1:51:16 PM) fray: Thats where I thought we&#39;d been driving as well=
</div><div>(1:51:26 PM) Tartarus: You use it + a distro layer + a BSP layer=
 + ...</div><div>(1:51:27 PM) ***koen too</div><div>(1:51:31 PM) RP__: Tart=
arus: if that is the case why keep asking me to ensure it works? ;-)</div>
<div>(1:51:46 PM) khem: RP__: I would think adding some fall back mirrors i=
s not a bad choice if we get notification about things coming from mirror i=
nstead of upstream</div><div>(1:51:47 PM) koen: oe-core can validate itself=
, but to actually be usefull you need extra layers</div>
<div>(1:51:52 PM) Tartarus: RP__: touche. =A0We also said that it would wor=
k at the time at least sans distro, for validation</div><div>(1:51:53 PM) k=
hem: that will address fray&#39;s concern</div><div>(1:52:29 PM) ***fray no=
tes he&#39;s using oe-core for the development when we submits patches to o=
e-core..</div>
<div>(1:52:44 PM) fray: but I expect I&#39;ll need Poky/Yocto if I&#39;m wo=
rking on a distro or BSP</div><div>(1:52:45 PM) RP__: I just think having s=
omething with broken defaults is nuts. We have specific checks to check SRC=
_URI valitidy</div>
<div>(1:53:45 PM) Tartarus: Like I said, we can revisit this</div><div>(1:5=
3:51 PM) Tartarus: And maybe for a maint branch we would add some mirror</d=
iv><div>(1:53:53 PM) khem: ok</div><div>(1:54:01 PM) Tartarus: But for acti=
ve development, we want failures so we know there&#39;s a problem</div>
<div>(1:54:07 PM) ***khem see&#39;s RP__ &#39;s point too</div><div>(1:54:1=
6 PM) fray: we need to watch error reports and comments.. if people start c=
omplaining, we should reevaluate</div><div>(1:54:26 PM) RP__: Tartarus: you=
 said we were revisiting and no further discussion. Make your mind up pleas=
e</div>
<div>(1:54:49 PM) Tartarus: RP__: sorry, I mean when we have a release we c=
an revisit if it&#39;s appropriate there</div><div>(1:55:03 PM) khem: 5 min=
s left</div><div>(1:55:05 PM) Tartarus: I don&#39;t think it is, but i can =
see a better argument there then now</div>
<div>(1:55:08 PM) Tartarus: khem: eek, thanks</div><div>(1:55:25 PM) RP__: =
We have people complaining now :(</div><div>(1:55:52 PM) Tartarus: Moving o=
n while we have a few min</div><div>(1:56:02 PM) Tartarus: khem brought up =
the topic of people doing dev in oe.dev rather than oe-core</div>
<div>(1:56:07 PM) Tartarus: What do we want to do about that?</div><div>(1:=
56:21 PM) Tartarus: Make a recommendation that folks do both? =A0Just a gen=
eral reminder that oe.dev will be winding down?</div><div>(1:56:23 PM) Tart=
arus: something else?</div>
<div>(1:56:26 PM) khem: actually there are new devs posting new recipes or =
updates</div><div>(1:56:37 PM) RP__: We should be trying to ensure feature =
parity between oe-dev and oe-core at a minimum</div><div>(1:56:46 PM) fray:=
 I expect it will continue, I&#39;m just worried that when we freeze oe.dev=
 these people are going to be &quot;upset&quot;</div>
<div>(1:56:52 PM) khem: so I would prefer that development to channel into =
new layering setup somehow</div><div>(1:57:07 PM) RP__: I think we need to =
put some emails out highlighting the siutation</div><div>(1:57:11 PM) fray:=
 for the oe-core functionality I think thats reasonable.. for the others, i=
s meta-oe at a point we should be trying to get people to push stuff there?=
</div>
<div>(1:57:59 PM) khem: may be a new layer</div><div>(1:58:08 PM) khem: to =
keep collecting updates</div><div>(1:58:24 PM) koen: looking at the size of=
 my bblayers.conf I&#39;d say &quot;put stuff in meta-oe&quot;</div><div>
(1:58:31 PM) khem: heh</div><div>(1:58:39 PM) khem: ok</div><div>(1:58:45 P=
M) RP__: I think this is what meta-oe was intended for</div><div>(1:58:49 P=
M) khem: Thats true</div><div>(1:59:02 PM) khem: OK I will send out an emai=
l</div>
<div>(1:59:25 PM) Tartarus: Sounds good</div><div>(1:59:28 PM) khem: for as=
king oe.dev committers to also post pull requests to meta-oe</div><div>(1:5=
9:53 PM) RP__: khem: thanks!</div><div>(1:59:59 PM) Tartarus: OK, lets call=
 that one done</div>
<div>(2:00:04 PM) Tartarus: Everyone got 5 more min?</div><div>(2:00:07 PM)=
 khem: oki doki</div><div>(2:00:10 PM) ***koen does</div><div>(2:00:17 PM) =
***Tartarus does</div><div>(2:00:22 PM) ***RP__ too</div><div>(2:00:23 PM) =
khem: me too</div>
<div>(2:00:24 PM) Tartarus: OK</div><div>(2:00:27 PM) Tartarus: So, last to=
pic</div><div>(2:00:32 PM) Tartarus: 2011.03-maint, long term plans</div><d=
iv>(2:00:37 PM) Tartarus: koen, you brought this up, shoot</div><div>(2:01:=
02 PM) Tartarus: (Jefro and promoting devs to be / use the oe-users ML more=
 for next week pls)</div>
<div>(2:01:05 PM) khem: we need to define long term may be quantitatively</=
div><div>(2:01:23 PM) koen: if we close .dev, we need a different strategy =
for the maintenance branch</div><div>(2:01:31 PM) ***Jefro noted</div><div>
(2:01:36 PM) koen: e.g. &quot;commits need to be in oe-core/meta-oe&quot;</=
div><div>(2:01:54 PM) Tartarus: koen: yes, a change of from oe.dev master t=
o oe-core/meta-oe/relevant layer&quot; is fine with me</div><div>(2:01:56 P=
M) khem: koen: yes I guess if its a common recipe in meta-oe or core</div>
<div>(2:01:58 PM) Tartarus: Anything more than that?</div><div>(2:02:06 PM)=
 koen: not from me</div><div>(2:02:12 PM) Tartarus: OK, that&#39;s easy eno=
ugh</div><div>(2:02:21 PM) Tartarus: I&#39;ll update the policy now to make=
 that an alternative</div>
<div>(2:02:27 PM) Tartarus: to encourage folks to be pushing to the new pla=
ce</div><div>(2:02:35 PM) khem: Tartarus: yes sooner this starts better it =
is</div><div>(2:02:38 PM) Tartarus: And not backport from there to oe.maste=
r for 2011.03 maint</div>
<div>(2:02:43 PM) khem: it can start even now</div><div>(2:02:47 PM) ***Tar=
tarus takes the AI, will do it todayish</div><div>(2:02:54 PM) Tartarus: Wi=
th that then, lets call the meeting closed</div><div>(2:02:57 PM) Tartarus:=
 Thanks all</div>
</span><br>-- <br>Jeff Osier-Mixon <a href=3D"http://jefro.net/blog" target=
=3D"_blank">http://jefro.net/blog</a><div>Yocto Project Community Manager @=
Intel <a href=3D"http://yoctoproject.org" target=3D"_blank">http://yoctopro=
ject.org</a></div>
<br>

--90e6ba6e815ed2829804a62b0297--
