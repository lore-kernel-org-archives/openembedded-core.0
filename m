Return-Path: <B19537@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0186.outbound.messaging.microsoft.com [213.199.154.186])
	by mail.openembedded.org (Postfix) with ESMTP id 226AA6A413
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:49:46 +0000 (UTC)
Received: from mail80-db8-R.bigfish.com (10.174.8.238) by
	DB8EHSOBE005.bigfish.com (10.174.4.68) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 May 2013 09:49:46 +0000
Received: from mail80-db8 (localhost [127.0.0.1])	by mail80-db8-R.bigfish.com
	(Postfix) with ESMTP id 5AC8E240212	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:49:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz709fI9371I542I1432Izz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fhbe9i1155h)
Received: from mail80-db8 (localhost.localdomain [127.0.0.1]) by mail80-db8
	(MessageSwitch) id 136973458478527_24891;
	Tue, 28 May 2013 09:49:44 +0000 (UTC)
Received: from DB8EHSMHS006.bigfish.com (unknown [10.174.8.230])	by
	mail80-db8.bigfish.com (Postfix) with ESMTP id 105DCAC004B	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:49:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS006.bigfish.com
	(10.174.4.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 May 2013 09:49:39 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.137]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0328.011; Tue, 28 May 2013 09:50:33 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCH] apr: fix configure issue for ppc64 targets
Thread-Index: AQHOW4H7F5sON8j63kmCsqVTZ2LhI5kaWdxQ
Date: Tue, 28 May 2013 09:49:18 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01575DFA@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1369731984-16835-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1369731984-16835-1-git-send-email-zhenhua.luo@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [PATCH] apr: fix configure issue for ppc64 targets
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
X-List-Received-Date: Tue, 28 May 2013 09:49:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.=20

Another patch has been sent out to fix the same issue. http://patches.opene=
mbedded.org/patch/50617/


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, May 28, 2013 5:06 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Guo Chunrong-B40290; Yu Zongchun-B40527; Luo
> Zhenhua-B19537
> Subject: [oe-core][PATCH] apr: fix configure issue for ppc64 targets
>=20
> Fix following error of apr configure for powerpc64 targets:
> | configure:27173: checking whether TCP_NODELAY and TCP_CORK can both be
> | enabled
> | configure:27179: error: in `/home/yocto/workspace/sdk-
> devel/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/apr/1.4.6-
> r2/apr-1.4.6':
> | configure:27181: error: cannot run test program while cross compiling
>=20
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  meta/recipes-support/apr/apr_1.4.6.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-
> support/apr/apr_1.4.6.bb
> index 77dffee..a89d25e 100644
> --- a/meta/recipes-support/apr/apr_1.4.6.bb
> +++ b/meta/recipes-support/apr/apr_1.4.6.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D0c35ff3c4c83b89d2f076e315caac28b \
>=20
>  BBCLASSEXTEND =3D "native"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>             file://configure_fixes.patch \ @@ -23,6 +23,8 @@ inherit
> autotools lib_package binconfig multilib_header
>=20
>  OE_BINCONFIG_EXTRA_MANGLE =3D " -e
> 's:location=3Dsource:location=3Dinstalled:'"
>=20
> +EXTRA_OECONF_powerpc64 +=3D "apr_cv_tcp_nodelay_with_cork=3Dyes"
> +
>  do_configure_prepend() {
>  	cd ${S}
>  	./buildconf
> --
> 1.7.9.5



