Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E6970728A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 10:01:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2015 02:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="509227892"
Received: from ybaig-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.0.208])
	by orsmga003.jf.intel.com with ESMTP; 08 Jan 2015 01:56:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 08 Jan 2015 10:01:46 +0000
Message-ID: <56832778.XUIYBB79do@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
References: <1420622709.25779.60.camel@linuxfoundation.org>
	<1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
MIME-Version: 1.0
Cc: yocto <yocto@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: Bug reporting and good bug reports
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
X-List-Received-Date: Thu, 08 Jan 2015 10:01:54 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday 07 January 2015 16:36:37 Khem Raj wrote:
> > On Jan 7, 2015, at 1:25 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > I was informed on irc yesterday that bug reports are hard and that
> > debugging via irc is easier. I think I need to remind people why go=
od
> > bug reports are important and how they do actually help immensely.
> >=20
> > I do actually believe that not everything has to have bug report. I=
f you
> > mention an issue, someone says "hey, I know how to fix that" and se=
nds a
> > patch out, a bug report is wasted overhead IMO. I know some program=
me
> > managers who disagree strongly with me and would suggest *every* bu=
gfix
> > commit should have a defect tracking item. We're not going there I
> > understand the idea, its not practical.
> >=20
> > That said, if its not immediately clear what the problem is, it sho=
uld
> > become a bug report. Why?
> >=20
> > Firstly, the random selection of people on irc at the time probably=

> > aren't the right people to fix it. Telling those people to read 48 =
hours
> > of irc log for the details is disrespectful of their time.
> >=20
> > It also happens that the first people referred to a bug may not be =
the
> > person who actually can fix it. If someone else needs to come to a =
bug,
> > having a summary of the issue, the salient facts and the current st=
atus
> > is immensley useful for handover.
> >=20
> > As a case in point, I tried to debug a qt4 build failure yesterday =
for
> > which there is no bug report. I lost hours building the wrong thing=
s,
> > experimenting to try and find the reproducer steps and generally ch=
asing
> > my tail, losing the autobuilder log of the failure, the name of the=
 qt4
> > recipe that was failing (which task was it again?) and so on.
> >=20
> > I do now have a set of reproducer steps, its quite simple:
> >=20
> > MACHINE=3Dimx53qsb bitbake virtual/kernel
> > MACHINE=3Dimx53qsb bitbake virtual/kernel -c clean
> > MACHINE=3Dimx53qsb bitbake qt4-x11-free
> >=20
> > I also have a patch. Where should I share them? How do I ensure eve=
ryone
> > with an interest in this defect actually gets the patch? Sure I can=

> > create email and send to the people who I think need to know. The
> > bugzilla lets interested parties add themselves to bugs though.
> >=20
> > I should also note that QA actually go through bugs in the bugzilla=
,
> > including closed ones, looking for test cases. We're not great at t=
his
> > yet but it does happen. If there is a well documented test case lik=
e
> > that above, we might write an automated QA test for it. Having it
> > documented is therefore a good thing.
> >=20
> > I do appreciate writing a bug report is hard, especially if you don=
't
> > know where the problem is, or how to reproduce it exactly. It takes=
 time
> > and effort. You can however document what you know and discussion c=
an
> > happen in a common place to figure out how to reproduce it. I do ex=
cept
> > the submitters to fully understand the bug, if they did they'd prob=
ably
> > write a patch instead.
> >=20
> > So fair warning, I am going to start ignoring things on irc and ask=
 for
> > bug numbers in future, assuming something isn't a 5 minute fix with=
 an
> > immediate patch. I will back and encourage anyone else doing this t=
oo.
>=20
> What about developer mailing lists ?. isn=E2=80=99t it also a way to =
report problems
> via emails after all we use emails for patch work flow. Not all peopl=
e
> working with OE-Core e.g. might be following yocto bugzilla

Mailing lists are great for discussion (e.g. "I have this problem but I=
'm not=20
sure of the right way to solve it") but a terrible way to track actual =
bugs,=20
because mailing lists tend to concentrate on the latest postings; older=
 issues=20
that haven't been resolved rapidly disappear with the tide of new posti=
ngs. Of=20
course old issues can build up in a bug tracker, but at least it's triv=
ially=20
easy to find open issues where it's much more difficult to find unresol=
ved issues=20
on a mailing list.

The point is, the best way to ensure that an issue gets solved at least=
 for=20
OE-Core is to file a bug in the YP bugzilla. There is then a triage pro=
cess and=20
in most cases someone to actually assign the issue to so that it can be=
 dealt=20
with. There is no such process on the mailing lists.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

