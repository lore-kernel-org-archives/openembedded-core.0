Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RcbZM-0004sK-5Z
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 12:39:48 +0100
Received: from mail207-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.23; Mon, 19 Dec 2011 10:32:12 +0000
Received: from mail207-ch1 (localhost [127.0.0.1])	by
	mail207-ch1-R.bigfish.com (Postfix) with ESMTP id 6EF014C00C1	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 10:32:35 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371I542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail207-ch1 (localhost.localdomain [127.0.0.1]) by mail207-ch1
	(MessageSwitch) id 1324290753329311_28966;
	Mon, 19 Dec 2011 10:32:33 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.246])	by mail207-ch1.bigfish.com (Postfix) with ESMTP id
	3EABF400047	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 10:32:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 19 Dec 2011 10:32:10 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Mon, 19 Dec 2011 04:32:15 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc into the
	compatible host list
Thread-Index: AQHMvjk1b8q5fo1AB0CI66Vr5oIfLZXi9hSw
Date: Mon, 19 Dec 2011 10:32:15 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
In-Reply-To: <C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the	compatible host list
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
X-List-Received-Date: Mon, 19 Dec 2011 11:39:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure, if valgrind can work on x86, powerpc, arm, COMPATIBLE_HOST can be rem=
oved, I will post a v2 patch.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Monday, December 19, 2011 6:30 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH oe-core] valgrind: add powerpc into the com=
patible
> host list
>=20
>=20
> Op 19 dec. 2011, om 11:12 heeft <b19537@freescale.com> <b19537@freescale.=
com>
> het volgende geschreven:
>=20
> > From: Zhenhua Luo <b19537@freescale.com>
> >
> >    add powerpc/powerpc64/ppc/ppc64 in COMPATIBLE_HOST variable
>=20
> Since valgrind works on arm as well it might be better just to drop the
> COMPATIBLE_HOST, no?
>=20
> regards,
>=20
> Koen
>=20
> >
> > Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> > ---
> > meta/recipes-devtools/valgrind/valgrind_3.6.1.bb |    4 ++--
> > 1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> > b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> > index 021caa8..c09fc41 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> > +++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc46082167a314d785d012a244748d803 \
> >
> file://include/valgrind.h;beginline=3D1;endline=3D56;md5=3D13a71cedba9911=
2334d8596162a
> ec37e \
> >                     file://COPYING.DOCS;md5=3D8fdeb5abdb235a08e76835f8f=
3260215"
> > DEPENDS =3D "virtual/libx11"
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> > SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> > 	   file://fix_issue_caused_by_ccache.patch \ @@ -17,7 +17,7 @@
> > SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> > SRC_URI[md5sum] =3D "2c3aa122498baecc9d69194057ca88f5"
> > SRC_URI[sha256sum] =3D
> "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
> >
> > -COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
> > +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|ppc|ppc64).*-linux=
'
> >
> > inherit autotools
> >
> > --
> > 1.7.0.4
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




