Return-Path: <saipava@xilinx.com>
X-Greylist: delayed 16392 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Mar 2018 12:23:46 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0056.outbound.protection.outlook.com [104.47.42.56])
	by mail.openembedded.org (Postfix) with ESMTP id 84C8678956
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bgwHIQPBhuVCWuGXTnAg6qLqih0Jm0VH4GFpgS46veY=;
	b=mbufYCfSVTKGkbQCVbRko8WGsxmS8b8ff6mZdPvsgUhp//W11bn3a85jTOz6XciNXXL85dFcWqfcRFO2SbSZSbxZOP5N3c4rNR/Gnx3Q6oZf/UDsKggtuLjna3B+k9QKibB9P/eeos3O5xJk3af3UMBJ1/rnafoSULiEK/ciTrw=
Received: from MWHPR02MB2478.namprd02.prod.outlook.com (10.168.204.148) by
	MWHPR02MB2223.namprd02.prod.outlook.com (10.168.243.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Thu, 8 Mar 2018 07:50:28 +0000
Received: from MWHPR02MB2478.namprd02.prod.outlook.com
	([fe80::6821:8e57:1d78:d416]) by
	MWHPR02MB2478.namprd02.prod.outlook.com
	([fe80::6821:8e57:1d78:d416%17]) with mapi id 15.20.0548.016;
	Thu, 8 Mar 2018 07:50:27 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Ioan-Adrian Ratiu <adi@adirat.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 2/2] diffutils: allow native & nativesdk
	builds
Thread-Index: AQHTtAGZavOxosSSLkqsqfSVAYfLHqPF+++A
Date: Thu, 8 Mar 2018 07:50:27 +0000
Message-ID: <MWHPR02MB247856D9337D3D2C9C8FE2F7CADF0@MWHPR02MB2478.namprd02.prod.outlook.com>
References: <20180304234108.12711-1-adi@adirat.com>
	<20180304234108.12711-2-adi@adirat.com>
In-Reply-To: <20180304234108.12711-2-adi@adirat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=saipava@xilinx.com; 
x-originating-ip: [183.83.84.144]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB2223;
	7:KZ8HQ2bjw9sk9Tz4eCiSWphNqkIyQdY3Uv5XF63E38WIEuqboov8HizjGeihNRkCQxE8Xl+PNSqRHojXXFMIuGoIGYlJbV0hF9N+uGlfVCCv65Y+ZPU+n0gP3ww+/MzTLT1GqRSMxhQ3jmy6kd0XLOpJGzu0KycKKyED4y2zAEN7tz2cxGUeJTASNPTuGP7bYneaUbUHH8rjL/RdryNgtX+5GSQlS3bzmToGXBw2ez8sbs51Af/ep1IEAH2d9aJR
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1fd14109-61b9-4f3a-755c-08d584c9425f
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2223; 
x-ms-traffictypediagnostic: MWHPR02MB2223:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-microsoft-antispam-prvs: <MWHPR02MB22238C578590B113A7AF2005CADF0@MWHPR02MB2223.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(8121501046)(5005006)(3002001)(3231220)(944501244)(52105095)(93006095)(93001095)(10201501046)(6055026)(6041288)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:MWHPR02MB2223; BCL:0; PCL:0; RULEID:; SRVR:MWHPR02MB2223; 
x-forefront-prvs: 060503E79B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(396003)(39860400002)(366004)(39380400002)(346002)(189003)(199004)(13464003)(105586002)(53936002)(5660300001)(76176011)(3280700002)(966005)(68736007)(6246003)(66066001)(2501003)(3660700001)(5250100002)(6116002)(7736002)(305945005)(3846002)(74316002)(106356001)(2950100002)(478600001)(110136005)(97736004)(6436002)(229853002)(6306002)(9686003)(25786009)(2900100001)(53546011)(6506007)(26005)(186003)(99286004)(102836004)(55016002)(33656002)(2906002)(8936002)(8676002)(81166006)(316002)(7696005)(86362001)(81156014)(14454004)(59450400001)(1720100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2223;
	H:MWHPR02MB2478.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: yb7ZbepW6a3JVcZNMKs7BPibMz9ZUIZkiiFNNNnGG/MUgpnAV9H6n9tRKFJcQHuH/A+QQ7TEDwHQ4+6WG2i/0wMwK8jMFzZ+u+Q2NDOhKxjCyAvSu0Qwo/RW6dH30eLCQERsu9xiFWeeTMFniXJ9una8OJyO1zsLod6O3OCza0jWhg58WIlDs6v+m3qiWTqQv2Qb4IB6zyoXhTnW4Engzu9HFk6fiE7Y5lt6uMZ8nHFommhGQfE9H7xIlTFr+adeKFjxJsTgVcBQHFvjik65HLxsVQ7Bg8e8kxXXumLwK0MyJo65JzRPJIEBI5EobKNpzOEk0COkHEOONWF5A7YHbw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd14109-61b9-4f3a-755c-08d584c9425f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2018 07:50:27.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2223
Subject: Re: [PATCH v2 2/2] diffutils: allow native & nativesdk builds
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
X-List-Received-Date: Thu, 08 Mar 2018 12:23:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch breaks nativesdk-qemu build with x86_64-oesdk-mingw32 toolchain.=
 Below are the errors i see

| In file included from ./fcntl.h:67:0,
| from ../../diffutils-3.6/lib/careadlinkat.h:23,
| from ../../diffutils-3.6/lib/areadlink.c:27:
| ./unistd.h:592:11: fatal error: getopt-cdefs.h: No such file or directory
| # include <getopt-cdefs.h>
| ^~~~~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [areadlink.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| In file included from ../../diffutils-3.6/lib/c-stack.c:72:0:
| ./unistd.h:592:11: fatal error: getopt-cdefs.h: No such file or directory
| # include <getopt-cdefs.h>
| ^~~~~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [c-stack.o] Error 1
| In file included from ./fcntl.h:67:0,
| from ../../diffutils-3.6/lib/binary-io.h:22,
| from ../../diffutils-3.6/lib/binary-io.c:20:
| ./unistd.h:592:11: fatal error: getopt-cdefs.h: No such file or directory
| # include <getopt-cdefs.h>
| ^~~~~~~~~~~~~~~~
| compilation terminated.
| In file included from ./fcntl.h:67:0,
| from ../../diffutils-3.6/lib/careadlinkat.h:23,
| from ../../diffutils-3.6/lib/careadlinkat.c:23:
| ./unistd.h:592:11: fatal error: getopt-cdefs.h: No such file or directory
| # include <getopt-cdefs.h>
| ^~~~~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [binary-io.o] Error 1
| make[2]: *** [careadlinkat.o] Error 1
| In file included from ./fcntl.h:67:0,
| from ../../diffutils-3.6/lib/localcharset.c:25:
| ./unistd.h:592:11: fatal error: getopt-cdefs.h: No such file or directory
| # include <getopt-cdefs.h>
| ^~~~~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [localcharset.o] Error 1
| In file included from ./fcntl.h:67:0,
| from ../../diffutils-3.6/lib/freopen-safer.c:25:
| ./unistd.h:592:11: fatal error: getopt-cdefs.h: No such file or directory
| # include <getopt-cdefs.h>
| ^~~~~~~~~~~~~~~~
| compilation terminated.

Thanks,
Sai Pavan

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Ioan-Adrian Ratiu
> Sent: Monday, March 5, 2018 5:11 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2 2/2] diffutils: allow native & nativesdk bui=
lds
>=20
> Required by the new dtc rdepends to avoid errors like this:
>=20
> ERROR: Required build target 'ionel-rpi-image' has no buildable providers=
.
> Missing or unbuildable dependency chain was: ['ionel-rpi-image', 'natives=
dk-
> packagegroup-sdk-host', 'nativesdk-qemu', 'nativesdk-dtc', 'nativesdk-
> diffutils']
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adi@adirat.com>
> ---
>  meta/recipes-extended/diffutils/diffutils.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes=
-
> extended/diffutils/diffutils.inc
> index 7c5be50fb7..c9e3130587 100644
> --- a/meta/recipes-extended/diffutils/diffutils.inc
> +++ b/meta/recipes-extended/diffutils/diffutils.inc
> @@ -10,3 +10,4 @@ inherit autotools texinfo update-alternatives gettext
> ALTERNATIVE_${PN} =3D "diff cmp"
>  ALTERNATIVE_PRIORITY =3D "100"
>=20
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.16.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

