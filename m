Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SoxkI-0004rS-28
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:18:26 +0200
Received: from mail92-am1-R.bigfish.com (10.3.201.227) by
	AM1EHSOBE006.bigfish.com (10.3.204.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 11 Jul 2012 13:49:47 +0000
Received: from mail92-am1 (localhost [127.0.0.1])	by mail92-am1-R.bigfish.com
	(Postfix) with ESMTP id B08E31C0218	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 13:49:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371I936eI542M1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah107ahbe9i)
Received: from mail92-am1 (localhost.localdomain [127.0.0.1]) by mail92-am1
	(MessageSwitch) id 1342014585234982_5525;
	Wed, 11 Jul 2012 13:49:45 +0000 (UTC)
Received: from AM1EHSMHS010.bigfish.com (unknown [10.3.201.234])	by
	mail92-am1.bigfish.com (Postfix) with ESMTP id 36A5B220047	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 13:49:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS010.bigfish.com
	(10.3.207.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 11 Jul 2012 13:49:41 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.250]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0298.005; Wed, 11 Jul 2012 08:52:01 -0500
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] task-core-sdk.bb: add libgomp and libgomp-dev
Thread-Index: AQHNX1qSy2cQGmScbUuUf92+P/ri1JckZ1MA//+yZKA=
Date: Wed, 11 Jul 2012 13:52:00 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A012187C5@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1342008111-24810-1-git-send-email-b19537@freescale.com>
	<1342013330.7934.12.camel@ted>
In-Reply-To: <1342013330.7934.12.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.129]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] task-core-sdk.bb: add libgomp and libgomp-dev
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
X-List-Received-Date: Wed, 11 Jul 2012 14:18:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard,=20

Thanks for your comments, I will submit new version to use RRECOMMENDS.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Wednesday, July 11, 2012 9:29 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH] task-core-sdk.bb: add libgomp and libgomp-
> dev
>=20
> On Wed, 2012-07-11 at 20:01 +0800, b19537@freescale.com wrote:
> > From: Zhenhua Luo <b19537@freescale.com>
> >
> > Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> > ---
> >  meta/recipes-core/tasks/task-core-sdk.bb |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-core/tasks/task-core-sdk.bb
> > b/meta/recipes-core/tasks/task-core-sdk.bb
> > index ec6cdcc..3ee29ce 100644
> > --- a/meta/recipes-core/tasks/task-core-sdk.bb
> > +++ b/meta/recipes-core/tasks/task-core-sdk.bb
> > @@ -7,7 +7,7 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> >
> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2042=
0"
> >  DEPENDS =3D "task-core-console"
> > -PR =3D "r7"
> > +PR =3D "r8"
> >
> >  ALLOW_EMPTY =3D "1"
> >  #PACKAGEFUNCS =3D+ 'generate_sdk_pkgs'
> > @@ -34,6 +34,8 @@ RDEPENDS_task-core-sdk =3D "\
> >      gettext \
> >      make \
> >      intltool \
> > +    libgomp \
> > +    libgomp-dev \
> >      libstdc++ \
> >      libstdc++-dev \
> >      libtool \
>=20
> This will break for architectures which don't build libgomp (anything not
> powerpc).
>=20
> You could add a RRECOMMENDS?
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




