Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id DA521782BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:29 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 61so7604276plf.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3dU0SO1F2EyyY3/jyxzzKpETXd3kRyXZOodwp0HzaQY=;
	b=JOTRTz4A+UCn3D9e4oAg0ZjgstkEN7dHZEeIt5If10g7gCY6N6H7AUO1wSPAaNwJCD
	WFKCBF7qSZYq1NOuyDCAxyy/7EwTME3G6hXqu17WT4qSCwYl698snCBwWTK6vMYUUZbZ
	5b829iVkVr8smIOh/Hdb74A5LdT6lX+ReWTP4zdSRCYXRQ0IucRiHqvhIhdanjwp2ap5
	4a4tk1Nzn7xS/hmhkF5gvqCWTDUaFmGRi7+WIJ/bH9dDsJH1vv+6DPPSPIFWxqz6wfmb
	KmszXpZ+N0cX82Tgcn44JllGNvJiNjNCOjeW3TsXa8/8LWzJKeYohx1hUzWQv2BT+QGg
	2CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3dU0SO1F2EyyY3/jyxzzKpETXd3kRyXZOodwp0HzaQY=;
	b=rZeY5J+1fmij8NhyNfPJRq4BUGKpe3qHgwxqQmMRCWPQpogI6pAHGo1s/0Ak4L2mzh
	C7fGZCNhRK9DN1oupY/d89kHOAVDxLPvlCCrrQnkjxGapb116qbU626mWfoadBy0yP3f
	5rhhpkLi+VWttbQyXf3UXolbJXnYRB7YL+VPZ8A6N470tUGXh7sNIyDcXBYbd11rJIrb
	sqQsAU/slT18q/H6kBqlH1Lxf5bnKtNqzqg8nn0VgVZ7vKvTlWDgL3yFoQAjp/z3AyK3
	GVkIw5gDC2Iy3MiKiBQ4CovrKnAyiBqmqkhg9TTh9DNWfCPOulGxdW1bM0CVYMFzv2cN
	QPGQ==
X-Gm-Message-State: AJaThX5GPx+Y322KX5dsYtPmunP4ocrSpZssEkbaCS+dtWhhyPBNVDaI
	LoYi7CJlWekJYpH/UqPr4xI=
X-Google-Smtp-Source: AGs4zMYYhfnSqap7LihRXlxTGqNZ8xs2nXpvnti9nreb/PMYROfKENQ1IYkZRTRDktf+Yk0TXNX0og==
X-Received: by 10.84.172.1 with SMTP id m1mr37112997plb.345.1511750131013;
	Sun, 26 Nov 2017 18:35:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:05 -0800
Message-Id: <1511750112-2263-19-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 19/26] Binutils: Security fix for CVE-2017-9750
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:30 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-9750.patch          | 247 +++++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9750.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index b88e154..c63a2e5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -61,6 +61,7 @@ SRC_URI = "\
      file://CVE-2017-9747.patch \
      file://CVE-2017-9748.patch \
      file://CVE-2017-9749.patch \
+     file://CVE-2017-9750.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9750.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9750.patch
new file mode 100644
index 0000000..fe8fa69
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9750.patch
@@ -0,0 +1,247 @@
+From db5fa770268baf8cc82cf9b141d69799fd485fe2 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 14 Jun 2017 13:35:06 +0100
+Subject: [PATCH] Fix address violation problems when disassembling a corrupt
+ RX binary.
+
+	PR binutils/21587
+	* rx-decode.opc: Include libiberty.h
+	(GET_SCALE): New macro - validates access to SCALE array.
+	(GET_PSCALE): New macro - validates access to PSCALE array.
+	(DIs, SIs, S2Is, rx_disp): Use new macros.
+	* rx-decode.c: Regenerate.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9750
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ opcodes/ChangeLog     |  9 +++++++++
+ opcodes/rx-decode.c   | 24 ++++++++++++++----------
+ opcodes/rx-decode.opc | 24 ++++++++++++++----------
+ 3 files changed, 37 insertions(+), 20 deletions(-)
+
+Index: git/opcodes/rx-decode.c
+===================================================================
+--- git.orig/opcodes/rx-decode.c
++++ git/opcodes/rx-decode.c
+@@ -27,6 +27,7 @@
+ #include <string.h>
+ #include "ansidecl.h"
+ #include "opcode/rx.h"
++#include "libiberty.h"
+ 
+ #define RX_OPCODE_BIG_ENDIAN 0
+ 
+@@ -45,7 +46,7 @@ static int trace = 0;
+ #define LSIZE 2
+ 
+ /* These are for when the upper bits are "don't care" or "undefined".  */
+-static int bwl[] =
++static int bwl[4] =
+ {
+   RX_Byte,
+   RX_Word,
+@@ -53,7 +54,7 @@ static int bwl[] =
+   RX_Bad_Size /* Bogus instructions can have a size field set to 3.  */
+ };
+ 
+-static int sbwl[] =
++static int sbwl[4] =
+ {
+   RX_SByte,
+   RX_SWord,
+@@ -61,7 +62,7 @@ static int sbwl[] =
+   RX_Bad_Size /* Bogus instructions can have a size field set to 3.  */
+ };
+ 
+-static int ubw[] =
++static int ubw[4] =
+ {
+   RX_UByte,
+   RX_UWord,
+@@ -69,7 +70,7 @@ static int ubw[] =
+   RX_Bad_Size /* Bogus instructions can have a size field set to 3.  */
+ };
+ 
+-static int memex[] =
++static int memex[4] =
+ {
+   RX_SByte,
+   RX_SWord,
+@@ -89,6 +90,9 @@ static int SCALE[] = { 1, 2, 4, 0 };
+ /* This is for the prefix size enum.  */
+ static int PSCALE[] = { 4, 1, 1, 1, 2, 2, 2, 3, 4 };
+ 
++#define GET_SCALE(_indx)  ((unsigned)(_indx) < ARRAY_SIZE (SCALE) ? SCALE[(_indx)] : 0)
++#define GET_PSCALE(_indx) ((unsigned)(_indx) < ARRAY_SIZE (PSCALE) ? PSCALE[(_indx)] : 0)
++
+ static int flagmap[] = {0, 1, 2, 3, 0, 0, 0, 0,
+ 		       16, 17, 0, 0, 0, 0, 0, 0 };
+ 
+@@ -107,7 +111,7 @@ static int dsp3map[] = { 8, 9, 10, 3, 4,
+ #define DC(c)       OP (0, RX_Operand_Immediate, 0, c)
+ #define DR(r)       OP (0, RX_Operand_Register,  r, 0)
+ #define DI(r,a)     OP (0, RX_Operand_Indirect,  r, a)
+-#define DIs(r,a,s)  OP (0, RX_Operand_Indirect,  r, (a) * SCALE[s])
++#define DIs(r,a,s)  OP (0, RX_Operand_Indirect,  r, (a) * GET_SCALE (s))
+ #define DD(t,r,s)   rx_disp (0, t, r, bwl[s], ld);
+ #define DF(r)       OP (0, RX_Operand_Flag,  flagmap[r], 0)
+ 
+@@ -115,7 +119,7 @@ static int dsp3map[] = { 8, 9, 10, 3, 4,
+ #define SR(r)       OP (1, RX_Operand_Register,  r, 0)
+ #define SRR(r)      OP (1, RX_Operand_TwoReg,  r, 0)
+ #define SI(r,a)     OP (1, RX_Operand_Indirect,  r, a)
+-#define SIs(r,a,s)  OP (1, RX_Operand_Indirect,  r, (a) * SCALE[s])
++#define SIs(r,a,s)  OP (1, RX_Operand_Indirect,  r, (a) * GET_SCALE (s))
+ #define SD(t,r,s)   rx_disp (1, t, r, bwl[s], ld);
+ #define SP(t,r)     rx_disp (1, t, r, (t!=3) ? RX_UByte : RX_Long, ld); P(t, 1);
+ #define SPm(t,r,m)  rx_disp (1, t, r, memex[m], ld); rx->op[1].size = memex[m];
+@@ -124,7 +128,7 @@ static int dsp3map[] = { 8, 9, 10, 3, 4,
+ #define S2C(i)      OP (2, RX_Operand_Immediate, 0, i)
+ #define S2R(r)      OP (2, RX_Operand_Register,  r, 0)
+ #define S2I(r,a)    OP (2, RX_Operand_Indirect,  r, a)
+-#define S2Is(r,a,s) OP (2, RX_Operand_Indirect,  r, (a) * SCALE[s])
++#define S2Is(r,a,s) OP (2, RX_Operand_Indirect,  r, (a) * GET_SCALE (s))
+ #define S2D(t,r,s)  rx_disp (2, t, r, bwl[s], ld);
+ #define S2P(t,r)    rx_disp (2, t, r, (t!=3) ? RX_UByte : RX_Long, ld); P(t, 2);
+ #define S2Pm(t,r,m) rx_disp (2, t, r, memex[m], ld); rx->op[2].size = memex[m];
+@@ -211,7 +215,7 @@ immediate (int sfield, int ex, LocalData
+ }
+ 
+ static void
+-rx_disp (int n, int type, int reg, int size, LocalData * ld)
++rx_disp (int n, int type, int reg, unsigned int size, LocalData * ld)
+ {
+   int disp;
+ 
+@@ -228,7 +232,7 @@ rx_disp (int n, int type, int reg, int s
+     case 1:
+       ld->rx->op[n].type = RX_Operand_Indirect;
+       disp = GETBYTE ();
+-      ld->rx->op[n].addend = disp * PSCALE[size];
++      ld->rx->op[n].addend = disp * GET_PSCALE (size);
+       break;
+     case 2:
+       ld->rx->op[n].type = RX_Operand_Indirect;
+@@ -238,7 +242,7 @@ rx_disp (int n, int type, int reg, int s
+ #else
+       disp = disp + GETBYTE () * 256;
+ #endif
+-      ld->rx->op[n].addend = disp * PSCALE[size];
++      ld->rx->op[n].addend = disp * GET_PSCALE (size);
+       break;
+     default:
+       abort ();
+Index: git/opcodes/rx-decode.opc
+===================================================================
+--- git.orig/opcodes/rx-decode.opc
++++ git/opcodes/rx-decode.opc
+@@ -26,6 +26,7 @@
+ #include <string.h>
+ #include "ansidecl.h"
+ #include "opcode/rx.h"
++#include "libiberty.h"
+ 
+ #define RX_OPCODE_BIG_ENDIAN 0
+ 
+@@ -44,7 +45,7 @@ static int trace = 0;
+ #define LSIZE 2
+ 
+ /* These are for when the upper bits are "don't care" or "undefined".  */
+-static int bwl[] =
++static int bwl[4] =
+ {
+   RX_Byte,
+   RX_Word,
+@@ -52,7 +53,7 @@ static int bwl[] =
+   RX_Bad_Size /* Bogus instructions can have a size field set to 3.  */
+ };
+ 
+-static int sbwl[] =
++static int sbwl[4] =
+ {
+   RX_SByte,
+   RX_SWord,
+@@ -60,7 +61,7 @@ static int sbwl[] =
+   RX_Bad_Size /* Bogus instructions can have a size field set to 3.  */
+ };
+ 
+-static int ubw[] =
++static int ubw[4] =
+ {
+   RX_UByte,
+   RX_UWord,
+@@ -68,7 +69,7 @@ static int ubw[] =
+   RX_Bad_Size /* Bogus instructions can have a size field set to 3.  */
+ };
+ 
+-static int memex[] =
++static int memex[4] =
+ {
+   RX_SByte,
+   RX_SWord,
+@@ -88,6 +89,9 @@ static int SCALE[] = { 1, 2, 4, 0 };
+ /* This is for the prefix size enum.  */
+ static int PSCALE[] = { 4, 1, 1, 1, 2, 2, 2, 3, 4 };
+ 
++#define GET_SCALE(_indx)  ((unsigned)(_indx) < ARRAY_SIZE (SCALE) ? SCALE[(_indx)] : 0)
++#define GET_PSCALE(_indx) ((unsigned)(_indx) < ARRAY_SIZE (PSCALE) ? PSCALE[(_indx)] : 0)
++
+ static int flagmap[] = {0, 1, 2, 3, 0, 0, 0, 0,
+ 		       16, 17, 0, 0, 0, 0, 0, 0 };
+ 
+@@ -106,7 +110,7 @@ static int dsp3map[] = { 8, 9, 10, 3, 4,
+ #define DC(c)       OP (0, RX_Operand_Immediate, 0, c)
+ #define DR(r)       OP (0, RX_Operand_Register,  r, 0)
+ #define DI(r,a)     OP (0, RX_Operand_Indirect,  r, a)
+-#define DIs(r,a,s)  OP (0, RX_Operand_Indirect,  r, (a) * SCALE[s])
++#define DIs(r,a,s)  OP (0, RX_Operand_Indirect,  r, (a) * GET_SCALE (s))
+ #define DD(t,r,s)   rx_disp (0, t, r, bwl[s], ld);
+ #define DF(r)       OP (0, RX_Operand_Flag,  flagmap[r], 0)
+ 
+@@ -114,7 +118,7 @@ static int dsp3map[] = { 8, 9, 10, 3, 4,
+ #define SR(r)       OP (1, RX_Operand_Register,  r, 0)
+ #define SRR(r)      OP (1, RX_Operand_TwoReg,  r, 0)
+ #define SI(r,a)     OP (1, RX_Operand_Indirect,  r, a)
+-#define SIs(r,a,s)  OP (1, RX_Operand_Indirect,  r, (a) * SCALE[s])
++#define SIs(r,a,s)  OP (1, RX_Operand_Indirect,  r, (a) * GET_SCALE (s))
+ #define SD(t,r,s)   rx_disp (1, t, r, bwl[s], ld);
+ #define SP(t,r)     rx_disp (1, t, r, (t!=3) ? RX_UByte : RX_Long, ld); P(t, 1);
+ #define SPm(t,r,m)  rx_disp (1, t, r, memex[m], ld); rx->op[1].size = memex[m];
+@@ -123,7 +127,7 @@ static int dsp3map[] = { 8, 9, 10, 3, 4,
+ #define S2C(i)      OP (2, RX_Operand_Immediate, 0, i)
+ #define S2R(r)      OP (2, RX_Operand_Register,  r, 0)
+ #define S2I(r,a)    OP (2, RX_Operand_Indirect,  r, a)
+-#define S2Is(r,a,s) OP (2, RX_Operand_Indirect,  r, (a) * SCALE[s])
++#define S2Is(r,a,s) OP (2, RX_Operand_Indirect,  r, (a) * GET_SCALE (s))
+ #define S2D(t,r,s)  rx_disp (2, t, r, bwl[s], ld);
+ #define S2P(t,r)    rx_disp (2, t, r, (t!=3) ? RX_UByte : RX_Long, ld); P(t, 2);
+ #define S2Pm(t,r,m) rx_disp (2, t, r, memex[m], ld); rx->op[2].size = memex[m];
+@@ -210,7 +214,7 @@ immediate (int sfield, int ex, LocalData
+ }
+ 
+ static void
+-rx_disp (int n, int type, int reg, int size, LocalData * ld)
++rx_disp (int n, int type, int reg, unsigned int size, LocalData * ld)
+ {
+   int disp;
+ 
+@@ -227,7 +231,7 @@ rx_disp (int n, int type, int reg, int s
+     case 1:
+       ld->rx->op[n].type = RX_Operand_Indirect;
+       disp = GETBYTE ();
+-      ld->rx->op[n].addend = disp * PSCALE[size];
++      ld->rx->op[n].addend = disp * GET_PSCALE (size);
+       break;
+     case 2:
+       ld->rx->op[n].type = RX_Operand_Indirect;
+@@ -237,7 +241,7 @@ rx_disp (int n, int type, int reg, int s
+ #else
+       disp = disp + GETBYTE () * 256;
+ #endif
+-      ld->rx->op[n].addend = disp * PSCALE[size];
++      ld->rx->op[n].addend = disp * GET_PSCALE (size);
+       break;
+     default:
+       abort ();
-- 
2.7.4


