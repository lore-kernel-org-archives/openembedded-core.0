Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 301FE601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 15:46:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2014 07:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,522,1413270000"; d="scan'208";a="643039445"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.18.22])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2014 07:46:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Date: Fri, 05 Dec 2014 15:46:21 +0000
Message-ID: <1698007.84htqHRcQe@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48257C79C4@sestoex09.enea.se>
References: <1417594165-25317-1-git-send-email-sona.sarmadi@enea.com>
	<3230301C09DEF9499B442BBE162C5E48257C774E@sestoex09.enea.se>
	<3230301C09DEF9499B442BBE162C5E48257C79C4@sestoex09.enea.se>
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
X-List-Received-Date: Fri, 05 Dec 2014 15:46:30 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 05 December 2014 15:32:05 Sona Sarmadi wrote:
> > Python has fixed this issue in version 3.5.  and backported to  2.7=
:
> > See the patch here:
> >=20
> >  https://hg.python.org/cpython/rev/f762cbb712de
> >=20
> >=20
> > But this patch doesn=E2=80=99t apply, I have downloaded the latest =
2.7.8, it is
> > the Same problem there. I have sent email to the guy responsible to=
 this
> > patch but haven't heard from him yet.
>=20
>=20
> I got following answer from the guy who has provided python patch abo=
ve:
> "No, it's for 2.7.9. The ssl module in 2.7.9 was backported from Pyth=
on 3,
> its code is vastly different. 2.7.9 should be released soon in Decemb=
er or
> January."
>=20
> So we either upgrade master to 2.7.9 when python 2.7.9 is released (i=
f this
> is ok) otherwise use=20
> the Debian's patch.

I think we should apply the patch now anyway; we'll want to know that i=
t works=20
for backports to the stable branch(es), and in any case the upgrade to =
2.7.9=20
is not going to be a straightforward task based upon my earlier attempt=
 to=20
upgrade to 2.7.6 (the current state of which is still in paule/python27=
6-wip=20
in poky-contrib).

Cheers,
Paul


--=20

Paul Eggleton
Intel Open Source Technology Centre

