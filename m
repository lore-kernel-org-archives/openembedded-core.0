Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA618C4708C
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.19056.1652634914762416163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L+UXOavt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180c8b78d5c-7738e0be-7bc9-4bff-b031-ae415414093f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FIYZBno7EEo+o2pZJsSky03VGJ/c5TbDgcAMjxG9joU=;
	b=L+UXOavts2KagVrAoVIJ/dIvARcawYehkASJutpp+EZl6jJQ1wXNhLxEXfspAsBd
	kiCAfjDeVRfyKzKxJfYvQPrvoMoGRwKappOr0jbuhfBzRfMhM3P5V5VUCCHs8cTW1r4
	k/cel6O+XlYyPsAFVJwnfQ2J63xZOU6H6BPOeTgI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FIYZBno7EEo+o2pZJsSky03VGJ/c5TbDgcAMjxG9joU=;
	b=ZffpE5UYUaPf71ucVSaguxoADbohCnRblLZWcaXtO7kMCXaFT72U5qpEH+29uE9+
	Ve7c1QfNUbGS5rjIncGB4fjrD8uCowhu7iHQHtxS9zKrS9i8YJv4jbFNYuurKTlo9uz
	Cn4F+Ejl2kl+3mu3x3KgG3oGngnNWfoLUEVRi8WI=
Content-Type: multipart/mixed; boundary="===============8172898145212337535=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.20.2 SUCCEEDED
Message-ID: 
 <01010180c8b78d5c-7738e0be-7bc9-4bff-b031-ae415414093f-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:14 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165650

--===============8172898145212337535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.20.1-1.20.2.patch
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
--===============8172898145212337535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGSIZE changed from 2824563 to 2824564 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.2.tar.xz"

--===============8172898145212337535==
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
DISTRO_VERSION       = "4.1+snapshot-d233dd5a233103bc44fa36469fedf12712fd396a"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d233dd5a233103bc44fa36469fedf12712fd396a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 6 Mirrors 0 Missed 17 Current 672 (26% match, 97% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1500 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2194 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2195 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2264 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_fetch)
NOTE: Running task 2328 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2329 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2363 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2369 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2370 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: Running task 2371 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2372 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2373 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 2374 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 2375 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2376 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 2377 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic unihash changed to 77f0b65ca836de1a66bd9ed46cb7b86eeb0fe28fbff93989fb10a0421bf8b741
NOTE: Running task 2378 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2379 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2381 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a4787267b87206a3556ff21db492c8420179d3f57dc576d54ca82181b3451039
NOTE: Running task 2417 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2418 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 28be58ea1d4240f61f1260f01f80546cbd160e229b27b92a1e15091dc485182c
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2430 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2438 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2439 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2440 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2444 tasks of which 2406 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.20.1-r0/temp/log.do_packagedata.1089135
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata) failed with exit code '1'

--===============8172898145212337535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1643 targets, 50 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-d233dd5a233103bc44fa36469fedf12712fd396a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d233dd5a233103bc44fa36469fedf12712fd396a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 451 Local 434 Mirrors 0 Missed 17 Current 237 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 238 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.211.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 265 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running task 1042 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 1053 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_fetch)
NOTE: Running task 1075 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 1076 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 1079 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_write_config)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.83.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe curl-7.83.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: Running task 1081 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1082 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 281 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 287 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.211.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: Running setscene task 300 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.211.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Started
NOTE: recipe curl-7.83.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 309 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.83.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1122 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running setscene task 315 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1127 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 320 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.211.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Started
NOTE: Running setscene task 336 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 339 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 347 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1166 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic)
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 369 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1172 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1222 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1223 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic unihash changed to 77f0b65ca836de1a66bd9ed46cb7b86eeb0fe28fbff93989fb10a0421bf8b741
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 416 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 419 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1254 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1265 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe harfbuzz-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1298 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 452 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 455 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1318 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: Running setscene task 463 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1319 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 491 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 496 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 499 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 534 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 555 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 586 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 599 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1478 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 626 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 663 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1538 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running setscene task 670 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8c0691f0945b009f993205392e59010ba497d8415ae4e9943228fe5fb2af71d
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1985 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2315 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5222dc792bd3f4e0758968f1352e0a0c9f0b94c2b4a6a4ede8bba4817b7bc9d0
NOTE: Running task 2388 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2398 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2404 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2409 tasks of which 2365 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.20.1-r0/temp/log.do_packagedata.1131172
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata) failed with exit code '1'

--===============8172898145212337535==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.20.1-1.20.2.patch"

From 395b9669f2c117e4b48688aeefec78ad68c76998 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 15:35:44 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.20.1 -> 1.20.2

---
 ...streamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
index 48b571f563..40dc21cf45 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137"
+SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.31.1


--===============8172898145212337535==
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
DISTRO_VERSION       = "4.1+snapshot-d233dd5a233103bc44fa36469fedf12712fd396a"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d233dd5a233103bc44fa36469fedf12712fd396a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 6 Mirrors 0 Missed 17 Current 662 (26% match, 97% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 681 of 685 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1490 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2162 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2163 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2230 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_fetch)
NOTE: Running task 2292 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2293 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2327 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Started
NOTE: Running task 2333 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2334 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Started
NOTE: Running task 2335 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2336 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2337 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 2338 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 2339 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2340 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2341 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2342 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic unihash changed to 77f0b65ca836de1a66bd9ed46cb7b86eeb0fe28fbff93989fb10a0421bf8b741
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2343 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2344 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2345 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b66cac58edb771b109ed64655cea5c8c334aeae1090430b4b9cb3a7493c0551c
NOTE: Running task 2381 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2382 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 359f8d35f3643abf6826e617d0d167fcf8b19ee2957168c556ba750cc012b0b5
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2401 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2402 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2403 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2407 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2408 tasks of which 2370 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.20.1-r0/temp/log.do_packagedata.1062562
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata) failed with exit code '1'

--===============8172898145212337535==
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
DISTRO_VERSION       = "4.1+snapshot-d233dd5a233103bc44fa36469fedf12712fd396a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d233dd5a233103bc44fa36469fedf12712fd396a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 6 Mirrors 0 Missed 17 Current 676 (26% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 695 of 699 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1499 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2212 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2213 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2282 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_fetch)
NOTE: Running task 2346 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2347 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2381 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2387 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2388 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Started
NOTE: Running task 2389 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: Running task 2390 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2391 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 2392 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 2393 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2394 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic unihash changed to 77f0b65ca836de1a66bd9ed46cb7b86eeb0fe28fbff93989fb10a0421bf8b741
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2395 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2396 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2397 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2398 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2399 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fb3c8441b8c6896d1bfcca1c31c63967fd6ebadcd0412c4032d25462e0061156
NOTE: Running task 2435 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2436 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d6da3a62e28efee8ad4a3cb235af3b2f838f70686182e5facfbed9881e307e9c
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: Running task 2448 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2449 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2450 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2451 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2452 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2456 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2462 of 2467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2462 tasks of which 2424 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.20.1-r0/temp/log.do_packagedata.1009387
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata) failed with exit code '1'

--===============8172898145212337535==
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
DISTRO_VERSION       = "4.1+snapshot-d233dd5a233103bc44fa36469fedf12712fd396a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d233dd5a233103bc44fa36469fedf12712fd396a"
workspace            = "master:fea9e46d39ef43967aead86fa537bca449290253"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 6 Mirrors 0 Missed 17 Current 672 (26% match, 97% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1499 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2194 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_fetch)
NOTE: Running task 2195 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2264 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_fetch)
NOTE: Running task 2328 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_write_config)
NOTE: Running task 2329 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2363 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Started
NOTE: Running task 2369 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_fetch: Succeeded
NOTE: Running task 2370 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2371 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Started
NOTE: Running task 2372 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2373 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_unpack: Succeeded
NOTE: Running task 2374 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_patch: Succeeded
NOTE: Running task 2375 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2376 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2377 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2378 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_lic unihash changed to 77f0b65ca836de1a66bd9ed46cb7b86eeb0fe28fbff93989fb10a0421bf8b741
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2379 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2381 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ee9ea557f16a8e77018ceb5e8d08eafa1b980af31ebf807d01b8efc24788c202
NOTE: Running task 2417 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2418 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 67a4fc9c78a3cceb1476f59eee38eb091258cfd494b23b9668e50c7fa8ef4384
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2430 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_populate_sysroot)
NOTE: Running task 2438 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2439 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2440 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2449 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2444 tasks of which 2406 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.2-r0 to 0:1.20.1-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.20.1-r0/temp/log.do_packagedata.1035959
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb:do_packagedata) failed with exit code '1'

--===============8172898145212337535==--

