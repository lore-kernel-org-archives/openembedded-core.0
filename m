Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C8ECCA491
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.39617.1656687063090204984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Wl8FAi/a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181ba3e730b-af66961c-dd0d-47ea-bdd4-6bbe0ea75b62-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g721vylXugv4GUFrjEaJ2575rFz4W2R0qdCHHTLEFVM=;
	b=Wl8FAi/azvo3T4lqiYhNnMiUZ2XVAHT2Le0d96uUPdeAGTatbI+JZ9yHbAkf/EE4
	3Cz6zNbjTlxgSvIynE24Bwz934KL2psK2aZgqDSbSBQswIjH1eaSRxfUzKEmYuGHkPy
	BttRsmrHak1PgkSBFVdahfM6RWNIzgXhCfrymYWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g721vylXugv4GUFrjEaJ2575rFz4W2R0qdCHHTLEFVM=;
	b=YaP6PTElCxuKVSzUWhk+iXhl19juhmHLcuWe4NyEO2kk4uMEQTrcrUGrEN8Lwr9n
	f4+dXSBpjxvIxrWblITZmHmaXjzMVgtTOJPlbsdXWkfrNVVEsH8k0IxAw4+2aDwol+N
	9IityG9WN/t7FruCS0iDWaamBtQgIfZ5nLyIIHOw=
Content-Type: multipart/mixed; boundary="===============7589656248456812204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.20.3 SUCCEEDED
Message-ID: 
 <01010181ba3e730b-af66961c-dd0d-47ea-bdd4-6bbe0ea75b62-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167515

--===============7589656248456812204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.20.2-1.20.3.patch
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
--===============7589656248456812204==
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
DISTRO_VERSION       = "4.1+snapshot-bca09b230c6802e516b4a9dcbaef89a698004ece"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bca09b230c6802e516b4a9dcbaef89a698004ece"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 14 Mirrors 0 Missed 14 Current 661 (50% match, 97% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 676 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1490 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2176 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2245 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_fetch)
NOTE: Running task 2309 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2341 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-bad/1.20.2-r0/temp/log.do_packagedata_setscene.492082
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 688 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package_setscene)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2347 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2348 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2349 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_unpack)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2350 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: Running task 2351 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2353 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2354 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic unihash changed to 89c1c4d9db7a0cbe599b9144e044710d0c581d1e019f23620809d4138319b9f4
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2355 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2357 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 24e7bbdb90fcd4b475610092eb7faada85d7d9355d2cd4f7125251b99c42e3bd
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2402 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f21dc99d20ac7d87594cf6f890075c0c2a720b47039a37779f6a3cf7d22d0088
NOTE: Running task 2414 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2418 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2419 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2421 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package)
NOTE: Running task 2425 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2427 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2428 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2429 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2429 tasks of which 2396 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7589656248456812204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGSIZE changed from 2981088 to 2980712 (-0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGSIZE changed from 2824564 to 2824072 (-0%)
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.20.2" to "1.20.3"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.20.2 [default] to 1.20.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.20.3.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-vaapi: PV changed from "1.20.2" to "1.20.3"

--===============7589656248456812204==
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
DISTRO_VERSION       = "4.1+snapshot-bca09b230c6802e516b4a9dcbaef89a698004ece"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bca09b230c6802e516b4a9dcbaef89a698004ece"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 15 Mirrors 0 Missed 14 Current 664 (51% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 680 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1490 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2194 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2263 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_fetch)
NOTE: Running task 2327 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2359 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Started
NOTE: Running task 2365 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2366 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2367 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_unpack)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2368 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: Running task 2369 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-bad/1.20.2-r0/temp/log.do_packagedata_setscene.227540
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 692 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2371 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic unihash changed to 89c1c4d9db7a0cbe599b9144e044710d0c581d1e019f23620809d4138319b9f4
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2373 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2375 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ceacde96a943d5e36c69eaeecad218c8f6bf77ab868ef4c4f4c40b6376bbdffe
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2420 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68885898fa42694decaaa93fb8f5351a974266272251ec3d900503cb2ba7f9b5
NOTE: Running task 2433 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2434 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2436 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2437 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2438 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2439 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2440 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package)
NOTE: Running task 2443 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2445 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2446 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2447 of 2447 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2447 tasks of which 2414 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7589656248456812204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-bca09b230c6802e516b4a9dcbaef89a698004ece"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bca09b230c6802e516b4a9dcbaef89a698004ece"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 449 Local 432 Mirrors 0 Missed 17 Current 235 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 236 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.64.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running task 1042 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 1053 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_fetch)
NOTE: Running task 1075 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_write_config)
NOTE: Running task 1076 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 1079 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_write_config)
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1084 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_fetch)
NOTE: Running task 1085 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 1086 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 281 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 283 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.54.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 286 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe librsvg-2.54.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 299 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1122 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1127 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Started
NOTE: Running task 1128 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_patch)
NOTE: recipe libical-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.216.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: Running setscene task 326 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 329 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 331 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 354 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1161 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 1162 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 368 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.60.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 373 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe flac-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.50.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1182 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running setscene task 380 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 391 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe pango-1.50.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1207 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1215 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic unihash changed to 89c1c4d9db7a0cbe599b9144e044710d0c581d1e019f23620809d4138319b9f4
NOTE: recipe gstreamer1.0-1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 1246 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_patch)
NOTE: Running setscene task 413 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 429 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 430 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1278 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1298 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 455 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running task 1314 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1328 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 475 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 523 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 546 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running setscene task 572 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 608 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1450 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1542 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6728b82399c51746d3fb26f9f0cd45942f82befd320f14c8b0368e7fe1dc57bf
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 684 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1982 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2306 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 07bf514b3f1bd17f4841ab5973582a4697aba46a8bb59e17af48de92273ac843
NOTE: Running task 2377 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2383 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_configure: Succeeded
NOTE: Running task 2389 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_compile: Succeeded
NOTE: Running task 2390 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2393 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2394 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2396 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2397 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2403 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2398 tasks of which 2354 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-bad/1.20.2-r0/temp/log.do_packagedata.661661
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata) failed with exit code '1'

--===============7589656248456812204==
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
DISTRO_VERSION       = "4.1+snapshot-bca09b230c6802e516b4a9dcbaef89a698004ece"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bca09b230c6802e516b4a9dcbaef89a698004ece"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 13 Mirrors 0 Missed 14 Current 652 (48% match, 97% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 666 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1481 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2144 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2211 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_fetch)
NOTE: Running task 2273 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2305 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 2311 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_unpack)
NOTE: Running task 2312 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2313 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Started
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-bad/1.20.2-r0/temp/log.do_packagedata_setscene.417377
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 678 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2316 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2317 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic unihash changed to 89c1c4d9db7a0cbe599b9144e044710d0c581d1e019f23620809d4138319b9f4
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2318 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2319 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2321 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5a87bce771979224b08661aca9e0f2c5a3c9278fb6b3f8becbeb8c95beab0433
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 2356 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fc785bd9401961ddf48c66e20cc7d64b01053c2960c2558eeebb4f01a6ac1297
NOTE: Running task 2378 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2379 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2382 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2383 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2384 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2386 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package)
NOTE: Running task 2389 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2392 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2393 of 2393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2393 tasks of which 2360 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7589656248456812204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.20.2-1.20.3.patch"

From 972ff82cf008d345144f824a1b2539eabdb5254e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 12:51:43 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.20.2 -> 1.20.3

---
 ...streamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
index 40dc21cf45..6e580f9f79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
+SRC_URI[sha256sum] = "6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.31.1


--===============7589656248456812204==
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
DISTRO_VERSION       = "4.1+snapshot-bca09b230c6802e516b4a9dcbaef89a698004ece"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:bca09b230c6802e516b4a9dcbaef89a698004ece"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 15 Mirrors 0 Missed 14 Current 660 (51% match, 97% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 676 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1490 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2176 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_fetch)
NOTE: Running task 2245 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_fetch)
NOTE: Running task 2309 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_write_config)
NOTE: Running task 2341 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_write_config)
NOTE: recipe libva-2.14.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Started
NOTE: recipe libva-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Started
NOTE: Running task 2347 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_unpack)
NOTE: Running task 2348 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2349 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_unpack)
NOTE: recipe libva-2.14.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Started
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 2350 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2351 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_patch)
NOTE: recipe libva-2.14.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-bad/1.20.2-r0/temp/log.do_packagedata_setscene.334613
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 688 of 689 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2353 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Started
NOTE: recipe libva-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 2354 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libva-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_lic unihash changed to 89c1c4d9db7a0cbe599b9144e044710d0c581d1e019f23620809d4138319b9f4
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2355 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2357 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_configure)
NOTE: recipe libva-2.14.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 687ea4f02cf2520d1e4f6f05acf6a7c02d4c00ce54cbb04ee3ff9a790a9b0d36
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2402 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6b884e10bab8744614c446ec2af7b2429353d31ec97ee2b6763a153ee41e4951
NOTE: Running task 2414 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_compile)
NOTE: recipe libva-2.14.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.20.2-r0: task do_packagedata: Succeeded
NOTE: recipe libva-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_install)
NOTE: recipe libva-2.14.0-r0: task do_install: Started
NOTE: recipe libva-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 2417 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 2418 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_package)
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Started
NOTE: recipe libva-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2419 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2420 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Started
NOTE: recipe libva-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 2421 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.14.0.bb:do_packagedata)
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libva-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package)
NOTE: Running task 2425 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2427 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_write_rpm)
NOTE: Running task 2428 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.20.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2429 of 2429 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2429 tasks of which 2396 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 169 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.20.3-r0 to 0:1.20.2-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.20.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7589656248456812204==--

