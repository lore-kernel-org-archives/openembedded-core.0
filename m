Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id CEC0171C42
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 16:27:39 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z4-v6so9808851wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e1v9b6eiK9uXnJZzx4tYbsh50V9xyBMZ/6noNxRKc3g=;
	b=Diajo7gSFJ33RTM3gVIqj9JJzy/neSKUjp7kjD8+fkgAr7+O+H1motTo134vDBldBZ
	tgxJRZdMK7IA045hfgot7FOT5xzXvJlXeihny6VlcL0RxV9bgTX+YWz3oqErXfJQ/0m+
	QI7tTazFqHz/Budl6KvJXElH/lZq2YNy92HGAURxqD4UCKsiJlqN97I9DdG6IroT7xIc
	k1aw97UbimlTlrzUraW9BVUf3YGRkFuiAPE2nGT/KG0whYeneRxtyQJiC2wC/BufF8L7
	AOVZ0eEXZTmD5BqoIfURCg0OLs34gDgSM+lsukyQZKALJPETSWgX1snOyu7rUErjQbEd
	w0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e1v9b6eiK9uXnJZzx4tYbsh50V9xyBMZ/6noNxRKc3g=;
	b=Putiiae3Fz8T5fuJhVsn1o3prfSSxEQhS+bgS9MzB407D39CncC7kZAYgihJG0uWrV
	Ob4aMeeyje0ivrvE+9dBHXwhx1flYdsiw9OLYfdKHWvRBRhiEDyYbyJQLH0v++Xq5aFF
	8H4fcnvjvxb/V7ts2Xx9BIP8uKI+9qiLh6nkychou6/KpY7g8qk8u4v53UNmxlc3l54V
	PWE1Qt3piNjvN3ZreDND+Wyxevph80BSJxLvUygyvOxn5rnoE1dB4k8iP0LQm25iP7G5
	oP24mJHfss+ZF5zQ2t/obXsfFiCu8L9+o5Nl4DrRNMqCrFxHvhAPjwMBxonoIJ08rnxH
	rWHw==
X-Gm-Message-State: ABuFfojt7o52nMJXU6Fdd2b4wgFJWBa7x2NgZE0TuSd+QSmB/a+ZtWpo
	l3Dty25YqM9v+idUEVq+rnkuKGBi
X-Google-Smtp-Source: ACcGV61GpCpFKWPnQ/vJknDEbOt453VWw3ENGkruOrfrO23kn5uw0Vv1i/qDfoXJsW8SwHkxv8kMyw==
X-Received: by 2002:a5d:5342:: with SMTP id
	t2-v6mr4533205wrv.257.1538324859098; 
	Sun, 30 Sep 2018 09:27:39 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u76-v6sm13909698wmd.10.2018.09.30.09.27.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 30 Sep 2018 09:27:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Sep 2018 16:27:37 +0000
Message-Id: <20180930162737.30394-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQdqVSwjnhUF0Ysj=-eucw9X14SO1Q0KqRa5zAh4Q-LP-g@mail.gmail.com>
References: <CA+chaQdqVSwjnhUF0Ysj=-eucw9X14SO1Q0KqRa5zAh4Q-LP-g@mail.gmail.com>
Subject: [PATCH] glibc: bump SRCREV to latest 2.28
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
X-List-Received-Date: Sun, 30 Sep 2018 16:27:40 -0000

* drop one patch already applied in upstream

* this is still only partial fix for issues with -O0 and the bigger
  issue might be detected in runtime as described in:
  https://sourceware.org/glibc/wiki/FAQ#Why_do_I_get:.60.23error_.22glibc_cannot_be_compiled_without_optimization.22.27.2C_when_trying_to_compile_GNU_libc_with_GNU_CC.3F
  https://sourceware.org/bugzilla/show_bug.cgi?id=19444
  and tested in glibc build:
  https://sourceware.org/git/?p=glibc.git;a=blob;f=include/libc-symbols.h;h=8b9273c13a19f2658105c7997267d9086adae716;hb=HEAD#l74

* restore the anonymous python to trigger fatal error when -O0 is
  used (but don't restore the notes for -O, -O1, -Os

* git log --oneline 3c03baca37fdcb52c3881e653ca392bba7a99c2b..044c96f0d5595aeb0bb4e79355081c5a7f4faca5 | tee
044c96f0d5 Fix misreported errno on preadv2/pwritev2 (BZ#23579)
3a67c72c15 Fix stack overflow in tst-setcontext9 (bug 23717)
2339d6a55e i386: Use ENTRY and END in start.S [BZ #23606]
0ef2f4400c Fix strstr bug with huge needles (bug 23637)
a55e109709 Fix tst-setcontext9 for optimized small stacks.
307d04334d misc: New test misc/tst-gethostid
e7d22db29c Linux gethostid: Check for NULL value from gethostbyname_r [BZ #23679]
1fe2b9ca8a Fix segfault in maybe_script_execute.
0b79004569 regex: Add test tst-regcomp-truncated [BZ #23578]
58559f1443 regex: fix uninitialized memory access
aa8a3e4cde pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]
c87b5bab24 Improve ChangeLog message.
66fdfd57fe Regen RISC-V rvd ULPs
b0aa03dfff RISC-V: Fix rounding save/restore bug.
2f498f3d14 nss_files: Fix file stream leak in aliases lookup [BZ #23521]
bfcfa22589 nscd: Deallocate existing user names in file parser
d05b05d157 error, error_at_line: Add missing va_end calls
4b25485f03 Linux: Rewrite __old_getdents64 [BZ #23497]
726e1554ce hurd: Avoid PLTs for __pthread_get/setspecific
7f11842e74 hurd: Add missing symbols for proper libc_get/setspecific

* update 0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
  based on review comments in upstream and extend it to cover PPC based
  on:
  http://lists.openembedded.org/pipermail/openembedded-core/2018-September/156258.html

* update 0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
  based on review comments in upstream

* add 0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
  with a fix for aarch64 build with -Os

* build tested with qemuarm, qemuarm64, qemux86, qemux86-64, qemuppc,
  qemumips, qemumips64 with -O, -O1, -Os.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc             |   9 +
 ...Check-for-NULL-value-from-gethostbyn.patch |  38 ---
 ...Look-for-host-system-ld.so.cache-as-.patch |   8 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |   8 +-
 ...Raise-the-size-of-arrays-containing-.patch |   8 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   7 +-
 ...Make-relocatable-install-for-locales.patch |   7 +-
 ...5500-e6500-603e-fsqrt-implementation.patch |   7 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   8 +-
 ...undefined-reference-to-__sqrt_finite.patch |   7 +-
 ...-are-now-inline-functions-and-call-o.patch |   9 +-
 ...443-which-explains-what-the-patch-do.patch |   8 +-
 ...m-err-tab.pl-with-specific-dirs-in-S.patch |   7 +-
 ...-are-now-inline-functions-and-call-o.patch |   9 +-
 ...igure.ac-handle-correctly-libc_cv_ro.patch |   7 +-
 .../glibc/0014-Add-unused-attribute.patch     |   7 +-
 ...the-path-sets-wrong-config-variables.patch |   7 +-
 ...zone-re-written-tzselect-as-posix-sh.patch |   7 +-
 ...bash-dependency-for-nscd-init-script.patch |   7 +-
 ...ss-building-and-testing-instructions.patch |   7 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |   7 +-
 ...0-eglibc-Clear-cache-lines-on-ppc8xx.patch |   7 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |   7 +-
 ...port-cross-locale-generation-support.patch |   7 +-
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   7 +-
 ...ke-_dl_build_local_scope-breadth-fir.patch |   7 +-
 ...le-fix-hard-coded-reference-to-gcc-E.patch |   7 +-
 ...set-dl_load_write_lock-after-forking.patch |   7 +-
 ...ck-before-switching-to-malloc_atfork.patch |   7 +-
 ...sts.h-enum-definition-for-TRAP_HWBKP.patch |   9 +-
 ...-archive-uses-a-hard-coded-locale-pa.patch |  25 +-
 ...it-no-lines-in-bison-generated-files.patch |   7 +-
 ...prevent-maybe-uninitialized-errors-w.patch | 258 ++++++++++++++++++
 ...4-prevent-maybe-uninitialized-errors.patch |  95 -------
 ...2-soft-fp-ignore-maybe-uninitialized.patch |  72 -----
 ...soft-fp-ignore-maybe-uninitialized-w.patch | 100 +++++++
 ...aybe-uninitialized-errors-with-Os-BZ.patch |  68 +++++
 meta/recipes-core/glibc/glibc_2.28.bb         |   8 +-
 38 files changed, 512 insertions(+), 375 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index e673707369..ddf0c6b80e 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -6,6 +6,15 @@ STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
 STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
+python () {
+    opt_effective = "-O"
+    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
+        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
+            opt_effective = opt
+    if opt_effective == "-O0":
+        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
+}
+
 # siteconfig.bbclass runs configure which needs a working compiler
 # For the compiler to work we need a working libc yet libc isn't
 # in the sysroots directory at this point. This means the libc.so
diff --git a/meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch b/meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch
deleted file mode 100644
index 3cf3266ba1..0000000000
--- a/meta/recipes-core/glibc/glibc/0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e7d22db29cfdd2f1fb97a70a76fa53d151569945 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Thu, 20 Sep 2018 12:41:13 +0200
-Subject: [PATCH] Linux gethostid: Check for NULL value from gethostbyname_r [BZ #23679]
-
-A NULL value can happen with certain gethostbyname_r failures.
-
-(cherry picked from commit 1214ba06e6771acb953a190091b0f6055c64fd25)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=1214ba06e6771acb953a190091b0f6055c64fd25]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- sysdeps/unix/sysv/linux/gethostid.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sysdeps/unix/sysv/linux/gethostid.c b/sysdeps/unix/sysv/linux/gethostid.c
-index 2e20f034dc..ee0190e7f9 100644
---- a/sysdeps/unix/sysv/linux/gethostid.c
-+++ b/sysdeps/unix/sysv/linux/gethostid.c
-@@ -102,12 +102,12 @@ gethostid (void)
-     {
-       int ret = __gethostbyname_r (hostname, &hostbuf,
- 				   tmpbuf.data, tmpbuf.length, &hp, &herr);
--      if (ret == 0)
-+      if (ret == 0 && hp != NULL)
- 	break;
-       else
- 	{
- 	  /* Enlarge the buffer on ERANGE.  */
--	  if (herr == NETDB_INTERNAL && errno == ERANGE)
-+	  if (ret != 0 && herr == NETDB_INTERNAL && errno == ERANGE)
- 	    {
- 	      if (!scratch_buffer_grow (&tmpbuf))
- 		return 0;
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 14089350d9..5df26a8545 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,8 +1,7 @@
-From 70fd60e2a8f40a160736cb9b268dfa6508aa55a7 Mon Sep 17 00:00:00 2001
+From bd51b3add89a5cb2d8f44029a1027c780b2afff5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH 01/30] nativesdk-glibc: Look for host system ld.so.cache as
- well
+Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -64,6 +63,3 @@ index c51e4b3718..44bbb69dc4 100644
        /* Add another newline when we are tracing the library loading.  */
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 382915e840..daadec76c7 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,8 +1,7 @@
-From f0dd22dfdbf822afc674724c35cc462cfafbc186 Mon Sep 17 00:00:00 2001
+From fdc8a33ac2c81a0237b8a6d8b1aac7f1cdbb46af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH 02/30] nativesdk-glibc: Fix buffer overrun with a relocated
- SDK
+Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
 original fixed location, the dynamic loader will crash in open_path
@@ -45,6 +44,3 @@ index 44bbb69dc4..74e2e5e962 100644
    do
      {
        struct r_search_path_elem *this_dir = *dirs;
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index f83e8192e2..e082540303 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,8 +1,7 @@
-From 5962ca897efe965745e193c12041693c9e07dd24 Mon Sep 17 00:00:00 2001
+From 055dd46b793168fb08e44913153010b088011ba2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH 03/30] nativesdk-glibc: Raise the size of arrays containing dl
- paths
+Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
 and lengths as well as ld.so.cache path in the dynamic loader to specific
@@ -135,6 +134,3 @@ index cf43f1cf3b..7f07adde53 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index a0957e6a7b..1ae2e33b4f 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From ee17ca0a6b122466c484301ea9fe029dc7e5498f Mon Sep 17 00:00:00 2001
+From a237553ccd15276462be2023057a017fa8ee5d7c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH 04/30] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -29,6 +29,3 @@ index 272da5dd8f..409c759f14 100644
  #define USE_ATOMIC_COMPILER_BUILTINS 0
  #define ATOMIC_EXCHANGE_USES_CAS 0
  
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 56ff398753..b53f2ef2e2 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,7 +1,7 @@
-From 7195d203c6986ccdb39053933b703391ccc6854a Mon Sep 17 00:00:00 2001
+From e1dc85af1800afa4fbf4eb5a59cc41025495af57 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
-Subject: [PATCH 05/30] nativesdk-glibc: Make relocatable install for locales
+Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
 
 The glibc locale path is hard-coded to the install prefix, but in SDKs we need
 to be able to relocate the binaries.  Expand the strings to 4K and put them in a
@@ -65,6 +65,3 @@ index 68822a6319..537bc35149 100644
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index 1e712d5eba..971700a6df 100644
--- a/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From b28e06d87a43e6aacff5624aaec75106599edec8 Mon Sep 17 00:00:00 2001
+From d23c577b0b70b34335971abaf3f50e617dda615e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH 06/30] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1579,6 +1579,3 @@ index 0000000000..04ff8cc181
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 251e9dd4b1..4871346838 100644
--- a/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,8 +1,7 @@
-From fd2bd3037ef49f67f12659b6aaba02f76e131a24 Mon Sep 17 00:00:00 2001
+From d65f6ee214d7d91445fceabc6a5d6bf55b0e8d4b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH 07/30] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
- names
+Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
 
 This bolts in a hook for OE to pass its own version of interpreter
 names into glibc especially for multilib case, where it differs from any
@@ -28,6 +27,3 @@ index 573c01476c..d8c7412287 100644
  };
  
  static struct known_names known_libs[] =
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 67439c4b87..c0d96eb1f5 100644
--- a/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From b696fe0c6147afc375ae573063a92a53857248eb Mon Sep 17 00:00:00 2001
+From ee3aa1464f40c916c62cf326bf4c18f8b71a229b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH 08/30] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -203,6 +203,3 @@ index 26fa067abf..9d175122a8 100644
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 1d27a56c79..d0b47cd67b 100644
--- a/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 324aa1ffbf85ebd06b54f228604d6651895c1eea Mon Sep 17 00:00:00 2001
+From 17e82d594b2d8d3a6998face953382f9d14fb046 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH 09/30] __ieee754_sqrt{,f} are now inline functions and call
- out __slow versions
+Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
+ __slow versions
 
 Upstream-Status: Pending
 
@@ -382,6 +382,3 @@ index 9d175122a8..10de1f0cc3 100644
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index 6b2bf65cac..86ef3a1059 100644
--- a/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,8 +1,7 @@
-From f6581da98bef982c888061fa06092c03f3c6c708 Mon Sep 17 00:00:00 2001
+From fe8d9b76e7c881cc0a0b728ea2bd637fafca0978 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH 10/30] Quote from bug 1443 which explains what the patch does
- :
+Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
 
   We build some random program and link it with -lust.  When we run it,
   it dies with a SIGSEGV before reaching main().
@@ -57,6 +56,3 @@ index 1a4fd3f17b..a02c47571a 100644
  	  break;
  
  	case R_ARM_TLS_TPOFF32:
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index dfe2fe4b83..32aae5cd53 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 635d4a48c331b5ccc9165a6f622091845a5245b0 Mon Sep 17 00:00:00 2001
+From 3012cb839a64e7d5c621efa79b643d169290e6e9 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH 11/30] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -31,6 +31,3 @@ index c2756640a7..1b5bb16a96 100644
  	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
  	touch $@
  
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 3fcaedd8ef..93395c389f 100644
--- a/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 11991e14957063b0e5fa366d836f42dd6d3e10cd Mon Sep 17 00:00:00 2001
+From 93ab69ae4c98303929ba9492130a021fa4a215be Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH 12/30] __ieee754_sqrt{,f} are now inline functions and call
- out __slow versions
+Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
+ __slow versions
 
 Upstream-Status: Pending
 
@@ -56,6 +56,3 @@ index 812653558f..10de1f0cc3 100644
       float b;
  #endif
  {
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 32796354a0..9998691fa4 100644
--- a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From 36b0c04436f6ec7dc270d387cb036b5361544618 Mon Sep 17 00:00:00 2001
+From a7bd8aa65f3f2755d6dbd0d5adbfd269c1fb0094 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 13/30] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -37,6 +37,3 @@ index 634fe4de2a..3db1697f4f 100644
 +  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
    ;;
  esac
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index cfc044506b..9d6ab30e2c 100644
--- a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From f1969e4c95e810280edf5e11c8a6f32b3a56e2fb Mon Sep 17 00:00:00 2001
+From 2ce5bc6da23dcb402afdeb967fa44c39eecf6d37 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH 14/30] Add unused attribute
+Subject: [PATCH] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -29,6 +29,3 @@ index 123e2a62ce..63cc83ec84 100644
  strip (char *wp, const char *s)
  {
    int slash_count = 0;
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 217a3f6088..0267e7a4ec 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From be9965d0e53db1d7fe9419710a84c75526a18cc0 Mon Sep 17 00:00:00 2001
+From b382138c41ccf6079b44592f1e74f183ca8281bb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 15/30] 'yes' within the path sets wrong config variables
+Subject: [PATCH] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -258,6 +258,3 @@ index f9cba6e15d..b21f72f1e4 100644
                         #endif
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index 719193cbf9..15453ec6ff 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 60694f7ed69c8b711ffe37ce157032e85f60347b Mon Sep 17 00:00:00 2001
+From 04fb7b93dc40c1f96ebc05d29a2f02f9e4f0d572 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 16/30] timezone: re-written tzselect as posix sh
+Subject: [PATCH] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -40,6 +40,3 @@ index d2c3a6d1dd..089679f306 100755
  
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index e1a0d4918a..06d2cd1d25 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From 0d6e36d38569ec716331c48a2187b391f5680363 Mon Sep 17 00:00:00 2001
+From 7a2f244c0980a54ed74f9544ab44a7269ef12bce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 17/30] Remove bash dependency for nscd init script
+Subject: [PATCH] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -70,6 +70,3 @@ index a882da7d8b..b02986ec15 100644
  	RETVAL=1
  	;;
  esac
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index fa8d127f7a..29109a26ea 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 448222134c9a0b147c4598f288ccc9d045b873c4 Mon Sep 17 00:00:00 2001
+From 44a5c79efea09f5b990e524ec42abdeef444056a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 18/30] eglibc: Cross building and testing instructions
+Subject: [PATCH] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -614,6 +614,3 @@ index 0000000000..b67b468466
 +- Some tests require access to libstdc++.so.6 and libgcc_s.so.1; we
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index c7e8bd2ee9..71c2ab9180 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From 6b8ee1ae86f8b9a49f751ab211002c83744356a6 Mon Sep 17 00:00:00 2001
+From f4ec5527d562d38523abb8587a6c7532e9d21f8a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 19/30] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -95,6 +95,3 @@ index 0000000000..1d2b669aff
 +   difficult headers.  The <gnu/stubs.h> header depends, via the
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
index d3f4b6a319..6e475a711e 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From 617ca176291df82c29d8c78e92ba8edcb38a2fe2 Mon Sep 17 00:00:00 2001
+From 6c23660d035e71de0e20b40460ad3050bd057665 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH 20/30] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -78,6 +78,3 @@ index f2ad0c355d..3e6773795e 100644
  	__cache_line_size = av->a_un.a_val;
  	break;
  #ifndef SHARED
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 881bd911fc..8aecf2624c 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 78e379d65f4fc810fb095a97c4f36f0b79bb5e01 Mon Sep 17 00:00:00 2001
+From 55531ef57d04006c5a1e3b32a8e0410372f86007 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 21/30] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -51,6 +51,3 @@ index c4e28ffb98..648bae03d5 100644
 +       .long 0x80000
 +weak_alias (___fpscr_values, __fpscr_values)
 +
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
index 04a5be7fcb..aa62c6352c 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From 3e24f9d63aef5561b80fc7c345ce61943910e69b Mon Sep 17 00:00:00 2001
+From 4bb23fbb07984b93fd14f353fd9325d927b0cd98 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 22/30] eglibc: Forward port cross locale generation support
+Subject: [PATCH] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -561,6 +561,3 @@ index e4de907e1f..b5d8f5c17d 100644
  #ifdef NL_CURRENT_INDIRECT
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 092e90e5e3..68fad96410 100644
--- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 24f3fbd925b6af96c4369184528028b144b51310 Mon Sep 17 00:00:00 2001
+From 1b2ceb6c2414e3c98c7bcd029583287ced9f3159 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH 23/30] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -27,6 +27,3 @@ index 9956cd8446..04342f3644 100644
  /* Use the internal textdomain used for libc messages.  */
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index c78b4a3325..28cff2b90b 100644
--- a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From 9f02a73c41782688f43e01bc2adbba09fc83b51e Mon Sep 17 00:00:00 2001
+From a6159c9486745664a5f116ee9cc45837021b7624 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH 24/30] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -51,6 +51,3 @@ index 9d9b1ba7f2..8414028c58 100644
    return p - list;
  }
  
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
index 5eb1a019a4..4a7919ff5b 100644
--- a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
+++ b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -1,7 +1,7 @@
-From 985b3d9e9b3f99f5a23c0c68e8657e311ca6f42d Mon Sep 17 00:00:00 2001
+From 6c6aecba19b3e7947100623532a41b6f16734ace Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
 Date: Mon, 22 Aug 2016 16:09:25 +0200
-Subject: [PATCH 25/30] locale: fix hard-coded reference to gcc -E
+Subject: [PATCH] locale: fix hard-coded reference to gcc -E
 
 When new version of compilers are published, they may not be compatible with
 older versions of software. This is particularly common when software is built
@@ -33,6 +33,3 @@ index 30d3f2f195..e97653017c 100644
  
  
  sub cstrlen {
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
index ad10b3c715..71ddc1234b 100644
--- a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
+++ b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
@@ -1,7 +1,7 @@
-From c26abfc71ef461ef4980f57a35870b68826bd619 Mon Sep 17 00:00:00 2001
+From efb0fca7db742f4195e1771d8ba4c7fba4938819 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jan 2018 10:05:07 -0800
-Subject: [PATCH 26/30] reset dl_load_write_lock after forking
+Subject: [PATCH] reset dl_load_write_lock after forking
 
 The patch in this Bugzilla entry was requested by a customer:
 
@@ -35,6 +35,3 @@ index ec56a827eb..0f48933ff1 100644
        /* Run the handlers registered for the child.  */
        __run_fork_handlers (atfork_run_child);
      }
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
index 1ad14b7fc3..dd37f2cd4d 100644
--- a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
+++ b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
@@ -1,7 +1,7 @@
-From c3e04a90dd762cad4ee9bd7564d74e052781be5c Mon Sep 17 00:00:00 2001
+From 6ea962e0946da7564a774b08dd3eda28d64e9e56 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jan 2018 10:08:04 -0800
-Subject: [PATCH 27/30] Acquire ld.so lock before switching to malloc_atfork
+Subject: [PATCH] Acquire ld.so lock before switching to malloc_atfork
 
 The patch is from
   https://sourceware.org/bugzilla/show_bug.cgi?id=4578
@@ -63,6 +63,3 @@ index 0f48933ff1..eef3f9669b 100644
      }
  
    return pid;
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
index 8f0b05694f..fae8d0040d 100644
--- a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
+++ b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
@@ -1,8 +1,8 @@
-From 55cc59b7da97b80cd26027656a252082b09aa2bb Mon Sep 17 00:00:00 2001
+From 38fad3e5ab3b45c56810abd35fa11a72fa10b8f1 Mon Sep 17 00:00:00 2001
 From: Pratyush Anand <panand@redhat.com>
 Date: Wed, 22 Mar 2017 17:02:38 +0530
-Subject: [PATCH 28/30] bits/siginfo-consts.h: enum definition for TRAP_HWBKPT
- is missing
+Subject: [PATCH] bits/siginfo-consts.h: enum definition for TRAP_HWBKPT is
+ missing
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -64,6 +64,3 @@ index 193bd9c471..3fe852bc5f 100644
  };
  # endif
  
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 8bdd466806..e17f6aa3b9 100644
--- a/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,8 +1,7 @@
-From 5a6f019ded549faaf42478f6f96428dc7c20606e Mon Sep 17 00:00:00 2001
+From 865651d2496a90f7ae8e7cc19a2e54b6f17a8ad5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
-Subject: [PATCH 29/30] localedef --add-to-archive uses a hard-coded locale
- path
+Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
 
 it doesn't exist in normal use, and there's no way to pass an
 alternative filename.
@@ -15,14 +14,14 @@ Upstream-Status: Inappropriate (OE-specific)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- locale/programs/locarchive.c | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
+ locale/programs/locarchive.c | 37 ++++++++++++++++++++++++++----------
+ 1 file changed, 27 insertions(+), 10 deletions(-)
 
-Index: git/locale/programs/locarchive.c
-===================================================================
---- git.orig/locale/programs/locarchive.c
-+++ git/locale/programs/locarchive.c
-@@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah,
+diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
+index ca332a345f..91f62da662 100644
+--- a/locale/programs/locarchive.c
++++ b/locale/programs/locarchive.c
+@@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
    struct namehashent *oldnamehashtab;
    struct locarhandle new_ah;
    size_t prefix_len = output_prefix ? strlen (output_prefix) : 0;
@@ -52,7 +51,7 @@ Index: git/locale/programs/locarchive.c
    strcpy (stpcpy (fname, archivefname), ".XXXXXX");
  
    /* Not all of the old file has to be mapped.  Change this now this
-@@ -551,6 +563,8 @@ enlarge_archive (struct locarhandle *ah,
+@@ -551,6 +563,8 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
  
    /* Add the information for the new one.  */
    *ah = new_ah;
@@ -61,7 +60,7 @@ Index: git/locale/programs/locarchive.c
  }
  
  
-@@ -569,10 +583,13 @@ open_archive (struct locarhandle *ah, bo
+@@ -569,10 +583,13 @@ open_archive (struct locarhandle *ah, bool readonly)
    /* If ah has a non-NULL fname open that otherwise open the default.  */
    if (archivefname == NULL)
      {
@@ -79,7 +78,7 @@ Index: git/locale/programs/locarchive.c
      }
  
    while (1)
-@@ -585,7 +602,7 @@ open_archive (struct locarhandle *ah, bo
+@@ -585,7 +602,7 @@ open_archive (struct locarhandle *ah, bool readonly)
  	     the default locale archive we ignore the failure and
  	     list an empty archive, otherwise we print an error
  	     and exit.  */
diff --git a/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
index f0a950aca9..db97d91c99 100644
--- a/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
+++ b/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,7 +1,7 @@
-From 959f3fc8743cbb3b13c3be11ee359f139f5be8c7 Mon Sep 17 00:00:00 2001
+From a54c15d0567d547137066f41b1b22eba4875c27b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:44:00 -0700
-Subject: [PATCH 30/30] intl: Emit no lines in bison generated files
+Subject: [PATCH] intl: Emit no lines in bison generated files
 
 Improve reproducibility:
 Do not put any #line preprocessor commands in bison generated files.
@@ -29,6 +29,3 @@ index 672edf1b38..d31888d013 100644
  
  $(inst_localedir)/locale.alias: locale.alias $(+force)
  	$(do-install)
--- 
-2.18.0
-
diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
new file mode 100644
index 0000000000..61f55d4f83
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
@@ -0,0 +1,258 @@
+From 546b46c309a52ed74dc906114b1e984bb9703d74 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 14 Sep 2018 23:23:03 +0000
+Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors with -O
+ [BZ #19444]
+
+With -O included in CFLAGS it fails to build with:
+
+../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
+../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+      b = invsqrtpi * temp / sqrtl (x);
+          ~~~~~~~~~~^~~~~~
+../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_ynl':
+../sysdeps/ieee754/ldbl-96/e_jnl.c:375:16: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  b = invsqrtpi * temp / sqrtl (x);
+      ~~~~~~~~~~^~~~~~
+../sysdeps/ieee754/dbl-64/e_jn.c: In function '__ieee754_jn':
+../sysdeps/ieee754/dbl-64/e_jn.c:113:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+      b = invsqrtpi * temp / sqrt (x);
+          ~~~~~~~~~~^~~~~~
+../sysdeps/ieee754/dbl-64/e_jn.c: In function '__ieee754_yn':
+../sysdeps/ieee754/dbl-64/e_jn.c:320:16: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  b = invsqrtpi * temp / sqrt (x);
+      ~~~~~~~~~~^~~~~~
+
+Build tested with Yocto for ARM, AARCH64, X86, X86_64, PPC, MIPS, MIPS64
+with -O, -O1, -Os.
+For soft-fp ARM it needs one more fix for -O1:
+https://sourceware.org/ml/libc-alpha/2018-09/msg00300.html
+For AARCH64 it needs one more fix in locale for -Os.
+
+        [BZ #23716]
+        * sysdeps/ieee754/dbl-96/e_jnl.c: Fix build with -O
+        * sysdeps/ieee754/ldbl-96/e_jnl.c: Likewise.
+        * sysdeps/ieee754/ldbl-128/e_jnl.c: Likewise.
+        * sysdeps/ieee754/ldbl-128ibm/e_jnl.c: Likewise.
+
+Work around the issue instead of removing -O like we do with
+SELECTED_OPTIMIZATION
+
+Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00299.html]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ ChangeLog                           |  7 +++++++
+ sysdeps/ieee754/dbl-64/e_jn.c       | 21 +++++++++++++++++++++
+ sysdeps/ieee754/ldbl-128/e_jnl.c    | 21 +++++++++++++++++++++
+ sysdeps/ieee754/ldbl-128ibm/e_jnl.c | 21 +++++++++++++++++++++
+ sysdeps/ieee754/ldbl-96/e_jnl.c     | 21 +++++++++++++++++++++
+ 5 files changed, 91 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 11a9b8d98e..922e916f2c 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,10 @@
++2018-09-29  Martin Jansa  <Martin.Jansa@gmail.com>
++	Partial fix for [BZ #23716]
++	* sysdeps/ieee754/dbl-96/e_jnl.c: Fix build with -O
++	* sysdeps/ieee754/ldbl-96/e_jnl.c: Likewise.
++	* sysdeps/ieee754/ldbl-128/e_jnl.c: Likewise.
++	* sysdeps/ieee754/ldbl-128ibm/e_jnl.c: Likewise.
++
+ 2018-09-28  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+ 
+ 	[BZ #23579]
+diff --git a/sysdeps/ieee754/dbl-64/e_jn.c b/sysdeps/ieee754/dbl-64/e_jn.c
+index 9181b22bb8..9ff52c737f 100644
+--- a/sysdeps/ieee754/dbl-64/e_jn.c
++++ b/sysdeps/ieee754/dbl-64/e_jn.c
+@@ -42,6 +42,7 @@
+ #include <math-narrow-eval.h>
+ #include <math_private.h>
+ #include <math-underflow.h>
++#include <libc-diag.h>
+ 
+ static const double
+   invsqrtpi = 5.64189583547756279280e-01, /* 0x3FE20DD7, 0x50429B6D */
+@@ -109,7 +110,17 @@ __ieee754_jn (int n, double x)
+ 	      case 2: temp = -c - s; break;
+ 	      case 3: temp = c - s; break;
+ 	      }
++	    /* With GCC 8 (and older) when compiling with -O the compiler
++	       warns that the variable 'temp', may be used uninitialized.
++	       The switch above covers all possible values of n & 3
++	       but GCC without VRP enabled isn't able to figure out the
++	       range of possible values is [0,3] as explained in:
++	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	       so it's false possitive with -O1 and lower. */
++	    DIAG_PUSH_NEEDS_COMMENT;
++	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	    b = invsqrtpi * temp / sqrt (x);
++	    DIAG_POP_NEEDS_COMMENT;
+ 	  }
+ 	else
+ 	  {
+@@ -316,7 +327,17 @@ __ieee754_yn (int n, double x)
+ 	  case 2: temp = -s + c; break;
+ 	  case 3: temp = s + c; break;
+ 	  }
++	/* With GCC 8 (and older) when compiling with -O the compiler
++	   warns that the variable 'temp', may be used uninitialized.
++	   The switch above covers all possible values of n & 3
++	   but GCC without VRP enabled isn't able to figure out the
++	   range of possible values is [0,3] as explained in:
++	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	   so it's false possitive with -O1 and lower. */
++	DIAG_PUSH_NEEDS_COMMENT;
++	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	b = invsqrtpi * temp / sqrt (x);
++	DIAG_POP_NEEDS_COMMENT;
+       }
+     else
+       {
+diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c b/sysdeps/ieee754/ldbl-128/e_jnl.c
+index 7739eec291..8706a11575 100644
+--- a/sysdeps/ieee754/ldbl-128/e_jnl.c
++++ b/sysdeps/ieee754/ldbl-128/e_jnl.c
+@@ -61,6 +61,7 @@
+ #include <math.h>
+ #include <math_private.h>
+ #include <math-underflow.h>
++#include <libc-diag.h>
+ 
+ static const _Float128
+   invsqrtpi = L(5.6418958354775628694807945156077258584405E-1),
+@@ -150,7 +151,17 @@ __ieee754_jnl (int n, _Float128 x)
+ 		temp = c - s;
+ 		break;
+ 	      }
++	    /* With GCC 8 (and older) when compiling with -O the compiler
++	       warns that the variable 'temp', may be used uninitialized.
++	       The switch above covers all possible values of n & 3
++	       but GCC without VRP enabled isn't able to figure out the
++	       range of possible values is [0,3] as explained in:
++	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	       so it's false possitive with -O1 and lower. */
++	    DIAG_PUSH_NEEDS_COMMENT;
++	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	    b = invsqrtpi * temp / sqrtl (x);
++	    DIAG_POP_NEEDS_COMMENT;
+ 	  }
+ 	else
+ 	  {
+@@ -386,7 +397,17 @@ __ieee754_ynl (int n, _Float128 x)
+ 	    temp = s + c;
+ 	    break;
+ 	  }
++	/* With GCC 8 (and older) when compiling with -O the compiler
++	   warns that the variable 'temp', may be used uninitialized.
++	   The switch above covers all possible values of n & 3
++	   but GCC without VRP enabled isn't able to figure out the
++	   range of possible values is [0,3] as explained in:
++	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	   so it's false possitive with -O1 and lower. */
++	DIAG_PUSH_NEEDS_COMMENT;
++	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	b = invsqrtpi * temp / sqrtl (x);
++	DIAG_POP_NEEDS_COMMENT;
+       }
+     else
+       {
+diff --git a/sysdeps/ieee754/ldbl-128ibm/e_jnl.c b/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
+index 71b3addfba..3226d02309 100644
+--- a/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
++++ b/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
+@@ -61,6 +61,7 @@
+ #include <math.h>
+ #include <math_private.h>
+ #include <math-underflow.h>
++#include <libc-diag.h>
+ 
+ static const long double
+   invsqrtpi = 5.6418958354775628694807945156077258584405E-1L,
+@@ -150,7 +151,17 @@ __ieee754_jnl (int n, long double x)
+ 		temp = c - s;
+ 		break;
+ 	      }
++	    /* With GCC 8 (and older) when compiling with -O the compiler
++	       warns that the variable 'temp', may be used uninitialized.
++	       The switch above covers all possible values of n & 3
++	       but GCC without VRP enabled isn't able to figure out the
++	       range of possible values is [0,3] as explained in:
++	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	       so it's false possitive with -O1 and lower. */
++	    DIAG_PUSH_NEEDS_COMMENT;
++	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	    b = invsqrtpi * temp / sqrtl (x);
++	    DIAG_POP_NEEDS_COMMENT;
+ 	  }
+ 	else
+ 	  {
+@@ -386,7 +397,17 @@ __ieee754_ynl (int n, long double x)
+ 	    temp = s + c;
+ 	    break;
+ 	  }
++	/* With GCC 8 (and older) when compiling with -O the compiler
++	   warns that the variable 'temp', may be used uninitialized.
++	   The switch above covers all possible values of n & 3
++	   but GCC without VRP enabled isn't able to figure out the
++	   range of possible values is [0,3] as explained in:
++	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	   so it's false possitive with -O1 and lower. */
++	DIAG_PUSH_NEEDS_COMMENT;
++	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	b = invsqrtpi * temp / sqrtl (x);
++	DIAG_POP_NEEDS_COMMENT;
+       }
+     else
+       {
+diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c b/sysdeps/ieee754/ldbl-96/e_jnl.c
+index 394921f564..da5c2cc93e 100644
+--- a/sysdeps/ieee754/ldbl-96/e_jnl.c
++++ b/sysdeps/ieee754/ldbl-96/e_jnl.c
+@@ -61,6 +61,7 @@
+ #include <math.h>
+ #include <math_private.h>
+ #include <math-underflow.h>
++#include <libc-diag.h>
+ 
+ static const long double
+   invsqrtpi = 5.64189583547756286948079e-1L, two = 2.0e0L, one = 1.0e0L;
+@@ -143,7 +144,17 @@ __ieee754_jnl (int n, long double x)
+ 		temp = c - s;
+ 		break;
+ 	      }
++	    /* With GCC 8 (and older) when compiling with -O the compiler
++	       warns that the variable 'temp', may be used uninitialized.
++	       The switch above covers all possible values of n & 3
++	       but GCC without VRP enabled isn't able to figure out the
++	       range of possible values is [0,3] as explained in:
++	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	       so it's false possitive with -O1 and lower. */
++	    DIAG_PUSH_NEEDS_COMMENT;
++	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	    b = invsqrtpi * temp / sqrtl (x);
++	    DIAG_POP_NEEDS_COMMENT;
+ 	  }
+ 	else
+ 	  {
+@@ -372,7 +383,17 @@ __ieee754_ynl (int n, long double x)
+ 	    temp = s + c;
+ 	    break;
+ 	  }
++	/* With GCC 8 (and older) when compiling with -O the compiler
++	   warns that the variable 'temp', may be used uninitialized.
++	   The switch above covers all possible values of n & 3
++	   but GCC without VRP enabled isn't able to figure out the
++	   range of possible values is [0,3] as explained in:
++	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
++	   so it's false possitive with -O1 and lower. */
++	DIAG_PUSH_NEEDS_COMMENT;
++	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ 	b = invsqrtpi * temp / sqrtl (x);
++	DIAG_POP_NEEDS_COMMENT;
+       }
+     else
+       {
diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
deleted file mode 100644
index b02c4ec94f..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 14 Sep 2018 23:23:03 +0000
-Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors
-
-* with -O included in BUILD_OPTIMIZATION when DEBUG_BUILD
-  is used, nativesdk-glibc fails with:
-../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
-../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-      b = invsqrtpi * temp / sqrtl (x);
-          ~~~~~~~~~~^~~~~~
-../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_ynl':
-../sysdeps/ieee754/ldbl-96/e_jnl.c:375:16: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  b = invsqrtpi * temp / sqrtl (x);
-      ~~~~~~~~~~^~~~~~
-
-* work around the issue instead of removing -O like we do with
-  SELECTED_OPTIMIZATION
-
-Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00299.html]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- sysdeps/ieee754/dbl-64/e_jn.c    | 2 ++
- sysdeps/ieee754/ldbl-128/e_jnl.c | 4 ++++
- sysdeps/ieee754/ldbl-96/e_jnl.c  | 4 ++++
- 3 files changed, 10 insertions(+)
-
-diff --git a/sysdeps/ieee754/dbl-64/e_jn.c b/sysdeps/ieee754/dbl-64/e_jn.c
-index 9181b22bb8..74a6b5f149 100644
---- a/sysdeps/ieee754/dbl-64/e_jn.c
-+++ b/sysdeps/ieee754/dbl-64/e_jn.c
-@@ -108,6 +108,7 @@ __ieee754_jn (int n, double x)
- 	      case 1: temp = -c + s; break;
- 	      case 2: temp = -c - s; break;
- 	      case 3: temp = c - s; break;
-+	      default: temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 	      }
- 	    b = invsqrtpi * temp / sqrt (x);
- 	  }
-@@ -315,6 +316,7 @@ __ieee754_yn (int n, double x)
- 	  case 1: temp = -s - c; break;
- 	  case 2: temp = -s + c; break;
- 	  case 3: temp = s + c; break;
-+	  default: temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 	  }
- 	b = invsqrtpi * temp / sqrt (x);
-       }
-diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c b/sysdeps/ieee754/ldbl-128/e_jnl.c
-index 7739eec291..b6a1275464 100644
---- a/sysdeps/ieee754/ldbl-128/e_jnl.c
-+++ b/sysdeps/ieee754/ldbl-128/e_jnl.c
-@@ -149,6 +149,8 @@ __ieee754_jnl (int n, _Float128 x)
- 	      case 3:
- 		temp = c - s;
- 		break;
-+	      default:
-+	        temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 	      }
- 	    b = invsqrtpi * temp / sqrtl (x);
- 	  }
-@@ -385,6 +387,8 @@ __ieee754_ynl (int n, _Float128 x)
- 	  case 3:
- 	    temp = s + c;
- 	    break;
-+	  default:
-+	    temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 	  }
- 	b = invsqrtpi * temp / sqrtl (x);
-       }
-diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c b/sysdeps/ieee754/ldbl-96/e_jnl.c
-index 394921f564..2263b02203 100644
---- a/sysdeps/ieee754/ldbl-96/e_jnl.c
-+++ b/sysdeps/ieee754/ldbl-96/e_jnl.c
-@@ -142,6 +142,8 @@ __ieee754_jnl (int n, long double x)
- 	      case 3:
- 		temp = c - s;
- 		break;
-+	      default:
-+	        temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 	      }
- 	    b = invsqrtpi * temp / sqrtl (x);
- 	  }
-@@ -371,6 +373,8 @@ __ieee754_ynl (int n, long double x)
- 	  case 3:
- 	    temp = s + c;
- 	    break;
-+	  default:
-+	    temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
- 	  }
- 	b = invsqrtpi * temp / sqrtl (x);
-       }
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
deleted file mode 100644
index 4d56e55296..0000000000
--- a/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 0efa7fd1c800277d5323d05cb245c0536fe9ce22 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 16 Sep 2018 12:39:22 +0000
-Subject: [PATCH] soft-fp: ignore maybe-uninitialized
-
-* with -O it fails with:
-
-In file included from ../soft-fp/soft-fp.h:318,
-                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
-../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
-../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
-                         ^~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared here
-   FP_DECL_D (R);
-              ^
-../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
-   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
-                                    ^
-../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
- # define FP_DECL_D(X)  _FP_DECL (2, X)
-                        ^~~~~~~~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
-   FP_DECL_D (R);
-   ^~~~~~~~~
-../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
-                 ^~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared here
-   FP_DECL_D (R);
-              ^
-../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
-   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
-              ^
-../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
- # define FP_DECL_D(X)  _FP_DECL (2, X)
-                        ^~~~~~~~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
-   FP_DECL_D (R);
-   ^~~~~~~~~
-
-Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00300.html]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- soft-fp/op-2.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/soft-fp/op-2.h b/soft-fp/op-2.h
-index 6020d663d4..6672337949 100644
---- a/soft-fp/op-2.h
-+++ b/soft-fp/op-2.h
-@@ -92,6 +92,8 @@
- 	      X##_f1 = 0;						\
- 	    }))
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
- #define _FP_FRAC_SRS_2(X, N, sz)					\
-   (void) (((N) < _FP_W_TYPE_SIZE)					\
- 	  ? ({								\
-@@ -109,6 +111,7 @@
- 			    | X##_f0) != 0));				\
- 	      X##_f1 = 0;						\
- 	    }))
-+#pragma GCC diagnostic pop
- 
- #define _FP_FRAC_ADDI_2(X, I)	\
-   __FP_FRAC_ADDI_2 (X##_f1, X##_f0, I)
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch b/meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
new file mode 100644
index 0000000000..99cd2509ec
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
@@ -0,0 +1,100 @@
+From 618668540e263c09b0eb28131dde7b4500158fd4 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 16 Sep 2018 12:39:22 +0000
+Subject: [PATCH] sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
+ [BZ #19444]
+
+* with -O, -O1, -Os it fails with:
+
+In file included from ../soft-fp/soft-fp.h:318,
+                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
+../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
+../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
+                         ^~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared here
+   FP_DECL_D (R);
+              ^
+../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
+   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
+                                    ^
+../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
+ # define FP_DECL_D(X)  _FP_DECL (2, X)
+                        ^~~~~~~~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
+   FP_DECL_D (R);
+   ^~~~~~~~~
+../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
+                 ^~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared here
+   FP_DECL_D (R);
+              ^
+../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
+   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
+              ^
+../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
+ # define FP_DECL_D(X)  _FP_DECL (2, X)
+                        ^~~~~~~~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
+   FP_DECL_D (R);
+   ^~~~~~~~~
+
+Build tested with Yocto for ARM, AARCH64, X86, X86_64, PPC, MIPS, MIPS64
+with -O, -O1, -Os.
+For AARCH64 it needs one more fix in locale for -Os.
+
+	Partial fix for [BZ #23716]
+	* sysdeps/ieee754/soft-fp/s_fdiv.c: Fix build with -O
+
+Work around the issue instead of removing -O like we do with
+SELECTED_OPTIMIZATION
+
+Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00300.html]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ ChangeLog                        |  4 ++++
+ sysdeps/ieee754/soft-fp/s_fdiv.c | 12 ++++++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 922e916f2c..216336edc9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,7 @@
++2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
++	Partial fix for [BZ #23716]
++	* sysdeps/ieee754/soft-fp/s_fdiv.c: Fix build with -O.
++
+ 2018-09-29  Martin Jansa  <Martin.Jansa@gmail.com>
+ 	Partial fix for [BZ #23716]
+ 	* sysdeps/ieee754/dbl-96/e_jnl.c: Fix build with -O
+diff --git a/sysdeps/ieee754/soft-fp/s_fdiv.c b/sysdeps/ieee754/soft-fp/s_fdiv.c
+index 341339f5ed..14655b77da 100644
+--- a/sysdeps/ieee754/soft-fp/s_fdiv.c
++++ b/sysdeps/ieee754/soft-fp/s_fdiv.c
+@@ -25,6 +25,16 @@
+ #undef fdivl
+ 
+ #include <math-narrow.h>
++
++#include <libc-diag.h>
++/* R_f[01] are not set in cases where it is not used in packing, but the
++   compiler does not see that it is set in all cases where it is
++   used, resulting in warnings that it may be used uninitialized.
++   The location of the warning differs in different versions of GCC,
++   it may be where R is defined using a macro or it may be where the
++   macro is defined.  */
++DIAG_PUSH_NEEDS_COMMENT;
++DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+ #include <soft-fp.h>
+ #include <single.h>
+ #include <double.h>
+@@ -53,4 +63,6 @@ __fdiv (double x, double y)
+   CHECK_NARROW_DIV (ret, x, y);
+   return ret;
+ }
++DIAG_POP_NEEDS_COMMENT;
++
+ libm_alias_float_double (div)
diff --git a/meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
new file mode 100644
index 0000000000..31058ca91a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -0,0 +1,68 @@
+From cbada1a1b218c1ef61d0eb4363fad7598e6509d6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 30 Sep 2018 09:16:48 +0000
+Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
+ #19444]
+
+Fixes following error when building for aarch64 with -Os:
+| In file included from strcoll_l.c:43:
+| strcoll_l.c: In function '__strcoll_l':
+| ../locale/weight.h:31:26: error: 'seq2.back_us' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    int_fast32_t i = table[*(*cpp)++];
+|                           ^~~~~~~~~
+| strcoll_l.c:304:18: note: 'seq2.back_us' was declared here
+|    coll_seq seq1, seq2;
+|                   ^~~~
+| In file included from strcoll_l.c:43:
+| ../locale/weight.h:31:26: error: 'seq1.back_us' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|    int_fast32_t i = table[*(*cpp)++];
+|                           ^~~~~~~~~
+| strcoll_l.c:304:12: note: 'seq1.back_us' was declared here
+|    coll_seq seq1, seq2;
+|             ^~~~
+
+        Partial fix for [BZ #23716]
+        * locale/weight.h: Fix build with -Os.
+
+Work around the issue instead of removing -O like we do with
+SELECTED_OPTIMIZATION
+
+Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00539.html]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ ChangeLog       | 4 ++++
+ locale/weight.h | 7 +++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 216336edc9..84fbbf47ed 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,7 @@
++2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
++	Partial fix for [BZ #23716]
++	* locale/weight.h: Fix build with -Os.
++
+ 2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
+ 	Partial fix for [BZ #23716]
+ 	* sysdeps/ieee754/soft-fp/s_fdiv.c: Fix build with -O.
+diff --git a/locale/weight.h b/locale/weight.h
+index 6028d3595e..10bcea25e5 100644
+--- a/locale/weight.h
++++ b/locale/weight.h
+@@ -28,7 +28,14 @@ findidx (const int32_t *table,
+ 	 const unsigned char *extra,
+ 	 const unsigned char **cpp, size_t len)
+ {
++  /* With GCC 8 when compiling with -Os the compiler warns that
++     seq1.back_us and seq2.back_us might be used uninitialized.
++     This uninitialized use is impossible for the same reason
++     as described in comments in locale/weightwc.h.  */
++  DIAG_PUSH_NEEDS_COMMENT;
++  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
+   int_fast32_t i = table[*(*cpp)++];
++  DIAG_POP_NEEDS_COMMENT;
+   const unsigned char *cp;
+   const unsigned char *usrc;
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 804b7891ec..bd8b51e1d6 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
 
 DEPENDS += "gperf-native bison-native make-native"
 
-SRCREV ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
+SRCREV ?= "044c96f0d5595aeb0bb4e79355081c5a7f4faca5"
 
 SRCBRANCH ?= "release/${PV}/master"
 
@@ -45,9 +45,9 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch \
-           file://0032-soft-fp-ignore-maybe-uninitialized.patch \
-           file://0001-Linux-gethostid-Check-for-NULL-value-from-gethostbyn.patch \
+           file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch \
+           file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
+           file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.17.1


