Return-Path: <marex@denx.de>
X-Greylist: delayed 405 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Nov 2015 20:50:02 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id AC1D66011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 20:50:02 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3p69zV1SXHz3hj14;
	Thu, 26 Nov 2015 21:43:50 +0100 (CET)
X-Auth-Info: 0anaiJqrcgsrUwh/YsmsAsZMGrUDCk3JpP4nQ0p6QUc=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3p69zT64QqzvdWt;
	Thu, 26 Nov 2015 21:43:49 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 21:43:47 +0100
Message-Id: <1448570627-13405-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>, Ley Foon Tan <lftan@altera.com>,
	Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH] ghostscript: Add NIOS2 support
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
X-List-Received-Date: Thu, 26 Nov 2015 20:50:04 -0000

Add objarch.h for NIOS2 architecture.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 .../ghostscript/ghostscript/nios2/objarch.h        | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h

diff --git a/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
new file mode 100644
index 0000000..3ec8101
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
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
2.1.4


