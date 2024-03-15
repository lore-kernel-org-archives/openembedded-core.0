Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7CDC54EF5
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1277.1710522012517623170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SOdOpR/e;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cOMtzPds;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e430e9991-65e2c8c4-464c-47f2-a153-ad7006630972-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q5Y6Gwtb9WheXZtRzNvbjJXXUlnIVK6bVvAtNLv8PL4=;
	b=SOdOpR/eWLtebhtHUDMvSJFlEvcT3sYSF+bjXUi1rFjId5qBnQNZdqNU3u3RK98C
	At0dGw3LaQ+I08lA5bGN8MyqsQhac5K1yG2K9/y5t15+1j8QrhheOzf7X47oceFREJd
	JnfThrAF1T7Fidt57JwK33COy5+SGXeGhSsWFqcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522014;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q5Y6Gwtb9WheXZtRzNvbjJXXUlnIVK6bVvAtNLv8PL4=;
	b=cOMtzPdsW1q9AbrSc1MSIJl7HJGxkNwLrl4iNWGQz4Im/JplviMVTiVT8ivSZPwG
	COOoPJgStO0i6hg3LoIbMfbuMYR/FrS5mMo02Z2WCyN28/NN1TSuwOrS0TMoIwnu1vD
	oon0IkhbKv+llVBcgnGDzAxZEQNOczY7QhZQ6o/w=
Content-Type: multipart/mixed; boundary="===============4917667131229017603=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.0.3 SUCCEEDED
Message-ID: <0101018e430e9991-65e2c8c4-464c-47f2-a153-ad7006630972-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197209

--===============4917667131229017603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *24.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-24.0.2-24.0.3.patch
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
From 91bf9a888c14f94040955a41ce215f8eda44dedf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 12:25:11 +0000
Subject: [PATCH] mesa: upgrade 24.0.2 -> 24.0.3

---
 .../mesa/files/0001-drisw-fix-build-without-dri3.patch     | 7 ++-----
 .../mesa/files/0001-gallium-Fix-build-with-llvm-17.patch   | 2 +-
 ...0001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 ...on.build-check-for-all-linux-host_os-combinations.patch | 4 ++--
 ...0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch | 7 ++-----
 meta/recipes-graphics/mesa/mesa.inc                        | 2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb}                | 0
 7 files changed, 9 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
index ab16152090..97fff243b5 100644
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
@@ -1,7 +1,7 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From d9ee6a95480b9721026fe6e7256f6350e7fd3c42 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
+Subject: [PATCH] drisw: fix build without dri3
 
 commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
 added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
@@ -53,6 +53,3 @@ index 3d3f752..4b19e2d 100644
  
     glx_config_destroy_list(psc->base.configs);
     psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
index ceb0153f8d..cc0ede0bc0 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -1,4 +1,4 @@
-From 3e1e5c475b52651657c906e6b03ee13567cccdd7 Mon Sep 17 00:00:00 2001
+From f09df22fa849ccda256c365617bb584e4e843d05 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 23 Jun 2023 01:20:38 -0700
 Subject: [PATCH] gallium: Fix build with llvm 17
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..0f479c37d3 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From cbc82509e10bdb62701e7e5b1c12bb00ca2ecccf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 7be7d81eeb..7934366889 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
+From 5bdc4ab761c7ea991c28215e9e980f4520c7a2ad Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -19,7 +19,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 133fd9a..817861e 100644
+index 5c91048..2db6185 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -128,7 +128,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
index 036a0b4945..ff5dde34f8 100644
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -1,7 +1,7 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From 01c4e7e12ee51f7fd92f36d7fe06febe10abcbfa Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
+Subject: [PATCH] glxext: don't try zink if not enabled in mesa
 
 Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
 added an automatic zink fallback even when the zink gallium is not
@@ -37,6 +37,3 @@ index 05c825a..7a06aa9 100644
     }
  #endif /* GLX_USE_DRM */
     if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 12d7a18eb8..a025c005ba 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
 "
 
-SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
+SRC_URI[sha256sum] = "77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.2.bb b/meta/recipes-graphics/mesa/mesa_24.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.3.bb
-- 
2.42.0


--===============4917667131229017603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-24.0.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-gallium-Fix-build-with-llvm-17.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch" to "https://mesa.freedesktop.org/archive/mesa-24.0.3.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-gallium-Fix-build-with-llvm-17.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch"
packages/core2-64-poky-linux/mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libegl-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgbm-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgbm-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgbm: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgbm: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgl-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libglapi-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libglapi-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libglapi: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libglapi: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgles1-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgles2-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libgles3-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libglx-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libopencl-mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libosmesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libosmesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libosmesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libosmesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libxatracker-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libxatracker-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/libxatracker: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/libxatracker: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-dbg: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 253976048 to 254058432 (+0%)
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-dev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-doc: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-doc: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-locale: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-locale: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-megadriver: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 23002355 to 23010929 (+0%)
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-src: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-src: PKGSIZE changed from 153449535 to 153664577 (+0%)
packages/core2-64-poky-linux/mesa/mesa-src: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-staticdev: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-staticdev: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-tools: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-tools: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 24.0.2 [default] to 24.0.3 [default]
packages/core2-64-poky-linux/mesa/mesa: PV changed from "24.0.2" to "24.0.3"
packages/core2-64-poky-linux/mesa/mesa: PKGV changed from 24.0.2 [default] to 24.0.3 [default]

--===============4917667131229017603==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-24.0.2-24.0.3.patch"

RnJvbSA5MWJmOWE4ODhjMTRmOTQwNDA5NTVhNDFjZTIxNWY4ZWRhNDRkZWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTI6MjU6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhOiB1cGdyYWRlIDI0LjAuMiAtPiAyNC4wLjMKCi0tLQogLi4uL21lc2EvZmlsZXMvMDAwMS1k
cmlzdy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoICAgICB8IDcgKystLS0tLQogLi4uL21l
c2EvZmlsZXMvMDAwMS1nYWxsaXVtLUZpeC1idWlsZC13aXRoLWxsdm0tMTcucGF0Y2ggICB8IDIg
Ky0KIC4uLjAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcu
cGF0Y2ggfCAyICstCiAuLi5vbi5idWlsZC1jaGVjay1mb3ItYWxsLWxpbnV4LWhvc3Rfb3MtY29t
YmluYXRpb25zLnBhdGNoIHwgNCArKy0tCiAuLi4wMDAyLWdseGV4dC1kb24tdC10cnktemluay1p
Zi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNoIHwgNyArKy0tLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9tZXNhLmluYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL21l
c2Eve21lc2FfMjQuMC4yLmJiID0+IG1lc2FfMjQuMC4zLmJifSAgICAgICAgICAgICAgICB8IDAK
IDcgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS97bWVzYV8yNC4wLjIuYmIgPT4gbWVzYV8yNC4w
LjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5w
YXRjaAppbmRleCBhYjE2MTUyMDkwLi45N2ZmZjI0M2I1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRyaXN3LWZpeC1idWlsZC13aXRob3V0LWRyaTMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1kcmlzdy1m
aXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA0YmQxNWE0
MTllODkyZGE4NDM0ODljMzc0YzU4YzViMjljNDBiNWQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBkOWVlNmE5NTQ4MGI5NzIxMDI2ZmU2ZTcyNTZmNjM1MGU3ZmQzYzQyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUu
ZnI+CiBEYXRlOiBUdWUsIDYgRmViIDIwMjQgMDk6NDc6MDkgKzAxMDAKLVN1YmplY3Q6IFtQQVRD
SCAxLzJdIGRyaXN3OiBmaXggYnVpbGQgd2l0aG91dCBkcmkzCitTdWJqZWN0OiBbUEFUQ0hdIGRy
aXN3OiBmaXggYnVpbGQgd2l0aG91dCBkcmkzCiAKIGNvbW1pdCAxODg3MzY4ZGY0MSAoImdseC9z
dzogY2hlY2sgZm9yIG1vZGlmaWVyIHN1cHBvcnQgaW4gdGhlIGtvcHBlciBwYXRoIikKIGFkZGVk
IGRyaTNfcHJpdi5oIGhlYWRlciBhbmQgZHJpM19jaGVja19tdWx0aWJ1ZmZlcigpIGZ1bmN0aW9u
IGluIGRyaXN3IHRoYXQKQEAgLTUzLDYgKzUzLDMgQEAgaW5kZXggM2QzZjc1Mi4uNGIxOWUyZCAx
MDA2NDQKICAKICAgICBnbHhfY29uZmlnX2Rlc3Ryb3lfbGlzdChwc2MtPmJhc2UuY29uZmlncyk7
CiAgICAgcHNjLT5iYXNlLmNvbmZpZ3MgPSBjb25maWdzOwotLS0gCi0yLjQ0LjAKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXVtLUZpeC1i
dWlsZC13aXRoLWxsdm0tMTcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxl
cy8wMDAxLWdhbGxpdW0tRml4LWJ1aWxkLXdpdGgtbGx2bS0xNy5wYXRjaAppbmRleCBjZWIwMTUz
ZjhkLi5jYzBlZGUwYmMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAxLWdhbGxpdW0tRml4LWJ1aWxkLXdpdGgtbGx2bS0xNy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWdhbGxpdW0tRml4LWJ1aWxkLXdpdGgt
bGx2bS0xNy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2UxZTVjNDc1YjUyNjUxNjU3Yzkw
NmU2YjAzZWUxMzU2N2NjY2RkNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjA5ZGYy
MmZhODQ5Y2NkYTI1NmMzNjU2MTdiYjU4NGU0ZTg0M2QwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDIzIEp1
biAyMDIzIDAxOjIwOjM4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdhbGxpdW06IEZpeCBidWls
ZCB3aXRoIGxsdm0gMTcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVj
dHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCmluZGV4IGJhYTk4YTBkNDYuLjBm
NDc5YzM3ZDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAw
MDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3Rz
LTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MDJjYzIxODAwZmUyOWY1NjZhZGQ1MjVlNjNmNjE5YzA1MzZkNmU3YiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gY2JjODI1MDllMTBiZGI2MjcwMWU3ZTViMWMxMmJiMDBjYTJlY2NjZiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiBEYXRlOiBNb24sIDEzIEphbiAyMDIwIDE1OjIzOjQ3IC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIG1lc29uIG1pc2RldGVjdHMgNjRiaXQgYXRvbWljcyBvbiBtaXBzL2NsYW5nCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNo
ZWNrLWZvci1hbGwtbGludXgtaG9zdF9vcy1jb21iaW5hdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNoZWNrLWZvci1hbGwtbGlu
dXgtaG9zdF9vcy1jb21iaW5hdGlvbnMucGF0Y2gKaW5kZXggN2JlN2Q4MWVlYi4uNzkzNDM2Njg4
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNv
bi5idWlsZC1jaGVjay1mb3ItYWxsLWxpbnV4LWhvc3Rfb3MtY29tYmluYXRpb25zLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hl
Y2stZm9yLWFsbC1saW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZThlYzZiMWNjNWU0MDFiYTcxOTA5NTcyMmQ4YjMxN2Q3NTVhZTYxMyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWJkYzRhYjc2MWM3ZWE5OTFjMjgyMTVlOWU5ODBmNDUy
MGM3YTJhZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsaXN0YWlyIEZyYW5jaXMg
PGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CiBEYXRlOiBUaHUsIDE0IE5vdiAyMDE5IDEzOjA0OjQ5
IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBjaGVjayBmb3IgYWxsIGxpbnV4
IGhvc3Rfb3MgY29tYmluYXRpb25zCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFs
aXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1
aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDEzM2ZkOWEuLjgxNzg2MWUgMTAwNjQ0CitpbmRleCA1
YzkxMDQ4Li4yZGI2MTg1IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1
aWxkCiBAQCAtMTI4LDcgKzEyOCw3IEBAIHdpdGhfYW55X29wZW5nbCA9IHdpdGhfb3BlbmdsIG9y
IHdpdGhfZ2xlczEgb3Igd2l0aF9nbGVzMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL21lc2EvZmlsZXMvMDAwMi1nbHhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQt
aW4tbWVzYS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItZ2x4
ZXh0LWRvbi10LXRyeS16aW5rLWlmLW5vdC1lbmFibGVkLWluLW1lc2EucGF0Y2gKaW5kZXggMDM2
YTBiNDk0NS4uZmY1ZGRlMzRmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvZmlsZXMvMDAwMi1nbHhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVz
YS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAyLWdseGV4
dC1kb24tdC10cnktemluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNoCkBAIC0xLDcgKzEs
NyBAQAotRnJvbSA2MjQ5NWViYjk3Nzg2NmM1MmQ1YmVkODQ5OWE1NDdjNDlmMGQ5YmMxIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMWM0ZTdlMTJlZTUxZjdmZDkyZjM2ZDdmZTA2ZmVi
ZTEwYWJjYmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CiBEYXRlOiBUdWUsIDYgRmViIDIwMjQgMDk6NDc6MTAgKzAx
MDAKLVN1YmplY3Q6IFtQQVRDSCAyLzJdIGdseGV4dDogZG9uJ3QgdHJ5IHppbmsgaWYgbm90IGVu
YWJsZWQgaW4gbWVzYQorU3ViamVjdDogW1BBVENIXSBnbHhleHQ6IGRvbid0IHRyeSB6aW5rIGlm
IG5vdCBlbmFibGVkIGluIG1lc2EKIAogQ29tbWl0IDdkOWVhNzdiNDU5ICgiZ2x4OiBhZGQgYXV0
b21hdGljIHppbmsgZmFsbGJhY2sgbG9hZGluZyBiZXR3ZWVuIGh3IGFuZCBzdyBkcml2ZXJzIikK
IGFkZGVkIGFuIGF1dG9tYXRpYyB6aW5rIGZhbGxiYWNrIGV2ZW4gd2hlbiB0aGUgemluayBnYWxs
aXVtIGlzIG5vdApAQCAtMzcsNiArMzcsMyBAQCBpbmRleCAwNWM4MjVhLi43YTA2YWE5IDEwMDY0
NAogICAgIH0KICAjZW5kaWYgLyogR0xYX1VTRV9EUk0gKi8KICAgICBpZiAoZ2x4X2RpcmVjdCkK
LS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKaW5kZXggMTJkN2Ex
OGViOC4uYTAyNWMwMDViYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKQEAgLTIy
LDcgKzIyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL21lc2EuZnJlZWRlc2t0b3Aub3JnL2FyY2hp
dmUvbWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1nbHhleHQtZG9u
LXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5wYXRjaCBcCiAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI5NGUyOGE4ZWRhZDA2ZDhlZDJiODNlYjUzZjI1M2I5ZWI1YWE2MmMzMDgw
ZjkzOTcwMmUxYjMwMzliNTZjOWU4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3YWVjOWEyYTM3
YjdkMzU5NmVhMTY0MGIzY2M1M2QwYjVkOWIzYjUyYWJlZDg5ZGUwN2UzNzE3ZTkxYmZkYmUiCiAK
IFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhXzI0LjAuMi5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2FfMjQuMC4zLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhXzI0
LjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYV8yNC4wLjMu
YmIKLS0gCjIuNDIuMAoK

--===============4917667131229017603==--

