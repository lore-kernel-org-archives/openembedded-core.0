Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RiHe9-0000Sl-H7
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 04:36:13 +0100
Received: from mail55-db3-R.bigfish.com (10.3.81.245) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 03:28:28 +0000
Received: from mail55-db3 (localhost [127.0.0.1])	by mail55-db3-R.bigfish.com
	(Postfix) with ESMTP id 0B6F2480174	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 03:28:28 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail55-db3 (localhost.localdomain [127.0.0.1]) by mail55-db3
	(MessageSwitch) id 1325647707933060_4023;
	Wed,  4 Jan 2012 03:28:27 +0000 (UTC)
Received: from DB3EHSMHS012.bigfish.com (unknown [10.3.81.241])	by
	mail55-db3.bigfish.com (Postfix) with ESMTP id D52E94C0046	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 03:28:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS012.bigfish.com
	(10.3.87.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 03:28:25 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Tue, 3 Jan 2012 21:28:24 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 oe-core] valgrind: add powerpc to the compatible
	host and add ${TCLIBC}-dbg in RRECOMMENDS
Thread-Index: AQHMxdKGE2OsE6NTI0e/k+5dsBO+L5X7lfYg
Date: Wed, 4 Jan 2012 03:28:23 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010C74B0@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325126350-1560-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1325126350-1560-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 oe-core] valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in RRECOMMENDS
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
X-List-Received-Date: Wed, 04 Jan 2012 03:36:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since valgrind has been upgraded to 3.7.0, a new patch to add powerpc suppo=
rt will be submitted, please ignore this one.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Thursday, December 29, 2011 10:39 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: [PATCH v2 oe-core] valgrind: add powerpc to the compatible host =
and add
> ${TCLIBC}-dbg in RRECOMMENDS
>=20
> From: Zhenhua Luo <b19537@freescale.com>
>=20
>     1. add powerpc into the compatible host list
>     2. valgrind requires the non-stripped libraries of ${TCLIBC}, so add
>        ${TCLIBC}-dbg into RRECOMMENDS_valgrind
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.6.1.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/reci=
pes-
> devtools/valgrind/valgrind_3.6.1.bb
> index 021caa8..2abe173 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc46082167a314d785d012a244748d803 \
>=20
> file://include/valgrind.h;beginline=3D1;endline=3D56;md5=3D13a71cedba9911=
2334d8596162a
> ec37e \
>                      file://COPYING.DOCS;md5=3D8fdeb5abdb235a08e76835f8f3=
260215"
>  DEPENDS =3D "virtual/libx11"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
>  SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>  	   file://fix_issue_caused_by_ccache.patch \ @@ -17,7 +17,7 @@ SRC_URI =
=3D
> "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \  SRC_URI[md5s=
um] =3D
> "2c3aa122498baecc9d69194057ca88f5"
>  SRC_URI[sha256sum] =3D
> "49bdcc4fbcf060049b5f0dcfd8a187a6e90e0b0e57309f633b64e44430726a0e"
>=20
> -COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
> +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|ppc|powerpc64|ppc64).*-linux'
>=20
>  inherit autotools
>=20
> @@ -26,3 +26,5 @@ EXTRA_OEMAKE =3D "-w"
>  PARALLEL_MAKE =3D ""
>=20
>  FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug/*"
> +
> +RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"
> --
> 1.7.0.4




