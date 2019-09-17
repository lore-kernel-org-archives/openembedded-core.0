Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80EE77FDA5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 21:54:15 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r5so6422058qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=HNr5yK/70v51M7S8uHlJHnw7H/+5Pnp6J5MWiY7nYyo=;
	b=X8jYqvYx0jt1uj97qFnaq2HMUxyDUEsBJ/RZXIbI5860P97gGYQOiPD4ZnKl5+fVg2
	Kl253eJvswWhBUJaKZdMXMojBidQAyjxFkf6j5ZrbQFMAgBwJIs+j2i+8/0+gTgUDK5O
	A0nTXOz0MwZWXC4YX59kmGAVvLuTvtmznrXUq6XDwZ2VIQybM4grYttJvvDAkDCzheI1
	ZhYyWVDntsBuO5l/Da/xbwqD0KSzuw6/+NOKhU0/9qLeHGjJyF9HeA/CnRpkALIoeGwo
	G7Lqnyvj6lkBX5PaHymy4ytiuXi7GKxg6chmIoeSbyXdjcpjargO5OHaAzDavn82gCN7
	i06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=HNr5yK/70v51M7S8uHlJHnw7H/+5Pnp6J5MWiY7nYyo=;
	b=cl2ZnO+kXcMIUiOCF+32MxT+US2ojamroJYCY+rs3PazvKBePwxHYhWu3+5pHKmuwX
	5gzhcaKPzw6L8wbDKv0ncZtX483wENq9y7MjoiuyUd9/I5xMHKSFI2TvT4XXRDDfNgkG
	Xf5pItamLgJDBB+HZTvohQW8GpgsImIDRRBXLw1OH1Am0nIb36JnKQdC2E0FcrbgdWoF
	z/AoUd2wtGLvdj4NAHU5BZ/HBumLy5fyNttApn73P8aQIXMyU3WY8vwonGb4ybQQkulD
	V6hHlI4TejRWfskx0r0KCqbBAAYimG0s8Mrm1XZAYTATt5OZmZ0G/UxoZfA3zFMOpwZT
	ypYQ==
X-Gm-Message-State: APjAAAWwdqk4SQNueUJiqMkwX3GULrN1nMxeBOryXbyh95N8GL2tM7hE
	ez4WVIhNR6oODBD0n+XXq7MvsN9gUOA=
X-Google-Smtp-Source: APXvYqzB/limV1gXKSlHLw7Z7AAyltyL9pbcSYd3YbtlOSp+6VTRP978ggVNnhdAT/KkJoFYW9GD1g==
X-Received: by 2002:ac8:3f72:: with SMTP id w47mr1111612qtk.362.1568757255871; 
	Tue, 17 Sep 2019 14:54:15 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7])
	by smtp.gmail.com with ESMTPSA id 20sm1874021qkn.4.2019.09.17.14.54.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Sep 2019 14:54:15 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 21:54:08 +0000
Message-Id: <20190917215408.18288-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH v4] gcc: CVE fix for gcc <CVE-2019-15847>
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
X-List-Received-Date: Tue, 17 Sep 2019 21:54:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc         |   3 +
 .../gcc/gcc-8.2/CVE-2019-15847_p1.patch       | 222 ++++++++++++++++++
 .../gcc/gcc-8.2/CVE-2019-15847_p2.patch       |  47 ++++
 .../gcc/gcc-8.2/CVE-2019-15847_p3.patch       |  38 +++
 4 files changed, 310 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 866a77558b..65fd29d943 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -70,6 +70,9 @@ SRC_URI = "\
            file://0039-Fix-for-testsuite-failure.patch \
            file://0040-Re-introduce-spe-commandline-options.patch \
            file://0041-ARC-fix-spec-gen.patch \
+           file://CVE-2019-15847_p1.patch \
+           file://CVE-2019-15847_p2.patch \
+           file://CVE-2019-15847_p3.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch
new file mode 100644
index 0000000000..61fd5f341b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p1.patch
@@ -0,0 +1,222 @@
+From eebe740f9142ee15bd997c480df0e1f61ac6ffd1 Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 14:15:39 +0000
+Subject: [PATCH] 	Backport from trunk 	2019-08-22  Segher Boessenkool
+  <segher@kernel.crashing.org>
+Reply-To: muislam@microsoft.com
+
+	PR target/91481
+	* config/rs6000/rs6000.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
+	and UNSPEC_DARN_RAW.
+	(unspecv): New enumerator values UNSPECV_DARN, UNSPECV_DARN_32, and
+	UNSPECV_DARN_RAW.
+	(darn_32): Use an unspec_volatile, and UNSPECV_DARN_32.
+	(darn_raw): Use an unspec_volatile, and UNSPECV_DARN_RAW.
+	(darn): Use an unspec_volatile, and UNSPECV_DARN.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275181 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-15847
+
+Upstream-Status: Backport
+---
+ gcc/config/rs6000/rs6000.md | 169 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 169 insertions(+)
+
+diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
+index 60058814b8a..f540b033541 100644
+--- a/gcc/config/rs6000/rs6000.md
++++ b/gcc/config/rs6000/rs6000.md
+@@ -136,6 +136,9 @@
+    UNSPEC_LSQ
+    UNSPEC_FUSION_GPR
+    UNSPEC_STACK_CHECK
++   UNSPEC_CMPRB
++   UNSPEC_CMPRB2
++   UNSPEC_CMPEQB
+    UNSPEC_FUSION_P9
+    UNSPEC_FUSION_ADDIS
+    UNSPEC_ADD_ROUND_TO_ODD
+@@ -162,6 +165,9 @@
+    UNSPECV_EH_RR		; eh_reg_restore
+    UNSPECV_ISYNC		; isync instruction
+    UNSPECV_MFTB			; move from time base
++   UNSPECV_DARN			; darn 1 (deliver a random number)
++   UNSPECV_DARN_32		; darn 2
++   UNSPECV_DARN_RAW		; darn 0
+    UNSPECV_NLGR			; non-local goto receiver
+    UNSPECV_MFFS			; Move from FPSCR
+    UNSPECV_MTFSF		; Move to FPSCR Fields
+@@ -14602,6 +14608,169 @@
+    "xscmpuqp %0,%1,%2"
+   [(set_attr "type" "veccmp")
+    (set_attr "size" "128")])
++
++;; Miscellaneous ISA 3.0 (power9) instructions
++
++(define_insn "darn_32"
++  [(set (match_operand:SI 0 "register_operand" "=r")
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
++  "TARGET_P9_MISC"
++  "darn %0,0"
++  [(set_attr "type" "integer")])
++
++(define_insn "darn_raw"
++  [(set (match_operand:DI 0 "register_operand" "=r")
++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "darn %0,2"
++  [(set_attr "type" "integer")])
++
++(define_insn "darn"
++  [(set (match_operand:DI 0 "register_operand" "=r")
++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "darn %0,1"
++  [(set_attr "type" "integer")])
++
++;; Test byte within range.
++;;
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the range specified by operand 2.
++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
++;;
++;; Return in target register operand 0 a value of 1 if lo <= vv and
++;; vv <= hi.  Otherwise, set register operand 0 to 0.
++;;
++;; Though the instructions to which this expansion maps operate on
++;; 64-bit registers, the current implementation only operates on
++;; SI-mode operands as the high-order bits provide no information
++;; that is not already available in the low-order bits.  To avoid the
++;; costs of data widening operations, future enhancements might allow
++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
++(define_expand "cmprb"
++  [(set (match_dup 3)
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB))
++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	(if_then_else:SI (lt (match_dup 3)
++			     (const_int 0))
++			 (const_int -1)
++			 (if_then_else (gt (match_dup 3)
++					   (const_int 0))
++				       (const_int 1)
++				       (const_int 0))))]
++  "TARGET_P9_MISC"
++{
++  operands[3] = gen_reg_rtx (CCmode);
++})
++
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the range specified by operand 2.
++;; The bytes of operand 2 are organized as xx:xx:hi:lo.
++;;
++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
++;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
++;; 3 bits of the target CR register are all set to 0.
++(define_insn "*cmprb_internal"
++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB))]
++  "TARGET_P9_MISC"
++  "cmprb %0,0,%1,%2"
++  [(set_attr "type" "logical")])
++
++;; Set operand 0 register to -1 if the LT bit (0x8) of condition
++;; register operand 1 is on.  Otherwise, set operand 0 register to 1
++;; if the GT bit (0x4) of condition register operand 1 is on.
++;; Otherwise, set operand 0 to 0.  Note that the result stored into
++;; register operand 0 is non-zero iff either the LT or GT bits are on
++;; within condition register operand 1.
++(define_insn "setb_signed"
++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
++			      (const_int 0))
++			  (const_int -1)
++			  (if_then_else (gt (match_dup 1)
++					    (const_int 0))
++					(const_int 1)
++					(const_int 0))))]
++  "TARGET_P9_MISC"
++  "setb %0,%1"
++  [(set_attr "type" "logical")])
++
++(define_insn "setb_unsigned"
++   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
++			      (const_int 0))
++			  (const_int -1)
++			  (if_then_else (gtu (match_dup 1)
++					    (const_int 0))
++					(const_int 1)
++					(const_int 0))))]
++  "TARGET_P9_MISC"
++  "setb %0,%1"
++  [(set_attr "type" "logical")])
++
++;; Test byte within two ranges.
++;;
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the range specified by operand 2.
++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
++;;
++;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
++;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
++;; operand 0 to 0.
++;;
++;; Though the instructions to which this expansion maps operate on
++;; 64-bit registers, the current implementation only operates on
++;; SI-mode operands as the high-order bits provide no information
++;; that is not already available in the low-order bits.  To avoid the
++;; costs of data widening operations, future enhancements might allow
++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
++(define_expand "cmprb2"
++  [(set (match_dup 3)
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB2))
++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	(if_then_else:SI (lt (match_dup 3)
++			     (const_int 0))
++			 (const_int -1)
++			 (if_then_else (gt (match_dup 3)
++					   (const_int 0))
++				       (const_int 1)
++				       (const_int 0))))]
++  "TARGET_P9_MISC"
++{
++  operands[3] = gen_reg_rtx (CCmode);
++})
++
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the ranges specified by operand 2.
++;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
++;;
++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
++;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
++;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
++;; CR register are all set to 0.
++(define_insn "*cmprb2_internal"
++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:SI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPRB2))]
++  "TARGET_P9_MISC"
++  "cmprb %0,1,%1,%2"
++  [(set_attr "type" "logical")])
+ 
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch
new file mode 100644
index 0000000000..4f64c39b0a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p2.patch
@@ -0,0 +1,47 @@
+From f2b99d05bb2721e062404afdfb05e570e68b4ced Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 14:17:20 +0000
+Subject: [PATCH] 	Backport from trunk 	2019-08-23  Segher Boessenkool
+  <segher@kernel.crashing.org>
+Reply-To: muislam@microsoft.com
+
+gcc/testsuite/
+	PR target/91481
+	* gcc.target/powerpc/darn-3.c: New testcase.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275182 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-15847
+
+Upstream-Status: Backport
+---
+ gcc/testsuite/gcc.target/powerpc/darn-3.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+ create mode 100644 gcc/testsuite/gcc.target/powerpc/darn-3.c
+
+diff --git a/gcc/testsuite/gcc.target/powerpc/darn-3.c b/gcc/testsuite/gcc.target/powerpc/darn-3.c
+new file mode 100644
+index 00000000000..477901fde70
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/powerpc/darn-3.c
+@@ -0,0 +1,16 @@
++/* { dg-do compile { target { powerpc*-*-* } } } */
++/* { dg-skip-if "" { powerpc*-*-aix* } } */
++/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
++
++static int darn32(void) { return __builtin_darn_32(); }
++
++int four(void)
++{
++	int sum = 0;
++	int i;
++	for (i = 0; i < 4; i++)
++		sum += darn32();
++	return sum;
++}
++
++/* { dg-final { scan-assembler-times {(?n)\mdarn .*,0\M} 4 } } */
+-- 
+2.23.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch
new file mode 100644
index 0000000000..0ab7544caa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/CVE-2019-15847_p3.patch
@@ -0,0 +1,38 @@
+From f4721625a060ad708c0b7d02d3d6b3a581e7d885 Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 31 Aug 2019 18:58:04 +0000
+Subject: [PATCH] rs6000: Fix darn-3.c for GCC 8 and GCC 7
+Reply-To: muislam@microsoft.com
+
+Apparently I didn't properly test the testcase backport to GCC 8 and
+GCC 7.  This makes it not fail there.
+
+	PR target/91481
+	* gcc.target/powerpc/darn-3.c: Fix testcase.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275244 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-15847
+
+Upstream-Status: Backport
+---
+ gcc/testsuite/gcc.target/powerpc/darn-3.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/testsuite/gcc.target/powerpc/darn-3.c b/gcc/testsuite/gcc.target/powerpc/darn-3.c
+index 477901fde70..96ac21fc58c 100644
+--- a/gcc/testsuite/gcc.target/powerpc/darn-3.c
++++ b/gcc/testsuite/gcc.target/powerpc/darn-3.c
+@@ -1,6 +1,7 @@
+ /* { dg-do compile { target { powerpc*-*-* } } } */
+ /* { dg-skip-if "" { powerpc*-*-aix* } } */
+-/* { dg-options "-O2 -mdejagnu-cpu=power9" } */
++/* { dg-skip-if "do not override -mcpu" { powerpc*-*-* } { "-mcpu=*" } { "-mcpu=power9" } } */
++/* { dg-options "-O2 -mcpu=power9" } */
+ 
+ static int darn32(void) { return __builtin_darn_32(); }
+ 
+-- 
+2.23.0
+
-- 
2.23.0


