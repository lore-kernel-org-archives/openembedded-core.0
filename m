Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA0DCD4F59
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34756.1778851226279965805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aSKBlBhF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=k++OXz+c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcb9f87-703b5eb0-5e91-4ac6-b282-250d03fccbff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xM7xkJhwEuyE7Y7Ksc0GPLI5F9xukEaRJxwoJNwVzOU=;
	b=aSKBlBhFEwsKwpAfOLmBalhMOlT8ZPVL1R4PvJqlbFqAHrV1PjxLr885C0P8r/ut
	LkK6eMTnnnYv6yGYSDp5XyZU74379WI3fVPwQnN0mr0wRwpnTPg/sUhUxxAQD17iwdz
	q0zCxq24104DO5HfupQ1prP13p1NINZGDXmJT5lU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xM7xkJhwEuyE7Y7Ksc0GPLI5F9xukEaRJxwoJNwVzOU=;
	b=k++OXz+c/WWEYPiln82UYvMQ6kJoAhAqiKXaOPU+i/7VqR37kYDOh67/2wbzcTOb
	lKFUgoaDwRU2XGvAdDzkF+ITPyofAZee0hiP7zNAbSu51+IMC5WUFMQ8r/zaK4Xl6J3
	Mfrel8vUiaikjT8Xck1Lhaash0AlQk7TR88WknuE=
Content-Type: multipart/mixed; boundary="===============2576619208670629002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa-tools-native,mesa: upgrading to 26.1.0,26.1.0 SUCCEEDED
Message-ID: <0101019e2bcb9f87-703b5eb0-5e91-4ac6-b282-250d03fccbff-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237098

--===============2576619208670629002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-tools-native,mesa* to *26.1.0,26.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-tools-native-mesa-upgrade-26.0.6-26.1.0-26.0.6-.patch
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
From 8143c37160de3e1316cde037057ca624619875d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 06:14:04 +0000
Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.0.6 -> 26.1.0,26.0.6 ->
 26.1.0

---
 ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch  | 4 ++--
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch   | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f..8edcfd6857 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From fdd7f38b25de0e1f02f4aec24ee996664d967d35 Mon Sep 17 00:00:00 2001
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
index 065dd373a7..c3480f2ec1 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From 8a4e064718de38a5e938bbc0c4e232527bc44dfa Mon Sep 17 00:00:00 2001
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
index b039ac213e..74aab7691c 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From 4181b9f3dcea0edcbb42f654443b0d613cbeda8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15dad6eedd..aae535e934 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
-PV = "26.0.6"
+SRC_URI[sha256sum] = "a5095e6dc2986c78f0cef4c5555dc803e93b6bfe5670e991f9e8bd49395bae19"
+PV = "26.1.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============2576619208670629002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.0.6.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch" to "https://archive.mesa3d.org/mesa-26.1.0.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 42890976 to 43925216 (+2%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.6.so", added "/usr/lib/libgallium-26.1.0.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 717182496 to 738687688 (+3%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.0.6.so", added "/usr/lib/.debug/libgallium-26.1.0.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 212338 to 214139 (+1%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 198543473 to 201058487 (+1%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/auxiliary -> /usr/src/debug/mesa/26.1.0/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler -> /usr/src/debug/mesa/26.1.0/src/compiler, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/isl -> /usr/src/debug/mesa/26.1.0/src/intel/isl, directory renamed /usr/src/debug/mesa/26.0.6/src/amd/vulkan -> /usr/src/debug/mesa/26.1.0/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/blorp -> /usr/src/debug/mesa/26.1.0/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.0.6/src/loader -> /usr/src/debug/mesa/26.1.0/src/loader, directory renamed /usr/src/debug/mesa/26.0.6/src/vulkan/runtime -> /usr/src/debug/mesa/26.1.0/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.0.6/src/util -> /usr/src/debug/mesa/26.1.0/src/util, directory renamed /usr/src/debug/mesa/26.0.6/src/vulkan/util -> /usr/src/debug/mesa/26.1.0/src/vu
 lkan/util, directory renamed /usr/src/debug/mesa/26.0.6/src/util/format -> /usr/src/debug/mesa/26.1.0/src/util/format, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.1.0/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/dev -> /usr/src/debug/mesa/26.1.0/src/intel/dev, directory renamed /usr/src/debug/mesa/26.0.6/src/virtio/vulkan -> /usr/src/debug/mesa/26.1.0/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/ds -> /usr/src/debug/mesa/26.1.0/src/intel/ds, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/perf -> /usr/src/debug/mesa/26.1.0/src/intel/perf, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa/program -> /usr/src/debug/mesa/26.1.0/src/mesa/program, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/vulkan -> /usr/src/debug/mesa/26.1.0/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.1.0/src/m
 esa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/nir -> /usr/src/debug/mesa/26.1.0/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.0.6/src/vulkan/wsi -> /usr/src/debug/mesa/26.1.0/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.1.0/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.1.0/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/glsl -> /usr/src/debug/mesa/26.1.0/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/compiler -> /usr/src/debug/mesa/26.1.0/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/spirv -> /usr/src/debug/mesa/26.1.0/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.1.0/src/gallium/drivers/zink, directory renamed /usr/src/debu
 g/mesa/26.0.6/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.1.0/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.0.6/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.1.0/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.1.0/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.1.0/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.0.6/src/amd/compiler -> /usr/src/debug/mesa/26.1.0/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/compiler/brw -> /usr/src/debug/mesa/26.1.0/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.0.6/src/nouveau/headers -> /usr/src/debug/mesa/26.1.0/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/compiler/elk -> /usr/src/debug/mesa/26.1.0/src/intel/compiler/elk, directory renamed /usr/src/debug/mes
 a/26.0.6/src/mesa -> /usr/src/debug/mesa/26.1.0/src/mesa, directory renamed /usr/src/debug/mesa/26.0.6/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.1.0/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.1.0/src/mesa/glapi/glapi/gen, removed "/usr/src/debug/mesa/26.0.6/src/intel/genxml/gen120_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen125_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx120_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx110_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen90_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx125_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen200_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen300_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx125_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx200_shaders_binding.h /usr/sr
 c/debug/mesa/26.0.6/src/intel/shaders/intel_gfx300_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx80_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx90_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen110_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/genX_bits.h /usr/src/debug/mesa/26.0.6/src/amd/common/sid_tables.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen110_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx120_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx300_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx110_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen125_rt_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx80_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx90_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen40_pack.h /usr/src/debug/mesa/26.0.6/src/intel/ge
 nxml/gen50_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen60_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen70_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen80_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen90_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen200_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen300_video_pack.h /usr/src/debug/mesa/26.0.6/src/amd/common/gfx10_format_table.c /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen45_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen75_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/genX_xml.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen120_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen125_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/float64_spv.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen200_rt_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen300_rt_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx200_shaders_binding.cpp", ad
 ded "/usr/src/debug/mesa/26.1.0/src/amd/common/amd_cp_print_packet_gfx11.c /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen120_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen125_pack.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx110_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/amd/common/amd_cp_print_packet_gfx12.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen90_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx120_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx125_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx125_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/amd/common/amd_cp_print_packet_gfx11.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx200_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx80_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx90_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/amd/common/amd_cp_print_packet_gfx12
 .c /usr/src/debug/mesa/26.1.0/src/intel/compiler/jay/jay_opcodes.h /usr/src/debug/mesa/26.1.0/src/intel/compiler/jay/jay_nir_algebraic.c /usr/src/debug/mesa/26.1.0/src/intel/compiler/jay/jay_opcodes.c /usr/src/debug/mesa/26.1.0/src/intel/compiler/jay/jay_extra_info.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx200_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen110_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/genX_bits.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx300_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx350_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx110_shaders_binding.cpp /usr/src/debug/mesa/26.1.0/src/amd/common/sid_tables.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen110_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe3p_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen125_rt_pack.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx300_shaders_b
 inding.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx350_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe2_rt_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe3_rt_pack.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx80_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx90_shaders_binding.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen40_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen50_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen60_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen70_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen80_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen90_pack.h /usr/src/debug/mesa/26.1.0/src/amd/common/gfx10_format_table.c /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe3p_rt_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen45_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen75_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/genX_xml.h /usr/src/debu
 g/mesa/26.1.0/src/intel/genxml/xe2_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe2_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe3_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe3_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen120_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/gen125_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/genxml/xe3p_video_pack.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/float64_spv.h /usr/src/debug/mesa/26.1.0/src/intel/compiler/jay/jay_builder_opcodes.h /usr/src/debug/mesa/26.1.0/src/intel/shaders/intel_gfx120_shaders_binding.cpp"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 76952024 to 81015896 (+5%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.0.6" to "26.1.0"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.0.6 [default] to 26.1.0 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.0.6" to "26.1.0"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.6.so moved to /usr/lib/libgallium-26.1.0.so

--===============2576619208670629002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.6.so", added "/usr/lib/libgallium-26.1.0.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.6.so moved to /usr/lib/libgallium-26.1.0.so

--===============2576619208670629002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-tools-native-mesa-upgrade-26.0.6-26.1.0-26.0.6-.patch"

RnJvbSA4MTQzYzM3MTYwZGUzZTEzMTZjZGUwMzcwNTdjYTYyNDYxOTg3NWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDY6MTQ6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLXRvb2xzLW5hdGl2ZSxtZXNhOiB1cGdyYWRlIDI2LjAuNiAtPiAyNi4xLjAsMjYuMC42IC0+
CiAyNi4xLjAKCi0tLQogLi4uMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgt
aW50by1iaW5hcmllcy5wYXRjaCB8IDQgKystLQogLi4uL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgt
YXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoICB8IDQgKystLQogLi4uLzAwMDEtbWVz
b24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggICB8IDIgKy0K
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1l
bmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCmluZGV4IGU5NzZiMzM5OWYuLjhl
ZGNmZDY4NTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9u
LXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNGVmNzQ4NzEwOWY5YWNmYTJiYWYxYTIyMjRkYTMxYTBhZTBjNzRjNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmRkN2YzOGIyNWRlMGUxZjAyZjRhZWMyNGVlOTk2NjY0ZDk2
N2QzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRt
aXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IFdlZCwgMTAgRGVjIDIwMjUg
MDI6Mjc6MTYgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZnJlZWRyZW5vOiBkb24ndCBlbmNvZGUg
YnVpbGQgcGF0aCBpbnRvIGJpbmFyaWVzCkBAIC0yNSw3ICsyNSw3IEBAIFNpZ25lZC1vZmYtYnk6
IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+CiAgMiBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMv
ZnJlZWRyZW5vL21lc29uLmJ1aWxkIGIvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZAotaW5kZXgg
YTRiZmQzMy4uMzMwYjY0NiAxMDA2NDQKK2luZGV4IGU4ZjAxYjguLjgxNDRhNzUgMTAwNjQ0CiAt
LS0gYS9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkCiArKysgYi9zcmMvZnJlZWRyZW5vL21lc29u
LmJ1aWxkCiBAQCAtNCw5ICs0LDEwIEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbWVzYS9maWxlcy8wMDAxLWdhbGxpdm0tRml4LWFybWhmLWJ1aWxkLWFnYWluc3QtTExWTS0y
Mi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1G
aXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoCmluZGV4IDA2NWRkMzczYTcuLmMz
NDgwZjJlYzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVp
bGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYTQwYzQ4MWFm
ZmVmNGRmNzI5ZDc5NGRhZjM3OGVkMmUwMTg0ODk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA4YTRlMDY0NzE4ZGUzOGE1ZTkzOGJiYzBjNGUyMzI1MjdiYzQ0ZGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxlc3NhbmRybyBBc3RvbmUgPGFsZXMuYXN0b25lQGdtYWls
LmNvbT4KIERhdGU6IFN1biwgMSBNYXIgMjAyNiAxODoxNDowOSArMDEwMAogU3ViamVjdDogW1BB
VENIXSBnYWxsaXZtOiBGaXggYXJtaGYgYnVpbGQgYWdhaW5zdCBMTFZNIDIyCkBAIC0xMyw3ICsx
Myw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVhcmVzbWEgPGpvc2UucXVhcmVzbWFAb3NzLnF1
YWxjb21tLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS9nYWxsaXZtL2xwX2JsZF9t
aXNjLmNwcCBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS9nYWxsaXZtL2xwX2JsZF9taXNjLmNwcAot
aW5kZXggZDNhZDM0Mi4uYzk1ZDg2ZSAxMDA2NDQKK2luZGV4IGNlOGNhMDIuLjg2Nzc5ZjAgMTAw
NjQ0CiAtLS0gYS9zcmMvZ2FsbGl1bS9hdXhpbGlhcnkvZ2FsbGl2bS9scF9ibGRfbWlzYy5jcHAK
ICsrKyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS9nYWxsaXZtL2xwX2JsZF9taXNjLmNwcAogQEAg
LTMzMSw3ICszMzEsNyBAQCBscF9idWlsZF9maWxsX21hdHRycyhzdGQ6OnZlY3RvcjxzdGQ6OnN0
cmluZz4gJk1BdHRycykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVj
dHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCmluZGV4IGIwMzlhYzIxM2UuLjc0
YWFiNzY5MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3Rz
LTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ODk0M2IzOGEwYzE0YjIyMGUzZTE3M2MwMzhjODdjZTlhNjk3YzE3MyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNDE4MWI5ZjNkY2VhMGVkY2JiNDJmNjU0NDQzYjBkNjEzY2JlZGE4ZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiBEYXRlOiBNb24sIDEzIEphbiAyMDIwIDE1OjIzOjQ3IC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIG1lc29uIG1pc2RldGVjdHMgNjRiaXQgYXRvbWljcyBvbiBtaXBzL2NsYW5nCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL21lc2EuaW5jCmluZGV4IDE1ZGFkNmVlZGQuLmFhZTUzNWU5MzQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCkBAIC0yMCw4ICsyMCw4IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcvbWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0
Y2ggXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWQzYzNiOGE4MzYzYjhjYzM1NDE3NWJi
NGE2ODRhZDhiMDM1MjExY2MxZDZmYTE3YWViOWI5NjIzYzUxM2Y4OSIKLVBWID0gIjI2LjAuNiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNTA5NWU2ZGMyOTg2Yzc4ZjBjZWY0YzU1NTVkYzgwM2U5
M2I2YmZlNTY3MGU5OTFmOWU4YmQ0OTM5NWJhZTE5IgorUFYgPSAiMjYuMS4wIgogCiBVUFNUUkVB
TV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAK
Mi40Ny4xCgo=

--===============2576619208670629002==--

