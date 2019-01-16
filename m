Return-Path: <prvs=9129a664c=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 167D17C1A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 22:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547679322; x=1579215322;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=yXL9BmtSrojHmjssgDO6CTXCzsoM/XLcwkx5k4ZYdXc=;
	b=CFIqIc6StNdclYcJJ/yN1RtzGGJSowBd858NgIRY7+DXJWvpPjJ8zogH
	T9DJOtT4AMQM4xdOhArf/xZcMgToX87UTJ+pMgo5arlkBfa/okZAT5puT
	OfwLnm+ndfF10vgACBldja/niSjRDtdxvLslkSbkYWjIR0VW1kJ/vnr+4
	3mA2PWxf2Rl6JExajiS99bZv0DHPIqq+9rqB4s7EjDNMSscpv1f/kttVl
	3Z0DF81FFUtxUvS3WHKhFx84h52tOtkcgQ4XgYPSBMNY6yVgRdptoqy9p
	nWl2F78qKiLy3bLUbvH2XF6jXynh0xvtpoDFc4I/vjnhUkAv/OjKOGyNY Q==;
X-IronPort-AV: E=Sophos;i="5.56,487,1539619200"; d="scan'208";a="100205518"
Received: from mail-bn3nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.51])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jan 2019 06:55:21 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iMKqgqtgc73UHp69GT/BJSF2TvS/7Uzq6Q49nB3F+Js=;
	b=fFbgb5WVqqVlcxcwBKSQEy+hs/7Bv8ZZclR0FwCezyT1cURttWEgrAVLyjkk+v4hfwosJAwAZbtf1/QUyFsz/b6h3wqxpkLOuxqE8BUNB1em+2ghj/T5LU1L51ousVJeIlxk+xmd/jK8Ec1pPLNzDSN9RV1vplWk4hMosVMF26E=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0993.namprd04.prod.outlook.com (10.174.250.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Wed, 16 Jan 2019 22:55:19 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Wed, 16 Jan 2019 22:55:19 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] mesa: Allow building the r600 driver
Thread-Index: AQHUre6NcsSopGZtPE+IyWj3LNW69w==
Date: Wed, 16 Jan 2019 22:55:18 +0000
Message-ID: <20190116225507.10907-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: CO2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:100::18)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0993;
	6:QrdjJXp6h2ehbdWK4OjqwmaqobRMRi0/LyHMmKKrvGkH62EKAPsEn7TRXN28R9IKW7HHCENeAakqBmeUllIavNoVB/tqXCfoHUP64jGN4L+2eV0mpW309yLbsoQgaD9Klp7gA0CWH3lEnMw/GcPR5ZpLtZFHsX3a7yu4NQ4rB+oGApTKCr1A/BGQwpg2qZW5yuoIDldblMG4EvVy8x7iokh8jE/z76A6QaCgewezz+wNvlCNS9bi9nZQRo4aN+NGemlrcGAJxBWC57c1WrioUqKvJ5fhPjSmAWtx7PZknNYhXLhQzhunc87TEtesq0UkVE/d6jHQHC4FIGFFDAhgbyZnIIoSyDbWCabrnYcNlWsi/4fTXEBHnjWELci27JW1Ik3vRreKwNLBJrwATDrddjii8id5yY1TGdY0d4H+2EZRdZ6ZZ6D6GVjRrUcet4hqIDzSRjAAfXx67qlugRc/0w==;
	5:0vQut1rZbJaRu7gu5R84m4GE0PBkkMtnT+Sv7FmPbP+GrMqgVfcJcvdMqMovg9h0ace+XnXtJDZo4X7Rx4zIDZyPF98MHhvMBBprCVVwP408lv8uCwjboEJWDjrKW600A5pRwB0+9scnB5BJL203XW2IGP7wyMsXXyeBtlYnCQWAErYNcfQNgBaT4oZG6F+vGs41Rk6GUG4CEKVVTZWdNA==;
	7:/JI2eYQwYr3HKmny+ZBZWQ/0FE9aE/vDsni/T2Ko+14W+s6w/9artc88rv8CXxAAaltk/Uiitps00zdEr3pEalN7pLSARAa2uPJkcGZlMCd0XDUIWykFSThHuTPtze0nYDbz0XZBhAz6dwkTvFvBzQ==
x-ms-office365-filtering-correlation-id: ed2dec38-0d26-4193-92ac-08d67c05afce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0993; 
x-ms-traffictypediagnostic: MWHPR04MB0993:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09931EEED812DA8065D3DF1290820@MWHPR04MB0993.namprd04.prod.outlook.com>
x-forefront-prvs: 091949432C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(366004)(39860400002)(346002)(396003)(199004)(189003)(81156014)(81166006)(6486002)(1076003)(476003)(486006)(8676002)(8936002)(36756003)(14454004)(105586002)(2616005)(316002)(2501003)(50226002)(44832011)(256004)(66066001)(6512007)(106356001)(97736004)(54906003)(26005)(7736002)(186003)(3846002)(99286004)(6116002)(5640700003)(68736007)(6436002)(71190400001)(86362001)(71200400001)(52116002)(5660300001)(53936002)(386003)(6916009)(72206003)(478600001)(2351001)(6506007)(39060400002)(4326008)(102836004)(2906002)(305945005)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0993;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HmYW+ScqsrMtRMloKNSxiHnnep5CTv63qBdMcpJkX7yohQf8DjNs2hJFftMzSCaW3qPMdU86tGyGJvtI9PHulLPeHIZ2vN/glKcmIrCyGR3FXRjXWzZ7ygM3I9gfVrk4z69Qeo35d3wmwbFKumyxk6xOGtc4GPh/391llrz91N/tD2qC5siUCtFkEchi2yUSdC1XmfI28FZ0ZB6SZfSrwCXZkFXOHP5pNIfRprR5LnI1gqtro0pLrdXUPcm6z7mX3BQWb+w47PWWAlfXa4bpzLNGlaeerKjulu5p9K2m/3wkBE5p49sMqmNQBLO/DuBqwzcyAqX9MrEImxno6/dQLTWYBxPlKWgSg9SAGo0AteMB6ToPTPgUS8f9KsIXHAtyAWQi0q6HIUepoSBL7oUwPoLbLeij3W3baD+Rm8aD3rI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2dec38-0d26-4193-92ac-08d67c05afce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2019 22:55:18.4474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0993
Subject: [PATCH] mesa: Allow building the r600 driver
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
X-List-Received-Date: Wed, 16 Jan 2019 22:55:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The r600 DRI driver does not require LLVM, so remove it from the LLVM
dependency PACKAGE_CONFIG.

Also remove the x86 requirement on the drivers as they are work on
non-x86 systems. This was tested on a RISC-V board.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index 0cc0a82de4..a21d933dd8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -85,14 +85,18 @@ PACKAGECONFIG[imx] =3D ""
 GALLIUMDRIVERS =3D "swrast"
 GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',=
 ',etnaviv', '', d)}"
 GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'imx', ',i=
mx', '', d)}"
-GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600', '=
radeonsi,r600', '', d)}"
-PACKAGECONFIG[r600] =3D ""
+
+# radeonsi requires LLVM
+GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600', '=
,radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVM33_ENABLED =3D "${@oe.utils.version_less_or_equal('MESA=
_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
 GALLIUMDRIVERS_LLVM =3D "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' i=
f ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
-GALLIUMDRIVERS_append_x86 =3D "${@bb.utils.contains('PACKAGECONFIG', 'gall=
ium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS_append_x86-64 =3D "${@bb.utils.contains('PACKAGECONFIG', 'g=
allium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS_append_x86 =3D ",virgl"
-GALLIUMDRIVERS_append_x86-64 =3D ",virgl"
+
+PACKAGECONFIG[r600] =3D ""
+
+GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium-=
llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600', '=
,r600', '', d)}"
+GALLIUMDRIVERS_append =3D ",virgl"
+
 # keep --with-gallium-drivers separate, because when only one of gallium v=
ersions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      =3D "--enable-texture-float --with-gallium-dri=
vers=3D${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?=3D "6.0"
--=20
2.19.1


