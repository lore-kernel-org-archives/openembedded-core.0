Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9439AC7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7527.1685693431863737309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b/M7Hezz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b289043-60922cd3-4fa9-4ccb-8334-cd9947738919-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZzMDF1Xu2VlbyxAMyOlXa5jjm9oWEmoY6sbEJB8OiiA=;
	b=b/M7Hezz9O6WUspSN9Jrn8kDCcnNrcZUb9KxMu8IOo6dAF9mINJJ7C3MMmZVvRlc
	9ndAYAGtrYHBZa6L/BOFYPGygTEDlwraMXHXk3hKbrFBO3rqQ8fyrvQUhPiQo1CN6sE
	C5i1O/iZc1b/as7j0Y0EyXrUVvH3JEr9ySDgoiyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZzMDF1Xu2VlbyxAMyOlXa5jjm9oWEmoY6sbEJB8OiiA=;
	b=kH93thdLP6EnfK81HG6UN1Bs0UOP95CsPQiOiUNNS3DWZ0jZD0Qd3ZfZL2P5mUft
	Jpy1i5bX0qevgCzooHxhto/cWaUteGK/H2hOmuDcSfyYaIwWabMsGnOI2sOzdCztiKN
	rR2fPWgPEeHfMPR0iAy7LMw17TmIzpN5ryBWYag4=
Content-Type: multipart/mixed; boundary="===============4928491960993081998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.3 SUCCEEDED
Message-ID: <010101887b289043-60922cd3-4fa9-4ccb-8334-cd9947738919-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182256

--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.2-1.22.3.patch
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
--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1ff1c6a2bb53c05759b07cd2315967f9bfcb9fc9"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 47 Local 36 Mirrors 0 Missed 11 Current 649 (76% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 670 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2269 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_fetch)
NOTE: Running task 2328 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_fetch)
NOTE: Running task 2382 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_write_config)
NOTE: Running task 2418 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_write_config)
NOTE: recipe libva-2.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Started
NOTE: recipe libva-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2426 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_unpack)
NOTE: Running task 2427 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2428 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Started
NOTE: recipe libva-2.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.22.2-r0/temp/log.do_packagedata_setscene.3339778
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 695 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package_setscene)
NOTE: recipe libva-2.18.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2429 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_patch)
NOTE: Running task 2430 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_patch)
NOTE: recipe libva-2.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2431 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2432 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic unihash changed to 006c2e70f10c907e939f3d4d9246e8a473d93b39a2e385a9e0502924674198eb
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2433 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2434 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_configure)
NOTE: recipe libva-2.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2446 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_compile)
NOTE: recipe libva-2.18.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_install)
NOTE: recipe libva-2.18.0-r0: task do_install: Started
NOTE: recipe libva-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_populate_sysroot)
NOTE: Running task 2450 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_package)
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Started
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2451 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2453 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_packagedata)
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2454 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package)
NOTE: Running task 2457 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2458 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2460 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2461 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2461 tasks of which 2432 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1ff1c6a2bb53c05759b07cd2315967f9bfcb9fc9"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 37 Mirrors 0 Missed 11 Current 644 (77% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2251 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_fetch)
NOTE: Running task 2310 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_fetch)
NOTE: Running task 2364 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_write_config)
NOTE: Running task 2400 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_write_config)
NOTE: recipe libva-2.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Started
NOTE: recipe libva-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2408 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_unpack)
NOTE: Running task 2409 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2410 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Started
NOTE: recipe libva-2.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2412 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.22.2-r0/temp/log.do_packagedata_setscene.3344842
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 691 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package_setscene)
NOTE: recipe libva-2.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2413 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2414 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic unihash changed to 006c2e70f10c907e939f3d4d9246e8a473d93b39a2e385a9e0502924674198eb
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2416 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe libva-2.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2428 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_compile)
NOTE: recipe libva-2.18.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_install)
NOTE: recipe libva-2.18.0-r0: task do_install: Started
NOTE: recipe libva-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_populate_sysroot)
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_package)
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Started
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_packagedata)
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package)
NOTE: Running task 2439 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2442 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2443 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2443 tasks of which 2414 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1ff1c6a2bb53c05759b07cd2315967f9bfcb9fc9"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 460 Local 449 Mirrors 0 Missed 11 Current 227 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1055 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_fetch)
NOTE: Running task 1066 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_fetch)
NOTE: Running task 1081 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_write_config)
NOTE: Running task 1084 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Started
NOTE: recipe libva-2.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Started
NOTE: recipe libva-2.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_unpack)
NOTE: Running task 1086 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 1088 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_patch)
NOTE: recipe libva-2.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 1089 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1090 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic)
NOTE: recipe libva-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1091 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic unihash changed to 006c2e70f10c907e939f3d4d9246e8a473d93b39a2e385a9e0502924674198eb
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.22.2-r0/temp/log.do_packagedata_setscene.3360205
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 260 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 261 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 315 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 333 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 402 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 476 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 477 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 512 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 537 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 544 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 553 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 600 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 614 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 624 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2339 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2401 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2402 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_configure)
NOTE: recipe libva-2.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_compile)
NOTE: recipe libva-2.18.0-r0: task do_compile: Started
NOTE: recipe libva-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_install)
NOTE: recipe libva-2.18.0-r0: task do_install: Started
NOTE: recipe libva-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_package)
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Started
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_packagedata)
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2410 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2411 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2412 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package)
NOTE: Running task 2413 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2415 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2416 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2417 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2417 tasks of which 2388 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1ff1c6a2bb53c05759b07cd2315967f9bfcb9fc9"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 37 Mirrors 0 Missed 11 Current 634 (77% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 656 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2219 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_fetch)
NOTE: Running task 2276 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_fetch)
NOTE: Running task 2328 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_write_config)
NOTE: Running task 2364 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_write_config)
NOTE: recipe libva-2.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Started
NOTE: recipe libva-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2372 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_unpack)
NOTE: Running task 2373 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2374 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_unpack)
NOTE: recipe libva-2.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2375 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2376 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_patch)
NOTE: recipe libva-2.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.22.2-r0/temp/log.do_packagedata_setscene.3349883
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 681 of 682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2377 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2378 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic)
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Started
NOTE: Running task 2379 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic unihash changed to 006c2e70f10c907e939f3d4d9246e8a473d93b39a2e385a9e0502924674198eb
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2380 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe libva-2.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2392 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_compile)
NOTE: recipe libva-2.18.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_install)
NOTE: recipe libva-2.18.0-r0: task do_install: Started
NOTE: recipe libva-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_package)
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Started
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_packagedata)
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2400 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package)
NOTE: Running task 2403 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2406 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2407 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2407 tasks of which 2378 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1ff1c6a2bb53c05759b07cd2315967f9bfcb9fc9"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 37 Mirrors 0 Missed 11 Current 644 (77% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2251 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_fetch)
NOTE: Running task 2310 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.22.2-r0/temp/log.do_packagedata_setscene.3354941
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 691 of 692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package_setscene)
NOTE: recipe libva-2.18.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Started
NOTE: recipe libva-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2356 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_unpack)
NOTE: Running task 2357 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_unpack)
NOTE: Running task 2366 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_write_config)
NOTE: Running task 2367 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2403 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_write_config: Started
NOTE: recipe libva-2.18.0-r0: task do_unpack: Started
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Started
NOTE: recipe libva-2.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2412 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_patch)
NOTE: recipe libva-2.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2413 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2414 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_lic unihash changed to 006c2e70f10c907e939f3d4d9246e8a473d93b39a2e385a9e0502924674198eb
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2416 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_configure)
NOTE: recipe libva-2.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2428 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.18.0-r0: task do_compile: Started
NOTE: recipe libva-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_install)
NOTE: recipe libva-2.18.0-r0: task do_install: Started
NOTE: recipe libva-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_populate_sysroot)
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_package)
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Started
NOTE: recipe libva-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Started
NOTE: recipe libva-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.18.0.bb:do_packagedata)
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package)
NOTE: Running task 2439 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2442 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2443 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2443 tasks of which 2414 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.22.3-r0 to 0:1.22.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.22.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4928491960993081998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.2-1.22.3.patch"

RnJvbSAzZTllMDJkYjMzNzlkMjBiZmVmOGUwYTA3NjE4MzEwMjQ0ZTVmMTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNDo0MTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjIyLjIgLT4gMS4yMi4zCgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuMi5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuMi5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4zLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMi4yLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjIyLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjIyLjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yMi4zLmJiCmluZGV4IDYxMTE3MjA5NzYuLjZlMDAxNGMwOTAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yMi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi4zLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZDJlNjQyZjk3NDVmOTdkOWY3M2E3ZjUwODVlNzY1OWE5YTMxZmUyMDliNzc0ZTZlNDVkYWUwNDFi
NDM1ZGYwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjc4NjcwNjJlOGI2OTMwNWZjYTViN2Qz
ZjEzZWQ3YzMxOGI3MDNlN2Q3Mjc1NmM5NDM5NWJkMzA1YzdiMzJjIgogCiBTID0gIiR7V09SS0RJ
Un0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjM5LjIK
Cg==

--===============4928491960993081998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.22.3.tar.xz"

--===============4928491960993081998==--

