Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 56060 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Apr 2019 20:31:03 UTC
Received: from APC01-SG2-obe.outbound.protection.outlook.com
	(mail-oln040092253038.outbound.protection.outlook.com [40.92.253.38])
	by mail.openembedded.org (Postfix) with ESMTP id AC9057D106
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 20:31:03 +0000 (UTC)
Received: from PU1APC01FT019.eop-APC01.prod.protection.outlook.com
	(10.152.252.51) by PU1APC01HT138.eop-APC01.prod.protection.outlook.com
	(10.152.253.158) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16;
	Wed, 17 Apr 2019 04:56:42 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM (10.152.252.57) by
	PU1APC01FT019.mail.protection.outlook.com (10.152.252.222) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1771.16 via Frontend Transport; Wed, 17 Apr 2019 04:56:42 +0000
Received: from PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::a9fb:86c9:a1ef:59ec]) by PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	([fe80::a9fb:86c9:a1ef:59ec%5]) with mapi id 15.20.1792.020;
	Wed, 17 Apr 2019 04:56:42 +0000
From: Alistair Francis <alistair@alistair23.me>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] u-boot: Fix missing Python.h build failure
Thread-Index: AQHU9Nny9j5vCy4ZwEOk9iD4aY1iyg==
Date: Wed, 17 Apr 2019 04:56:41 +0000
Message-ID: <PSXP216MB0277954FFCBA2B28C7A2C6EEDD250@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0020.namprd08.prod.outlook.com
	(2603:10b6:a03:100::33) To PSXP216MB0277.KORP216.PROD.OUTLOOK.COM
	(2603:1096:300:a::18)
x-incomingtopheadermarker: OriginalChecksum:B6616BBA9F450EDC600A95532145A136E359627F1E08EDDFE6CCEFB4C38511BC;
	UpperCasedChecksum:7CC78390DB5C3A4CD193512AC40D10C540F9AA2E59DEAC8F096E0B748E311471;
	SizeAsReceived:7455; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-tmn: [6+NfhjhqbBonNEbaQwSiRwSX0DzKu52WPAM4CrT2LmMYKZeBdlowJVsXjlYZXPMM]
x-microsoft-original-message-id: <20190417045626.16216-1-alistair@alistair23.me>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:PU1APC01HT138; 
x-ms-traffictypediagnostic: PU1APC01HT138:
x-microsoft-antispam-message-info: Mzfd25Jc7ZfwTy6aciEKOI4GF5bVrey9htpjA2Rjf+pvm8WhY3gro7J5QMCGZgVPoIvvsuz6nQPVG4CZ/rAVaTM3xe2YduZYD6T3zGQ8nOEorRxeZ3GlFSQXwtWfxgdvKiVOH+hrqYQTJSAtfxFCw2cyUCW6otyh2hw9TYQqmAF/xS0kKrGaz77/yBrYSCHJ
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bb998a22-a7ee-4369-4a19-08d6c2f114ea
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 04:56:41.9934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT138
Subject: [PATCH] u-boot: Fix missing Python.h build failure
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
X-List-Received-Date: Wed, 17 Apr 2019 20:31:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 ...rt-pylibfdt-Use-Python-2-in-Makefile.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-=
Python-2-in-Makefile.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-=
2-in-Makefile.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Us=
e-Python-2-in-Makefile.patch
new file mode 100644
index 0000000000..a7c934d49e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-Revert-pylibfdt-Use-Python-2-in-Ma=
kefile.patch
@@ -0,0 +1,37 @@
+From 30f41eae3d7a3d07e1d62b98d11430d5b2d24513 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair@alistair23.me>
+Date: Sat, 13 Apr 2019 13:41:58 -0700
+Subject: [PATCH] Revert "pylibfdt: Use Python 2 in Makefile"
+
+This reverts commit 03e6151d5bb42fd055e9c1e571440359bd5b5282.
+
+Revert the patch to avoid:
+| scripts/dtc/pylibfdt/libfdt_wrap.c:149:11: fatal error: Python.h: No suc=
h file or directory
+|  # include <Python.h>
+|            ^~~~~~~~~~
+| compilation terminated.
+
+errors when buildling u-boot in OE.
+
+Signed-off-by: Alistair Francis <alistair@alistair23.me>
+Upstream-Status: Inappropriate [configuration]
+---
+ scripts/dtc/pylibfdt/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/dtc/pylibfdt/Makefile b/scripts/dtc/pylibfdt/Makefile
+index 15e66ad44d..c769d7db06 100644
+--- a/scripts/dtc/pylibfdt/Makefile
++++ b/scripts/dtc/pylibfdt/Makefile
+@@ -21,7 +21,7 @@ quiet_cmd_pymod =3D PYMOD   $@
+ 		CPPFLAGS=3D"$(HOSTCFLAGS) -I$(LIBFDT_srcdir)" OBJDIR=3D$(obj) \
+ 		SOURCES=3D"$(PYLIBFDT_srcs)" \
+ 		SWIG_OPTS=3D"-I$(LIBFDT_srcdir) -I$(LIBFDT_srcdir)/.." \
+-		$(PYTHON2) $< --quiet build_ext --inplace
++		$(PYTHON) $< --quiet build_ext --inplace
+=20
+ $(obj)/_libfdt.so: $(src)/setup.py $(PYLIBFDT_srcs) FORCE
+ 	$(call if_changed,pymod)
+--=20
+2.20.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index a0212e1b6b..5e81cabdbd 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,6 +10,8 @@ PE =3D "1"
 # repo during parse
 SRCREV =3D "3c99166441bf3ea325af2da83cfe65430b49c066"
=20
-SRC_URI =3D "git://git.denx.de/u-boot.git"
+SRC_URI =3D "git://git.denx.de/u-boot.git \
+           file://0001-Revert-pylibfdt-Use-Python-2-in-Makefile.patch \
+          "
=20
 S =3D "${WORKDIR}/git"
--=20
2.20.1


