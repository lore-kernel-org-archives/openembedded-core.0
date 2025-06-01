Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770DAC71130
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.27797.1748786154830885377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PKz2mLgP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tiqe4GRk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101972bc70abf-f91acafb-8385-41e7-9dcc-579bd4c4a5de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a5jmyMVxb6UsUhs3qlKwMoymBpSx5tiCdBpxV0FjzN4=;
	b=PKz2mLgPICngAH2ko+7APVZHyKk3H1K5RbFLKpjVxNnSUr/66Jt5oqma7jg2TyyV
	sDjE2kH6Ry/3WiTRFQ8KOtKmbag5D1Bg1LbpyvFOKNdSyJ1PkfepCKL1j9mKJW/9W6c
	9m/E89XoOeWlT+AQCt0LcQjLfuGniu14kMTLhNm0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a5jmyMVxb6UsUhs3qlKwMoymBpSx5tiCdBpxV0FjzN4=;
	b=tiqe4GRkTL6U55o+15mSXaW1+wgam/5p5KEVuy41wR0vwUBqhgTIyFTqMJtrU7I3
	gKVieg4mKZwXPAnZBcNeE+t2Kle6BrWKxTLzoaY6hJlb0TrWLJTkiNrrAqT4RWyyr6g
	GKwqssChp3TKSaOOVFsoEvRUoDLFsxLStUohCJZ4=
Content-Type: multipart/mixed; boundary="===============8871010592658879825=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libunwind: upgrading to 1.8.2 SUCCEEDED
Message-ID: <010101972bc70abf-f91acafb-8385-41e7-9dcc-579bd4c4a5de-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217671

--===============8871010592658879825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libunwind* to *1.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libunwind-upgrade-1.8.1-1.8.2.patch
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
From 7f6bb8833a9da753b4fd15a713624fe7ec39ecdc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 13:46:07 +0000
Subject: [PATCH] libunwind: upgrade 1.8.1 -> 1.8.2

---
 ...t-sve-signal-check-that-SVE-is-prese.patch |   9 +-
 ...bc-or-musl-register-names-as-appropr.patch |  11 +-
 ...compilation-of-unw_getcontext-on-ARM.patch |  27 ---
 ...ork-inline-aarch64-as-for-setcontext.patch | 163 ------------------
 .../libunwind/0005-Handle-musl-on-PPC32.patch |  11 +-
 .../libunwind/libunwind/libatomic.patch       |   6 +-
 .../libunwind/libunwind/malloc.patch          |  10 +-
 .../libunwind/libunwind/mips-byte-order.patch |   9 +-
 ...{libunwind_1.8.1.bb => libunwind_1.8.2.bb} |   4 +-
 9 files changed, 23 insertions(+), 227 deletions(-)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0004-Rework-inline-aarch64-as-for-setcontext.patch
 rename meta/recipes-support/libunwind/{libunwind_1.8.1.bb => libunwind_1.8.2.bb} (90%)

diff --git a/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch b/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
index f7af9a3fce..4329c08742 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
+++ b/meta/recipes-support/libunwind/libunwind/0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch
@@ -1,7 +1,7 @@
-From 2f03399911abdd549237fa2db64a4a8311fe67dc Mon Sep 17 00:00:00 2001
+From 968f92f4cac9aa642f96fe76b3a04b82cace2e9c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 15 Jan 2024 16:59:14 +0000
-Subject: [PATCH 1/4] tests/Garm64-test-sve-signal: check that SVE is present
+Subject: [PATCH] tests/Garm64-test-sve-signal: check that SVE is present
  before running tests
 
 If the compiler supports -march=armv8-a+sve then those options are used
@@ -25,7 +25,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 19 insertions(+)
 
 diff --git a/tests/Garm64-test-sve-signal.c b/tests/Garm64-test-sve-signal.c
-index 52cb9ac6..cf66b3f1 100644
+index 52cb9ac..cf66b3f 100644
 --- a/tests/Garm64-test-sve-signal.c
 +++ b/tests/Garm64-test-sve-signal.c
 @@ -9,11 +9,16 @@
@@ -68,6 +68,3 @@ index 52cb9ac6..cf66b3f1 100644
    signal(SIGUSR1, signal_handler);
    for (unsigned int i = 0; i < sizeof(z) / sizeof(z[0]); ++i)
      z[i] = rand();
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch b/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch
index f458bc3c6f..cd0094dde8 100644
--- a/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch
+++ b/meta/recipes-support/libunwind/libunwind/0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch
@@ -1,8 +1,8 @@
-From 2a5473a31c6b02e9c49d688691e848d6281ffd2e Mon Sep 17 00:00:00 2001
+From fb49e9eb79b821253cfd64337c7190eafa18874d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 16 Jan 2024 18:21:26 +0000
-Subject: [PATCH 2/4] coredump: use glibc or musl register names as appropriate
- on MIPS
+Subject: [PATCH] coredump: use glibc or musl register names as appropriate on
+ MIPS
 
 glibc has register macros of the form EF_REGx, but musl uses EF_Rx.
 
@@ -17,7 +17,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 39 insertions(+), 30 deletions(-)
 
 diff --git a/src/coredump/_UCD_access_reg_linux.c b/src/coredump/_UCD_access_reg_linux.c
-index 302f7bdf..05100ed6 100644
+index 302f7bd..05100ed 100644
 --- a/src/coredump/_UCD_access_reg_linux.c
 +++ b/src/coredump/_UCD_access_reg_linux.c
 @@ -100,38 +100,47 @@ _UCD_access_reg (unw_addr_space_t  as UNUSED,
@@ -98,6 +98,3 @@ index 302f7bdf..05100ed6 100644
        [UNW_MIPS_PC]  = EF_CP0_EPC,
      };
  #elif defined(UNW_TARGET_S390X)
--- 
-2.34.1
-
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
diff --git a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
index 63d3c85de4..53c6ed6b4b 100644
--- a/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
+++ b/meta/recipes-support/libunwind/libunwind/0005-Handle-musl-on-PPC32.patch
@@ -1,7 +1,7 @@
-From 7bd4fbdea43310e52feb57fb5afab6bec798cc99 Mon Sep 17 00:00:00 2001
+From 475156f6de81860fbefa52ce784f4d41f1b01558 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 17 Jan 2024 16:28:39 +0000
-Subject: [PATCH 5/5] Handle musl on PPC32
+Subject: [PATCH] Handle musl on PPC32
 
 On Linux, glibc and musl disagree over the layout of the ucontext_t
 structure.  For more details, see the musl mailing list:
@@ -21,7 +21,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  2 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
-index 9444cbb8..5e94ed8a 100644
+index 9444cbb..88014cf 100644
 --- a/src/ppc32/Ginit.c
 +++ b/src/ppc32/Ginit.c
 @@ -42,6 +42,13 @@ static struct unw_addr_space local_addr_space;
@@ -66,7 +66,7 @@ index 9444cbb8..5e94ed8a 100644
        addr = &uc->uc_mcontext.mc_gpr[gregs_idx];
  #endif
 diff --git a/src/ppc32/ucontext_i.h b/src/ppc32/ucontext_i.h
-index ee93c697..cfd8fe0e 100644
+index ee93c69..cfd8fe0 100644
 --- a/src/ppc32/ucontext_i.h
 +++ b/src/ppc32/ucontext_i.h
 @@ -44,8 +44,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
@@ -83,6 +83,3 @@ index ee93c697..cfd8fe0e 100644
  
  /* These are dummy structures used only for obtaining the offsets of the
     various structure members. */
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/libatomic.patch b/meta/recipes-support/libunwind/libunwind/libatomic.patch
index f39e92f2ee..d4ceb05859 100644
--- a/meta/recipes-support/libunwind/libunwind/libatomic.patch
+++ b/meta/recipes-support/libunwind/libunwind/libatomic.patch
@@ -1,4 +1,4 @@
-From d6a0d8ce07c761e51b9dc7c5d16a9b06c3e93560 Mon Sep 17 00:00:00 2001
+From 9699f39556e9fb4d8077890ea3696489e9b840c6 Mon Sep 17 00:00:00 2001
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
index 026a56f155..8d43364d51 100644
--- a/meta/recipes-support/libunwind/libunwind/malloc.patch
+++ b/meta/recipes-support/libunwind/libunwind/malloc.patch
@@ -1,4 +1,4 @@
-From b67d508a93bf1ba231c18dce3894cfee25c16e0d Mon Sep 17 00:00:00 2001
+From 1a5aa715f2de4deb3421101b26131c43cfb4b8fa Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
index 3336b79055..cd9e106497 100644
--- a/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
+++ b/meta/recipes-support/libunwind/libunwind/mips-byte-order.patch
@@ -1,7 +1,7 @@
-From dbbf8110ed3fd2cbac20a8ec2ac769e13c67bab1 Mon Sep 17 00:00:00 2001
+From 6d347283393a010f87064b80a899236c61e92c0d Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 16 Jan 2024 18:22:38 +0000
-Subject: [PATCH 2/2] byte order
+Subject: [PATCH] byte order
 
 endian.h on musl/mips can't be included in __ASSEMBLER__ mode,
 so use the __BYTE_ORDER__ symbol instead.
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/mips/getcontext.S b/src/mips/getcontext.S
-index d1dbd579..de9b6818 100644
+index d1dbd57..de9b681 100644
 --- a/src/mips/getcontext.S
 +++ b/src/mips/getcontext.S
 @@ -24,12 +24,11 @@ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
@@ -30,6 +30,3 @@ index d1dbd579..de9b6818 100644
  #  define OFFSET 4
  # else
  #  define OFFSET 0
--- 
-2.34.1
-
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
2.47.1


--===============8871010592658879825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libunwind: SRC_URI changed from "https://github.com/libunwind/libunwind/releases/download/v1.8.1/libunwind-1.8.1.tar.gz file://mips-byte-order.patch file://0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch file://0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch file://0003-Fixed-miscompilation-of-unw_getcontext-on-ARM.patch file://0004-Rework-inline-aarch64-as-for-setcontext.patch file://0005-Handle-musl-on-PPC32.patch file://libatomic.patch file://malloc.patch" to "https://github.com/libunwind/libunwind/releases/download/v1.8.2/libunwind-1.8.2.tar.gz file://mips-byte-order.patch file://0001-tests-Garm64-test-sve-signal-check-that-SVE-is-prese.patch file://0002-coredump-use-glibc-or-musl-register-names-as-appropr.patch file://0005-Handle-musl-on-PPC32.patch file://libatomic.patch file://malloc.patch"
packages/core2-64-poky-linux/libunwind: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind-dbg: PKGSIZE changed from 1213192 to 1218656 (+0%)
packages/core2-64-poky-linux/libunwind/libunwind-dbg: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind-dbg: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind-dbg: FILELIST: removed "/usr/lib/.debug/libunwind-x86_64.so.8.1.0 /usr/lib/.debug/libunwind.so.8.1.0", added "/usr/lib/.debug/libunwind-x86_64.so.8.2.0 /usr/lib/.debug/libunwind.so.8.2.0"
packages/core2-64-poky-linux/libunwind/libunwind-dev: PKGSIZE changed from 42851 to 43020 (+0%)
packages/core2-64-poky-linux/libunwind/libunwind-dev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind-dev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind-doc: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind-doc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind-locale: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind-locale: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind-src: PKGSIZE changed from 14576 to 14676 (+1%)
packages/core2-64-poky-linux/libunwind/libunwind-src: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind-src: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind-staticdev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind-staticdev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libunwind/libunwind: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libunwind/libunwind: FILELIST: removed "/usr/lib/libunwind.so.8.1.0 /usr/lib/libunwind-x86_64.so.8.1.0", added "/usr/lib/libunwind.so.8.2.0 /usr/lib/libunwind-x86_64.so.8.2.0"
Changes to packages/core2-64-poky-linux/libunwind (sysroot):
  /usr/lib/libunwind.so.8 changed symlink target from libunwind.so.8.1.0 to libunwind.so.8.2.0
  /usr/lib/libunwind.so changed symlink target from libunwind.so.8.1.0 to libunwind.so.8.2.0
  /usr/lib/libunwind-x86_64.so.8 changed symlink target from libunwind-x86_64.so.8.1.0 to libunwind-x86_64.so.8.2.0
  /usr/lib/libunwind-x86_64.so changed symlink target from libunwind-x86_64.so.8.1.0 to libunwind-x86_64.so.8.2.0
  /usr/lib/libunwind.so.8.1.0 moved to /usr/lib/libunwind.so.8.2.0
  /usr/lib/libunwind-x86_64.so.8.1.0 moved to /usr/lib/libunwind-x86_64.so.8.2.0

--===============8871010592658879825==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libunwind-upgrade-1.8.1-1.8.2.patch"

RnJvbSA3ZjZiYjg4MzNhOWRhNzUzYjRmZDE1YTcxMzYyNGZlN2VjMzllY2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMzo0NjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVud2luZDogdXBncmFkZSAxLjguMSAtPiAxLjguMgoKLS0tCiAuLi50LXN2ZS1zaWduYWwtY2hl
Y2stdGhhdC1TVkUtaXMtcHJlc2UucGF0Y2ggfCAgIDkgKy0KIC4uLmJjLW9yLW11c2wtcmVnaXN0
ZXItbmFtZXMtYXMtYXBwcm9wci5wYXRjaCB8ICAxMSArLQogLi4uY29tcGlsYXRpb24tb2YtdW53
X2dldGNvbnRleHQtb24tQVJNLnBhdGNoIHwgIDI3IC0tLQogLi4ub3JrLWlubGluZS1hYXJjaDY0
LWFzLWZvci1zZXRjb250ZXh0LnBhdGNoIHwgMTYzIC0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2xp
YnVud2luZC8wMDA1LUhhbmRsZS1tdXNsLW9uLVBQQzMyLnBhdGNoIHwgIDExICstCiAuLi4vbGli
dW53aW5kL2xpYnVud2luZC9saWJhdG9taWMucGF0Y2ggICAgICAgfCAgIDYgKy0KIC4uLi9saWJ1
bndpbmQvbGlidW53aW5kL21hbGxvYy5wYXRjaCAgICAgICAgICB8ICAxMCArLQogLi4uL2xpYnVu
d2luZC9saWJ1bndpbmQvbWlwcy1ieXRlLW9yZGVyLnBhdGNoIHwgICA5ICstCiAuLi57bGlidW53
aW5kXzEuOC4xLmJiID0+IGxpYnVud2luZF8xLjguMi5iYn0gfCAgIDQgKy0KIDkgZmlsZXMgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjI3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQvMDAwMy1GaXhlZC1t
aXNjb21waWxhdGlvbi1vZi11bndfZ2V0Y29udGV4dC1vbi1BUk0ucGF0Y2gKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kLzAwMDQtUmV3
b3JrLWlubGluZS1hYXJjaDY0LWFzLWZvci1zZXRjb250ZXh0LnBhdGNoCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL3tsaWJ1bndpbmRfMS44LjEuYmIgPT4gbGlidW53aW5k
XzEuOC4yLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVu
d2luZC9saWJ1bndpbmQvMDAwMS10ZXN0cy1HYXJtNjQtdGVzdC1zdmUtc2lnbmFsLWNoZWNrLXRo
YXQtU1ZFLWlzLXByZXNlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xp
YnVud2luZC8wMDAxLXRlc3RzLUdhcm02NC10ZXN0LXN2ZS1zaWduYWwtY2hlY2stdGhhdC1TVkUt
aXMtcHJlc2UucGF0Y2gKaW5kZXggZjdhZjlhM2ZjZS4uNDMyOWMwODc0MiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZC8wMDAxLXRlc3RzLUdhcm02
NC10ZXN0LXN2ZS1zaWduYWwtY2hlY2stdGhhdC1TVkUtaXMtcHJlc2UucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZC8wMDAxLXRlc3RzLUdhcm02NC10
ZXN0LXN2ZS1zaWduYWwtY2hlY2stdGhhdC1TVkUtaXMtcHJlc2UucGF0Y2gKQEAgLTEsNyArMSw3
IEBACi1Gcm9tIDJmMDMzOTk5MTFhYmRkNTQ5MjM3ZmEyZGI2NGE0YTgzMTFmZTY3ZGMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk2OGY5MmY0Y2FjOWFhNjQyZjk2ZmU3NmIzYTA0Yjgy
Y2FjZTJlOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTY6NTk6MTQgKzAwMDAK
LVN1YmplY3Q6IFtQQVRDSCAxLzRdIHRlc3RzL0dhcm02NC10ZXN0LXN2ZS1zaWduYWw6IGNoZWNr
IHRoYXQgU1ZFIGlzIHByZXNlbnQKK1N1YmplY3Q6IFtQQVRDSF0gdGVzdHMvR2FybTY0LXRlc3Qt
c3ZlLXNpZ25hbDogY2hlY2sgdGhhdCBTVkUgaXMgcHJlc2VudAogIGJlZm9yZSBydW5uaW5nIHRl
c3RzCiAKIElmIHRoZSBjb21waWxlciBzdXBwb3J0cyAtbWFyY2g9YXJtdjgtYStzdmUgdGhlbiB0
aG9zZSBvcHRpb25zIGFyZSB1c2VkCkBAIC0yNSw3ICsyNSw3IEBAIFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNl
cnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9HYXJtNjQtdGVzdC1zdmUtc2lnbmFsLmMg
Yi90ZXN0cy9HYXJtNjQtdGVzdC1zdmUtc2lnbmFsLmMKLWluZGV4IDUyY2I5YWM2Li5jZjY2YjNm
MSAxMDA2NDQKK2luZGV4IDUyY2I5YWMuLmNmNjZiM2YgMTAwNjQ0CiAtLS0gYS90ZXN0cy9HYXJt
NjQtdGVzdC1zdmUtc2lnbmFsLmMKICsrKyBiL3Rlc3RzL0dhcm02NC10ZXN0LXN2ZS1zaWduYWwu
YwogQEAgLTksMTEgKzksMTYgQEAKQEAgLTY4LDYgKzY4LDMgQEAgaW5kZXggNTJjYjlhYzYuLmNm
NjZiM2YxIDEwMDY0NAogICAgc2lnbmFsKFNJR1VTUjEsIHNpZ25hbF9oYW5kbGVyKTsKICAgIGZv
ciAodW5zaWduZWQgaW50IGkgPSAwOyBpIDwgc2l6ZW9mKHopIC8gc2l6ZW9mKHpbMF0pOyArK2kp
CiAgICAgIHpbaV0gPSByYW5kKCk7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kLzAwMDItY29yZWR1bXAtdXNlLWdsaWJj
LW9yLW11c2wtcmVnaXN0ZXItbmFtZXMtYXMtYXBwcm9wci5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQvMDAwMi1jb3JlZHVtcC11c2UtZ2xpYmMtb3ItbXVz
bC1yZWdpc3Rlci1uYW1lcy1hcy1hcHByb3ByLnBhdGNoCmluZGV4IGY0NThiYzNjNmYuLmNkMDA5
NGRkZTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndp
bmQvMDAwMi1jb3JlZHVtcC11c2UtZ2xpYmMtb3ItbXVzbC1yZWdpc3Rlci1uYW1lcy1hcy1hcHBy
b3ByLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQv
MDAwMi1jb3JlZHVtcC11c2UtZ2xpYmMtb3ItbXVzbC1yZWdpc3Rlci1uYW1lcy1hcy1hcHByb3By
LnBhdGNoCkBAIC0xLDggKzEsOCBAQAotRnJvbSAyYTU0NzNhMzFjNmIwMmU5YzQ5ZDY4ODY5MWU4
NDhkNjI4MWZmZDJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYjQ5ZTllYjc5Yjgy
MTI1M2NmZDY0MzM3YzcxOTBlYWZhMTg4NzRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBUdWUsIDE2IEphbiAy
MDI0IDE4OjIxOjI2ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMi80XSBjb3JlZHVtcDogdXNlIGds
aWJjIG9yIG11c2wgcmVnaXN0ZXIgbmFtZXMgYXMgYXBwcm9wcmlhdGUKLSBvbiBNSVBTCitTdWJq
ZWN0OiBbUEFUQ0hdIGNvcmVkdW1wOiB1c2UgZ2xpYmMgb3IgbXVzbCByZWdpc3RlciBuYW1lcyBh
cyBhcHByb3ByaWF0ZSBvbgorIE1JUFMKIAogZ2xpYmMgaGFzIHJlZ2lzdGVyIG1hY3JvcyBvZiB0
aGUgZm9ybSBFRl9SRUd4LCBidXQgbXVzbCB1c2VzIEVGX1J4LgogCkBAIC0xNyw3ICsxNyw3IEBA
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL3NyYy9jb3JlZHVtcC9fVUNEX2FjY2Vzc19yZWdfbGludXguYyBiL3NyYy9jb3JlZHVtcC9f
VUNEX2FjY2Vzc19yZWdfbGludXguYwotaW5kZXggMzAyZjdiZGYuLjA1MTAwZWQ2IDEwMDY0NAor
aW5kZXggMzAyZjdiZC4uMDUxMDBlZCAxMDA2NDQKIC0tLSBhL3NyYy9jb3JlZHVtcC9fVUNEX2Fj
Y2Vzc19yZWdfbGludXguYwogKysrIGIvc3JjL2NvcmVkdW1wL19VQ0RfYWNjZXNzX3JlZ19saW51
eC5jCiBAQCAtMTAwLDM4ICsxMDAsNDcgQEAgX1VDRF9hY2Nlc3NfcmVnICh1bndfYWRkcl9zcGFj
ZV90ICBhcyBVTlVTRUQsCkBAIC05OCw2ICs5OCwzIEBAIGluZGV4IDMwMmY3YmRmLi4wNTEwMGVk
NiAxMDA2NDQKICAgICAgICBbVU5XX01JUFNfUENdICA9IEVGX0NQMF9FUEMsCiAgICAgIH07CiAg
I2VsaWYgZGVmaW5lZChVTldfVEFSR0VUX1MzOTBYKQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZC8wMDAzLUZpeGVkLW1p
c2NvbXBpbGF0aW9uLW9mLXVud19nZXRjb250ZXh0LW9uLUFSTS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQvMDAwMy1GaXhlZC1taXNjb21waWxhdGlvbi1v
Zi11bndfZ2V0Y29udGV4dC1vbi1BUk0ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDE5YmRkODU4ZjcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
dW53aW5kL2xpYnVud2luZC8wMDAzLUZpeGVkLW1pc2NvbXBpbGF0aW9uLW9mLXVud19nZXRjb250
ZXh0LW9uLUFSTS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDI3ICswLDAgQEAKLUZyb20gZTUy
MTZjM2ZiMWZhOGQ2MGExOGM2OGU0NzQ5YTNmZjkwMmY2Njc4YiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IElhbiBaYm9yb3Zza3kgPGlhbkB2ZWVnby5pbz4KLURhdGU6IE1vbiwgNiBN
YXkgMjAyNCAwMjowMToxOSArMDMwMAotU3ViamVjdDogW1BBVENIIDMvNF0gRml4ZWQgbWlzY29t
cGlsYXRpb24gb2YgdW53X2dldGNvbnRleHQoKSBvbiBBUk0KLQotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+
Ci0tLS0KLSBpbmNsdWRlL2xpYnVud2luZC1hcm0uaCB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGli
dW53aW5kLWFybS5oIGIvaW5jbHVkZS9saWJ1bndpbmQtYXJtLmgKLWluZGV4IDZjZmE1NzdkLi42
NjQzYTE4NSAxMDA2NDQKLS0tLSBhL2luY2x1ZGUvbGlidW53aW5kLWFybS5oCi0rKysgYi9pbmNs
dWRlL2xpYnVud2luZC1hcm0uaAotQEAgLTI4OCw3ICsyODgsNyBAQCB1bndfdGRlcF9jb250ZXh0
X3Q7Ci0gICAgICJtb3YgcjAsICMwXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAic3Rt
aWEgJVtiYXNlXSEsIHtyMC1yMTV9XG5cdCIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgVlNUTUlBICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCi0tICAgIDogW3IwXSAiPXIiIChyMCkgOiBbYmFzZV0gInIiICh1
bndfYmFzZSkgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAotKyAgICA6IFtyMF0gIj1yIiAocjApLCBbYmFzZV0gIityIiAodW53X2Jhc2UpIDogOiAi
bWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgIChpbnQp
cjA7IH0pCi0gI2Vsc2UgLyogX190aHVtYl9fICovCi0gI2RlZmluZSB1bndfdGRlcF9nZXRjb250
ZXh0KHVjKSAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0tLSAK
LTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGli
dW53aW5kLzAwMDQtUmV3b3JrLWlubGluZS1hYXJjaDY0LWFzLWZvci1zZXRjb250ZXh0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZC8wMDA0LVJld29yay1p
bmxpbmUtYWFyY2g2NC1hcy1mb3Itc2V0Y29udGV4dC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDA1YTA3NzAyOC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ1bndpbmQvbGlidW53aW5kLzAwMDQtUmV3b3JrLWlubGluZS1hYXJjaDY0LWFzLWZv
ci1zZXRjb250ZXh0LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTYzICswLDAgQEAKLUZyb20g
YTgzMjA3MGYzNjY1ZDI5YThhMDY2NTJjMTVmOTRkMTQ0YzI0YWM2OSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IFN0ZXBoZW4gV2ViYiA8c3dlYmJAYmxhY2tiZXJyeS5jb20+Ci1EYXRl
OiBNb24sIDIyIEFwciAyMDI0IDE1OjU2OjU0IC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0ggNC81XSBS
ZXdvcmsgaW5saW5lIGFhcmNoNjQgYXMgZm9yIHNldGNvbnRleHQKLQotTW9kZXJuIEdDIGFuZCBj
bGFuZyB3ZXJlIGJhcmZpbmcgb24gdGhlIGlubGluZSBhc20gY29uc3RyYWludHMgZm9yIHRoZQot
YWFyY2g2NC1saW51eCBzZXRjb250ZXh0KCkgcmVwbGFjZW1lbnQuIFJlZm9ybXVsYXRlZCB0aGUg
YXNtIGNvZGUgdG8KLXJlZHVjZSB0aGUgcmVxdWlyZWQgY29uc3RyYWludHMuCi0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgotLS0tCi0gc3JjL2FhcmNoNjQvR29zLWxpbnV4LmMgfCAxMTUgKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNl
cnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9hYXJjaDY0L0dv
cy1saW51eC5jIGIvc3JjL2FhcmNoNjQvR29zLWxpbnV4LmMKLWluZGV4IDdjZDhjODc5Li4xZTQ5
NDk2MiAxMDA2NDQKLS0tLSBhL3NyYy9hYXJjaDY0L0dvcy1saW51eC5jCi0rKysgYi9zcmMvYWFy
Y2g2NC9Hb3MtbGludXguYwotQEAgLTIsNiArMiw3IEBACi0gICAgQ29weXJpZ2h0IChDKSAyMDA4
IENvZGVTb3VyY2VyeQotICAgIENvcHlyaWdodCAoQykgMjAxMS0yMDEzIExpbmFybyBMaW1pdGVk
Ci0gICAgQ29weXJpZ2h0IChDKSAyMDEyIFRvbW1pIFJhbnRhbGEgPHR0LnJhbnRhbGFAZ21haWwu
Y29tPgotKyAgIENvcHlyaWdodCAyMDI0IFN0ZXBoZW4gTS4gV2ViYiAgPHN3ZWJiQGJsYWNrYmVy
cnkuY29tPgotIAotIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIGxpYnVud2luZC4KLSAKLUBAIC0yOCw2
ICsyOSwyOCBAQCBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdT
IElOIFRIRSBTT0ZUV0FSRS4gICovCi0gCi0gI2lmbmRlZiBVTldfUkVNT1RFX09OTFkKLSAKLSsv
KiBNYWdpYyBjb25zdGFudHMgZ2VuZXJhdGVkIGZyb20gZ2VuLW9mZnNldHMuYyAqLwotKyNkZWZp
bmUgU0NfUjBfT0ZGICAgIjgiCi0rI2RlZmluZSBTQ19SMl9PRkYgICAiMjQiCi0rI2RlZmluZSBT
Q19SMThfT0ZGICAiMTUyIgotKyNkZWZpbmUgU0NfUjIwX09GRiAgIjE2OCIKLSsjZGVmaW5lIFND
X1IyMl9PRkYgICIxODQiCi0rI2RlZmluZSBTQ19SMjRfT0ZGICAiMjAwIgotKyNkZWZpbmUgU0Nf
UjI2X09GRiAgIjIxNiIKLSsjZGVmaW5lIFNDX1IyOF9PRkYgICIyMzIiCi0rI2RlZmluZSBTQ19S
MzBfT0ZGICAiMjQ4IgotKwotKyNkZWZpbmUgRlBfUjA4X09GRiAiODAiCi0rI2RlZmluZSBGUF9S
MDlfT0ZGICI4OCIKLSsjZGVmaW5lIEZQX1IxMF9PRkYgIjk2IgotKyNkZWZpbmUgRlBfUjExX09G
RiAiMTA0IgotKyNkZWZpbmUgRlBfUjEyX09GRiAiMTEyIgotKyNkZWZpbmUgRlBfUjEzX09GRiAi
MTIwIgotKyNkZWZpbmUgRlBfUjE0X09GRiAiMTI4IgotKyNkZWZpbmUgRlBfUjE1X09GRiAiMTM2
IgotKwotKyNkZWZpbmUgU0NfU1BfT0ZGICAgIjB4MTAwIgotKwotIEhJRERFTiBpbnQKLSBhYXJj
aDY0X2xvY2FsX3Jlc3VtZSAodW53X2FkZHJfc3BhY2VfdCBhcywgdW53X2N1cnNvcl90ICpjdXJz
b3IsIHZvaWQgKmFyZykKLSB7Ci1AQCAtMzYsNjUgKzU5LDQ5IEBAIGFhcmNoNjRfbG9jYWxfcmVz
dW1lICh1bndfYWRkcl9zcGFjZV90IGFzLCB1bndfY3Vyc29yX3QgKmN1cnNvciwgdm9pZCAqYXJn
KQotIAotICAgaWYgKGMtPnNpZ2NvbnRleHRfZm9ybWF0ID09IEFBUkNINjRfU0NGX05PTkUpCi0g
ICAgIHsKLSsKLSsgICAgICAvKgotKyAgICAgICAqIFRoaXMgaXMgZWZmZWN0aXZlbHkgdGhlIG9s
ZCBQT1NJWCBzZXRjb250ZXh0KCkuCi0rICAgICAgICoKLSsgICAgICAgKiBUaGlzIGlubGluZSBh
c20gaXMgYnJva2VuIHVwIHRvIHVzZSBsb2NhbCBzY3JhdGNoIHJlZ2lzdGVycyBmb3IgdGhlCi0r
ICAgICAgICogdWNfbWNvbnRleHQucmVncyBhbmQgRlBDVFggYmFzZSBhZGRyZXNzZXMgYmVjYXVz
ZSBuZXdlciB2ZXJzaW9ucyBvZiBHQ0MKLSsgICAgICAgKiBhbmQgY2xhbmcgYmFyZiBvbiB0b28g
bWFueSBjb25zdHJhaW50cyAoZ2gtNzAyKSB3aGVuIHRoZSBDIGFycmF5Ci0rICAgICAgICogZWxl
bWVudHMgYXJlIHVzZWQgZGlyZWN0bHkuCi0rICAgICAgICoKLSsgICAgICAgKiBDbG9iYmVycyBh
cmVuJ3QgcmVxdWlyZWQgZm9yIHRoZSBpbmxpbmUgYXNtIGJlY2F1c2UgdGhleSBqdXN0IGNvbnZp
bmNlCi0rICAgICAgICogdGhlIGNvbXBpbGVyIHRvIHNhdmUgdGhvc2UgcmVnaXN0ZXJzIGFuZCB0
aGV5IG5ldmVyIGdldCByZXN0b3JlZAotKyAgICAgICAqIGJlY2F1aXNlIHRoZSBhc20gZW5kcyB3
aXRoIGEgcGxhaW4gb2wnIHJldC4KLSsgICAgICAgKi8KLSsgICAgICByZWdpc3RlciB2b2lkKiB1
Y19tY29udGV4dCBfX2FzbV9fICgieDUiKSA9ICh2b2lkKikgJnVjLT51Y19tY29udGV4dDsKLSsg
ICAgICByZWdpc3RlciB2b2lkKiBmcGN0eCBfX2FzbV9fICgieDQiKSA9ICh2b2lkKikgR0VUX0ZQ
Q1RYKHVjKTsKLSsKLSAgICAgICAvKiBTaW5jZSB0aGVyZSBhcmUgbm8gc2lnbmFscyBpbnZvbHZl
ZCBoZXJlIHdlIHJlc3RvcmUgRUggYW5kIG5vbiBzY3JhdGNoCi0gICAgICAgICAgcmVnaXN0ZXJz
IG9ubHkuICAqLwotICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKLS0gICAgICAgICJsZHIg
eDAsICAlW3gwXVxuXHQiCi0tICAgICAgICAibGRyIHgxLCAgJVt4MV1cblx0IgotLSAgICAgICAg
ImxkciB4MiwgICVbeDJdXG5cdCIKLS0gICAgICAgICJsZHIgeDMsICAlW3gzXVxuXHQiCi0tICAg
ICAgICAibGRyIHgxOSwgJVt4MTldXG5cdCIKLS0gICAgICAgICJsZHIgeDIwLCAlW3gyMF1cblx0
IgotLSAgICAgICAgImxkciB4MjEsICVbeDIxXVxuXHQiCi0tICAgICAgICAibGRyIHgyMiwgJVt4
MjJdXG5cdCIKLS0gICAgICAgICJsZHIgeDIzLCAlW3gyM11cblx0IgotLSAgICAgICAgImxkciB4
MjQsICVbeDI0XVxuXHQiCi0tICAgICAgICAibGRyIHgyNSwgJVt4MjVdXG5cdCIKLS0gICAgICAg
ICJsZHIgeDI2LCAlW3gyNl1cblx0IgotLSAgICAgICAgImxkciB4MjcsICVbeDI3XVxuXHQiCi0t
ICAgICAgICAibGRyIHgyOCwgJVt4MjhdXG5cdCIKLS0gICAgICAgICJsZHIgeDI5LCAlW3gyOV1c
blx0IgotLSAgICAgICAgImxkciB4MzAsICVbeDMwXVxuXHQiCi0tICAgICAgICAibGRyIGQ4LCAg
JVtkOF1cblx0IgotLSAgICAgICAgImxkciBkOSwgICVbZDldXG5cdCIKLS0gICAgICAgICJsZHIg
ZDEwLCAlW2QxMF1cblx0IgotLSAgICAgICAgImxkciBkMTEsICVbZDExXVxuXHQiCi0tICAgICAg
ICAibGRyIGQxMiwgJVtkMTJdXG5cdCIKLS0gICAgICAgICJsZHIgZDEzLCAlW2QxM11cblx0Igot
LSAgICAgICAgImxkciBkMTQsICVbZDE0XVxuXHQiCi0tICAgICAgICAibGRyIGQxNSwgJVtkMTVd
XG5cdCIKLS0gICAgICAgICJsZHIgeDUsICAlW3NwXVxuXHQiCi0rICAgICAgICAibGRwIHgwLCAg
eDEsICBbeDUsICIgU0NfUjBfT0ZGICAiXVxuXHQiCi0rICAgICAgICAibGRwIHgyLCAgeDMsICBb
eDUsICIgU0NfUjJfT0ZGICAiXVxuXHQiCi0rICAgICAgICAibGRwIHgxOCwgeDE5LCBbeDUsICIg
U0NfUjE4X09GRiAiXVxuXHQiCi0rICAgICAgICAibGRwIHgyMCwgeDIxLCBbeDUsICIgU0NfUjIw
X09GRiAiXVxuXHQiCi0rICAgICAgICAibGRwIHgyMiwgeDIzLCBbeDUsICIgU0NfUjIyX09GRiAi
XVxuXHQiCi0rICAgICAgICAibGRwIHgyNCwgeDI1LCBbeDUsICIgU0NfUjI0X09GRiAiXVxuXHQi
Ci0rICAgICAgICAibGRwIHgyNiwgeDI3LCBbeDUsICIgU0NfUjI2X09GRiAiXVxuXHQiCi0rICAg
ICAgICAibGRwIHgyOCwgeDI5LCBbeDUsICIgU0NfUjI4X09GRiAiXVxuXHQiCi0rICAgICAgICAi
bGRyIHgzMCwgW3g1LCAiIFNDX1IzMF9PRkYgIl1cblx0IgotKyAgICAgICAgImxkciBkOCwgIFt4
NCwgIiBGUF9SMDhfT0ZGICJdXG5cdCIKLSsgICAgICAgICJsZHIgZDksICBbeDQsICIgRlBfUjA5
X09GRiAiXVxuXHQiCi0rICAgICAgICAibGRyIGQxMCwgW3g0LCAiIEZQX1IxMF9PRkYgIl1cblx0
IgotKyAgICAgICAgImxkciBkMTEsIFt4NCwgIiBGUF9SMTFfT0ZGICJdXG5cdCIKLSsgICAgICAg
ICJsZHIgZDEyLCBbeDQsICIgRlBfUjEyX09GRiAiXVxuXHQiCi0rICAgICAgICAibGRyIGQxMywg
W3g0LCAiIEZQX1IxM19PRkYgIl1cblx0IgotKyAgICAgICAgImxkciBkMTQsIFt4NCwgIiBGUF9S
MTRfT0ZGICJdXG5cdCIKLSsgICAgICAgICJsZHIgZDE1LCBbeDQsICIgRlBfUjE1X09GRiAiXVxu
XHQiCi0rICAgICAgICAibGRyIHg1LCAgW3g1LCAiIFNDX1NQX09GRiAiXVxuXHQiCi0gICAgICAg
ICAibW92IHNwLCB4NVxuXHQiCi0gICAgICAgICAicmV0XG4iCi0tICAgICAgICA6Ci0tICAgICAg
ICA6IFt4MF0gICJtIih1Yy0+dWNfbWNvbnRleHQucmVnc1swXSksCi0tCQkgIFt4MV0gICJtIih1
Yy0+dWNfbWNvbnRleHQucmVnc1sxXSksCi0tCQkgIFt4Ml0gICJtIih1Yy0+dWNfbWNvbnRleHQu
cmVnc1syXSksCi0tCQkgIFt4M10gICJtIih1Yy0+dWNfbWNvbnRleHQucmVnc1szXSksCi0tCQkg
IFt4MTldICJtIih1Yy0+dWNfbWNvbnRleHQucmVnc1sxOV0pLAotLQkJICBbeDIwXSAibSIodWMt
PnVjX21jb250ZXh0LnJlZ3NbMjBdKSwKLS0JCSAgW3gyMV0gIm0iKHVjLT51Y19tY29udGV4dC5y
ZWdzWzIxXSksCi0tCQkgIFt4MjJdICJtIih1Yy0+dWNfbWNvbnRleHQucmVnc1syMl0pLAotLQkJ
ICBbeDIzXSAibSIodWMtPnVjX21jb250ZXh0LnJlZ3NbMjNdKSwKLS0JCSAgW3gyNF0gIm0iKHVj
LT51Y19tY29udGV4dC5yZWdzWzI0XSksCi0tCQkgIFt4MjVdICJtIih1Yy0+dWNfbWNvbnRleHQu
cmVnc1syNV0pLAotLQkJICBbeDI2XSAibSIodWMtPnVjX21jb250ZXh0LnJlZ3NbMjZdKSwKLS0J
CSAgW3gyN10gIm0iKHVjLT51Y19tY29udGV4dC5yZWdzWzI3XSksCi0tCQkgIFt4MjhdICJtIih1
Yy0+dWNfbWNvbnRleHQucmVnc1syOF0pLAotLQkJICBbeDI5XSAibSIodWMtPnVjX21jb250ZXh0
LnJlZ3NbMjldKSwgLyogRlAgKi8KLS0JCSAgW3gzMF0gIm0iKHVjLT51Y19tY29udGV4dC5yZWdz
WzMwXSksIC8qIExSICovCi0tCQkgIFtkOF0gICJtIihHRVRfRlBDVFgodWMpLT52cmVnc1s4XSks
Ci0tCQkgIFtkOV0gICJtIihHRVRfRlBDVFgodWMpLT52cmVnc1s5XSksCi0tCQkgIFtkMTBdICJt
IihHRVRfRlBDVFgodWMpLT52cmVnc1sxMF0pLAotLQkJICBbZDExXSAibSIoR0VUX0ZQQ1RYKHVj
KS0+dnJlZ3NbMTFdKSwKLS0JCSAgW2QxMl0gIm0iKEdFVF9GUENUWCh1YyktPnZyZWdzWzEyXSks
Ci0tCQkgIFtkMTNdICJtIihHRVRfRlBDVFgodWMpLT52cmVnc1sxM10pLAotLQkJICBbZDE0XSAi
bSIoR0VUX0ZQQ1RYKHVjKS0+dnJlZ3NbMTRdKSwKLS0JCSAgW2QxNV0gIm0iKEdFVF9GUENUWCh1
YyktPnZyZWdzWzE1XSksCi0tICAgICAgICAgIFtzcF0gICJtIih1Yy0+dWNfbWNvbnRleHQuc3Ap
Ci0tCQk6ICJ4MCIsICAgIngxIiwgICJ4MiIsICAieDMiLCAieDE5IiwgIngyMCIsICJ4MjEiLCAi
eDIyIiwgIngyMyIsICJ4MjQiLAotLQkJICAieDI1IiwgIngyNiIsICJ4MjciLCAieDI4IiwgIngy
OSIsICJ4MzAiCi0tCSAgKTsKLSsgICAgICAgIDogCi0rICAgICAgICA6IFt1Y19tY29udGV4dF0g
InIiKHVjX21jb250ZXh0KSwKLSsgICAgICAgICAgW2ZwY3R4XSAiciIoZnBjdHgpCi0rICAgICAg
KTsKLSAgICAgfQotICAgZWxzZQotICAgICB7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kLzAwMDUtSGFuZGxlLW11c2wt
b24tUFBDMzIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5k
LzAwMDUtSGFuZGxlLW11c2wtb24tUFBDMzIucGF0Y2gKaW5kZXggNjNkM2M4NWRlNC4uNTNjNmVk
NmI0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2lu
ZC8wMDA1LUhhbmRsZS1tdXNsLW9uLVBQQzMyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYnVud2luZC9saWJ1bndpbmQvMDAwNS1IYW5kbGUtbXVzbC1vbi1QUEMzMi5wYXRjaApA
QCAtMSw3ICsxLDcgQEAKLUZyb20gN2JkNGZiZGVhNDMzMTBlNTJmZWI1N2ZiNWFmYWI2YmVjNzk4
Y2M5OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDc1MTU2ZjZkZTgxODYwZmJlZmE1
MmNlNzg0ZjRkNDFmMWIwMTU1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogV2VkLCAxNyBKYW4gMjAyNCAxNjoy
ODozOSArMDAwMAotU3ViamVjdDogW1BBVENIIDUvNV0gSGFuZGxlIG11c2wgb24gUFBDMzIKK1N1
YmplY3Q6IFtQQVRDSF0gSGFuZGxlIG11c2wgb24gUFBDMzIKIAogT24gTGludXgsIGdsaWJjIGFu
ZCBtdXNsIGRpc2FncmVlIG92ZXIgdGhlIGxheW91dCBvZiB0aGUgdWNvbnRleHRfdAogc3RydWN0
dXJlLiAgRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBtdXNsIG1haWxpbmcgbGlzdDoKQEAgLTIx
LDcgKzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5j
b20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvc3JjL3BwYzMyL0dpbml0LmMgYi9zcmMvcHBjMzIvR2luaXQuYwotaW5k
ZXggOTQ0NGNiYjguLjVlOTRlZDhhIDEwMDY0NAoraW5kZXggOTQ0NGNiYi4uODgwMTRjZiAxMDA2
NDQKIC0tLSBhL3NyYy9wcGMzMi9HaW5pdC5jCiArKysgYi9zcmMvcHBjMzIvR2luaXQuYwogQEAg
LTQyLDYgKzQyLDEzIEBAIHN0YXRpYyBzdHJ1Y3QgdW53X2FkZHJfc3BhY2UgbG9jYWxfYWRkcl9z
cGFjZTsKQEAgLTY2LDcgKzY2LDcgQEAgaW5kZXggOTQ0NGNiYjguLjVlOTRlZDhhIDEwMDY0NAog
ICAgICAgIGFkZHIgPSAmdWMtPnVjX21jb250ZXh0Lm1jX2dwcltncmVnc19pZHhdOwogICNlbmRp
ZgogZGlmZiAtLWdpdCBhL3NyYy9wcGMzMi91Y29udGV4dF9pLmggYi9zcmMvcHBjMzIvdWNvbnRl
eHRfaS5oCi1pbmRleCBlZTkzYzY5Ny4uY2ZkOGZlMGUgMTAwNjQ0CitpbmRleCBlZTkzYzY5Li5j
ZmQ4ZmUwIDEwMDY0NAogLS0tIGEvc3JjL3BwYzMyL3Vjb250ZXh0X2kuaAogKysrIGIvc3JjL3Bw
YzMyL3Vjb250ZXh0X2kuaAogQEAgLTQ0LDggKzQ0LDEzIEBAIFdJVEggVEhFIFNPRlRXQVJFIE9S
IFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLiAgKi8KQEAgLTgzLDYg
KzgzLDMgQEAgaW5kZXggZWU5M2M2OTcuLmNmZDhmZTBlIDEwMDY0NAogIAogIC8qIFRoZXNlIGFy
ZSBkdW1teSBzdHJ1Y3R1cmVzIHVzZWQgb25seSBmb3Igb2J0YWluaW5nIHRoZSBvZmZzZXRzIG9m
IHRoZQogICAgIHZhcmlvdXMgc3RydWN0dXJlIG1lbWJlcnMuICovCi0tLSAKLTIuMzQuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kL2xpYmF0
b21pYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQvbGli
YXRvbWljLnBhdGNoCmluZGV4IGYzOWU5MmYyZWUuLmQ0Y2ViMDU4NTkgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQvbGliYXRvbWljLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmQvbGliYXRvbWljLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNmEwZDhjZTA3Yzc2MWU1MWI5ZGM3YzVkMTZhOWIw
NmMzZTkzNTYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5Njk5ZjM5NTU2ZTlmYjRk
ODA3Nzg5MGVhMzY5NjQ4OWU5Yjg0MGM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
U3RlcGhlbiBXZWJiIDxzd2ViYkBibGFja2JlcnJ5LmNvbT4KIERhdGU6IE1vbiwgMTggTWFyIDIw
MjQgMTA6MjI6MjYgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlLmFjOiBkZXRlY3Qg
aWYgLWxhdG9taWMgaXMgcmVxdWlyZWQKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFj
Ci1pbmRleCA3NThhMjdkMTkuLmQwZWY1ZjNkOSAxMDA2NDQKK2luZGV4IGVhYTBkZGMuLmQ1ZjFk
NGEgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTk0
LDYgKzk0LDE4IEBAIGRubCBDaGVja3MgZm9yIGxpYnJhcnkgZnVuY3Rpb25zLgorQEAgLTkzLDYg
KzkzLDE4IEBAIGRubCBDaGVja3MgZm9yIGxpYnJhcnkgZnVuY3Rpb25zLgogIEFDX0NIRUNLX0ZV
TkNTKGRsX2l0ZXJhdGVfcGhkciBkbF9waGRyX3JlbW92YWxzX2NvdW50ZXIgZGxtb2RpbmZvIGdl
dHVud2luZCBcCiAgCQl0dHJhY2UgbWluY29yZSBwaXBlMiBzaWdhbHRzdGFjayBleGVjdnBlKQog
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZC9t
YWxsb2MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kL21h
bGxvYy5wYXRjaAppbmRleCAwMjZhNTZmMTU1Li44ZDQzMzY0ZDUxIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kL21hbGxvYy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kL21hbGxvYy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYjY3ZDUwOGE5M2JmMWJhMjMxYzE4ZGNlMzg5NGNmZWUyNWMxNmUw
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWE1YWE3MTVmMmRlNGRlYjM0MjExMDFi
MjYxMzFjNDNjZmI0YjhmYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN0ZXBoZW4g
V2ViYiA8c3dlYmJAYmxhY2tiZXJyeS5jb20+CiBEYXRlOiBXZWQsIDEyIEZlYiAyMDI1IDEyOjA4
OjA3IC0wNTAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBiYWQgcHJvdG90eXBlIGZvciBtYWxsb2Mo
KSBpbiB0ZXN0CkBAIC0yMyw3ICsyMyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxy
b3NzLmJ1cnRvbkBhcm0uY29tPgogIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy91bndfdGVzdC5o
CiAKIGRpZmYgLS1naXQgYS90ZXN0cy9HdGVzdC1ub21hbGxvYy5jIGIvdGVzdHMvR3Rlc3Qtbm9t
YWxsb2MuYwotaW5kZXggNWI5N2ZjNzA5Li5lNzcwZmY2MTQgMTAwNjQ0CitpbmRleCA1Yjk3ZmM3
Li5lNzcwZmY2IDEwMDY0NAogLS0tIGEvdGVzdHMvR3Rlc3Qtbm9tYWxsb2MuYwogKysrIGIvdGVz
dHMvR3Rlc3Qtbm9tYWxsb2MuYwogQEAgLTEsNzggKzEsOTIgQEAKQEAgLTE4OCwxMCArMTg4LDEw
IEBAIGluZGV4IDViOTdmYzcwOS4uZTc3MGZmNjE0IDEwMDY0NAogKyAgZXhpdCAoVU5XX1RFU1Rf
RVhJVF9QQVNTKTsKICB9CiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0gYi90ZXN0cy9N
YWtlZmlsZS5hbQotaW5kZXggYWRjMzRhYzYzLi42MGYzZjNhZGMgMTAwNjQ0CitpbmRleCBlMmIw
N2JjLi44NDQxMDVhIDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3Rz
L01ha2VmaWxlLmFtCi1AQCAtMjE0LDcgKzIxNCw3IEBAIGVuZGlmCitAQCAtMjAwLDcgKzIwMCw3
IEBAIGVuZGlmCiAgCiAgbm9pbnN0X1BST0dSQU1TID0gJChub2luc3RfUFJPR1JBTVNfY29tbW9u
KSAkKG5vaW5zdF9QUk9HUkFNU19jZGVwKSBcCiAgCSQobm9pbnN0X1BST0dSQU1TX2FyY2gpCkBA
IC0yMDIsNyArMjAyLDcgQEAgaW5kZXggYWRjMzRhYzYzLi42MGYzZjNhZGMgMTAwNjQ0CiAgICAg
ICAgICAgICAgICAgICAgICAtZSAncyxbQF1YRkFJTF9URVNUU1tAXSwkKFhGQUlMX1RFU1RTKSxn
JyBcCiBkaWZmIC0tZ2l0IGEvdGVzdHMvdW53X3Rlc3QuaCBiL3Rlc3RzL3Vud190ZXN0LmgKIG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Ci1pbmRleCAwMDAwMDAwMDAuLjlhZTg2ZGNlMQoraW5kZXggMDAw
MDAwMC4uOWFlODZkYwogLS0tIC9kZXYvbnVsbAogKysrIGIvdGVzdHMvdW53X3Rlc3QuaAogQEAg
LTAsMCArMSw0NyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5k
L2xpYnVud2luZC9taXBzLWJ5dGUtb3JkZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJ1bndpbmQvbGlidW53aW5kL21pcHMtYnl0ZS1vcmRlci5wYXRjaAppbmRleCAzMzM2Yjc5MDU1
Li5jZDllMTA2NDk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQv
bGlidW53aW5kL21pcHMtYnl0ZS1vcmRlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJ1bndpbmQvbGlidW53aW5kL21pcHMtYnl0ZS1vcmRlci5wYXRjaApAQCAtMSw3ICsxLDcg
QEAKLUZyb20gZGJiZjgxMTBlZDNmZDJjYmFjMjBhOGVjMmFjNzY5ZTEzYzY3YmFiMSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmQzNDcyODMzOTNhMDEwZjg3MDY0YjgwYTg5OTIzNmM2
MWU5MmMwZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogVHVlLCAxNiBKYW4gMjAyNCAxODoyMjozOCArMDAwMAot
U3ViamVjdDogW1BBVENIIDIvMl0gYnl0ZSBvcmRlcgorU3ViamVjdDogW1BBVENIXSBieXRlIG9y
ZGVyCiAKIGVuZGlhbi5oIG9uIG11c2wvbWlwcyBjYW4ndCBiZSBpbmNsdWRlZCBpbiBfX0FTU0VN
QkxFUl9fIG1vZGUsCiBzbyB1c2UgdGhlIF9fQllURV9PUkRFUl9fIHN5bWJvbCBpbnN0ZWFkLgpA
QCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25A
YXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9zcmMvbWlwcy9nZXRjb250ZXh0LlMgYi9zcmMvbWlwcy9nZXRjb250
ZXh0LlMKLWluZGV4IGQxZGJkNTc5Li5kZTliNjgxOCAxMDA2NDQKK2luZGV4IGQxZGJkNTcuLmRl
OWI2ODEgMTAwNjQ0CiAtLS0gYS9zcmMvbWlwcy9nZXRjb250ZXh0LlMKICsrKyBiL3NyYy9taXBz
L2dldGNvbnRleHQuUwogQEAgLTI0LDEyICsyNCwxMSBAQCBPRiBDT05UUkFDVCwgVE9SVCBPUiBP
VEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04KQEAgLTMwLDYg
KzMwLDMgQEAgaW5kZXggZDFkYmQ1NzkuLmRlOWI2ODE4IDEwMDY0NAogICMgIGRlZmluZSBPRkZT
RVQgNAogICMgZWxzZQogICMgIGRlZmluZSBPRkZTRVQgMAotLS0gCi0yLjM0LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5kL2xpYnVud2luZF8xLjguMS5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmRfMS44LjIuYmIKc2ltaWxh
cml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53aW5k
L2xpYnVud2luZF8xLjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidW53
aW5kL2xpYnVud2luZF8xLjguMi5iYgppbmRleCAxMDcxNGVhMjQ3Li42ZjcxNjhiNWRmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1bndpbmQvbGlidW53aW5kXzEuOC4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVud2luZC9saWJ1bndpbmRfMS44LjIuYmIK
QEAgLTEwLDE0ICsxMCwxMiBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9h
ZC92JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL21pcHMtYnl0ZS1vcmRl
ci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLUdhcm02NC10ZXN0LXN2ZS1z
aWduYWwtY2hlY2stdGhhdC1TVkUtaXMtcHJlc2UucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMi1jb3JlZHVtcC11c2UtZ2xpYmMtb3ItbXVzbC1yZWdpc3Rlci1uYW1lcy1hcy1hcHByb3By
LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDMtRml4ZWQtbWlzY29tcGlsYXRpb24tb2Yt
dW53X2dldGNvbnRleHQtb24tQVJNLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDQtUmV3
b3JrLWlubGluZS1hYXJjaDY0LWFzLWZvci1zZXRjb250ZXh0LnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDUtSGFuZGxlLW11c2wtb24tUFBDMzIucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vbGliYXRvbWljLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL21hbGxvYy5wYXRjaCBcCiAg
ICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRkZjBlMzJkZDVmYWZlNTI4MzE5
OGQzN2U0YmY5ZGVjZjdiYTE3NzBiNmU3ZTAwNmMzM2U2ZGY3OWU2YTYxNTciCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiN2YyNjJmMWExMjI0ZjQzN2VkZTBmOTZhNjkzMmI1ODJjOGY1NDIxZmYyMDdj
MDRlM2Q5NTA0ZGZhMDRjOGI4MiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgbXVsdGlsaWJfaGVhZGVy
IGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============8871010592658879825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libunwind/libunwind: FILELIST: removed "/usr/lib/libunwind.so.8.1.0 /usr/lib/libunwind-x86_64.so.8.1.0", added "/usr/lib/libunwind.so.8.2.0 /usr/lib/libunwind-x86_64.so.8.2.0"
Changes to packages/core2-64-poky-linux/libunwind (sysroot):
  /usr/lib/libunwind.so.8 changed symlink target from libunwind.so.8.1.0 to libunwind.so.8.2.0
  /usr/lib/libunwind.so changed symlink target from libunwind.so.8.1.0 to libunwind.so.8.2.0
  /usr/lib/libunwind-x86_64.so.8 changed symlink target from libunwind-x86_64.so.8.1.0 to libunwind-x86_64.so.8.2.0
  /usr/lib/libunwind-x86_64.so changed symlink target from libunwind-x86_64.so.8.1.0 to libunwind-x86_64.so.8.2.0
  /usr/lib/libunwind.so.8.1.0 moved to /usr/lib/libunwind.so.8.2.0
  /usr/lib/libunwind-x86_64.so.8.1.0 moved to /usr/lib/libunwind-x86_64.so.8.2.0

--===============8871010592658879825==--

