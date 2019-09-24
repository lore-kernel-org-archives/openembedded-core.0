Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 08EDD7E66A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:21 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id a2so263063pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fp2pOyr7P5K1PdpVFpD5MgVIMqeO6V0ybObDQTMxtWM=;
	b=iXPUMK4lDrTFPnyfjwu8MeijySyTVnephWvt8DLwA8pqxM1RrF/wQ5OnXWL+d7F49B
	T3K4xJ2J0vfTswALDIl2OOS9cV0yXL7CJV8fJpppEmEtvq2n8YKWMyiN06QzCanERNM0
	Cj/kMnaG6IM3Vsg1W5n7g7VLUKV4o2j6lzKvrmETuW/05rTNHVN4P1duTC1Au2UCDBzJ
	JWyr7rsf4EJ7IUocm12sOaKCZB/hewIXvhLp+w05HDt6cRdAwz7qis9A/ZgZUhxZZpqf
	F5IBOTBZlnNR69Jvpl6HTzfkxuB78xBisG4Qq0K3fainZnNeMPgOi/U2+PdbbxjCngDJ
	FXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fp2pOyr7P5K1PdpVFpD5MgVIMqeO6V0ybObDQTMxtWM=;
	b=aoslmgVe6+5QWmmzThZjUVDz/nldfTuQQ4BxWW4U+B+1iZobQ5fmKf0XGE3heAFbtN
	qoBUi4GoJ5iAydVhGSvuytk+AiySWNvY95ZYB1WWvApM2N1aye8+AM7WmEl1KGS039jp
	eEETH5d3rKbV3nq2U1G/0O6DibiSpM62tdlHpIO+sxSQ5DqZuPOx4JSzMmONF3RtxxAn
	hzp/mdvPtwDUsQix7KfYG/CcNJt/J3ldMueIy2pD1ou8ZApNnZ+EMJ+tPZS7jNrp0vVj
	YFQcUg3qAcWgYvG3FNB9TOc95SZXQrOpmFqqf0XbSAr+hUjqNcfMGOts1IeSlWv4EHF0
	eAqQ==
X-Gm-Message-State: APjAAAUExv8X5xGSThGeEvdB8BRRQgyaSggBSs6ZT82trLxjY1g3FBTW
	4oIsUAZGnLCbBW8R0d8Xk7uapMmviC0=
X-Google-Smtp-Source: APXvYqyTCZKzyTjeulGLz9xx9D9DGeKx9Z2cTh7lZWQYOxKSzt8l0lBoZIuGkeyNa6OwOrlYLktdZA==
X-Received: by 2002:a65:6252:: with SMTP id q18mr800443pgv.111.1569293422457; 
	Mon, 23 Sep 2019 19:50:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:29 -0700
Message-Id: <be851e1c3f7d2e9f45da487ac6b61b6a5de97617.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 49/50] gcc: Security fix for CVE-2019-15847
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:22 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 9.2.0

Dropped Changelog changes

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              |   3 +
 .../gcc/gcc-8.3/CVE-2019-15847_p1.patch            | 521 +++++++++++++++++++++
 .../gcc/gcc-8.3/CVE-2019-15847_p2.patch            |  77 +++
 .../gcc/gcc-8.3/CVE-2019-15847_p3.patch            |  45 ++
 4 files changed, 646 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p1.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p3.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index 80f716a..8548830 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -75,6 +75,9 @@ SRC_URI = "\
            file://0042-PR-debug-86964.patch \
            file://0043-PR85434-Prevent-spilling-of-stack-protector-guard-s-.patch \
            file://CVE-2019-14250.patch \
+           file://CVE-2019-15847_p1.patch \
+           file://CVE-2019-15847_p2.patch \
+           file://CVE-2019-15847_p3.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p1.patch b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p1.patch
new file mode 100644
index 0000000..6fb5afc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p1.patch
@@ -0,0 +1,521 @@
+From baf7c861e1cc523425029dcf81467f16c734fbd5 Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 14:13:51 +0000
+Subject: [PATCH 1/3] 	Backport from trunk 	2019-08-22  Segher Boessenkool
+  <segher@kernel.crashing.org>
+
+	* config/rs6000/altivec.md (unspec): Delete UNSPEC_DARN, UNSPEC_DARN_32,
+	UNSPEC_DARN_RAW, UNSPEC_CMPRB, UNSPEC_CMPRB2, UNSPEC_CMPEQB; move to...
+	* config/rs6000/rs6000.md (unspec): ... here.
+	* config/rs6000/altivec.md (darn_32, darn_raw, darn, cmprb,
+	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
+	cmpeqb, *cmpeqb_internal): Delete, move to...
+	* config/rs6000/rs6000.md (darn_32, darn_raw, darn, cmprb,
+	*cmprb_internal, setb_signed, setb_unsigned, cmprb2, *cmprb2_internal,
+	cmpeqb, *cmpeqb_internal): ... here.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275180 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2019-14847 p1
+Affects <= 9.2.0
+Dropped Changelog changes
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gcc/config/rs6000/altivec.md | 223 ------------------------------------------
+ gcc/config/rs6000/rs6000.md  | 224 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 239 insertions(+), 223 deletions(-)
+
+Index: gcc-8.3.0/gcc/config/rs6000/altivec.md
+===================================================================
+--- gcc-8.3.0.orig/gcc/config/rs6000/altivec.md
++++ gcc-8.3.0/gcc/config/rs6000/altivec.md
+@@ -80,9 +80,6 @@
+    UNSPEC_VUPKHPX
+    UNSPEC_VUPKLPX
+    UNSPEC_CONVERT_4F32_8I16
+-   UNSPEC_DARN
+-   UNSPEC_DARN_32
+-   UNSPEC_DARN_RAW
+    UNSPEC_DST
+    UNSPEC_DSTT
+    UNSPEC_DSTST
+@@ -161,9 +158,6 @@
+    UNSPEC_BCDADD
+    UNSPEC_BCDSUB
+    UNSPEC_BCD_OVERFLOW
+-   UNSPEC_CMPRB
+-   UNSPEC_CMPRB2
+-   UNSPEC_CMPEQB
+    UNSPEC_VRLMI
+    UNSPEC_VRLNM
+ ])
+@@ -4317,223 +4311,6 @@
+   [(set_attr "length" "4")
+    (set_attr "type" "vecsimple")])
+ 
+-(define_insn "darn_32"
+-  [(set (match_operand:SI 0 "register_operand" "=r")
+-        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
+-  "TARGET_P9_MISC"
+-  "darn %0,0"
+-  [(set_attr "type" "integer")])
+-
+-(define_insn "darn_raw"
+-  [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-  "darn %0,2"
+-  [(set_attr "type" "integer")])
+-
+-(define_insn "darn"
+-  [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-  "darn %0,1"
+-  [(set_attr "type" "integer")])
+-
+-;; Test byte within range.
+-;;
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the range specified by operand 2.
+-;; The bytes of operand 2 are organized as xx:xx:hi:lo.
+-;;
+-;; Return in target register operand 0 a value of 1 if lo <= vv and
+-;; vv <= hi.  Otherwise, set register operand 0 to 0.
+-;;
+-;; Though the instructions to which this expansion maps operate on
+-;; 64-bit registers, the current implementation only operates on
+-;; SI-mode operands as the high-order bits provide no information
+-;; that is not already available in the low-order bits.  To avoid the
+-;; costs of data widening operations, future enhancements might allow
+-;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
+-(define_expand "cmprb"
+-  [(set (match_dup 3)
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB))
+-   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	(if_then_else:SI (lt (match_dup 3)
+-			     (const_int 0))
+-			 (const_int -1)
+-			 (if_then_else (gt (match_dup 3)
+-					   (const_int 0))
+-				       (const_int 1)
+-				       (const_int 0))))]
+-  "TARGET_P9_MISC"
+-{
+-  operands[3] = gen_reg_rtx (CCmode);
+-})
+-
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the range specified by operand 2.
+-;; The bytes of operand 2 are organized as xx:xx:hi:lo.
+-;;
+-;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
+-;; lo <= vv and vv <= hi.  Otherwise, set the GT bit to 0.  The other
+-;; 3 bits of the target CR register are all set to 0.
+-(define_insn "*cmprb_internal"
+-  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB))]
+-  "TARGET_P9_MISC"
+-  "cmprb %0,0,%1,%2"
+-  [(set_attr "type" "logical")])
+-
+-;; Set operand 0 register to -1 if the LT bit (0x8) of condition
+-;; register operand 1 is on.  Otherwise, set operand 0 register to 1
+-;; if the GT bit (0x4) of condition register operand 1 is on.
+-;; Otherwise, set operand 0 to 0.  Note that the result stored into
+-;; register operand 0 is non-zero iff either the LT or GT bits are on
+-;; within condition register operand 1.
+-(define_insn "setb_signed"
+-   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	 (if_then_else:SI (lt (match_operand:CC 1 "cc_reg_operand" "y")
+-			      (const_int 0))
+-			  (const_int -1)
+-			  (if_then_else (gt (match_dup 1)
+-					    (const_int 0))
+-					(const_int 1)
+-					(const_int 0))))]
+-  "TARGET_P9_MISC"
+-  "setb %0,%1"
+-  [(set_attr "type" "logical")])
+-
+-(define_insn "setb_unsigned"
+-   [(set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	 (if_then_else:SI (ltu (match_operand:CCUNS 1 "cc_reg_operand" "y")
+-			      (const_int 0))
+-			  (const_int -1)
+-			  (if_then_else (gtu (match_dup 1)
+-					    (const_int 0))
+-					(const_int 1)
+-					(const_int 0))))]
+-  "TARGET_P9_MISC"
+-  "setb %0,%1"
+-  [(set_attr "type" "logical")])
+-
+-;; Test byte within two ranges.
+-;;
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the range specified by operand 2.
+-;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
+-;;
+-;; Return in target register operand 0 a value of 1 if (lo_1 <= vv and
+-;; vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).  Otherwise, set register
+-;; operand 0 to 0.
+-;;
+-;; Though the instructions to which this expansion maps operate on
+-;; 64-bit registers, the current implementation only operates on
+-;; SI-mode operands as the high-order bits provide no information
+-;; that is not already available in the low-order bits.  To avoid the
+-;; costs of data widening operations, future enhancements might allow
+-;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
+-(define_expand "cmprb2"
+-  [(set (match_dup 3)
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB2))
+-   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	(if_then_else:SI (lt (match_dup 3)
+-			     (const_int 0))
+-			 (const_int -1)
+-			 (if_then_else (gt (match_dup 3)
+-					   (const_int 0))
+-				       (const_int 1)
+-				       (const_int 0))))]
+-  "TARGET_P9_MISC"
+-{
+-  operands[3] = gen_reg_rtx (CCmode);
+-})
+-
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the ranges specified by operand 2.
+-;; The bytes of operand 2 are organized as hi_1:lo_1:hi_2:lo_2.
+-;;
+-;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if
+-;; (lo_1 <= vv and vv <= hi_1) or if (lo_2 <= vv and vv <= hi_2).
+-;; Otherwise, set the GT bit to 0.  The other 3 bits of the target
+-;; CR register are all set to 0.
+-(define_insn "*cmprb2_internal"
+-  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:SI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPRB2))]
+-  "TARGET_P9_MISC"
+-  "cmprb %0,1,%1,%2"
+-  [(set_attr "type" "logical")])
+-
+-;; Test byte membership within set of 8 bytes.
+-;;
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the set specified by operand 2.
+-;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
+-;;
+-;; Return in target register operand 0 a value of 1 if vv equals one
+-;; of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise, set
+-;; register operand 0 to 0.  Note that the 8 byte values held within
+-;; operand 2 need not be unique.
+-;;
+-;; Though the instructions to which this expansion maps operate on
+-;; 64-bit registers, the current implementation requires that operands
+-;; 0 and 1 have mode SI as the high-order bits provide no information
+-;; that is not already available in the low-order bits.  To avoid the
+-;; costs of data widening operations, future enhancements might allow
+-;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
+-(define_expand "cmpeqb"
+-  [(set (match_dup 3)
+-	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		    (match_operand:DI 2 "gpc_reg_operand" "r")]
+-	 UNSPEC_CMPEQB))
+-   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
+-	(if_then_else:SI (lt (match_dup 3)
+-			     (const_int 0))
+-			 (const_int -1)
+-			 (if_then_else (gt (match_dup 3)
+-					   (const_int 0))
+-				       (const_int 1)
+-				       (const_int 0))))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-{
+-  operands[3] = gen_reg_rtx (CCmode);
+-})
+-
+-;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
+-;; represents a byte whose value is ignored in this context and
+-;; vv, the least significant byte, holds the byte value that is to
+-;; be tested for membership within the set specified by operand 2.
+-;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
+-;;
+-;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if vv
+-;; equals one of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise,
+-;; set the GT bit to zero.  The other 3 bits of the target CR register
+-;; are all set to 0.
+-(define_insn "*cmpeqb_internal"
+-  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
+-	 (unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
+-		     (match_operand:DI 2 "gpc_reg_operand" "r")]
+-	  UNSPEC_CMPEQB))]
+-  "TARGET_P9_MISC && TARGET_64BIT"
+-  "cmpeqb %0,%1,%2"
+-  [(set_attr "type" "logical")])
+-
+ (define_expand "bcd<bcd_add_sub>_<code>"
+   [(parallel [(set (reg:CCFP CR6_REGNO)
+ 		   (compare:CCFP
+Index: gcc-8.3.0/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-8.3.0.orig/gcc/config/rs6000/rs6000.md
++++ gcc-8.3.0/gcc/config/rs6000/rs6000.md
+@@ -136,6 +136,12 @@
+    UNSPEC_LSQ
+    UNSPEC_FUSION_GPR
+    UNSPEC_STACK_CHECK
++   UNSPEC_DARN
++   UNSPEC_DARN_32
++   UNSPEC_DARN_RAW
++   UNSPEC_CMPRB
++   UNSPEC_CMPRB2
++   UNSPEC_CMPEQB
+    UNSPEC_FUSION_P9
+    UNSPEC_FUSION_ADDIS
+    UNSPEC_ADD_ROUND_TO_ODD
+@@ -14597,7 +14603,225 @@
+    "xscmpuqp %0,%1,%2"
+   [(set_attr "type" "veccmp")
+    (set_attr "size" "128")])
++
++;; Miscellaneous ISA 3.0 (power9) instructions
++
++(define_insn "darn_32"
++  [(set (match_operand:SI 0 "register_operand" "=r")
++        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
++  "TARGET_P9_MISC"
++  "darn %0,0"
++  [(set_attr "type" "integer")])
++
++(define_insn "darn_raw"
++  [(set (match_operand:DI 0 "register_operand" "=r")
++        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "darn %0,2"
++  [(set_attr "type" "integer")])
++
++(define_insn "darn"
++  [(set (match_operand:DI 0 "register_operand" "=r")
++        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "darn %0,1"
++  [(set_attr "type" "integer")])
+ 
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
++
++;; Test byte membership within set of 8 bytes.
++;;
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the set specified by operand 2.
++;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
++;;
++;; Return in target register operand 0 a value of 1 if vv equals one
++;; of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise, set
++;; register operand 0 to 0.  Note that the 8 byte values held within
++;; operand 2 need not be unique.
++;;
++;; Though the instructions to which this expansion maps operate on
++;; 64-bit registers, the current implementation requires that operands
++;; 0 and 1 have mode SI as the high-order bits provide no information
++;; that is not already available in the low-order bits.  To avoid the
++;; costs of data widening operations, future enhancements might allow
++;; DI mode for operand 0 and/or might allow operand 1 to be QI mode.
++(define_expand "cmpeqb"
++  [(set (match_dup 3)
++	(unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		    (match_operand:DI 2 "gpc_reg_operand" "r")]
++	 UNSPEC_CMPEQB))
++   (set (match_operand:SI 0 "gpc_reg_operand" "=r")
++	(if_then_else:SI (lt (match_dup 3)
++			     (const_int 0))
++			 (const_int -1)
++			 (if_then_else (gt (match_dup 3)
++					   (const_int 0))
++				       (const_int 1)
++				       (const_int 0))))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++{
++  operands[3] = gen_reg_rtx (CCmode);
++})
++
++;; The bytes of operand 1 are organized as xx:xx:xx:vv, where xx
++;; represents a byte whose value is ignored in this context and
++;; vv, the least significant byte, holds the byte value that is to
++;; be tested for membership within the set specified by operand 2.
++;; The bytes of operand 2 are organized as e0:e1:e2:e3:e4:e5:e6:e7.
++;;
++;; Set bit 1 (the GT bit, 0x4) of CR register operand 0 to 1 if vv
++;; equals one of the values e0, e1, e2, e3, e4, e5, e6, or e7.  Otherwise,
++;; set the GT bit to zero.  The other 3 bits of the target CR register
++;; are all set to 0.
++(define_insn "*cmpeqb_internal"
++  [(set (match_operand:CC 0 "cc_reg_operand" "=y")
++	 (unspec:CC [(match_operand:SI 1 "gpc_reg_operand" "r")
++		     (match_operand:DI 2 "gpc_reg_operand" "r")]
++	  UNSPEC_CMPEQB))]
++  "TARGET_P9_MISC && TARGET_64BIT"
++  "cmpeqb %0,%1,%2"
++  [(set_attr "type" "logical")])
+ 
+ 
+ (include "sync.md")
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p2.patch b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p2.patch
new file mode 100644
index 0000000..ad9e4c6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p2.patch
@@ -0,0 +1,77 @@
+From 2d7749ba418adde9536baf0d16d50a072b5841de Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 14:15:39 +0000
+Subject: [PATCH 2/3] 	Backport from trunk 	2019-08-22  Segher Boessenkool
+  <segher@kernel.crashing.org>
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
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275181 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2019-14847 p2
+Affects <= 9.2.0
+Dropped Change log changes
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gcc/config/rs6000/rs6000.md | 12 ++++++------
+ 2 files changed, 20 insertions(+), 6 deletions(-)
+
+Index: gcc-8.3.0/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-8.3.0.orig/gcc/config/rs6000/rs6000.md
++++ gcc-8.3.0/gcc/config/rs6000/rs6000.md
+@@ -136,9 +136,6 @@
+    UNSPEC_LSQ
+    UNSPEC_FUSION_GPR
+    UNSPEC_STACK_CHECK
+-   UNSPEC_DARN
+-   UNSPEC_DARN_32
+-   UNSPEC_DARN_RAW
+    UNSPEC_CMPRB
+    UNSPEC_CMPRB2
+    UNSPEC_CMPEQB
+@@ -168,6 +165,9 @@
+    UNSPECV_EH_RR		; eh_reg_restore
+    UNSPECV_ISYNC		; isync instruction
+    UNSPECV_MFTB			; move from time base
++   UNSPECV_DARN			; darn 1 (deliver a random number)
++   UNSPECV_DARN_32		; darn 2
++   UNSPECV_DARN_RAW		; darn 0
+    UNSPECV_NLGR			; non-local goto receiver
+    UNSPECV_MFFS			; Move from FPSCR
+    UNSPECV_MTFSF		; Move to FPSCR Fields
+@@ -14608,21 +14608,21 @@
+ 
+ (define_insn "darn_32"
+   [(set (match_operand:SI 0 "register_operand" "=r")
+-        (unspec:SI [(const_int 0)] UNSPEC_DARN_32))]
++        (unspec_volatile:SI [(const_int 0)] UNSPECV_DARN_32))]
+   "TARGET_P9_MISC"
+   "darn %0,0"
+   [(set_attr "type" "integer")])
+ 
+ (define_insn "darn_raw"
+   [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN_RAW))]
++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN_RAW))]
+   "TARGET_P9_MISC && TARGET_64BIT"
+   "darn %0,2"
+   [(set_attr "type" "integer")])
+ 
+ (define_insn "darn"
+   [(set (match_operand:DI 0 "register_operand" "=r")
+-        (unspec:DI [(const_int 0)] UNSPEC_DARN))]
++        (unspec_volatile:DI [(const_int 0)] UNSPECV_DARN))]
+   "TARGET_P9_MISC && TARGET_64BIT"
+   "darn %0,1"
+   [(set_attr "type" "integer")])
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p3.patch b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p3.patch
new file mode 100644
index 0000000..cd525de
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/CVE-2019-15847_p3.patch
@@ -0,0 +1,45 @@
+From 5f8cd14f8966f11e8ed10a4c7e35dc01fffe54d8 Mon Sep 17 00:00:00 2001
+From: segher <segher@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 30 Aug 2019 14:17:20 +0000
+Subject: [PATCH 3/3] 	Backport from trunk 	2019-08-23  Segher Boessenkool
+  <segher@kernel.crashing.org>
+
+gcc/testsuite/
+	PR target/91481
+	* gcc.target/powerpc/darn-3.c: New testcase.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@275182 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+CVE: CVE-2019-14847 p3
+Affects <= 9.2.0
+Dropped Change log changes
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gcc/testsuite/gcc.target/powerpc/darn-3.c | 16 ++++++++++++++++
+ 2 files changed, 25 insertions(+)
+ create mode 100644 gcc/testsuite/gcc.target/powerpc/darn-3.c
+
+Index: gcc-8.3.0/gcc/testsuite/gcc.target/powerpc/darn-3.c
+===================================================================
+--- /dev/null
++++ gcc-8.3.0/gcc/testsuite/gcc.target/powerpc/darn-3.c
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
-- 
2.7.4


