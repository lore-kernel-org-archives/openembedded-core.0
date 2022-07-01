Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8681ACCA490
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.39380.1656687063067681468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VqHb2dHi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181ba3e7197-b62f060c-33b8-4ab0-8f26-e8cdad69f0e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SsXzccEGlJkLzwCe3AnB+wtUPs+pGlEbk4lVaAg8ctM=;
	b=VqHb2dHiPA4vmNDrOCNveMDnS3QF2Mp71UGpdZl54MJly3hFVYIAa8MDd1SW18ET
	/S7Sekqf9plw8Nd8JsJXZljODKVTP6VeirlmB0SxF5cUngY4Cvzvhfz+43yoZxMaS0b
	+Gfz+LdSLPmk43++P0G71xVLdzLfDtHHpfinjXcY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SsXzccEGlJkLzwCe3AnB+wtUPs+pGlEbk4lVaAg8ctM=;
	b=ILo7FCzSbs9YqIsQYE/hdPM52QKNKxUPH6qRm3W8thTH+qPESRmcFM3Taprp9DJw
	ApGdysdVUVaVfiPXD9JeOkU5SjyVPkdYbriMx8qQWNpxx86ODrEHQApRovH+3N0iTbp
	9Sf0KMrquxzCCkCqB0V4sWxip8KAJrUm1JKAOy9c=
Content-Type: multipart/mixed; boundary="===============0198589701243701456=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.20.3 SUCCEEDED
Message-ID: 
 <01010181ba3e7197-b62f060c-33b8-4ab0-8f26-e8cdad69f0e3-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167509

--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.20.2-1.20.3.patch
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
--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-76381e74df29b4fbfd909f13586fddd2657a5e9b"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76381e74df29b4fbfd909f13586fddd2657a5e9b"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 80 Local 13 Mirrors 0 Missed 67 Current 610 (16% match, 90% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 618 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/kmod/29-r0/temp/log.do_packagedata_setscene.3847107
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 689 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1487 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1792 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1793 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_fetch)
NOTE: Running task 1826 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1827 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1937 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1951 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1984 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 1996 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_fetch)
NOTE: Running task 2025 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_fetch)
NOTE: Running task 2055 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2056 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2057 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2067 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2113 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_fetch)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.56.1-r0: task do_fetch: Started
NOTE: Running task 2177 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_fetch)
NOTE: Running task 2179 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2212 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_write_config)
NOTE: Running task 2232 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2235 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_unpack)
NOTE: Running task 2236 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: Running task 2237 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2238 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Succeeded
NOTE: Running task 2239 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2240 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2241 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Started
NOTE: Running task 2242 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2243 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2244 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2245 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2246 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 2247 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2248 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 2249 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe vala-0.56.1-r0: task do_unpack: Started
NOTE: Running task 2250 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_unpack)
NOTE: Running task 2251 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_unpack)
NOTE: Running task 2252 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2253 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_unpack)
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Started
NOTE: Running task 2254 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2255 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2256 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2257 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2258 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2259 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_patch)
NOTE: Running task 2261 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: Running task 2262 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2263 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: Running task 2265 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 2266 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2267 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-29-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2268 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2269 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic)
NOTE: Running task 2270 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2273 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running task 2274 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_patch)
NOTE: Running task 2275 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2276 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_package_setscene: Succeeded
NOTE: Running task 2277 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2288 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic unihash changed to 75d7cc61463feac352c52cebaf3026f8ad7adf83a924f473dc54dce478dd9495
NOTE: Setscene tasks completed
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2289 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2290 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2291 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2293 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2294 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_patch)
NOTE: Running task 2295 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 2296 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2297 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: Running task 2298 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: Running task 2299 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2300 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Running task 2301 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2302 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 24e7bbdb90fcd4b475610092eb7faada85d7d9355d2cd4f7125251b99c42e3bd
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Started
NOTE: Running task 2316 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2317 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2318 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Started
NOTE: Running task 2321 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2323 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f21dc99d20ac7d87594cf6f890075c0c2a720b47039a37779f6a3cf7d22d0088
NOTE: Running task 2328 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2330 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Succeeded
NOTE: Running task 2331 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_patch)
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2334 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2338 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2339 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2340 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.1-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_compile)
NOTE: recipe vala-0.56.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2348 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2351 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2353 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2354 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2358 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2360 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2363 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2368 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2369 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_install)
NOTE: recipe vala-0.56.1-r0: task do_install: Started
NOTE: recipe vala-0.56.1-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_package)
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2375 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2376 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2379 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata)
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Succeeded
NOTE: Running task 2392 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2395 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2398 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2402 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2404 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2406 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_install)
NOTE: recipe librsvg-2.54.4-r0: task do_install: Started
NOTE: recipe librsvg-2.54.4-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_populate_sysroot)
NOTE: Running task 2411 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_package)
NOTE: recipe librsvg-2.54.4-r0: task do_package: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2412 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2413 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_packagedata)
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot)
NOTE: Running task 2418 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2419 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2420 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2425 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2427 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2428 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2429 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2429 tasks of which 2241 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.20.3.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.20.2" to "1.20.3"

--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-76381e74df29b4fbfd909f13586fddd2657a5e9b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76381e74df29b4fbfd909f13586fddd2657a5e9b"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 14 Mirrors 0 Missed 67 Current 613 (17% match, 90% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 622 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/kmod/29-r0/temp/log.do_packagedata_setscene.3144247
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 693 of 694 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1487 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1798 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1799 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_fetch)
NOTE: Running task 1832 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1833 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1955 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1969 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 2002 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 2014 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_fetch)
NOTE: Running task 2043 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_fetch)
NOTE: Running task 2074 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2075 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2076 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2085 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2131 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_fetch)
NOTE: recipe vala-0.56.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.56.1-r0: task do_fetch: Succeeded
NOTE: Running task 2195 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_fetch)
NOTE: Running task 2199 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2230 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2247 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_unpack)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: Running task 2248 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2249 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2253 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_write_config)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: Running task 2255 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Started
NOTE: Running task 2256 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2257 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 2258 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 2259 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Started
NOTE: Running task 2260 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_unpack)
NOTE: Running task 2261 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2262 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2263 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2264 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 2265 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2266 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Started
NOTE: recipe vala-0.56.1-r0: task do_unpack: Started
NOTE: Running task 2267 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 2268 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Succeeded
NOTE: Running task 2269 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_unpack)
NOTE: Running task 2270 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_unpack)
NOTE: Running task 2271 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_unpack)
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2272 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2276 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2277 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2278 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2279 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 2280 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2281 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 2282 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_package_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 2283 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 2284 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2285 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2286 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2287 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2290 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic)
NOTE: Running task 2291 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2292 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2293 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2294 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_package_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Started
NOTE: Running task 2295 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2306 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2308 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 2309 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2310 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic unihash changed to 75d7cc61463feac352c52cebaf3026f8ad7adf83a924f473dc54dce478dd9495
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2311 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_patch)
NOTE: Running task 2312 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2313 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: Running task 2314 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2315 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 2316 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2317 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2318 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2319 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_configure: Started
NOTE: Running task 2320 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Started
NOTE: Running task 2321 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ceacde96a943d5e36c69eaeecad218c8f6bf77ab868ef4c4f4c40b6376bbdffe
NOTE: Running task 2335 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2336 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2339 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2341 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68885898fa42694decaaa93fb8f5351a974266272251ec3d900503cb2ba7f9b5
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2348 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Succeeded
NOTE: Running task 2349 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_patch)
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Succeeded
NOTE: Running task 2350 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2351 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2357 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2360 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2362 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe vala-0.56.1-r0: task do_configure: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: Running task 2363 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_compile: Started
NOTE: Running task 2364 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2366 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2367 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2368 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2369 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2371 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2372 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2376 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2381 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: Running task 2382 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2387 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2388 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_install)
NOTE: recipe vala-0.56.1-r0: task do_install: Started
NOTE: recipe vala-0.56.1-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_package)
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2393 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2394 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2395 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2397 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata)
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2404 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: Running task 2414 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2417 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2420 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2422 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2424 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_install)
NOTE: recipe librsvg-2.54.4-r0: task do_install: Started
NOTE: recipe librsvg-2.54.4-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_populate_sysroot)
NOTE: Running task 2429 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_package)
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_package: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2430 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_package: Succeeded
NOTE: Running task 2432 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_packagedata)
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2433 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot)
NOTE: Running task 2436 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2437 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2438 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2440 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2441 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2443 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2445 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2446 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2447 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2447 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-76381e74df29b4fbfd909f13586fddd2657a5e9b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76381e74df29b4fbfd909f13586fddd2657a5e9b"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 450 Local 377 Mirrors 0 Missed 73 Current 235 (83% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 236 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 920 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 921 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_fetch)
NOTE: Running task 943 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 944 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 991 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 999 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1011 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 1014 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_fetch)
NOTE: Running task 1023 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_fetch)
NOTE: Running task 1024 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1025 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1026 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1030 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 1055 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_fetch)
NOTE: Running task 1066 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_fetch)
NOTE: Running task 1067 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1089 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_write_config)
NOTE: Running task 1092 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_write_config)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.1-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 1093 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 1094 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Started
NOTE: Running task 1095 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1096 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1097 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 1098 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Started
NOTE: Running task 1099 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: Running task 1100 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 1101 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 1102 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 1103 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_unpack)
NOTE: Running task 1104 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running setscene task 327 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running task 1105 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1106 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1107 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running task 1112 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_unpack)
NOTE: Running task 1113 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 335 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.1-r0: task do_unpack: Started
NOTE: Running setscene task 341 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: Running setscene task 342 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Started
NOTE: Running task 1123 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Started
NOTE: Running task 1124 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 1126 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1127 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1129 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1130 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1131 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: Running task 1132 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: Running task 1133 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 353 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running setscene task 356 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust-cross_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 378 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1151 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: Running task 1152 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 1162 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1164 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 381 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1165 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_patch)
NOTE: Running task 1166 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1167 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 1168 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1169 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running task 1170 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_patch)
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1171 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1172 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 1173 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 386 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running task 1179 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_patch: Started
NOTE: Running task 1180 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Started
NOTE: recipe rust-cross-core2-32-musl-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 395 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1201 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 401 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running task 1206 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running task 1211 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1212 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1218 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 408 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1227 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1228 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1234 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1235 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 417 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic unihash changed to 75d7cc61463feac352c52cebaf3026f8ad7adf83a924f473dc54dce478dd9495
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 427 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1259 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1260 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1266 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 435 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1295 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1297 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1307 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 461 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1312 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 488 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 532 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1399 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 1412 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 555 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 583 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running setscene task 588 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1445 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 606 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1535 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6728b82399c51746d3fb26f9f0cd45942f82befd320f14c8b0368e7fe1dc57bf
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1979 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2040 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2080 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2163 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2196 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2221 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2233 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2270 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2271 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Running task 2272 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 07bf514b3f1bd17f4841ab5973582a4697aba46a8bb59e17af48de92273ac843
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: Running task 2284 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Started
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2285 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_configure: Started
NOTE: Running task 2286 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2287 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2288 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2289 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2290 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2291 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2293 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2294 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2296 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2297 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2298 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vala-0.56.1-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_compile)
NOTE: recipe vala-0.56.1-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2301 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 2302 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2303 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 2304 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 2305 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: Running task 2307 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2308 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2309 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2310 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 2311 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Failed
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2311 tasks of which 2190 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/kmod/29-r0/temp/log.do_packagedata.6450
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata) failed with exit code '1'

--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-76381e74df29b4fbfd909f13586fddd2657a5e9b"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76381e74df29b4fbfd909f13586fddd2657a5e9b"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 79 Local 12 Mirrors 0 Missed 67 Current 601 (15% match, 90% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 608 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/kmod/29-r0/temp/log.do_packagedata_setscene.3620302
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 679 of 680 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1477 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1780 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1781 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_fetch)
NOTE: Running task 1814 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1815 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1924 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1938 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1968 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 1980 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_fetch)
NOTE: Running task 2007 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_fetch)
NOTE: Running task 2031 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2032 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2033 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2043 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: Running task 2081 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_fetch)
NOTE: Running task 2143 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_fetch)
NOTE: Running task 2145 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: Running task 2176 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_write_config)
NOTE: Running task 2196 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_write_config)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_fetch: Started
NOTE: recipe vala-0.56.1-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2198 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2199 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_unpack)
NOTE: Running task 2200 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: Running task 2201 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2202 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2203 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Started
NOTE: Running task 2204 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: Running task 2205 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2206 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2207 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 2208 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_unpack)
NOTE: Running task 2209 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: Running task 2210 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 2211 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_unpack)
NOTE: Running task 2212 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2213 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2214 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2215 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_unpack)
NOTE: Running task 2216 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 2217 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Started
NOTE: Running task 2218 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Started
NOTE: Running task 2219 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: Running task 2220 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2221 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 2222 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2223 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2224 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2225 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2226 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_package_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2227 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: Running task 2228 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2229 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2230 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2231 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2232 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2233 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Started
NOTE: Running task 2234 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2235 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2236 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2237 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2238 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2240 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_package_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2251 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Started
NOTE: Running task 2252 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: Running task 2253 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: Running task 2254 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 2255 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2256 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2257 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2258 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2259 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2260 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2261 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2262 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: Running task 2263 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic unihash changed to 75d7cc61463feac352c52cebaf3026f8ad7adf83a924f473dc54dce478dd9495
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Running task 2264 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2265 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2266 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vala-0.56.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Started
NOTE: Running task 2267 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5a87bce771979224b08661aca9e0f2c5a3c9278fb6b3f8becbeb8c95beab0433
NOTE: Running task 2281 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2282 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2283 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2285 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2286 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2287 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2289 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fc785bd9401961ddf48c66e20cc7d64b01053c2960c2558eeebb4f01a6ac1297
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2294 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Succeeded
NOTE: Running task 2295 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Succeeded
NOTE: Running task 2296 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: Running task 2300 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2301 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2302 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2303 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2306 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2308 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2310 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe vala-0.56.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 2311 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2312 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: Running task 2314 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2315 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2317 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2318 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: Running task 2319 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: Running task 2320 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2321 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2322 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2323 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: Running task 2326 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2328 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2329 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2331 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2332 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2333 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2335 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_compile: Succeeded
NOTE: Running task 2336 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_install)
NOTE: recipe vala-0.56.1-r0: task do_install: Started
NOTE: recipe vala-0.56.1-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_package)
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2339 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2340 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2341 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2342 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2343 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Succeeded
NOTE: Running task 2345 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata)
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2346 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2348 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2349 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: Running task 2351 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Succeeded
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_compile)
NOTE: Running task 2355 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2358 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2359 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2360 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2361 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2366 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2368 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2370 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2372 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_install)
NOTE: recipe librsvg-2.54.4-r0: task do_install: Started
NOTE: recipe librsvg-2.54.4-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_populate_sysroot)
NOTE: Running task 2375 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_package)
NOTE: recipe librsvg-2.54.4-r0: task do_package: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2376 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_package: Succeeded
NOTE: Running task 2378 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_packagedata)
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot)
NOTE: Running task 2382 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2383 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2384 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2389 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2392 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2393 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2393 tasks of which 2205 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0198589701243701456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-76381e74df29b4fbfd909f13586fddd2657a5e9b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:76381e74df29b4fbfd909f13586fddd2657a5e9b"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 14 Mirrors 0 Missed 67 Current 609 (17% match, 90% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 618 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kmod/29-r0/temp/log.do_packagedata_setscene.3269211
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 689 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package_setscene)
NOTE: Running task 1488 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1792 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_fetch)
NOTE: Running task 1793 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_fetch)
NOTE: Running task 1826 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1827 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_fetch)
NOTE: Running task 1937 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_fetch)
NOTE: Running task 1951 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_fetch)
NOTE: Running task 1984 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 1996 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_fetch)
NOTE: Running task 2025 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_fetch)
NOTE: Running task 2055 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 2057 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2058 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2067 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Started
NOTE: recipe vala-0.56.1-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2113 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_fetch)
NOTE: recipe libical-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2167 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_unpack)
NOTE: Running task 2168 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_unpack)
NOTE: Running task 2169 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_fetch: Succeeded
NOTE: Running task 2170 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2181 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_fetch)
NOTE: Running task 2185 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2216 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_write_config)
NOTE: recipe flac-1.3.4-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe flac-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 2235 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_unpack)
NOTE: recipe libsndfile1-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2237 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_write_config)
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Started
NOTE: Running task 2239 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_unpack)
NOTE: Running task 2240 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2241 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2242 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Started
NOTE: Running task 2243 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2244 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2245 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_unpack: Started
NOTE: recipe vala-0.56.1-r0: task do_unpack: Started
NOTE: Running task 2246 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2247 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2248 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2249 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 2250 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2251 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2252 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_unpack: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2253 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libical-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2254 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2255 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2256 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2257 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2258 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2259 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 2260 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2261 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2262 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe flac-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe bluez5-5.64-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Started
NOTE: Running task 2264 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_generate_toolchain_file)
NOTE: Running task 2265 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2266 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 2267 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2268 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2269 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.1-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_patch)
NOTE: recipe libsndfile1-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2273 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic)
NOTE: recipe kmod-29-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_patch: Started
NOTE: Running task 2274 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2275 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2276 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_patch)
NOTE: recipe vala-0.56.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.14-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.1-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2278 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2280 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2290 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2293 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_lic unihash changed to 75d7cc61463feac352c52cebaf3026f8ad7adf83a924f473dc54dce478dd9495
NOTE: Setscene tasks completed
NOTE: Running task 2294 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_patch)
NOTE: recipe flac-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2295 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 2296 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2297 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Running task 2298 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2299 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2300 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_configure)
NOTE: Running task 2301 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2302 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_configure)
NOTE: recipe vala-0.56.1-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 687ea4f02cf2520d1e4f6f05acf6a7c02d4c00ce54cbb04ee3ff9a790a9b0d36
NOTE: Running task 2317 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2318 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2319 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2320 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2321 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2322 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2323 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6b884e10bab8744614c446ec2af7b2429353d31ec97ee2b6763a153ee41e4951
NOTE: Running task 2328 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2330 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.54.4-r0: task do_unpack: Succeeded
NOTE: Running task 2331 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Started
NOTE: recipe librsvg-2.54.4-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2334 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2337 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2338 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2339 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 2342 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_package)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Started
NOTE: Running task 2343 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2344 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_compile)
NOTE: Running task 2346 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe vala-0.56.1-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2348 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2350 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2351 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2353 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2354 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_configure: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_compile)
NOTE: Running task 2356 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2358 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 2360 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_install)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2361 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2362 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.2.2-r0: task do_install: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2363 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 2364 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_package: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata)
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_install)
NOTE: recipe flac-1.3.4-r0: task do_install: Started
NOTE: recipe flac-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2368 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_package)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2369 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2370 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_configure)
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Started
NOTE: recipe flac-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata)
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_compile: Succeeded
NOTE: Running task 2372 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_install)
NOTE: recipe vala-0.56.1-r0: task do_install: Started
NOTE: recipe vala-0.56.1-r0: task do_install: Succeeded
NOTE: Running task 2373 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_package)
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2375 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2376 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_configure)
NOTE: recipe libical-3.0.14-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.54.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2379 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_configure)
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Started
NOTE: recipe vala-0.56.1-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata)
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_compile)
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.14-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_install)
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_package)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_install)
NOTE: recipe librsvg-2.54.4-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_install: Started
NOTE: Running task 2390 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_compile)
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_package)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.14-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2395 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure)
NOTE: recipe bluez5-5.64-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2398 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata)
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2402 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile)
NOTE: recipe bluez5-5.64-r0: task do_compile: Started
NOTE: recipe bluez5-5.64-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2404 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install)
NOTE: recipe bluez5-5.64-r0: task do_install: Started
NOTE: recipe bluez5-5.64-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.64-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2406 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_package)
NOTE: recipe bluez5-5.64-r0: task do_package: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata)
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_install)
NOTE: recipe librsvg-2.54.4-r0: task do_install: Started
NOTE: recipe librsvg-2.54.4-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_populate_sysroot)
NOTE: Running task 2411 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_package)
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.54.4-r0: task do_package: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2412 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2413 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.54.4-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_packagedata)
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot)
NOTE: Running task 2418 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2419 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2420 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2425 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2427 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2428 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2429 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2429 tasks of which 2241 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:30-r0 to 0:29-r0) [version-going-backwards]
ERROR: kmod-29-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0198589701243701456==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.20.2-1.20.3.patch"

From 6138eb39bdccffa7d201ded92324daea5d5d8063 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 11:44:09 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.20.2 -> 1.20.3

---
 .../{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
index c4f5d719bb..fb48562a2b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
+SRC_URI[sha256sum] = "8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.31.1


--===============0198589701243701456==--

