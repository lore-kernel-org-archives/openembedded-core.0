Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FBFC54E60
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20185.1708018347157682077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YO+PpTB7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cV1EGGRP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd3aa83-8f28e208-8da5-4057-916c-5f87e3a328aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=+6yqj0eVeiLMXefJmGz9M9eED8ozebuyGevQ1Psh904=;
	b=YO+PpTB70Got5osxnlGbOAMI32wNqVqxUkk7ukssHKtP/TRCm5kde+A866pmE0yY
	JKqix/Ve5FIWt/Xhpjt1VD6LyLQKHrXpO0fMh/PFAU6SaSw12Z0+23jwF7k6I7jUblr
	QRCwTu9UDrv4cherurOdXDGNrxJiAN2RtsI/39co=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=+6yqj0eVeiLMXefJmGz9M9eED8ozebuyGevQ1Psh904=;
	b=cV1EGGRPPiylDdPpaZq6tKAJekTv+7iH9Y2yIN6CxCEZsbMUto1sGkpMKqLhrF/o
	rp5qfUY8HZ1WZO2jTKt/MoIazqfHYljB8Zzau6p0iJkbnM3AVC/adV2QgKP0U+OftWS
	H+sIuVr5CucZCkF+Rd+ql3YS0VpQYcW2/7euL2xM=
Content-Type: multipart/mixed; boundary="===============7328367034579725519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxvmc: upgrading to 1.0.14 SUCCEEDED
Message-ID: <0101018dadd3aa83-8f28e208-8da5-4057-916c-5f87e3a328aa-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195638

--===============7328367034579725519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxvmc* to *1.0.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxvmc-upgrade-1.0.13-1.0.14.patch
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
From 71e8029c69803a0bdda1ebd51fe00ae49ce6b9cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:25:55 +0000
Subject: [PATCH] libxvmc: upgrade 1.0.13 -> 1.0.14

---
 .../xorg-lib/{libxvmc_1.0.13.bb => libxvmc_1.0.14.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.13.bb => libxvmc_1.0.14.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
index d6d009831a..af18afc62d 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
@@ -16,4 +16,4 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[sha256sum] = "0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c"
+SRC_URI[sha256sum] = "e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9"
-- 
2.42.0


--===============7328367034579725519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxvmc: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXvMC-1.0.13.tar.xz" to "https://www.x.org/releases//individual/lib/libXvMC-1.0.14.tar.xz"
packages/core2-64-poky-linux/libxvmc: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc-dbg: PKGSIZE changed from 107640 to 107024 (-1%)
packages/core2-64-poky-linux/libxvmc/libxvmc-dbg: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc-dbg: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc-dev: PKGSIZE changed from 10306 to 12319 (+20%)
packages/core2-64-poky-linux/libxvmc/libxvmc-dev: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc-dev: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc-doc: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc-doc: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc-locale: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc-locale: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc-src: PKGSIZE changed from 46269 to 51706 (+12%)
packages/core2-64-poky-linux/libxvmc/libxvmc-src: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc-src: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc-staticdev: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc-staticdev: PKGV changed from 1.0.13 [default] to 1.0.14 [default]
packages/core2-64-poky-linux/libxvmc/libxvmc: PV changed from "1.0.13" to "1.0.14"
packages/core2-64-poky-linux/libxvmc/libxvmc: PKGV changed from 1.0.13 [default] to 1.0.14 [default]

--===============7328367034579725519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 17 recipes from the core2-64 sysroot...done.
Removing 16 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cdc5770d68a73f065718b6c9133285bb8087b912"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cdc5770d68a73f065718b6c9133285bb8087b912"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 218 Local 206 Mirrors 0 Missed 12 Current 220 (94% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 229 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 712 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_recipe_qa)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 317 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 318 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_recipe_qa: Succeeded
NOTE: Running task 747 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 748 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_unpack)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 754 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxext/1.3.5/temp/log.do_packagedata_setscene.3858459
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 334 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 335 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 755 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 756 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_populate_lic)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_populate_lic: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 337 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_populate_lic unihash changed to 37543bc1a311fa29f53c5dbcf5a713f84932b32a067db71f8386d486ee878359
NOTE: recipe libxvmc-1_1.0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 348 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 357 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 384 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 385 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 406 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 427 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 428 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 433 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 438 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1213 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: Running task 1223 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1239 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1245 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_configure: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_compile)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_compile: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1247 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_install)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_install: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_install: Succeeded
NOTE: Running task 1248 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_package)
NOTE: Running task 1249 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_populate_sysroot)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package: Succeeded
NOTE: Running task 1250 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_packagedata)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_packagedata: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 1251 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_create_spdx)
NOTE: Running task 1252 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_package_write_ipk)
NOTE: Running task 1253 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_package_write_deb)
NOTE: Running task 1254 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_package_write_rpm)
NOTE: Running task 1255 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_package_qa)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_create_spdx: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_write_ipk: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_write_deb: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_write_rpm: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_qa: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 1256 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_create_runtime_spdx)
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_qa: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_create_runtime_spdx: Started
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_write_deb: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libxvmc-1_1.0.14-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1257 of 1257 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb:do_build)
NOTE: Tasks Summary: Attempted 1257 tasks of which 1235 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext-src went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext-dbg went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext-staticdev went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext-dev went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext-doc went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext-locale went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxext went backwards which would break package feeds (from 1:1.3.6-r0 to 1:1.3.5-r0) [version-going-backwards]
ERROR: libxext-1_1.3.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7328367034579725519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libxvmc/libxvmc-dev: PKGSIZE changed from 10306 to 12319 (+20%)
packages/core2-64-poky-linux/libxvmc/libxvmc-src: PKGSIZE changed from 46269 to 51706 (+12%)

--===============7328367034579725519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxvmc-upgrade-1.0.13-1.0.14.patch"

RnJvbSA3MWU4MDI5YzY5ODAzYTBiZGRhMWViZDUxZmUwMGFlNDljZTZiOWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MjU6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4dm1jOiB1cGdyYWRlIDEuMC4xMyAtPiAxLjAuMTQKCi0tLQogLi4uL3hvcmctbGliL3tsaWJ4
dm1jXzEuMC4xMy5iYiA9PiBsaWJ4dm1jXzEuMC4xNC5iYn0gICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4dm1jXzEuMC4xMy5iYiA9PiBsaWJ4dm1jXzEu
MC4xNC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1s
aWIvbGlieHZtY18xLjAuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGli
eHZtY18xLjAuMTQuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnh2bWNfMS4wLjEzLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHZtY18xLjAuMTQuYmIKaW5kZXggZDZkMDA5ODMx
YS4uYWYxOGFmYzYyZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L2xpYnh2bWNfMS4wLjEzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4dm1jXzEuMC4xNC5iYgpAQCAtMTYsNCArMTYsNCBAQCBQRSA9ICIxIgogCiBYT1JHX1BOID0g
ImxpYlh2TUMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwYTllYmU2ZGVhNzg4OGE3NDdlNWFj
YTFiODkxZDUzY2Q3ZDNhNWYxNDFhOTY0NWY3N2Q5YjZhMTJjZWU2NTdjIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImU0YmU5ZWI2YjZiYWZkYmJmODFmNDdmNzE2MzA0NzIxNTM3NmU0NWUyZGM3ODZk
MGVhNjE4MWM5MzA3MjVlZDkiCi0tIAoyLjQyLjAKCg==

--===============7328367034579725519==--

