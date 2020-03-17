Return-Path: <bluelightning@bluelightning.org>
X-Greylist: delayed 471 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Mar 2020 02:46:50 UTC
Received: from adige.pair.com (adige.pair.com [209.68.5.114])
	by mail.openembedded.org (Postfix) with ESMTP id 367CB60C66
	for <openembedded-core@openembedded.org>;
	Tue, 17 Mar 2020 02:46:50 +0000 (UTC)
Received: from adige.pair.com (localhost [127.0.0.1])
	by adige.pair.com (Postfix) with ESMTP id D1246959CE;
	Mon, 16 Mar 2020 22:39:00 -0400 (EDT)
Received: from linc.localnet (unknown
	[IPv6:2406:e003:130a:e501:f188:4b83:8582:1e57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by adige.pair.com (Postfix) with ESMTPSA id 0B1DE959AA;
	Mon, 16 Mar 2020 22:38:59 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: tsc@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:38:56 +1300
Message-ID: <22665987.Wx5bFTl31r@linc>
MIME-Version: 1.0
Cc: openembedded-core@openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: OpenEmbedded TSC Meeting Minutes 2020-03-17
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
X-List-Received-Date: Tue, 17 Mar 2020 02:46:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

OpenEmbedded Technical Steering Committee (TSC) Meeting Minutes 2020-03-17
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Meeting was held in #oe-tsc on Freenode; channel access public.

Present:
=2D Richard Purdie (RP)
=2D Joshua Watt (JPEW)
=2D Bruce Ashfield (zeddii)
=2D Paul Eggleton (bluelightning)
Apologies:
=2D Martin Jansa (JaMa)

Summary:
* Need to think about ways to encourage contributions
  - Make contributions more visible? (see also last meeting's discussion)
    - Include contributor names in release notes
  - Response emails to patches / when patch merged?
  - Ideas / discussion around any barriers to contributing and removing the=
m very welcome


=46ull meeting long
=2D----------------

[11:01] <bluelightning> I presume we are meeting now?
[11:02] <JPEW> That's the plan
[11:03] <JPEW> JaMa doesn't appear to be online, and RP is currently away
[11:03] <JPEW> I forgot to send out a reminder today
[11:04] <bluelightning> I have just pinged RP - I could also text him
[11:10] <RP> Hi, I'm here now, sorry I'm late
[11:10] <bluelightning> no worries
[11:10] <bluelightning> do we have zeddii?
[11:11] <JPEW> Not sure. He was on earlier today
[11:15] <RP> Is there an agenda?
[11:15] <RP> I must admit I got M3 built and kind of went and "collapsed" ;=
=2D)
[11:16] <JPEW> I'm not aware of anything
[11:16] <RP> I did have one item the YP TSC asked me to raise
[11:16] <RP> Sorry for not officially adding it to the wiki etc
[11:16] <zeddii> here. sorry, I was supposed to be on vacation this week, s=
o I removed the meeting from my calendar.
[11:17] <RP> Basically, it was to ask the OC TSC to consider the resourcing=
 situation we have and to consider what we could do about it.
[11:17] <JPEW> zeddii: No problem, we just started
[11:17] <RP> There are various bodies that are thinking about it (YP TSC, Y=
P board, OE board) but the OE TSC probably also needs to give it some thoug=
ht
[11:19] <JPEW> RP: Ya, make sense.
[11:20] <JPEW> Are there any identified reasons why people don't contribute?
[11:22] <RP> JPEW: In general the pattern seems to be employers expecting s=
omeone else to do the core work
[11:22] <RP> Some things don't have clear return on investment too
[11:22] <zeddii> agreed. and agreed.
[11:22] <JPEW> which things?
[11:23] <bluelightning> anything that is mostly refactoring I would imagine
[11:23] <RP> JPEW: build failure triage (SWAT), bug triage
[11:23] <RP> things where its day to day monitoring without direct line of =
sight to a problem they themselves see
[11:23] <zeddii> and even things like why a reference kernel, when they don=
=E2=80=99t use it directly.
[11:23] <RP> zeddii: right
[11:24] <RP> also, new feature development like hashequiv
[11:24] <RP> or as bluelightning says, refactoring or new architectural work
[11:25] <zeddii> yup.
[11:28] <zeddii> I assume that I either got disconnected, or we are all dee=
p in thought.
[11:28] <JPEW> zeddii: The latter :)
[11:29] <RP> I've spent a lot of time thinking about it and I'm not sure wh=
at we can do
[11:29] <zeddii> the problem is that  only OSVs really care about =E2=80=9C=
credibility=E2=80=9D in the community. if you know what I mean.
[11:29] <JPEW> Aside from employeer expectations, any other reasons why peo=
ple don't participate?
[11:29] <RP> We have made some changes like newcomer bugs. I also need to s=
end out some kind of summary of the challenges to the wider community. I'm =
still working on that
[11:30] <RP> JPEW: there is probably a knowledge barrier too
[11:30] <zeddii> I could volunteer some of my time to help someone that act=
ually picked up a new comer bug, but I think that=E2=80=99s probably just a=
 drop in the ocean.
[11:30] <RP> JPEW: even some of our regular contributors think of bitbake a=
s a blackbox, you're one of the few who doesn't
[11:30] <JPEW> zeddii: Not necessarily if you can help someone get interest=
ed, it pays dividends :)
[11:31] <RP> zeddii: lots of small things do grow over time, I am trying to=
 encourage people. Not all will work out but its great to see when people d=
o grow
[11:32] <zeddii> that=E2=80=99s what I was wondering, are none of them bein=
g picked up, since newcomers don=E2=80=99t know where to start. maybe pairi=
ng them up with someone to office advice can help. but maybe that  has alre=
ady been tried (and yes, I know that pulls more time from people that don=
=E2=80=99t have it, etc).
[11:32] <zeddii> I=E2=80=99m throwing my hat into the ring for that. but th=
at implies someone is looking for that kind of help.
[11:32] <JPEW> zeddii: That's a good idea. I'd be willing to advise someone=
 fixing a bug also (newcomer or otherwise)
[11:32] <RP> zeddii: we're seeing poor take up despite what I thought was a=
 good spectrum of bugs there
[11:33] <JPEW> Perhaps more of a visibility problem?
[11:33] <RP> I would note that the we lack YP advocacy people atm too :(
[11:33] <RP> visibility is definitely part of it
[11:34] <JPEW> It's hard being on the inside looking out and trying to figu=
re out how visible you are sometimes
[11:34] <bluelightning> the newcomer doc on the YP wiki is pretty good I th=
ink, but that assumes people find that
[11:35] <bluelightning> I did just get to it by googling "yocto project con=
tribute"
[11:36] <JPEW> Hmm, is it pretty easy to identify new contributers on the M=
L?
[11:37] <RP> JPEW: for a person or for a machine?
[11:38] <JPEW> person (email address)
[11:38] <zeddii> I=E2=80=99m thinking more of companies that use OE, not en=
d users. since getting contributions from each category is quite a differen=
t thing.
[11:40] <JPEW> zeddii: Sure, but having people in the company that are invo=
lved anyway helps
[11:40] <JPEW> sometimes :eyeroll:
[11:40] <RP> JPEW: I mean its easy for a computer to look at an email and s=
ee if they've had a patch merged before
[11:42] <JPEW> RP: Right. Would it be bad form to send them a message "welc=
ome to the community" message? I've not been doing OSS very long, so I don'=
t know all the edicate
[11:42] <JPEW> Thanks for your patch! Here's some other ways you can get in=
volved...
[11:42] <RP> JPEW: if they were new to OE but an experienced OSS contributo=
r it may seem patronising :/
[11:42] <bluelightning> I think it might be nice - you could include "if yo=
u don't get a reply in x days here's what to do"
[11:43] <bluelightning> I wouldn't find it patronising if I was joining a n=
ew project, others may differ possibly
[11:43] <bluelightning> I know I've struggled when joining other projects, =
people sort of expect you to know what to do / where to look and that's not=
 always easy even if you're experienced with OSS, every project is different
[11:44] <zeddii> yah. is it a get started issue, credit issue, or lack of m=
apping to ROI issue .. hard to say, since we don=E2=80=99t even have that i=
nfo :(
[11:45] <JPEW> zeddii: Hard to operate effectively without data
[11:45] <RP> I don't have an objection to it
[11:45] <JPEW> When do the other TSC's meet
[11:46] <RP> By the time they sent a contribution they're already part way =
there though, we may need to find new contributors as well
[11:46] <RP> JPEW: you mean the YP TSC?
[11:46] <JPEW> Ya
[11:47] <RP> zeddii: the "data" I have says all the above
[11:47] <zeddii> I jokingly say that with all of the users of OE, and a fai=
rly narrow set of contributors, I assume that means that they have no issue=
s. which I can=E2=80=99t imagine is the case.
[11:47] <RP> JPEW: YP TSC meets after the engineering sync tomorrow
[11:47] <RP> zeddii: most of my data is reading the mailing lists and socia=
l media posts from users, new and experienced
[11:49] <JPEW> OK. Maybe we can draft up a skeleton e-mail and all look it =
over (maybe the YP TSC too)
[11:49] <zeddii> non-corporate contributions are hard to capture, since the=
y are likely elsewhere for many high level applications.
[11:50] <RP> JPEW: another thing may be a "your patch has merged" email fro=
m patchwork
[11:50] <JPEW> RP: Ya that would be good too
[11:50] <zeddii> I mean, it would be nice if we went to openembedded.org an=
d saw some logo=E2=80=99s, but I suppose that collides with YP very quickly=
=2E and you get a logo if you have a patch in the release ;)
[11:51] <RP> I also have no objection to that but it needs someone else to =
own and drive it
[11:51] <zeddii> that @gmail.com company could get a big logo!
[11:51] <bluelightning> patch merged reports was something that was suppose=
d to be added to patchwork a long time ago, unfortunately due to various re=
asons it never got done :/
[11:51] <RP> bluelightning: one idea that did get talked about but probably=
 ironically, not with you was a list of contributors to the release
[11:52] <bluelightning> hmm, yes, I think maybe it did get mentioned somewh=
ere
[11:52] <zeddii> I thought it was a good idea, since then large and small c=
ould see their name in =E2=80=9Cprint=E2=80=9D along with a release.
[11:52] <RP> (ironically as bluelightning ends up writing the release notes)
[11:52] <zeddii> but again, time. I can help with that when the time comes.
[11:53] <bluelightning> at least as far as commits go there are various git=
 stats analysis tools that might be helpful (and don't involve us writing a=
dditional code)
[11:53] <RP> zeddii: the time for that one is now, release is in weeks!
[11:53] <bluelightning> although yes it would be good to have the info actu=
ally in the notes... that should be pretty easy for me to do
[11:53] <zeddii> I mean, I get an email from the kernel once and a while tr=
ying to figure out who I work for, since @gmail.com =E2=80=A6. so there=E2=
=80=99s some mappings that can be done on that front as well.
[11:54] <RP> bluelightning: you can integrate if someone helps too! :)
[11:54] <zeddii> bluelightning: if there=E2=80=99s something you think I ca=
n do for that, I can help.
[11:54] <bluelightning> zeddii: thanks - I'll keep that in mind
[11:55] <zeddii> I=E2=80=99ll go look at the other release notes to see if =
I can think of anything else that might be interesting to add.
[11:55] <zeddii> i.e. if a release mentioned some steps forward in a vertic=
al that interested some companies, they might be interested to help more in=
 the future, etc. hard to say if its even possible to do that, but its an i=
dea.
[11:58] <JPEW> There might be more we could do at conferences and such also=
=2E.. although thats not useful in the short term
[11:59] <RP> some kind of metrics/lists focused on "first contributions fro=
m" might be interesting
[12:03] <JPEW> Any other topics?
[12:03] <RP> Not from me
[12:03] <JPEW> I'll put this one on the list for next month so we can see i=
f there are any more ideas in the meantime
[12:04] <JPEW> And I'll try to draft some example e-mails
[12:04] <RP> If people do have ideas, please do feel free to share. I think=
 the project has some challenges ahead (as does the world at large atm :( )
[12:06] <JPEW> OK, supper time for me.
[12:06] <JPEW> Bye all
[12:07] <bluelightning> I'll send out the minutes
[12:08] <JPEW> Thanks. Don't forget to link on the wiki: https://www.openem=
bedded.org/wiki/TSC
[12:08] <bluelightning> ah yes thanks for the reminder, I think I missed th=
at the last couple of times
[12:09] <RP> Thanks all!




