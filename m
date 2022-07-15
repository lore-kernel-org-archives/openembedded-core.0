Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB5CCA49B
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.987.1657900669117964078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lYx48k+Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101820294950f-4ef41a2b-4aff-4a64-94e0-46b9c3235c06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jv8HU+9V0Po9Qamh5j7oEwpA/XaF4W2f7Ry6Q9pohvw=;
	b=lYx48k+ZSgXwM2i2EZxk0LNptWWCb1YszehBdgEitJp5S6mZicY1GP6wW/s3tKUD
	0fkKUGdtYbvSgLn5BQHMapUEoFSoqwkWmFXPRbVsVnxRv8PWM8PF2BugKhPkSTk4gdW
	mUMnM3HJ0PcvOIwZXpWhysxx2TBN+fFbG9lbv7sw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jv8HU+9V0Po9Qamh5j7oEwpA/XaF4W2f7Ry6Q9pohvw=;
	b=SS2ZWds+qyglxdYKup6m0wsZdqqYPuwk0FhnQlGhnNIlcfdy0+I3rijxORAFGTX0
	0qqweogtzzFOTvz+qunZNN0RgVuoRQihXNBTI7wY4hmgft4qnNH3sBmQ5qUOfs8wG+y
	7YpF46x45iQC6fDv2syP+Jhxo/NNfWhj8Y2vGSbU=
Content-Type: multipart/mixed; boundary="===============1530127074626044292=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.15.0 SUCCEEDED
Message-ID: 
 <010101820294950f-4ef41a2b-4aff-4a64-94e0-46b9c3235c06-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168094

--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.14.0-2.15.0.patch
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
--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.14.0/libva-2.14.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.15.0/libva-2.15.0.tar.bz2"
packages/core2-32-poky-linux/libva: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-wayland.so.2.1400.0 /usr/lib/.debug/libva-x11.so.2.1400.0 /usr/lib/.debug/libva.so.2.1400.0 /usr/lib/.debug/libva-drm.so.2.1400.0 /usr/lib/.debug/libva-glx.so.2.1400.0", added "/usr/lib/.debug/libva-drm.so.2.1500.0 /usr/lib/.debug/libva-glx.so.2.1500.0 /usr/lib/.debug/libva-wayland.so.2.1500.0 /usr/lib/.debug/libva.so.2.1500.0 /usr/lib/.debug/libva-x11.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 736268 to 721592 (-2%)
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 646641 to 648841 (+0%)
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1400.0", added "/usr/lib/libva-glx.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/wayland -> /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/wayland, directory renamed /usr/src/debug/libva/2.14.0-r0/build/va -> /usr/src/debug/libva/2.15.0-r0/build/va, directory renamed /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/x11 -> /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/x11, directory renamed /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/drm -> /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/drm, directory renamed /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/glx -> /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/glx, removed "/usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_enc_vp8.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_compat.c /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_dec_vp9.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_prot.h /usr/src/debug/libva/2.14.0-r0
 /libva-2.14.0/va/va_enc_h264.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_backend_prot.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_fool.c /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_drmcommon.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va.c /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_vpp.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_enc_vp9.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_enc_hevc.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_dec_vp8.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_backend.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_str.c /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_trace.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_str.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_dec_hevc.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_fool.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_dec_av1.h /usr/src/debug/libva/2.
 14.0-r0/libva-2.14.0/va/va.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_trace.c /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_enc_av1.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_internal.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_x11.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.14.0-r0/libva-2.14.0/va/va_backend_vpp.h", added "/usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_dec_hevc.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_dec_av1.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_dec_vp8.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_h264.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_x11.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_backend.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_vp9.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_trace.h /usr/src/
 debug/libva/2.15.0-r0/libva-2.15.0/va/va_compat.c /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_drmcommon.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_hevc.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_dec_vp9.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_vp8.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_av1.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_backend_vpp.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_trace.c /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_str.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va.c /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_vpp.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_backend_prot.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_internal.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_prot.h /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_str.c /usr/src/debug/libva/2.15.0-r0/libva-2.15.0/va/va_enc_jpeg
 .h"
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 1118207 to 1105831 (-1%)
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1400.0", added "/usr/lib/libva-wayland.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1400.0", added "/usr/lib/libva-x11.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.1400.0 /usr/lib/libva.so.2.1400.0", added "/usr/lib/libva-drm.so.2.1500.0 /usr/lib/libva.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1400.0 to libva-drm.so.2.1500.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1400.0 to libva-glx.so.2.1500.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1400.0 to libva.so.2.1500.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1400.0 to libva-wayland.so.2.1500.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1400.0 to libva-x11.so.2.1500.0
  /usr/lib/libva-drm.so.2.1400.0 moved to /usr/lib/libva-drm.so.2.1500.0
  /usr/lib/libva-glx.so.2.1400.0 moved to /usr/lib/libva-glx.so.2.1500.0
  /usr/lib/libva.so.2.1400.0 moved to /usr/lib/libva.so.2.1500.0
  /usr/lib/libva-wayland.so.2.1400.0 moved to /usr/lib/libva-wayland.so.2.1500.0
  /usr/lib/libva-x11.so.2.1400.0 moved to /usr/lib/libva-x11.so.2.1500.0

--===============1530127074626044292==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.14.0-2.15.0.patch"

From 96625184d5c5a14b8d4f64f4905d3e7570450e8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 12:07:29 +0000
Subject: [PATCH] libva: upgrade 2.14.0 -> 2.15.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.14.0.bb => libva_2.15.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.14.0.bb => libva_2.15.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 148bb03b5f..956cd50756 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "511e9a74d1ccfb548bc192290603082c11074ac59b17aadfd5d56a3f93e58454"
+SRC_URI[sha256sum] = "258ed409458d3e7a000e1908bc852619615ee6a933359c745fcd93eb3e461eca"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.14.0.bb b/meta/recipes-graphics/libva/libva_2.15.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.14.0.bb
rename to meta/recipes-graphics/libva/libva_2.15.0.bb
-- 
2.31.1


--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ceed77ddf7629be2631f7ed47f12dc924bf389a4"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ceed77ddf7629be2631f7ed47f12dc924bf389a4"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 7 Mirrors 0 Missed 7 Current 349 (50% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running task 1194 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 1299 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libdrm/2.4.111-r0/temp/log.do_packagedata_setscene.2003366
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1307 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic unihash changed to 9092d9e0004ca466115d6b9cedbb5947c6ee2c8e54f8d353f43dcc9e9e6a16d3
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1324 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata)
NOTE: Running task 1326 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_qa)
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1320 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 19 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1661 targets, 49 skipped, 0 masked, 0 errors.
Removing 45 recipes from the core2-32 sysroot...done.
Removing 45 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ceed77ddf7629be2631f7ed47f12dc924bf389a4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ceed77ddf7629be2631f7ed47f12dc924bf389a4"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 191 Local 184 Mirrors 0 Missed 7 Current 173 (96% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 181 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 745 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 784 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 786 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 187 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 192 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 196 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 792 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 201 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 203 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 793 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 794 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 205 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 210 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 211 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libdrm/2.4.111-r0/temp/log.do_packagedata_setscene.2012824
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 214 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 216 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_package_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic unihash changed to 9092d9e0004ca466115d6b9cedbb5947c6ee2c8e54f8d353f43dcc9e9e6a16d3
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 223 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 235 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 240 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 243 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 244 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 268 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 274 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 277 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 294 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1315 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata)
NOTE: Running task 1323 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1330 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1331 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1332 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 1333 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: Running task 1334 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 1335 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1336 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_write_rpm)
NOTE: Running task 1337 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_qa)
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1338 of 1338 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1338 tasks of which 1321 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 19 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1662 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (887 cached, 2 parsed). 1660 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ceed77ddf7629be2631f7ed47f12dc924bf389a4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ceed77ddf7629be2631f7ed47f12dc924bf389a4"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 7 Mirrors 0 Missed 7 Current 349 (50% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running task 1194 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 1299 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: Running task 1305 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libdrm/2.4.111-r0/temp/log.do_packagedata_setscene.2000282
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1307 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic unihash changed to 9092d9e0004ca466115d6b9cedbb5947c6ee2c8e54f8d353f43dcc9e9e6a16d3
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1324 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata)
NOTE: Running task 1326 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_qa)
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1320 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 19 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1400.0", added "/usr/lib/libva-glx.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1400.0", added "/usr/lib/libva-wayland.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1400.0", added "/usr/lib/libva-x11.so.2.1500.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.1400.0 /usr/lib/libva.so.2.1400.0", added "/usr/lib/libva-drm.so.2.1500.0 /usr/lib/libva.so.2.1500.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1400.0 to libva-drm.so.2.1500.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1400.0 to libva-glx.so.2.1500.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1400.0 to libva.so.2.1500.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1400.0 to libva-wayland.so.2.1500.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1400.0 to libva-x11.so.2.1500.0
  /usr/lib/libva-drm.so.2.1400.0 moved to /usr/lib/libva-drm.so.2.1500.0
  /usr/lib/libva-glx.so.2.1400.0 moved to /usr/lib/libva-glx.so.2.1500.0
  /usr/lib/libva.so.2.1400.0 moved to /usr/lib/libva.so.2.1500.0
  /usr/lib/libva-wayland.so.2.1400.0 moved to /usr/lib/libva-wayland.so.2.1500.0
  /usr/lib/libva-x11.so.2.1400.0 moved to /usr/lib/libva-x11.so.2.1500.0

--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ceed77ddf7629be2631f7ed47f12dc924bf389a4"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ceed77ddf7629be2631f7ed47f12dc924bf389a4"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 7 Mirrors 0 Missed 7 Current 349 (50% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running task 1194 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 1299 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: Running task 1305 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libdrm/2.4.111-r0/temp/log.do_packagedata_setscene.2009484
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1307 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic unihash changed to 9092d9e0004ca466115d6b9cedbb5947c6ee2c8e54f8d353f43dcc9e9e6a16d3
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1324 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata)
NOTE: Running task 1326 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_qa)
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1320 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 19 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1530127074626044292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 889 .bb files complete (0 cached, 889 parsed). 1660 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ceed77ddf7629be2631f7ed47f12dc924bf389a4"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ceed77ddf7629be2631f7ed47f12dc924bf389a4"
workspace            = "master:f1d7e0f1d466a8cac540acbd7b166aa2d784ed00"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 7 Mirrors 0 Missed 7 Current 349 (50% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running task 1194 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 1299 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libdrm/2.4.111-r0/temp/log.do_packagedata_setscene.2006403
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 362 of 363 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1306 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1307 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_lic unihash changed to 9092d9e0004ca466115d6b9cedbb5947c6ee2c8e54f8d353f43dcc9e9e6a16d3
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1324 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata)
NOTE: Running task 1326 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1330 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1331 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 1332 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: Running task 1333 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 1334 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1335 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_write_rpm)
NOTE: Running task 1336 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package_qa)
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Started
NOTE: recipe libva-2.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1337 of 1337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1337 tasks of which 1320 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 19 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.112-r0 to 0:2.4.111-r0) [version-going-backwards]
ERROR: libdrm-2.4.111-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1530127074626044292==--

