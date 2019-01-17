Return-Path: <prvs=9132d74bb=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id F2FB179DED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547750119; x=1579286119;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Qa3419RnuHEy6b1360V94bpHJRy1Iudhm/rDCmnEW3w=;
	b=cDeqFbnVQRftEuvtoaE1lTMDZN4f1yj1us0o/6blrOIq78n0h6naKJ7P
	OQZOhNI13SRbymdQi1r6loQw0l623IVAU6wwFPwVJNAQB1u/7O9oNqgav
	9EW6zN9ZGuF72gI18sBG7+ygLfWejPGdi39+xRWfhQL3C5afjOc4HraCE
	jrNlPnxoPgfIcBD8eieFpAgCJUWYI6Nc4jj/tKJzg1U6qOYKmidPKwL2z
	1mD3eS94rlJaXCUtKx/xBV28mFvN0KiNUVs5M2sgdQ2QJc14O683kaSRf
	w1ix/SyEOBAUxbSJX+7tVZfQRQZdWZe2NHI3Fgd5HX64t8qSfc7R6NX3S Q==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="99064849"
Received: from mail-by2nam05lp2056.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.56])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 02:35:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6HxOz8mqmTjA9lDvdnTrfaFKb6n+LQXCPOd1i3d/Yg4=;
	b=N3k+SrCgvg+IWQphDfIm40gQUgaEr3KBqlyjngLMUp22t/U+mDUafX2UI+ZImnfcgvDFh+d2sUleb4anlfwxkpO3p3/yWZBj856tsFj13o4zp5CtI3EUynpPHso08cyBTxPUOvASZjPIIQ/L3z5hExfphErOBj4Qpy5iEpTzoGk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1136.namprd04.prod.outlook.com (10.173.51.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Thu, 17 Jan 2019 18:35:17 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Thu, 17 Jan 2019 18:35:17 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v4] gstreamer: Add RISC-V support
Thread-Index: AQHUrpNku2qbW3e/DkOBll6HDKZqiA==
Date: Thu, 17 Jan 2019 18:35:17 +0000
Message-ID: <20190117183509.24115-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR0201CA0105.namprd02.prod.outlook.com
	(2603:10b6:301:75::46) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1136;
	6:UREsPrZu6qkRIZ03ltPmJR/mThUdQfRaqja/8qV5Oqnev8LwT19uf+VhZW3wXADKM6WRIZwsac9XrECq4RVKohpYQhOzD+ty3dvyFImeVbg38jNGbkUuSbaVn2Izf8xRHbOejCTbRWmgxhA7cHN4FaeoV9ZmYmSXiAhDmlfpaOMmzkDtU0ShSibrbOjWbyvYcL414qnu8erpt56Nkspdvd34j2qFTuCSn4Oxftab7yTLyY3CKsLn0HqS8TZZSpr6rbHBw4Vu8xHM0oe+Qx664DKTz32d/CHZUXlzTW9VQqru/Hgz3jZjLcpX7R7TIDprKrSTDsb+4YilYmY/FLc5Pv55n/tFJlNZvIYUU1qda3Z3jiivbOYy/5TLtkY91Xw/FgRJHOk1O8if8xynararjqrKI3phMQ4i4xwY5F8EjW51DCKwgWF81Ng8ISl+deL//qItit6VexLnDZQW5QTfsg==;
	5:S4LpkopK0WxEhysTchjlK17Ucqf+JFnohspeVQqIU+KJ15N+vDqXXa4tHADQgGjyZvKqNOm8OksU26d0i6IEXKOQv8jt/dn1ab/THNCj5+rp4KA4vUAXUk7Lk+KShwUlKAU2N468Krg3wpbfQKmg9CCycyJOVXAacue2+0htodaizI2mvxIhm5vphpI1TKtLrMBGaQMg19AZGPbiAjNdzw==;
	7:Ow78VPQbshcYn72Tt8YzRdmhr7DT9AxL3kMeS0YwBQ2oRRpOmv1Z+Xvwp1iMQI3iJaAj0ka5E1KoGSenqoQceSyYo7OSYoVe1WRJ1DrO3hJ0xjaPT+ZQHHRpm3LZ84S3YCYecRGPLznKS8cDN2RI9w==
x-ms-office365-filtering-correlation-id: a0934960-c977-4827-0738-08d67caa86cd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1136; 
x-ms-traffictypediagnostic: MWHPR04MB1136:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1136A8ADF4F9CB2934822BE690830@MWHPR04MB1136.namprd04.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(6506007)(386003)(5660300001)(97736004)(316002)(26005)(4326008)(39060400002)(7736002)(2351001)(52116002)(966005)(81156014)(6306002)(478600001)(72206003)(106356001)(8676002)(86362001)(305945005)(6512007)(105586002)(14454004)(81166006)(68736007)(53936002)(6916009)(25786009)(66066001)(476003)(6116002)(71200400001)(71190400001)(5640700003)(2616005)(3846002)(486006)(8936002)(6486002)(44832011)(6436002)(14444005)(36756003)(2501003)(50226002)(2906002)(186003)(102836004)(99286004)(54906003)(256004)(1076003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1136;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f2rBWQgGs0R8vhgYUImGg2mZ+4Nh/0G/KTOoERKn1zW2aY5WKctxuD2Ut6XzhghrgNoA5NGMHhlyoO+Dzth0DZGsunoAejP1Z6EpHZPD5+gtLJJPnpNuhmm19SwLSwblWiQjcAULC6mKl8CN+M5sT9sd/X+ubMVkEE3/0DPKJpZKig7I9elSbXcKGaZ+uVxzC1bm4RZfkjqUiBUdg3ipTAzvqxXCw+TGsBrjJ19sMFB+EKveqpQHsj9xkPel6czBHgciLBzKWmfRMLaBKiuHn4riM+erpFPYqRl5ve0eKfhuAd7Esu5HmgjyTj9JSLoskpgQQJMNmXYD2SVfXi05rKa9gr/VNs2Jzf77aR3nYZWCS2dvPQI18UTvTiGbL7gArekwBApIxreMMK2m5zwSAwRYnjMeXBcDHhBA28HVinQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0934960-c977-4827-0738-08d67caa86cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 18:35:16.6101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1136
Subject: [PATCH v4] gstreamer: Add RISC-V support
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
X-List-Received-Date: Thu, 17 Jan 2019 18:35:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Backport RISC-V support from master Gstreamer.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...stconfig.h.in-initial-RISC-V-support.patch | 30 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.14.4.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0002-gstconfig.=
h.in-initial-RISC-V-support.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-in=
itial-RISC-V-support.patch b/meta/recipes-multimedia/gstreamer/files/0002-g=
stconfig.h.in-initial-RISC-V-support.patch
new file mode 100644
index 0000000000..db742dea23
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/0002-gstconfig.h.in-initial-R=
ISC-V-support.patch
@@ -0,0 +1,30 @@
+From 8a156d1725ecd03f2e8cdc8874e081dda2d3b43d Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sun, 15 Apr 2018 00:49:55 +0200
+Subject: [PATCH] gstconfig.h.in: initial RISC-V support
+
+RISC-V supports unaligned accesses, but these might run extremely slowly
+depending on the implementation. Therefore set GST_HAVE_UNALIGNED_ACCESS
+to 0 on this architecture.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=3D795271
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Accepted [1.15.1 - https://bugzilla.gnome.org/show_bug.cg=
i?id=3D795271]
+---
+ gst/gstconfig.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/gstconfig.h.in b/gst/gstconfig.h.in
+index 6351c04da..33dfed1f6 100644
+--- a/gst/gstconfig.h.in
++++ b/gst/gstconfig.h.in
+@@ -104,7 +104,7 @@
+  * http://docs.oracle.com/cd/E19205-01/820-4155/c++_faq.html#Vers6
+  * https://software.intel.com/en-us/node/583402
+  */
+-#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined=
(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__)=
 || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || de=
fined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc)=
 || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M=
_IA64) || defined(__xtensa__) || defined(__e2k__)
++#if defined(__alpha__) || defined(__arc__) || defined(__arm__) || defined=
(__aarch64__) || defined(__bfin) || defined(__hppa__) || defined(__nios2__)=
 || defined(__MICROBLAZE__) || defined(__mips__) || defined(__or1k__) || de=
fined(__sh__) || defined(__SH4__) || defined(__sparc__) || defined(__sparc)=
 || defined(__ia64__) || defined(_M_ALPHA) || defined(_M_ARM) || defined(_M=
_IA64) || defined(__xtensa__) || defined(__e2k__) || defined(__riscv)
+ #  define GST_HAVE_UNALIGNED_ACCESS 0
+ #elif defined(__i386__) || defined(__i386) || defined(__amd64__) || defin=
ed(__amd64) || defined(__x86_64__) || defined(__ppc__) || defined(__ppc64__=
) || defined(__powerpc__) || defined(__powerpc64__) || defined(__m68k__) ||=
 defined(_M_IX86) || defined(_M_AMD64) || defined(_M_X64) || defined(__s390=
__) || defined(__s390x__) || defined(__zarch__)
+ #  define GST_HAVE_UNALIGNED_ACCESS 1
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb b/met=
a/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
index 232234b888..98c9a28e39 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
@@ -25,6 +25,7 @@ SRC_URI =3D " \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch=
 \
     file://add-a-target-to-compile-tests.patch \
+    file://0002-gstconfig.h.in-initial-RISC-V-support.patch \
     file://run-ptest \
 "
 SRC_URI[md5sum] =3D "f67fbbc42bd85a0701df119f52fb52bd"
--=20
2.19.1


