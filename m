Return-Path: <zhenhua.luo@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0097.outbound.protection.outlook.com [157.55.234.97])
	by mail.openembedded.org (Postfix) with ESMTP id CD0BF731F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LyACA+t9xLv4YpSYGQwQ4akIukZPgPlDLquw6edPQg0=;
	b=wYuETeEr8D/bWpKX64igZ61YnaAKYK5OuTk7/FOXcX6KHXKxR2n8ZTm0WofszcrVDniicVREM51Ru+Kn785X9/ZLbvh+9xs3LhEk3SyW8Qn2kgsi0M69TTW62ahv1hf3SKQynmUtjDMp26gxU7hzTMHPflXXS/WGJmivZiRr+90=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0682.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::12) with Microsoft SMTP Server (TLS) id
	15.1.447.15; Fri, 1 Apr 2016 09:43:03 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a%15]) with mapi id 15.01.0443.017;
	Fri, 1 Apr 2016 09:43:03 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Ross Burton <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] meta: remove obsolete architectures
Thread-Index: AQHRi/XwgV/GvQB8nEWBESjl4ITy6Z903CBg
Date: Fri, 1 Apr 2016 09:43:03 +0000
Message-ID: <DB3PR04MB068475EDA1351AFAD9CD7EC7EE9A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
	header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [199.59.230.102]
x-ms-office365-filtering-correlation-id: 588806e8-b56e-4e58-c398-08d35a12052b
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0682;
	5:gpLhIHHAml9PwKCLxMX3JyRvN/7RmY65MmmvkiuIUnZCFotFdjME3H0ipWkvYWYJGHxaqdhZe38rmAQgYD5TvKTDEMcqfowRukX9+oBKbzpXIIY6VbaJnH8utFj/+xZrfSmira+z47Mfk1JuRIO8EQ==;
	24:ifSXdTP5Wm72dIsxKat8EJgYREaJ67yMrTRiaWr5rNdPtGSqV3LdW+nDUCTU62/O5HEMmH1KeGjmL2AY+V2f8Ti0YmZHqI1JYY90fB0BECc=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0682;
x-microsoft-antispam-prvs: <DB3PR04MB0682796C19FAA36F558F0D48EE9A0@DB3PR04MB0682.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:DB3PR04MB0682; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0682; 
x-forefront-prvs: 0899B47777
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(13464003)(3846002)(6116002)(33656002)(5004730100002)(92566002)(110136002)(102836003)(50986999)(3660700001)(3280700002)(106116001)(74316001)(1220700001)(1096002)(189998001)(87936001)(76176999)(586003)(11100500001)(54356999)(4326007)(66066001)(5002640100001)(76576001)(5250100002)(5003600100002)(86362001)(19580395003)(2950100001)(2906002)(81166005)(5008740100001)(19580405001)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0682;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2016 09:43:03.0318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0682
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 09:43:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,=20

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Ross Burton
> Sent: Friday, April 01, 2016 5:07 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] meta: remove obsolete architectures
>=20
> Remove ancient and obsolete architectures from openembedded-core,
> they've no
> real users and are causing complications that can be now removed.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/cmake.bbclass                         |   4 -
>  meta/classes/insane.bbclass                        |  30 ---
>  meta/classes/libc-package.bbclass                  |   7 -
>  meta/classes/qemu.bbclass                          |  12 -
>  meta/classes/siteinfo.bbclass                      |  26 --
>  meta/conf/bitbake.conf                             |   7 -
>  meta/conf/machine/include/mips/README              |  36 ---
>  meta/conf/machine/include/mips/arch-mips.inc       | 102 --------
>  meta/conf/machine/include/powerpc/README           |  17 --
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |  34 ---
>  .../machine/include/powerpc/arch-powerpc64.inc     |  14 --
>  meta/conf/machine/include/sh/README                |  11 -
>  meta/conf/machine/include/sh/arch-sh.inc           |   9 -
>  meta/conf/machine/include/tune-mips32.inc          |  25 --
>  meta/conf/machine/include/tune-mips32r2.inc        |  17 --
>  meta/conf/machine/include/tune-mips64.inc          |   3 -
>  meta/conf/machine/include/tune-octeon.inc          |  32 ---
>  meta/conf/machine/include/tune-power5.inc          |  21 --
>  meta/conf/machine/include/tune-power6.inc          |  21 --
>  meta/conf/machine/include/tune-power7.inc          |  21 --
>  meta/conf/machine/include/tune-ppc476.inc          |  14 --
>  meta/conf/machine/include/tune-ppc603e.inc         |  14 --
>  meta/conf/machine/include/tune-ppc7400.inc         |  14 --
>  meta/conf/machine/include/tune-ppce300c2.inc       |  11 -
>  meta/conf/machine/include/tune-ppce300c3.inc       |  23 --
>  meta/conf/machine/include/tune-ppce500.inc         |  20 --
>  meta/conf/machine/include/tune-ppce500mc.inc       |  14 --
>  meta/conf/machine/include/tune-ppce500v2.inc       |  20 --
>  meta/conf/machine/include/tune-ppce5500.inc        |  20 --
>  meta/conf/machine/include/tune-ppce6500.inc        |  21 --
[Luo Zhenhua-B19537] the ppce500mc, ppce500v2, ppce5500 and ppce6500 are us=
ed by NXP QorIQ PPC targets. So the removal of related stuffs will break th=
e build for those targets in meta-fsl-ppc layer.=20


Best Regards,

Zhenhua=20

