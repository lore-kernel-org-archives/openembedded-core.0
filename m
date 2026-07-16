Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D39C43458
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 05:23:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6150.1784179428902084743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 22:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dc4b5Zz/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EBygprxX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f69618982-6c843ca3-755b-4e4f-b6da-a3a94b7ef755-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784179428;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=E9bqfcIbUWdllkFyaJJgEGpK87aOQ7+hkfJvI2RbpXU=;
	b=Dc4b5Zz/Cjqid1Id6zkNiNZ22e6CqZw1wK5apkYivpBWBoo98USVw3iw4+m/TRSb
	+UUB0EtSTdhHrOMjVm6g3UXPNb9AZthGKz7IFssk0n81PwaxNJsI5IyRd9saoDm+Gsu
	Smpr6NP0/duNHZZgOU84U2aEUq0DPew/4mFN30yI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784179428;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=E9bqfcIbUWdllkFyaJJgEGpK87aOQ7+hkfJvI2RbpXU=;
	b=EBygprxXXjg4IizEMnsDdNBE2AYOzX+jrZdv6QGfMYEzF9gr7f6nYRHdEj6pLgqc
	HJH9rAiV0H1WGkc/qikZJlYZ8LgOS3FZSWdOw0tpsQ+oPLBJprFK/exD0TCeTik7/QL
	kAG1pEzV9ZnXfPCeOFWAG3pluheC75zpD9enY9SQ=
Content-Type: multipart/mixed; boundary="===============0656170237197387778=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa,mesa-tools-native: upgrading to 26.1.5,26.1.5 SUCCEEDED
Message-ID: <0101019f69618982-6c843ca3-755b-4e4f-b6da-a3a94b7ef755-000000@us-west-2.amazonses.com>
Date: Thu, 16 Jul 2026 05:23:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 05:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241049

--===============0656170237197387778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa,mesa-tools-native* to *26.1.5,26.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-mesa-tools-native-upgrade-26.1.4-26.1.5-26.1.4-.patch
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
From 6e81373815f16652e8c8a7c6ce6c9e721f55e99e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 16 Jul 2026 05:15:25 +0000
Subject: [PATCH] mesa,mesa-tools-native: upgrade 26.1.4 -> 26.1.5,26.1.4 ->
 26.1.5

---
 ...-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../0001-gallivm-Fix-armhf-build-against-LLVM-22.patch    | 4 ++--
 ...001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 ...intel-compiler-jay-fix-GCC-10-case-label-declara.patch | 5 +----
 ...intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 5 +----
 ...util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 8 ++++----
 meta/recipes-graphics/mesa/mesa.inc                       | 4 ++--
 7 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f..3e00556b71 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From ddb43c52638b96c17392d08508609525b7db9a06 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index a4bfd33..330b646 100644
+index e8f01b8..8144a75 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
index 065dd373a7..7e5a827661 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From 41306cf1df603613e98baf2cbab2fc27dad95ea7 Mon Sep 17 00:00:00 2001
 From: Alessandro Astone <ales.astone@gmail.com>
 Date: Sun, 1 Mar 2026 18:14:09 +0100
 Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
@@ -13,7 +13,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index d3ad342..c95d86e 100644
+index ce8ca02..86779f0 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 @@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index b039ac213e..82293dbf6e 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From c21d65f05381c7a836d93494acdb7e5ffb28aefe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
index b8b8718979..3340b7e103 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
@@ -1,4 +1,4 @@
-From 0b4b577b7fc926d374234c80267a4bf9dcccb7ef Mon Sep 17 00:00:00 2001
+From 03df406963de6ebc40809dc22415c1715a08a905 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Tue, 16 Jun 2026 09:12:34 +0000
 Subject: [PATCH] src/intel/compiler/jay: fix GCC 10 case label declaration
@@ -37,6 +37,3 @@ index 62b9576..a0a9498 100644
  
     case JAY_OPCODE_DESWIZZLE_EVEN:
        brw_set_default_exec_size(p, BRW_EXECUTE_16);
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 904b20d440..bc8b3e99e9 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 3adae0d97f655c2991d5b428a3bc95a972e6228b Mon Sep 17 00:00:00 2001
+From 7735c1b9b97809ab97c38cd6bed26f3af1c28d5b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
@@ -34,6 +34,3 @@ index 8307044..abf175a 100644
     enum jay_conditional_mod conditional_mod;
  
     jay_def cond_flag; /**< conditional flag */
--- 
-2.47.3
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index be79e29e42..2c381828fd 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 013717829278f02b0815d80a423e05e4bd567ae3 Mon Sep 17 00:00:00 2001
+From 589921de37e1658b0ca4984ec68d45ecb8c57659 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/util/u_math.c b/src/util/u_math.c
-index 337baa9..9ad03bf 100644
+index 722eac7..8bcfefa 100644
 --- a/src/util/u_math.c
 +++ b/src/util/u_math.c
-@@ -86,7 +86,7 @@ util_fpstate_get(void)
+@@ -90,7 +90,7 @@ util_fpstate_get(void)
     if (util_get_cpu_caps()->has_neon) {
  #ifdef HAVE___BUILTIN_ARM_GET_FPSCR
        fpstate = __builtin_arm_get_fpscr();
@@ -23,7 +23,7 @@ index 337baa9..9ad03bf 100644
        __asm__ volatile("vmrs %0, fpscr" : "=r"(fpstate));
  #endif
     }
-@@ -151,7 +151,7 @@ util_fpstate_set(unsigned fpstate)
+@@ -157,7 +157,7 @@ util_fpstate_set(unsigned fpstate)
     if (util_get_cpu_caps()->has_neon) {
  #ifdef HAVE___BUILTIN_ARM_SET_FPSCR
        __builtin_arm_set_fpscr(fpstate);
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bb071e2411..15d56c804d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
-PV = "26.1.4"
+SRC_URI[sha256sum] = "79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122"
+PV = "26.1.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============0656170237197387778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.1.4.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch" to "https://archive.mesa3d.org/mesa-26.1.5.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.1.4.so", added "/usr/lib/libgallium-26.1.5.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.1.4.so", added "/usr/lib/.debug/libgallium-26.1.5.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 754595128 to 754672384 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 216377 to 217034 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.1.4/src/nouveau/headers -> /usr/src/debug/mesa/26.1.5/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.1.4/src/virtio/vulkan -> /usr/src/debug/mesa/26.1.5/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.1.4/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.1.5/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.1.5/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.1.4/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.1.5/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.1.4/src/amd/compiler -> /usr/src/debug/mesa/26.1.5/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/perf -> /usr/src/debug/mesa/26.1.5/src/intel/perf, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/dev -> /usr/src/debug/mesa/26.1.5/src/intel/dev, directory renam
 ed /usr/src/debug/mesa/26.1.4/src/mesa -> /usr/src/debug/mesa/26.1.5/src/mesa, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/compiler/elk -> /usr/src/debug/mesa/26.1.5/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/genxml -> /usr/src/debug/mesa/26.1.5/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.1.4/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.1.5/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/blorp -> /usr/src/debug/mesa/26.1.5/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.1.4/src/compiler/nir -> /usr/src/debug/mesa/26.1.5/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/compiler/brw -> /usr/src/debug/mesa/26.1.5/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.1.4/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.1.5/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.1.4/src/compiler/glsl -> /usr/src/debug/m
 esa/26.1.5/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/compiler/jay -> /usr/src/debug/mesa/26.1.5/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/compiler -> /usr/src/debug/mesa/26.1.5/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/ds -> /usr/src/debug/mesa/26.1.5/src/intel/ds, directory renamed /usr/src/debug/mesa/26.1.4/src/mesa/program -> /usr/src/debug/mesa/26.1.5/src/mesa/program, directory renamed /usr/src/debug/mesa/26.1.4/src/vulkan/util -> /usr/src/debug/mesa/26.1.5/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.1.4/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.1.5/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.1.4/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.1.5/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.1.4/src/vulkan/runtime -> /usr/src/debug/mesa/26.1.5/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/2
 6.1.4/src/util/format -> /usr/src/debug/mesa/26.1.5/src/util/format, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/shaders -> /usr/src/debug/mesa/26.1.5/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.1.4/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.1.5/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.1.4/src/util -> /usr/src/debug/mesa/26.1.5/src/util, directory renamed /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary -> /usr/src/debug/mesa/26.1.5/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.1.4/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.1.5/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/vulkan -> /usr/src/debug/mesa/26.1.5/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.1.4/src/amd/vulkan -> /usr/src/debug/mesa/26.1.5/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.1.4/src/amd/common -> /usr/src/debug/mesa/26.1.5/src/amd/common, directory rename
 d /usr/src/debug/mesa/26.1.4/src/loader -> /usr/src/debug/mesa/26.1.5/src/loader, directory renamed /usr/src/debug/mesa/26.1.4/src/vulkan/wsi -> /usr/src/debug/mesa/26.1.5/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.1.4/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.1.5/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.1.4/src/compiler/spirv -> /usr/src/debug/mesa/26.1.5/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.1.4/src/intel/isl -> /usr/src/debug/mesa/26.1.5/src/intel/isl, directory renamed /usr/src/debug/mesa/26.1.4/src/compiler -> /usr/src/debug/mesa/26.1.5/src/compiler, directory renamed /usr/src/debug/mesa/26.1.4/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.1.5/src/gallium/drivers/zink
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 201970607 to 201972810 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 81585976 to 81602360 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.1.4" to "26.1.5"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.1.4 [default] to 26.1.5 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.1.4.so moved to /usr/lib/libgallium-26.1.5.so

--===============0656170237197387778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.1.4.so", added "/usr/lib/libgallium-26.1.5.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.1.4.so moved to /usr/lib/libgallium-26.1.5.so

--===============0656170237197387778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-mesa-tools-native-upgrade-26.1.4-26.1.5-26.1.4-.patch"

RnJvbSA2ZTgxMzczODE1ZjE2NjUyZThjOGE3YzZjZTZjOWU3MjFmNTVlOTllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTYgSnVsIDIwMjYgMDU6MTU6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLG1lc2EtdG9vbHMtbmF0aXZlOiB1cGdyYWRlIDI2LjEuNCAtPiAyNi4xLjUsMjYuMS40IC0+
CiAyNi4xLjUKCi0tLQogLi4uLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRv
LWJpbmFyaWVzLnBhdGNoIHwgNCArKy0tCiAuLi4vMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWls
ZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2ggICAgfCA0ICsrLS0KIC4uLjAwMS1tZXNvbi1taXNkZXRl
Y3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCB8IDIgKy0KIC4uLmludGVsLWNv
bXBpbGVyLWpheS1maXgtR0NDLTEwLWNhc2UtbGFiZWwtZGVjbGFyYS5wYXRjaCB8IDUgKy0tLS0K
IC4uLmludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRj
aCB8IDUgKy0tLS0KIC4uLnV0aWwtdV9tYXRoLmMtZG8tbm90LXVzZS1hcm0tZnB1LWluc3RydWN0
aW9ucy1pZi5wYXRjaCB8IDggKysrKy0tLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogNyBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQt
cGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5w
YXRjaAppbmRleCBlOTc2YjMzOTlmLi4zZTAwNTU2YjcxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQt
cGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJp
ZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRlZjc0ODcxMDlmOWFjZmEyYmFmMWEyMjI0
ZGEzMWEwYWUwYzc0YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRkYjQzYzUyNjM4
Yjk2YzE3MzkyZDA4NTA4NjA5NTI1YjdkYjlhMDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+
CiBEYXRlOiBXZWQsIDEwIERlYyAyMDI1IDAyOjI3OjE2ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGZyZWVkcmVubzogZG9uJ3QgZW5jb2RlIGJ1aWxkIHBhdGggaW50byBiaW5hcmllcwpAQCAtMjUs
NyArMjUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZCBiL3NyYy9mcmVl
ZHJlbm8vbWVzb24uYnVpbGQKLWluZGV4IGE0YmZkMzMuLjMzMGI2NDYgMTAwNjQ0CitpbmRleCBl
OGYwMWI4Li44MTQ0YTc1IDEwMDY0NAogLS0tIGEvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZAog
KysrIGIvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZAogQEAgLTQsOSArNCwxMCBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1h
cm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9maWxlcy8wMDAxLWdhbGxpdm0tRml4LWFybWhmLWJ1aWxkLWFnYWluc3QtTExWTS0yMi5w
YXRjaAppbmRleCAwNjVkZDM3M2E3Li43ZTVhODI3NjYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWdhbGxpdm0tRml4LWFybWhmLWJ1aWxkLWFnYWlu
c3QtTExWTS0yMi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8w
MDAxLWdhbGxpdm0tRml4LWFybWhmLWJ1aWxkLWFnYWluc3QtTExWTS0yMi5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMmE0MGM0ODFhZmZlZjRkZjcyOWQ3OTRkYWYzNzhlZDJlMDE4NDg5NSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDEzMDZjZjFkZjYwMzYxM2U5OGJhZjJjYmFi
MmZjMjdkYWQ5NWVhNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXNzYW5kcm8g
QXN0b25lIDxhbGVzLmFzdG9uZUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDEgTWFyIDIwMjYgMTg6
MTQ6MDkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2FsbGl2bTogRml4IGFybWhmIGJ1aWxkIGFn
YWluc3QgTExWTSAyMgpAQCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJl
c21hIDxqb3NlLnF1YXJlc21hQG9zcy5xdWFsY29tbS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2FsbGl1bS9h
dXhpbGlhcnkvZ2FsbGl2bS9scF9ibGRfbWlzYy5jcHAgYi9zcmMvZ2FsbGl1bS9hdXhpbGlhcnkv
Z2FsbGl2bS9scF9ibGRfbWlzYy5jcHAKLWluZGV4IGQzYWQzNDIuLmM5NWQ4NmUgMTAwNjQ0Citp
bmRleCBjZThjYTAyLi44Njc3OWYwIDEwMDY0NAogLS0tIGEvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5
L2dhbGxpdm0vbHBfYmxkX21pc2MuY3BwCiArKysgYi9zcmMvZ2FsbGl1bS9hdXhpbGlhcnkvZ2Fs
bGl2bS9scF9ibGRfbWlzYy5jcHAKIEBAIC0zMzEsNyArMzMxLDcgQEAgbHBfYnVpbGRfZmlsbF9t
YXR0cnMoc3RkOjp2ZWN0b3I8c3RkOjpzdHJpbmc+ICZNQXR0cnMpCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQt
YXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5w
YXRjaAppbmRleCBiMDM5YWMyMTNlLi44MjI5M2RiZjZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWlj
cy1vbi1taXBzLWNsYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg5NDNiMzhhMGMxNGIyMjBlM2UxNzNjMDM4Yzg3Y2U5
YTY5N2MxNzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMyMWQ2NWYwNTM4MWM3YTgz
NmQ5MzQ5NGFjZGI3ZTVmZmIyOGFlZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxMyBKYW4gMjAyMCAxNToy
Mzo0NyAtMDgwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbiBtaXNkZXRlY3RzIDY0Yml0IGF0b21p
Y3Mgb24gbWlwcy9jbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWZpeC1HQ0MtMTAtY2FzZS1sYWJlbC1k
ZWNsYXJhLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMt
aW50ZWwtY29tcGlsZXItamF5LWZpeC1HQ0MtMTAtY2FzZS1sYWJlbC1kZWNsYXJhLnBhdGNoCmlu
ZGV4IGI4Yjg3MTg5NzkuLjMzNDBiN2UxMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1maXgtR0NDLTEwLWNh
c2UtbGFiZWwtZGVjbGFyYS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktZml4LUdDQy0xMC1jYXNlLWxhYmVsLWRl
Y2xhcmEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBiNGI1NzdiN2ZjOTI2ZDM3NDIzNGM4
MDI2N2E0YmY5ZGNjY2I3ZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDAzZGY0MDY5
NjNkZTZlYmM0MDgwOWRjMjI0MTVjMTcxNWEwOGE5MDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPgogRGF0ZTogVHVlLCAxNiBK
dW4gMjAyNiAwOToxMjozNCArMDAwMAogU3ViamVjdDogW1BBVENIXSBzcmMvaW50ZWwvY29tcGls
ZXIvamF5OiBmaXggR0NDIDEwIGNhc2UgbGFiZWwgZGVjbGFyYXRpb24KQEAgLTM3LDYgKzM3LDMg
QEAgaW5kZXggNjJiOTU3Ni4uYTBhOTQ5OCAxMDA2NDQKICAKICAgICBjYXNlIEpBWV9PUENPREVf
REVTV0laWkxFX0VWRU46CiAgICAgICAgYnJ3X3NldF9kZWZhdWx0X2V4ZWNfc2l6ZShwLCBCUldf
RVhFQ1VURV8xNik7Ci0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8t
bm90LXVzZWQtdHlwZWQtZW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxl
cy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQt
ZW4ucGF0Y2gKaW5kZXggOTA0YjIwZDQ0MC4uYmM4YjNlOTllOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWph
eV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1u
b3QtdXNlZC10eXBlZC1lbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2FkYWUwZDk3ZjY1
NWMyOTkxZDViNDI4YTNiYzk1YTk3MmU2MjI4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNzczNWMxYjliOTc4MDlhYjk3YzM4Y2Q2YmVkMjZmM2FmMWMyOGQ1YiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+
CiBEYXRlOiBTdW4sIDE0IEp1biAyMDI2IDE3OjQyOjE5ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHNyYy9pbnRlbC9jb21waWxlci9qYXkvamF5X2lyLmg6IGRvIG5vdCB1c2VkIHR5cGVkIGVudW0K
QEAgLTM0LDYgKzM0LDMgQEAgaW5kZXggODMwNzA0NC4uYWJmMTc1YSAxMDA2NDQKICAgICBlbnVt
IGpheV9jb25kaXRpb25hbF9tb2QgY29uZGl0aW9uYWxfbW9kOwogIAogICAgIGpheV9kZWYgY29u
ZF9mbGFnOyAvKio8IGNvbmRpdGlvbmFsIGZsYWcgKi8KLS0tIAotMi40Ny4zCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLXV0aWwtdV9tYXRo
LmMtZG8tbm90LXVzZS1hcm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLXV0aWwtdV9tYXRoLmMtZG8tbm90LXVzZS1h
cm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaAppbmRleCBiZTc5ZTI5ZTQyLi4yYzM4MTgyOGZk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy11
dGlsLXVfbWF0aC5jLWRvLW5vdC11c2UtYXJtLWZwdS1pbnN0cnVjdGlvbnMtaWYucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtdXRpbC11X21hdGgu
Yy1kby1ub3QtdXNlLWFybS1mcHUtaW5zdHJ1Y3Rpb25zLWlmLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAwMTM3MTc4MjkyNzhmMDJiMDgxNWQ4MGE0MjNlMDVlNGJkNTY3YWUzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1ODk5MjFkZTM3ZTE2NThiMGNhNDk4NGVjNjhkNDVlY2I4
YzU3NjU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IFdlZCwgMSBKdWwgMjAyNiAyMjo0ODoxNSArMDIw
MAogU3ViamVjdDogW1BBVENIXSBzcmMvdXRpbC91X21hdGguYzogZG8gbm90IHVzZSBhcm0gZnB1
IGluc3RydWN0aW9ucyBpZiBmcHUgaXMKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvdXRp
bC91X21hdGguYyBiL3NyYy91dGlsL3VfbWF0aC5jCi1pbmRleCAzMzdiYWE5Li45YWQwM2JmIDEw
MDY0NAoraW5kZXggNzIyZWFjNy4uOGJjZmVmYSAxMDA2NDQKIC0tLSBhL3NyYy91dGlsL3VfbWF0
aC5jCiArKysgYi9zcmMvdXRpbC91X21hdGguYwotQEAgLTg2LDcgKzg2LDcgQEAgdXRpbF9mcHN0
YXRlX2dldCh2b2lkKQorQEAgLTkwLDcgKzkwLDcgQEAgdXRpbF9mcHN0YXRlX2dldCh2b2lkKQog
ICAgIGlmICh1dGlsX2dldF9jcHVfY2FwcygpLT5oYXNfbmVvbikgewogICNpZmRlZiBIQVZFX19f
QlVJTFRJTl9BUk1fR0VUX0ZQU0NSCiAgICAgICAgZnBzdGF0ZSA9IF9fYnVpbHRpbl9hcm1fZ2V0
X2Zwc2NyKCk7CkBAIC0yMyw3ICsyMyw3IEBAIGluZGV4IDMzN2JhYTkuLjlhZDAzYmYgMTAwNjQ0
CiAgICAgICAgX19hc21fXyB2b2xhdGlsZSgidm1ycyAlMCwgZnBzY3IiIDogIj1yIihmcHN0YXRl
KSk7CiAgI2VuZGlmCiAgICAgfQotQEAgLTE1MSw3ICsxNTEsNyBAQCB1dGlsX2Zwc3RhdGVfc2V0
KHVuc2lnbmVkIGZwc3RhdGUpCitAQCAtMTU3LDcgKzE1Nyw3IEBAIHV0aWxfZnBzdGF0ZV9zZXQo
dW5zaWduZWQgZnBzdGF0ZSkKICAgICBpZiAodXRpbF9nZXRfY3B1X2NhcHMoKS0+aGFzX25lb24p
IHsKICAjaWZkZWYgSEFWRV9fX0JVSUxUSU5fQVJNX1NFVF9GUFNDUgogICAgICAgIF9fYnVpbHRp
bl9hcm1fc2V0X2Zwc2NyKGZwc3RhdGUpOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwpp
bmRleCBiYjA3MWUyNDExLi4xNWQ1NmM4MDRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNh
LmluYwpAQCAtMjMsOCArMjMsOCBAQCBTUkNfVVJJID0gImh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qu
b3JnL21lc2EtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3JjLXV0aWwt
dV9tYXRoLmMtZG8tbm90LXVzZS1hcm0tZnB1LWluc3RydWN0aW9ucy1pZi5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3MjcwNWNhYTlhZGY0NzQwZjE0ODkx
OTRiMTNlMjc4YWQ5NTkxNjY4NjNiNTI3MWZlNDIzYTg2MzUzYzlhYjYiCi1QViA9ICIyNi4xLjQi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzllNDIxYzdjZTE4Y2Q5ZTc5MGI4Mzc1OTIwMzI1Nzc5
ZjEwNzk4NjMwYmYzMGUwYjIyZjFhMjFjODYxNzEyMiIKK1BWID0gIjI2LjEuNSIKIAogVVBTVFJF
QU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAibWVzYS0oP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKLS0g
CjIuNDcuMQoK

--===============0656170237197387778==--

