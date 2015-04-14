Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0061.outbound.protection.outlook.com [157.56.111.61])
	by mail.openembedded.org (Postfix) with ESMTP id 388BB6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:53:51 +0000 (UTC)
Received: from BN3PR0701MB1137.namprd07.prod.outlook.com (25.160.114.150) by
	BN3PR0701MB1298.namprd07.prod.outlook.com (25.160.118.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.130.23; Tue, 14 Apr 2015 09:39:06 +0000
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
Received: from Ubuntu64.mydomain.com (111.93.218.67) by
	BN3PR0701MB1137.namprd07.prod.outlook.com (25.160.114.150) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Tue, 14 Apr 2015 09:39:04 +0000
From: "Krishnanjanappa, Jagadeesh"
	<jagadeesh.krishnanjanappa@caviumnetworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 15:08:48 +0530
Message-ID: <1429004328-31212-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BY2PR03CA039.namprd03.prod.outlook.com (10.141.249.12) To
	BN3PR0701MB1137.namprd07.prod.outlook.com (25.160.114.150)
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0701MB1137;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0701MB1298; 
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(92566002)(77156002)(62966003)(42186005)(86362001)(33646002)(36756003)(50226001)(450100001)(48376002)(50466002)(122386002)(50986999)(40100003)(69596002)(53416004)(46102003)(47776003)(66066001)(19580395003)(19580405001)(229853001)(110136001)(87976001)(2351001)(7099027)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0701MB1137;
	H:Ubuntu64.mydomain.com; FPR:; SPF:None; MLV:ovrnspm;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Antispam-PRVS: <BN3PR0701MB113710742B8288B72521587A8EE60@BN3PR0701MB1137.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0701MB1137; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0701MB1137; 
X-Forefront-PRVS: 054642504A
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2015 09:39:04.5142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0701MB1137
X-OriginatorOrg: caviumnetworks.com
Subject: [PATCH] ghostscript: add objarch.h for armeb
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
X-List-Received-Date: Tue, 14 Apr 2015 09:53:53 -0000
Content-Type: text/plain

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>

ghostscript application fails to fetch objarch.h file while building for armeb.
The fetch failure is due to absence of this file in the default set of
directories that the OpenEmbedded build system searches (i.e FILESPATH)
for patches and files. This patch adds the required objarch.h file for
armeb in one of the default locations where OpenEmbedded build system searches.

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
---
 .../ghostscript/ghostscript/armeb/objarch.h        | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h

diff --git a/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
new file mode 100644
index 0000000..359097f
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 4
+#define ARCH_ALIGN_PTR_MOD 4
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
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
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
-- 
1.8.2.3


