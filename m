Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F9EC5479A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.174049.1692224352034377787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B9iVPuAK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AB/sVChL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a006e6c6d-4ecf1d3c-dd7d-42fd-8d88-e9d060dd1929-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9E1UxWANqew0wgmKHQOTp8OuBAzvSUMuUUY495auB4g=;
	b=B9iVPuAKTofdbP/PcgJHIuupnf3jgZzUhyqMa6W4LBIlOA+A2+8IEfswA0s7/Kdp
	4oQbMM51wv2wjcXg4bYYnchzDku4rreyXPf6YYestZ+tTAH/OPgxq7cbjGf80MQDnQb
	wl1xgetll9Zng6dqsarrTSvrTY3MDO0lHDQ/OmYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9E1UxWANqew0wgmKHQOTp8OuBAzvSUMuUUY495auB4g=;
	b=AB/sVChLt9ubjq3+V7XhQayjpDVn94eNiGWUISMgErbxj2xjJXRVYNHLOZ6tXLS0
	x5SjoZNGFlrDiekHmsBWIiEy5gwvopNdLyUl3Y/6C8I0L9UFlq2R1d+mLs+tyz1pMRH
	K8jgyCsHZrN3i3asXf+dzH6ZGkpRt2i8ir3JxYmM=
Content-Type: multipart/mixed; boundary="===============1682065482603584022=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.5 SUCCEEDED
Message-ID: <0101018a006e6c6d-4ecf1d3c-dd7d-42fd-8d88-e9d060dd1929-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186244

--===============1682065482603584022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.4-1.22.5.patch
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
From 6db81bb4592ca89812b2800c9d604c64d392c8f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 17:33:00 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.22.4 -> 1.22.5

---
 .../{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
index fc70805daf..5d99810cd4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5fcb872d977b035fb75a2d0ea955ba052dc3bdae282f8f60aa9d865808784211"
+SRC_URI[sha256sum] = "cf0cb9c4de06c5d62eef77cb31238bbaf257dc88802010072eedd1c168f136a4"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.39.2


--===============1682065482603584022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27f004122931dc25c9ce605390b54f31ab511188"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 97 Mirrors 0 Missed 29 Current 1018 (76% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1073 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1083 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1141 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libgudev/237/temp/log.do_packagedata_setscene.1224412
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1142 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package_setscene)
NOTE: recipe libgudev-237-r0: task do_package_setscene: Started
NOTE: recipe libgudev-237-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1144 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa_setscene)
NOTE: Running task 2631 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: Running task 2675 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2812 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_recipe_qa)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2910 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: Running task 2944 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_write_config)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3057 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 3058 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_fetch)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 3059 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 3060 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3061 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 3063 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 3064 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3065 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Started
NOTE: Running task 3066 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3068 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3069 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic unihash changed to c8f24fe3717ba0ed5085f0472a6ecb56d62e7756df3913001ea6d497260f0928
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3070 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3071 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3072 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3073 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3074 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3077 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3081 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3082 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3085 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3089 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3093 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3094 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3096 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package)
NOTE: Running task 3097 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3098 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3099 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3102 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3103 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3104 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package)
NOTE: Running task 3105 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3107 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3108 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3109 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3110 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3111 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3112 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3112 tasks of which 3052 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-src went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dbg went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-staticdev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-doc went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-locale went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1682065482603584022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.5.tar.xz"

--===============1682065482603584022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27f004122931dc25c9ce605390b54f31ab511188"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 124 Local 97 Mirrors 0 Missed 27 Current 1004 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1059 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1068 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1125 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libgudev/237/temp/log.do_packagedata_setscene.1116396
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1126 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package_setscene)
NOTE: recipe libgudev-237-r0: task do_package_setscene: Started
NOTE: Running task 2646 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: Running task 2750 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: Running task 2775 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2849 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: Running task 2897 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_write_config)
NOTE: recipe libgudev-237-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1128 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: Running task 3004 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3005 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3006 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 3011 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 3017 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3020 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3022 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 3023 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: Running task 3024 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 3025 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3026 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3028 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3029 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3030 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic unihash changed to c8f24fe3717ba0ed5085f0472a6ecb56d62e7756df3913001ea6d497260f0928
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3031 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3032 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3033 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3034 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3036 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3037 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3038 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3039 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3040 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3041 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3042 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3043 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3044 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3045 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3046 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3047 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3048 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3049 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3051 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package)
NOTE: Running task 3052 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3053 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3054 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3056 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3057 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3058 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package)
NOTE: Running task 3060 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3061 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3062 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3063 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3064 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3065 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3066 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3067 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3067 tasks of which 3011 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-src went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dbg went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-staticdev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-doc went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-locale went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1682065482603584022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27f004122931dc25c9ce605390b54f31ab511188"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 97 Mirrors 0 Missed 29 Current 1018 (76% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1073 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1083 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1141 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libgudev/237/temp/log.do_packagedata_setscene.958000
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1142 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package_setscene)
NOTE: recipe libgudev-237-r0: task do_package_setscene: Started
NOTE: Running task 2631 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: Running task 2675 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: Running task 2811 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2931 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_write_config)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1144 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3044 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3045 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_fetch)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3057 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 3058 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 3059 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3061 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 3062 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 3063 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3064 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3066 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3067 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3068 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3069 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3070 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic unihash changed to c8f24fe3717ba0ed5085f0472a6ecb56d62e7756df3913001ea6d497260f0928
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3071 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3072 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3073 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3074 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3077 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3078 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3081 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3082 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3085 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3089 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3093 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3094 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3096 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package)
NOTE: Running task 3097 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3098 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3099 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3102 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3103 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3104 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package)
NOTE: Running task 3105 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3107 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3108 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3109 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3110 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3111 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3112 of 3112 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3112 tasks of which 3052 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-src went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dbg went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-staticdev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-doc went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-locale went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1682065482603584022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27f004122931dc25c9ce605390b54f31ab511188"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 132 Local 103 Mirrors 0 Missed 29 Current 1020 (78% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1073 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1076 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1084 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1128 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-native-2023.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1138 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: recipe shaderc-native-2023.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shaderc-native-2023.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe shaderc-native-2023.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1144 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libgudev/237/temp/log.do_packagedata_setscene.835525
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1145 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package_setscene)
NOTE: recipe shaderc-native-2023.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-native-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-native-2023.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-native-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-native-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-native-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-native-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-native-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1150 of 1152 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-native-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-native-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_package_setscene: Started
NOTE: recipe libgudev-237-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1152 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2651 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: Running task 2695 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: recipe libgudev-237-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2841 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_recipe_qa)
NOTE: Running task 2928 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: Running task 2964 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_write_config)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: Running task 3081 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3082 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 3083 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 3084 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 3085 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Started
NOTE: Running task 3086 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 3087 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3089 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3090 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3091 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3092 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3093 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3094 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_lic unihash changed to c8f24fe3717ba0ed5085f0472a6ecb56d62e7756df3913001ea6d497260f0928
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3095 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3096 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3097 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3098 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: Running task 3099 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3100 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3101 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3102 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3106 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3109 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3110 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3111 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3112 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3113 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3114 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3115 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3117 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_configure: Succeeded
NOTE: Running task 3118 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_compile: Succeeded
NOTE: Running task 3119 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_install: Succeeded
NOTE: Running task 3120 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_package)
NOTE: Running task 3121 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3122 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3123 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3124 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3125 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_package: Succeeded
NOTE: Running task 3127 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3128 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package)
NOTE: Running task 3129 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3130 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3131 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_write_rpm)
NOTE: Running task 3132 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3133 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3134 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3135 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3136 of 3136 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb:do_build)
NOTE: Tasks Summary: Attempted 3136 tasks of which 3076 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-src went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dbg went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-staticdev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-dev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-doc went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev-locale went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: QA Issue: Package version for package libgudev went backwards which would break package feeds (from 0:238-r0 to 0:237-r0) [version-going-backwards]
ERROR: libgudev-237-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1682065482603584022==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.4-1.22.5.patch"

RnJvbSA2ZGI4MWJiNDU5MmNhODk4MTJiMjgwMGM5ZDYwNGM2NGQzOTJjOGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTc6MzM6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtb214OiB1cGdyYWRlIDEuMjIuNCAtPiAxLjIyLjUKCi0tLQogLi4uL3tnc3Ry
ZWFtZXIxLjAtb214XzEuMjIuNC5iYiA9PiBnc3RyZWFtZXIxLjAtb214XzEuMjIuNS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtb214XzEu
MjIuNC5iYiA9PiBnc3RyZWFtZXIxLjAtb214XzEuMjIuNS5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIy
LjQuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9t
eF8xLjIyLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi40LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIy
LjUuYmIKaW5kZXggZmM3MDgwNWRhZi4uNWQ5OTgxMGNkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi40LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
NS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Qtb214L2dzdC1vbXgtJHtQVn0u
dGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWZjYjg3MmQ5NzdiMDM1ZmI3NWEyZDBl
YTk1NWJhMDUyZGMzYmRhZTI4MmY4ZjYwYWE5ZDg2NTgwODc4NDIxMSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJjZjBjYjljNGRlMDZjNWQ2MmVlZjc3Y2IzMTIzOGJiYWYyNTdkYzg4ODAyMDEwMDcy
ZWVkZDFjMTY4ZjEzNmE0IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LW9teC0ke1BWfSIKIAotLSAK
Mi4zOS4yCgo=

--===============1682065482603584022==--

