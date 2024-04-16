Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C42C52D7C
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13423.1713248037148990084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OTO4m6ob;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cHcHuUZ0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a97e4-1316af74-060e-43aa-a537-323216542359-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o5ek++h69iLyYFZkqHBJsAQ/KYa5ZyEGyIS53dHgiIg=;
	b=OTO4m6obek3PX5Yr2q7wYOls0nG7P6BEBIzUuq2M+x+DhrIrQcTBDFRhlJTh3+Jj
	N01W/RJOi7ws5FlUOf2ZHLl1tR5qN0hbQ96p9MsywHbdGHODwhvi7RRc0ykxx6NWjQn
	8CZ7sHEmW7d1PahLmW+wnv6OhwVQayFLE65jVM88=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o5ek++h69iLyYFZkqHBJsAQ/KYa5ZyEGyIS53dHgiIg=;
	b=cHcHuUZ0npUonypsSACeDK5OYEW4n/FC+TBQDF4FgHjgBgkvdtkvCAX1SWRxF/Pr
	4wvkrTaE/nBqBieokJX0RrjcBJCr2+UxnV40py3lsXmh3VH7AcOGtz9lk5HxNfi59mR
	U/Gq6gy8kOiD0NeItEOau0TGkV7j+eQrNWMDO2pg=
Content-Type: multipart/mixed; boundary="===============5334164237434126549=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 24.0.5 SUCCEEDED
Message-ID: <0101018ee58a97e4-1316af74-060e-43aa-a537-323216542359-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198357

--===============5334164237434126549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *24.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-24.0.2-24.0.5.patch
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
From 94c88c130a348400d4dbb7f87418d4178c023fda Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:54:40 +0000
Subject: [PATCH] mesa: upgrade 24.0.2 -> 24.0.5

---
 ...Revert-meson-do-not-pull-in-clc-for-clover.patch | 13 +++++--------
 .../files/0001-drisw-fix-build-without-dri3.patch   | 11 ++++-------
 ...son-misdetects-64bit-atomics-on-mips-clang.patch |  2 +-
 ...d-check-for-all-linux-host_os-combinations.patch |  4 ++--
 ...xext-don-t-try-zink-if-not-enabled-in-mesa.patch |  9 +++------
 meta/recipes-graphics/mesa/mesa.inc                 |  2 +-
 .../mesa/{mesa_24.0.2.bb => mesa_24.0.5.bb}         |  0
 7 files changed, 16 insertions(+), 25 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_24.0.2.bb => mesa_24.0.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
index f6d95c8982..533e2c74e9 100644
--- a/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
+++ b/meta/recipes-graphics/mesa/files/0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
@@ -1,4 +1,4 @@
-From fe4600de549549fbb3033fc1b37904ba6b3fe2af Mon Sep 17 00:00:00 2001
+From 7d847bd527dc625756ae0c2398e458f7b7a426bc Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 8 Mar 2024 15:53:11 +0100
 Subject: [PATCH] Revert "meson: do not pull in clc for clover"
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 25e92ea5f95..3956e19c08f 100644
+index d0d9c5a..277093a 100644
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
index ab16152090..b1b013c03f 100644
--- a/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
+++ b/meta/recipes-graphics/mesa/files/0001-drisw-fix-build-without-dri3.patch
@@ -1,7 +1,7 @@
-From 4bd15a419e892da843489c374c58c5b29c40b5d6 Mon Sep 17 00:00:00 2001
+From 4644f63f464f0848641beac0679dc819a24250b8 Mon Sep 17 00:00:00 2001
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
index baa98a0d46..b4bbacfad5 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From 223aa7492c2745d9076f18d4e0baa3c53682379d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 7be7d81eeb..919dfa0302 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
+From 2442db31d0f5b5d07f0cd9e97b593479cc45a136 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -19,7 +19,7 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 133fd9a..817861e 100644
+index 8963b31..d0d9c5a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -128,7 +128,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
diff --git a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
index 036a0b4945..3596054794 100644
--- a/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
+++ b/meta/recipes-graphics/mesa/files/0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch
@@ -1,7 +1,7 @@
-From 62495ebb977866c52d5bed8499a547c49f0d9bc1 Mon Sep 17 00:00:00 2001
+From c707039f80bd9f4a4f42fd172c43aeecd0962246 Mon Sep 17 00:00:00 2001
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
index 6e96190084..77e9c80fcb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
+SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.2.bb b/meta/recipes-graphics/mesa/mesa_24.0.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.5.bb
-- 
2.42.0


--===============5334164237434126549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-24.0.2.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch" to "https://mesa.freedesktop.org/archive/mesa-24.0.5.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-drisw-fix-build-without-dri3.patch file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch"
packages/core2-64-poky-linux/mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libegl-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libegl-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgbm-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgbm-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgbm: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgbm: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgl-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgl-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libglapi-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libglapi-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libglapi: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libglapi: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgles1-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgles1-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgles2-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgles2-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libgles3-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libgles3-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libglx-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libglx-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libopencl-mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libopencl-mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libopencl-mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libosmesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libosmesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libosmesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libosmesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libxatracker-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libxatracker-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/libxatracker: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/libxatracker: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-dbg: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 253976048 to 253480824 (-0%)
packages/core2-64-poky-linux/mesa/mesa-dbg: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-dev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-dev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-doc: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-doc: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-locale: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-locale: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-megadriver: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 23002355 to 22995287 (-0%)
packages/core2-64-poky-linux/mesa/mesa-megadriver: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-src: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-src: PKGSIZE changed from 153449535 to 153682856 (+0%)
packages/core2-64-poky-linux/mesa/mesa-src: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-staticdev: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-staticdev: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-tools: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-tools: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 26341253 to 26324869 (-0%)
packages/core2-64-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 24.0.2 [default] to 24.0.5 [default]
packages/core2-64-poky-linux/mesa/mesa: PV changed from "24.0.2" to "24.0.5"
packages/core2-64-poky-linux/mesa/mesa: PKGV changed from 24.0.2 [default] to 24.0.5 [default]

--===============5334164237434126549==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-24.0.2-24.0.5.patch"

RnJvbSA5NGM4OGMxMzBhMzQ4NDAwZDRkYmI3Zjg3NDE4ZDQxNzhjMDIzZmRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6NTQ6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhOiB1cGdyYWRlIDI0LjAuMiAtPiAyNC4wLjUKCi0tLQogLi4uUmV2ZXJ0LW1lc29uLWRvLW5v
dC1wdWxsLWluLWNsYy1mb3ItY2xvdmVyLnBhdGNoIHwgMTMgKysrKystLS0tLS0tLQogLi4uL2Zp
bGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5wYXRjaCAgIHwgMTEgKysrKy0t
LS0tLS0KIC4uLnNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRj
aCB8ICAyICstCiAuLi5kLWNoZWNrLWZvci1hbGwtbGludXgtaG9zdF9vcy1jb21iaW5hdGlvbnMu
cGF0Y2ggfCAgNCArKy0tCiAuLi54ZXh0LWRvbi10LXRyeS16aW5rLWlmLW5vdC1lbmFibGVkLWlu
LW1lc2EucGF0Y2ggfCAgOSArKystLS0tLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vbWVzYS97bWVzYV8yNC4wLjIuYmIg
PT4gbWVzYV8yNC4wLjUuYmJ9ICAgICAgICAgfCAgMAogNyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS97bWVzYV8yNC4wLjIuYmIgPT4gbWVzYV8yNC4wLjUuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtUmV2ZXJ0LW1lc29uLWRv
LW5vdC1wdWxsLWluLWNsYy1mb3ItY2xvdmVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1SZXZlcnQtbWVzb24tZG8tbm90LXB1bGwtaW4tY2xjLWZvci1jbG92
ZXIucGF0Y2gKaW5kZXggZjZkOTVjODk4Mi4uNTMzZTJjNzRlOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1SZXZlcnQtbWVzb24tZG8tbm90LXB1bGwt
aW4tY2xjLWZvci1jbG92ZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMS1SZXZlcnQtbWVzb24tZG8tbm90LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZlNDYwMGRlNTQ5NTQ5ZmJiMzAzM2ZjMWIzNzkwNGJh
NmIzZmUyYWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdkODQ3YmQ1MjdkYzYyNTc1
NmFlMGMyMzk4ZTQ1OGY3YjdhNDI2YmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBN
YXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBGcmksIDggTWFyIDIwMjQgMTU6
NTM6MTEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJtZXNvbjogZG8gbm90IHB1bGwg
aW4gY2xjIGZvciBjbG92ZXIiCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogTWFy
a3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNv
bi5idWlsZAotaW5kZXggMjVlOTJlYTVmOTUuLjM5NTZlMTljMDhmIDEwMDY0NAoraW5kZXggZDBk
OWM1YS4uMjc3MDkzYSAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWls
ZAotQEAgLTgxOCw2ICs4MTgsNyBAQCBpZiBfb3BlbmNsICE9ICdkaXNhYmxlZCcKK0BAIC04MTMs
NiArODEzLDcgQEAgaWYgX29wZW5jbCAhPSAnZGlzYWJsZWQnCiAgICAgIGVycm9yKCdUaGUgQ2xv
dmVyIE9wZW5DTCBzdGF0ZSB0cmFja2VyIHJlcXVpcmVzIHJ0dGknKQogICAgZW5kaWYKICAKQEAg
LTI5LDcgKzI5LDcgQEAgaW5kZXggMjVlOTJlYTVmOTUuLjM5NTZlMTljMDhmIDEwMDY0NAogICAg
d2l0aF9nYWxsaXVtX29wZW5jbCA9IHRydWUKICAgIHdpdGhfb3BlbmNsX2ljZCA9IF9vcGVuY2wg
PT0gJ2ljZCcKICBlbHNlCi1AQCAtODQyLDcgKzg0Myw3IEBAIGlmIHdpdGhfZ2FsbGl1bV9ydXN0
aWNsCitAQCAtODM3LDcgKzgzOCw3IEBAIGlmIHdpdGhfZ2FsbGl1bV9ydXN0aWNsCiAgZW5kaWYK
ICAKICBkZXBfY2xjID0gbnVsbF9kZXAKQEAgLTM5LDcgKzM5LDcgQEAgaW5kZXggMjVlOTJlYTVm
OTUuLjM5NTZlMTljMDhmIDEwMDY0NAogIGVuZGlmCiAgCiBkaWZmIC0tZ2l0IGEvc3JjL2NvbXBp
bGVyL21lc29uLmJ1aWxkIGIvc3JjL2NvbXBpbGVyL21lc29uLmJ1aWxkCi1pbmRleCA4ZDczNTQ0
YzZkOC4uMWRhZTU2ZDFiMmIgMTAwNjQ0CitpbmRleCA4ZDczNTQ0Li4xZGFlNTZkIDEwMDY0NAog
LS0tIGEvc3JjL2NvbXBpbGVyL21lc29uLmJ1aWxkCiArKysgYi9zcmMvY29tcGlsZXIvbWVzb24u
YnVpbGQKIEBAIC03OSw3ICs3OSw3IEBAIHN1YmRpcignbmlyJykKQEAgLTUxLDYgKzUxLDMgQEAg
aW5kZXggOGQ3MzU0NGM2ZDguLjFkYWU1NmQxYjJiIDEwMDY0NAogICAgc3ViZGlyKCdjbGMnKQog
IGVuZGlmCiAgaWYgd2l0aF9nYWxsaXVtCi0tLSAKLTIuNDQuMAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRyaXN3LWZpeC1idWlsZC13aXRob3V0
LWRyaTMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWRyaXN3
LWZpeC1idWlsZC13aXRob3V0LWRyaTMucGF0Y2gKaW5kZXggYWIxNjE1MjA5MC4uYjFiMDEzYzAz
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1kcmlz
dy1maXgtYnVpbGQtd2l0aG91dC1kcmkzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZHJpc3ctZml4LWJ1aWxkLXdpdGhvdXQtZHJpMy5wYXRjaApAQCAt
MSw3ICsxLDcgQEAKLUZyb20gNGJkMTVhNDE5ZTg5MmRhODQzNDg5YzM3NGM1OGM1YjI5YzQwYjVk
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDY0NGY2M2Y0NjRmMDg0ODY0MWJlYWMw
Njc5ZGM4MTlhMjQyNTBiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgogRGF0ZTogVHVlLCA2IEZlYiAyMDI0IDA5OjQ3
OjA5ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcmlzdzogZml4IGJ1aWxkIHdpdGhvdXQg
ZHJpMworU3ViamVjdDogW1BBVENIXSBkcmlzdzogZml4IGJ1aWxkIHdpdGhvdXQgZHJpMwogCiBj
b21taXQgMTg4NzM2OGRmNDEgKCJnbHgvc3c6IGNoZWNrIGZvciBtb2RpZmllciBzdXBwb3J0IGlu
IHRoZSBrb3BwZXIgcGF0aCIpCiBhZGRlZCBkcmkzX3ByaXYuaCBoZWFkZXIgYW5kIGRyaTNfY2hl
Y2tfbXVsdGlidWZmZXIoKSBmdW5jdGlvbiBpbiBkcmlzdyB0aGF0CkBAIC0yNCw3ICsyNCw3IEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2dseC9kcmlzd19nbHgu
YyBiL3NyYy9nbHgvZHJpc3dfZ2x4LmMKLWluZGV4IDNkM2Y3NTIuLjRiMTllMmQgMTAwNjQ0Citp
bmRleCBjYmJhNTQ3Li42ZjA3NzA5IDEwMDY0NAogLS0tIGEvc3JjL2dseC9kcmlzd19nbHguYwog
KysrIGIvc3JjL2dseC9kcmlzd19nbHguYwogQEAgLTMyLDcgKzMyLDkgQEAKQEAgLTQ1LDcgKzQ1
LDcgQEAgaW5kZXggM2QzZjc1Mi4uNGIxOWUyZCAxMDA2NDQKICAgICBpZiAocGRweXAtPnppbmsp
IHsKICAgICAgICBib29sIGVycjsKICAgICAgICBwc2MtPmhhc19tdWx0aWJ1ZmZlciA9IGRyaTNf
Y2hlY2tfbXVsdGlidWZmZXIocHJpdi0+ZHB5LCAmZXJyKTsKLUBAIC0xMDA1LDYgKzEwMDgsNyBA
QCBkcmlzd0NyZWF0ZVNjcmVlbkRyaXZlcihpbnQgc2NyZWVuLCBzdHJ1Y3QgZ2x4X2Rpc3BsYXkg
KnByaXYsCitAQCAtMTAwNyw2ICsxMDEwLDcgQEAgZHJpc3dDcmVhdGVTY3JlZW5Ecml2ZXIoaW50
IHNjcmVlbiwgc3RydWN0IGdseF9kaXNwbGF5ICpwcml2LAogICAgICAgICAgIGdvdG8gaGFuZGxl
X2Vycm9yOwogICAgICAgIH0KICAgICB9CkBAIC01Myw2ICs1MywzIEBAIGluZGV4IDNkM2Y3NTIu
LjRiMTllMmQgMTAwNjQ0CiAgCiAgICAgZ2x4X2NvbmZpZ19kZXN0cm95X2xpc3QocHNjLT5iYXNl
LmNvbmZpZ3MpOwogICAgIHBzYy0+YmFzZS5jb25maWdzID0gY29uZmlnczsKLS0tIAotMi40NC4w
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVz
b24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRv
bWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCmluZGV4IGJhYTk4YTBkNDYuLmI0YmJhY2ZhZDUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlz
ZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21p
Y3Mtb24tbWlwcy1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDJjYzIxODAwZmUy
OWY1NjZhZGQ1MjVlNjNmNjE5YzA1MzZkNmU3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMjIzYWE3NDkyYzI3NDVkOTA3NmYxOGQ0ZTBiYWEzYzUzNjgyMzc5ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBN
b24sIDEzIEphbiAyMDIwIDE1OjIzOjQ3IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uIG1p
c2RldGVjdHMgNjRiaXQgYXRvbWljcyBvbiBtaXBzL2NsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNoZWNrLWZvci1hbGwt
bGludXgtaG9zdF9vcy1jb21iaW5hdGlvbnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9maWxlcy8wMDAxLW1lc29uLmJ1aWxkLWNoZWNrLWZvci1hbGwtbGludXgtaG9zdF9vcy1j
b21iaW5hdGlvbnMucGF0Y2gKaW5kZXggN2JlN2Q4MWVlYi4uOTE5ZGZhMDMwMiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi5idWlsZC1jaGVj
ay1mb3ItYWxsLWxpbnV4LWhvc3Rfb3MtY29tYmluYXRpb25zLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24uYnVpbGQtY2hlY2stZm9yLWFsbC1s
aW51eC1ob3N0X29zLWNvbWJpbmF0aW9ucy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZThl
YzZiMWNjNWU0MDFiYTcxOTA5NTcyMmQ4YjMxN2Q3NTVhZTYxMyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gMjQ0MmRiMzFkMGY1YjVkMDdmMGNkOWU5N2I1OTM0NzljYzQ1YTEzNiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFs
aXN0YWlyMjMubWU+CiBEYXRlOiBUaHUsIDE0IE5vdiAyMDE5IDEzOjA0OjQ5IC0wODAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG1lc29uLmJ1aWxkOiBjaGVjayBmb3IgYWxsIGxpbnV4IGhvc3Rfb3MgY29t
YmluYXRpb25zCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5j
aXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24u
YnVpbGQKLWluZGV4IDEzM2ZkOWEuLjgxNzg2MWUgMTAwNjQ0CitpbmRleCA4OTYzYjMxLi5kMGQ5
YzVhIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTI4
LDcgKzEyOCw3IEBAIHdpdGhfYW55X29wZW5nbCA9IHdpdGhfb3BlbmdsIG9yIHdpdGhfZ2xlczEg
b3Igd2l0aF9nbGVzMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMi1nbHhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDItZ2x4ZXh0LWRvbi10LXRy
eS16aW5rLWlmLW5vdC1lbmFibGVkLWluLW1lc2EucGF0Y2gKaW5kZXggMDM2YTBiNDk0NS4uMzU5
NjA1NDc5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
Mi1nbHhleHQtZG9uLXQtdHJ5LXppbmstaWYtbm90LWVuYWJsZWQtaW4tbWVzYS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAyLWdseGV4dC1kb24tdC10cnkt
emluay1pZi1ub3QtZW5hYmxlZC1pbi1tZXNhLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA2
MjQ5NWViYjk3Nzg2NmM1MmQ1YmVkODQ5OWE1NDdjNDlmMGQ5YmMxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBjNzA3MDM5ZjgwYmQ5ZjRhNGY0MmZkMTcyYzQzYWVlY2QwOTYyMjQ2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
c21pbGUuZnI+CiBEYXRlOiBUdWUsIDYgRmViIDIwMjQgMDk6NDc6MTAgKzAxMDAKLVN1YmplY3Q6
IFtQQVRDSCAyLzJdIGdseGV4dDogZG9uJ3QgdHJ5IHppbmsgaWYgbm90IGVuYWJsZWQgaW4gbWVz
YQorU3ViamVjdDogW1BBVENIXSBnbHhleHQ6IGRvbid0IHRyeSB6aW5rIGlmIG5vdCBlbmFibGVk
IGluIG1lc2EKIAogQ29tbWl0IDdkOWVhNzdiNDU5ICgiZ2x4OiBhZGQgYXV0b21hdGljIHppbmsg
ZmFsbGJhY2sgbG9hZGluZyBiZXR3ZWVuIGh3IGFuZCBzdyBkcml2ZXJzIikKIGFkZGVkIGFuIGF1
dG9tYXRpYyB6aW5rIGZhbGxiYWNrIGV2ZW4gd2hlbiB0aGUgemluayBnYWxsaXVtIGlzIG5vdApA
QCAtMjIsNyArMjIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3Ny
Yy9nbHgvZ2x4ZXh0LmMgYi9zcmMvZ2x4L2dseGV4dC5jCi1pbmRleCAwNWM4MjVhLi43YTA2YWE5
IDEwMDY0NAoraW5kZXggZmQ1M2UwMC4uMzFlODUxMSAxMDA2NDQKIC0tLSBhL3NyYy9nbHgvZ2x4
ZXh0LmMKICsrKyBiL3NyYy9nbHgvZ2x4ZXh0LmMKIEBAIC05MDgsOSArOTA4LDExIEBAIF9fZ2xY
SW5pdGlhbGl6ZShEaXNwbGF5ICogZHB5KQpAQCAtMzcsNiArMzcsMyBAQCBpbmRleCAwNWM4MjVh
Li43YTA2YWE5IDEwMDY0NAogICAgIH0KICAjZW5kaWYgLyogR0xYX1VTRV9EUk0gKi8KICAgICBp
ZiAoZ2x4X2RpcmVjdCkKLS0tIAotMi40NC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL21lc2EuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5p
bmMKaW5kZXggNmU5NjE5MDA4NC4uNzdlOWM4MGZjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYS5pbmMKQEAgLTIyLDcgKzIyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL21lc2EuZnJlZWRl
c2t0b3Aub3JnL2FyY2hpdmUvbWVzYS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1SZXZlcnQtbWVzb24tZG8tbm90LXB1bGwtaW4tY2xjLWZvci1jbG92ZXIucGF0Y2ggXAog
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTRlMjhhOGVkYWQwNmQ4ZWQyYjgzZWI1M2YyNTNi
OWViNWFhNjJjMzA4MGY5Mzk3MDJlMWIzMDM5YjU2YzllOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIzOGNjMjQ1Y2E4ZmFhM2M2OWRhNmQyNjg3Zjg5MDYzNzcwMDFmNjMzNjUzNDhhNjJjYzZmN2Zh
ZmIxZThjMDE4IgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJtZXNhLSg/UDxwdmVy
PlxkKyhcLlxkKykrKSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
bWVzYV8yNC4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhXzI0LjAuNS5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvbWVzYV8yNC4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L21lc2FfMjQuMC41LmJiCi0tIAoyLjQyLjAKCg==

--===============5334164237434126549==--

