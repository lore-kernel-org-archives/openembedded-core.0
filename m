Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rj3eY-0003Hj-8C
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 07:51:50 +0100
Received: from mail69-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jan 2012 06:29:16 +0000
Received: from mail69-tx2 (localhost [127.0.0.1])	by mail69-tx2-R.bigfish.com
	(Postfix) with ESMTP id EBCB854022B	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 06:29:16 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I542M1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hbe9k65h)
X-Spam-TCS-SCL: 4:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail69-tx2 (localhost.localdomain [127.0.0.1]) by mail69-tx2
	(MessageSwitch) id 1325831356809950_9352;
	Fri,  6 Jan 2012 06:29:16 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.254])	by
	mail69-tx2.bigfish.com (Postfix) with ESMTP id B52B65E0061	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 06:29:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jan 2012 06:29:16 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.213]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Fri, 6 Jan 2012 00:29:16 -0600
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH oe-core] valgrind: add powerpc to the compatible host
	and add ${TCLIBC}-dbg in RRECOMMENDS
Thread-Index: AQHMypEeiDFY6v/hgk6Tqa5ZAT64kpX+44Cw
Date: Fri, 6 Jan 2012 06:29:16 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A010C8F9C@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1325648042-5162-1-git-send-email-b19537@freescale.com>
In-Reply-To: <1325648042-5162-1-git-send-email-b19537@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.114]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in RRECOMMENDS
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
X-List-Received-Date: Fri, 06 Jan 2012 06:51:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A new version is submitted according to the comments.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Wednesday, January 04, 2012 11:34 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537
> Subject: [PATCH oe-core] valgrind: add powerpc to the compatible host and=
 add
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
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/reci=
pes-
> devtools/valgrind/valgrind_3.7.0.bb
> index 03cdd28..1a4fdfd 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc46082167a314d785d012a244748d803 \
>=20
> file://include/valgrind.h;beginline=3D1;endline=3D56;md5=3Daee56014c1dd64=
260a59fd4df38
> 752f6 \
>                      file://COPYING.DOCS;md5=3D8fdeb5abdb235a08e76835f8f3=
260215"
>  DEPENDS =3D "virtual/libx11"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  SRC_URI =3D "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>  	   file://fix_issue_caused_by_ccache.patch \ @@ -18,7 +18,7 @@ SRC_URI =
=3D
> "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \  SRC_URI[md5s=
um] =3D
> "a855fda56edf05614f099dca316d1775"
>  SRC_URI[sha256sum] =3D
> "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
>=20
> -COMPATIBLE_HOST =3D '(i.86|x86_64).*-linux'
> +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|ppc|powerpc64|ppc64).*-linux'
>=20
>  inherit autotools
>=20
> @@ -27,3 +27,5 @@ EXTRA_OEMAKE =3D "-w"
>  PARALLEL_MAKE =3D ""
>=20
>  FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug/*"
> +
> +RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"
> --
> 1.7.0.4




