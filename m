Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71170E748F8
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.65017.1696183990731563320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UbMk/xWB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iz0Ak5LG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018aec71be9c-3b68b7e2-bec1-4036-81a9-b624e3545ecc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hmLFWlY6Rf8xf1YpDQV7ErqcRDWfxN7E8E9EbAWKHT4=;
	b=UbMk/xWBJDuLlnmNVDY/vBAVIwGJrHP9ERh9HiSKrF2UQVi7De7eqiqvyoxghGz+
	8CYBf4GX2GOnfNl4WiMjKQjJkD9OOaJXpeNbCD60iPUBm1JGpVuqbVHtgrEVJXf9Q5A
	+hHUH8AYvkfbe/pHkiVRSpDLNvlJi0ve4YwB2kqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hmLFWlY6Rf8xf1YpDQV7ErqcRDWfxN7E8E9EbAWKHT4=;
	b=iz0Ak5LGk1rBE1z1bMwDOOqvt1/ktwlnQxyPjw95tpSUJVVscYPac5uU/au3aakV
	oy1BZtAErwekriCKor6/kNO0avNKovRzzHFnbUNH2W4caUIbL8rbpfAP0ssLjz4DfrR
	jcQhFz6hoPrnGiyz0NLhtsz7kf1S3bGISDutP8Fs=
Content-Type: multipart/mixed; boundary="===============3222706072724484608=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.6 SUCCEEDED
Message-ID: <0101018aec71be9c-3b68b7e2-bec1-4036-81a9-b624e3545ecc-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188588

--===============3222706072724484608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.5-1.22.6.patch
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
From 9c7e97ec67d062d73af10e3eba08050bde6009fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 17:48:15 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.22.5 -> 1.22.6

---
 ...streamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
index 231d252323..bf4c105057 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a9a550267c9584df0e8c70434d30476e8fd0018b733c1c1ee33deaf422bdb24b"
+SRC_URI[sha256sum] = "d9ba2fc26bef98c78e982c599f585d46bbb65fe122da89c2d7ab41f468a52c7b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.39.2


--===============3222706072724484608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.22.5" to "1.22.6"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.6.tar.xz"

--===============3222706072724484608==
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
DISTRO_VERSION       = "4.2+snapshot-e969935a7ea5e788a56027fb6754045aaa024116"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e969935a7ea5e788a56027fb6754045aaa024116"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 50 Mirrors 0 Missed 20 Current 1073 (71% match, 98% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1092 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1104 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1140 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1837 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.22.5/temp/log.do_packagedata_setscene.2637741
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1141 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2712 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2792 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2849 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2917 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2983 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: Running task 2984 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3012 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3013 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 3014 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3015 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 3016 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4efe0923fdf84ab962f1d152997314acb2fb28e00680a8149c544bc5fdcd305a
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3051 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3052 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3053 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3054 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3055 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1143 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 3058 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5339aca9e47bec61a99da666aee686851063e3a76b9253d6a6c82553ae0f493a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 556a7d2305374f356b0e7693210d7ad52b63a3e7a7a4c73ff0258915bac54cd8 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'e648b42e619ed2cc3abc171fdec0d6bcdf33153c390bf8ba64354b486576269f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '556a7d2305374f356b0e7693210d7ad52b63a3e7a7a4c73ff0258915bac54cd8'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed e648b42e619ed2cc3abc171fdec0d6bcdf33153c390bf8ba64354b486576269f -> 556a7d2305374f356b0e7693210d7ad52b63a3e7a7a4c73ff0258915bac54cd8 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3081 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3093 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3098 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3100 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3101 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3102 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3103 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3104 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3105 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3106 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package)
NOTE: Running task 3107 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3109 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_spdx)
NOTE: Running task 3110 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3111 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3112 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3113 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3113 tasks of which 3073 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3222706072724484608==
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
DISTRO_VERSION       = "4.2+snapshot-e969935a7ea5e788a56027fb6754045aaa024116"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e969935a7ea5e788a56027fb6754045aaa024116"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 50 Mirrors 0 Missed 20 Current 1073 (71% match, 98% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1092 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1104 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1140 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1836 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.22.5/temp/log.do_packagedata_setscene.2623643
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1141 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2712 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2792 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2849 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2917 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_write_config)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 3010 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3011 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3012 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3013 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Started
NOTE: Running task 3014 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3015 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 3016 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ca904cc12661e9ff90c127b846ed13e446994b8ea6f02608921a9a3e91322e85
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3051 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3052 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3053 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3054 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3055 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1143 of 1143 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 3058 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 211e462a1e5567354a6419194e4f8bd8b7dae95ee7ba36a440d71779fe8aacbc
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash c3d0c87e50b0aedf9204c93821f6ffa3c3ef8c354d6cafaaa23d0de95ea5348d to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '6d3d719e29b84a2b0d750c6585930b2d5094a0df9e6fa61a0f294c5e176a0c05', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'c3d0c87e50b0aedf9204c93821f6ffa3c3ef8c354d6cafaaa23d0de95ea5348d'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 6d3d719e29b84a2b0d750c6585930b2d5094a0df9e6fa61a0f294c5e176a0c05 -> c3d0c87e50b0aedf9204c93821f6ffa3c3ef8c354d6cafaaa23d0de95ea5348d as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3081 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3093 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3098 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3100 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3101 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3102 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3103 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3104 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3105 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3106 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package)
NOTE: Running task 3107 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3109 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_spdx)
NOTE: Running task 3110 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3111 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3112 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3113 of 3113 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3113 tasks of which 3073 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3222706072724484608==
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
DISTRO_VERSION       = "4.2+snapshot-e969935a7ea5e788a56027fb6754045aaa024116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e969935a7ea5e788a56027fb6754045aaa024116"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 50 Mirrors 0 Missed 20 Current 1081 (71% match, 98% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1100 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1112 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1148 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1836 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.22.5/temp/log.do_packagedata_setscene.2616611
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1149 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2732 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 2812 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2869 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2937 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_write_config)
NOTE: Running task 2947 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2948 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3036 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3037 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Started
NOTE: Running task 3038 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: Running task 3039 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 3040 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1643135a7ed0ef8842c7f0dd405511415ac6e09e1ea0798ace5d702873f40c92
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3075 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3076 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3077 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3078 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3079 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running setscene task 1151 of 1151 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 3082 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b61b8c6b9f8fe2512f1b067fc9acff065964ed495736da2a7319057949c65276
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 942a1bd8ade83f60f7e4ecc28f9d8d9b5ec2b896c5b2bef278e2758d9d23be3b to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '8a0685baa47e574d50da92b070d43ebd3022d64a3f2e3bf6120cda53c0ecfd7f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '942a1bd8ade83f60f7e4ecc28f9d8d9b5ec2b896c5b2bef278e2758d9d23be3b'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 8a0685baa47e574d50da92b070d43ebd3022d64a3f2e3bf6120cda53c0ecfd7f -> 942a1bd8ade83f60f7e4ecc28f9d8d9b5ec2b896c5b2bef278e2758d9d23be3b as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3105 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3117 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3119 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3120 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3121 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3122 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3123 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3124 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3125 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3126 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3127 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3128 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3130 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package)
NOTE: Running task 3131 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3132 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3133 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_spdx)
NOTE: Running task 3134 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3135 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3136 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3137 of 3137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3137 tasks of which 3097 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3222706072724484608==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.5-1.22.6.patch"

RnJvbSA5YzdlOTdlYzY3ZDA2MmQ3M2FmMTBlM2ViYTA4MDUwYmRlNjAwOWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNzo0ODoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjIyLjUgLT4gMS4yMi42CgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuNS5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi42LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuNS5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi42LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMi41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjIyLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjIyLjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yMi42LmJiCmluZGV4IDIzMWQyNTIzMjMuLmJmNGMxMDUwNTcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yMi41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi42LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YTlhNTUwMjY3Yzk1ODRkZjBlOGM3MDQzNGQzMDQ3NmU4ZmQwMDE4YjczM2MxYzFlZTMzZGVhZjQy
MmJkYjI0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkOWJhMmZjMjZiZWY5OGM3OGU5ODJjNTk5
ZjU4NWQ0NmJiYjY1ZmUxMjJkYTg5YzJkN2FiNDFmNDY4YTUyYzdiIgogCiBTID0gIiR7V09SS0RJ
Un0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjM5LjIK
Cg==

--===============3222706072724484608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1844 targets, 50 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-e969935a7ea5e788a56027fb6754045aaa024116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e969935a7ea5e788a56027fb6754045aaa024116"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 711 Local 691 Mirrors 0 Missed 20 Current 423 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 477 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 501 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1260 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: Running task 1276 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_recipe_qa)
NOTE: Running task 1297 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 1310 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 521 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1353 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: Running task 1354 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 546 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 1355 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1356 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 550 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 1358 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 1359 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1360 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_lic)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1361 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.22.5/temp/log.do_packagedata_setscene.2645136
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 569 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_lic unihash changed to ec442f9561b6ba90c6c2ad0dde1ff25cf0bbce67e1a36ca14b2a71446cd07d67
NOTE: Running setscene task 579 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 589 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 620 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 623 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 659 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe curl-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 671 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 680 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 684 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 716 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 766 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 767 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1506 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 780 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1570 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1571 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 790 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 791 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 797 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 813 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1591 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 820 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 825 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1637 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 840 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 845 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 851 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running task 1656 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1672 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 880 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 882 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 898 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 902 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 904 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 905 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 913 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 915 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 918 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running task 1746 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 922 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 923 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 927 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 938 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 951 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 953 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 958 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 959 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 963 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 971 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 973 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 974 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 993 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 994 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 995 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1012 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1016 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1019 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1020 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1021 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1038 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1039 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1041 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1043 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1044 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1050 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1052 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1058 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1059 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1061 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1065 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1068 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1072 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1073 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1077 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1942 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7351db59a76fe6687e6c58aac56fb00a612739e07148a4d24158e8e0ce78924c
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash bc8b80fddf56e09d0c65be74014debda6485064444efc7895da2260a79c33498 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '907a6189fab2b0c4b895764d8e7df577e75626b1cb2a14ecefff3c42096e65b9', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'bc8b80fddf56e09d0c65be74014debda6485064444efc7895da2260a79c33498'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 907a6189fab2b0c4b895764d8e7df577e75626b1cb2a14ecefff3c42096e65b9 -> bc8b80fddf56e09d0c65be74014debda6485064444efc7895da2260a79c33498 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1084 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1093 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1096 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1098 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1101 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1106 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1109 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1110 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1112 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1124 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1125 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1128 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1129 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1134 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2477 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2915 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3029 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8a7bbd9a4ef3d606d2a093916bfc42cb5b7b2deee0a52b5db7efbe2c2c76485b
NOTE: Running task 3055 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3061 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3066 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3068 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3069 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3071 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3072 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3073 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3074 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package)
NOTE: Running task 3075 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3076 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3077 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_spdx)
NOTE: Running task 3078 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3079 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3080 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3081 of 3081 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3081 tasks of which 3035 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3222706072724484608==
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
DISTRO_VERSION       = "4.2+snapshot-e969935a7ea5e788a56027fb6754045aaa024116"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e969935a7ea5e788a56027fb6754045aaa024116"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 50 Mirrors 0 Missed 20 Current 1057 (71% match, 98% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1076 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1088 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1124 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1825 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.22.5/temp/log.do_packagedata_setscene.2630719
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1125 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package_setscene)
NOTE: Running task 2675 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Started
NOTE: Running task 2753 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_recipe_qa)
NOTE: Running task 2810 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_write_config)
NOTE: Running task 2876 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2965 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Started
NOTE: Running task 2966 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2967 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2968 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_fetch)
NOTE: recipe libva-2.19.0-r0: task do_fetch: Started
NOTE: recipe libva-2.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 2969 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Started
NOTE: Running task 2970 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_fetch: Succeeded
NOTE: Running task 2971 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_unpack)
NOTE: recipe libva-2.19.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1b8ac91861a0f2c5c171540a5748a6ed90e24a5891f0a487d79f02ad63ce0770
NOTE: recipe libva-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 3006 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_patch)
NOTE: Running task 3007 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_unpack: Succeeded
NOTE: Running task 3008 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_patch)
NOTE: recipe libva-2.19.0-r0: task do_patch: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_patch: Succeeded
NOTE: Running task 3009 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3010 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3011 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3012 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1127 of 1127 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0d4103f1bca9844c30c64cd0a758b174d707f3ff7e833e2ec3ed74f2386b5c0e
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f172c9df14a713df7a67c9a42c0064e974fa6bab39f32e3e34c15096f5540acb to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '22c7a56d09858d7e19e97c358ce06d6f5c7fcc1f30ddf4bb500bcd620ed51358', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f172c9df14a713df7a67c9a42c0064e974fa6bab39f32e3e34c15096f5540acb'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 22c7a56d09858d7e19e97c358ce06d6f5c7fcc1f30ddf4bb500bcd620ed51358 -> f172c9df14a713df7a67c9a42c0064e974fa6bab39f32e3e34c15096f5540acb as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libva-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3035 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3046 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 3050 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_compile)
NOTE: recipe libva-2.19.0-r0: task do_compile: Started
NOTE: recipe libva-2.19.0-r0: task do_compile: Succeeded
NOTE: Running task 3051 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_install)
NOTE: recipe libva-2.19.0-r0: task do_install: Started
NOTE: recipe libva-2.19.0-r0: task do_install: Succeeded
NOTE: Running task 3052 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_package)
NOTE: Running task 3053 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_populate_sysroot)
NOTE: recipe libva-2.19.0-r0: task do_package: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3054 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3055 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Started
NOTE: recipe libva-2.19.0-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_packagedata)
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.19.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3057 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.19.0.bb:do_create_spdx)
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Started
NOTE: recipe libva-2.19.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3058 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_configure: Succeeded
NOTE: Running task 3059 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package)
NOTE: Running task 3062 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package: Succeeded
NOTE: Running task 3063 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3064 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_spdx)
NOTE: Running task 3065 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_write_rpm)
NOTE: Running task 3066 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3067 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_create_runtime_spdx)
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3068 of 3068 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3068 tasks of which 3028 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.6-r0 to 0:1.22.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3222706072724484608==--

