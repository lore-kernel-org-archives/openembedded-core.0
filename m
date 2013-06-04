Return-Path: <jefro.net@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 036326065C;
	Tue,  4 Jun 2013 17:01:34 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id gw10so485598lab.30
	for <multiple recipients>; Tue, 04 Jun 2013 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=Rlp9oMP1H3idSp35BLl8yN/uqoKf7MeQSgXYcZwBmww=;
	b=rWkWtcnNs/wk8SUWzRqomwn+LlsD/E6irQ8grzN2rkEHh6e1uaE0bLrq4L70LCtB1T
	w5avMmBrLX9fpP36O6RZlsc6aDKaaWbgglg3Xb9MwGuSetnekyrw+uy1d4E2nR0aMMId
	8WLvRww3CJZi8pSHmqk8vky6wPxOAChufBrwL26V5kqq9V9nksjpYp+i9oJS0+0Z/Zjk
	1qa1W+uhsNdl4VaRTmyHvHVTusRRDAXnL0nssN//qDM/Bhmf5NjMvKepFbUlsAg+1eHi
	xo8qxmnCDuj6EcLPnKD7ekQgK5jVdn/axjxDwQaY7XNvUhwbV/mKJgevTGRgZ8fV/4nH
	g//g==
MIME-Version: 1.0
X-Received: by 10.152.18.134 with SMTP id w6mr13427894lad.42.1370365293886;
	Tue, 04 Jun 2013 10:01:33 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.112.63.199 with HTTP; Tue, 4 Jun 2013 10:01:33 -0700 (PDT)
Date: Tue, 4 Jun 2013 10:01:33 -0700
X-Google-Sender-Auth: Q7uxPtzslqLThU2c0zFf7pYn1cc
Message-ID: <CA+YB3rZ44D7daS_zynAvk7+mR_g6-j=YYHEqW_2UbjMLWW28Bw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	tsc <tsc@lists.openembedded.org>
Subject: OE TSC Minutes 21 May 2013
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
X-List-Received-Date: Tue, 04 Jun 2013 17:01:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
21 May 2013

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
    a. oe-classic recipe migration status
    b. oe-core release
    c. meta-oe appends/overlayed recipes RFC
    d. 1.5 planning
    e. python 3
    f. release status notification
5. infrastructure
    a. mailing list moving to YP server
    b. oe.org flooded
6. projects deferred
    a. raise awareness of "janitor" list, QA "bugs"
    b. document whitespace changes to the shell
    c. raise ntp with the Yocto Project [RP]

________________________________________________________________
Agenda & Results

1. pick a chair
khem
___________________________________
2. new issues

a. role of the TSC
(http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/038756.html)
proposal: monthly IRC meeting to replace one of the bi-weekly TSC
meetings, open to all
split the TSC role in two.. have a infrastructure, etc TSC similar to
now.. as well as 'resolve technical conflicts'
=> post RFC on mailing list (RP)

___________________________________
3. lingering issues

___________________________________
4. projects in progress - status

a. oe-classic recipe migration status
need some documentation on right way to synchronize layer usage
-> working group item

b. oe-core release

c. meta-oe appends/overlayed recipes RFC
still remaining: busybox and gst-ffmpeg bbappends, xserver-nodm-init
many recipes (.bbappends) still using PRINC
Warning: PRINC is deprecated, the use of the PR server is recommended, see ...
=> RFC switching wholeheartedly to libav (bluelightning)
=> issue warning, plan to make it an error in 1.5, revisit before release (RP)
=> document migration steps (fray)

d. 1.5 planning
planning mostly complete - bugs will be considered for next cycle at this point
RP on sabbatical

e. python 3
need to start informing people of it -now-
-> loop around to decide python version etc

f. release status notification
=> maintain a wiki page to summarize release goals (jefro)

___________________________________
5. infrastructure

a. mailing list moving to YP server
-> complete

b. oe.org flooded
=> investigate YP hosting, kernel.org mirror (jefro)

___________________________________
6. projects deferred

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

08:57 <+Jefro> Good morning all
08:58 <+khem> Hi all
08:59 <@fray> morning
08:59 < koen> morning
08:59 <+khem> mornings are crazy if you have school going kids
09:00 <+Jefro> khem +1
09:00 <+khem> today I decided not to drive to work
09:00 *** fray has a teenager w/ a migrain on the couch.. :P
09:01 <+khem> koen: you mentioned there was a patch to please gcc 4.8
in beagle kernel
09:01 <+khem> can you send me a pointer ?
09:01 -!- bluelightning ~paul@83.217.123.106 has joined #oe-tsc
09:01 < RP> hi all
09:01 < bluelightning> hi RP, all
09:02 -!- Irssi: #oe-tsc: Total of 6 nicks [1 ops, 0 halfops, 2
voices, 3 normal]
09:02 < koen> khem: check the 3.8.11 log, it's one of the 2 arm patches
09:02 <+khem> so we have all
09:02 < koen> irc on phone right now
09:02 < koen> khem: it's in upstream3.8.11
09:02 < bluelightning> hi koen, khem
09:02 <+Jefro> excellnt.  agenda is here: http://pastebin.com/N8dRp0XR
09:02 < koen> hey bluelightning
09:02 < bluelightning> is fray here?
09:03 <+khem> bluelightning: yes
09:03 < bluelightning> ok, so the gang's all here
09:04 <+Jefro> fray has a teenager at home with a migraine, so his
typing is probably too loud
09:04 <+khem> :)
09:04 <+khem> angry teenagers
09:04 <@fray> sorry.. off dealing with kid and dogs (who ARE being too loud)
09:05 <+Jefro> any volunteers to chair?
09:05 <+khem> I can chair
09:05 <@fray> works for me
09:06 <+khem> ok
09:06 <+khem> any new issues ?
09:06 < RP> sounds good
09:06 < RP> I'm not aware of anything, various things in discussion
and development but nothing I'm aware of that needs TSC attention
09:07 <+khem> shall we continue with the role of TSC in modern OE
world discussion
09:08 <+khem> Do we have some recommendation on IRC meeting proposal
09:08 < RP> I'd hoped the minutes would have been out sooner so the
community might have responded
09:08 < RP> :/
09:09 <+khem> yeah, I see
09:09 <@fray> I just noticed I never saw the May 7 meeting minutes.. d'oh..
09:10 <+Jefro> RP sorry, that was my bug
09:10 <@fray> (I got them but somehow missed htem)
09:10 <+khem> so I guess we should discuss it next time probably we
will have some response
09:10 < RP> I'd like to get more feedback from the OE members
09:11 < bluelightning> I think we'd need to RFC explicitly anyway
09:11 < bluelightning> we can't rely on folks reading the emails to
know they need to comment
09:11 <@fray> ya, an explicit RFC should help there
09:11 <+khem> bluelightning: a separate email proposal
09:11 < RP> So how about someone sends an email to oe-members asking
for comments/fedback?
09:12 < bluelightning> I'm already on the hook for at least one RFC
that I haven't sent, so someone else can take this...
09:12 <+khem> RP: sounds good to me
09:12 <+khem> volunteers ?
09:13 <@fray> I'm willing to send something, but I'm not completely
sure on 'what'
09:14 <+khem> fray: it should be in minutes
09:14 <@fray> I'm sure it is.. but what I don't want is to get it
wrong or misstate it..
09:14 < RP> I guess I can send it if nobody else understands what
we're meant to be sending
09:14 <+khem> RP: sounds fine
09:14 <+khem> AI for you then
09:15 <+khem> moving on
09:15 <+khem> lingering issues
09:15 <@fray> Basically it's split the TSC role in two.. have a
infrastructure, etc TSC similar to now.. as well as 'resolve technical
conflicts'..
09:15 <@fray> and then an IRC meeting (regularly, every two weeks?)
for members/community to work more as a "working" group on issues?
09:16 <@fray> Not on the list, but is this clutter stuff resolved now?
09:16 <+khem> I saw new patches this morning
09:16 < bluelightning> fray: mostly
09:16 <@fray> thats the only 'issue' I remember seeing in the last few
weeks that didn't looks like it was completely resolved
09:16 < bluelightning> fray: though it's a case of making sure we do
better moving forward
09:17 <@fray> ok, that was my understanding of where it was left
(discussion on the list)
09:17 <@fray> oe-core tracks better, layer(s)/bsps further tailor as necessary
09:17 <+khem> so it seems we are ok on lingering issues
09:17 <@fray> yup
09:18 <+khem> 4a recipe migration
09:18 < bluelightning> some more migrated thanks to koen this time
09:18 < bluelightning> as always the wiki page is up-to-date
09:18 <+khem> bluelightning ok and is there some HOWTO migration doc
09:19 < bluelightning> khem: there is yes
09:19 < bluelightning>
http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
09:19 <+khem> nice ok
09:19 < bluelightning> I don't quite understand "need some
documentation on right way to synchronize layer usage" though
09:19 <+khem> oe-core release
09:19 <+khem> is next item on agenda
09:19 < bluelightning> wait a sec ^
09:20 <+khem> bluelightning: I guess this means which layer the recipe goes to ?
09:20 <+khem> when brought in for classic
09:20 < RP> I'm not sure what that means offhand
09:20 <+khem> we need some guide there ?
09:21 <+khem> Jefro must be looking up his notes
09:21 *** Jefro looking
09:22 <+khem> meanwhile anything else on 4a
09:22 <+Jefro> last week minutes:
09:22 <+Jefro> fray: RP, exactly.. I'm doing it locally.. but I havn't
09:22 <+Jefro> seen much documentation around the 'right' way to syncronize this
09:22 <+Jefro> stuff.. that's all
09:22 < koen> hmm
09:22 <+Jefro> RP: fray: I did want to document both combo-layer and
my workflow for 1.4 but ran out of time :(
09:22 < koen> clutter makes me think of something
09:23 < koen> do we have any recommendation for e.g. a layer tohat is
used to test newer version of stuff in oe-core?
09:23 < koen> e.g. meta-clutter
09:23 < koen> but with the understanding that the layer is only for
testing things
09:24 <@fray> koen, I don't have any other then what I've done.
Create a layer, set the README that says it's experimental.. and
limited release..
09:24 <+khem> right now I guess recipes flow from layers in OE-core if
they have wider usage but there is no dedicated layer to keep such
recipes
09:25 <+khem> as bleeding edge
09:25 < bluelightning> it is fine to have git versions of recipes in
OE-Core with D_P -1
09:25 < bluelightning> if that helps
09:25 < bluelightning> for stable versions we just want them in core
unless we're frozen
09:26 <@fray> ya..  I think that's the other part of the expermiental vesions..
09:27 < bluelightning> so... ?
09:27 <@fray> Maybe this needs to be a working group item, if we go that route..
09:27 <@fray> best practices for recipes/layers/etc..  including the
migration aspects (where to put stuff)
09:27 <+khem> seems like
09:28 <+khem> OK now on to 4b
09:28 <+khem> OE core release
09:29 <+khem> anythin that needs discussion w.r.t. OE-Core release ?
09:29 < RP> I'm not sure there is much to talk about here
09:29 < RP> There are various discussions happening but they're on the
mailing lists where they should be?
09:29 <@fray> I see development progressing as I'd have expected it,
if not "quicker"
09:30 <+khem> ok 4c then
09:30 <+khem> meta-oe appends
09:31 <+khem> my busybox bbappend AI is still pending
09:31 < RP> I guess the lastest big question is whether we can drop PRINC
09:31 < RP> I'm tempted just to make it error
09:31 < RP> and take version bumps in the core as they're removed
09:31 <@fray> There are a lot of recipes (.bbappends) that are still
using PRINC..
09:32 <@fray> I'd much prefer a warning at this point..
09:32 <+khem> yes warning is better to begin
09:32 <@fray> (along with that, something that explains to the user
why there is a warning and what to do about it)
09:32 <@fray> we know about the PR servers, but new folks coming in
really don't know anything about it
09:33 <@fray> Warning: PRINC is deprecated, the use of the PR server
is recommended, see ....
09:33 <@fray> something like that
09:33 < RP> well, we can make it a  warning but I would like to try
and kill them off sooner than later
09:33 < bluelightning> fray: we do have a section in the manual about
the PR server and correct PR usage
09:33 < RP> they don't allow integration with other layers easily :(
09:33 < bluelightning> fray: if that's not complete we should extend it
09:33 < RP> yes, PR service is now well documented
09:34 <@fray> I'm not saying it isn't well documented.. what I'm
saying is new users don't necessarily read the documentation and may
not understand what the issue is.. (as well as users who are familiar
with older versions of oe-classic/oe-core)
09:34 <@fray> lead the horse to water...
09:34 < koen> warnings don't really help
09:34 < koen> hard errors do
09:34 < RP> fray: I'm assuming if we make it error, those will get fixed quickly
09:34 < koen> although they are obnoxious
09:34 < RP> We can try a warning
09:35 <@fray> warnings that have an explanation tend to be better then
just a warning..
09:35 <+khem> give it a start with warning
09:35 <@fray> but in the end it's up to the users to pay attention to
it..  we can change that to an error later -- or if the PRINC is
causing so many problems that we're forced to..
09:36 <+khem> and then turn into error after some weeks
09:36 < RP> Right, lets try a warning, then see where we go
09:36 <+khem> yes
09:36 <@fray> my concern for the 1.5 release is people coming from
1.4, loading 1.5 (when it's out) and getting a bunch of errors..
09:36 <@fray> but for now.. warning with a plan to make it an error is
fine with me.. we can reasses when we get to the step of making it an
error
09:37 < bluelightning> fray: there are always required migration
steps; we document these in the manual
09:37 <+khem> fray: too bad, things change
09:37 *** Jefro wonders who takes action item to make this happen
09:37 < RP> I could take another action, seems to be my week :(
09:38 <@fray> tell me where you want the code and I can implement it
09:38 <+khem> heh
09:38 <@fray> as for the manual, 'which' one?
09:38 < RP> fray: there is a section in the yocto project handbook iirc
09:38 <+khem> Yocto Ref manual
09:38 < bluelightning> fray:
http://www.yoctoproject.org/docs/1.4/ref-manual/ref-manual.html#migration
09:38 < RP> fray: and its also referred to in the release notes, right
bluelightning?
09:38 < bluelightning> let's just confirm that
09:39 <@fray> ya, that's part of my concern.. if we're point people to
the YP manual that's fine.. but if we expect them to read it.. I don't
think everyone will even think to look there.. since it's not part of
'oe'
09:39 < bluelightning> yep, it's linked to in the official release notes
09:39 < RP> fray: the message will be free standing on its own
09:39 < RP> (whether its a warning or an error)
09:39 < RP> we have been getting a lot better about user readable messages
09:40 <@fray> yup
09:40 <+khem> Do we want to keep it as warning in 1.5 and turn an error in 1.6 ?
09:41 <@fray> lets plan warning now (1.5 dev).. revist before 1.5
release with a preliminary plan to make it an error..
09:41 < RP> lets see how things work out...
09:41 <@fray> if not in 1.5, then it will be an error in 1.6
09:41 <+khem> ok
09:42 <+khem> if all layers clean out timely that would be ideal
09:42 <+Jefro> time check 15 mins left
09:42 <+khem> bluelightning: any development on libav
09:42 < bluelightning> khem: no, haven't sent the RFC yet
09:42 < bluelightning> will do this week
09:43 <+khem> ok
09:43 <+khem> moving to 4d
09:43 <+khem> 1.5 planning
09:44 < RP> I think that is done at this point?
09:44 <+khem> do we need to gather more requirements
09:44 <+khem> ok
09:44 < RP> We're into execution mode
09:44 <+khem> 4e
09:44 < RP> We'll always collect ideas into the bugzilla but its
getting late to start adding extra rfeatures to the release
09:44 <+khem> ok
09:45 <+khem> python3
09:45 < RP> I've been concentrating on reworking cooker in bitbake at the moment
09:45 < RP> I pushed some of the simpler python 3 issues
09:45 <+khem> RP: ok which version are you using
09:45 <@fray> does it still look like it'll python 3.? or python 2.6+?
09:45 < RP> no decision at this point
09:45 < RP> hob will be an issue though as its gtk2 which means python 2.x
09:45 <+khem> I have posted my python3 tree
09:45 <+khem> in parallel
09:46 < RP> it may be hob remains python 2 but we switch the server to 3
09:46 < RP> khem: yes, that helps, I want to try that out
09:46 < RP> khem: thanks!
09:46 <+khem> RP: python3-native is 3.3.2 at
09:46 < RP> khem: sounds good
09:47 <+khem> RP: I am trying out stuff with it. but would certainly
take inputs and feedback
09:47 <+khem> python 3.4 comes out next year so if we have to consider
it this year then we have to stay with 3.3.x
09:48 < RP> khem: will loop around and get to that soon I hope
09:48 <+khem> RP: ok
09:48 <+khem> moving to 4f
09:48 < RP> khem: why shouldn't we upgrade with 3.4 comes out?
09:49 <+khem> RP: its somewhere around summer next year
09:49 <+khem> 3.3 has the best chance for migration from 2.x
09:50 <+khem> older 3.x are not as good
09:50 < RP> khem: agreed
09:50 <+khem> alright movin on 4f
09:50 <+khem> release status notifications
09:50 <+khem> Jefro: ?
09:51 -!- Jefro1 ~jefro@50-0-152-82.dedicated.static.sonic.net has
joined #oe-tsc
09:51 <+khem> Jefro1: release status notifications is your AI
09:52 < Jefro1> khem ok, thanks. could someone send me transcript of
the last 10 minutes? my net is bouncing
09:52 <+khem> well movin on to infra
09:52 <+khem> 5a mailing lists
09:52 < RP> they moved :)
09:52 < Jefro1> I have some state on that
09:52 < bluelightning> Michael has moved the mailing lists over to YP
infrastructure
09:52 <+khem> yay
09:53 < Jefro1> :) looks like we all do
09:53 < bluelightning> he is watching for issues, let him know if you see any
09:53 <+khem> is oe.org still flooded ?
09:53 < bluelightning> is anyone measuring?
09:53 < RP> I haven't noticed
09:53 <+khem> ok
09:54 -!- Jefro ~jefro@50-0-152-82.dedicated.static.sonic.net has quit
[Ping timeout: 264 seconds]
09:54 <+khem> have people seen gitlab ?
09:54 <+khem> gitlab is github for private repos
09:54 <+khem> its pretty nice
09:54 <@fray> commercial I take it/
09:55 <@fray> or is it locally deployed software?
09:55 <+khem> no its not commerical
09:55 <+khem> https://github.com/gitlabhq
09:55 < RP> I'm afraid I need to leave at 6 :/
09:55 < bluelightning> yeah me too
09:55 <+khem> do we need to discuss anything deferred projects
09:56 <@fray> I don't think os
09:56 <+khem>  document whitespace changes to the shell
09:56 *** Jefro1 suggests deferred projets wait on results of the
working group RFP
09:57 <+khem> ok good idea
09:57 <+khem> if not then we have 3 mins for sundry items
09:57 <+khem> we are done with agenda
09:57 <+khem> thanks everyone
09:57 < bluelightning> cheers all
09:57 < Jefro1> could someone send me a transcript for for the last 20
mins or so? my net connection was bouncing
09:58 <+khem> Jefro1: I will
09:58 < Jefro1> khem thanks
09:58 <+khem> bluelightning: I am running world builds with meta-opie
09:58 <@fray> thanks all!
09:58 <+khem> bluelightning: and many missing deps
09:59 <+khem> thanks all


--
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org

