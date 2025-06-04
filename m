Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00016C7113C
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11719.1749026736796839147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hT0rQasf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026743; x=1780562743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KN9Ll5COIG2Lr3XhH91FqxeY+Lne54i1pXeNTQHJ4nU=;
  b=hT0rQasfqYADAJMCZNe4lNUw9YNaeWWbeW6Cs1MrneJaR6xm9NPZb8/F
   flmSiCxhbYXPKjvhjGbNVELtuD9N/zadfTMaGfmKHmPeF8zElKXa38zrx
   5OSGL5T7IL4GV6OZutzH8np3YShsa3YRqvb3yWznFlo8k7lrLpZJfWKOw
   9X48k3O5zvYpTWryltLGldjca/dwShEaSVSk94ASqv59e/0bXoVhjfVWj
   i3+h6rrueyqlK2Jib/0KcIxsgOdcibuDhdyuLJpKkAqPNYDYtLJEwaHCg
   9+B09p1Ger7EgSBgq1obL2xZT3p02eUiV1UHQSVG6HE18IlRQzIbReEN6
   w==;
X-CSE-ConnectionGUID: HozjoRsBTAi69GRs5gp0+Q==
X-CSE-MsgGUID: sjls2hfWSZelpmgJTQXJTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="201658011"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="201658011"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EEEEBD6EE2
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D145CFA44
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:37 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 27FCD1A0078;
	Wed,  4 Jun 2025 16:45:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/45] libunwind: upgrade 1.8.1 -> 1.8.2
Date: Wed,  4 Jun 2025 16:45:04 +0800
Message-ID: <20250604084524.864-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217874

From: Wang Mingyu <wangmy@fujitsu.com>

0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
0004-Rework-inline-aarch64-as-for-setcontext.patch
removed since they're included in 1.8.2

libatomic.patch
malloc.patch
refreshed for 1.8.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...compilation-of-unw_getcontext-on-ARM.patch |  27 ---
 ...ork-inline-aarch64-as-for-setcontext.patch | 163 ------------------
 .../libunwind/libunwind/libatomic.patch       |   6 +-
 .../libunwind/libunwind/malloc.patch          |  10 +-
 ...{libunwind_1.8.1.bb => libunwind_1.8.2.bb} |   4 +-
 5 files changed, 9 insertions(+), 201 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
 rename meta/recipes-support/libunwind/{libunwind_1.8.1.bb => libunwind_1.8.2.bb} (90%)

diff --git a/meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch b/meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
deleted file mode 100644
index 19bdd858f7..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e5216c3fb1fa8d60a18c68e4749a3ff902f6678b Mon Sep 17 00:00:00 2001
-From: Ian Zborovsky <ian@veego.io>
-Date: Mon, 6 May 2024 02:01:19 +0300
-Subject: [PATCH 3/4] Fixed miscompilation of unw_getcontext() on ARM
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- include/libunwind-arm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/libunwind-arm.h b/include/libunwind-arm.h
-index 6cfa577d..6643a185 100644
---- a/include/libunwind-arm.h
-+++ b/include/libunwind-arm.h
-@@ -288,7 +288,7 @@ unw_tdep_context_t;
-     "mov r0, #0\n\t"                                                                            \
-     "stmia %[base]!, {r0-r15}\n\t"                                                              \
-     VSTMIA                                                                                      \
--    : [r0] "=r" (r0) : [base] "r" (unw_base) : "memory");                                       \
-+    : [r0] "=r" (r0), [base] "+r" (unw_base) : : "memory");                                     \
-   (int)r0; })
- #else /* __thumb__ */
- #define unw_tdep_getcontext(uc) ({                                        \
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch b/meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
deleted file mode 100644
index 005a077028..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From a832070f3665d29a8a06652c15f94d144c24ac69 Mon Sep 17 00:00:00 2001
-From: Stephen Webb <swebb@blackberry.com>
-Date: Mon, 22 Apr 2024 15:56:54 -0400
-Subject: [PATCH 4/5] Rework inline aarch64 as for setcontext
-
-Modern GC and clang were barfing on the inline asm constraints for the
-aarch64-linux setcontext() replacement. Reformulated the asm code to
-reduce the required constraints.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/aarch64/Gos-linux.c | 115 +++++++++++++++++++++-------------------
- 1 file changed, 61 insertions(+), 54 deletions(-)
-
-diff --git a/src/aarch64/Gos-linux.c b/src/aarch64/Gos-linux.c
-index 7cd8c879..1e494962 100644
---- a/src/aarch64/Gos-linux.c
-+++ b/src/aarch64/Gos-linux.c
-@@ -2,6 +2,7 @@
-    Copyright (C) 2008 CodeSourcery
-    Copyright (C) 2011-2013 Linaro Limited
-    Copyright (C) 2012 Tommi Rantala <tt.rantala@gmail.com>
-+   Copyright 2024 Stephen M. Webb  <swebb@blackberry.com>
- 
- This file is part of libunwind.
- 
-@@ -28,6 +29,28 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
- 
- #ifndef UNW_REMOTE_ONLY
- 
-+/* Magic constants generated from gen-offsets.c */
-+#define SC_R0_OFF   "8"
-+#define SC_R2_OFF   "24"
-+#define SC_R18_OFF  "152"
-+#define SC_R20_OFF  "168"
-+#define SC_R22_OFF  "184"
-+#define SC_R24_OFF  "200"
-+#define SC_R26_OFF  "216"
-+#define SC_R28_OFF  "232"
-+#define SC_R30_OFF  "248"
-+
-+#define FP_R08_OFF "80"
-+#define FP_R09_OFF "88"
-+#define FP_R10_OFF "96"
-+#define FP_R11_OFF "104"
-+#define FP_R12_OFF "112"
-+#define FP_R13_OFF "120"
-+#define FP_R14_OFF "128"
-+#define FP_R15_OFF "136"
-+
-+#define SC_SP_OFF   "0x100"
-+
- HIDDEN int
- aarch64_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
- {
-@@ -36,65 +59,49 @@ aarch64_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
- 
-   if (c->sigcontext_format == AARCH64_SCF_NONE)
-     {
-+
-+      /*
-+       * This is effectively the old POSIX setcontext().
-+       *
-+       * This inline asm is broken up to use local scratch registers for the
-+       * uc_mcontext.regs and FPCTX base addresses because newer versions of GCC
-+       * and clang barf on too many constraints (gh-702) when the C array
-+       * elements are used directly.
-+       *
-+       * Clobbers aren't required for the inline asm because they just convince
-+       * the compiler to save those registers and they never get restored
-+       * becauise the asm ends with a plain ol' ret.
-+       */
-+      register void* uc_mcontext __asm__ ("x5") = (void*) &uc->uc_mcontext;
-+      register void* fpctx __asm__ ("x4") = (void*) GET_FPCTX(uc);
-+
-       /* Since there are no signals involved here we restore EH and non scratch
-          registers only.  */
-       __asm__ __volatile__ (
--        "ldr x0,  %[x0]\n\t"
--        "ldr x1,  %[x1]\n\t"
--        "ldr x2,  %[x2]\n\t"
--        "ldr x3,  %[x3]\n\t"
--        "ldr x19, %[x19]\n\t"
--        "ldr x20, %[x20]\n\t"
--        "ldr x21, %[x21]\n\t"
--        "ldr x22, %[x22]\n\t"
--        "ldr x23, %[x23]\n\t"
--        "ldr x24, %[x24]\n\t"
--        "ldr x25, %[x25]\n\t"
--        "ldr x26, %[x26]\n\t"
--        "ldr x27, %[x27]\n\t"
--        "ldr x28, %[x28]\n\t"
--        "ldr x29, %[x29]\n\t"
--        "ldr x30, %[x30]\n\t"
--        "ldr d8,  %[d8]\n\t"
--        "ldr d9,  %[d9]\n\t"
--        "ldr d10, %[d10]\n\t"
--        "ldr d11, %[d11]\n\t"
--        "ldr d12, %[d12]\n\t"
--        "ldr d13, %[d13]\n\t"
--        "ldr d14, %[d14]\n\t"
--        "ldr d15, %[d15]\n\t"
--        "ldr x5,  %[sp]\n\t"
-+        "ldp x0,  x1,  [x5, " SC_R0_OFF  "]\n\t"
-+        "ldp x2,  x3,  [x5, " SC_R2_OFF  "]\n\t"
-+        "ldp x18, x19, [x5, " SC_R18_OFF "]\n\t"
-+        "ldp x20, x21, [x5, " SC_R20_OFF "]\n\t"
-+        "ldp x22, x23, [x5, " SC_R22_OFF "]\n\t"
-+        "ldp x24, x25, [x5, " SC_R24_OFF "]\n\t"
-+        "ldp x26, x27, [x5, " SC_R26_OFF "]\n\t"
-+        "ldp x28, x29, [x5, " SC_R28_OFF "]\n\t"
-+        "ldr x30, [x5, " SC_R30_OFF "]\n\t"
-+        "ldr d8,  [x4, " FP_R08_OFF "]\n\t"
-+        "ldr d9,  [x4, " FP_R09_OFF "]\n\t"
-+        "ldr d10, [x4, " FP_R10_OFF "]\n\t"
-+        "ldr d11, [x4, " FP_R11_OFF "]\n\t"
-+        "ldr d12, [x4, " FP_R12_OFF "]\n\t"
-+        "ldr d13, [x4, " FP_R13_OFF "]\n\t"
-+        "ldr d14, [x4, " FP_R14_OFF "]\n\t"
-+        "ldr d15, [x4, " FP_R15_OFF "]\n\t"
-+        "ldr x5,  [x5, " SC_SP_OFF "]\n\t"
-         "mov sp, x5\n\t"
-         "ret\n"
--        :
--        : [x0]  "m"(uc->uc_mcontext.regs[0]),
--		  [x1]  "m"(uc->uc_mcontext.regs[1]),
--		  [x2]  "m"(uc->uc_mcontext.regs[2]),
--		  [x3]  "m"(uc->uc_mcontext.regs[3]),
--		  [x19] "m"(uc->uc_mcontext.regs[19]),
--		  [x20] "m"(uc->uc_mcontext.regs[20]),
--		  [x21] "m"(uc->uc_mcontext.regs[21]),
--		  [x22] "m"(uc->uc_mcontext.regs[22]),
--		  [x23] "m"(uc->uc_mcontext.regs[23]),
--		  [x24] "m"(uc->uc_mcontext.regs[24]),
--		  [x25] "m"(uc->uc_mcontext.regs[25]),
--		  [x26] "m"(uc->uc_mcontext.regs[26]),
--		  [x27] "m"(uc->uc_mcontext.regs[27]),
--		  [x28] "m"(uc->uc_mcontext.regs[28]),
--		  [x29] "m"(uc->uc_mcontext.regs[29]), /* FP */
--		  [x30] "m"(uc->uc_mcontext.regs[30]), /* LR */
--		  [d8]  "m"(GET_FPCTX(uc)->vregs[8]),
--		  [d9]  "m"(GET_FPCTX(uc)->vregs[9]),
--		  [d10] "m"(GET_FPCTX(uc)->vregs[10]),
--		  [d11] "m"(GET_FPCTX(uc)->vregs[11]),
--		  [d12] "m"(GET_FPCTX(uc)->vregs[12]),
--		  [d13] "m"(GET_FPCTX(uc)->vregs[13]),
--		  [d14] "m"(GET_FPCTX(uc)->vregs[14]),
--		  [d15] "m"(GET_FPCTX(uc)->vregs[15]),
--          [sp]  "m"(uc->uc_mcontext.sp)
--		: "x0",   "x1",  "x2",  "x3", "x19", "x20", "x21", "x22", "x23", "x24",
--		  "x25", "x26", "x27", "x28", "x29", "x30"
--	  );
-+        : 
-+        : [uc_mcontext] "r"(uc_mcontext),
-+          [fpctx] "r"(fpctx)
-+      );
-     }
-   else
-     {
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/libatomic.patch b/meta/recipes-support/libunwind/libunwind/libatomic.patch
index f39e92f2ee..e783128e2c 100644
--- a/meta/recipes-support/libunwind/libunwind/libatomic.patch
+++ b/meta/recipes-support/libunwind/libunwind/libatomic.patch
@@ -1,4 +1,4 @@
-From d6a0d8ce07c761e51b9dc7c5d16a9b06c3e93560 Mon Sep 17 00:00:00 2001
+From a331e3a63981427724d2d9cfdcb4a456153299b5 Mon Sep 17 00:00:00 2001
 From: Stephen Webb <swebb@blackberry.com>
 Date: Mon, 18 Mar 2024 10:22:26 -0400
 Subject: [PATCH] configure.ac: detect if -latomic is required
@@ -14,10 +14,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 758a27d19..d0ef5f3d9 100644
+index eaa0ddc..d5f1d4a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -94,6 +94,18 @@ dnl Checks for library functions.
+@@ -93,6 +93,18 @@ dnl Checks for library functions.
  AC_CHECK_FUNCS(dl_iterate_phdr dl_phdr_removals_counter dlmodinfo getunwind \
  		ttrace mincore pipe2 sigaltstack execvpe)
  
diff --git a/meta/recipes-support/libunwind/libunwind/malloc.patch b/meta/recipes-support/libunwind/libunwind/malloc.patch
index 026a56f155..cfcef1ccdc 100644
--- a/meta/recipes-support/libunwind/libunwind/malloc.patch
+++ b/meta/recipes-support/libunwind/libunwind/malloc.patch
@@ -1,4 +1,4 @@
-From b67d508a93bf1ba231c18dce3894cfee25c16e0d Mon Sep 17 00:00:00 2001
+From 8fd3e0c24fdfed64e0642ec0334548f16a2a9390 Mon Sep 17 00:00:00 2001
 From: Stephen Webb <swebb@blackberry.com>
 Date: Wed, 12 Feb 2025 12:08:07 -0500
 Subject: [PATCH] Fix bad prototype for malloc() in test
@@ -23,7 +23,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  create mode 100644 tests/unw_test.h
 
 diff --git a/tests/Gtest-nomalloc.c b/tests/Gtest-nomalloc.c
-index 5b97fc709..e770ff614 100644
+index 5b97fc7..e770ff6 100644
 --- a/tests/Gtest-nomalloc.c
 +++ b/tests/Gtest-nomalloc.c
 @@ -1,78 +1,92 @@
@@ -188,10 +188,10 @@ index 5b97fc709..e770ff614 100644
 +  exit (UNW_TEST_EXIT_PASS);
  }
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index adc34ac63..60f3f3adc 100644
+index e2b07bc..844105a 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -214,7 +214,7 @@ endif
+@@ -200,7 +200,7 @@ endif
  
  noinst_PROGRAMS = $(noinst_PROGRAMS_common) $(noinst_PROGRAMS_cdep) \
  	$(noinst_PROGRAMS_arch)
@@ -202,7 +202,7 @@ index adc34ac63..60f3f3adc 100644
                      -e 's,[@]XFAIL_TESTS[@],$(XFAIL_TESTS),g' \
 diff --git a/tests/unw_test.h b/tests/unw_test.h
 new file mode 100644
-index 000000000..9ae86dce1
+index 0000000..9ae86dc
 --- /dev/null
 +++ b/tests/unw_test.h
 @@ -0,0 +1,47 @@
diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/recipes-support/libunwind/libunwind_1.8.2.bb
similarity index 90%
rename from meta/recipes-support/libunwind/libunwind_1.8.1.bb
rename to meta/recipes-support/libunwind/libunwind_1.8.2.bb
index 10714ea247..6f7168b5df 100644
--- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.8.2.bb
@@ -10,14 +10,12 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://mips-byte-order.patch \
            file://0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch \
            file://0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch \
-           file://0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch \
-           file://0004-Rework-inline-aarch64-as-for-setcontext.patch \
            file://0005-Handle-musl-on-PPC32.patch \
            file://libatomic.patch \
            file://malloc.patch \
            "
 
-SRC_URI[sha256sum] = "ddf0e32dd5fafe5283198d37e4bf9decf7ba1770b6e7e006c33e6df79e6a6157"
+SRC_URI[sha256sum] = "7f262f1a1224f437ede0f96a6932b582c8f5421ff207c04e3d9504dfa04c8b82"
 
 inherit autotools multilib_header github-releases
 
-- 
2.43.0


