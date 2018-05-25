Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 1047 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 May 2018 04:20:11 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0053.outbound.protection.outlook.com [104.47.38.53])
	by mail.openembedded.org (Postfix) with ESMTP id B1A8474D5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 04:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0xsk2w/D2xOpI4ARLlBhZy360FOdJez/iEBp7awjseI=;
	b=H2iNbsAXCSD6ggUbAXJIxCUm+2yPqEm00K+mJHNkqy8zSfzV4QWUEuEk9kMwoYGaCqaOQh8bUzJ4iGlx4ruljWtLHRDfweMacYj9WiLtYqSBuXv+ZDkHuEVVVIz4bt072mj/+UjPvpFrJHThvI5jdf/3vt1JGe2mPop2t6vol2c=
Received: from DM5PR02MB3863.namprd02.prod.outlook.com (52.132.139.146) by
	DM5PR02MB3308.namprd02.prod.outlook.com (10.164.152.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.797.11; Fri, 25 May 2018 03:48:10 +0000
Received: from DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::89f0:1965:7ede:719]) by DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::89f0:1965:7ede:719%13]) with mapi id 15.20.0797.011;
	Fri, 25 May 2018 03:48:09 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/3] Add Newlib as a C library for baremetal
Thread-Index: AQHT8u+jaZsUDCezO0W3xhIYgowv26Q/z46g
Date: Fri, 25 May 2018 03:48:09 +0000
Message-ID: <DM5PR02MB3863951AD39D889FE6E66938B9690@DM5PR02MB3863.namprd02.prod.outlook.com>
References: <cover.1527114300.git.alejandr@xilinx.com>
In-Reply-To: <cover.1527114300.git.alejandr@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [106.51.108.246]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR02MB3308;
	7:+QYPaNRYBeChEwUiwdsO7GkPdQl7VGwoCjIIi4IKlOevGDxEq7V3S6QA+mAMhOERPBrbex9tD9cC2IktAqRyoUEiyimboXiO6ooJEA/Oe2G5j2q/AnDuFyp0KWClIEhXY+IquPEC/LiqR3sCrdVqtBPkdhne2jdmF+0WiL9Gz216Ap0ixGGE1bhSXA56CAG3gAh/MgEUNG/57t66OODC8UFrx/OT/s81ABHCZG4GJomzEf2rfphlBHzEG7yrtnuT
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39380400002)(366004)(376002)(39860400002)(199004)(189003)(377424004)(13464003)(9456002)(14454004)(486006)(105586002)(446003)(476003)(11346002)(66066001)(8676002)(81156014)(81166006)(8936002)(68736007)(110136005)(86362001)(72206003)(316002)(478600001)(6116002)(106356001)(305945005)(7736002)(74316002)(2501003)(3846002)(5250100002)(3280700002)(26005)(7696005)(76176011)(229853002)(3660700001)(2900100001)(59450400001)(102836004)(2906002)(53546011)(99286004)(6506007)(25786009)(6436002)(55016002)(33656002)(6246003)(5660300001)(9686003)(97736004)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3308;
	H:DM5PR02MB3863.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR02MB3308; 
x-ms-traffictypediagnostic: DM5PR02MB3308:
x-microsoft-antispam-prvs: <DM5PR02MB3308560F955EF292523740A9B9690@DM5PR02MB3308.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(278428928389397)(264703809997249)(192813158149592); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231254)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB3308; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB3308; 
x-forefront-prvs: 06833C6A67
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 2VWABfenJr4VVqgd5Rnvpze9p/mxKR1mlnJE/CRjlxrZUbAeRaa2dBqcuLoOtWQV+c5aHiaY0B5c1nvOvw84rfuGAYR93dJnZRGEZI/79hPxwIrUuUP96F0QiWWtp02OOk9W+1156/5ndudlu3UODQ7YD3rrG3/7c26bbSkX/P2W5wXWr+YOW4ZIy0QerfJ4
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 47ecbc6e-ce1a-44ff-84e7-08d5c1f25505
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ecbc6e-ce1a-44ff-84e7-08d5c1f25505
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2018 03:48:09.4058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3308
Subject: Re: [PATCH 0/3] Add Newlib as a C library for baremetal
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
X-List-Received-Date: Fri, 25 May 2018 04:20:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alejandro Enedino Hernandez Samaniego
> Sent: Wednesday, May 23, 2018 4:09 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/3] Add Newlib as a C library for baremetal
>=20
> Newlib is a widely used C library for embedded systems, its mainly used f=
or
> resource constrained devices which run baremetal applications.
>=20
> It provides basic C library functionality, and it is meant to be extended=
 by design,
> it contains several stubs for core functions that can be later overriden =
with the
> symbols provided from another library at linking time.
>=20
> Libgloss is the BSP part of the library which follows the same principle,=
 where a
> BSP layer can override functionality or even application runtime dependin=
g on the
> processor architecture.
>=20
> These patches add both the libgloss and newlib recipes, provide functiona=
lity to
> make them extendable by other libraries if required, and also create a ne=
w TCLIBC
> variant, which can now be set to newlib to build the toolchain for applic=
ations
> where its suitable.
>=20
> Newlib is also usually used by vendors to provide embedded toolchains, wh=
ich is
> interesting since, this enables OE to build such toolchains in a somewhat
> automated way.
>=20
> These patches have been tested on my end in the following ways:
>=20
> - meta-toolchain builds successfully on qemux86, qemux86-64, qemuarm,
> qemuarm64,
>   qemuppc, qemumips.
> - A helloworld application that lays in another layer was built for qemux=
86,
> qemux86-64
>   qemuarm, qemuarm64, qemuppc, qemumips, and it seems to have been built
> correctly.
> - The hardware that I have available is from Xilinx, where Xilinx already=
 had a
>   baremetal application they ran on it, I was able to build the same appl=
ication
>   with a recipe, that used the toolchain coming from these patches
> (TCLIBC=3Dnewlib).
>   I ran the application on hardware and confirmed that it was built and w=
orking
> correctly.
> - meta-toolchain builds successfully for the previously mentioned HW MACH=
INE
> as well.
> - I also have a meta-freertos (its a possibility) layer that builds a Fre=
eRTOS
> application

Can we put out this layer on github for evaluation?=20
Community member is interested in such a layer?

>   that runs on qemuarm, and instead of using the provided ARM Embedded
> Toolchain, I used
>   the one coming from these patches and was able to obtain the same resul=
t.
> - I built world for all the previously mentioned MACHINES (qemus and HW) =
just to
> make sure
>   that this did not affect other OE components, and it did not seem to be=
 the case.
>=20
> The following changes since commit
> 7897fb35a3420c2555ab59dfa438217ada4a9784:
>=20
>   libnss-mdns: fix postinst and postrm (2018-05-22 13:13:33 +0100)
>=20
> are available in the git repository at:
>=20
>   git://push.yoctoproject.org/poky-contrib aehs29/newlib
>=20
> Alejandro Enedino Hernandez Samaniego (3):
>   newlib: Adds newlib and libgloss recipes
>   insane.bbclass: Adds powerpc to elf headers machine dictionary
>   tclibc-newlib: Adds a new TCLIBC variant to build with newlib as C
>     library
>=20
>  meta/classes/cross-canadian.bbclass                |  2 +-
>  meta/classes/insane.bbclass                        |  1 +
>  meta/conf/distro/include/tclibc-newlib.inc         | 47 ++++++++++++++++=
++
>  .../newlib/libgloss/fix-rs6000-crt0.patch          | 41 +++++++++++++++
>  .../libgloss/fix_makefile_include_arm_h.patch      | 30 +++++++++++
>  meta/recipes-core/newlib/libgloss_3.0.0.bb         | 32 ++++++++++++
>  meta/recipes-core/newlib/newlib.inc                | 58 ++++++++++++++++=
++++++
>  meta/recipes-core/newlib/newlib_3.0.0.bb           | 19 +++++++
>  meta/recipes-devtools/gcc/gcc-cross.inc            |  1 +
>  meta/recipes-devtools/gcc/libgcc-common.inc        |  5 ++
>  10 files changed, 235 insertions(+), 1 deletion(-)  create mode 100644
> meta/conf/distro/include/tclibc-newlib.inc
>  create mode 100644 meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.pat=
ch
>  create mode 100644 meta/recipes-
> core/newlib/libgloss/fix_makefile_include_arm_h.patch
>  create mode 100644 meta/recipes-core/newlib/libgloss_3.0.0.bb
>  create mode 100644 meta/recipes-core/newlib/newlib.inc
>  create mode 100644 meta/recipes-core/newlib/newlib_3.0.0.bb
>=20

Acked-by : Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

Thanks,
Manju

