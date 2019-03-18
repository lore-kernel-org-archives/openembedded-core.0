Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 26A9F7C4DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:45:36 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h8so11773863pgp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=Y4CnAURBKFPAbklivKQfDsAFzeav8WhB67s2xDuT3EY=;
	b=Nfid8Vrb4Fz/mdHojJ8z5o9zQYMYTVqTEXYYm5ba3vPvZNKje6UvbCG5aZp8cH9mov
	oWS/GDUOlCAnqN3PYNRan1EVK8vrbtu2KWGFC9LAerQ2aP9vcV8acSEfR91B4yYEh90p
	+8koRRXampRXStvbx9GQMYnbk+j6/JiUj/qVLOIFE68/3caR1pLyY7TpoLz06pjqzPw/
	5Ws9WDVDP+gQ+lDwDkXFvcqxtmrjdSXaqGOGKAT/XM7K3ME4Ce1QWfWRrFpQxfqwZoWq
	GfqZxFPbI9vyKZDtZ5/hSRvwWs4AiG9bzgw1yH+G3Vb7MYNj4nKp4bjJkjhXCPN7FCJL
	BM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Y4CnAURBKFPAbklivKQfDsAFzeav8WhB67s2xDuT3EY=;
	b=Ll8mqmlWvuKU1B7Xd7ae5C41yF8WcINv2GtvUyLPoR57T+vobKmR46pZ75S1PcWuSu
	ME43fFGSojNdZNcqPEP3owREY4wKyFtL2H/FtybT7RFhQBnehC5+So4pET//peC3RKcB
	xiZs5CwrHKrOMwbOL0QZ5R2fMSYFE9cnAqVdlDpRD+ZkZnLKR+2FXS/GxpQqQ/aMyf+K
	OhVagGn64e/mUFVilkUQFxDVEz7nO9tjp04QoS6XXFnnA6HKfBXK9urJhdQKuM7sE+gz
	dnomLLHs9IQjV8+Bi7sSstGB7Ptq+x0r+ylBUbxy/sce4quPM0sS4AdRb0SHsWQxs24A
	t6dA==
X-Gm-Message-State: APjAAAU3BqPh6wYBfaXRLO/CFRXFxMaZ76wc2RU/y89w/LCVykwf5FPv
	mnpdDN67NWyTFNGQUuB10jrgsntY
X-Google-Smtp-Source: APXvYqwjnM0LKTnRBD1opG5bdIZl5sUJAAVNfWNApRfAHk8zsok7akXkf3TitA8rUlOzaVert7tyow==
X-Received: by 2002:a62:29c5:: with SMTP id
	p188mr18297647pfp.203.1552927537402; 
	Mon, 18 Mar 2019 09:45:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:97d:e5a7:4938:a8fe])
	by smtp.gmail.com with ESMTPSA id
	e2sm14208555pfa.64.2019.03.18.09.45.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Mar 2019 09:45:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 09:45:35 -0700
Message-Id: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Mon, 18 Mar 2019 16:45:37 -0000

This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.

This package update slipped in doing the maint process. Removing it.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} |   0
 .../boost/{boost-1.69.0.inc => boost-1.68.0.inc}   |   4 +-
 meta/recipes-support/boost/boost.inc               |   1 +
 ...-arch-instruction-set-flags-we-do-that-o.patch} |  23 +-
 ...ucibility-add-file-directive-to-assembler.patch | 243 +++++++++++++++++++++
 .../boost/{boost_1.69.0.bb => boost_1.68.0.bb}     |   6 +-
 6 files changed, 263 insertions(+), 14 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.69.0.bb => bjam-native_1.68.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.69.0.inc => boost-1.68.0.inc} (85%)
 rename meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch => 0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (93%)
 create mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
 rename meta/recipes-support/boost/{boost_1.69.0.bb => boost_1.68.0.bb} (56%)

diff --git a/meta/recipes-support/boost/bjam-native_1.69.0.bb b/meta/recipes-support/boost/bjam-native_1.68.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.69.0.bb
rename to meta/recipes-support/boost/bjam-native_1.68.0.bb
diff --git a/meta/recipes-support/boost/boost-1.69.0.inc b/meta/recipes-support/boost/boost-1.68.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.69.0.inc
rename to meta/recipes-support/boost/boost-1.68.0.inc
index 923436b..b367a80 100644
--- a/meta/recipes-support/boost/boost-1.69.0.inc
+++ b/meta/recipes-support/boost/boost-1.68.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "a1332494397bf48332cb152abfefcec2"
-SRC_URI[sha256sum] = "8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406"
+SRC_URI[md5sum] = "7fbd1890f571051f2a209681d57d486a"
+SRC_URI[sha256sum] = "7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 9be3717..c4faea2 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -21,6 +21,7 @@ BOOST_LIBS = "\
 	random \
 	regex \
 	serialization \
+	signals \
 	system \
 	timer \
 	test \
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
similarity index 93%
rename from meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
rename to meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 8944cb3..fb6d971 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,20 +1,21 @@
-From 3e4eb02eb5951058bc6f8dffbf049eb189df8291 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 18 Dec 2018 15:42:57 +0100
-Subject: [PATCH] Don't set up arch/instruction-set flags, we do that ourselves
+From 0868761e7d2d75d472090e3ef96f3d2f9ced27f3 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 13 Dec 2016 10:29:32 -0700
+Subject: [PATCH 5/6] Don't set up arch/instruction-set flags, we do that
+ ourselves
 
 Upstream-Status: Inappropriate
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- tools/build/src/tools/gcc.jam | 128 ----------------------------------
- 1 file changed, 128 deletions(-)
+ tools/build/src/tools/gcc.jam | 127 ------------------------------------------
+ 1 file changed, 127 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index c57c773f..28618fb1 100644
+index e3b1b952..e4fc6c32 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1152,131 +1152,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1276,130 +1276,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -64,7 +65,6 @@ index c57c773f..28618fb1 100644
 -cpu-flags gcc OPTIONS : x86 : skylake : -march=skylake ;
 -cpu-flags gcc OPTIONS : x86 : skylake-avx512 : -march=skylake-avx512 ;
 -cpu-flags gcc OPTIONS : x86 : cannonlake : -march=skylake-avx512 -mavx512vbmi -mavx512ifma -msha ;
--cpu-flags gcc OPTIONS : x86 : icelake : -march=icelake ;
 -cpu-flags gcc OPTIONS : x86 : k6 : -march=k6 ;
 -cpu-flags gcc OPTIONS : x86 : k6-2 : -march=k6-2 ;
 -cpu-flags gcc OPTIONS : x86 : k6-3 : -march=k6-3 ;
@@ -146,3 +146,6 @@ index c57c773f..28618fb1 100644
 -cpu-flags gcc OPTIONS : power : rs64a : -mcpu=rs64 ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
+-- 
+2.15.1
+
diff --git a/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch b/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
new file mode 100644
index 0000000..1556533
--- /dev/null
+++ b/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
@@ -0,0 +1,243 @@
+Author: Douglas Royds <douglas.royds@taitradio.com>
+Date:   Thu Nov 22 09:34:22 2018 +1300
+
+Add a .file directive explicitly for all *_elf_gas.S files to prevent the linker
+adding a host build-system path as a FILE symbol to the object file.
+
+This replaces the existing patch that added the .file directive to a small
+subset of these files.
+
+Upstream-Status: Submitted [https://github.com/boostorg/context/issues/91]
+Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
+
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S	2018-11-22 09:04:27.900876941 +1300
+@@ -51,6 +51,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_arm64_aapcs_elf_gas.S"
+ .text
+ .align  2
+ .global jump_fcontext
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_arm_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_arm_aapcs_elf_gas.S	2018-11-22 09:04:28.876898240 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_arm_aapcs_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_i386_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_i386_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_i386_sysv_elf_gas.S	2018-11-22 09:04:29.904920674 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "jump_i386_sysv_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_mips32_o32_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_mips32_o32_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_mips32_o32_elf_gas.S	2018-11-22 09:04:41.021163195 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  * *****************************************************/
+ 
++.file "jump_mips32_o32_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S	2018-11-22 09:04:42.281190679 +1300
+@@ -73,6 +73,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_ppc32_sysv_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S	2018-11-22 09:04:43.193210571 +1300
+@@ -66,6 +66,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_ppc64_sysv_elf_gas.S"
+ .globl jump_fcontext
+ #if _CALL_ELF == 2
+ 	.text
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S	2018-11-22 09:04:44.213232818 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "jump_x86_64_sysv_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .type jump_fcontext,@function
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/make_arm64_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_arm64_aapcs_elf_gas.S	2018-11-22 09:04:45.153253319 +1300
+@@ -51,6 +51,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_arm64_aapcs_elf_gas.S"
+ .text
+ .align  2
+ .global make_fcontext
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/make_arm_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_arm_aapcs_elf_gas.S	2018-11-22 09:04:46.097273908 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_arm_aapcs_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_i386_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_i386_sysv_elf_gas.S	2018-11-22 09:04:46.973293012 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "make_i386_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/make_mips32_o32_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_mips32_o32_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_mips32_o32_elf_gas.S	2018-11-22 09:04:47.925313772 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  * *****************************************************/
+ 
++.file "make_mips32_o32_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_ppc32_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_ppc32_sysv_elf_gas.S	2018-11-22 09:04:48.865334271 +1300
+@@ -73,6 +73,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_ppc32_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_ppc64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_ppc64_sysv_elf_gas.S	2018-11-22 09:04:50.049360089 +1300
+@@ -66,6 +66,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_ppc64_sysv_elf_gas.S"
+ .globl make_fcontext
+ #if _CALL_ELF == 2
+ 	.text
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S	2018-11-22 09:04:51.117383378 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "make_x86_64_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .type make_fcontext,@function
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S	2018-11-22 09:04:52.201407013 +1300
+@@ -51,6 +51,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_arm64_aapcs_elf_gas.S"
+ .text
+ .align  2
+ .global ontop_fcontext
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S	2018-11-22 09:04:53.269430300 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_arm_aapcs_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_i386_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_i386_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_i386_sysv_elf_gas.S	2018-11-22 09:04:54.389454719 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "ontop_i386_sysv_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_mips32_o32_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_mips32_o32_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_mips32_o32_elf_gas.S	2018-11-22 09:04:55.657482363 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  * *****************************************************/
+ 
++.file "ontop_mips32_o32_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S	2018-11-22 09:04:56.777506781 +1300
+@@ -73,6 +73,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_ppc32_sysv_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S	2018-11-22 09:04:58.485544015 +1300
+@@ -66,6 +66,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_ppc64_sysv_elf_gas.S"
+ .globl ontop_fcontext
+ #if _CALL_ELF == 2
+ 	.text
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S	2018-11-22 09:04:59.609568516 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "ontop_x86_64_sysv_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .type ontop_fcontext,@function
diff --git a/meta/recipes-support/boost/boost_1.69.0.bb b/meta/recipes-support/boost/boost_1.68.0.bb
similarity index 56%
rename from meta/recipes-support/boost/boost_1.69.0.bb
rename to meta/recipes-support/boost/boost_1.68.0.bb
index 324b46f..82e36fd 100644
--- a/meta/recipes-support/boost/boost_1.69.0.bb
+++ b/meta/recipes-support/boost/boost_1.68.0.bb
@@ -1,9 +1,11 @@
 require boost-${PV}.inc
 require boost.inc
 
-SRC_URI += "file://arm-intrinsics.patch \
+SRC_URI += "\
+           file://arm-intrinsics.patch \
            file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-           file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://reproducibility-add-file-directive-to-assembler.patch \
            "
-- 
2.7.4


