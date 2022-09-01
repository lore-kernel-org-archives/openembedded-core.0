Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9CFC67868
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.12572.1662040787912521486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NStIZNJs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010182f959c674-e2bacc41-4030-4d52-a893-ccdc0ccb4bff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WQDTJAT/+kvnlABsxfFIGsWC5o0L6SullJzBIes6P3Y=;
	b=NStIZNJsOsglReF3xSjEqWGEtJNqKscc/CsTi83rG3EPtA0V4XpFJDa89IkoPlJJ
	wunwK41RHUZ9BV8N4H5+mUx4xV5EtodbUBMq46TIbisvY/IkMrdZ0nid/wBzVkmvQI3
	Qw0kirMbzWciU6fRPLzAcbf+YIE1/iZjRdNg9IBs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WQDTJAT/+kvnlABsxfFIGsWC5o0L6SullJzBIes6P3Y=;
	b=YoAF6bjWv27WHBHO2ruG0bbO0pOL4GgxfePxeAWgCTKqD/JdTUetq1+DskMv+JES
	6Qe/LJGi5QuLy0AbX2iSBQteYAASbETsAFlqA0rtWIWjYBOXpRErA1t4aDwkvdL+Y2D
	a5syH8KUUgHKshIIqvak+g8gk7gninFK+rTGeV1I=
Content-Type: multipart/mixed; boundary="===============7305440906660782929=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.3.224.1 SUCCEEDED
Message-ID: 
 <01010182f959c674-e2bacc41-4030-4d52-a893-ccdc0ccb4bff-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170215

--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-tools* to *1.3.224.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.3.216.0-1.3.224.1.patch
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
--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-f7ba5efdcda16301615740b3ac29697d85ec2077"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7ba5efdcda16301615740b3ac29697d85ec2077"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 1 Mirrors 0 Missed 13 Current 252 (7% match, 95% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 978 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6353db8166818f5dc51408bb08652dc0fe80e37fc2e2dfe8e95f13171c589566
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.3211324
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-f7ba5efdcda16301615740b3ac29697d85ec2077"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7ba5efdcda16301615740b3ac29697d85ec2077"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 1 Mirrors 0 Missed 13 Current 252 (7% match, 95% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 971 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f9d25dfa7f7bdea0316c61278fedd552b1c696cd6ac9a48cc8e48de945f28779
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.2718381
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1659 targets, 49 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-32 sysroot...done.
Removing 31 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f7ba5efdcda16301615740b3ac29697d85ec2077"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7ba5efdcda16301615740b3ac29697d85ec2077"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 129 Local 113 Mirrors 0 Missed 16 Current 133 (87% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 137 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 138 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 139 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 140 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 141 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 142 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 145 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 148 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 571 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 578 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: Running task 606 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 607 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 608 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 609 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 160 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 169 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 171 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: Running task 622 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 623 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_unpack)
NOTE: Running task 628 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 629 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: Running task 630 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 181 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 643 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 644 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 645 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 646 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 184 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 651 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 652 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 653 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 659 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 207 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_patch: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 217 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 227 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 232 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 235 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 713 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running setscene task 237 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 714 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 239 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 244 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 249 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 725 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 256 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 259 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 260 of 262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 756 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d3bfa3b2df731157a8d832e9636676cc95624ca6428a7e2845e0f8bba12cd735
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 881 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 954 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 991 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe shadow-4.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 992 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_configure)
NOTE: recipe shadow-4.12.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 993 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 994 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 995 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 996 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 997 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 998 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 999 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1000 of 1012 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1000 tasks of which 965 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.3416681
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-tools: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https file://0001-Remove-default-copy-constructor-in-header.-4879.patch" to "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
packages/core2-32-poky-linux/spirv-tools: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGSIZE changed from 263902536 to 262217848 (-1%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: FILELIST: directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/link -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/link, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/as -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/as, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/opt -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/opt, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/diff -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/diff, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/val -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/val, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/reduce -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/reduce, directory renamed /usr/src/debug/spirv-tool
 s/1_1.3.216.0-r0 -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/opt -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/opt, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/dis -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/dis, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/util -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/util, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/reduce -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/reduce, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/link -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/link, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/lint -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/lint, directory renamed /usr/src/debug/spirv-to
 ols/1_1.3.216.0-r0/tools/lint -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/lint, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/include/spirv-tools -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/include/spirv-tools, directory renamed /usr/src/debug/spirv-tools/1_1.3.216.0-r0/tools/cfg -> /usr/src/debug/spirv-tools/1_1.3.224.1-r0/tools/cfg, removed "/usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_extensions.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/hash_combine.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_composites.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/parse_number.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/basic_block.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_memory.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_memory_semantics.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_arithmetics.cpp /usr/src/debug/spirv-tools/1_1.3.2
 16.0-r0/source/val/validate_decorations.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_conversion.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/instruction.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_instruction.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_interfaces.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/construct.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/decoration.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validation_state.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_scopes.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/hex_float.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_mode_setting.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_derivatives.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_image.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/bit_vector.cpp /usr/src/deb
 ug/spirv-tools/1_1.3.216.0-r0/source/util/timer.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_type.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/ilist.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/string_utils.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_barriers.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_cfg.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_id.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validation_state.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_small_type_uses.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/make_unique.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/instruction.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_builtins.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/bitutils.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate.cpp /usr/src/debug/spirv-tools/1_1
 .3.216.0-r0/source/val/validate_logicals.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_constants.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_execution_limitations.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_misc.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_capability.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/basic_block.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_bitwise.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_atomics.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_annotation.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_primitives.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_debug.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_scopes.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/function.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_la
 yout.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/string_utils.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/ilist_node.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_non_uniform.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/timer.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/construct.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_memory_semantics.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/parse_number.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/function.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/pooled_linked_list.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/small_vector.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_adjacency.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/util/bit_vector.h /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_literals.cpp /usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate.h /
 usr/src/debug/spirv-tools/1_1.3.216.0-r0/source/val/validate_function.cpp", added "/usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_memory_semantics.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_literals.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_scopes.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/parse_number.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_arithmetics.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_derivatives.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/decoration.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/string_utils.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_layout.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_instruction.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_memory_semantics.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_primitives.cpp /usr/src/debug
 /spirv-tools/1_1.3.224.1-r0/source/val/validate_function.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validation_state.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/hash_combine.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_mode_setting.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_small_type_uses.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/basic_block.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_debug.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/timer.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/timer.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_atomics.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_constants.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/small_vector.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_image.cpp /usr/src/d
 ebug/spirv-tools/1_1.3.224.1-r0/source/val/validate_conversion.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_execution_limitations.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_misc.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/ilist.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validation_state.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/bit_vector.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_capability.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/string_utils.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_builtins.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/bit_vector.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/ilist_node.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/function.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/basic_block.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/construct.cpp /usr/src/de
 bug/spirv-tools/1_1.3.224.1-r0/source/val/validate_non_uniform.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_scopes.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/instruction.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/make_unique.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_adjacency.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_type.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_ray_query.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/bitutils.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_annotation.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/construct.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_bitwise.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/function.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/parse_number.cpp /usr/src/debug/sp
 irv-tools/1_1.3.224.1-r0/source/val/validate_interfaces.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_decorations.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_barriers.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/util/hex_float.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_memory.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_composites.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_id.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_extensions.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/instruction.h /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_logicals.cpp /usr/src/debug/spirv-tools/1_1.3.224.1-r0/source/val/validate_cfg.cpp"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGSIZE changed from 5301094 to 5345067 (+1%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGSIZE changed from 7245030 to 7384294 (+2%)
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]

--===============7305440906660782929==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSBjZGRkZTE4MDE1Yzk3OTY1NDcwMDhhNTczY2EzZmFkNzdjYTdjM2I5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMDozNDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LXRvb2xzOiB1cGdyYWRlIDEuMy4yMTYuMCAtPiAxLjMuMjI0LjEKCi0tLQogLi4udWx0LWNv
cHktY29uc3RydWN0b3ItaW4taGVhZGVyLi00ODc5LnBhdGNoIHwgMzQgLS0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uXzEuMy4yMTYuMC5iYiA9PiBzcGlydi10b29sc18xLjMuMjI0LjEuYmJ9IHwgIDYg
KystLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xz
LzAwMDEtUmVtb3ZlLWRlZmF1bHQtY29weS1jb25zdHJ1Y3Rvci1pbi1oZWFkZXIuLTQ4NzkucGF0
Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtdG9vbHNfMS4zLjIx
Ni4wLmJiID0+IHNwaXJ2LXRvb2xzXzEuMy4yMjQuMS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29scy8wMDAxLVJlbW92ZS1kZWZhdWx0
LWNvcHktY29uc3RydWN0b3ItaW4taGVhZGVyLi00ODc5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3NwaXIvc3BpcnYtdG9vbHMvMDAwMS1SZW1vdmUtZGVmYXVsdC1jb3B5LWNvbnN0cnVj
dG9yLWluLWhlYWRlci4tNDg3OS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDQ0YzM2NmE3NS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9z
cGlydi10b29scy8wMDAxLVJlbW92ZS1kZWZhdWx0LWNvcHktY29uc3RydWN0b3ItaW4taGVhZGVy
Li00ODc5LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzQgKzAsMCBAQAotRnJvbSBhOTBjY2My
NDA1MDFiZjMzNjJiMjNmNjc3NzFmNjViN2RlYzJjY2Y5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQotRnJvbTogSmFtaWUgTWFkaWxsIDxqbWFkaWxsQGNocm9taXVtLm9yZz4KLURhdGU6IEZyaSwg
MjkgSnVsIDIwMjIgMTQ6MjY6MzcgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIGRlZmF1
bHQgY29weSBjb25zdHJ1Y3RvciBpbiBoZWFkZXIuICgjNDg3OSkKLQotQSByZWNlbnQgbGliYysr
IHJvbGwgaW4gQ2hyb21lIHdhcm5lZCBvZiBhIGRlcHJlY2F0ZWQgY29weS4gV2UncmUKLXN0aWxs
IGxvb2tpbmcgaWYgdGhpcyBpcyBhIGJ1ZyBpbiBsaWJjKysgb3IgYSB2YWxpZCB3YXJuaW5nLCBi
dXQKLXJlbW92aW5nIHRoZSByZWR1bmRhbnQgbGluZSBpcyBhIHNhZmUgd29ya2Fyb3VuZCBvciBm
aXggaW4gZWl0aGVyCi1jYXNlLgotCi1TZWUgZGlzY3Vzc2lvbiBpbiBodHRwczovL2NycmV2LmNv
bS9jLzM3OTE3NzEKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIu
Y29tL0tocm9ub3NHcm91cC9TUElSVi1Ub29scy9wdWxsLzQ4NzldCi1TaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc291cmNlL29wdC9tZXJnZV9yZXR1
cm5fcGFzcy5oIHwgMiAtLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQotCi1kaWZm
IC0tZ2l0IGEvc291cmNlL29wdC9tZXJnZV9yZXR1cm5fcGFzcy5oIGIvc291cmNlL29wdC9tZXJn
ZV9yZXR1cm5fcGFzcy5oCi1pbmRleCBhMzVjZjI2OS4uZDE1ZGIyZjYgMTAwNjQ0Ci0tLS0gYS9z
b3VyY2Uvb3B0L21lcmdlX3JldHVybl9wYXNzLmgKLSsrKyBiL3NvdXJjZS9vcHQvbWVyZ2VfcmV0
dXJuX3Bhc3MuaAotQEAgLTExOCw4ICsxMTgsNiBAQCBjbGFzcyBNZXJnZVJldHVyblBhc3MgOiBw
dWJsaWMgTWVtUGFzcyB7Ci0gICAgIFN0cnVjdHVyZWRDb250cm9sU3RhdGUoSW5zdHJ1Y3Rpb24q
IGJyZWFrX21lcmdlLCBJbnN0cnVjdGlvbiogbWVyZ2UpCi0gICAgICAgICA6IGJyZWFrX21lcmdl
XyhicmVha19tZXJnZSksIGN1cnJlbnRfbWVyZ2VfKG1lcmdlKSB7fQotIAotLSAgICBTdHJ1Y3R1
cmVkQ29udHJvbFN0YXRlKGNvbnN0IFN0cnVjdHVyZWRDb250cm9sU3RhdGUmKSA9IGRlZmF1bHQ7
Ci0tCi0gICAgIGJvb2wgSW5CcmVha2FibGUoKSBjb25zdCB7IHJldHVybiBicmVha19tZXJnZV87
IH0KLSAgICAgYm9vbCBJblN0cnVjdHVyZWRGbG93KCkgY29uc3QgeyByZXR1cm4gQ3VycmVudE1l
cmdlSWQoKSAhPSAwOyB9Ci0gCi0tLSAKLTIuMzcuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjMuMjE2LjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjMuMjI0LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4
OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4z
LjIxNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29s
c18xLjMuMjI0LjEuYmIKaW5kZXggZmMxMDc0ZDhiOC4uY2ZlYTI4YTZlZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjIxNi4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuMy4yMjQuMS5iYgpAQCAt
NywxMCArNyw4IEBAIFNFQ1RJT04gPSAiZ3JhcGhpY3MiCiBMSUNFTlNFICA9ICJBcGFjaGUtMi4w
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2
NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ1JFViA9ICJjOTQ1MDEzNTJkNTQ1ZTg0YzgyMWNlMDMx
Mzk5ZTc2ZDFhZjMyZDE4IgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91
cC9TUElSVi1Ub29scy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCi0gICAgICAg
ICAgIGZpbGU6Ly8wMDAxLVJlbW92ZS1kZWZhdWx0LWNvcHktY29uc3RydWN0b3ItaW4taGVhZGVy
Li00ODc5LnBhdGNoIFwKLSAgICAgICAgICAiCitTUkNSRVYgPSAiNWU2MWVhMjA5ODIyMDA1OWU4
OTUyM2YxZjQ3YjBiY2Q4YzMzYjg5YSIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJv
bm9zR3JvdXAvU1BJUlYtVG9vbHMuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiBQ
RSA9ICIxIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAic2RrLSg/UDxwdmVyPlxkKyhc
LlxkKykrKSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjMxLjEKCg==

--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f7ba5efdcda16301615740b3ac29697d85ec2077"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7ba5efdcda16301615740b3ac29697d85ec2077"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 1 Mirrors 0 Missed 13 Current 252 (7% match, 95% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 974 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 663c18ee7b8ccf355b0c68ac47076a9bf7d0d130db79c91c260e5c93c47b7275
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1018 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.2501171
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============7305440906660782929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-f7ba5efdcda16301615740b3ac29697d85ec2077"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f7ba5efdcda16301615740b3ac29697d85ec2077"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 1 Mirrors 0 Missed 13 Current 252 (7% match, 95% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 753 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_fetch)
NOTE: Running task 783 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_fetch)
NOTE: Running task 973 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_unpack)
NOTE: Running task 1000 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1001 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_patch: Succeeded
NOTE: Running task 1004 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_generate_toolchain_file)
NOTE: Running task 1005 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_populate_lic unihash changed to 7d9da868cf429c1b1d02d35f2439d24908d0478a97cadd40d15756b1ded65044
NOTE: Running task 1009 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1010 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_configure: Succeeded
NOTE: Running task 1011 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_compile: Succeeded
NOTE: Running task 1012 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_install: Succeeded
NOTE: Running task 1013 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_populate_sysroot)
NOTE: Running task 1014 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1015 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1016 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1017 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5604d5ea1c66606bf1082a7e809944639ecf12f49cc369b4d2108ad7b573f7a4
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1019 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.224.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_package: Succeeded
NOTE: Running task 1020 of 1027 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.216.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.224.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1020 tasks of which 996 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.224.1-r0 to 1:1.3.216.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.216.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/spirv-headers/1_1.3.216.0-r0/temp/log.do_packagedata.2909208
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb:do_packagedata) failed with exit code '1'

--===============7305440906660782929==--

