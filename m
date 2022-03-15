Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63596C47086
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10589.1647349734950566480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GSsCxs8J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017f8db22223-d4d2c804-ee9e-4832-aa0b-c9874120ceb0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n3mQMDhFq+BHk/w2mJk10TTXKGdVZxMvRvENrurTjqY=;
	b=GSsCxs8JvfwH1tR0QdXUkO+GqN9l2PP7RHvLlVA0x0PCFIySUNHz2Z/dONuJ+mg9
	orSQbrhmW5P9KmnXM22wi0fIfGTqyRdIaqCcnDrkpOdubxd2xbFV8anQaT8asdiDeaO
	mwQB8E05PJ96CGr1hYQ7hKjFvoEg5DRHin5dt660=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349736;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n3mQMDhFq+BHk/w2mJk10TTXKGdVZxMvRvENrurTjqY=;
	b=ZcOkNcUC0kDFh1chIgfv2+xQ5hzkkgvBg6DbgxCr8BuYtCuVNgDVHuImB3t5w4eA
	/bt9GjapF007kKqWKu2r/jtuQ6E4os+ijca61EvTQ9q0hNurL9WjHXYo/pKqD99wOpF
	71uBn1erRV1zLCspiHHCW3kJRgDRsCCS+hkGYP8U=
Content-Type: multipart/mixed; boundary="===============3150699064807694508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.20.1 SUCCEEDED
Message-ID: 
 <0101017f8db22223-d4d2c804-ee9e-4832-aa0b-c9874120ceb0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:56 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163282

--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.20.0-1.20.1.patch
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
--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.20.0 [default] to 1.20.1 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.20.0" to "1.20.1"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.1.tar.xz"

--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-248b51b856139aa8e1807ccb4f6872096462ee05"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:248b51b856139aa8e1807ccb4f6872096462ee05"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 7 Mirrors 0 Missed 17 Current 671 (29% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 690 of 695 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2138 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2139 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 2180 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_fetch)
NOTE: Running task 2236 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2237 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2260 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: Running task 2265 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2266 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: Running task 2267 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 2268 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2269 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2272 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Started
NOTE: Running task 2273 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2274 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2275 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: Running task 2276 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic unihash changed to 37ab6dd291f6fdd51b4b0b4b435a7433388709c196deb95eb9baf19001328e0d
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2388 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2389 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d25d3c26c678c93d22c45641c2dcd551821a8aa1afdac7a764ed3ac034eb65e6
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2426 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2427 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2428 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2429 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2430 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2431 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2435 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2436 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2437 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2438 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2439 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2440 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2441 of 2446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2441 tasks of which 2403 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.20.0-r0/temp/log.do_packagedata.2812978
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata) failed with exit code '1'

--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-248b51b856139aa8e1807ccb4f6872096462ee05"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:248b51b856139aa8e1807ccb4f6872096462ee05"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 7 Mirrors 0 Missed 17 Current 657 (29% match, 97% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 676 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2086 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 2087 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2128 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_fetch)
NOTE: Running task 2182 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2183 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2206 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Started
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 2211 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2212 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_unpack)
NOTE: Running task 2213 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 2214 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2215 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2216 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2217 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2218 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2219 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2220 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2221 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2222 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic unihash changed to 37ab6dd291f6fdd51b4b0b4b435a7433388709c196deb95eb9baf19001328e0d
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2223 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: Running task 2333 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2335 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3d10e13db30fbd57f74e3cdf7abcd55c19a02df807945b0d76c501e33b62027f
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2373 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2376 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2378 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2379 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2381 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2382 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2383 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2392 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2387 tasks of which 2349 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.20.0-r0/temp/log.do_packagedata.2866472
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata) failed with exit code '1'

--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-248b51b856139aa8e1807ccb4f6872096462ee05"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:248b51b856139aa8e1807ccb4f6872096462ee05"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 7 Mirrors 0 Missed 17 Current 667 (29% match, 97% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 686 of 691 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2120 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2121 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 2162 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_fetch)
NOTE: Running task 2218 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2219 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2242 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 2247 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Started
NOTE: Running task 2248 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: Running task 2249 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 2250 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2251 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2252 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2253 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2254 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2255 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2256 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2257 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2258 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic unihash changed to 37ab6dd291f6fdd51b4b0b4b435a7433388709c196deb95eb9baf19001328e0d
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2259 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2370 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2371 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ef4803d6d46aaa652317dde5016660c3c9bfb4f26fb5b82a00119f969712810f
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2417 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2423 tasks of which 2385 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.20.0-r0/temp/log.do_packagedata.2893175
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata) failed with exit code '1'

--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1521 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-248b51b856139aa8e1807ccb4f6872096462ee05"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:248b51b856139aa8e1807ccb4f6872096462ee05"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 7 Mirrors 0 Missed 17 Current 667 (29% match, 97% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 686 of 691 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2120 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: Running task 2121 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2162 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_fetch)
NOTE: Running task 2218 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 2219 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2242 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: Running task 2247 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2248 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2249 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: Running task 2250 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2251 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 2252 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 2253 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2254 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2255 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2256 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2257 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2258 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic unihash changed to 37ab6dd291f6fdd51b4b0b4b435a7433388709c196deb95eb9baf19001328e0d
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2259 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2370 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2371 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9b074ab49bf314dbb0b484132f7ef5d7b9a473bb3d8de5b302c51a07269ab907
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2417 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2423 tasks of which 2385 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.20.0-r0/temp/log.do_packagedata.2839722
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata) failed with exit code '1'

--===============3150699064807694508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-248b51b856139aa8e1807ccb4f6872096462ee05"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:248b51b856139aa8e1807ccb4f6872096462ee05"
workspace            = "master:2c8f3be3a559158b1d475da1931a659dad5b9414"

Initialising tasks...done.
Sstate summary: Wanted 452 Local 435 Mirrors 0 Missed 17 Current 230 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 231 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.63.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.204.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.25.bb:do_populate_sysroot_setscene)
NOTE: Running task 1017 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 1026 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_fetch)
NOTE: Running task 1048 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 1049 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_write_config)
NOTE: Running task 1052 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.63-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1053 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 1054 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1055 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_fetch)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 274 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 276 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 293 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 298 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.52.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: Running setscene task 302 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.59.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.204.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Started
NOTE: Running setscene task 306 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.204.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1099 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.59.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1100 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_unpack: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1101 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.59.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Started
NOTE: Running setscene task 318 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.0.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: Running setscene task 319 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.204.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_patch: Succeeded
NOTE: Running task 1138 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1139 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1140 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic)
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 350 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_git.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 351 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe vala-0.54.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.59.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 381 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_lic unihash changed to 37ab6dd291f6fdd51b4b0b4b435a7433388709c196deb95eb9baf19001328e0d
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1207 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Started
NOTE: Running setscene task 408 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.1+AUTOINC+335ee864ef-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 452 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 512 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1340 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 533 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running task 1368 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1369 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running setscene task 548 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 571 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1390 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1444 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 617 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 623 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1461 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running setscene task 627 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1478 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1510 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1533 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f4c1a74c88f81e9917b838289399c0e2c6cacc17e2178d79e7c58c9e0b287dfd
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1824 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2182 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2342 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2368 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Started
NOTE: Running task 2370 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2374 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2384 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2379 tasks of which 2335 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.1-r0 to 0:1.20.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.20.0-r0/temp/log.do_packagedata.2935427
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb:do_packagedata) failed with exit code '1'

--===============3150699064807694508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.20.0-1.20.1.patch"

From 2954747495535eb1bb291a8e3a6cc2227115cf8b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 12:20:14 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.20.0 -> 1.20.1

---
 ...streamer1.0-vaapi_1.20.0.bb => gstreamer1.0-vaapi_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.0.bb => gstreamer1.0-vaapi_1.20.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
index 7ef8ae3138..48b571f563 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f79a47346dfd5e585e063e77078e5fc498b06dee895bfcbf47d8863fcac9ea32"
+SRC_URI[sha256sum] = "87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.27.0


--===============3150699064807694508==--

