Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0090.outbound.protection.outlook.com [157.56.110.90])
	by mail.openembedded.org (Postfix) with ESMTP id 20AD873E68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 04:45:40 +0000 (UTC)
Received: from BY2FFO11HUB038.protection.gbl (10.1.14.121) by
	BY2FFO11HUB052.protection.gbl (10.1.15.230) with Microsoft SMTP Server
	(TLS) id 15.1.160.8; Tue, 5 May 2015 04:30:51 +0000
Received: from BY2FFO11FD056.protection.gbl (10.1.14.32) by
	BY2FFO11HUB038.protection.gbl (10.1.14.121) with Microsoft SMTP Server
	(TLS) id 15.1.160.8; Tue, 5 May 2015 04:30:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BY2FFO11FD056.mail.protection.outlook.com (10.1.15.193) with Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Tue, 5 May 2015 04:30:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59307
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YpUMo-0002zB-8L
	for openembedded-core@lists.openembedded.org;
	Mon, 04 May 2015 21:21:58 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 May 2015 14:27:56 +1000
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1430800076-15800-1-git-send-email-nathan.rossi@xilinx.com>
References: <1430800076-15800-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21520.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <cfde34af-80d8-406b-b25e-03223a49d216@BY2FFO11FD056.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(50466002)(48376002)(86362001)(31696002)(74316001)(50986999)(50226001)(104016003)(450100001)(106466001)(6806004)(229853001)(19580405001)(47776003)(87936001)(70736001)(19580395003)(2351001)(53416004)(2950100001)(107886002)(76176999)(62966003)(5001960100002)(46102003)(1496007)(92566002)(110136002)(77156002)(107986001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB038;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY2FFO11HUB038;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY2FFO11HUB052; 
X-Microsoft-Antispam-PRVS: <BY2FFO11HUB03878E5660A5AAAE6AB2855F1D10@BY2FFO11HUB038.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2FFO11HUB038; BCL:0;
	PCL:0; RULEID:; SRVR:BY2FFO11HUB038; 
X-Forefront-PRVS: 0567A15835
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2015 04:30:49.8715 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB038
X-OriginatorOrg: xilinx.com
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 4/4] ghostscript: Add MicroBlaze support
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
X-List-Received-Date: Tue, 05 May 2015 04:45:41 -0000
Content-Type: text/plain

* Add objarch.h for MicroBlaze big and little endian

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 .../ghostscript/ghostscript/microblazeeb/objarch.h |   40 ++++++++++++++++++++
 .../ghostscript/ghostscript/microblazeel/objarch.h |   40 ++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h

diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h
new file mode 100644
index 0000000..63232fd
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/microblazeeb/objarch.h
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
+#define ARCH_ALIGN_DOUBLE_MOD 4
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
new file mode 100644
index 0000000..3ec8101
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
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
+#define ARCH_ALIGN_DOUBLE_MOD 4
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
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
-- 
1.7.10.4


