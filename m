Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0076.outbound.protection.outlook.com [207.46.100.76])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4456E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:35:12 +0000 (UTC)
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) by
	BY1PR0701MB1593.namprd07.prod.outlook.com (25.162.110.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Tue, 21 Apr 2015 10:35:13 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) by
	BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 21 Apr 2015 10:35:12 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) by
	BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) with
	mapi id 15.01.0136.026; Tue, 21 Apr 2015 10:35:12 +0000
From: "Krishnanjanappa, Jagadeesh"
	<Jagadeesh.Krishnanjanappa@caviumnetworks.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] ghostscript: add objarch.h for armeb
Thread-Index: AQHQdpbaWrEyymYlaUG2KXW4KAAT/p1XTSYX
Date: Tue, 21 Apr 2015 10:35:12 +0000
Message-ID: <1429612511177.75323@caviumnetworks.com>
References: <1429004328-31212-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
In-Reply-To: <1429004328-31212-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [111.93.218.67]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY1PR0701MB1144;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY1PR0701MB1593; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(40100003)(450100001)(99286002)(46102003)(19580395003)(77156002)(2656002)(107886001)(92566002)(86362001)(102836002)(122556002)(110136001)(54356999)(2351001)(2950100001)(62966003)(76176999)(50986999)(66066001)(106116001)(117636001)(2501003)(87936001)(2900100001)(36756003)(19580405001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1144;
	H:BY1PR0701MB1144.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BY1PR0701MB11442DD8149C3AADE65140A98EEF0@BY1PR0701MB1144.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BY1PR0701MB1144; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0701MB1144; 
x-forefront-prvs: 0553CBB77A
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2015 10:35:12.1826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1144
X-OriginatorOrg: caviumnetworks.com
Subject: Re: [PATCH] ghostscript: add objarch.h for armeb
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
X-List-Received-Date: Tue, 21 Apr 2015 10:35:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping, Is it going to be merged into fido branch?

Regards,
Jagadeesh
________________________________________
From: Krishnanjanappa, Jagadeesh
Sent: Tuesday, April 14, 2015 3:08 PM
To: openembedded-core@lists.openembedded.org
Cc: Krishnanjanappa, Jagadeesh
Subject: [OE-core][PATCH] ghostscript: add objarch.h for armeb

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetwork=
s.com>

ghostscript application fails to fetch objarch.h file while building for ar=
meb.
The fetch failure is due to absence of this file in the default set of
directories that the OpenEmbedded build system searches (i.e FILESPATH)
for patches and files. This patch adds the required objarch.h file for
armeb in one of the default locations where OpenEmbedded build system searc=
hes.

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@cavium=
networks.com>
---
 .../ghostscript/ghostscript/armeb/objarch.h        | 40 ++++++++++++++++++=
++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/armeb/obj=
arch.h

diff --git a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h =
b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
new file mode 100644
index 0000000..359097f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+        /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+        /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 2
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 4
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+        /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+        /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
--
1.8.2.3


