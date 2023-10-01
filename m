Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900FAE776F8
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.65023.1696183991124157343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZLTKntBI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hlI+MdI1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71bd65-2744a8d4-8d17-434a-be59-80e91ee9e7bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SoZW9c7OACfulDQbQzwsTlbAGVv2xlKVS6E5sCEkm2Q=;
	b=ZLTKntBIX0hYKl2/TWJTm6iu2de13wLgFi7dSJzWc234DxGfodB7AJu6GCDcfet/
	kCHBLfe8RchII+EOwOwd9x4TWwpuJzZgsfAKyCIs6+qQUs5yQnFE781yhRzyQVkxJCN
	3Gq03KIzcl5c9CRqiYVfVluYVPCYZOaT0TMvJFc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SoZW9c7OACfulDQbQzwsTlbAGVv2xlKVS6E5sCEkm2Q=;
	b=hlI+MdI1q8n+68FD8YPwODSO10LE2pMORCLlp3kmqUAn6LyP73Oqy9mMRbikBG87
	BelUZtF+tyPz6l86mN81ZTaxNKqobb5Tx09de21ahljK95kiewzqb1CDzNPeIBE79LA
	+KBAtAR8kk6PtWULbxXTCcdp8/RUtu5oEu0Wg+ys=
Content-Type: multipart/mixed; boundary="===============6132305847352564860=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.6 SUCCEEDED
Message-ID: <0101018aec71bd65-2744a8d4-8d17-434a-be59-80e91ee9e7bf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188569

--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.5-1.22.6.patch
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
From 2cbcda54169b9bae8561a3d9d9a44dac23cc69c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:57:23 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.22.5 -> 1.22.6

---
 .../{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
index 5d99810cd4..2579aa3d66 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "cf0cb9c4de06c5d62eef77cb31238bbaf257dc88802010072eedd1c168f136a4"
+SRC_URI[sha256sum] = "223833c42518ad7eb1923bb4dd3726809f59a66d6e9aaaa69cb29ad0750c8758"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.39.2


--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.6.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.22.5" to "1.22.6"

--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-282162014c232f41e12efbe517d02b75041578e4"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:282162014c232f41e12efbe517d02b75041578e4"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 47 Mirrors 0 Missed 38 Current 1059 (55% match, 96% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1073 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 1074 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/kmod/30/temp/log.do_packagedata_setscene.1095336
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1142 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_package_setscene: Started
NOTE: Running task 1832 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe kmod-30-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 1144 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2615 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: Running task 2620 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: Running task 2652 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: Running task 2699 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2781 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_recipe_qa)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2890 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_write_config)
NOTE: Running task 2935 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2936 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2987 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2994 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2995 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_fetch)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2997 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2998 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2999 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3000 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 3001 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4efe0923fdf84ab962f1d152997314acb2fb28e00680a8149c544bc5fdcd305a
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3036 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3037 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3038 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3039 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3040 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3041 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3042 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3043 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5339aca9e47bec61a99da666aee686851063e3a76b9253d6a6c82553ae0f493a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 6f9af7ef057241d84599f96ca68b95083919dc51fcb8b04f33ef24dc6e513017 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '46b543f82a10a18e05f920dd88af6fc56e24e3d4d54221ac9c21f2d5e5bb1c85', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '6f9af7ef057241d84599f96ca68b95083919dc51fcb8b04f33ef24dc6e513017'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 46b543f82a10a18e05f920dd88af6fc56e24e3d4d54221ac9c21f2d5e5bb1c85 -> 6f9af7ef057241d84599f96ca68b95083919dc51fcb8b04f33ef24dc6e513017 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3062 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3065 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3066 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3068 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3070 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3072 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3073 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3074 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3075 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3076 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3077 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3078 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3079 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3082 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3083 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3084 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3086 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3087 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3088 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3089 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3090 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3091 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3094 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3098 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3100 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3105 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package)
NOTE: Running task 3106 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3109 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3110 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3111 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3112 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3113 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3113 tasks of which 3038 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-282162014c232f41e12efbe517d02b75041578e4"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:282162014c232f41e12efbe517d02b75041578e4"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 77 Local 47 Mirrors 0 Missed 30 Current 1067 (61% match, 97% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1081 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 1082 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1098 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kmod/30/temp/log.do_packagedata_setscene.973115
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1142 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_package_setscene: Started
NOTE: Running task 1832 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1144 of 1144 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running task 2641 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: Running task 2688 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2776 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_recipe_qa)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: Running task 2889 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_write_config)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2929 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: Running task 2997 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2998 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2999 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3008 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3009 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 3010 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 3011 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 3012 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 3014 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 3015 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ca904cc12661e9ff90c127b846ed13e446994b8ea6f02608921a9a3e91322e85
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3050 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3051 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3052 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3053 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3054 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3055 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3056 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3057 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 211e462a1e5567354a6419194e4f8bd8b7dae95ee7ba36a440d71779fe8aacbc
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 7bc7b21755d48518ae06635eabf928242bae7c66ac6bfd35c4259d2ee647954f to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '35c7da32a5187bc3170bc1f038e4b3469b300d8ed70c3b1fe6a34e69cb6d640c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '7bc7b21755d48518ae06635eabf928242bae7c66ac6bfd35c4259d2ee647954f'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 35c7da32a5187bc3170bc1f038e4b3469b300d8ed70c3b1fe6a34e69cb6d640c -> 7bc7b21755d48518ae06635eabf928242bae7c66ac6bfd35c4259d2ee647954f as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3077 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3081 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3082 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3083 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3084 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3086 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3087 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3088 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3089 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3090 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3091 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3092 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3094 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3098 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3100 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3105 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package)
NOTE: Running task 3106 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3107 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3109 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3110 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3111 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3112 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3113 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3113 tasks of which 3053 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-282162014c232f41e12efbe517d02b75041578e4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:282162014c232f41e12efbe517d02b75041578e4"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 93 Local 49 Mirrors 0 Missed 44 Current 1059 (52% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1071 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 1072 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1085 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1088 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1091 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/kmod/30/temp/log.do_packagedata_setscene.904687
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1150 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_package_setscene: Started
NOTE: Running task 1832 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1152 of 1152 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2629 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: Running task 2635 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: Running task 2640 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: Running task 2672 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: Running task 2775 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: Running task 2799 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_recipe_qa)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: Running task 2906 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_write_config)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: Running task 2972 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2973 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3010 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Succeeded
NOTE: Running task 3011 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_fetch)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 3012 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 3013 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 3015 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_unpack)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: Running task 3016 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1643135a7ed0ef8842c7f0dd405511415ac6e09e1ea0798ace5d702873f40c92
NOTE: Running task 3042 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3052 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3053 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_patch)
NOTE: Running task 3054 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3055 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3056 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3057 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_lic)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 3058 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3059 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3060 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libsndfile1-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: Running task 3061 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b61b8c6b9f8fe2512f1b067fc9acff065964ed495736da2a7319057949c65276
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash fa3ff62d4cf44969828813c268363d64a38d7f72739fe80bb692c131476785ef to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'b7a3bb652a0fab13b8a794d9f421acadea2e13b37dcdf1e2b7a6437a8e9856ce', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'fa3ff62d4cf44969828813c268363d64a38d7f72739fe80bb692c131476785ef'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b7a3bb652a0fab13b8a794d9f421acadea2e13b37dcdf1e2b7a6437a8e9856ce -> fa3ff62d4cf44969828813c268363d64a38d7f72739fe80bb692c131476785ef as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3081 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_create_spdx)
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3083 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3084 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3085 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 3086 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3087 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3088 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3089 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3090 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: Running task 3091 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3093 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3094 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3095 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3096 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3099 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3100 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3101 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3102 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3105 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3106 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3107 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3109 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3110 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3111 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3112 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3113 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3114 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3115 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3118 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3120 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3121 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3122 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3123 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3124 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3125 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3126 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3127 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3128 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3129 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package)
NOTE: Running task 3130 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3131 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3132 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3133 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3134 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3135 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3136 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3137 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3137 tasks of which 3054 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6132305847352564860==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.5-1.22.6.patch"

RnJvbSAyY2JjZGE1NDE2OWI5YmFlODU2MWEzZDlkOWE0NGRhYzIzY2M2OWM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjo1NzoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1vbXg6IHVwZ3JhZGUgMS4yMi41IC0+IDEuMjIuNgoKLS0tCiAuLi4ve2dzdHJl
YW1lcjEuMC1vbXhfMS4yMi41LmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi42LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1vbXhfMS4y
Mi41LmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi42LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
NS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214
XzEuMjIuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
Ni5iYgppbmRleCA1ZDk5ODEwY2Q0Li4yNTc5YWEzZDY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjUuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi42
LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIAogU1JDX1VSSSA9ICJodHRw
czovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1vbXgvZ3N0LW9teC0ke1BWfS50
YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZjBjYjljNGRlMDZjNWQ2MmVlZjc3Y2Iz
MTIzOGJiYWYyNTdkYzg4ODAyMDEwMDcyZWVkZDFjMTY4ZjEzNmE0IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjIyMzgzM2M0MjUxOGFkN2ViMTkyM2JiNGRkMzcyNjgwOWY1OWE2NmQ2ZTlhYWFhNjlj
YjI5YWQwNzUwYzg3NTgiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3Qtb214LSR7UFZ9IgogCi0tIAoy
LjM5LjIKCg==

--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-282162014c232f41e12efbe517d02b75041578e4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:282162014c232f41e12efbe517d02b75041578e4"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 715 Local 677 Mirrors 0 Missed 38 Current 420 (94% match, 96% complete)
Removing 3 stale sstate objects for arch qemux86...done.
Removing 7 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 421 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 458 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package_setscene)
NOTE: Running setscene task 475 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 478 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_package_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 513 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 517 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 524 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 525 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 531 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 543 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: recipe curl-8.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 562 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 565 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 581 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_package_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_package_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1159 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 1163 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1210 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 1237 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1282 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 606 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1307 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_recipe_qa)
NOTE: Running task 1330 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: Running task 1343 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_write_config)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 607 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 612 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 617 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: Running task 1386 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 621 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: Running setscene task 625 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 626 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 636 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: Running setscene task 643 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1394 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1400 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 653 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 654 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1403 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1404 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: Running task 1405 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1421 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 1422 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running setscene task 678 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 1425 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_unpack)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 695 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 697 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_package_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 700 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1432 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 718 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 730 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1456 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 732 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 741 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 742 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 744 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1474 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_fetch)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 749 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 1482 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1483 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 754 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 762 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_fetch: Succeeded
NOTE: Running setscene task 771 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 1504 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 1510 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Started
NOTE: Running setscene task 784 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 789 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 792 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1521 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 800 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_lic unihash changed to f954aab960f3b7ffcd6cebd7ae7f9ecd1b629085fa9125fee491f8b48b9bef2a
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 806 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/kmod/30/temp/log.do_packagedata_setscene.1172192
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 812 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 816 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 829 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 835 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 839 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running task 1593 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_package_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 845 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 847 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 850 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1625 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1626 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 859 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 863 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 878 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 880 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 883 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 897 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 904 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 911 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 912 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1704 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 918 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 919 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 927 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 929 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running task 1743 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 938 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 939 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 941 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1754 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 946 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 955 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 958 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 965 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 967 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 968 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1801 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 977 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 979 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 980 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 981 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 991 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 994 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1005 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1008 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1009 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1014 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot unihash changed to 71907f4f1e29683f889e0ed2dcfd8166ec24ccb788b1b19394106de5de5644dc
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1822 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1029 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1034 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1039 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1040 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1045 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1050 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1058 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1060 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1062 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1064 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1071 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1073 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1910 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1078 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1079 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1081 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1931 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_configure)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1083 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1942 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_compile)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1087 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1095 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1097 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1099 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1969 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1101 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1102 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7351db59a76fe6687e6c58aac56fb00a612739e07148a4d24158e8e0ce78924c
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 275644df773f623536a1719fec7bda262504eece14b0615aeb083410216e0d9a to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '965ceca4743b97734df4878d8f77e7e13282e11b23d85b1e7b30929f7a071017', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '275644df773f623536a1719fec7bda262504eece14b0615aeb083410216e0d9a'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 965ceca4743b97734df4878d8f77e7e13282e11b23d85b1e7b30929f7a071017 -> 275644df773f623536a1719fec7bda262504eece14b0615aeb083410216e0d9a as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1107 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1108 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1109 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 1982 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 2002 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1130 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1135 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2470 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2783 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2877 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2915 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: Running task 2955 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: Running task 2984 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8a7bbd9a4ef3d606d2a093916bfc42cb5b7b2deee0a52b5db7efbe2c2c76485b
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3009 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe bluez5-5.69-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.69-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3027 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3028 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 3029 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 3031 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3034 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3035 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3038 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3039 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_install)
NOTE: recipe cargo-native-1.70.0-r0: task do_install: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3081 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot)
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot unihash changed to f010b5950d7680cf6431510857fd562f29053260f3b5f4b8aab4d4d90f592e3f
NOTE: Setscene tasks completed
NOTE: Running task 3041 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3042 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3043 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_configure)
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 3044 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_compile)
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_install)
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3048 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3049 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3050 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package: Succeeded
NOTE: Running task 3051 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3052 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3053 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3054 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3055 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3058 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3059 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3060 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3061 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3062 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3066 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3068 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3069 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3070 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3071 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3073 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package)
NOTE: Running task 3074 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3077 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3078 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3079 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3080 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3081 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3081 tasks of which 2978 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6132305847352564860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-282162014c232f41e12efbe517d02b75041578e4"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:282162014c232f41e12efbe517d02b75041578e4"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 47 Mirrors 0 Missed 38 Current 1043 (55% match, 96% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1057 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 1058 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1074 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/kmod/30/temp/log.do_packagedata_setscene.1028558
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1126 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_setscene)
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_package_setscene: Started
NOTE: Running task 1821 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1128 of 1128 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running task 2576 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2611 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_recipe_qa)
NOTE: Running task 2650 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2730 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_recipe_qa)
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2750 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Started
NOTE: Running task 2851 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2940 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Started
NOTE: Running task 2941 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2942 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: Running task 2943 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2950 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_fetch)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2951 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2952 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2953 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2955 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2956 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1b8ac91861a0f2c5c171540a5748a6ed90e24a5891f0a487d79f02ad63ce0770
NOTE: Running task 2991 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 2992 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2993 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2994 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2995 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: Running task 2996 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2997 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2998 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0d4103f1bca9844c30c64cd0a758b174d707f3ff7e833e2ec3ed74f2386b5c0e
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 0945cbbe8eb04928ca4ff5d12564c4924b78a328311e69ce969f6ec37b06b3ca to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'a344a209150eaa10ce8c0491ffa72fbc4e4b52b3a2e6316aa31237b84ba5dce7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '0945cbbe8eb04928ca4ff5d12564c4924b78a328311e69ce969f6ec37b06b3ca'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a344a209150eaa10ce8c0491ffa72fbc4e4b52b3a2e6316aa31237b84ba5dce7 -> 0945cbbe8eb04928ca4ff5d12564c4924b78a328311e69ce969f6ec37b06b3ca as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3017 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_create_spdx)
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3020 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3021 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 3022 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3023 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3024 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.69-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3025 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3027 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3029 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 3030 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3033 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3036 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 3037 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 3038 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 3039 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3040 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_create_spdx)
NOTE: Running task 3041 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libomxil-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3043 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3044 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3045 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3046 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3048 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3049 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3050 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3051 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3052 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3053 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3054 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3055 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3056 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3059 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3060 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package)
NOTE: Running task 3061 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3062 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3063 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3064 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3065 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3066 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3067 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-omx-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 3068 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3068 tasks of which 2993 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-src went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dbg went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package libkmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-staticdev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-dev went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-doc went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-locale went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: QA Issue: Package version for package kmod-bash-completion went backwards which would break package feeds (from 0:31-r0 to 0:30-r0) [version-going-backwards]
ERROR: kmod-30-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6132305847352564860==--

