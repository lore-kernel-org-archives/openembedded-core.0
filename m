Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D27F60897;
	Tue, 21 May 2013 16:13:28 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id o10so989399lbi.22
	for <multiple recipients>; Tue, 21 May 2013 09:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=NxWtOfo46Sy4rx5U1mpSto3CZE9qicms2G10b85oHTc=;
	b=Uul1xqKYanhWp7cj+lUnOKTyZGdXekc3kwEZ8dAs7exB7DF//JMqzVS3/ji6XVAwpu
	pExQ+ntWWSXhPsAe5fvKORxCG4Oq/9GiRREYwCon8H4bfckAd/68DBimdLtKxpD0EDEX
	qqUhNAuOlG2jXos0yWo//OTOJ7UjowHu3hh1wLw7aPMLHiA327EaWSlZv3iTILyaaLgv
	IeqYeFJK1oGvb+A8B+bpJOCjINEL/ZkGeArF+JXsc/pIiKE1VZ7YAm1N/8vZSt8I9Vfv
	5eZzHmJyZGnGHAqpsNGr5txlWjKbQeqKGsumN6ZoXxqAD0OmnA3nqeoX0VXiD5XspnYd
	gPZA==
MIME-Version: 1.0
X-Received: by 10.112.171.169 with SMTP id av9mr1941155lbc.130.1369152808625; 
	Tue, 21 May 2013 09:13:28 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.112.180.164 with HTTP; Tue, 21 May 2013 09:13:28 -0700 (PDT)
Date: Tue, 21 May 2013 09:13:28 -0700
X-Google-Sender-Auth: 4JJ2L4IGYjXNpWYqxU6K4pZHM48
Message-ID: <CA+YB3rbBLnY5gruQZ3V=dwys0zYv7=rPq4DsD7SM+4qt2j34KA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 23 April 2013
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2013 16:13:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
23 April 2013

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
    a. oe-classic recipe migration status
    b. summarize release goals
4. projects in progress - status
    a. oe-core release
    b. infrastructure
    c. systemd into master - still in progress
    d. mailing list outage
    e. meta-oe appends/overlayed recipes RFC
    f. 1.5 planning
5. projects deferred

________________________________________________________________
Agenda & Results

1. pick a chair
fray
___________________________________
2. new issues

___________________________________
3. lingering issues

b. oe-classic recipe migration status

c. systemd merge unhappiness
=> maintain a wiki page to summarize release goals (jefro)
=> no status emails yet but plan to (RP)

d. oe.org flooded
    refs to oe.org git should point to github
=> khem to fix the oe wiki and reminder to ml
    possible to move server at some point?
=> jefro to investigate YP hosting, kernel.org mirror

___________________________________
4. projects in progress - status

a. oe-core release
autobuilder issues
qemuimagetest will change significantly in 1.5
ptest a good addition
much more to integrate in 1.5

b. infrastructure
see 4d

c. systemd into master - done, drop from future agendas

d. mailing list outage
mailing list moving to YP server, in progress
list addresses will not change

e. meta-oe appends/overlayed recipes RFC
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043925.html
no avr32 support in public layers
=> paul has patches to remove bbappends, pending discussion on ml
everything uncontested has been sent for review
http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-February/043964.html
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

(8:58:08 AM) mode (+v Jefro) by ChanServ
(8:58:18 AM) koen: good morning all
(8:58:37 AM) Jefro: good morning
(8:59:04 AM) RP: Hi everyone
(8:59:32 AM) RP: I suspect we might not get Paul today
(8:59:59 AM) Jefro: I would expect not
(9:00:07 AM) Jefro: any new issues to put on the agenda?
(9:00:42 AM) ***fray is fried, between snow storms, house stuff and work...
(9:00:53 AM) fray: so no new items from me
(9:00:54 AM) ***RP is also fried, due to the release
(9:01:23 AM) RP: Jefro: link to the agenda?
(9:03:15 AM) Jefro: agenda in about 2 seconds
(9:03:51 AM) Jefro: finally: http://pastebin.com/ZTtdqWRm
(9:05:47 AM) Jefro: any new issues?
(9:05:49 AM) fray: ok
(9:06:47 AM) RP: nothing new from me
(9:06:54 AM) RP: Who is chairing?
(9:07:03 AM) ***RP did it recently so its not me :)
(9:08:24 AM) fray: I can
(9:09:27 AM) fray: ok?
(9:09:35 AM) Jefro: sounds good to me
(9:09:44 AM) fray: 2. any (additional) new issues?
(9:10:18 AM) fray: 3. lingering issues
(9:10:29 AM) fray: a. oe-classic migration status.. (no Paul, so no status?)
(9:10:58 AM) RP: I've still not done the perl recipes
(9:11:11 AM) RP: I have a small issue of figuring out which ones
merged into perl itself
(9:11:28 AM) RP: I think progress is being made slowly in a variety of areas
(9:12:18 AM) fray: b, then?  release goals..
(9:12:19 AM) fray: I saw the first email for the 1.5 bitbake changes go out..
(9:12:53 AM) RP: Yes, we're looking at 1.5 planning
(9:12:55 AM) koen: I loved the "if we split bitbake into a client and
server" response
(9:12:59 AM) koen: that was done years ago :)
(9:13:17 AM) RP: koen: indeed
(9:13:31 AM) RP: The email was to give people the high level idea
(9:13:39 AM) RP: the details are still tbd
(9:14:16 AM) RP: As for the current release, 1.4 is beyond the point
it can take changes without slipping now
(9:14:36 AM) RP: I've seen there are some issues but nothing I believe
it worth slipping the release for
(9:15:00 AM) fray: I'm comfortable with a release and known bug list
(9:15:04 AM) RP: As always I'd encourage people to use the bugzilla,
we do work closely with it
(9:15:19 AM) RP: (both for 1.4 issues and 1.5)
(9:15:58 AM) koen: the postinst situation is a lot better now, the
mixed gconf/gsettings/gtk-iconcache now run completely on the host
(9:16:28 AM) koen: there's still a problem with run-postinst.service, though
(9:17:14 AM) fray: 3 e then?  (not sure where c an d went)
(9:17:35 AM) RP: koen: right, not there with that one yet but we'll
figure it out...
(9:18:12 AM) koen: I changed Timeoutsec to 600 so it will timeout
after 10 minutes
(9:18:21 AM) Jefro: fray they were removed because of austerity
(9:18:35 AM) fray: One comment on 3e -- YP hosting of oe.org.. I'm not
sure that is an actual solution.. as I've been noticing
git.yoctoproject.org getting slower over time..
(9:18:48 AM) fray: adding the load of oe.org may not work to either
projects advantage.. :(
(9:19:18 AM) RP: Sorry, I've been looking at the wrong items :/
(9:19:20 AM) Jefro: fray it might be possible to use the addition of
oe as impetus to beef up the servers &/| bandwidth
(9:19:34 AM) Jefro: or it might be good to find a different solution
(9:19:57 AM) RP: fray: have you mentioned that to Michael?
(9:20:01 AM) fray: Jefro ya.. I think it would have to be.. -if-
git.yp... was an active mirror (or irigin)
(9:20:16 AM) fray: I did..  he traced it down to high load, mirroring
releases, etc..
(9:20:32 AM) RP: fray: ah, the mirroring is a killer on bandwidth
(9:20:43 AM) fray: it's still acceptable performance, but it's
definitely getting slower then when this project was new.. ;)
(9:20:52 AM) RP: fray: is it back to normal now?
(9:20:59 AM) fray: havn't looked today..
(9:21:46 AM) RP: For 3b, I will start the status emails for 1.5, just
trying to get over the release stress atm
(9:22:04 AM) fray: yup.. I think the bitbake one going out first was a
good start
(9:23:02 AM) fray: current download speed is approx 200-300 KiB/s for
me..  my machine can normally get 1 MiB/s down at max
(9:23:12 AM) fray: like I said, acceptable.. but slower then it used to be..
(9:23:30 AM) fray: on to 4?
(9:24:10 AM) khem: hi all
(9:24:10 AM) RP: fray: ok with me
(9:24:14 AM) RP: hi khem
(9:24:15 AM) koen: we covered 4a a bit already :)
(9:24:23 AM) RP: I talked about 1.4 above
(9:24:28 AM) fray: 4a oe-core release status.. anything to add?
(9:24:34 AM) fray: hey khem
(9:24:49 AM) RP: I don't have much to add. I'm fried basically :/
(9:24:56 AM) khem: connectiions in new buildings are troublesome
(9:24:59 AM) fray: yup.. we can come back to that next time..
(9:25:03 AM) khem: and we are a networking company :(
(9:25:11 AM) Jefro: I have khem on cell - he is having network issues at work
(9:25:14 AM) Jefro: ah, there he is
(9:25:17 AM) fray: anything new on infrastructure issue(s) other then
mailing list (or git)?
(9:25:18 AM) khem: I have to drop at 9:30
(9:25:38 AM) fray: khem hopefully we'll be done soon..
(9:25:42 AM) RP: khem: anything you want to talk about then?
(9:25:44 AM) khem: I met with halstead and tom king
(9:26:20 AM) khem: so right now Phil is wating on TSCs direction for
extracting the ml archives from ltg
(9:26:36 AM) khem: and I think Michael said he will work on it this week
(9:26:41 AM) fray: what direction do we need to do (if any)?
(9:26:42 AM) khem: if he has archives
(9:27:02 AM) khem: I think TSC is ok with him providing the archives or not
(9:27:11 AM) RP: khem: I say we are
(9:27:14 AM) fray: I don't have any problem with it
(9:27:47 AM) RP: The ml issues have hurt project productivity recently :(
(9:28:22 AM) RP: do we know where they're planning to migrate to?
(9:28:25 AM) khem: OK
(9:29:36 AM) Jefro: RP migration to YP servers
(9:29:53 AM) RP: Jefro: ok
(9:30:41 AM) fray: anything else on infrastructure before khem has to go?
(9:31:19 AM) Jefro: khem - are you going to talk to pb? anything you
need from me?
(9:34:16 AM) khem: Jefro: I will take the TSC message
(9:34:25 AM) Jefro: khem ok
(9:34:26 AM) fray: ok..
(9:34:26 AM) khem: and connvey to him
(9:35:18 AM) fray: 4c then?  systemd into master..  Can we consider
this 'done' and now at the point of in (and at the point of
maintenance?)
(9:35:49 AM) RP: yes, I think we should consider that "done" and into
bugfixing/enhancement like the rest of the system
(9:36:22 AM) khem: pardon me
(9:36:38 AM) khem: I am going for a yocto brain was
(9:36:49 AM) RP: khem: ?!
(9:36:58 AM) fray: ok.. so drop 4c from future status..
(9:36:59 AM) khem: oh work :)
(9:37:07 AM) fray: 4d we already covered (mailing list)
(9:37:11 AM) khem: I have to talk there
(9:37:18 AM) khem: so I will leave now
(9:37:28 AM) fray: 4e -- meta-oe appends/overlayed recipes RFC... I
suggest we postpone until Paul is around
(9:37:30 AM) fray: ok
(9:37:34 AM) RP: khem: ok, have fun! ;-)
(9:37:37 AM) Jefro: I totally want to know what a "yocto brain was" might be
(9:37:41 AM) khem: yeah I will try
(9:37:44 AM) RP: fray: yes, progress is being made there though
(9:38:06 AM) RP: Jefro: I suspect it was meant t be wash
(9:38:13 AM) ***fray was guessing 'wash' as well..
(9:38:15 AM) RP: Jefro: with Khem doing the washing ;-)
(9:39:00 AM) RP: For 4f did we get a bugzilla entry?
(9:39:06 AM) RP: and what was the proposal again? :)
(9:39:16 AM) ***fray was going to ask the same thing
(9:39:28 AM) RP: For 5), no update afaik
(9:39:39 AM) RP: I think it was to more widely adopt PACKAGECONFIG?
(9:39:52 AM) fray: could be.. and I'm all in favor of that
(9:40:10 AM) fray: FYI 4a/4c  I'm going to push that out another
couple weeks till the 1.4 dust settles..
(9:40:17 AM) fray: but not much further
(9:42:10 AM) fray: ok.. anything else?
(9:42:30 AM) RP: nothing I can think of
(9:42:40 AM) fray: adjourned?
(9:43:08 AM) Jefro: w00t
(9:43:19 AM) fray: :)
(9:43:40 AM) Jefro: I'll send out minutes as soon as everyone is able
to ack the last ones I sent out... last night
(9:43:48 AM) fray: ok

--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

