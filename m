Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCA3C44503
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 05:32:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62829.1782970364064026092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 22:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FfQFuUTA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jlZRnYmx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f2150ac77-5fbc9293-d226-49b8-9a71-fd2e8bb0a7f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782970363;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=tA4Fs8qPd6ZtEwQB0zypCvnAD75S6lgY4PQHVeCxMfs=;
	b=FfQFuUTAxUQvJ6LfhauIxYNpmN2MoRpT2ya9G7xQZK0vQF//5/empe07LZc3XBTe
	Tfwlk2mSIvaG6dbK7bHiBOoUYcOXj+s93/6EcAFTVYJBDGtSGzwYeRkDaRgIQcyVgwp
	xFM8mrvnWeY+XzTpxTazPpQHgZrYZQEt6JTIzCyA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782970363;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=tA4Fs8qPd6ZtEwQB0zypCvnAD75S6lgY4PQHVeCxMfs=;
	b=jlZRnYmxp5ki2cz+S9GSqpFMFyNo8iciwmiOxvMpe/WpKYcyWiFLUGexL4YJ40h4
	Ge9Z+g3o8yl8eHFcCUoZinya+pFDZIA0rbI8O1pucQNP1ICFkx4lZIYo95I4r7VkLeY
	Y1SPhA/Pst6365ovKghqnSxgqL/j2FXuRFWhLW8E=
Content-Type: multipart/mixed; boundary="===============8816078650560038220=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa-tools-native,mesa: upgrading to 26.1.4,26.1.4 SUCCEEDED
Message-ID: <0101019f2150ac77-5fbc9293-d226-49b8-9a71-fd2e8bb0a7f5-000000@us-west-2.amazonses.com>
Date: Thu, 2 Jul 2026 05:32:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 05:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240013

--===============8816078650560038220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-tools-native,mesa* to *26.1.4,26.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-tools-native-mesa-upgrade-26.1.2-26.1.4-26.1.2-.patch
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
From d37690a75e7698cf805130f2554a3aa098db61e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 2 Jul 2026 05:17:05 +0000
Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.1.2 -> 26.1.4,26.1.2 ->
 26.1.4

---
 ...001-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch | 4 ++--
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch  | 2 +-
 ...rc-intel-compiler-jay-fix-GCC-10-case-label-declara.patch | 5 +----
 ...rc-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 5 +----
 meta/recipes-graphics/mesa/mesa.inc                          | 4 ++--
 6 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f..4e730c2725 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From ce9d6f45ee0f363d084055fbbe96f7a2b0c44670 Mon Sep 17 00:00:00 2001
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
index 065dd373a7..7e00398846 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From bfbbbd83acbe37ad81ba8ee3f3551702ec205d9c Mon Sep 17 00:00:00 2001
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
index b039ac213e..20f8bbbb95 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From 1942ddbd5a5d4dab773f08a51db40e69797bbb13 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
index b8b8718979..77176609dc 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
@@ -1,4 +1,4 @@
-From 0b4b577b7fc926d374234c80267a4bf9dcccb7ef Mon Sep 17 00:00:00 2001
+From 40e0fae76f00bc68d90931dfc009b9cfba7eb850 Mon Sep 17 00:00:00 2001
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
index 904b20d440..51dba74521 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 3adae0d97f655c2991d5b428a3bc95a972e6228b Mon Sep 17 00:00:00 2001
+From 2c1c4ed5d864d179a7e3ef720516b8a7c15d5d90 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
@@ -34,6 +34,3 @@ index 8307044..abf175a 100644
     enum jay_conditional_mod conditional_mod;
  
     jay_def cond_flag; /**< conditional flag */
--- 
-2.47.3
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ad82be99a6..bc7bef8d08 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
 "
 
-SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
-PV = "26.1.2"
+SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
+PV = "26.1.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============8816078650560038220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.1.2.so", added "/usr/lib/libgallium-26.1.4.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.1.2.so moved to /usr/lib/libgallium-26.1.4.so

--===============8816078650560038220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.1.2.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch" to "https://archive.mesa3d.org/mesa-26.1.4.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.1.2.so", added "/usr/lib/libgallium-26.1.4.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 44609248 to 44633824 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.1.2.so", added "/usr/lib/.debug/libgallium-26.1.4.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 750900328 to 754595128 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 215793 to 216377 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.1.2/src/vulkan/wsi -> /usr/src/debug/mesa/26.1.4/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.1.2/src/virtio/vulkan -> /usr/src/debug/mesa/26.1.4/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.1.4/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/genxml -> /usr/src/debug/mesa/26.1.4/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.1.4/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.1.2/src/loader -> /usr/src/debug/mesa/26.1.4/src/loader, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.1.4/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.1.4/src/intel/vulkan_hasvk, directory ren
 amed /usr/src/debug/mesa/26.1.2/src/intel/dev -> /usr/src/debug/mesa/26.1.4/src/intel/dev, directory renamed /usr/src/debug/mesa/26.1.2/src/util/format -> /usr/src/debug/mesa/26.1.4/src/util/format, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/isl -> /usr/src/debug/mesa/26.1.4/src/intel/isl, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa -> /usr/src/debug/mesa/26.1.4/src/mesa, directory renamed /usr/src/debug/mesa/26.1.2/src/vulkan/util -> /usr/src/debug/mesa/26.1.4/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler/glsl -> /usr/src/debug/mesa/26.1.4/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.1.4/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa/program -> /usr/src/debug/mesa/26.1.4/src/mesa/program, directory renamed /usr/src/debug/mesa/26.1.2/src/util -> /usr/src/debug/mesa/26.1.4/src/util, directory renamed /usr/src/debug/mesa/
 26.1.2/src/compiler/nir -> /usr/src/debug/mesa/26.1.4/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.1.4/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler -> /usr/src/debug/mesa/26.1.4/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/compiler -> /usr/src/debug/mesa/26.1.4/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/shaders -> /usr/src/debug/mesa/26.1.4/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler/brw -> /usr/src/debug/mesa/26.1.4/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.1.4/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler/jay -> /usr/src/debug/mesa/26.1.4/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/vulkan/layers -> /usr/src/debug/
 mesa/26.1.4/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/blorp -> /usr/src/debug/mesa/26.1.4/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.1.4/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/perf -> /usr/src/debug/mesa/26.1.4/src/intel/perf, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler/elk -> /usr/src/debug/mesa/26.1.4/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/ds -> /usr/src/debug/mesa/26.1.4/src/intel/ds, directory renamed /usr/src/debug/mesa/26.1.2/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.1.4/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.1.2/src/vulkan/runtime -> /usr/src/debug/mesa/26.1.4/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler/spirv -> /usr/src/debug/mesa/26.1.4/src/compiler/spirv, directory renamed /usr/src/debug
 /mesa/26.1.2/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.1.4/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.1.2/src/nouveau/headers -> /usr/src/debug/mesa/26.1.4/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/vulkan -> /usr/src/debug/mesa/26.1.4/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/common -> /usr/src/debug/mesa/26.1.4/src/amd/common, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/vulkan -> /usr/src/debug/mesa/26.1.4/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler -> /usr/src/debug/mesa/26.1.4/src/compiler, removed "/usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/u_tracepoints.c /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/tr_util.h /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/u_unfilled_gen.c /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/u_tracepoints.h /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/tr_util.c /usr/src/debug/mesa/26.1.2/src/gallium/a
 uxiliary/u_indices_gen.c", added "/usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/u_tracepoints.c /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/tr_util.h /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/draw_nir_lower_opcodes.c /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/u_unfilled_gen.c /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/u_tracepoints.h /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/tr_util.c /usr/src/debug/mesa/26.1.4/src/gallium/auxiliary/u_indices_gen.c"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 201061109 to 201970607 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 81458296 to 81585976 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.1.2" to "26.1.4"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.1.2 [default] to 26.1.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.1.2" to "26.1.4"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.1.2.so moved to /usr/lib/libgallium-26.1.4.so

--===============8816078650560038220==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-tools-native-mesa-upgrade-26.1.2-26.1.4-26.1.2-.patch"

RnJvbSBkMzc2OTBhNzVlNzY5OGNmODA1MTMwZjI1NTRhM2FhMDk4ZGI2MWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMiBKdWwgMjAyNiAwNToxNzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EtdG9vbHMtbmF0aXZlLG1lc2E6IHVwZ3JhZGUgMjYuMS4yIC0+IDI2LjEuNCwyNi4xLjIgLT4K
IDI2LjEuNAoKLS0tCiAuLi4wMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWlu
dG8tYmluYXJpZXMucGF0Y2ggfCA0ICsrLS0KIC4uLi9maWxlcy8wMDAxLWdhbGxpdm0tRml4LWFy
bWhmLWJ1aWxkLWFnYWluc3QtTExWTS0yMi5wYXRjaCB8IDQgKystLQogLi4uLzAwMDEtbWVzb24t
bWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggIHwgMiArLQogLi4u
cmMtaW50ZWwtY29tcGlsZXItamF5LWZpeC1HQ0MtMTAtY2FzZS1sYWJlbC1kZWNsYXJhLnBhdGNo
IHwgNSArLS0tLQogLi4ucmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2Vk
LXR5cGVkLWVuLnBhdGNoIHwgNSArLS0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiA2IGZpbGVzIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxk
LXBhdGgtaW50by1iaW5hcmllcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMu
cGF0Y2gKaW5kZXggZTk3NmIzMzk5Zi4uNGU3MzBjMjcyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxk
LXBhdGgtaW50by1iaW5hcmllcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFy
aWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZWY3NDg3MTA5ZjlhY2ZhMmJhZjFhMjIy
NGRhMzFhMGFlMGM3NGM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZTlkNmY0NWVl
MGYzNjNkMDg0MDU1ZmJiZTk2ZjdhMmIwYzQ0NjcwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29t
PgogRGF0ZTogV2VkLCAxMCBEZWMgMjAyNSAwMjoyNzoxNiArMDIwMAogU3ViamVjdDogW1BBVENI
XSBmcmVlZHJlbm86IGRvbid0IGVuY29kZSBidWlsZCBwYXRoIGludG8gYmluYXJpZXMKQEAgLTI1
LDcgKzI1LDcgQEAgU2lnbmVkLW9mZi1ieTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6
QGNoZXJyeS5kZT4KICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQgYi9zcmMvZnJl
ZWRyZW5vL21lc29uLmJ1aWxkCi1pbmRleCBhNGJmZDMzLi4zMzBiNjQ2IDEwMDY0NAoraW5kZXgg
ZThmMDFiOC4uODE0NGE3NSAxMDA2NDQKIC0tLSBhL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQK
ICsrKyBiL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQKIEBAIC00LDkgKzQsMTAgQEAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgt
YXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIu
cGF0Y2gKaW5kZXggMDY1ZGQzNzNhNy4uN2UwMDM5ODg0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2Fp
bnN0LUxMVk0tMjIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMv
MDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDJhNDBjNDgxYWZmZWY0ZGY3MjlkNzk0ZGFmMzc4ZWQyZTAxODQ4OTUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJmYmJiZDgzYWNiZTM3YWQ4MWJhOGVlM2Yz
NTUxNzAyZWMyMDVkOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGVzc2FuZHJv
IEFzdG9uZSA8YWxlcy5hc3RvbmVAZ21haWwuY29tPgogRGF0ZTogU3VuLCAxIE1hciAyMDI2IDE4
OjE0OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdhbGxpdm06IEZpeCBhcm1oZiBidWlsZCBh
Z2FpbnN0IExMVk0gMjIKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFy
ZXNtYSA8am9zZS5xdWFyZXNtYUBvc3MucXVhbGNvbW0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0v
YXV4aWxpYXJ5L2dhbGxpdm0vbHBfYmxkX21pc2MuY3BwIGIvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5
L2dhbGxpdm0vbHBfYmxkX21pc2MuY3BwCi1pbmRleCBkM2FkMzQyLi5jOTVkODZlIDEwMDY0NAor
aW5kZXggY2U4Y2EwMi4uODY3NzlmMCAxMDA2NDQKIC0tLSBhL3NyYy9nYWxsaXVtL2F1eGlsaWFy
eS9nYWxsaXZtL2xwX2JsZF9taXNjLmNwcAogKysrIGIvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L2dh
bGxpdm0vbHBfYmxkX21pc2MuY3BwCiBAQCAtMzMxLDcgKzMzMSw3IEBAIGxwX2J1aWxkX2ZpbGxf
bWF0dHJzKHN0ZDo6dmVjdG9yPHN0ZDo6c3RyaW5nPiAmTUF0dHJzKQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0
LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcu
cGF0Y2gKaW5kZXggYjAzOWFjMjEzZS4uMjBmOGJiYmI5NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21p
Y3Mtb24tbWlwcy1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4OTQzYjM4YTBjMTRiMjIwZTNlMTczYzAzOGM4N2Nl
OWE2OTdjMTczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxOTQyZGRiZDVhNWQ0ZGFi
NzczZjA4YTUxZGI0MGU2OTc5N2JiYjEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTMgSmFuIDIwMjAgMTU6
MjM6NDcgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24gbWlzZGV0ZWN0cyA2NGJpdCBhdG9t
aWNzIG9uIG1pcHMvY2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1maXgtR0NDLTEwLWNhc2UtbGFiZWwt
ZGVjbGFyYS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3Jj
LWludGVsLWNvbXBpbGVyLWpheS1maXgtR0NDLTEwLWNhc2UtbGFiZWwtZGVjbGFyYS5wYXRjaApp
bmRleCBiOGI4NzE4OTc5Li43NzE3NjYwOWRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktZml4LUdDQy0xMC1j
YXNlLWxhYmVsLWRlY2xhcmEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWZpeC1HQ0MtMTAtY2FzZS1sYWJlbC1k
ZWNsYXJhLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYjRiNTc3YjdmYzkyNmQzNzQyMzRj
ODAyNjdhNGJmOWRjY2NiN2VmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MGUwZmFl
NzZmMDBiYzY4ZDkwOTMxZGZjMDA5YjljZmJhN2ViODUwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4KIERhdGU6IFR1ZSwgMTYg
SnVuIDIwMjYgMDk6MTI6MzQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3JjL2ludGVsL2NvbXBp
bGVyL2pheTogZml4IEdDQyAxMCBjYXNlIGxhYmVsIGRlY2xhcmF0aW9uCkBAIC0zNyw2ICszNywz
IEBAIGluZGV4IDYyYjk1NzYuLmEwYTk0OTggMTAwNjQ0CiAgCiAgICAgY2FzZSBKQVlfT1BDT0RF
X0RFU1dJWlpMRV9FVkVOOgogICAgICAgIGJyd19zZXRfZGVmYXVsdF9leGVjX3NpemUocCwgQlJX
X0VYRUNVVEVfMTYpOwotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRv
LW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVk
LWVuLnBhdGNoCmluZGV4IDkwNGIyMGQ0NDAuLjUxZGJhNzQ1MjEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1q
YXlfaXIuaC1kby1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktamF5X2lyLmgtZG8t
bm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNhZGFlMGQ5N2Y2
NTVjMjk5MWQ1YjQyOGEzYmM5NWE5NzJlNjIyOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDJjMWM0ZWQ1ZDg2NGQxNzlhN2UzZWY3MjA1MTZiOGE3YzE1ZDVkOTAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRl
PgogRGF0ZTogU3VuLCAxNCBKdW4gMjAyNiAxNzo0MjoxOSArMDIwMAogU3ViamVjdDogW1BBVENI
XSBzcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oOiBkbyBub3QgdXNlZCB0eXBlZCBlbnVt
CkBAIC0zNCw2ICszNCwzIEBAIGluZGV4IDgzMDcwNDQuLmFiZjE3NWEgMTAwNjQ0CiAgICAgZW51
bSBqYXlfY29uZGl0aW9uYWxfbW9kIGNvbmRpdGlvbmFsX21vZDsKICAKICAgICBqYXlfZGVmIGNv
bmRfZmxhZzsgLyoqPCBjb25kaXRpb25hbCBmbGFnICovCi0tLSAKLTIuNDcuMwotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL21lc2EuaW5jCmluZGV4IGFkODJiZTk5YTYuLmJjN2JlZjhkMDggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCkBAIC0yMiw4ICsyMiw4IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcvbWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWZpeC1HQ0MtMTAtY2FzZS1sYWJl
bC1kZWNsYXJhLnBhdGNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJhYzJiY2E5MTIx
ODk3YTJiODE2MmU3OTYzNmI1MGFjOTk4ZmNhNzk5YzhlNmNmOTE0ZWRkODU5NjJiYWJkZjAiCi1Q
ViA9ICIyNi4xLjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDcyNzA1Y2FhOWFkZjQ3NDBmMTQ4
OTE5NGIxM2UyNzhhZDk1OTE2Njg2M2I1MjcxZmU0MjNhODYzNTNjOWFiNiIKK1BWID0gIjI2LjEu
NCIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAibWVzYS0oP1A8cHZlcj5cZCsoXC5c
ZCspKykiCiAKLS0gCjIuNDcuMQoK

--===============8816078650560038220==--

