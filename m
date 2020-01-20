Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBAE7FD1C;
	Mon, 20 Jan 2020 23:11:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 15:11:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,343,1574150400"; d="scan'208";a="258849182"
Received: from szainuri-mobl2.gar.corp.intel.com (HELO shodan.localnet)
	([10.249.75.99])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 15:11:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: tsc@openembedded.org
Date: Tue, 21 Jan 2020 12:11:08 +1300
Message-ID: <1769537.tO7GpK17k8@shodan>
Organization: Intel Corporation
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: OpenEmbedded TSC Meeting Minutes 2020-01-21
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
X-List-Received-Date: Mon, 20 Jan 2020 23:11:16 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

OpenEmbedded Technical Steering Committee (TSC) Meeting Minutes 2020-01-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Meeting was held in #oe-tsc on Freenode; channel access public.

Present:
=2D Richard Purdie (RP)
=2D Joshua Watt (JPEW)
=2D Martin Jansa (JaMa)
=2D Bruce Ashfield (zeddii)
=2D Paul Eggleton (bluelightning)

Summary:
* Need ideas on how to encourage contributions - better recognition perhaps?
  - Bug triage participation dwindling
  - Social media?
  - List contributors for each release in (YP) release notes - hopefully au=
tomated
* Website needs a refresh - make it clear to visitors that the project is a=
ctive
  - Wiki suffers from barrier to account registration [established due to s=
pam]
  - Wiki single sign-on possible?


=46ull meeting log
=2D---------------

[11:00] <RP> JaMa, JPEW, zeddii, bluelightning: We have a meeting now, righ=
t?
[11:00] <JPEW> correct
[11:00] <JPEW> Is someone recording
[11:00] <bluelightning> I am
[11:00] <bluelightning> (recording)
[11:01] * JPEW checks the topic list on the wiki
[11:01] <JPEW> Nothing on the Wiki, does anyone have anything they want to =
talk about this month?
[11:02] * RP feels there was something but can't put his finger on it
[11:02] * JaMa is here
[11:02] * RP felt he discussed someone putting something onto the wiki
[11:03] <JPEW> meta-gplv2, or meta-python2 related perhaps?
[11:03] <RP> JPEW: it was before that
[11:03] <RP> there is the question of meta-gplv2 testing but that is YP TSC=
 really :/
[11:04] <JPEW> That's fine, I just remember see it.
[11:04] <JPEW> *seeing it. Can't type today
[11:05] * JPEW looks over last months minutes
[11:06] <RP> The removal of py2 from core may arguably be a few days premat=
ure but does at least focus attention...
[11:06] <RP> Ah, I think I do remember something
[11:07] <RP> One topic I think the TSC needs to think about is recognition =
of people in the community stepping up and doing things
[11:07] <RP> We've disbanded YP SWAT and we're seeing bug triage contributi=
ons dwindling.
[11:08] <RP> Is there some way we could encourage new people to get involve=
d and some way to recognise contributions?
[11:08] <RP> I don't have a specific proposal, if I had I'd have already do=
ne it :/
[11:09] <JaMa> I was trying to find people to help with meta-oe maintenance=
 for 5 years and failed badly, so I clearly don't have any good idea for th=
is :/
[11:09] <RP> Could the wider OE community help in any of these areas since =
YP is struggling?
[11:09] <RP> JaMa: Is there any way the project could have recognised your =
work better?
[11:12] <JPEW> Hmm... that's a tricky one.
[11:12] <JaMa> I don't think it's an issue of the project, e.g. maintaining=
 whole meta-oe is just too much work for single person to do in spare free =
time (and splitting the work also isn't very easy to keep the builds effici=
ent etc)
[11:13] <RP> JaMa: right, we have this problem in a number of places :/
[11:13] <JaMa> now when I'm not expected to do it (big thanks to Armin and =
now Khem), it's much more fun to help with recipes which interest me (at le=
ast a bit)
[11:14] <RP> JaMa: that is something at least ;)
[11:14] <RP> I feel OE-Core has been lucky but is rapidly heading into trou=
bled waters :/
[11:14] <RP> I may have time to spend on it but I've many things I need to =
do and OE-Core is also hard work for a single person
[11:15] <JaMa> maybe we have a lot of recipes which really don't interest a=
nyone
[11:15] <JPEW> Is the idea to highlight people actually maintain these thin=
gs?
[11:16] <JPEW> i.e. perhaps most users don't have that in mind when they us=
e it from day to day?
[11:16] <RP> JPEW: well, triaging autobuilder failures isn't glamerous work=
=2E If someone did a week of that now and again, is there something we shou=
ld do to show we appreciate that work?
[11:16] <RP> fixing bugs may be an easier one as if there is a bug ID in a =
commit we could do something with that?
[11:17] <JaMa> like giving some achievement badges on linked in? :)
[11:17] <RP> JaMa: I don't know. I'm thinking out loud
[11:17] <JPEW> Right. I don't generating the content is the hard part, it's=
 the delivery mechanism
[11:18] <JPEW> LinkedIn, E-mail, twitter, etc.
[11:18] <JaMa> I think it wouldn't motivate me, but it might help to get at=
tention from people who just need few more points in their CV
[11:19] <RP> Put another way, is there a way we could attract new controbut=
ors?
[11:19] <RP> We may be able to for example list all the people who contribu=
ted to a release in the release notes?
[11:19] <bluelightning> RP: yes, a lot of projects do that, I think it woul=
d be a good thing
[11:19] <bluelightning> and pretty easy to do
[11:19] <JPEW> I agree
[11:20] <JaMa> maybe we can ask Jozef to set some challenges during the twi=
tch stream and then announce the winners in the next one?
[11:21] <JaMa> but a list of contributors is definitely easier to implement=
 :)
[11:21] <JPEW> I think if we do that someone would need to volunteer to adm=
inister it... that can very easily get to take a lot of time, and I'm sure =
making his content takes a lot in first place
[11:21] <RP> bluelightning: I think we probably should do it and make it an=
 automated part of the process if we can
[11:22] <JPEW> Who admins the OE twitter feed?
[11:22] <RP> Maybe highlighting a couple of key bugs, a newcommer and a cha=
llenging one?
[11:22] <JPEW> ^^ where
[11:22] <RP> JPEW: I think Jon was looking at it?
[11:23] <RP> JPEW: Joesf? Weekly Status report?
[11:23] <RP> my spelling is dreadful today :(
[11:23] <RP> well, more typing :/
[11:24] <JPEW> Jon Mason?
[11:24] <RP> JPEW: yes, as in OE board
[11:27] <RP> Ok, this discussion isn't going anywhere. Could I ask people t=
ry and give this some serious thought though please?
[11:28] <RP> I do think we need to try and find some new ways of doing thin=
gs...
[11:28] <JPEW> Yes, I think some thought would be good. I'll put it on the =
topic for next meeting to remind us
[11:29] <JPEW> I got distracted scrolling through the OE twitter feed. It's=
 actually pretty good... it has an unfortunately small number of followers =
though
[11:31] <JPEW> Any other topics?
[11:31] <bluelightning> anyone have any thoughts on the OE website?
[11:32] <bluelightning> there was an aborted attempt to redo it a few years=
 ago
[11:32] <RP> bluelightning: probably needs some TLC :/
[11:32] <bluelightning> I hate to think people come to it and think the pro=
ject is dead
[11:32] <RP> finding people interested in doing that kind of thing is hard
[11:32] * bluelightning will volunteer
[11:33] <JPEW> What sort of redo?
[11:34] <bluelightning> we don't necessarily have to redo it (although I th=
ink that might be a good idea), but we do need it to convey that the projec=
t is active
[11:34] <RP> replacing the wiki?
[11:34] <RP> I'd support that assertion
[11:34] <RP> Some mention of the relationship with YP would be good
[11:34] <bluelightning> even if we did create a new site the wiki would sti=
ll remain, but just not as the front page
[11:35] <RP> bluelightning: makes sense
[11:36] <bluelightning> anyway, another thing to think about
[11:37] <JPEW> Ya, I think the current website might be a little hard to na=
vigate for the casually curious
[11:37] <JaMa> interesting that there are around 3 new wiki users per month=
, not many edits though
[11:38] <RP> wiki account creation for YP and OE is problematic :(
[11:38] <RP> I wonder if we could tie it to some other signon?
[11:40] <JPEW> Trying to search for "single sign on wiki" keeps taking me t=
o the actual wikipedia page about single sign on :)
[11:40] <JaMa> also for some reason google account password checker says th=
at my openembedded.org account was compromissed, doesn't say when or why it=
 thinks that
[11:40] <RP> We should perhaps ask Michael about this?
[11:41] <JPEW> Seems reasonable
[11:41] * JPEW wonder what casual users expect from an OSS page these days
[11:41] <bluelightning> what is this thing, how do I download it, where are=
 the docs, where do I ask questions
[11:42] <bluelightning> I would have thought, anyway
[11:42] <bluelightning> actually in priority order swap those last two ;)
[11:43] <RP> bluelightning: there is that issue, there is also the issue th=
at anyone wanting to make a quick edit loses interest
[11:45] <JPEW> RP: Do you have ideas as to why that is?
[11:46] <RP> JPEW: hard to get an account approved
[11:46] <RP> time lag
[11:46] <RP> Almost certain that kills of most contributions :(
[11:48] <JPEW> Hmm, ya
[11:52] <JPEW> Not that I'm promoting this (I haven't made up my mind), but=
 using a service like gitlab or github can help with some of that
[11:55] <JPEW> And, after poking that bear, I have to head home :)
[11:56] <zeddii> me too. not that I said anything until now :D
[11:56] <RP> Sounds like we should close the meeting
[11:56] <RP> zeddii: wasn't sure you were here!
[11:56] <JPEW> OK, thanks everyone.
[11:56] <zeddii> I was. just didn=E2=80=99t have any value adds.
[11:56] <JPEW> bluelightning, can you post the minutes?
[11:57] <bluelightning> JPEW: certainly
[11:57] <zeddii> but I will think more on the topics for next time, or anyt=
ime in between.
[11:57] <JPEW> thanks!
[11:57] <bluelightning> thanks everyone

=2D-=20

Paul Eggleton
Intel System Software Products



