Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFC37D68F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 18:41:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45JyL71Tfdz3w
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 20:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559760079;
	bh=qH0ezAayfLKz33TnTg2WxhRQNsmK4MskGwLZyC9u2+c=;
	h=From:To:Subject:Date:From;
	b=TdiqXmP9s1leu9gCwyZZyHmcquqk7tlqMHoeXDSDfq21ENRUsO/y3rjpj4vl54noG
	FsCAyG8azrbGsQuCbKHwbRnQOesrgel7ukfWsZHarfrUfsLVUsR8O5FsS1SBCz58rG
	5MlTpE9VA573bc5FIPj7Z8YZWdIYRvoSKYV1eDgEFzvCWtXwGuMK2ZfKpV38T5c8aQ
	YiKFJHTwtq57CqzyG5mxnlxY2/XYs24ye+tcjGhUAdA3lAGkySVS4wOVX+qtsgjlr+
	U0NZSd9vT5VOsISUnTSfM+khYFyt6LT+Ng/zHraUUJiJGTq5sDq2Zvf0yWnG7uqdiL
	rB66iAiw5gtvdN9pccGe57jMcKPxMXaSWLAiJ4eLfXrgM0BfefzcmTqDgsqXKUCwU8
	XcaZWwTf5ZLUox4CtzlJrAoYu8uNXJuIcd0SgZ0TpnVeXYgzRWBxi9n0USsyLx7rAT
	W2GJNRIk0zNsh/QZ8xNpcNdOZSzUbvhxOov0MCmqUyxTkyt3G9vvOyHdMSI9SuydTA
	LassOuxN9BszzTXcuPP3BB4VFfKj+RSnTAsBoafRtWZ4MhNeintQFFIJXdUw8apXTT
	JnDmbg6sNqgGBE0olJEdfpimVpcl3ELlyy7lXOBAI6Y1/vEgwHq4Sj2CKVJClgq1Ra
	axk4Dz+SyfNqGnvIE5zLGLHI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 21:41:15 +0300
Message-Id: <20190605184116.24297-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gcc: Remove 0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
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
X-List-Received-Date: Wed, 05 Jun 2019 18:41:19 -0000

This was added 9 years ago as a workaround for a problem with
gcc 4.5 on mips.

Building webkitgtk works for me without it for qemumips.

Debian also builds webkitgtk for 32/64 bit big/little endian mips
without using this workaround.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc         |  1 -
 ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch | 59 -------------------
 meta/recipes-devtools/gcc/gcc-9.1.inc         |  1 -
 ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch | 59 -------------------
 4 files changed, 120 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index 996f7fcdb0..1781ff5b5d 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -36,7 +36,6 @@ SRC_URI = "\
            file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
            file://0004-64-bit-multilib-hack.patch \
            file://0005-optional-libstdc.patch \
-           file://0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
            file://0007-COLLECT_GCC_OPTIONS.patch \
            file://0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
            file://0009-fortran-cross-compile-hack.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
deleted file mode 100644
index 0cea228c87..0000000000
--- a/meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 1dba090a11c40b0926f9707a543d658c95e1f156 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:14:20 +0400
-Subject: [PATCH 06/40] gcc: disable MASK_RELAX_PIC_CALLS bit
-
-The new feature added after 4.3.3
-"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
-will cause cc1plus eat up all the system memory when build webkit-gtk.
-The function mips_get_pic_call_symbol keeps on recursively calling itself.
-Disable this feature to walk aside the bug.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- gcc/configure    | 7 -------
- gcc/configure.ac | 7 -------
- 2 files changed, 14 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 3901722400c..0c9b8ac5f55 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -27553,13 +27553,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
-         rm -f conftest.*
-       fi
-     fi
--    if test $gcc_cv_as_ld_jalr_reloc = yes; then
--      if test x$target_cpu_default = x; then
--        target_cpu_default=MASK_RELAX_PIC_CALLS
--      else
--        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
--      fi
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
- $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 1b1362f70fe..53840363115 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -4798,13 +4798,6 @@ x:
-         rm -f conftest.*
-       fi
-     fi
--    if test $gcc_cv_as_ld_jalr_reloc = yes; then
--      if test x$target_cpu_default = x; then
--        target_cpu_default=MASK_RELAX_PIC_CALLS
--      else
--        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
--      fi
--    fi
-     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
- 
-     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
--- 
-2.21.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-9.1.inc b/meta/recipes-devtools/gcc/gcc-9.1.inc
index eb2538020c..4c648a1694 100644
--- a/meta/recipes-devtools/gcc/gcc-9.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.1.inc
@@ -33,7 +33,6 @@ SRC_URI = "\
            file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
            file://0004-64-bit-multilib-hack.patch \
            file://0005-optional-libstdc.patch \
-           file://0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
            file://0007-COLLECT_GCC_OPTIONS.patch \
            file://0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
            file://0009-fortran-cross-compile-hack.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
deleted file mode 100644
index 4a552d5169..0000000000
--- a/meta/recipes-devtools/gcc/gcc-9.1/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From ca3b3ac12d9b6e1065333dec89e7be2c733509d9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:14:20 +0400
-Subject: [PATCH 06/37] gcc: disable MASK_RELAX_PIC_CALLS bit
-
-The new feature added after 4.3.3
-"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
-will cause cc1plus eat up all the system memory when build webkit-gtk.
-The function mips_get_pic_call_symbol keeps on recursively calling itself.
-Disable this feature to walk aside the bug.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- gcc/configure    | 7 -------
- gcc/configure.ac | 7 -------
- 2 files changed, 14 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 2e08396622e..d36cb51bc2c 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -27509,13 +27509,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
-         rm -f conftest.*
-       fi
-     fi
--    if test $gcc_cv_as_ld_jalr_reloc = yes; then
--      if test x$target_cpu_default = x; then
--        target_cpu_default=MASK_RELAX_PIC_CALLS
--      else
--        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
--      fi
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
- $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 7d34911573e..dfa88c35f3f 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -4816,13 +4816,6 @@ x:
-         rm -f conftest.*
-       fi
-     fi
--    if test $gcc_cv_as_ld_jalr_reloc = yes; then
--      if test x$target_cpu_default = x; then
--        target_cpu_default=MASK_RELAX_PIC_CALLS
--      else
--        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
--      fi
--    fi
-     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
- 
-     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
--- 
-2.20.1
-
-- 
2.17.1


