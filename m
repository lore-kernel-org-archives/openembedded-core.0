Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SwhOM-0005HD-5t; Thu, 02 Aug 2012 00:27:46 +0200
Received: by ggnp4 with SMTP id p4so7143325ggn.6
	for <multiple recipients>; Wed, 01 Aug 2012 15:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=K2sx+Djzm5AX0zUXwuzruEupJ2z/DEaYHiwahwVfB4I=;
	b=UJVDwHuovgRmtlG15tDzzMKpqca19aRKyCCDp7QZRGF77dou0no3/0qWVAza9or8JW
	YkCLLJSFXONJGVli3ccRcHmHNO76Pd16QAvbgVU9bsgSzaLLX7gM5BiGgEbKr9b1XK2c
	WCgJVrI9dJ2EGXnyDp1PXCyNdNUalMJiFz4peqf34bnYNjKrU4mWKaNJz35LsLywD2cD
	q5cv+30uh78afSMVeVpXJYeWj9m1i23+/05kbaihFbFloLIYVrNGytV/Yxnpe8ODIjlP
	MZZJ3/HecOV0yZSzPgkX9GqK/nLyuavrZdnZ4qHn9xFo7kdsARhBgII+CupKc6cGtNJ+
	twpw==
MIME-Version: 1.0
Received: by 10.50.184.226 with SMTP id ex2mr3716902igc.58.1343859366208; Wed,
	01 Aug 2012 15:16:06 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.102.4 with HTTP; Wed, 1 Aug 2012 15:16:06 -0700 (PDT)
Date: Wed, 1 Aug 2012 15:16:06 -0700
X-Google-Sender-Auth: Kr3Fbl0-goNOKrFnorIRibf7KQE
Message-ID: <CA+YB3rZsDBbNz3QY1L7WLxArPa7zaJH-sg5-Q+n6HPRhi4EFEw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: Minutes: OE-TSC 3 July 2012
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
X-List-Received-Date: Wed, 01 Aug 2012 22:27:46 -0000
Content-Type: multipart/alternative; boundary=14dae9340dad26a69f04c63ba4bd

--14dae9340dad26a69f04c63ba4bd
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
3 July 2012

Attendees: Mark, Richard, Khem, Paul
Apologies: Koen

________________________________________________________________
Agenda & Results

1. pick a chair: fray

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
 -> continued
 b. discuss communication with OE community about release-oriented phases
 -> continued
 c. pre/post install scripting (fray)
 initscript setup seems like a logical place to start
 goal: way to work with bare (no-init/minimal init), sysvinit, and systemd
based systems with a common framework
 => discuss on mailing list, offer oversight from TSC (fray)

3. new issues

 b. systemd
 discuss on mailing list (all)
 -> Andreas hopes to have patches soon

 c. PR bumps
 => koen to investigate server & report back
   -> continued
 => bluelightning to test on autobuilder infrastructure
   -> continued
 => find someone to write a readme on the use of the PR services, beyond
what is in
       local.conf.sample.extended (all)

 d. cleanups (RP)
 many items could use some cleanup, e.g. variables, refactoring image/pkg
code
 creating bugs for tracking cleanups is first task
 => consider cleanup items & file bugs (all)

4. status

 a. Should we still support separation of / and /usr?
 x>   khem to file enhancement request for python devshell - done
 -> keep monitoring

 a. oe-core release
      discussion on the list about release process

 b. elections
 -> remove from this list, put back when needed - 2 years from last December
 x> Jefro to document on wiki & remind the board in October 2013 - done
 x> Jefro to fix dates - done

 c. infrastructure
 -> Tom K upgraded servers to 12.04 LTS, no issues
    mailing list issue (koen) - board is coping with it, keep on agenda

 d. khem working on eglibc 2.16 upgrade

 e. /root vs. /home/root discussion
 -> RP will probably take fray's patch to use /home/root

 f. oe-made-easy script contribution
 => add wiki note that not part of OE, but provided if someone needs it
(bluelightning)
    possibly review & make more official

________________________________________________________________
Raw Transcript

(16:50:18) khem: hi all
(17:04:18) RP: ok, any ideas on a chair?
(17:04:43) fray: I can chair.. do we have an agenda yet?
(17:04:53) RP: fray: I was just cut and pasting one
(17:05:08) ***fray waits
(17:06:00) RP: anyone have any opens to add?
(17:06:12) RP: http://pastebin.com/8Eg7ZpCy
(17:06:31) RP: I did truncate it a bit
(17:07:03) RP: I guess the only thing I'd add it cleanups and how
aggressive should we be?
(17:08:08) fray: sounds fine
(17:08:21) bluelightning: yep let's discuss that
(17:08:28) khem: nothing from me
(17:08:46) RP: fray: You're chairing?
(17:08:51) fray: sure
(17:09:39) fray: ok.. no other ammendments then?
(17:09:45) RP: I don't think anything has happened with 2a and for 2b, I
think communication is happening as needed
(17:09:51) RP: fray: not from me
(17:10:01) bluelightning: nor me
(17:10:07) fray: RP, correct..  I'm supposed to push them and I finally got
out from the rock I was buried under..
(17:10:09) RP: 2c, we need some proposals but don't have any yet
(17:10:32) fray: 2c -- I keep seeing people talking aobut initscript setup
and such.. I think this may be a fairly logical place to extend the
behavior..
(17:11:07) fray: we already have some with the update-rc.d stuff, but it
would be nice if there was a way to work with bare (no-init/minimal init),
sysvinit, and systemd based systems with a common framework
(17:11:22) RP: fray: no argument, we just need proposals and people with
the time to spend on it
(17:11:30) RP: clearly defined tasks
(17:11:38) fray: ya..  unfortunately I don't have the time or I'd like to
do that..
(17:11:45) fray: (I enjoy system startup issues..)
(17:11:49) RP: fray: common problem :/
(17:12:10) fray: should we ask the folks on the lists to see if anyone
wants to work on this as a common problem?
(17:12:21) fray: (I haven't seen any firm proposals, other then minor
discussion at this point)
(17:12:24) bluelightning: sounds like a good idea
(17:12:30) RP: We can ask...
(17:12:42) RP: My worry is we need someone experienced to review the
changes too
(17:12:46) fray: ok, then I propose we simply say we see a problem, and we
are asking for people to work on this..
(17:12:50) fray: absolutely
(17:13:02) khem: is this for pre/post install scripting
(17:13:08) RP: khem: yes
(17:13:15) fray: pre/post install scripting specifically for
initscript/bootup control
(17:13:58) khem: yes I think we should discuss it on ml and get more folks
ideas
(17:14:28) fray: so lets ask for help here.. with oversight from the TSC
and regular mailing list reviews.. (if we have enough folks able to help)
we should make progress..
(17:14:32) fray: otherwise we're no worse off then today
(17:15:21) fray: anything else on 2c?
(17:15:34) fray: ohh and who has the AI to send out an email asking for
help?
(17:16:49) RP: fray: I think you'd make a good candidate? ;-)
(17:16:54) fray: ok, I take silence as I guess I need to.. ;)
(17:16:57) fray: put me down for the AI
(17:17:18) fray: (ohh and I think we should keep 2c as a standing issue)..
otherwise onto 3?
(17:17:29) RP: fray: sounds goof
(17:17:32) RP: good :)
(17:17:37) RP: fray: well volunteered! :)
(17:17:55) RP: For systemd, I failed to deal with my AR :(
(17:17:55) fray: I see no 3a....
(17:18:00) ***RP will aim to do better
(17:18:06) RP: fray: cut and paste issue
(17:18:08) fray: 3b then.. ;)
(17:18:15) RP: fray: there isn't a 3a
(17:18:39) khem: systemd layer is still empty
(17:18:41) fray: I don't have any thing then on systemd..  on to 3c?
(17:18:48) bluelightning: for 3b I just sent out a ping this morning
(17:18:55) bluelightning: (for the creation of the layer)
(17:18:58) khem: bluelightning: good.
(17:19:06) bluelightning: Andreas is swamped atm but he hopes to have a v2
patch series soon
(17:19:18) khem: bluelightning: yes then we can start testing it out
(17:19:53) fray: excellent
(17:20:29) fray: ok  3c then..  anything to report on the PR server?
(17:21:03) bluelightning: I have not yet talked yet with our autobuilder
folks about testing it, so no progress
(17:21:11) fray: ok..
(17:21:25) fray: is 3d - cleanups (new item) or is that elsewhere?
(17:21:41) khem: bluelightning: is there some email/doc on how to enable it
(17:21:46) fray: (elswhere in the agenda that is)
(17:22:01) bluelightning: khem: I'm not sure, I doubt we have a
comprehensive document for it
(17:22:18) fray: ya, we'll need at least basic instructions on setup and
using it before we can switch to it..
(17:22:32) RP: There is something in the sample local.conf fiiles iirc
(17:22:33) fray: RP -- do you know if there are any Yocto Project
documentation tasks around the PR server?
(17:22:55) RP: fray: I'm not familiar with other docs
(17:23:13) fray: this is in local.conf.sample.extedned
(17:23:13) khem: RP: I would test it out locally since I have some private
feeds where I can experiment with it
(17:23:14) fray: # The network based PR service host and port
(17:23:14) fray: # Uncomment the following lines to enable PRservice.
(17:23:14) fray: # Set PRSERV_HOST to 'localhost' and PRSERV_PORT to '0' to
automatically
(17:23:14) fray: # start local PRService.
(17:23:14) fray: # Set to other values to use remote PRService.
(17:23:14) fray: #PRSERV_HOST = "localhost"
(17:23:15) fray: #PRSERV_PORT = "0"
(17:23:51) khem: thats it ?
(17:23:56) khem: OK I will try it out
(17:24:52) fray: that seems sparse for instructions..  we (Yocto project
we) may have to push for some additional docs on how to use the pr services
in a given project.. so we (oe) can leverage the docs
(17:25:26) RP: well, the setup was kept simple
(17:25:31) khem: I think that would be nice to have a wiki doc or in some
form
(17:25:38) fray: I do an aweful lot of rm, and rebuilds from scratch to try
things out.. so we need to make sure that it's documented how to persist
the PR service between builds and developers..
(17:25:44) RP: I agree some more detailed docs could be useful
(17:26:09) fray: If the YP doesn't have time to document it, we'll have to
find someone who can write up a basic readme on it at least
(17:26:26) bluelightning: fray: I think we'll have to make time
(17:26:43) ***RP agrees
(17:26:48) fray: I think so as well, this is going to become critical
soon...
(17:26:56) ***khem sees an action item
(17:26:59) fray: ok, anything else on the PR servives then?
(17:27:16) RP: No, just that it is becoming more pressing
(17:27:25) fray: khem, agreed.. AI for YP folks (RP?) find out about
documentation resources and PR service...
(17:27:52) fray: AI - -TSC- needs to find someone to write a readme on the
use of the PR services, beyond what is in the local.conf.sample.extended
(17:27:53) ***RP knows who will end up with this task
(17:28:14) fray: ;)
(17:28:47) fray: ok... on to (new) 3d - cleanup items?
(17:28:54) RP: yes
(17:29:01) RP: There are a lot of things we could try and cleanup
(17:29:16) RP: For example should we remove the PCMCIA_MANAGER variable?
(17:29:19) RP: FILESDIR?
(17:29:48) khem: I am all for reducing the variables
(17:29:55) khem: we have too many
(17:30:04) RP: The question is how hard should we pursue something of these
things?
(17:30:10) khem: I think putting this in janitor list would be nice
(17:30:17) RP: khem: Its not janitor
(17:30:37) RP: khem: you need to know what you're doing as the implications
can be singificant
(17:30:39) khem: RP: I think creating bugs for tracking them would be first
thing
(17:30:53) RP: Its also a question of identifying things
(17:30:57) fray: ya, I agree with the bugs for these.. I think we need to
keep cleaning these items up and making them easier to work with..
(17:30:58) khem: RP: agreed however class is still same
(17:31:48) RP: Things like refactoring the image/package code also spring
to mind
(17:32:01) RP: the current code in those class files is looking horrendous
:(
(17:32:02) khem: I dont know if it would make sense to kind of collect a
list or go through and find the items to flag first
(17:32:09) fray: Absolutely...
(17:32:26) RP: Perhaps we should all make some lists
(17:32:33) RP: and then translate these into bugs in the bugzilla
(17:32:35) khem: and PACKAGE_DYNAMICS can we avoid it
(17:32:48) RP: khem: how would you propose that?
(17:33:11) RP: khem: I never wanted to introduce that in the first place
but had no option
(17:33:46) fray: ya, it's the dependencies on dynamically generated
packages is the problem.....
(17:33:49) bluelightning: I have a personal todo item to add some code to
immediately flag up when something PACKAGES_DYNAMIC satisfied wasn't
actually satisfied at the end of do_package
(17:34:07) bluelightning: don't know if that will help but at least the
failure will be earlier than do_rootfs
(17:34:14) fray: too bad you can't build through a specific location and
then trigger bitbake to re compute the dependencies... (once they're no
longer dynamic globs)
(17:34:21) RP: bluelightning: its not an error for that to occur
(17:34:30) RP: bluelightning: think a kernel with all modules as builtins
(17:34:45) khem: RP: havent thought deeply for alternative but I think I
will
(17:34:47) bluelightning: RP: I'm talking about satisfying RDEPENDS not
RRECOMMENDS
(17:34:52) fray: python, perl and kernel are the biggest PACKAGES_DYNAMIC
users right?
(17:35:04) khem: and may be LEAD_SONAME
(17:35:10) khem: can be dropped too
(17:35:20) RP: bluelightning: hmm, where are you going to get the
information to compute that though? I like the idea but...
(17:35:31) RP: khem: LEAD_SONAME is an easier candidate
(17:35:34) bluelightning: RP: I haven't looked into it but it can't be
impossible
(17:35:36) khem: fray eglibc too
(17:35:48) fray: locales/charmaps/etc right/
(17:35:49) RP: bluelightning: its not impossible, I just worry about the
complexity it would introduce
(17:35:50) bluelightning: how will debian renaming work without LEAD_SONAME?
(17:36:11) ***fray -really- hates debian rename.. (but I understand why
it's there)
(17:36:16) RP: bluelightning: I think the idea is you'd split packages more
(17:36:30) khem: split well
(17:36:45) bluelightning: RP: it really annoys me when we get do_rootfs
failures because it's hard to tell what the cause is; a check on
PACKAGES_DYNAMIC is just one piece to help with that
(17:36:48) RP: fray: you have no idea of the pain that caused in the past
;-)
(17:36:58) bluelightning: RP: dependency failures in do_rootfs, I mean
(17:37:17) RP: bluelightning: some debug code that analyses the failure
might be the way to go
(17:37:30) fray: ya, it would be nice if PACKAGES_DYNAMIC, when it's no
longer dynamic was verified..
(17:37:33) RP: bluelightning: if we could extract which package was missing
from the error output
(17:37:42) khem: bluelightning: sometimes they are due to shlib deps in
packages
(17:38:00) fray: one of the biggest complaints we get from customers is
delayed failures..  they'd rather get the failure as soon as it can be
detected... (even if it's after 30 minutes of building)
(17:38:45) khem: I have a stupid method I use for some rfs errors
http://sakrah.dontexist.org/?p=11
(17:38:47) fray: ok.. anyway.. back on topic.. (forgot I was chairing)..
 Do we have specific actions or things we need to do for this.. (I think we
all agree we want to do cleanup, and continue to refactor things as
appropriate)
(17:39:05) khem: fray: I think we should start filing bugs may be
(17:39:19) khem: and add some keyword to them if needed to identify
(17:39:38) RP: fray: action to consider things and come up with lists for
next meeting?
(17:39:48) RP: file bugs
(17:39:48) fray: I'm all for that..  right now we've talking about
refactoring packages, images, debian related LEAD_SONAME...
(17:39:57) fray: RP -- good..
(17:40:02) RP: Lets try and keep it grounded though
(17:40:03) fray: AI -- all consider things to be refactored
(17:40:11) RP: Some of these are nice high level but really hard
(17:40:15) fray: AI - file bugs on things we already know of.. (if this
gets delayed till next week, it's ok)
(17:40:53) fray: ok.. anything further on 3d?
(17:41:34) RP: no
(17:41:53) bluelightning: not for the moment
(17:41:54) fray: ok.. on to 4a..
(17:42:18) RP: khem: did you file that bug?
(17:42:24) fray: 4a is a holding item -- / and /usr seperation.. I haven't
seen any additional comments on the list recently (for or againsts).. so
think we need to keep monitoring...
(17:42:30) fray: what was the devshell item?
(17:42:32) RP: agreed
(17:42:53) RP: add a python devshell maybe using the python interactive
interpreter
(17:43:02) fray: ahh yes..
(17:43:06) RP: khem: was to file a bug
(17:43:15) khem: I did
(17:43:22) RP: khem: cool :)
(17:43:42) RP: For the elections, Frans noticed a discrepancy in the dates,
I suggest we ask Jefro to revise as Frans pointed out
(17:44:12) fray: yup, agreed..
(17:44:24) khem: and we should remove that from agenda
(17:44:42) RP: khem: yes, I just left it to remind me to mention this
(17:44:47) fray: May/June 2013 was the date right?
(17:44:51) RP: yes
(17:45:12) fray: ok.. any thing on 4c?
(17:45:37) RP: not from m
(17:45:40) khem: tom has upgraded servers to 12.04 lts
(17:45:50) khem: without any issues
(17:45:59) fray: cool..
(17:46:29) khem: we are done
(17:46:33) RP: great. Thanks Tom! :)
(17:46:43) RP: Anything else anyone wants to talk about?
(17:46:57) fray: Just wanted to mention the /root vs /home/root discussion
in the oe-core list..
(17:47:10) khem: i am working on eglibc 2.16 upgrade
(17:47:14) fray: If anyone has any background or opinions.. I'd appreciate
if they could jump in and clarify..
(17:47:20) fray: otherwise nothing else from me
(17:47:25) bluelightning: I'm still a bit concerned someone added
"oe-made-easy" to the OE core start guide
(17:47:28) RP: fray: I think its clear we use /home/root and I'll probably
take your patch
(17:47:39) RP: making it configurable would be nice but that is for another
day
(17:47:58) RP: bluelightning: ?
(17:48:04) fray: RP, I'm expecting it won't change due to history.. but
it's an item I'd like to make sure everyone knows about.. (like I said in
the email, caught me by surprise..)
(17:48:18) RP: I'd also note that we've got some recursive dependency
changes in bitbake being worked on at the moment
(17:48:20) bluelightning: concern being, it's something that's not part of
OE and could potentially mask problems
(17:48:33) RP: please report any odd dependency issues if not already being
worked on
(17:48:41) bluelightning:
http://www.openembedded.org/wiki/OpenEmbedded-Core#One-liner_via_oe-made-easy
(17:48:43) RP: bluelightning: right, this is some script?
(17:48:46) bluelightning: yes
(17:48:54) bluelightning: I commented on the ml, nobody replied
(17:49:29) fray: sorry I missed it..
(17:50:01) fray: I'm thinking someone should add a comment that this is not
part of openEmbedded... but provided to help if someone needs it
(17:50:18) fray: if we can review it and it's useful, then we can make it
more official..
(17:50:36) bluelightning: well maybe, but that leads to the kind of docs we
had for OE -classic with a million user suggested "better ways" of doing
things
(17:50:42) fray: my only real concern with something like this is that it's
external of the project....
(17:50:48) bluelightning: right
(17:50:50) fray: bluelightning yes, I can appreciate that as well
(17:51:36) RP: I am worried about people adding 101 ways to do things
(17:51:38) fray: lets add this as a discussion item for the next meeting..
but until then can someone modify the wiki to just clarify this is external
of the openembedded project?
(17:51:46) bluelightning: yep I'll do that
(17:52:02) RP: The official Yocto Project Quick Start is also growing kind
of scarily :(
(17:52:24) fray: yet another item for "refactoring"  ;)
(17:52:49) fray: ok.. anything else for today?
(17:52:58) RP: I think the "this page" link on the OE wiki page needs to be
made more proncounced
(17:53:13) RP: then the oe-made-easy thing might be less necessary
(17:53:17) RP: fray: no
(17:53:31) fray: yup..
(17:53:36) fray: ok.. calling it..  thanks everyone!
(17:54:49) RP: fray: thanks

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

--14dae9340dad26a69f04c63ba4bd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">OpenEmbedded Technical Steering Commi=
ttee</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">
3 July 2012</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)"><br></div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
Attendees: Mark, Richard, Khem, Paul</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">Apologies: Koen</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">___________________________=
_____________________________________</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
Agenda &amp; Results</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">
1. pick a chair: fray</div><div style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">
2. lingering issues</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">
=A0a. raise awareness of &quot;janitor&quot; list, QA &quot;bugs&quot;</div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)">=A0-&gt; continued</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
=A0b. discuss communication with OE community about release-oriented phases=
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:13px;background-color:rgb(255,255,255)">=A0-&gt; continued</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
=A0c. pre/post install scripting (fray)</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">=A0initscript setup seems like a logical place to start</div><div s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;bac=
kground-color:rgb(255,255,255)">
=A0goal: way to work with bare (no-init/minimal init), sysvinit, and system=
d based systems with a common framework</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
=A0=3D&gt; discuss on mailing list, offer oversight from TSC (fray)</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">=A0</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
3. new issues</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
=A0b. systemd</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">=A0discuss on mail=
ing list (all)</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)">
=A0-&gt; Andreas hopes to have patches soon</div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(25=
5,255,255)"><br></div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:13px;background-color:rgb(255,255,255)">
=A0c. PR bumps</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)">=A0=3D&gt; koen t=
o investigate server &amp; report back</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
=A0 =A0-&gt; continued</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=A0=3D&gt=
; bluelightning to test on autobuilder infrastructure</div><div style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-co=
lor:rgb(255,255,255)">
=A0 =A0-&gt; continued</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=A0=3D&gt=
; find someone to write a readme on the use of the PR services, beyond what=
 is in</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0 =A0 =A0 =A0local.conf.sample.exte=
nded (all)</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">=A0d. cleanups (RP)</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">
=A0many items could use some cleanup, e.g. variables, refactoring image/pkg=
 code</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:13px;background-color:rgb(255,255,255)">=A0creating bugs for track=
ing cleanups is first task</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0=3D&gt; consider cleanup items &am=
p; file bugs (all)</div><div style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">4. status</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">=A0a. Should we still suppo=
rt separation of / and /usr?</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
=A0x&gt; =A0 khem to file enhancement request for python devshell - done</d=
iv><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:13px;background-color:rgb(255,255,255)">=A0-&gt; keep monitoring</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">=A0a. oe-core release</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">
=A0 =A0 =A0 discussion on the list about release process</div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)"><span style=3D"white-space:pre-wrap">	</span>=A0=
=A0</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:13px;background-color:rgb(255,255,255)">
=A0b. elections</div><div style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:13px;background-color:rgb(255,255,255)">=A0-&gt; remove =
from this list, put back when needed - 2 years from last December</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
=A0x&gt; Jefro to document on wiki &amp; remind the board in October 2013 -=
 done</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:13px;background-color:rgb(255,255,255)">=A0x&gt; Jefro to fix date=
s - done</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">
=A0c. infrastructure</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=A0-&gt; To=
m K upgraded servers to 12.04 LTS, no issues</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">
=A0 =A0 mailing list issue (koen) - board is coping with it, keep on agenda=
</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:13px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)">
=A0d. khem working on eglibc 2.16 upgrade</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">=A0</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">
=A0e. /root vs. /home/root discussion</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">=A0-&gt; RP will probably take fray&#39;s patch to use /home/root</di=
v>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">
=A0f. oe-made-easy script contribution</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">=A0=3D&gt; add wiki note that not part of OE, but provided if someon=
e needs it (bluelightning)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">=A0 =A0 possibly review &amp; make mo=
re official</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">___________________________=
_____________________________________</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
Raw Transcript</div><div style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
(16:50:18) khem: hi all</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:04:1=
8) RP: ok, any ideas on a chair?</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
(17:04:43) fray: I can chair.. do we have an agenda yet?</div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)">(17:04:53) RP: fray: I was just cut and pasting on=
e</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:05:08) ***fray waits</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
(17:06:00) RP: anyone have any opens to add?</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">(17:06:12) RP:=A0<a href=3D"http://pastebin.com/8Eg7ZpCy" targ=
et=3D"_blank" style=3D"color:rgb(17,85,204)">http://pastebin.com/8Eg7ZpCy</=
a></div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:06:31) RP: I did truncate it a bi=
t</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:13px;background-color:rgb(255,255,255)">
(17:07:03) RP: I guess the only thing I&#39;d add it cleanups and how aggre=
ssive should we be?</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:08:08) f=
ray: sounds fine</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:08:21) bluelightning: yep let&#39=
;s discuss that</div><div style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:08:28) khem: nothing from me</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>(17:08:46) RP: fray: You&#39;re chairing?</div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
(17:08:51) fray: sure</div><div style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:09:39)=
 fray: ok.. no other ammendments then?</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">
(17:09:45) RP: I don&#39;t think anything has happened with 2a and for 2b, =
I think communication is happening as needed</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">
(17:09:51) RP: fray: not from me</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>(17:10:01) bluelightning: nor me</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
(17:10:07) fray: RP, correct.. =A0I&#39;m supposed to push them and I final=
ly got out from the rock I was buried under..</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
(17:10:09) RP: 2c, we need some proposals but don&#39;t have any yet</div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13p=
x;background-color:rgb(255,255,255)">(17:10:32) fray: 2c -- I keep seeing p=
eople talking aobut initscript setup and such.. I think this may be a fairl=
y logical place to extend the behavior..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:11:07) fray: we already have some=
 with the update-rc.d stuff, but it would be nice if there was a way to wor=
k with bare (no-init/minimal init), sysvinit, and systemd based systems wit=
h a common framework</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:11:22) RP: fray: no argument, we =
just need proposals and people with the time to spend on it</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
(17:11:30) RP: clearly defined tasks</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">(17:11:38) fray: ya.. =A0unfortunately I don&#39;t have the time or I&=
#39;d like to do that..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:11:45) fray: (I enjoy system star=
tup issues..)</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:11:49) RP: fray: common problem :/</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">(17:12:10) fray: should we ask the folks on the lists to see if anyo=
ne wants to work on this as a common problem?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:12:21) fray: (I haven&#39;t seen =
any firm proposals, other then minor discussion at this point)</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
(17:12:24) bluelightning: sounds like a good idea</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">(17:12:30) RP: We can ask...</div><div style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb=
(255,255,255)">
(17:12:42) RP: My worry is we need someone experienced to review the change=
s too</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:13px;background-color:rgb(255,255,255)">(17:12:46) fray: ok, then =
I propose we simply say we see a problem, and we are asking for people to w=
ork on this..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:12:50) fray: absolutely</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
(17:13:02) khem: is this for pre/post install scripting</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">(17:13:08) RP: khem: yes</div><div style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)">
(17:13:15) fray: pre/post install scripting specifically for initscript/boo=
tup control</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">(17:13:58) khem: yes=
 I think we should discuss it on ml and get more folks ideas</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:14:28) fray: so lets ask for help=
 here.. with oversight from the TSC and regular mailing list reviews.. (if =
we have enough folks able to help) we should make progress..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:14:32) fray: otherwise we&#39;re =
no worse off then today</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:15:21) fray: anything else on 2c?</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">(17:15:34) fray: ohh and who has the AI to send out an email asking f=
or help?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:16:49) RP: fray: I think you&#39;=
d make a good candidate? ;-)</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:16:54) fray: ok, I take silence as I guess I need to.. ;)</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">(17:16:57) fray: put me down for the AI</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:17:18) fray: (ohh and I think we =
should keep 2c as a standing issue).. otherwise onto 3?</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">
(17:17:29) RP: fray: sounds goof</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>(17:17:32) RP: good :)</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:17:37) RP: fray: well volunteered! :)</div><div style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,=
255,255)">(17:17:55) RP: For systemd, I failed to deal with my AR :(</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:17:55) fray: I see no 3a....</div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)">
(17:18:00) ***RP will aim to do better</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">(17:18:06) RP: fray: cut and paste issue</div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rg=
b(255,255,255)">
(17:18:08) fray: 3b then.. ;)</div><div style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(1=
7:18:15) RP: fray: there isn&#39;t a 3a</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
(17:18:39) khem: systemd layer is still empty</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">(17:18:41) fray: I don&#39;t have any thing then on systemd..=
 =A0on to 3c?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:18:48) bluelightning: for 3b I ju=
st sent out a ping this morning</div><div style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:18:55) bluelightning: (for the creation of the layer)</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">(17:18:58) khem: bluelightning: good.</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
(17:19:06) bluelightning: Andreas is swamped atm but he hopes to have a v2 =
patch series soon</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:19:18) khe=
m: bluelightning: yes then we can start testing it out</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:19:53) fray: excellent</div><div =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;ba=
ckground-color:rgb(255,255,255)">
(17:20:29) fray: ok =A03c then.. =A0anything to report on the PR server?</d=
iv><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:13px;background-color:rgb(255,255,255)">(17:21:03) bluelightning: I have n=
ot yet talked yet with our autobuilder folks about testing it, so no progre=
ss</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:21:11) fray: ok..</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
(17:21:25) fray: is 3d - cleanups (new item) or is that elsewhere?</div><di=
v style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;=
background-color:rgb(255,255,255)">(17:21:41) khem: bluelightning: is there=
 some email/doc on how to enable it</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:21:46) fray: (elswhere in the age=
nda that is)</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:13px;background-color:rgb(255,255,255)">
(17:22:01) bluelightning: khem: I&#39;m not sure, I doubt we have a compreh=
ensive document for it</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:22:18=
) fray: ya, we&#39;ll need at least basic instructions on setup and using i=
t before we can switch to it..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:22:32) RP: There is something in =
the sample local.conf fiiles iirc</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
(17:22:33) fray: RP -- do you know if there are any Yocto Project documenta=
tion tasks around the PR server?</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
(17:22:55) RP: fray: I&#39;m not familiar with other docs</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">(17:23:13) fray: this is in local.conf.sample.e=
xtedned</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:23:13) khem: RP: I would test it =
out locally since I have some private feeds where I can experiment with it<=
/div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:23:14) fray: # The network based =
PR service host and port</div><div style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:23:14) fray: # Uncomment the following lines to enable PRservice.</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:23:14) fray: # Set PRSERV_HOST to=
 &#39;localhost&#39; and PRSERV_PORT to &#39;0&#39; to automatically</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:23:14) fray: # start local PRServ=
ice.</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">
(17:23:14) fray: # Set to other values to use remote PRService.</div><div s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;bac=
kground-color:rgb(255,255,255)">(17:23:14) fray: #PRSERV_HOST =3D &quot;loc=
alhost&quot;</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:23:15) fray: #PRSERV_PORT =3D &qu=
ot;0&quot;</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">
(17:23:51) khem: thats it ?</div><div style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:=
23:56) khem: OK I will try it out</div><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)=
">
(17:24:52) fray: that seems sparse for instructions.. =A0we (Yocto project =
we) may have to push for some additional docs on how to use the pr services=
 in a given project.. so we (oe) can leverage the docs</div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-c=
olor:rgb(255,255,255)">
(17:25:26) RP: well, the setup was kept simple</div><div style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb=
(255,255,255)">(17:25:31) khem: I think that would be nice to have a wiki d=
oc or in some form</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:25:38) fray: I do an aweful lot o=
f rm, and rebuilds from scratch to try things out.. so we need to make sure=
 that it&#39;s documented how to persist the PR service between builds and =
developers..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:25:44) RP: I agree some more deta=
iled docs could be useful</div><div style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:26:09) fray: If the YP doesn&#39;t have time to document it, we&#39;ll =
have to find someone who can write up a basic readme on it at least</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">
(17:26:26) bluelightning: fray: I think we&#39;ll have to make time</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">(17:26:43) ***RP agrees</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
(17:26:48) fray: I think so as well, this is going to become critical soon.=
..</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:13px;background-color:rgb(255,255,255)">(17:26:56) ***khem sees an ac=
tion item</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:26:59) fray: ok, anything else on=
 the PR servives then?</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:27:16) RP: No, just that it is becoming more pressing</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">(17:27:25) fray: khem, agreed.. AI for YP folks=
 (RP?) find out about documentation resources and PR service...</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:27:52) fray: AI - -TSC- needs to =
find someone to write a readme on the use of the PR services, beyond what i=
s in the local.conf.sample.extended</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:27:53) ***RP knows who will end u=
p with this task</div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:28:14) fray: ;)</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:28:47) f=
ray: ok... on to (new) 3d - cleanup items?</div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
(17:28:54) RP: yes</div><div style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:29:01) RP=
: There are a lot of things we could try and cleanup</div><div style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-col=
or:rgb(255,255,255)">
(17:29:16) RP: For example should we remove the PCMCIA_MANAGER variable?</d=
iv><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:13px;background-color:rgb(255,255,255)">(17:29:19) RP: FILESDIR?</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
(17:29:48) khem: I am all for reducing the variables</div><div style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-col=
or:rgb(255,255,255)">(17:29:55) khem: we have too many</div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-c=
olor:rgb(255,255,255)">
(17:30:04) RP: The question is how hard should we pursue something of these=
 things?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:13px;background-color:rgb(255,255,255)">(17:30:10) khem: I thin=
k putting this in janitor list would be nice</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:30:17) RP: khem: Its not janitor<=
/div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:13px;background-color:rgb(255,255,255)">
(17:30:37) RP: khem: you need to know what you&#39;re doing as the implicat=
ions can be singificant</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:30:3=
9) khem: RP: I think creating bugs for tracking them would be first thing</=
div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:30:53) RP: Its also a question of=
 identifying things</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:30:57) fray: ya, I agree with the bugs for these.. I think we need to k=
eep cleaning these items up and making them easier to work with..</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
(17:30:58) khem: RP: agreed however class is still same</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">(17:31:48) RP: Things like refactoring the image/pa=
ckage code also spring to mind</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:32:01) RP: the current code in th=
ose class files is looking horrendous :(</div><div style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,2=
55,255)">
(17:32:02) khem: I dont know if it would make sense to kind of collect a li=
st or go through and find the items to flag first</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">
(17:32:09) fray: Absolutely...</div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(=
17:32:26) RP: Perhaps we should all make some lists</div><div style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-colo=
r:rgb(255,255,255)">
(17:32:33) RP: and then translate these into bugs in the bugzilla</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">(17:32:35) khem: and PACKAGE_DYNAMICS can=
 we avoid it</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:32:48) RP: khem: how would you pr=
opose that?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">
(17:33:11) RP: khem: I never wanted to introduce that in the first place bu=
t had no option</div><div style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:13px;background-color:rgb(255,255,255)">(17:33:46) fray:=
 ya, it&#39;s the dependencies on dynamically generated packages is the pro=
blem.....</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:33:49) bluelightning: I have a pe=
rsonal todo item to add some code to immediately flag up when something PAC=
KAGES_DYNAMIC satisfied wasn&#39;t actually satisfied at the end of do_pack=
age</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:34:07) bluelightning: don&#39;t k=
now if that will help but at least the failure will be earlier than do_root=
fs</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:34:14) fray: too bad you can&#39;=
t build through a specific location and then trigger bitbake to re compute =
the dependencies... (once they&#39;re no longer dynamic globs)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:34:21) RP: bluelightning: its not=
 an error for that to occur</div><div style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:34:30) RP: bluelightning: think a kernel with all modules as builtins</=
div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:13px;background-color:rgb(255,255,255)">(17:34:45) khem: RP: havent thoug=
ht deeply for alternative but I think I will</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:34:47) bluelightning: RP: I&#39;m=
 talking about satisfying RDEPENDS not RRECOMMENDS</div><div style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color=
:rgb(255,255,255)">
(17:34:52) fray: python, perl and kernel are the biggest PACKAGES_DYNAMIC u=
sers right?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:13px;background-color:rgb(255,255,255)">(17:35:04) khem: and=
 may be LEAD_SONAME</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:35:10) khem: can be dropped too</=
div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:13px;background-color:rgb(255,255,255)">
(17:35:20) RP: bluelightning: hmm, where are you going to get the informati=
on to compute that though? I like the idea but...</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">
(17:35:31) RP: khem: LEAD_SONAME is an easier candidate</div><div style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-=
color:rgb(255,255,255)">(17:35:34) bluelightning: RP: I haven&#39;t looked =
into it but it can&#39;t be impossible</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:35:36) khem: fray eglibc too</div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)">
(17:35:48) fray: locales/charmaps/etc right/</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">(17:35:49) RP: bluelightning: its not impossible, I just worry=
 about the complexity it would introduce</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:35:50) bluelightning: how will de=
bian renaming work without LEAD_SONAME?</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">
(17:36:11) ***fray -really- hates debian rename.. (but I understand why it&=
#39;s there)</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:13px;background-color:rgb(255,255,255)">(17:36:16) RP: blue=
lightning: I think the idea is you&#39;d split packages more</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:36:30) khem: split well</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
(17:36:45) bluelightning: RP: it really annoys me when we get do_rootfs fai=
lures because it&#39;s hard to tell what the cause is; a check on PACKAGES_=
DYNAMIC is just one piece to help with that</div><div style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(25=
5,255,255)">
(17:36:48) RP: fray: you have no idea of the pain that caused in the past ;=
-)</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:13px;background-color:rgb(255,255,255)">(17:36:58) bluelightning: RP:=
 dependency failures in do_rootfs, I mean</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:37:17) RP: bluelightning: some de=
bug code that analyses the failure might be the way to go</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
(17:37:30) fray: ya, it would be nice if PACKAGES_DYNAMIC, when it&#39;s no=
 longer dynamic was verified..</div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:37:33) RP: bluelightning: if we could extract which package was missing=
 from the error output</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:37:42=
) khem: bluelightning: sometimes they are due to shlib deps in packages</di=
v>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:38:00) fray: one of the biggest c=
omplaints we get from customers is delayed failures.. =A0they&#39;d rather =
get the failure as soon as it can be detected... (even if it&#39;s after 30=
 minutes of building)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:38:45) khem: I have a stupid meth=
od I use for some rfs errors=A0<a href=3D"http://sakrah.dontexist.org/?p=3D=
11" target=3D"_blank" style=3D"color:rgb(17,85,204)">http://sakrah.dontexis=
t.org/?p=3D11</a></div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:38:47) fray: ok.. anyway.. back o=
n topic.. (forgot I was chairing).. =A0Do we have specific actions or thing=
s we need to do for this.. (I think we all agree we want to do cleanup, and=
 continue to refactor things as appropriate)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:39:05) khem: fray: I think we sho=
uld start filing bugs may be</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:39:19) khem: and add some keyword to them if needed to identify</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px=
;background-color:rgb(255,255,255)">(17:39:38) RP: fray: action to consider=
 things and come up with lists for next meeting?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:39:48) RP: file bugs</div><div st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">
(17:39:48) fray: I&#39;m all for that.. =A0right now we&#39;ve talking abou=
t refactoring packages, images, debian related LEAD_SONAME...</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
(17:39:57) fray: RP -- good..</div><div style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(1=
7:40:02) RP: Lets try and keep it grounded though</div><div style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:=
rgb(255,255,255)">
(17:40:03) fray: AI -- all consider things to be refactored</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">(17:40:11) RP: Some of these are nice high leve=
l but really hard</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:40:15) fray: AI - file bugs on th=
ings we already know of.. (if this gets delayed till next week, it&#39;s ok=
)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:40:53) fray: ok.. anything furthe=
r on 3d?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:13px;background-color:rgb(255,255,255)">
(17:41:34) RP: no</div><div style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:41:53) blu=
elightning: not for the moment</div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:41:54) fray: ok.. on to 4a..</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>(17:42:18) RP: khem: did you file that bug?</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">
(17:42:24) fray: 4a is a holding item -- / and /usr seperation.. I haven&#3=
9;t seen any additional comments on the list recently (for or againsts).. s=
o think we need to keep monitoring...</div><div style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,=
255)">
(17:42:30) fray: what was the devshell item?</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)">(17:42:32) RP: agreed</div><div style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255=
)">
(17:42:53) RP: add a python devshell maybe using the python interactive int=
erpreter</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:13px;background-color:rgb(255,255,255)">(17:43:02) fray: ahh ye=
s..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:43:06) RP: khem: was to file a bu=
g</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:13px;background-color:rgb(255,255,255)">
(17:43:15) khem: I did</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:43:22=
) RP: khem: cool :)</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:43:42) RP: For the elections, Frans noticed a discrepancy in the dates,=
 I suggest we ask Jefro to revise as Frans pointed out</div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-c=
olor:rgb(255,255,255)">
(17:44:12) fray: yup, agreed..</div><div style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(=
17:44:24) khem: and we should remove that from agenda</div><div style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-co=
lor:rgb(255,255,255)">
(17:44:42) RP: khem: yes, I just left it to remind me to mention this</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:44:47) fray: May/June 2013 was th=
e date right?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:44:51) RP: yes</div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)">
(17:45:12) fray: ok.. any thing on 4c?</div><div style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">(17:45:37) RP: not from m</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
(17:45:40) khem: tom has upgraded servers to 12.04 lts</div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-c=
olor:rgb(255,255,255)">(17:45:50) khem: without any issues</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
(17:45:59) fray: cool..</div><div style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:46:2=
9) khem: we are done</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:46:33) RP: great. Thanks Tom! :)</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">(17:46:43) RP: Anything else anyone wants to talk about?</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
(17:46:57) fray: Just wanted to mention the /root vs /home/root discussion =
in the oe-core list..</div><div style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:47:10)=
 khem: i am working on eglibc 2.16 upgrade</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:47:14) fray: If anyone has any ba=
ckground or opinions.. I&#39;d appreciate if they could jump in and clarify=
..</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:47:20) fray: otherwise nothing el=
se from me</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">
(17:47:25) bluelightning: I&#39;m still a bit concerned someone added &quot=
;oe-made-easy&quot; to the OE core start guide</div><div style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb=
(255,255,255)">
(17:47:28) RP: fray: I think its clear we use /home/root and I&#39;ll proba=
bly take your patch</div><div style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:47:39) R=
P: making it configurable would be nice but that is for another day</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:47:58) RP: bluelightning: ?</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">
(17:48:04) fray: RP, I&#39;m expecting it won&#39;t change due to history..=
 but it&#39;s an item I&#39;d like to make sure everyone knows about.. (lik=
e I said in the email, caught me by surprise..)</div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rg=
b(255,255,255)">
(17:48:18) RP: I&#39;d also note that we&#39;ve got some recursive dependen=
cy changes in bitbake being worked on at the moment</div><div style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-colo=
r:rgb(255,255,255)">
(17:48:20) bluelightning: concern being, it&#39;s something that&#39;s not =
part of OE and could potentially mask problems</div><div style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb=
(255,255,255)">
(17:48:33) RP: please report any odd dependency issues if not already being=
 worked on</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:13px;background-color:rgb(255,255,255)">(17:48:41) bluelightn=
ing:=A0<a href=3D"http://www.openembedded.org/wiki/OpenEmbedded-Core#One-li=
ner_via_oe-made-easy" target=3D"_blank" style=3D"color:rgb(17,85,204)">http=
://www.openembedded.org/wiki/OpenEmbedded-Core#One-liner_via_oe-made-easy</=
a></div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:48:43) RP: bluelightning: right, =
this is some script?</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:48:46) bluelightning: yes</div><div style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(1=
7:48:54) bluelightning: I commented on the ml, nobody replied</div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
(17:49:29) fray: sorry I missed it..</div><div style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,2=
55)">(17:50:01) fray: I&#39;m thinking someone should add a comment that th=
is is not part of openEmbedded... but provided to help if someone needs it<=
/div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:50:18) fray: if we can review it =
and it&#39;s useful, then we can make it more official..</div><div style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background=
-color:rgb(255,255,255)">
(17:50:36) bluelightning: well maybe, but that leads to the kind of docs we=
 had for OE -classic with a million user suggested &quot;better ways&quot; =
of doing things</div><div style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:13px;background-color:rgb(255,255,255)">
(17:50:42) fray: my only real concern with something like this is that it&#=
39;s external of the project....</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
(17:50:48) bluelightning: right</div><div style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">=
(17:50:50) fray: bluelightning yes, I can appreciate that as well</div><div=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;b=
ackground-color:rgb(255,255,255)">
(17:51:36) RP: I am worried about people adding 101 ways to do things</div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:51:38) fray: lets add this as a d=
iscussion item for the next meeting.. but until then can someone modify the=
 wiki to just clarify this is external of the openembedded project?</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:51:46) bluelightning: yep I&#39;l=
l do that</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:13px;background-color:rgb(255,255,255)">
(17:52:02) RP: The official Yocto Project Quick Start is also growing kind =
of scarily :(</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)">(17:52:24) fray: y=
et another item for &quot;refactoring&quot; =A0;)</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)">(17:52:49) fray: ok.. anything else f=
or today?</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:13px;background-color:rgb(255,255,255)">
(17:52:58) RP: I think the &quot;this page&quot; link on the OE wiki page n=
eeds to be made more proncounced</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>
(17:53:13) RP: then the oe-made-easy thing might be less necessary</div><di=
v style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;=
background-color:rgb(255,255,255)">(17:53:17) RP: fray: no</div><div style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgro=
und-color:rgb(255,255,255)">
(17:53:31) fray: yup..</div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">(17:53:36=
) fray: ok.. calling it.. =A0thanks everyone!</div><div style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(=
255,255,255)">
(17:54:49) RP: fray: thanks</div><div><br></div>-- <br>Jeff Osier-Mixon <a =
href=3D"http://jefro.net/blog" target=3D"_blank">http://jefro.net/blog</a><=
div>Yocto Project Community Manager @Intel <a href=3D"http://yoctoproject.o=
rg" target=3D"_blank">http://yoctoproject.org</a></div>
<br>

--14dae9340dad26a69f04c63ba4bd--
