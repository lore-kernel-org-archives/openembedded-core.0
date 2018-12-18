Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E4AAA7C0E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s12so16127938wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eOcKBDxmY+8/ZH8JLKb7Q2yU5wcdQtNVF5H/PgJpry4=;
	b=PveJfyGbAvWmSezIsOBhbztL/bSQEYENe6QpEub1x4YIv54h9cqw+1zU2xZPg2m8rO
	4a6HyB57FrLkHMVViRYr/0llki4aFqT+OS0/c7F/g9Ewg0S0HY/RsCVJHCjyomcBzoZL
	tEBzPCKpSBXOXBUJN5JgOk6hgUNtJlSHHz+twzGg/GHO5xEdbLHWBqpCKwXwtR6c7KGP
	J5z6g+n0aE3K4EfLDppdawsoaIA3gn8pf+UR0/zD1MonzA7jiR/SOmV5Cd/93IZCFJzA
	Wsh5HXoV3t541dqG/Vq3TgSuXGI4EP1Qmr+DcPDI/oYTBdflP20jbKPzOfj4MuYAaZNm
	9m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eOcKBDxmY+8/ZH8JLKb7Q2yU5wcdQtNVF5H/PgJpry4=;
	b=bx9mpQuYT5I10yqmKTIWufTRwdsRbDEkECV2Z3Ktqmii6MEQ+6OPww/vjo6Lv31br1
	Wbm1y1iUabLc1RQZlbWC88BK9QFBHhXeUrFHoCQCx9QlCaqllkCbjXN73SceacAMuT3I
	UuNNTDCRJEw7xaCpfqJtvjm3h4sVUzSB2MfdgBdT1m0siO/sEEIln96Jisk2b/iL6Caa
	C7aIA+xCiv9/yvk7t+6WZLN9mi+Lr7fg3B0TxD5bDoRlmHtZwJ8mBN8kqvtXX44zPJKQ
	ZiMG6woUqixGdzFvppsm3OMLsRR+gCfjwQDNAxqU3Lbj6ndPVYxYM6ZD9Et5zJardmsE
	Hu+w==
X-Gm-Message-State: AA+aEWbeiXJ0gGTTiND7izq3XFk/i7iVGylypg9FGAsZNIj4cxPXK1n4
	6X+5hiz2Au0o9Uk94VgzJFGqlTss
X-Google-Smtp-Source: AFSGD/Wd3f9I9d2MfPgUUAv2pTPmYYmQ/IrGJtF3qilfgSMvmpIseiG2V4J+ZaTJtzkftG1e5ccJoA==
X-Received: by 2002:adf:a211:: with SMTP id p17mr15323355wra.179.1545150622852;
	Tue, 18 Dec 2018 08:30:22 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:30:01 +0100
Message-Id: <20181218163005.1330-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/13] boost: update to 1.69.0
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:23 -0000

Drop upstreamed reproducibility-add-file-directive-to-assembler.patch

Drop signals library as upstream has removed it:
https://www.boost.org/users/history/version_1_69_0.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...native_1.68.0.bb => bjam-native_1.69.0.bb} |   0
 .../{boost-1.68.0.inc => boost-1.69.0.inc}    |   4 +-
 meta/recipes-support/boost/boost.inc          |   1 -
 ...-instruction-set-flags-we-do-that-o.patch} |  23 +-
 ...lity-add-file-directive-to-assembler.patch | 243 ------------------
 .../{boost_1.68.0.bb => boost_1.69.0.bb}      |   6 +-
 6 files changed, 14 insertions(+), 263 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.68.0.bb => bjam-native_1.69.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.68.0.inc => boost-1.69.0.inc} (85%)
 rename meta/recipes-support/boost/boost/{0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch => 0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (93%)
 delete mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
 rename meta/recipes-support/boost/{boost_1.68.0.bb => boost_1.69.0.bb} (56%)

diff --git a/meta/recipes-support/boost/bjam-native_1.68.0.bb b/meta/recipes-support/boost/bjam-native_1.69.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.68.0.bb
rename to meta/recipes-support/boost/bjam-native_1.69.0.bb
diff --git a/meta/recipes-support/boost/boost-1.68.0.inc b/meta/recipes-support/boost/boost-1.69.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.68.0.inc
rename to meta/recipes-support/boost/boost-1.69.0.inc
index b367a80b647..923436b1e0d 100644
--- a/meta/recipes-support/boost/boost-1.68.0.inc
+++ b/meta/recipes-support/boost/boost-1.69.0.inc
@@ -12,8 +12,8 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "7fbd1890f571051f2a209681d57d486a"
-SRC_URI[sha256sum] = "7f6130bc3cf65f56a618888ce9d5ea704fa10b462be126ad053e80e553d6d8b7"
+SRC_URI[md5sum] = "a1332494397bf48332cb152abfefcec2"
+SRC_URI[sha256sum] = "8f32d4617390d1c2d16f26a27ab60d97807b35440d45891fa340fc2648b04406"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c4faea211f0..9be3717fd65 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -21,7 +21,6 @@ BOOST_LIBS = "\
 	random \
 	regex \
 	serialization \
-	signals \
 	system \
 	timer \
 	test \
diff --git a/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
similarity index 93%
rename from meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
rename to meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index fb6d9711b96..8944cb37b4d 100644
--- a/meta/recipes-support/boost/boost/0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,21 +1,20 @@
-From 0868761e7d2d75d472090e3ef96f3d2f9ced27f3 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 10:29:32 -0700
-Subject: [PATCH 5/6] Don't set up arch/instruction-set flags, we do that
- ourselves
+From 3e4eb02eb5951058bc6f8dffbf049eb189df8291 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 18 Dec 2018 15:42:57 +0100
+Subject: [PATCH] Don't set up arch/instruction-set flags, we do that ourselves
 
 Upstream-Status: Inappropriate
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- tools/build/src/tools/gcc.jam | 127 ------------------------------------------
- 1 file changed, 127 deletions(-)
+ tools/build/src/tools/gcc.jam | 128 ----------------------------------
+ 1 file changed, 128 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index e3b1b952..e4fc6c32 100644
+index c57c773f..28618fb1 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1276,130 +1276,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1152,131 +1152,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -65,6 +64,7 @@ index e3b1b952..e4fc6c32 100644
 -cpu-flags gcc OPTIONS : x86 : skylake : -march=skylake ;
 -cpu-flags gcc OPTIONS : x86 : skylake-avx512 : -march=skylake-avx512 ;
 -cpu-flags gcc OPTIONS : x86 : cannonlake : -march=skylake-avx512 -mavx512vbmi -mavx512ifma -msha ;
+-cpu-flags gcc OPTIONS : x86 : icelake : -march=icelake ;
 -cpu-flags gcc OPTIONS : x86 : k6 : -march=k6 ;
 -cpu-flags gcc OPTIONS : x86 : k6-2 : -march=k6-2 ;
 -cpu-flags gcc OPTIONS : x86 : k6-3 : -march=k6-3 ;
@@ -146,6 +146,3 @@ index e3b1b952..e4fc6c32 100644
 -cpu-flags gcc OPTIONS : power : rs64a : -mcpu=rs64 ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
--- 
-2.15.1
-
diff --git a/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch b/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
deleted file mode 100644
index 155653316c8..00000000000
--- a/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
+++ /dev/null
@@ -1,243 +0,0 @@
-Author: Douglas Royds <douglas.royds@taitradio.com>
-Date:   Thu Nov 22 09:34:22 2018 +1300
-
-Add a .file directive explicitly for all *_elf_gas.S files to prevent the linker
-adding a host build-system path as a FILE symbol to the object file.
-
-This replaces the existing patch that added the .file directive to a small
-subset of these files.
-
-Upstream-Status: Submitted [https://github.com/boostorg/context/issues/91]
-Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
-
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S	2018-11-22 09:04:27.900876941 +1300
-@@ -51,6 +51,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "jump_arm64_aapcs_elf_gas.S"
- .text
- .align  2
- .global jump_fcontext
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_arm_aapcs_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_arm_aapcs_elf_gas.S	2018-11-22 09:04:28.876898240 +1300
-@@ -38,6 +38,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "jump_arm_aapcs_elf_gas.S"
- .text
- .globl jump_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_i386_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_i386_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_i386_sysv_elf_gas.S	2018-11-22 09:04:29.904920674 +1300
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "jump_i386_sysv_elf_gas.S"
- .text
- .globl jump_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_mips32_o32_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_mips32_o32_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_mips32_o32_elf_gas.S	2018-11-22 09:04:41.021163195 +1300
-@@ -38,6 +38,7 @@
-  *                                                     *
-  * *****************************************************/
- 
-+.file "jump_mips32_o32_elf_gas.S"
- .text
- .globl jump_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S	2018-11-22 09:04:42.281190679 +1300
-@@ -73,6 +73,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "jump_ppc32_sysv_elf_gas.S"
- .text
- .globl jump_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S	2018-11-22 09:04:43.193210571 +1300
-@@ -66,6 +66,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "jump_ppc64_sysv_elf_gas.S"
- .globl jump_fcontext
- #if _CALL_ELF == 2
- 	.text
-diff -ur boost_1_68_0.original/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S	2018-11-22 09:04:44.213232818 +1300
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "jump_x86_64_sysv_elf_gas.S"
- .text
- .globl jump_fcontext
- .type jump_fcontext,@function
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/make_arm64_aapcs_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_arm64_aapcs_elf_gas.S	2018-11-22 09:04:45.153253319 +1300
-@@ -51,6 +51,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "make_arm64_aapcs_elf_gas.S"
- .text
- .align  2
- .global make_fcontext
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/make_arm_aapcs_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_arm_aapcs_elf_gas.S	2018-11-22 09:04:46.097273908 +1300
-@@ -38,6 +38,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "make_arm_aapcs_elf_gas.S"
- .text
- .globl make_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_i386_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_i386_sysv_elf_gas.S	2018-11-22 09:04:46.973293012 +1300
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "make_i386_sysv_elf_gas.S"
- .text
- .globl make_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/make_mips32_o32_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_mips32_o32_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_mips32_o32_elf_gas.S	2018-11-22 09:04:47.925313772 +1300
-@@ -38,6 +38,7 @@
-  *                                                     *
-  * *****************************************************/
- 
-+.file "make_mips32_o32_elf_gas.S"
- .text
- .globl make_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_ppc32_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_ppc32_sysv_elf_gas.S	2018-11-22 09:04:48.865334271 +1300
-@@ -73,6 +73,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "make_ppc32_sysv_elf_gas.S"
- .text
- .globl make_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_ppc64_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_ppc64_sysv_elf_gas.S	2018-11-22 09:04:50.049360089 +1300
-@@ -66,6 +66,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "make_ppc64_sysv_elf_gas.S"
- .globl make_fcontext
- #if _CALL_ELF == 2
- 	.text
-diff -ur boost_1_68_0.original/libs/context/src/asm/make_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/make_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S	2018-11-22 09:04:51.117383378 +1300
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "make_x86_64_sysv_elf_gas.S"
- .text
- .globl make_fcontext
- .type make_fcontext,@function
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S	2018-11-22 09:04:52.201407013 +1300
-@@ -51,6 +51,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "ontop_arm64_aapcs_elf_gas.S"
- .text
- .align  2
- .global ontop_fcontext
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S	2018-11-22 09:04:53.269430300 +1300
-@@ -38,6 +38,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "ontop_arm_aapcs_elf_gas.S"
- .text
- .globl ontop_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_i386_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_i386_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_i386_sysv_elf_gas.S	2018-11-22 09:04:54.389454719 +1300
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "ontop_i386_sysv_elf_gas.S"
- .text
- .globl ontop_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_mips32_o32_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_mips32_o32_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_mips32_o32_elf_gas.S	2018-11-22 09:04:55.657482363 +1300
-@@ -38,6 +38,7 @@
-  *                                                     *
-  * *****************************************************/
- 
-+.file "ontop_mips32_o32_elf_gas.S"
- .text
- .globl ontop_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S	2018-11-22 09:04:56.777506781 +1300
-@@ -73,6 +73,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "ontop_ppc32_sysv_elf_gas.S"
- .text
- .globl ontop_fcontext
- .align 2
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S	2018-11-22 09:04:58.485544015 +1300
-@@ -66,6 +66,7 @@
-  *                                                     *
-  *******************************************************/
- 
-+.file "ontop_ppc64_sysv_elf_gas.S"
- .globl ontop_fcontext
- #if _CALL_ELF == 2
- 	.text
-diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S
---- boost_1_68_0.original/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
-+++ boost_1_68_0/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S	2018-11-22 09:04:59.609568516 +1300
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "ontop_x86_64_sysv_elf_gas.S"
- .text
- .globl ontop_fcontext
- .type ontop_fcontext,@function
diff --git a/meta/recipes-support/boost/boost_1.68.0.bb b/meta/recipes-support/boost/boost_1.69.0.bb
similarity index 56%
rename from meta/recipes-support/boost/boost_1.68.0.bb
rename to meta/recipes-support/boost/boost_1.69.0.bb
index 82e36fd7328..324b46f1680 100644
--- a/meta/recipes-support/boost/boost_1.68.0.bb
+++ b/meta/recipes-support/boost/boost_1.69.0.bb
@@ -1,11 +1,9 @@
 require boost-${PV}.inc
 require boost.inc
 
-SRC_URI += "\
-           file://arm-intrinsics.patch \
+SRC_URI += "file://arm-intrinsics.patch \
            file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-           file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
-           file://reproducibility-add-file-directive-to-assembler.patch \
+           file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            "
-- 
2.17.1


