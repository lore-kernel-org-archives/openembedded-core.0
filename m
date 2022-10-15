Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A411C6FA93
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.24538.1665871394223375402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gC6Nwyyj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac3f78-fb42849f-0090-4556-bdf0-8343c80b2cac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BtBRQdYGld+lcFsLUEvlHsb+ai0Ls0JyuGyyp6EoJZ4=;
	b=gC6NwyyjyWXIJoirYXQ9sHlipew83si9M5DioUdY62rz5rFEQX68ap6i3o09Sl3L
	drd5ranFb5PsW66Njfs/satOBnP+r2VNI/bMiD9/2uWzv9dn5OyM6J/5TQLuxtYTM3F
	YC72n4MNtU0ktgHqncxihs6dxyCJVn9qTLLrQZX4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BtBRQdYGld+lcFsLUEvlHsb+ai0Ls0JyuGyyp6EoJZ4=;
	b=N6aYZLa6IS8UPFHNVlffnaZChK1N/2VdpQJC4/IuDfW/QLvKV+pquKo3KYvCnOmV
	aaXvHuU7L9BBBl7yylTRNvvV/zxGXP8NnmPUrC95qYS/vei3oW1Idi2Bsp2x43a+KoQ
	4hrsDM7oRo1iC764COEFTFVMipqb8PYpCpDVuD4o=
Content-Type: multipart/mixed; boundary="===============6405448462493189887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.20.4 SUCCEEDED
Message-ID: <01010183ddac3f78-fb42849f-0090-4556-bdf0-8343c80b2cac-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171861

--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.20.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.20.3-1.20.4.patch
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
--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd00ba4ba52ab2f29d6c0f267477503443034382"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 58 Local 47 Mirrors 0 Missed 11 Current 635 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 656 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2260 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 2319 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2373 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: Running task 2407 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: Running task 2415 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: Running task 2416 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: Running task 2417 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2418 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 2419 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2420 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2421 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to d87b69ceff4bd84e79a787c455aee9d0998b45ef48755aea7347fe3555734537
NOTE: Running task 2422 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata_setscene.3497028
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 692 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2423 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2436 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2440 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2450 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2442 tasks of which 2421 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 180 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-src went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dbg went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-x11 went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-glx went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-wayland went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-staticdev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-doc went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-locale went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libva/2.15.0-r0/temp/log.do_packagedata.3499191
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata) failed with exit code '1'

--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd00ba4ba52ab2f29d6c0f267477503443034382"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 58 Local 47 Mirrors 0 Missed 11 Current 621 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 642 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2210 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 2267 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2319 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: Running task 2353 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 2361 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: Running task 2362 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: Running task 2363 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2364 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 2365 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2367 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Running task 2368 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to d87b69ceff4bd84e79a787c455aee9d0998b45ef48755aea7347fe3555734537
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2369 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata_setscene.3502874
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 678 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2370 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2382 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2386 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2388 tasks of which 2367 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 180 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-src went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dbg went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-x11 went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-glx went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-wayland went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-staticdev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-doc went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-locale went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libva/2.15.0-r0/temp/log.do_packagedata.3505084
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata) failed with exit code '1'

--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd00ba4ba52ab2f29d6c0f267477503443034382"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 48 Mirrors 0 Missed 11 Current 630 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 651 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2242 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 2301 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2355 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: Running task 2389 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: Running task 2397 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: Running task 2398 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: Running task 2399 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 2401 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2403 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to d87b69ceff4bd84e79a787c455aee9d0998b45ef48755aea7347fe3555734537
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata_setscene.3505811
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 688 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2404 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2405 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2418 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2424 tasks of which 2403 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 180 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-src went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dbg went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-x11 went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-glx went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-wayland went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-staticdev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-doc went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-locale went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libva/2.15.0-r0/temp/log.do_packagedata.3508030
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata) failed with exit code '1'

--===============6405448462493189887==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.20.3-1.20.4.patch"

RnJvbSA2NjFmYTI3MTExMDE3ZDM2ZjczNzJjMmU1YmY1OWI3N2IzYjcxNzNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTk6MDI6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yMC4zIC0+IDEuMjAuNAoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjAuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjIwLjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjAuNC5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjAuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yMC4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjAuNC5iYgppbmRleCA2ZTU4MGY5Zjc5Li44MWVjMjNkMjZlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjAuNC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZlZTk5ZWIzMTZhYmRkZTlhZDM3MDAyOTE1YmQ4YzM4Njc5MThmNmZkYzc0YjdjZjJhYzRjMWFl
MGQ2OTBiNDUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWIxMjU5NjE0NGMwNTUwNmU5NzgyMzc0
YzVkMmNkZmIzMDY5ZmNhODk5MDhkNmRlMzYwZDk0N2JiNzdmZDA2YSIKIAogUyA9ICIke1dPUktE
SVJ9LyR7UkVBTFBOfS0ke1BWfSIKIERFUEVORFMgPSAibGlidmEgZ3N0cmVhbWVyMS4wIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgotLSAKMi4zMS4x
Cgo=

--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd00ba4ba52ab2f29d6c0f267477503443034382"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 58 Local 47 Mirrors 0 Missed 11 Current 631 (81% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 652 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 2242 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 2301 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 2355 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: Running task 2389 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 2397 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: Running task 2398 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: Running task 2399 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 2401 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2402 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2403 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 2404 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to d87b69ceff4bd84e79a787c455aee9d0998b45ef48755aea7347fe3555734537
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata_setscene.3499930
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 688 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package_setscene)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2405 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2418 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2424 tasks of which 2403 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 180 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-src went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dbg went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-x11 went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-glx went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-wayland went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-staticdev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-doc went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-locale went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libva/2.15.0-r0/temp/log.do_packagedata.3502137
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata) failed with exit code '1'

--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dd00ba4ba52ab2f29d6c0f267477503443034382"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 471 Local 460 Mirrors 0 Missed 11 Current 213 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 214 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 215 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1050 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_fetch)
NOTE: Running task 1061 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_fetch)
NOTE: Running task 1076 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_write_config)
NOTE: Running task 1079 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Started
NOTE: recipe libva-2.15.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Started
NOTE: recipe libva-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_unpack)
NOTE: Running task 1081 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_unpack)
NOTE: recipe libva-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1086 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_patch)
NOTE: recipe libva-2.15.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Started
NOTE: recipe libva-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1089 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1090 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic)
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_populate_lic unihash changed to d87b69ceff4bd84e79a787c455aee9d0998b45ef48755aea7347fe3555734537
NOTE: recipe libva-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_deploy_source_date_epoch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.20.3-r0/temp/log.do_packagedata_setscene.3508970
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 257 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 258 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.65-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 307 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.63.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.63.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running setscene task 324 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 330 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.63.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 363 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 371 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 392 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 413 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 444 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 480 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 500 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 513 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 657 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2330 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2390 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2391 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_configure)
NOTE: recipe libva-2.15.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.3-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2392 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_compile)
NOTE: recipe libva-2.15.0-r0: task do_compile: Started
NOTE: recipe libva-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2393 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_install)
NOTE: recipe libva-2.15.0-r0: task do_install: Started
NOTE: recipe libva-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2394 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_package)
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Started
NOTE: recipe libva-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2396 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Started
NOTE: recipe libva-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2406 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata)
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.15.0-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2398 tasks of which 2377 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 180 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.4-r0 to 0:1.20.3-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-src went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dbg went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-x11 went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-glx went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-wayland went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-staticdev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-dev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-doc went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva-locale went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: QA Issue: Package version for package libva went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: libva-2.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libva/2.15.0-r0/temp/log.do_packagedata.3526404
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.15.0.bb:do_packagedata) failed with exit code '1'

--===============6405448462493189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGSIZE changed from 2982564 to 2983000 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGSIZE changed from 2825885 to 2826202 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.20.3" to "1.20.4"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.20.3 [default] to 1.20.4 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.4.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.20.3" to "1.20.4"

--===============6405448462493189887==--

