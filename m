Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1SSDJs-0003h1-UU; Wed, 09 May 2012 22:17:09 +0200
Received: by yhjj56 with SMTP id j56so753163yhj.6
	for <multiple recipients>; Wed, 09 May 2012 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=kwXJERDRhLsra1QxmSn7yq4/gseZ0y1OzxtK6fXM/6g=;
	b=gRnS4wqZ6f5Eh7eq+nLPMWTHvezRdwUx79ylztzOLSr5UdGPu1TZDuSD+sLOqIi64C
	hkCIna4Bu9K4MCzZvaR+l2chFvCmIzreCFtah3p2uozO5URDLkuclB7YuTbDCMU3AHm4
	GTjuwpQgKuN1igEALPQUfr/A4WRWCTs7x6fuIfU5BpHudlR4TL3+uzQKleWjBOVbyBs7
	XPdgtIxl/m78h4ENTosMVnvSKCoOQMYBsTtDDxM4OQiZnBqsXTjLlA3ncOwW8XUdkj9I
	w9fyQibwzKVMvUCfB7WzgoryF17joRoQq14ESHHGPTvF2shiPm6dVMIEk0Q7VKcY0TPO
	WoWg==
MIME-Version: 1.0
Received: by 10.50.182.133 with SMTP id ee5mr808138igc.63.1336594034932; Wed,
	09 May 2012 13:07:14 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.50.92.7 with HTTP; Wed, 9 May 2012 13:07:14 -0700 (PDT)
Date: Wed, 9 May 2012 13:07:14 -0700
X-Google-Sender-Auth: YKzpv5ODuKS4VSYeEyJYwJi3i1A
Message-ID: <CA+YB3rb7vfWy7KfeK7qPYPJcgXKahUF-RzCr2-YF6-pusEsOaQ@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: tsc <tsc@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Subject: MINUTES: OE TSC 24-April 2012
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
X-List-Received-Date: Wed, 09 May 2012 20:17:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
24 April 2012

Attending:
 Richard Purdie (RP)
 Paul Eggleton (bluelightning)
 Mark Hatle (fray)
 Tom Rini (Tartarus)

Apologies:
 Khem (khem)

Minutes: Jefro (Jefro)

________________________________________________
Agenda & Summary

1. pick a chair
   RP

2. lingering issues

 a. raise awareness of "janitor" list, QA "bugs"
  => fray to start publicity about "janitor" bugs
  look at promoting after 1.2

3. new issues

 a. discuss communication with OE community about
          release-oriented phases
   => fray willing to manage page as TSC activity
   => RP to send email updates, TSC to handle in future
   => future agenda: document release process
   =>  fray will stay in sync with Dave/RP/Song & create wiki when appropriate
   Song sent out email, putting out docs re processes, proceeding reasonably

 b. mips/mips32 tuning issue
   =>  fray will summarize to list with possible options & ask for comments
   done - resolved with a workaround by email

 c. Yocto entering 1.3 planning phase
 => spell out on oe-core, oe-devel, yocto mailing lists (RP)

4. status

 a. oe-core release
   more quality issues than expected, bug work started too late
   next time make m4 bugfix only
   release name 2012-1
   update-alternatives "a bit of a mess", discuss on list

 b. elections
   call for candidates out, no replies yet - outreach possible

 c. infrastructure
   no news is good news
   query re new testing hardware, deferred to next meeting

key:
=> action item (indented = older or remaining from prior meetings)
-> note from prior meetings

________________________________________________
Raw Transcript

(8:56:55 AM) Jefro: Hi all - trying something new today, agenda in a
collaborative workspace: http://collabedit.com/jjn5r
(9:00:14 AM) RP: Jefro: looks interesting
(9:00:52 AM) RP: bluelightning: here?
(9:01:01 AM) bluelightning: RP: yep
(9:01:03 AM) bluelightning: hi all
(9:02:05 AM) RP: missing khem...
(9:02:05 AM) Jefro: fray & Tartarus here?
(9:02:11 AM) fray: :)
(9:02:12 AM) Tartarus: pong
(9:02:22 AM) Jefro: yep, everyone but khem - I have pinged him
(9:03:28 AM) RP: ok, we can give it a few minutes, then start
(9:03:48 AM) RP: I can chair for a change, I don't think I've done it
for a while?
(9:04:02 AM) Jefro: ok
(9:04:57 AM) Jefro: feel free to add any new issues to the collabedit
page, or let me know & I'll add them
(9:08:04 AM) RP: ok, might as well start
(9:08:45 AM) RP: So on the janitor issue, I think that is ongoing
(9:08:57 AM) RP: Once 1.2 is out we can really start looking at
promotion of that
(9:09:06 AM) fray: ypu
(9:09:08 AM) fray: 'er.. yup
(9:09:17 AM) RP: Moving on to 3a, Song did send out emails
(9:09:36 AM) RP: he is also putting out documentation about processes
and so forth
(9:09:53 AM) RP: So I think discussion is ongoing there and proceeding
reasonably
(9:10:02 AM) Tartarus: llok
(9:10:04 AM) RP: I'm not sure there is any specific action that needs
taking at this point?
(9:10:26 AM) bluelightning: not right now, just keep in mind for the
next dev cycle I think
(9:10:45 AM) RP: yes, worth keeping on the agenda to provoke us to
action at the right time
(9:10:54 AM) RP: I suppose its worth mentioning Yocto entering 1.3
planning phase
(9:11:02 AM) fray: ya.. keep it open so I can manager the wiki stuff
when 1.2 is wrapped
(9:11:03 AM) RP: It might be worth spelling this out on the mailing list?
(9:11:06 AM) fray: (next week?)
(9:11:35 AM) RP: hmm, I skipped to 3c unintentionally :)
(9:11:47 AM) RP: I did send out an email previously, I will perhaps
reply to that and remind people
(9:11:49 AM) ***Jefro just added it
(9:11:59 AM) Tartarus: So
(9:12:02 AM) Tartarus: "the" mailing list?
(9:12:09 AM) RP: Something on OE-Core would be good
(9:12:10 AM) Tartarus: I think it needs to be a few, to make sure all
the folks see it
(9:12:15 AM) Tartarus: oe-core, oe-devel
(9:12:19 AM) fray: 3b is dealt with..
(9:12:21 AM) Tartarus: and the yocto list
(9:12:34 AM) RP: Tartarus: ok, I'll ensure it goes to those
(9:12:47 AM) fray: result of 3b was an email.. only one person had an
issue.. and it was resolved with a workaround....
(9:13:04 AM) ***RP agrees 3b was resolved. I don't thing Andreas liked
the decision :(
(9:13:05 AM) fray: not the resolution the person really wanted, but
based on demand was the right choice at the time IMHO
(9:13:11 AM) fray: yup
(9:13:46 AM) RP: I think it was the right decision and we'll figure
out ways forward from here
(9:14:37 AM) RP: Any further discussion on 3)?
(9:15:09 AM) RP: ok, let me switch 4 around
(9:15:24 AM) RP: :)
(9:15:28 AM) RP: OE-Core release
(9:15:42 AM) fray: quality issues resolving themselves, or is this
still an ongoing item?
(9:15:46 AM) RP: This has been rather hard the past couple of weeks
(9:16:09 AM) RP: well, there are a lot of more minor issues which
whilst we have fixes aren't going to make the release
(9:16:13 AM) fray: IMHO we needed the freeze and stabilize.. there
were a lot more quality issues then I realized...
(9:16:27 AM) RP: The reason is one of destabilisation risk
(9:16:36 AM) fray: should be noted that Saul is stagging post 1.2 work
already.. and I've been tracking it.. things seem good in that branch
(9:16:51 AM) RP: We've made good progress but I think next time, the
M4 milestone just needs to be bugfix only
(9:16:57 AM) RP: people started too late on bugs
(9:17:09 AM) bluelightning: yes :(
(9:17:29 AM) RP: So I think we're in a reasonable place to release but
I'm not happy about how we got there
(9:17:34 AM) bluelightning: there were also some holes either in our
QA or us looking at the QA reports
(9:17:52 AM) RP: I've been working all hours trying to fix the most
critical issues including over the weekends :(
(9:18:07 AM) RP: fc17 testing happened too late for example too
(9:18:18 AM) RP: So the status is we have a "denzil" release branch
(9:18:26 AM) fray: holes in the QA I assume will be addressed.. we're
pretty good at identifying the hole.. lets see if tests can get
added..
(9:18:27 AM) RP: I put my argument for the naming in an email
(9:18:53 AM) RP: There is an open question of the release version for OE-Core
(9:19:02 AM) RP: we can just tag it as 2012-1
(9:19:46 AM) RP: That is what I'm thinking of doing in the absence of
other arguments
(9:20:13 AM) RP: For work going forward, I've pulled things into
master-next and am trying to stage pending changes there
(9:20:20 AM) fray: 2012-1 is what i would expect
(9:20:25 AM) RP: fray: We need to talk about the update-alternatives stuff btw
(9:20:32 AM) fray: yup.. it's a bit of a mess..
(9:20:43 AM) fray: do we want to discuss it here, or the list?
(9:20:45 AM) RP: fray: I'm just holding off until I have the time to
deal with it
(9:20:55 AM) RP: fray: list and not now, just indicating why its not all there
(9:21:09 AM) RP: I'm going to continue to queue on master-next for a
while longer
(9:21:31 AM) fray: that is fine..
(9:21:34 AM) RP: this gives some time to test it properly and also
give me a little bit of a break
(9:21:41 AM) fray: there are still anohter 8 packages that need to be
fixed (if I remember correctly)
(9:21:56 AM) RP: I'll also probably start queueing some bits on
denzil-next until release
(9:21:59 AM) fray: also i want to rework the update-alternatives to
work more like the useradd class.. (allow subpackage stuff and some
more complicated settings)
(9:22:08 AM) fray: that should get rid of all of the manual
update-alternative cases..
(9:22:23 AM) RP: fray: right, I think I just want to fix the class
properly in one go
(9:22:40 AM) RP: any comments on OE-Core status?
(9:23:08 AM) RP: next, elections
(9:23:22 AM) RP: There is a call for candidates out and I've not seen
any replies
(9:23:35 AM) RP: Should we start worrying?
(9:23:44 AM) fray: I have not either..
(9:23:45 AM) Tartarus: Not yet, no
(9:23:52 AM) bluelightning: Tartarus: are you standing again?
(9:23:57 AM) RP: Is there anyone we'd approach and suggest they submit
their candidacy ?
(9:24:02 AM) Tartarus: I'm thinking it over
(9:24:10 AM) Tartarus: But if I don't I expect at least one person to step up
(9:24:18 AM) bluelightning: RP: what about Phil Blundell?
(9:24:50 AM) RP: bluelightning: Phil is a good candidate and has been
on the TSC before but had time issues. I don't know if that has
changed
(9:24:56 AM) bluelightning: ok
(9:25:10 AM) RP: I also wondered if we should ping Stefan ?
(9:25:13 AM) ***Jefro interrupts briefly - just heard from khem, he
can't join us
(9:25:35 AM) RP: Jefro: ok, thanks :/
(9:25:47 AM) Tartarus: Bah, need to see why mutt didn't see the
oe-members email in imap, too
(9:26:04 AM) RP: bluelightning: I think if Phil wanted to stand he'd
have done so tbh
(9:26:17 AM) RP: he does read a lot of the emails :)
(9:26:18 AM) bluelightning: RP: yeah, we can't volunteer people...
(9:26:44 AM) RP: anyhow, I'd leave people with the thought this may be
worth socialising with people
(9:27:16 AM) fray: I agree.. I don't want to fall short on the number in the TSC
(9:27:28 AM) RP: For the infrastructure topic, I don't have anything
(9:27:49 AM) fray: nothing here
(9:27:50 AM) bluelightning: any news on the testing hardware that Tom
had received / was going to set up?
(9:27:55 AM) bluelightning: (Tom King)
(9:28:12 AM) RP: bluelightning: we really need to ask Khem
(9:28:20 AM) Jefro: I may be able to ask him - 1 sec
(9:28:59 AM) Jefro: Khem is having trrouble connecting to freenode,
but I have him on google chat
(9:29:33 AM) Jefro: may have lost him there as well
(9:29:34 AM) bluelightning: there's always the web gateway...
(9:29:43 AM) bluelightning: I guess he is on a cell connection?
(9:29:45 AM) Jefro: yep
(9:31:00 AM) RP: I suggest we defer that to the next meeting
(9:31:05 AM) RP: Any other business?
(9:31:22 AM) fray: nothing here
(9:31:23 AM) bluelightning: none here
(9:31:42 AM) Tartarus: I'm good
(9:31:53 AM) RP: In which case I'll close the meeting at near enough
half time, thanks all! :)


-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


