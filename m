Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1005B72392
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 15:52:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2014 07:52:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,522,1413270000"; d="scan'208";a="619261777"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2014 07:52:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Date: Fri, 05 Dec 2014 15:52:41 +0000
Message-ID: <2073880.LUrcOztQL3@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1698007.84htqHRcQe@peggleto-mobl5.ger.corp.intel.com>
References: <1417594165-25317-1-git-send-email-sona.sarmadi@enea.com>
	<3230301C09DEF9499B442BBE162C5E48257C79C4@sestoex09.enea.se>
	<1698007.84htqHRcQe@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Maxin John <Maxin.John@enea.com>,
	'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] python: Building without SSLv3 support
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
X-List-Received-Date: Fri, 05 Dec 2014 15:52:53 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 05 December 2014 15:46:21 Paul Eggleton wrote:
> On Friday 05 December 2014 15:32:05 Sona Sarmadi wrote:
> > > Python has fixed this issue in version 3.5.  and backported to  2=
.7:
> > >=20
> > > See the patch here:
> > >  https://hg.python.org/cpython/rev/f762cbb712de
> > >=20
> > > But this patch doesn=E2=80=99t apply, I have downloaded the lates=
t 2.7.8, it is
> > > the Same problem there. I have sent email to the guy responsible =
to this
> > > patch but haven't heard from him yet.
> >=20
> > I got following answer from the guy who has provided python patch a=
bove:
> > "No, it's for 2.7.9. The ssl module in 2.7.9 was backported from Py=
thon 3,
> > its code is vastly different. 2.7.9 should be released soon in Dece=
mber or
> > January."
> >=20
> > So we either upgrade master to 2.7.9 when python 2.7.9 is released =
(if
> > this
> > is ok) otherwise use
> > the Debian's patch.
>=20
> I think we should apply the patch now anyway; we'll want to know that=
 it
> works for backports to the stable branch(es), and in any case the upg=
rade
> to 2.7.9 is not going to be a straightforward task based upon my earl=
ier
> attempt to upgrade to 2.7.6 (the current state of which is still in
> paule/python276-wip in poky-contrib).

(In case it's perhaps not clear from the above - I'm not discouraging t=
he=20
upgrade to 2.7.9, I think a python upgrade is long overdue, and we shou=
ld=20
definitely do it.)

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

