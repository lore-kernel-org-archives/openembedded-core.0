Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5039AC25B7D
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13432.1713248038747832638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WWGYukss;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sbQE86PW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018ee58a6d47-0308ec02-19c4-481c-87a7-1b859025a6e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ItSjkqnDv/ozYW/Wg4En1yvihaVlRp9561C7E8gh4Mg=;
	b=WWGYukssD0XY1oDXsxHjEFRLBuU8QPXINNTO+7IJxJ1Kc95X65afIFHyUkVUSqSc
	RMDMpj85sK9lpAg/jz1P5bGNQ3jtPysH1k7IGrlVAIx56KhcLlAhMYwxNgm89ko0f9F
	d27zPMJq3qpiHSRGCcTaXrIIYTnc9TnzbbBSfMuI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ItSjkqnDv/ozYW/Wg4En1yvihaVlRp9561C7E8gh4Mg=;
	b=sbQE86PWWnVRvd8tYkqwZkO2S/rHxlD7dmfhIq37ZKzEtAb3ZnhRzEqW6NFpNVwv
	aSb9/IPgVLaM2LUm6SW45HFNyxcNMzMUQzY5uGE88x6/VlqN7BqrZleTHoZoUkIFLwq
	cztE9WazYaF3IArSPykGy7K3yQjg6xLOhqYt1uzU=
Content-Type: multipart/mixed; boundary="===============4855756275848434573=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nasm: upgrading to 2.16.02 FAILED
Message-ID: <0101018ee58a6d47-0308ec02-19c4-481c-87a7-1b859025a6e1-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198276

--===============4855756275848434573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nasm* to *2.16.02* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nasm-upgrade-2.16.01-2.16.02.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From afa077eeb510c7f34122871056cadc34957c130d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:43:56 +0000
Subject: [PATCH] nasm: upgrade 2.16.01 -> 2.16.02

---
 .../nasm/nasm/0001-stdlib-Add-strlcat.patch     | 17 ++++++++---------
 .../nasm/0002-Add-debug-prefix-map-option.patch |  9 ++++-----
 .../nasm/{nasm_2.16.01.bb => nasm_2.16.02.bb}   |  2 +-
 3 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.02.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
index 1b8e947c56..58da282dee 100644
--- a/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
+++ b/meta/recipes-devtools/nasm/nasm/0001-stdlib-Add-strlcat.patch
@@ -1,4 +1,4 @@
-From 680220e772dfa381829983fa73b915416f676894 Mon Sep 17 00:00:00 2001
+From 5849006f70cfa78f4eb0b3f292681c54670ae781 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 12:47:30 -0600
 Subject: [PATCH] stdlib: Add strlcat
@@ -7,7 +7,6 @@ Adds strlcat which can be used to safely concatenate strings
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
 ---
  Makefile.in        |  2 +-
  configure.ac       |  2 ++
@@ -17,10 +16,10 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 stdlib/strlcat.c
 
 diff --git a/Makefile.in b/Makefile.in
-index b85ebee..045fabe 100644
+index 68dd8f1..54abfbd 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -104,7 +104,7 @@ PROGOBJ = $(NASM) $(NDISASM)
+@@ -111,7 +111,7 @@ PROGOBJ = $(NASM) $(NDISASM)
  PROGS   = nasm$(X) ndisasm$(X)
  
  LIBOBJ_NW = stdlib/snprintf.$(O) stdlib/vsnprintf.$(O) stdlib/strlcpy.$(O) \
@@ -30,10 +29,10 @@ index b85ebee..045fabe 100644
  	nasmlib/ver.$(O) \
  	nasmlib/alloc.$(O) nasmlib/asprintf.$(O) nasmlib/errfile.$(O) \
 diff --git a/configure.ac b/configure.ac
-index 42cd198..e206338 100644
+index e30125b..8a800f1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -236,6 +236,7 @@ PA_FUNC_SNPRINTF
+@@ -214,6 +214,7 @@ PA_FUNC_SNPRINTF
  PA_FUNC_VSNPRINTF
  AC_CHECK_FUNCS([strlcpy])
  AC_CHECK_FUNCS([strrchrnul])
@@ -41,7 +40,7 @@ index 42cd198..e206338 100644
  
  dnl These types are POSIX-specific, and Windows does it differently...
  AC_CHECK_TYPES([struct _stati64])
-@@ -255,6 +256,7 @@ AC_CHECK_DECLS(strsep)
+@@ -233,6 +234,7 @@ AC_CHECK_DECLS(strsep)
  AC_CHECK_DECLS(strlcpy)
  AC_CHECK_DECLS(strnlen)
  AC_CHECK_DECLS(strrchrnul)
@@ -50,10 +49,10 @@ index 42cd198..e206338 100644
  dnl Check for missing types
  AC_TYPE_UINTPTR_T
 diff --git a/include/compiler.h b/include/compiler.h
-index 407c160..b64da6a 100644
+index b95b1a2..eb5b984 100644
 --- a/include/compiler.h
 +++ b/include/compiler.h
-@@ -169,6 +169,10 @@ size_t strlcpy(char *, const char *, size_t);
+@@ -171,6 +171,10 @@ size_t strlcpy(char *, const char *, size_t);
  char *strrchrnul(const char *, int);
  #endif
  
diff --git a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
index 84fcca0fe1..eecb2ff5b9 100644
--- a/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
+++ b/meta/recipes-devtools/nasm/nasm/0002-Add-debug-prefix-map-option.patch
@@ -1,4 +1,4 @@
-From e28c8883050d34d18ee2d66dfeece51e13adb6d5 Mon Sep 17 00:00:00 2001
+From 9c971e6986e0792a0aacd3fb94b9c8b9ee9f6b77 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Tue, 19 Nov 2019 13:12:17 -0600
 Subject: [PATCH] Add --debug-prefix-map option
@@ -9,7 +9,6 @@ be built in a reproducible manner regardless of the build directory.
 
 Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392635]
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
 ---
  asm/nasm.c              | 24 ++++++++++++++++++++++++
  include/nasmlib.h       |  9 +++++++++
@@ -27,7 +26,7 @@ Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
  create mode 100644 test/elfdebugprefix.asm
 
 diff --git a/asm/nasm.c b/asm/nasm.c
-index 76c70f6..08ff119 100644
+index 97d926f..e013c75 100644
 --- a/asm/nasm.c
 +++ b/asm/nasm.c
 @@ -939,6 +939,7 @@ enum text_options {
@@ -83,10 +82,10 @@ index 76c70f6..08ff119 100644
  
      fprintf(out, "       %-20s %s\n",
 diff --git a/include/nasmlib.h b/include/nasmlib.h
-index 87a7fc6..a3e5144 100644
+index fdfb9a9..d0d1194 100644
 --- a/include/nasmlib.h
 +++ b/include/nasmlib.h
-@@ -250,10 +250,19 @@ int64_t readstrnum(char *str, int length, bool *warn);
+@@ -281,10 +281,19 @@ int numstr(char *buf, size_t buflen, uint64_t n,
   */
  int32_t seg_alloc(void);
  
diff --git a/meta/recipes-devtools/nasm/nasm_2.16.01.bb b/meta/recipes-devtools/nasm/nasm_2.16.02.bb
similarity index 88%
rename from meta/recipes-devtools/nasm/nasm_2.16.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.16.02.bb
index 219cc49360..8aade10f7b 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.02.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e"
+SRC_URI[sha256sum] = "188d7ad38f90cb05c53daaa288eaa1eb40a8ad32eccb65e8b64ffe74f44d6f91"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 
-- 
2.42.0


--===============4855756275848434573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-dd1fed36e018a31c3ee341f20797a5f32d84da4c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:dd1fed36e018a31c3ee341f20797a5f32d84da4c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 114 Local 103 Mirrors 0 Missed 11 Current 185 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 203 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 237 of 299 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 299 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nasm-2.16.02-r0: task do_recipe_qa_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 265 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe nasm-2.16.02-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 365 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_fetch)
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 267 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe nasm-2.16.02-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nasm-2.16.02-r0: task do_fetch: Succeeded
NOTE: Running task 366 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nasm-2.16.02-r0: task do_unpack: Started
NOTE: recipe groff-native-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 275 of 299 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 280 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 282 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe groff-native-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nasm-2.16.02-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 780 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_patch)
NOTE: recipe nasm-2.16.02-r0: task do_patch: Started
NOTE: recipe nasm-2.16.02-r0: task do_patch: Succeeded
NOTE: Running task 815 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_deploy_source_date_epoch)
NOTE: Running task 816 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_populate_lic)
NOTE: recipe nasm-2.16.02-r0: task do_populate_lic: Started
NOTE: recipe nasm-2.16.02-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nasm-2.16.02-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_populate_lic unihash changed to e457c9258c27c3cb581a012c12317a98930d16c87aff76997e766885cd5d1fac
NOTE: recipe nasm-2.16.02-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_deploy_source_date_epoch unihash changed to 927e33c3a86335ad81d78940f7b4aa4ccbcc977197b13c3b2ee53a7125d894cd
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 294 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 299 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 885 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_prepare_recipe_sysroot)
NOTE: Running task 896 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_collect_spdx_deps)
NOTE: recipe nasm-2.16.02-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nasm-2.16.02-r0: task do_collect_spdx_deps: Started
NOTE: recipe nasm-2.16.02-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 897 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_configure)
NOTE: recipe nasm-2.16.02-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe nasm-2.16.02-r0: task do_configure: Started
NOTE: recipe nasm-2.16.02-r0: task do_configure: Succeeded
NOTE: Running task 898 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_compile)
NOTE: recipe nasm-2.16.02-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p stdlib nasmlib output asm disasm x86 common macros win test doc nsis
| make nasm ndisasm
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/nasm-2.16.02'
| perl -I./perllib -I. ./tools/unconfig.pl \
| 	'.' config/config.h.in config/unconfig.h
| Can't open perl script "./tools/unconfig.pl": No such file or directory
| make[1]: *** [Makefile:217: config/unconfig.h] Error 2
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/nasm-2.16.02'
| make: *** [Makefile:174: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687, line 195
NOTE: recipe nasm-2.16.02-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 898 tasks of which 889 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415184327.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240415184327.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: nasm-2.16.02-r0 do_compile: oe_runmake failed
ERROR: nasm-2.16.02-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/run.do_compile.1017687', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/nasm/2.16.02/temp/log.do_compile.1017687
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/nasm/nasm_2.16.02.bb:do_compile) failed with exit code '1'

--===============4855756275848434573==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nasm-upgrade-2.16.01-2.16.02.patch"

RnJvbSBhZmEwNzdlZWI1MTBjN2YzNDEyMjg3MTA1NmNhZGMzNDk1N2MxMzBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NDM6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
YXNtOiB1cGdyYWRlIDIuMTYuMDEgLT4gMi4xNi4wMgoKLS0tCiAuLi4vbmFzbS9uYXNtLzAwMDEt
c3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoICAgICB8IDE3ICsrKysrKysrLS0tLS0tLS0tCiAuLi4v
bmFzbS8wMDAyLUFkZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaCB8ICA5ICsrKystLS0t
LQogLi4uL25hc20ve25hc21fMi4xNi4wMS5iYiA9PiBuYXNtXzIuMTYuMDIuYmJ9ICAgfCAgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS97bmFzbV8yLjE2LjAxLmJiID0+IG5hc21f
Mi4xNi4wMi5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFz
bS9uYXNtLzAwMDEtc3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL25hc20vbmFzbS8wMDAxLXN0ZGxpYi1BZGQtc3RybGNhdC5wYXRjaAppbmRleCAxYjhlOTQ3
YzU2Li41OGRhMjgyZGVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9u
YXNtLzAwMDEtc3RkbGliLUFkZC1zdHJsY2F0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9uYXNtL25hc20vMDAwMS1zdGRsaWItQWRkLXN0cmxjYXQucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDY4MDIyMGU3NzJkZmEzODE4Mjk5ODNmYTczYjkxNTQxNmY2NzY4OTQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU4NDkwMDZmNzBjZmE3OGY0ZWIwYjNmMjkyNjgxYzU0
NjcwYWU3ODEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb3NodWEgV2F0dCA8SlBF
V2hhY2tlckBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IE5vdiAyMDE5IDEyOjQ3OjMwIC0wNjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHN0ZGxpYjogQWRkIHN0cmxjYXQKQEAgLTcsNyArNyw2IEBAIEFk
ZHMgc3RybGNhdCB3aGljaCBjYW4gYmUgdXNlZCB0byBzYWZlbHkgY29uY2F0ZW5hdGUgc3RyaW5n
cwogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWd6aWxsYS5uYXNtLnVz
L3Nob3dfYnVnLmNnaT9pZD0zMzkyNjM1XQogU2lnbmVkLW9mZi1ieTogSm9zaHVhIFdhdHQgPEpQ
RVdoYWNrZXJAZ21haWwuY29tPgotCiAtLS0KICBNYWtlZmlsZS5pbiAgICAgICAgfCAgMiArLQog
IGNvbmZpZ3VyZS5hYyAgICAgICB8ICAyICsrCkBAIC0xNywxMCArMTYsMTAgQEAgU2lnbmVkLW9m
Zi1ieTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzdGRsaWIvc3RybGNhdC5jCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2Vm
aWxlLmluCi1pbmRleCBiODVlYmVlLi4wNDVmYWJlIDEwMDY0NAoraW5kZXggNjhkZDhmMS4uNTRh
YmZiZCAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmluCiArKysgYi9NYWtlZmlsZS5pbgotQEAgLTEw
NCw3ICsxMDQsNyBAQCBQUk9HT0JKID0gJChOQVNNKSAkKE5ESVNBU00pCitAQCAtMTExLDcgKzEx
MSw3IEBAIFBST0dPQkogPSAkKE5BU00pICQoTkRJU0FTTSkKICBQUk9HUyAgID0gbmFzbSQoWCkg
bmRpc2FzbSQoWCkKICAKICBMSUJPQkpfTlcgPSBzdGRsaWIvc25wcmludGYuJChPKSBzdGRsaWIv
dnNucHJpbnRmLiQoTykgc3RkbGliL3N0cmxjcHkuJChPKSBcCkBAIC0zMCwxMCArMjksMTAgQEAg
aW5kZXggYjg1ZWJlZS4uMDQ1ZmFiZSAxMDA2NDQKICAJbmFzbWxpYi92ZXIuJChPKSBcCiAgCW5h
c21saWIvYWxsb2MuJChPKSBuYXNtbGliL2FzcHJpbnRmLiQoTykgbmFzbWxpYi9lcnJmaWxlLiQo
TykgXAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNDJj
ZDE5OC4uZTIwNjMzOCAxMDA2NDQKK2luZGV4IGUzMDEyNWIuLjhhODAwZjEgMTAwNjQ0CiAtLS0g
YS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTIzNiw2ICsyMzYsNyBAQCBQ
QV9GVU5DX1NOUFJJTlRGCitAQCAtMjE0LDYgKzIxNCw3IEBAIFBBX0ZVTkNfU05QUklOVEYKICBQ
QV9GVU5DX1ZTTlBSSU5URgogIEFDX0NIRUNLX0ZVTkNTKFtzdHJsY3B5XSkKICBBQ19DSEVDS19G
VU5DUyhbc3RycmNocm51bF0pCkBAIC00MSw3ICs0MCw3IEBAIGluZGV4IDQyY2QxOTguLmUyMDYz
MzggMTAwNjQ0CiAgCiAgZG5sIFRoZXNlIHR5cGVzIGFyZSBQT1NJWC1zcGVjaWZpYywgYW5kIFdp
bmRvd3MgZG9lcyBpdCBkaWZmZXJlbnRseS4uLgogIEFDX0NIRUNLX1RZUEVTKFtzdHJ1Y3QgX3N0
YXRpNjRdKQotQEAgLTI1NSw2ICsyNTYsNyBAQCBBQ19DSEVDS19ERUNMUyhzdHJzZXApCitAQCAt
MjMzLDYgKzIzNCw3IEBAIEFDX0NIRUNLX0RFQ0xTKHN0cnNlcCkKICBBQ19DSEVDS19ERUNMUyhz
dHJsY3B5KQogIEFDX0NIRUNLX0RFQ0xTKHN0cm5sZW4pCiAgQUNfQ0hFQ0tfREVDTFMoc3RycmNo
cm51bCkKQEAgLTUwLDEwICs0OSwxMCBAQCBpbmRleCA0MmNkMTk4Li5lMjA2MzM4IDEwMDY0NAog
IGRubCBDaGVjayBmb3IgbWlzc2luZyB0eXBlcwogIEFDX1RZUEVfVUlOVFBUUl9UCiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9jb21waWxlci5oIGIvaW5jbHVkZS9jb21waWxlci5oCi1pbmRleCA0MDdj
MTYwLi5iNjRkYTZhIDEwMDY0NAoraW5kZXggYjk1YjFhMi4uZWI1Yjk4NCAxMDA2NDQKIC0tLSBh
L2luY2x1ZGUvY29tcGlsZXIuaAogKysrIGIvaW5jbHVkZS9jb21waWxlci5oCi1AQCAtMTY5LDYg
KzE2OSwxMCBAQCBzaXplX3Qgc3RybGNweShjaGFyICosIGNvbnN0IGNoYXIgKiwgc2l6ZV90KTsK
K0BAIC0xNzEsNiArMTcxLDEwIEBAIHNpemVfdCBzdHJsY3B5KGNoYXIgKiwgY29uc3QgY2hhciAq
LCBzaXplX3QpOwogIGNoYXIgKnN0cnJjaHJudWwoY29uc3QgY2hhciAqLCBpbnQpOwogICNlbmRp
ZgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbS8wMDAyLUFk
ZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9u
YXNtL25hc20vMDAwMi1BZGQtZGVidWctcHJlZml4LW1hcC1vcHRpb24ucGF0Y2gKaW5kZXggODRm
Y2NhMGZlMS4uZWVjYjJmZjViOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL25h
c20vbmFzbS8wMDAyLUFkZC1kZWJ1Zy1wcmVmaXgtbWFwLW9wdGlvbi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtLzAwMDItQWRkLWRlYnVnLXByZWZpeC1tYXAtb3B0
aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMjhjODg4MzA1MGQzNGQxOGVlMmQ2NmRm
ZWVjZTUxZTEzYWRiNmQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5Yzk3MWU2OTg2
ZTA3OTJhMGFhY2QzZmI5NGI5YzhiOWVlOWY2Yjc3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxOSBO
b3YgMjAxOSAxMzoxMjoxNyAtMDYwMAogU3ViamVjdDogW1BBVENIXSBBZGQgLS1kZWJ1Zy1wcmVm
aXgtbWFwIG9wdGlvbgpAQCAtOSw3ICs5LDYgQEAgYmUgYnVpbHQgaW4gYSByZXByb2R1Y2libGUg
bWFubmVyIHJlZ2FyZGxlc3Mgb2YgdGhlIGJ1aWxkIGRpcmVjdG9yeS4KIAogVXBzdHJlYW0tU3Rh
dHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVnemlsbGEubmFzbS51cy9zaG93X2J1Zy5jZ2k/aWQ9
MzM5MjYzNV0KIFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNv
bT4KLQogLS0tCiAgYXNtL25hc20uYyAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysr
KysrKysrKysKICBpbmNsdWRlL25hc21saWIuaCAgICAgICB8ICA5ICsrKysrKysrKwpAQCAtMjcs
NyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NodWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5j
b20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3QvZWxmZGVidWdwcmVmaXguYXNtCiAKIGRpZmYg
LS1naXQgYS9hc20vbmFzbS5jIGIvYXNtL25hc20uYwotaW5kZXggNzZjNzBmNi4uMDhmZjExOSAx
MDA2NDQKK2luZGV4IDk3ZDkyNmYuLmUwMTNjNzUgMTAwNjQ0CiAtLS0gYS9hc20vbmFzbS5jCiAr
KysgYi9hc20vbmFzbS5jCiBAQCAtOTM5LDYgKzkzOSw3IEBAIGVudW0gdGV4dF9vcHRpb25zIHsK
QEAgLTgzLDEwICs4MiwxMCBAQCBpbmRleCA3NmM3MGY2Li4wOGZmMTE5IDEwMDY0NAogIAogICAg
ICBmcHJpbnRmKG91dCwgIiAgICAgICAlLTIwcyAlc1xuIiwKIGRpZmYgLS1naXQgYS9pbmNsdWRl
L25hc21saWIuaCBiL2luY2x1ZGUvbmFzbWxpYi5oCi1pbmRleCA4N2E3ZmM2Li5hM2U1MTQ0IDEw
MDY0NAoraW5kZXggZmRmYjlhOS4uZDBkMTE5NCAxMDA2NDQKIC0tLSBhL2luY2x1ZGUvbmFzbWxp
Yi5oCiArKysgYi9pbmNsdWRlL25hc21saWIuaAotQEAgLTI1MCwxMCArMjUwLDE5IEBAIGludDY0
X3QgcmVhZHN0cm51bShjaGFyICpzdHIsIGludCBsZW5ndGgsIGJvb2wgKndhcm4pOworQEAgLTI4
MSwxMCArMjgxLDE5IEBAIGludCBudW1zdHIoY2hhciAqYnVmLCBzaXplX3QgYnVmbGVuLCB1aW50
NjRfdCBuLAogICAqLwogIGludDMyX3Qgc2VnX2FsbG9jKHZvaWQpOwogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAxLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAyLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNtL25hc21fMi4xNi4wMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL25hc20vbmFzbV8yLjE2LjAyLmJiCmluZGV4IDIxOWNj
NDkzNjAuLjhhYWRlMTBmN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uYXNt
L25hc21fMi4xNi4wMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmFzbS9uYXNtXzIu
MTYuMDIuYmIKQEAgLTEwLDcgKzEwLDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lm5hc20udXMv
cHViL25hc20vcmVsZWFzZWJ1aWxkcy8ke1BWfS9uYXNtLSR7UFZ9LnRhci5iejIgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMi1BZGQtZGVidWctcHJlZml4LW1hcC1vcHRpb24ucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzNWI2YWQyZWUwNDhkNDFjNDc3OWYw
NzNmM2VmY2E3NzYyYTgyMmI3ZDJkNGVmNGU4ZGYyNGNmNjU3NDdiYjJlIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjE4OGQ3YWQzOGY5MGNiMDVjNTNkYWFhMjg4ZWFhMWViNDBhOGFkMzJlY2NiNjVl
OGI2NGZmZTc0ZjQ0ZDZmOTEiCiAKIEVYVFJBX0FVVE9SRUNPTkY6YXBwZW5kID0gIiAtSSBhdXRv
Y29uZi9tNCIKIAotLSAKMi40Mi4wCgo=

--===============4855756275848434573==--

