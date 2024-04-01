Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681CBCD12C7
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.44636.1711994601268390210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KSQTv7F8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C5SRdpPX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018e9ad48459-c99895c3-1564-4c4c-97fd-98914d885e54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B9vE8bnvYKSOK75o9vUCka6kG7G7KviQiLrR7lo7DBM=;
	b=KSQTv7F8/x+aJPqu5X7zVQn5z67WP80zzC2Ud/NYFax6L+s7dlu/gslbbFJJdqTm
	O1X93u8EntWuDNGCp3Z8ldQdAEm/YDKnV0Xb+DyE3k5eNbExnESeAWKvoTd0UE44gGf
	1iVrJ4nSU3QWreqnvJc8Hw3LFMygoSdsWL8Ihrdg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B9vE8bnvYKSOK75o9vUCka6kG7G7KviQiLrR7lo7DBM=;
	b=C5SRdpPXNgBCLsJS13935visReyMnnI3vO5omWdEjrKwwgyiTQbajcU+7v9CFV84
	wmc8+68xKA6fXFOcSBnBlJ3m5L32vZWIMD6Gdd/hIWsvpp5Fzl6nJ1f96aIf8FVtVRx
	aG55fL2PUpNY7PQepEwO1hVpSXwNSEpQ4Qu03Upg=
Content-Type: multipart/mixed; boundary="===============2150287749246124880=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.0.4 SUCCEEDED
Message-ID: <0101018e9ad48459-c99895c3-1564-4c4c-97fd-98914d885e54-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197767

--===============2150287749246124880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *24.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-24.0.2-24.0.4.patch
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
From d957f1d84ec30c80a920ebe68151bf7d619662fc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 13:12:55 +0000
Subject: [PATCH] mesa: upgrade 24.0.2 -> 24.0.4

---
 ...Revert-meson-do-not-pull-in-clc-for-clover.patch | 13 +++++--------
 .../files/0001-drisw-fix-build-without-dri3.patch   | 11 ++++-------
 ...son-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...d-check-for-all-linux-host_os-combinations.patch |  4 ++--
 ...xext-don-t-try-zink-if-not-enabled-in-mesa.patch |  9 +++------
 meta/recipes-graphics/mesa/mesa.inc                 |  2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.4.bb}         |  0
 7 files changed, 16 insertions(+), 25 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index f6d95c8982..b434232f98 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -1,4 +1,4 @@
-From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
+From 3759a9dad05e5eb06e3e85c9f372ea93481e2cd2 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 8 Mar 2024 15:53:11 +0100
 Subject: [PATCH] Revert "meson: do not pull in clc for clover"
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 25e92ea5f95..3956e19c08f 100644
+index 2db6185..741b5d1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -818,6 +818,7 @@ if _opencl != 'disabled'
+@@ -813,6 +813,7 @@ if _opencl != 'disabled'
      error('The Clover OpenCL state tracker requires rtti')
    endif
  
@@ -29,7 +29,7 @@ index 25e92ea5f95..3956e19c08f 100644
    with_gallium_opencl = true
    with_opencl_icd = _opencl == 'icd'
  else
-@@ -842,7 +843,7 @@ if with_gallium_rusticl
+@@ -837,7 +838,7 @@ if with_gallium_rusticl
  endif
  
  dep_clc = null_dep
@@ -39,7 +39,7 @@ index 25e92ea5f95..3956e19c08f 100644
  endif
  
 diff --git a/src/compiler/meson.build b/src/compiler/meson.build
-index 8d73544c6d8..1dae56d1b2b 100644
+index 8d73544..1dae56d 100644
 --- a/src/compiler/meson.build
 +++ b/src/compiler/meson.build
 @@ -79,7 +79,7 @@ subdir('nir')
@@ -51,6 +51,3 @@ index 8d73544c6d8..1dae56d1b2b 100644
    subdir('clc')
  endif
  if with_gallium
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
index ab16152090..c9919a2d49 100644
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
@@ -1,7 +1,7 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From 0216f93960a03ea4a86908c64c5ce3a8f23e4b48 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:09 +0100
-Subject: [PATCH 1/2] drisw: fix build without dri3
+Subject: [PATCH] drisw: fix build without dri3
 
 commit 1887368df41 ("glx/sw: check for modifier support in the kopper path")
 added dri3_priv.h header and dri3_check_multibuffer() function in drisw that
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/glx/drisw_glx.c b/src/glx/drisw_glx.c
-index 3d3f752..4b19e2d 100644
+index cbba547..6f07709 100644
 --- a/src/glx/drisw_glx.c
 +++ b/src/glx/drisw_glx.c
 @@ -32,7 +32,9 @@
@@ -45,7 +45,7 @@ index 3d3f752..4b19e2d 100644
     if (pdpyp->zink) {
        bool err;
        psc->has_multibuffer = dri3_check_multibuffer(priv->dpy, &err);
-@@ -1005,6 +1008,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
+@@ -1007,6 +1010,7 @@ driswCreateScreenDriver(int screen, struct glx_display *priv,
           goto handle_error;
        }
     }
@@ -53,6 +53,3 @@ index 3d3f752..4b19e2d 100644
  
     glx_config_destroy_list(psc->base.configs);
     psc->base.configs = configs;
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..f6510a0360 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From 24c782369408beb1f66f6afa78122977a2b8186c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 7be7d81eeb..3c1c198e19 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
+From 86f4dea2363ce5e937afefcd963832f5002e6177 Mon Sep 17 00:00:00 2001
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
index 036a0b4945..49797afbfb 100644
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -1,7 +1,7 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From b3ca0813a0fa4e25d999a0bf4aa2082b76006148 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Tue, 6 Feb 2024 09:47:10 +0100
-Subject: [PATCH 2/2] glxext: don't try zink if not enabled in mesa
+Subject: [PATCH] glxext: don't try zink if not enabled in mesa
 
 Commit 7d9ea77b459 ("glx: add automatic zink fallback loading between hw and sw drivers")
 added an automatic zink fallback even when the zink gallium is not
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/glx/glxext.c b/src/glx/glxext.c
-index 05c825a..7a06aa9 100644
+index fd53e00..31e8511 100644
 --- a/src/glx/glxext.c
 +++ b/src/glx/glxext.c
 @@ -908,9 +908,11 @@ __glXInitialize(Display * dpy)
@@ -37,6 +37,3 @@ index 05c825a..7a06aa9 100644
     }
  #endif /* GLX_USE_DRM */
     if (glx_direct)
--- 
-2.44.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6e96190084..d8aeeb64d0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
+SRC_URI[sha256sum] = "90febd30a098cbcd97ff62ecc3dcf5c93d76f7fa314de944cfce81951ba745f0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.2.bb b/meta/recipes-graphics/mesa/mesa_24.0.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.4.bb
-- 
2.42.0


--===============2150287749246124880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-24.0.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch" to "https://mesa.freedesktop.org/archive/mesa-24.0.4.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch"
packages/core2-64-poky-linux/mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libegl-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgbm-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgbm-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgbm: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgbm: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgl-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libglapi-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libglapi-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libglapi: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libglapi: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles1-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles2-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libgles3-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libglx-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libopencl-mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libosmesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libosmesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libosmesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libosmesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libxatracker-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libxatracker-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/libxatracker: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/libxatracker: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 253976048 to 253421248 (-0%)
packages/core2-64-poky-linux/mesa/mesa-dbg: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-dev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-doc: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-doc: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-locale: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-locale: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 23002355 to 22994887 (-0%)
packages/core2-64-poky-linux/mesa/mesa-megadriver: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-src: PKGSIZE changed from 153449535 to 153679082 (+0%)
packages/core2-64-poky-linux/mesa/mesa-src: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-src: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-staticdev: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-staticdev: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-tools: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-tools: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 26341253 to 26304389 (-0%)
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 24.0.2 [default] to 24.0.4 [default]
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa: PV changed from "24.0.2" to "24.0.4"
packages/core2-64-poky-linux/mesa/mesa: PKGV changed from 24.0.2 [default] to 24.0.4 [default]

--===============2150287749246124880==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-24.0.2-24.0.4.patch"

RnJvbSBkOTU3ZjFkODRlYzMwYzgwYTkyMGViZTY4MTUxYmY3ZDYxOTY2MmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMzoxMjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2E6IHVwZ3JhZGUgMjQuMC4yIC0+IDI0LjAuNAoKLS0tCiAuLi5SZXZlcnQtbWVzb24tZG8tbm90
LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0Y2ggfCAxMyArKysrKy0tLS0tLS0tCiAuLi4vZmls
ZXMvMDAwMS1kcmlzdy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoICAgfCAxMSArKysrLS0t
LS0tLQogLi4uc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNo
IHwgIDIgKy0KIC4uLmQtY2hlY2stZm9yLWFsbC1saW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5w
YXRjaCB8ICA0ICsrLS0KIC4uLnhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4t
bWVzYS5wYXRjaCB8ICA5ICsrKy0tLS0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS5pbmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIC4uLi9tZXNhL3ttZXNhXzI0LjAuMi5iYiA9
PiBtZXNhXzI0LjAuNC5iYn0gICAgICAgICB8ICAwCiA3IGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL3ttZXNhXzI0LjAuMi5iYiA9PiBtZXNhXzI0LjAuNC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1SZXZlcnQtbWVzb24tZG8t
bm90LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9maWxlcy8wMDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zl
ci5wYXRjaAppbmRleCBmNmQ5NWM4OTgyLi5iNDM0MjMyZjk4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1p
bi1jbGMtZm9yLWNsb3Zlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zlci5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmU0NjAwZGU1NDk1NDlmYmIzMDMzZmMxYjM3OTA0YmE2
YjNmZTJhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzc1OWE5ZGFkMDVlNWViMDZl
M2U4NWM5ZjM3MmVhOTM0ODFlMmNkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1h
cmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KIERhdGU6IEZyaSwgOCBNYXIgMjAyNCAxNTo1
MzoxMSArMDEwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgIm1lc29uOiBkbyBub3QgcHVsbCBp
biBjbGMgZm9yIGNsb3ZlciIKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBNYXJr
dXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29u
LmJ1aWxkCi1pbmRleCAyNWU5MmVhNWY5NS4uMzk1NmUxOWMwOGYgMTAwNjQ0CitpbmRleCAyZGI2
MTg1Li43NDFiNWQxIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxk
Ci1AQCAtODE4LDYgKzgxOCw3IEBAIGlmIF9vcGVuY2wgIT0gJ2Rpc2FibGVkJworQEAgLTgxMyw2
ICs4MTMsNyBAQCBpZiBfb3BlbmNsICE9ICdkaXNhYmxlZCcKICAgICAgZXJyb3IoJ1RoZSBDbG92
ZXIgT3BlbkNMIHN0YXRlIHRyYWNrZXIgcmVxdWlyZXMgcnR0aScpCiAgICBlbmRpZgogIApAQCAt
MjksNyArMjksNyBAQCBpbmRleCAyNWU5MmVhNWY5NS4uMzk1NmUxOWMwOGYgMTAwNjQ0CiAgICB3
aXRoX2dhbGxpdW1fb3BlbmNsID0gdHJ1ZQogICAgd2l0aF9vcGVuY2xfaWNkID0gX29wZW5jbCA9
PSAnaWNkJwogIGVsc2UKLUBAIC04NDIsNyArODQzLDcgQEAgaWYgd2l0aF9nYWxsaXVtX3J1c3Rp
Y2wKK0BAIC04MzcsNyArODM4LDcgQEAgaWYgd2l0aF9nYWxsaXVtX3J1c3RpY2wKICBlbmRpZgog
IAogIGRlcF9jbGMgPSBudWxsX2RlcApAQCAtMzksNyArMzksNyBAQCBpbmRleCAyNWU5MmVhNWY5
NS4uMzk1NmUxOWMwOGYgMTAwNjQ0CiAgZW5kaWYKICAKIGRpZmYgLS1naXQgYS9zcmMvY29tcGls
ZXIvbWVzb24uYnVpbGQgYi9zcmMvY29tcGlsZXIvbWVzb24uYnVpbGQKLWluZGV4IDhkNzM1NDRj
NmQ4Li4xZGFlNTZkMWIyYiAxMDA2NDQKK2luZGV4IDhkNzM1NDQuLjFkYWU1NmQgMTAwNjQ0CiAt
LS0gYS9zcmMvY29tcGlsZXIvbWVzb24uYnVpbGQKICsrKyBiL3NyYy9jb21waWxlci9tZXNvbi5i
dWlsZAogQEAgLTc5LDcgKzc5LDcgQEAgc3ViZGlyKCduaXInKQpAQCAtNTEsNiArNTEsMyBAQCBp
bmRleCA4ZDczNTQ0YzZkOC4uMWRhZTU2ZDFiMmIgMTAwNjQ0CiAgICBzdWJkaXIoJ2NsYycpCiAg
ZW5kaWYKICBpZiB3aXRoX2dhbGxpdW0KLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhvdXQt
ZHJpMy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZHJpc3ct
Zml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5wYXRjaAppbmRleCBhYjE2MTUyMDkwLi5jOTkxOWEyZDQ5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRyaXN3
LWZpeC1idWlsZC13aXRob3V0LWRyaTMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1kcmlzdy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoCkBAIC0x
LDcgKzEsNyBAQAotRnJvbSA0YmQxNWE0MTllODkyZGE4NDM0ODljMzc0YzU4YzViMjljNDBiNWQ2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMjE2ZjkzOTYwYTAzZWE0YTg2OTA4YzY0
YzVjZTNhOGYyM2U0YjQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CiBEYXRlOiBUdWUsIDYgRmViIDIwMjQgMDk6NDc6
MDkgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGRyaXN3OiBmaXggYnVpbGQgd2l0aG91dCBk
cmkzCitTdWJqZWN0OiBbUEFUQ0hdIGRyaXN3OiBmaXggYnVpbGQgd2l0aG91dCBkcmkzCiAKIGNv
bW1pdCAxODg3MzY4ZGY0MSAoImdseC9zdzogY2hlY2sgZm9yIG1vZGlmaWVyIHN1cHBvcnQgaW4g
dGhlIGtvcHBlciBwYXRoIikKIGFkZGVkIGRyaTNfcHJpdi5oIGhlYWRlciBhbmQgZHJpM19jaGVj
a19tdWx0aWJ1ZmZlcigpIGZ1bmN0aW9uIGluIGRyaXN3IHRoYXQKQEAgLTI0LDcgKzI0LDcgQEAg
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvZ2x4L2RyaXN3X2dseC5j
IGIvc3JjL2dseC9kcmlzd19nbHguYwotaW5kZXggM2QzZjc1Mi4uNGIxOWUyZCAxMDA2NDQKK2lu
ZGV4IGNiYmE1NDcuLjZmMDc3MDkgMTAwNjQ0CiAtLS0gYS9zcmMvZ2x4L2RyaXN3X2dseC5jCiAr
KysgYi9zcmMvZ2x4L2RyaXN3X2dseC5jCiBAQCAtMzIsNyArMzIsOSBAQApAQCAtNDUsNyArNDUs
NyBAQCBpbmRleCAzZDNmNzUyLi40YjE5ZTJkIDEwMDY0NAogICAgIGlmIChwZHB5cC0+emluaykg
ewogICAgICAgIGJvb2wgZXJyOwogICAgICAgIHBzYy0+aGFzX211bHRpYnVmZmVyID0gZHJpM19j
aGVja19tdWx0aWJ1ZmZlcihwcml2LT5kcHksICZlcnIpOwotQEAgLTEwMDUsNiArMTAwOCw3IEBA
IGRyaXN3Q3JlYXRlU2NyZWVuRHJpdmVyKGludCBzY3JlZW4sIHN0cnVjdCBnbHhfZGlzcGxheSAq
cHJpdiwKK0BAIC0xMDA3LDYgKzEwMTAsNyBAQCBkcmlzd0NyZWF0ZVNjcmVlbkRyaXZlcihpbnQg
c2NyZWVuLCBzdHJ1Y3QgZ2x4X2Rpc3BsYXkgKnByaXYsCiAgICAgICAgICAgZ290byBoYW5kbGVf
ZXJyb3I7CiAgICAgICAgfQogICAgIH0KQEAgLTUzLDYgKzUzLDMgQEAgaW5kZXggM2QzZjc1Mi4u
NGIxOWUyZCAxMDA2NDQKICAKICAgICBnbHhfY29uZmlnX2Rlc3Ryb3lfbGlzdChwc2MtPmJhc2Uu
Y29uZmlncyk7CiAgICAgcHNjLT5iYXNlLmNvbmZpZ3MgPSBjb25maWdzOwotLS0gCi0yLjQ0LjAK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNv
bi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9t
aWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXggYmFhOThhMGQ0Ni4uZjY1MTBhMDM2MCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNk
ZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWlj
cy1vbi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMmNjMjE4MDBmZTI5
ZjU2NmFkZDUyNWU2M2Y2MTljMDUzNmQ2ZTdiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAyNGM3ODIzNjk0MDhiZWIxZjY2ZjZhZmE3ODEyMjk3N2EyYjgxODZjIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1v
biwgMTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVzb24gbWlz
ZGV0ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMvY2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hlY2stZm9yLWFsbC1s
aW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9t
ZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hlY2stZm9yLWFsbC1saW51eC1ob3N0X29zLWNv
bWJpbmF0aW9ucy5wYXRjaAppbmRleCA3YmU3ZDgxZWViLi4zYzFjMTk4ZTE5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNoZWNr
LWZvci1hbGwtbGludXgtaG9zdF9vcy1jb21iaW5hdGlvbnMucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1jaGVjay1mb3ItYWxsLWxp
bnV4LWhvc3Rfb3MtY29tYmluYXRpb25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlOGVj
NmIxY2M1ZTQwMWJhNzE5MDk1NzIyZDhiMzE3ZDc1NWFlNjEzIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA4NmY0ZGVhMjM2M2NlNWU5MzdhZmVmY2Q5NjM4MzJmNTAwMmU2MTc3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxp
c3RhaXIyMy5tZT4KIERhdGU6IFRodSwgMTQgTm92IDIwMTkgMTM6MDQ6NDkgLTA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gbWVzb24uYnVpbGQ6IGNoZWNrIGZvciBhbGwgbGludXggaG9zdF9vcyBjb21i
aW5hdGlvbnMKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNp
cyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5i
dWlsZAotaW5kZXggMTMzZmQ5YS4uODE3ODYxZSAxMDA2NDQKK2luZGV4IDVjOTEwNDguLjJkYjYx
ODUgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0xMjgs
NyArMTI4LDcgQEAgd2l0aF9hbnlfb3BlbmdsID0gd2l0aF9vcGVuZ2wgb3Igd2l0aF9nbGVzMSBv
ciB3aXRoX2dsZXMyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxl
cy8wMDAyLWdseGV4dC1kb24tdC10cnktemluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMi1nbHhleHQtZG9uLXQtdHJ5
LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5wYXRjaAppbmRleCAwMzZhMGI0OTQ1Li40OTc5
N2FmYmZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAy
LWdseGV4dC1kb24tdC10cnktemluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItZ2x4ZXh0LWRvbi10LXRyeS16
aW5rLWlmLW5vdC1lbmFibGVkLWluLW1lc2EucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDYy
NDk1ZWJiOTc3ODY2YzUyZDViZWQ4NDk5YTU0N2M0OWYwZDliYzEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGIzY2EwODEzYTBmYTRlMjVkOTk5YTBiZjRhYTIwODJiNzYwMDYxNDggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KIERhdGU6IFR1ZSwgNiBGZWIgMjAyNCAwOTo0NzoxMCArMDEwMAotU3ViamVjdDog
W1BBVENIIDIvMl0gZ2x4ZXh0OiBkb24ndCB0cnkgemluayBpZiBub3QgZW5hYmxlZCBpbiBtZXNh
CitTdWJqZWN0OiBbUEFUQ0hdIGdseGV4dDogZG9uJ3QgdHJ5IHppbmsgaWYgbm90IGVuYWJsZWQg
aW4gbWVzYQogCiBDb21taXQgN2Q5ZWE3N2I0NTkgKCJnbHg6IGFkZCBhdXRvbWF0aWMgemluayBm
YWxsYmFjayBsb2FkaW5nIGJldHdlZW4gaHcgYW5kIHN3IGRyaXZlcnMiKQogYWRkZWQgYW4gYXV0
b21hdGljIHppbmsgZmFsbGJhY2sgZXZlbiB3aGVuIHRoZSB6aW5rIGdhbGxpdW0gaXMgbm90CkBA
IC0yMiw3ICsyMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3Jj
L2dseC9nbHhleHQuYyBiL3NyYy9nbHgvZ2x4ZXh0LmMKLWluZGV4IDA1YzgyNWEuLjdhMDZhYTkg
MTAwNjQ0CitpbmRleCBmZDUzZTAwLi4zMWU4NTExIDEwMDY0NAogLS0tIGEvc3JjL2dseC9nbHhl
eHQuYwogKysrIGIvc3JjL2dseC9nbHhleHQuYwogQEAgLTkwOCw5ICs5MDgsMTEgQEAgX19nbFhJ
bml0aWFsaXplKERpc3BsYXkgKiBkcHkpCkBAIC0zNyw2ICszNywzIEBAIGluZGV4IDA1YzgyNWEu
LjdhMDZhYTkgMTAwNjQ0CiAgICAgfQogICNlbmRpZiAvKiBHTFhfVVNFX0RSTSAqLwogICAgIGlm
IChnbHhfZGlyZWN0KQotLS0gCi0yLjQ0LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmlu
YwppbmRleCA2ZTk2MTkwMDg0Li5kOGFlZWI2NGQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9t
ZXNhLmluYwpAQCAtMjIsNyArMjIsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vbWVzYS5mcmVlZGVz
a3RvcC5vcmcvYXJjaGl2ZS9tZXNhLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLVJldmVydC1tZXNvbi1kby1ub3QtcHVsbC1pbi1jbGMtZm9yLWNsb3Zlci5wYXRjaCBcCiAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NGUyOGE4ZWRhZDA2ZDhlZDJiODNlYjUzZjI1M2I5
ZWI1YWE2MmMzMDgwZjkzOTcwMmUxYjMwMzliNTZjOWU4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjkwZmViZDMwYTA5OGNiY2Q5N2ZmNjJlY2MzZGNmNWM5M2Q3NmY3ZmEzMTRkZTk0NGNmY2U4MTk1
MWJhNzQ1ZjAiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+
XGQrKFwuXGQrKSspIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9t
ZXNhXzI0LjAuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2FfMjQuMC40LmJi
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9tZXNhXzI0LjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYV8yNC4wLjQuYmIKLS0gCjIuNDIuMAoK

--===============2150287749246124880==--

