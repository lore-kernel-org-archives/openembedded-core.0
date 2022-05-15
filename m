Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93761C47088
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.18889.1652634914605092825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MQQg9SE9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180c8b78bd0-566c231d-d697-46c8-8d1f-1e903614e31d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YHwfjuCuFoohaGbxJT3aa1uvr74Q/Y3ODJhzfO7gte4=;
	b=MQQg9SE9tM7Q6CiqlrRdxekeUButzcbN7H5i6qrZaapLfMz70dx2d7paAbkpB8IF
	B8dxC+BZzX5CVrsEHeQFSQMXIq5dNVaF+dobhtyMqCKF1toxNiFTvXqhZi+Rj5JY+h5
	evMf366aZqQpcoFtHiZ3DRQNCtKVHNwWGyzkbHEk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YHwfjuCuFoohaGbxJT3aa1uvr74Q/Y3ODJhzfO7gte4=;
	b=I88ZhFxpDo26OvyfnIeQ98vqjksrdtHpET8VrXUdA8tB1MXRHjOmuQGaugWn41cE
	gjhfzyM/gCP53N2SY2MB0qMjYxk+SluYB2Wjjm1aq3LM/vIWo4L2dbRVaPy5N+1CQeM
	4Fjmuzhkjopl2pcXlnwRphJIANwbBLhrlXZP+pC8=
Content-Type: multipart/mixed; boundary="===============8439843093243900479=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.20.2 SUCCEEDED
Message-ID: 
 <01010180c8b78bd0-566c231d-d697-46c8-8d1f-1e903614e31d-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165645

--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.20.1-1.20.2.patch
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
--===============8439843093243900479==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.20.1-1.20.2.patch"

From ab38b0eb2130ed9db0018bc16b6618234b68bcab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 14:51:04 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.20.1 -> 1.20.2

---
 .../{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
index 835f9a31fd..c4f5d719bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c"
+SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.31.1


--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.2.tar.xz"

--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-70325886731a5473bd07130c173d173870b6d1db"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:70325886731a5473bd07130c173d173870b6d1db"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 5 Mirrors 0 Missed 63 Current 628 (7% match, 90% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1500 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1810 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1848 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1849 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1963 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1978 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 2011 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_fetch)
NOTE: Running task 2023 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_fetch)
NOTE: Running task 2054 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_fetch)
NOTE: Running task 2084 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2085 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2086 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2096 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2148 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2214 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_fetch)
NOTE: Running task 2216 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2251 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2273 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2275 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2276 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: Running task 2277 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Started
NOTE: Running task 2278 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 2279 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2280 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2281 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2282 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Started
NOTE: Running task 2283 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2284 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: Running task 2285 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2286 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Started
NOTE: Running task 2287 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_unpack)
NOTE: Running task 2288 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2289 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2290 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 2291 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_unpack)
NOTE: Running task 2292 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2293 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2294 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2295 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2296 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: Running task 2297 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2300 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2301 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2302 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2303 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 2304 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Started
NOTE: Running task 2305 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2306 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2308 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2309 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2310 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2311 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2312 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2313 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic unihash changed to bbc2c64a0551706598ea5f77dbb3f3264a232dfffa43abf02f793d94a65416cf
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2315 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2316 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2317 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Succeeded
NOTE: Running task 2318 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2319 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: Running task 2320 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2321 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2322 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2323 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2324 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: Running task 2325 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2326 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2328 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2329 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2330 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a4787267b87206a3556ff21db492c8420179d3f57dc576d54ca82181b3451039
NOTE: Running task 2346 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2347 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2348 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2349 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2350 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28be58ea1d4240f61f1260f01f80546cbd160e229b27b92a1e15091dc485182c
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2356 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: Running task 2358 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_patch)
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Succeeded
NOTE: Running task 2360 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_rust_create_wrappers)
NOTE: Running task 2361 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2363 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2379 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2381 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2386 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2391 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_compile)
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2396 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: Running task 2397 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2398 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2406 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2407 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: Running task 2409 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2410 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2413 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2414 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2415 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2416 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2417 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2422 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2424 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2426 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2427 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Succeeded
NOTE: Running task 2429 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_install)
NOTE: recipe librsvg-2.54.1-r0: task do_install: Started
NOTE: recipe librsvg-2.54.1-r0: task do_install: Succeeded
NOTE: Running task 2430 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 2431 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2432 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2434 tasks of which 2273 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/librsvg/2.54.1-r0/temp/log.do_packagedata.4030937
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata) failed with exit code '1'

--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-70325886731a5473bd07130c173d173870b6d1db"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:70325886731a5473bd07130c173d173870b6d1db"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 452 Local 389 Mirrors 0 Missed 63 Current 237 (86% match, 90% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 920 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 942 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 943 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 990 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 998 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1010 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_fetch)
NOTE: Running task 1013 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_fetch)
NOTE: Running task 1022 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_fetch)
NOTE: Running task 1023 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 1024 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1025 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1029 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 1054 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 1065 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_fetch)
NOTE: Running task 1066 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1088 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 1091 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_write_config)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.83.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Started
NOTE: Running task 1092 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 1093 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Started
NOTE: Running task 1094 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1095 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 1096 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 1097 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1102 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_unpack)
NOTE: Running task 1103 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 1104 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1105 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running setscene task 322 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running task 1106 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_unpack)
NOTE: Running task 1107 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 1108 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.83.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: Running task 1109 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_unpack)
NOTE: recipe curl-7.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 335 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: Running setscene task 338 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: Running setscene task 344 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 1131 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: Running task 1132 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1133 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 1134 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 347 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1136 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 1140 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1141 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 1142 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 353 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 1147 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running setscene task 378 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Started
NOTE: Running task 1157 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: Running setscene task 382 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1166 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running task 1168 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1169 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1176 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1177 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1178 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1179 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1181 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1186 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running task 1192 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 394 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1203 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 404 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 411 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Started
NOTE: Running setscene task 413 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 1235 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running setscene task 420 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1236 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1241 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: Running task 1242 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1248 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic unihash changed to bbc2c64a0551706598ea5f77dbb3f3264a232dfffa43abf02f793d94a65416cf
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1258 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1259 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 428 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1283 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1293 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running setscene task 447 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1299 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 456 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1305 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 467 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1315 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 476 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 477 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1329 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 1411 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_patch)
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 552 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1432 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1433 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 641 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 664 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1537 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8c0691f0945b009f993205392e59010ba497d8415ae4e9943228fe5fb2af71d
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1983 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2104 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2105 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2182 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2205 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2219 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2244 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2247 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2263 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5222dc792bd3f4e0758968f1352e0a0c9f0b94c2b4a6a4ede8bba4817b7bc9d0
NOTE: Running task 2312 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Running task 2317 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: Running task 2318 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_configure)
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2320 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: Running task 2322 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_rust_create_wrappers)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2326 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2327 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: Running task 2330 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2332 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2335 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2338 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2339 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: Running task 2342 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2343 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2346 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2348 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2349 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: Running task 2350 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2353 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: Running task 2354 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2355 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_compile)
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2358 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2359 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: Running task 2361 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: Running task 2363 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2365 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: Running task 2366 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2367 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2371 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2375 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_install)
NOTE: recipe librsvg-2.54.1-r0: task do_install: Started
NOTE: recipe librsvg-2.54.1-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Failed
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2392 tasks of which 2232 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/librsvg/2.54.1-r0/temp/log.do_packagedata.4124674
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata) failed with exit code '1'

--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-70325886731a5473bd07130c173d173870b6d1db"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:70325886731a5473bd07130c173d173870b6d1db"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 5 Mirrors 0 Missed 63 Current 618 (7% match, 90% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1490 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1798 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1836 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1837 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1950 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1965 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1995 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_fetch)
NOTE: Running task 2007 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_fetch)
NOTE: Running task 2036 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_fetch)
NOTE: Running task 2061 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2062 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2063 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2072 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2116 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2180 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_fetch)
NOTE: Running task 2184 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2215 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2237 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2239 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2240 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: Running task 2241 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2242 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2243 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 2244 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 2245 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Started
NOTE: Running task 2246 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 2247 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2248 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2249 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2250 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2251 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_unpack)
NOTE: Running task 2252 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_unpack)
NOTE: Running task 2253 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2254 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2255 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2256 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2257 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2258 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_unpack)
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2259 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2261 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2264 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2265 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2266 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 2267 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2268 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Started
NOTE: Running task 2269 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2270 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2272 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2273 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2274 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2275 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2277 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2278 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2279 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2280 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Succeeded
NOTE: Running task 2281 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2282 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic unihash changed to bbc2c64a0551706598ea5f77dbb3f3264a232dfffa43abf02f793d94a65416cf
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2283 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 2284 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2285 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2286 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Running task 2288 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2289 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2290 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2292 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: Running task 2293 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2294 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2295 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2296 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2297 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b66cac58edb771b109ed64655cea5c8c334aeae1090430b4b9cb3a7493c0551c
NOTE: Running task 2311 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2312 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2313 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2314 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2315 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 359f8d35f3643abf6826e617d0d167fcf8b19ee2957168c556ba750cc012b0b5
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2321 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2322 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2323 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Succeeded
NOTE: Running task 2324 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_rust_create_wrappers)
NOTE: Running task 2325 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2327 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2328 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_compile)
NOTE: Running task 2330 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2334 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2339 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2342 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: Running task 2343 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2345 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2346 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2350 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2353 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2355 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2356 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Succeeded
NOTE: Running task 2357 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_compile)
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2358 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2362 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2363 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2364 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: Running task 2365 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2370 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2371 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2372 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2373 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2379 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2380 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2381 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2388 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2389 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2390 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Succeeded
NOTE: Running task 2393 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_install)
NOTE: recipe librsvg-2.54.1-r0: task do_install: Started
NOTE: recipe librsvg-2.54.1-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2398 tasks of which 2237 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/librsvg/2.54.1-r0/temp/log.do_packagedata.3946961
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata) failed with exit code '1'

--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-70325886731a5473bd07130c173d173870b6d1db"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:70325886731a5473bd07130c173d173870b6d1db"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 5 Mirrors 0 Missed 63 Current 632 (7% match, 91% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1500 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1816 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1854 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1855 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1981 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1996 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 2029 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_fetch)
NOTE: Running task 2041 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_fetch)
NOTE: Running task 2072 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_fetch)
NOTE: Running task 2102 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2104 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2105 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2114 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2166 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2232 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_fetch)
NOTE: Running task 2236 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2269 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: Running task 2291 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2294 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 2295 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 2296 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Succeeded
NOTE: Running task 2297 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2298 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 2299 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_unpack)
NOTE: Running task 2300 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2301 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2302 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: Running task 2303 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 2304 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_unpack)
NOTE: Running task 2305 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2306 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: Running task 2307 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2308 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2309 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_unpack)
NOTE: Running task 2310 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2311 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2312 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2313 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2316 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2317 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2318 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2319 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2320 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_patch)
NOTE: Running task 2321 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2324 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2326 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: Running task 2327 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2328 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic)
NOTE: Running task 2329 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2330 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2331 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2332 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 2333 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2334 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: Running task 2335 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic unihash changed to bbc2c64a0551706598ea5f77dbb3f3264a232dfffa43abf02f793d94a65416cf
NOTE: Running task 2336 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2338 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2339 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2340 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2341 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2342 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: Running task 2343 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2344 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2345 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: Running task 2347 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2348 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2349 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fb3c8441b8c6896d1bfcca1c31c63967fd6ebadcd0412c4032d25462e0061156
NOTE: Running task 2364 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2365 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2366 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2367 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d6da3a62e28efee8ad4a3cb235af3b2f838f70686182e5facfbed9881e307e9c
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 2376 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2377 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Succeeded
NOTE: Running task 2378 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_rust_create_wrappers)
NOTE: Running task 2379 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_configure)
NOTE: Running task 2381 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2388 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2392 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2393 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2397 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2400 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2401 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2402 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2403 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2405 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: Running task 2409 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2410 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_compile)
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: Running task 2414 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2415 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2416 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2418 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2419 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2423 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2424 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2425 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2427 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2429 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2430 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2434 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2438 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2439 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2441 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2442 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2444 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2445 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_install)
NOTE: recipe librsvg-2.54.1-r0: task do_install: Started
NOTE: recipe librsvg-2.54.1-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 2449 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2450 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2451 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2452 tasks of which 2291 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/librsvg/2.54.1-r0/temp/log.do_packagedata.3779198
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata) failed with exit code '1'

--===============8439843093243900479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-70325886731a5473bd07130c173d173870b6d1db"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:70325886731a5473bd07130c173d173870b6d1db"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 5 Mirrors 0 Missed 63 Current 628 (7% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1500 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1810 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1848 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1849 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1963 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1978 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 2011 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_fetch)
NOTE: Running task 2023 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_fetch)
NOTE: Running task 2054 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_fetch)
NOTE: Running task 2084 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2086 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_fetch)
NOTE: Running task 2087 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2096 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: Running task 2148 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: Running task 2214 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_fetch)
NOTE: Running task 2216 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2251 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2273 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2274 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2275 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 2276 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 2277 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe sbc-1.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2279 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 2280 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 2281 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: Running task 2282 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_unpack)
NOTE: Running task 2283 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2284 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_unpack)
NOTE: Running task 2285 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2286 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: Running task 2287 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2288 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2289 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 2290 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2291 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2292 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_unpack)
NOTE: Running task 2293 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: Running task 2294 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe sbc-1.5-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: Running task 2295 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Started
NOTE: Running task 2296 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2297 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 2298 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe sbc-1.5-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2300 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_patch)
NOTE: Running task 2301 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2302 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 2303 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-1.5-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: Running task 2304 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2305 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2306 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2307 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2309 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.5-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running task 2310 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2311 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2312 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2313 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Started
NOTE: Running task 2314 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2316 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2317 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2318 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: Running task 2319 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2320 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2321 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2322 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2323 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb:do_populate_lic unihash changed to bbc2c64a0551706598ea5f77dbb3f3264a232dfffa43abf02f793d94a65416cf
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2324 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 2325 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2326 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2328 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2329 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2330 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2331 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2332 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ee9ea557f16a8e77018ceb5e8d08eafa1b980af31ebf807d01b8efc24788c202
NOTE: Running task 2346 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2347 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_compile: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2348 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2349 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2351 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 67a4fc9c78a3cceb1476f59eee38eb091258cfd494b23b9668e50c7fa8ef4384
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2359 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_patch: Succeeded
NOTE: Running task 2360 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_rust_create_wrappers)
NOTE: Running task 2361 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.54.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2362 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_configure)
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2367 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2378 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: Running task 2379 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2381 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: Running task 2385 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2387 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2391 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2392 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2396 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2397 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2399 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2400 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2405 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2406 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2407 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2410 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2413 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2414 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2415 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2416 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2417 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_configure)
NOTE: recipe sbc-1.5-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-1.5-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_compile)
NOTE: recipe sbc-1.5-r0: task do_compile: Started
NOTE: recipe sbc-1.5-r0: task do_compile: Succeeded
NOTE: Running task 2420 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_install)
NOTE: recipe sbc-1.5-r0: task do_install: Started
NOTE: recipe sbc-1.5-r0: task do_install: Succeeded
NOTE: Running task 2421 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot)
NOTE: Running task 2422 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_package)
NOTE: recipe sbc-1.5-r0: task do_package: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.5-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata)
NOTE: recipe sbc-1.5-r0: task do_packagedata: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2424 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2425 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2426 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2427 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_install)
NOTE: recipe librsvg-2.54.1-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_install: Succeeded
NOTE: Running task 2430 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_populate_sysroot)
NOTE: Running task 2431 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_package)
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Started
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2432 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.1-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata)
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2434 tasks of which 2273 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-src went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dbg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-gtk went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package rsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-staticdev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-dev went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-doc went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg-locale went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: QA Issue: Package version for package librsvg went backwards which would break package feeds (from 0:2.54.3-r0 to 0:2.54.1-r0) [version-going-backwards]
ERROR: librsvg-2.54.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/librsvg/2.54.1-r0/temp/log.do_packagedata.3862844
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata) failed with exit code '1'

--===============8439843093243900479==--

