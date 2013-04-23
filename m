Received: from mail-lb0-f169.google.com ([209.85.217.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1UUlLG-0005TT-Cj; Wed, 24 Apr 2013 00:06:28 +0200
Received: by mail-lb0-f169.google.com with SMTP id p11so1127712lbi.0
	for <multiple recipients>; Tue, 23 Apr 2013 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=stjzsQgnOwNkzyazFaWI0SuNWuTWW5NlZh+RyH/2GF4=;
	b=ZOkOxQF7wK5lxtuq9+RPJtl0dr2pJs/Z6pYIE1leqn0X00LeOxofyw7Y4tfDKBmo1z
	cw0k/0a0kfXLxZnHnqSD0gElcMgZV/dNOJInuQucabQ/9ZU1gMMHBJyNCNT/mJRZMZui
	30BR5Pwii+Wd/c4fHd3kE8jDxi3GGTR2y0RLGQDPn5q7di70frYJV72NND1+iR9bKL4m
	M3y/8bD7Q6h4/Md2hEA28ipcQL5LRGHKyZNPAzz9qkIYLn+AE1+QpFDFKGVFECKe/0wX
	nQ8ZsPGGmqAmQSDKhBdbub8igsDRt0nfFeAgNqS70oF2kr8ByIcMYFeMzwKsSLpiFGjb
	ZaCQ==
MIME-Version: 1.0
X-Received: by 10.112.141.38 with SMTP id rl6mr15597234lbb.101.1366753677011; 
	Tue, 23 Apr 2013 14:47:57 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.112.22.66 with HTTP; Tue, 23 Apr 2013 14:47:56 -0700 (PDT)
Date: Tue, 23 Apr 2013 14:47:56 -0700
X-Google-Sender-Auth: -YXeL1Y6LDTNZGveUKgr3D7U9tY
Message-ID: <CA+YB3rb6xwk2-rsSa=dQx19qp7jKAVBZiMmQB5DvrGOmLUFG2Q@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OpenEmbedded TSC 8 April 2013
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
X-List-Received-Date: Tue, 23 Apr 2013 22:06:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
8 April 2013

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
4. projects in progress - status
5. projects deferred

________________________________________________________________
Agenda & Results

1. pick a chair
RP
___________________________________
2. new issues

a. discussion on the next release
eg gcc 4.8 etc after 1.4 (khem has patchset)
bluez5, gst 1.x

___________________________________
3. lingering issues

a. SMART has replaced zypper (was documenting RPM and package feeds)
Paul wrote https://wiki.yoctoproject.org/wiki/Smart_Repository_Setup
=> khem has gotten it to work, will update the docs
=> Paul to talk to scottrif about adding to docs
NOW IN THE MANUAL, OK TO DROP

b. oe-classic recipe migration status
RP played with perl modules, fixed up cpan_build.bbclass
=> still needs to send some patches
> still need to sort out, been distracted with release

c. systemd merge unhappiness
"people feel ignored and then being told they should have spoken up"
some concern about favoritism for patches
=> maintain a wiki page to summarize release goals (jefro)
> things pretty clear on mailing list
> no status emails yet but plan to (RP)
> need to ensure sysvinit/systemd fully doc'd, ross/scott taking care of that

d. oe.org flooded
refs to oe.org git should point to github
=> jefro to follow up with scottrif DONE
=> khem to fix the oe wiki and reminder to ml
possible to move server at some point?
=> jefro to investigate YP hosting, kernel.org mirror
> some complaints about lagging behind, but is up to date within 15 minutes
> could have been a hiccup during infrastructure issues last week

___________________________________
4. projects in progress - status

a. oe-core release
autobuilder issues
qemuimagetest will change significantly in 1.5
ptest a good addition
much more to integrate in 1.5

b. infrastructure
see 4d

c. systemd into master - still in progress

d. mailing list outage
mailing list moving to OSUOSL or YP
list addresses will not change
work in progress

e. meta-oe appends/overlayed recipes RFC
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043925.html
no avr32 support in public layers
=> paul has patches to remove bbappends, pending discussion on ml
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043964.html
everything uncontested has been sent for review
qt4/qt tools stuff troublesome

f. 1.5 planning
RP supports PACKAGECONFIG proposal

___________________________________
5. projects deferred

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

(9:00:32 AM) mode (+v Jefro) by ChanServ
(9:00:47 AM) Jefro: Khem is stuck in traffic, will be 15-20 mins late
(9:00:59 AM) Jefro: I'm finishing up the agenda, 1-2 mins
(9:01:17 AM) ***RP_ is here
(9:01:26 AM) ***bluelightning is here
(9:01:34 AM) fray: here
(9:06:12 AM) Jefro: good morning - so just missing koen and khem
(9:06:24 AM) Jefro: khem will be here in 10-15 mins
(9:06:24 AM) koen: 17:46 < koen> I have a conflict at 6, I'll be
attending the meeting sporadically, my apologies
(9:06:27 AM) RP_: Jefro: "(16:47:01) koen: I have a conflict at 6,
I'll be attending the meeting sporadically, my apologies"
(9:06:36 AM) Jefro: ah, got it thanks
(9:06:38 AM) ***koen just walked into the office again
(9:06:42 AM) Jefro: agenda here:  http://pastebin.com/mBhCDqR2
(9:06:57 AM) RP_: I actually cancelled other stuff so I could attend
this meeting
(9:07:48 AM) fray: UK is on day light savings now?
(9:08:01 AM) RP_: fray: yes
(9:08:01 AM) bluelightning: yes
(9:08:24 AM) fray: I assume central europe is as well then.. so we're
all back to the same relative time zones at least
(9:08:37 AM) RP_: fray: yes, it helps
(9:08:59 AM) RP_: So, should I chair for a change?
(9:09:08 AM) RP_: I think its probably my turn
(9:09:11 AM) ***fray is fine with that
(9:09:16 AM) bluelightning: me too
(9:09:35 AM) RP_: I assume we get started and khem can catch up when he joins
(9:09:42 AM) RP_: Any additions to the agenda
(9:09:44 AM) RP_: ?
(9:09:55 AM) fray: One thing, discussion on "the next release"..
(9:10:16 AM) fray: if any.. I'm more thinking about plans like gcc 4.8
and stuff like that after the upcoming release..
(9:10:38 AM) bluelightning: fray: I guess you saw khem already has a
patchset for that
(9:10:39 AM) koen: fray: like bluez5 and gst 1.x?
(9:10:40 AM) fray: (and BTW I'm happy if we say there isn't anything
to talk about yet)  :)
(9:10:44 AM) RP_: ok
(9:10:52 AM) fray: bluelightning yup.. :)
(9:11:01 AM) fray: koen, ya exactly..
(9:11:07 AM) RP_: So, updates on section 3
(9:11:12 AM) RP_: Anything on 3a?
(9:11:28 AM) bluelightning: yep, it's now in the manual
(9:11:37 AM) fray: cool, we can drop the item?
(9:11:41 AM) RP_: bluelightning: great! :)
(9:11:49 AM) bluelightning: some extensions needed so we fully cover
what to do with ipk but the material info is there
(9:11:51 AM) RP_: bluelightning: can we consider that closed now?
(9:11:56 AM) bluelightning: yep I think so
(9:12:05 AM) RP_: great! :)
(9:12:08 AM) RP_: I still need to sort out 3b, been distracted with the release
(9:12:27 AM) RP_: which brings us to systemd
(9:12:38 AM) RP_: I think things there are pretty clear on the mailing list
(9:12:52 AM) RP_: I've not managed the status emails we've talked
about yet but still plan to
(9:13:17 AM) RP_: Anything anyone wants to add?
(9:13:26 AM) Jefro: my action item is not yet done
(9:14:19 AM) bluelightning: RP_: we need to ensure the
sysvinit/systemd stuff is fully documented and I think Ross and Scott
are taking care of that
(9:14:23 AM) RP_: We did see some favouritism comments in irc however
when looked into, most of the patches which were supposedly being
ignored had in fact been merged
(9:15:01 AM) RP_: We don't send out the "merged" replies now which
perhaps doesn't help perception
(9:15:42 AM) RP_: For 3d, any update?
(9:15:59 AM) Jefro: I did follow up with scottrif
(9:16:10 AM) RP_: bluelightning: yes, agreed. I know I've sent some
fixes to Scott about the systemd docs too
(9:16:31 AM) RP_: (I passed on some reports on irc to be clear)
(9:16:56 AM) bluelightning: someone claimed that github was lagging
behind at one point
(9:17:05 AM) bluelightning: I did not follow up on the claim but it
concerned me at the time...
(9:17:23 AM) RP_: bluelightning: :/
(9:18:15 AM) RP_: bluelightning: I guess we should check it has caught up...
(9:18:57 AM) bluelightning: OE-Core is up-to-date at this moment at least
(9:19:13 AM) RP_: bluelightning: ok, that is good at least...
(9:19:14 AM) fray: I saw that (github) a few weeks ago.. and it caught
up pretty quickly.. and it was up to date within 15 minutes..
(9:19:20 AM) bluelightning: could have been a hiccup during the
infrastructure issues we had about a week ago
(9:19:24 AM) RP_: Moving to 4a, OE-Core release status
(9:19:24 AM) fray: since then, I havn't noticed the lag.. so I think
it was a hickup
(9:19:54 AM) RP_: We've had serious issues with the new autobuilder
infrastructure highlighting existing race issues and qemu bugs
(9:20:12 AM) RP_: I'm hoping today that we nailed down the last one of
those but its been causing me some serious stress :/
(9:20:42 AM) bluelightning: we're probably one of the few using that
code I suspect
(9:20:54 AM) bluelightning: FWIW, it's not documented other than
what's in local.conf.sample
(9:21:04 AM) bluelightning: (qemuimagetest I mean)
(9:21:13 AM) RP_: There are a number of other issues out there, some
kernel issues with routerstationpro, udev and multilib issues, there
have also been a number of fixes going into master for things like
CVEs
(9:21:29 AM) RP_: and the postinst issues of where there have been several
(9:21:57 AM) RP_: bluelightning: qemuimagetest isn't going to be worth
documenting in its current form now as it will change in 1.5 quite
massively
(9:22:07 AM) bluelightning: RP_: ok
(9:22:09 AM) RP_: bluelightning: and yes, we're clearly the main
people using it.
(9:22:12 AM) khem
[~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net] entered the
room.
(9:22:13 AM) mode (+v khem) by ChanServ
(9:22:18 AM) fray: hey
(9:22:19 AM) khem: hrmpp
(9:22:22 AM) khem: I am here
(9:22:28 AM) RP_: That code does help us a lot with our testing and is
extremely important
(9:22:30 AM) bluelightning: khem: we are on 4a OE-Core release status
(9:22:31 AM) RP_: hi khem
(9:22:38 AM) RP_: khem: agenda: http://pastebin.com/mBhCDqR2
(9:22:44 AM) RP_: khem: We're talking about 4a
(9:22:51 AM) fray: ya.. it helps keep the quality level up.. and is
something we need to keep using, even if the project itself is the
only user
(9:23:01 AM) fray: (even though it apparently isn't foolproof)  :(
(9:23:09 AM) RP_: fray: Plans in 1.5 are to integrate a lot more into it
(9:23:22 AM) bluelightning: it's crucial, and we need to be doing even
more runtime testing
(9:23:23 AM) RP_: fray: automate a lot more of the manual QA into
there and add -ptest support etc
(9:23:37 AM) khem: ok
(9:23:38 AM) RP_: but for 1.4, I'm hoping we have this stablised for now
(9:23:51 AM) fray: my concern when it comes to qemu and integration is
handling architectures that QEMU doesn't support (or processor
optimizations).. but as long as the fall back continues..  I do like
that qemu helps us with testing, etc..
(9:23:51 AM) RP_: We're also having to backport the fixes for it to 1.3.x
(9:23:57 AM) fray: the ptest stuff is really a nice addition as well
(9:24:14 AM) RP_: fray: the fallback is how we'd handle that, yes
(9:24:23 AM) khem: w.r.t. ptest is there some document on it
(9:24:28 AM) fray: RP_, ya so from a technical direction, I think
we're doing the right things..
(9:24:38 AM) khem: like what differnet packages are currently ptestifies
(9:24:42 AM) bluelightning: khem: no, but I have pinged Bjorn about that today
(9:24:47 AM) khem: and what can one do to add more
(9:24:51 AM) fray: (might even spur some BSP writings to improve QEMU
for their specific processors)
(9:24:57 AM) bluelightning: khem: I suggested he talk to Scott about
getting that in
(9:24:57 AM) RP_: so, 1.4 is in its final stages, I was extremely
nervous about it, I'm less nervous today but still not entirely
comfortable
(9:25:37 AM) RP_: khem: at this point I think those things will have
to be a specific objective of 1.5
(9:25:39 AM) fray: RP_, if it makes you feel any better.. the work
I've been doing on master has shown that it's way better then 1.2 and
1.3 were (in hindsight)..
(9:26:04 AM) RP_: fray: that is good, I'd hate the opposite to be true! :)
(9:26:20 AM) RP_: Any concerns/questions with 1.4?
(9:26:34 AM) khem: RP_: yes thats more of doc/wiki issue so not as
much important for release
(9:26:59 AM) RP_: khem: there is a chance we may still be able to sort
that for the release, we'll see
(9:27:13 AM) RP_: khem: I want to turn the eglibc/gcc tests into ptest btw :)
(9:27:41 AM) khem: RP_: yes thats what I was leaning towards
(9:27:43 AM) RP_: khem:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4216 may make
interesting reading for you btw - that sanity issue I mentioned
(9:28:24 AM) RP_: khem: any update on 4b? (mailing list migration) ?
(9:28:43 AM) RP_: 4c I think progress is clear on the mailing list, it
will be in 1.4
(9:29:01 AM) khem: RP_: thats cool fix
(9:29:02 AM) RP_: Jefro: 4b and 4d are the same?
(9:29:04 AM) bluelightning: we desperately need to move forward on
that, mailing lists broke again last week (at least the web archive
did)
(9:29:22 AM) Jefro: 4b is a  placeholder, 4d has matured into its own project
(9:29:23 AM) fray: bluelightning did it ever get fixed (web archives)?
(9:29:27 AM) khem: RP_: I have been looking at qemu commits on master
for some hints but could not spend lot of time
(9:29:33 AM) bluelightning: fray: yes they are working now
(9:29:36 AM) fray: good
(9:29:37 AM) Jefro: I have a small update on 4d - Tom is working with
Florian and choosing between moving to OSUOSL or YP
(9:29:57 AM) Jefro: so it is in progress
(9:29:57 AM) bluelightning: Jefro: great!
(9:30:04 AM) RP_: Jefro: If we were to go the YP route, Michael would
be able to help FWIW
(9:30:05 AM) fray: excellent
(9:30:42 AM) RP_: Michael is invaluable, keeps all the infrastructure going
(9:30:55 AM) Jefro: I agree, although I think Tom is choosing OSUOSL -
I haven't talked to him in detail about why that is, but he knows YP
is an option
(9:31:20 AM) RP_: We've been an AB down due to memory issues recently
and the recent power upgrade was a small outage but in general we do
really well with uptime
(9:31:41 AM) khem: Jefro: Tom King ?
(9:31:54 AM) RP_: Jefro: I just hope we're not swapping one set of
problems for another, it worries me when things take a while :/
(9:32:00 AM) khem: Jefro: I will talk to him, I think yp will support
it lot better than osuosl
(9:32:20 AM) khem: not thst osuosl is bad
(9:32:38 AM) khem: I have experience handling uclibc stuff
(9:32:43 AM) khem: with osuosl
(9:33:24 AM) RP_: khem: I guess some of us appear biased so please do
talk to him :)
(9:34:04 AM) RP_: The YP is big enough now that the LF wouldn't let it
just disappear overnight
(9:34:07 AM) khem: RP_: I wil
(9:34:23 AM) khem: even if it did we can find alternatives
(9:34:37 AM) khem: and we can defer it to when it happens
(9:34:45 AM) RP_: khem: right, exactly
(9:35:04 AM) RP_: bluelightning: any update on 4e?
(9:35:13 AM) khem: I think we can benefit from Michael's promptness
(9:35:44 AM) bluelightning: RP_: I sent out the patchset, I have to
send a v2 preserving the bbappends with only PRINC settings left in
(9:35:59 AM) bluelightning: which I am not particularly happy about,
but I can accept it for the moment
(9:36:13 AM) RP_: bluelightning: sounds like progress is being made
(9:36:18 AM) bluelightning: yes
(9:36:28 AM) bluelightning: we still have a bbappend for busybox that
I don't fully understand
(9:36:36 AM) RP_: bluelightning: I'd hope they can removed entirely
with some PR bumps eventually
(9:36:48 AM) fray: bluelightning is it configuration specific or something else?
(9:37:07 AM) bluelightning: RP_: that was NACKed because "we can't
guarantee which version of OE-Core is being used with meta-oe master"
(9:37:33 AM) bluelightning: when PV is bumped we can definitely drop them though
(9:37:34 AM) RP_: bluelightning: :(
(9:37:51 AM) RP_: bluelightning: right, so we have a plan to kill them off :)
(9:37:51 AM) fray: Hmm..  meta-oe moving forward will eventually need
the master or "last release"?
(9:37:55 AM) bluelightning: RP_: right
(9:38:18 AM) khem: bluelightning: that syslog thing for busybox is for
systemd to let it use
(9:38:21 AM) RP_: I'll insert 4f, 1.5 planning
(9:38:24 AM) RP_: fray: ?
(9:38:27 AM) bluelightning: it's also worth noting there was a
follow-up discussion about how to handle optional dependencies from
stuff in OE-Core on other things that aren't
(9:38:38 AM) bluelightning: khem: so we probably need it in OE-Core right?
(9:38:42 AM) khem: otherwise it segfaults
(9:38:47 AM) bluelightning: ???!!!
(9:38:49 AM) khem: I guess so
(9:38:49 AM) fray: Sure.. briefly.. there are a few key things I'd
like to mention on the 1.5 planning.. subsystems, and other things
that we should "plan" to update
(9:38:50 AM) bluelightning: segfaults?
(9:38:54 AM) RP_: bluelightning: Although I didn't reply, I support
the PACKAGECONFIG proposal
(9:38:57 AM) fray: i.e. gcc 4.8, gstreamer, bluez..
(9:39:19 AM) fray: I assume the general rule of follow the open source
world forward still applies, so I don't know if there is as much
planning needed on any of those as was on systemd..
(9:39:29 AM) bluelightning: khem: if it's really a segfaulting problem
we really do need that in for 1.4
(9:39:31 AM) khem: I think OE-Core should use defaults that are with
in its own layer
(9:39:36 AM) khem: and provide knobs
(9:39:39 AM) fray: but is it reasoanble to move plan to move to 4.8,
1.0, 5 respectively?  (anything else)?
(9:39:42 AM) khem: so others can turn on or off
(9:39:45 AM) bluelightning: khem: that's the suggested course
(9:39:46 AM) RP_: fray: the issue with bluez and gst are the parallel
installation
(9:39:54 AM) RP_: fray: I think we have good plans on the mailing list though
(9:40:03 AM) koen: bluez, not gst
(9:40:07 AM) koen: gst is parallel installable
(9:40:09 AM) koen: bluez isn't
(9:40:18 AM) fray: that's what I was thinking.. bluez is going to be an issue..
(9:40:24 AM) RP_: koen: right, but there are plans for both on the
mailing list though
(9:40:28 AM) fray: unless we have all of the users updated -- or some
kind of a compatibility shim
(9:41:03 AM) fray: does anyone know (at this point) any other major
version changes that could affect people?
(9:41:32 AM) RP_: khem: what is glicb doing in the 1.5 timescale?
(9:41:59 AM) khem: RP_: I dont think we will make all eglibc patches
into glibc by them
(9:42:00 AM) khem: then
(9:42:11 AM) RP_: we have the 4.8 gcc branch so that is progressing well too
(9:42:19 AM) khem: RP_: I will talk to carlos when I am at Collab
(9:42:27 AM) RP_: khem: the 2.17 issue caused some segfaults in crypt :/
(9:42:32 AM) fray: (gcc 4.8 doesn't worry me.. we'll get the issues
resolved by then)
(9:42:47 AM) RP_: khem: an update on the plans there would be good
(9:42:52 AM) ***fray notes he was really surprised to hear crypt
behavior changed
(9:43:12 AM) RP_: fray: I don't know of any other major version changes
(9:43:21 AM) fray: are there any other architectures coming in for
1.5?  (aarch64?)
(9:43:40 AM) RP_: there is talk about the qemuppc64 and qemumips64
(9:43:52 AM) RP_: I'd imagine we'll continue to see aarch64 patches dribbling in
(9:43:55 AM) fray: that would be nice..
(9:44:13 AM) RP_: I think the YP angle on this is we need more
autobuilder hardware
(9:44:24 AM) RP_: but there is a case of adding those machines to OE-Core
(9:44:25 AM) khem: fray: yes I will do provide summary in next TSC
(9:44:27 AM) fray: my concern w/ aarch64 is simply that if we get a
referecne machine (qemu?) then we're going to need autobuilder time
and such.. and new arch's generally find bugs.. :0
(9:44:31 AM) bluelightning: there's the possibility of Qt 5 for 1.5 as well
(9:44:39 AM) bluelightning: I'm still disconnected from that
(9:44:47 AM) bluelightning: but work has been progressing thanks to others
(9:44:52 AM) RP_: fray: someone will have to sponsor AB resources and
some QA to make that happen
(9:44:52 AM) fray: bluelightning ahh.. good point.. I had someone ask
me about Qt 5 the other day as well
(9:45:00 AM) fray: RP_ ok
(9:45:29 AM) RP_: fray: there are some YP members interested in the
other qemu64 I mentioned so those are less of an issue
(9:45:59 AM) fray: So one other thing..  I've mentioned this before
briefly on IRC..  during 1.5, we should look at getting rid of
'native' and moving everything to 'nativesdk'.. remvoe duplication
(9:46:10 AM) RP_: fray: no
(9:46:23 AM) fray: (I have no idea at this point if it's reasonable in
that time frame, but on the surface it looks that way to me)
(9:46:37 AM) RP_: fray: there are some deep technical issues in doing that
(9:46:50 AM) RP_: native assumes the host libc, nativesdk builds its own
(9:46:56 AM) fray: All of the ones I knew of had been resolved..
(9:47:19 AM) RP_: fray: nativesdk is done as a cross, you need the
native tools to support the cross build
(9:47:23 AM) fray: I thoguht we wanted to use the build eglibc to
avoid more problems..
(9:47:41 AM) RP_: fray: no, where did you get than from?
(9:48:06 AM) fray: people complaing that -native's are breaking on
upgrade or trying to reuse sstate between machines
(9:48:15 AM) RP_: fray: didn't we fix that?
(9:48:42 AM) fray: I'm talking about upgrading the host.. not OE-core
(9:48:50 AM) RP_: fray: I know
(9:49:00 AM) fray: if we did fix it, I'm not aware of it
(9:49:15 AM) RP_: We inject the LSB release strings into the sstate location
(9:49:17 AM) fray: (I'm also not completely aware of the problems
people were reporting.. what the actual bugs were)
(9:49:44 AM) bluelightning: which include the version...
(9:49:49 AM) RP_: fray: this sounds like something which needs more
detailed analysis
(9:49:52 AM) fray: "sometimes"
(9:50:02 AM) bluelightning: yes, more details needed
(9:50:05 AM) fray: RP- agree.. only bringing it up as something to
consider at this point
(9:50:24 AM) RP_: fray: I'll just say that merging native and
nativesdk isn't feasible as I understand it at this point
(9:50:34 AM) fray: ok
(9:50:34 AM) RP_: fray: lets talk more about the specific issues in due course
(9:50:43 AM) fray: ok
(9:51:01 AM) RP_: As I mentioned earlier, automation will be a big push in 1.5
(9:51:04 AM) fray: thats it for my 1.5 topic
(9:51:08 AM) RP_: (for QA)
(9:51:28 AM) khem: brb
(9:51:30 AM) RP_: the qemuimagetest infrastructure should adapt
relatively easily to real hardware
(9:51:32 AM) fray: I'd love to see bugs get test cases written for
them as part of hte fix..  but I believe that's only a dream.. ;)
(9:51:49 AM) RP_: fray: we are in fact starting to do this in some areas
(9:51:57 AM) RP_: the fetcher for example now has a test suite
(9:52:02 AM) fray: RP_, I know.. I'm happy to see that
(9:52:24 AM) RP_: fray: I hope we'll see improvements in 1.5 :)
(9:52:49 AM) bluelightning: another thing we've talked about for 1.5
is eliminating the wrapper script (i.e. allowing re-exec within pseudo
within the build process instead of externally)
(9:52:50 AM) RP_: I know deployment is also a big thing for 1.5 -
standalone image generation from feeds and so on
(9:53:05 AM) RP_: which I know we've been able to do berfore but this
would be much enhanced
(9:53:18 AM) RP_: ah, yes. That wrapper script needs to die
(9:53:28 AM) RP_: means changing bitbake internals, not impossible
(9:53:31 AM) fray: that would be -really- nice..
(9:53:41 AM) bluelightning: right, it's not a trivial task, but worthwhile
(9:53:52 AM) RP_: oh, and the second part of this is the performance
improvement if we could leave the bitbake server resident
(9:54:18 AM) RP_: load at source the script time, then commands just
connect to it
(9:54:31 AM) RP_: should make for a lovely responsive set of commands
(9:54:50 AM) fray: (I know I'd love to be able to run bitbake on an
external machine, but have the UI local)
(9:54:58 AM) RP_: fray: you can do that today
(9:55:05 AM) fray: ya, I use SSH.. ;)
(9:55:15 AM) RP_: fray: no, it has options for it over xmlrpc
(9:55:28 AM) RP_: fray: go look at bitbake --help ;-)
(9:55:48 AM) RP_: fray: you do need to use the -t xmlrpc option
(9:55:54 AM) fray: I do regularly..... but documenting this and make
it part of a standard use... would be nice
(9:56:18 AM) RP_: ok, anything else on 1.5?
(9:56:33 AM) RP_: and anything else on the second section 4 which we
can henceforth refer to section 5
(9:56:42 AM) fray: I'm good
(9:57:04 AM) Jefro: :-/
(9:57:15 AM) RP_: I should highlight we've made some serious
performance improvements in 1.4
(9:57:24 AM) RP_: https://wiki.yoctoproject.org/wiki/Performance_Test
(9:58:30 AM) RP_: size on disk is down, overall build time is down,
rm_work removes more, rootfs task is much faster
(9:58:42 AM) RP_: I'm really happy with what we've managed to do there
(9:59:03 AM) RP_: Anything else?
(9:59:28 AM) RP_: If not I will call the meeting closed!

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


