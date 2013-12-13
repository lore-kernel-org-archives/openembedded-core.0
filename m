Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0186.outbound.protection.outlook.com [207.46.163.186])
	by mail.openembedded.org (Postfix) with ESMTP id 69E28610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:21:18 +0000 (UTC)
Received: from BL2PR03MB388.namprd03.prod.outlook.com (10.141.91.153) by
	BL2PR03MB243.namprd03.prod.outlook.com (10.255.231.23) with Microsoft
	SMTP Server (TLS) id 15.0.842.7; Fri, 13 Dec 2013 07:21:16 +0000
Received: from BL2PR03MB388.namprd03.prod.outlook.com ([10.141.91.153]) by
	BL2PR03MB388.namprd03.prod.outlook.com ([10.141.91.153]) with mapi id
	15.00.0837.004; Fri, 13 Dec 2013 07:21:16 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] lttng-modules: build as 64-bit kernel module
	on e6500
Thread-Index: AQHO99HlZ7fTj5pJyUqP8cxH8PeXo5pRt2xQ
Date: Fri, 13 Dec 2013 07:21:16 +0000
Message-ID: <1e3fc93a8c5548699e8d6fbb6969597f@BL2PR03MB388.namprd03.prod.outlook.com>
References: <1386918394-13381-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1386918394-13381-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.158.216]
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(51704005)(13464003)(199002)(189002)(377454003)(53806001)(54356001)(85306002)(51856001)(81686001)(76482001)(56816005)(47446002)(46102001)(33646001)(80976001)(66066001)(65816001)(80022001)(83072002)(85852003)(81542001)(69226001)(90146001)(74502001)(63696002)(31966008)(74662001)(79102001)(81342001)(59766001)(77982001)(74706001)(2656002)(4396001)(19580395003)(83322001)(19580405001)(87936001)(74876001)(76576001)(47976001)(50986001)(76796001)(76786001)(47736001)(56776001)(54316002)(87266001)(81816001)(74366001)(49866001)(74316001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB243;
	H:BL2PR03MB388.namprd03.prod.outlook.com; CLIP:192.88.158.216;
	FPR:; RD:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "ting.liu@freescale.com" <ting.liu@freescale.com>
Subject: Re: [PATCH] lttng-modules: build as 64-bit kernel module on e6500
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
X-List-Received-Date: Fri, 13 Dec 2013 07:21:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

"64b kernel + 32b userspace" is a scenario of e6500 targets specific to FSL=
 QorIQ SDK, so the change should be located in SDK layer instead of a commo=
n layer.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: Chunrong Guo [mailto:B40290@freescale.com]
> Sent: Friday, December 13, 2013 3:07 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo
> Chunrong-B40290
> Subject: [OE-core][PATCH] lttng-modules: build as 64-bit kernel module on
> e6500
>=20
>    *e6500 is built with 32b rootfs/64b kernel, build lttng-modules as
> 64bit too.
>    *Fix the below build issue on e6500 core:
>     | DEBUG: Executing shell function do_make_scripts
>     | make: Entering directory `.../tmp/sysroots/t4240qds/usr/src/kernel'
>     | CC scripts/mod/empty.o | scripts/mod/empty.c:1:0: error: -mcmodel
> not supported in this configuration
>     | make[2]: *** [scripts/mod/empty.o] Error 1
>     | make[1]: *** [scripts/mod] Error 2
>     | make: *** [scripts] Error 2
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> index dd06546..2a48c1a 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> @@ -22,6 +22,18 @@ export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> +# Build as 64-bit kernel module on e6500 python () {
> +
> +    promote_kernel =3D d.getVar('BUILD_64BIT_KERNEL')
> +
> +    if promote_kernel =3D=3D "1":
> +        d.setVar('KERNEL_CC_append', ' -m64')
> +        d.setVar('KERNEL_LD_append', ' -melf64ppc')
> +
> +}
> +
> +
>  do_install_append() {
>  	# Delete empty directories to avoid QA failures if no modules were
> built
>  	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
> --
> 1.7.5.4
>=20


