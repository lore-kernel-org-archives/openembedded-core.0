Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0118.outbound.protection.outlook.com [207.46.100.118])
	by mail.openembedded.org (Postfix) with ESMTP id 017C072541
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:17:06 +0000 (UTC)
Received: from CY1PR0301MB1194.namprd03.prod.outlook.com (25.160.165.25) by
	CY1PR0301MB0714.namprd03.prod.outlook.com (25.160.159.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.53.17; Wed, 14 Jan 2015 09:17:04 +0000
Received: from CY1PR0301MB1194.namprd03.prod.outlook.com ([25.160.165.25]) by
	CY1PR0301MB1194.namprd03.prod.outlook.com ([25.160.165.25]) with
	mapi id 15.01.0053.000; Wed, 14 Jan 2015 09:17:04 +0000
From: "ting.liu@freescale.com" <ting.liu@freescale.com>
To: "ting.liu@freescale.com" <ting.liu@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-fsl-ppc][PATCH] bitbake.conf: add PKGDATA_DIR to
	BB_HASHBASE_WHITELIST
Thread-Index: AQHQL9a+qx47Cn7c9kKPaX4Mqy/195y/Va/g
Date: Wed, 14 Jan 2015 09:17:04 +0000
Message-ID: <CY1PR0301MB11947FECFB40E4C9D314687693410@CY1PR0301MB1194.namprd03.prod.outlook.com>
References: <1421225250-5807-1-git-send-email-ting.liu@freescale.com>
In-Reply-To: <1421225250-5807-1-git-send-email-ting.liu@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.51]
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ting.liu@freescale.com; 
x-dmarcaction-test: None
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:CY1PR0301MB0714;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0714; 
x-forefront-prvs: 04569283F9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(199003)(377454003)(51704005)(189002)(50986999)(54606007)(106116001)(40100003)(77156002)(62966003)(450100001)(99286002)(105586002)(106356001)(86362001)(102836002)(2900100001)(74316001)(2950100001)(76176999)(54356999)(97736003)(575784001)(66066001)(64706001)(19580405001)(19580395003)(101416001)(33656002)(230783001)(92566002)(46102003)(54206007)(87936001)(76576001)(2656002)(122556002)(68736005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0714;
	H:CY1PR0301MB1194.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2015 09:17:04.1630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0714
Subject: Re: [meta-fsl-ppc][PATCH] bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Wed, 14 Jan 2015 09:17:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, sent with wrong subject-prefix.

> -----Original Message-----
> From: ting.liu@freescale.com [mailto:ting.liu@freescale.com]
> Sent: Wednesday, January 14, 2015 4:48 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Luo Zhenhua-B19537; Liu Ting-B28495
> Subject: [meta-fsl-ppc][PATCH] bitbake.conf: add PKGDATA_DIR to
> BB_HASHBASE_WHITELIST
>=20
> From: Ting Liu <b28495@freescale.com>
>=20
> In meta/conf/bitbake.conf, PKGDATA_DIR is default to:
> PKGDATA_DIR =3D "${STAGING_DIR_HOST}/pkgdata"
>=20
> But in meta/conf/multilib.conf, PKGDATA_DIR is set as:
> PKGDATA_DIR =3D "${STAGING_DIR}/${MACHINE}/pkgdata"
>=20
> When multilib enabled, linux-libc-headers cache will be machine
> specific:
> $ bitbake-diffsigs sstate-cache/1a/sstate:linux-libc-headers:ppce6500-pok=
y-
> linux:3.17.7:r0:ppce6500:3:1a0c3934d91479fd7242a5b1d407d155_package.tgz.s=
iginf
> o sstate-cache/28/sstate:linux-libc-headers:ppce6500-poky-
> linux:3.17.7:r0:ppce6500:3:28c918e8f9f4a4cfceb3a38b258f7501_package.tgz.s=
iginf
> o
> basehash changed from 8d3158bbddcee612fa30badd05f47b8e to
> 68ac258fc6c8e489f360fde3123a5894 Variable MACHINE value changed from
> 'b4420qds' to 'b4860qds'
>=20
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf index
> 7902bd7..3d2f384 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -771,7 +771,7 @@ BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_T=
ASKHASH
> BBPATH DL_DIR \
>      USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_H=
OST \
>      PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
>      CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH
> SDKPKGSUFFIX \
> -    WARN_QA ERROR_QA WORKDIR STAMPCLEAN"
> +    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR"
>  BB_HASHCONFIG_WHITELIST ?=3D "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGE=
NT_PID
> \
>      SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
>      PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED=
"
> --
> 1.9.1


