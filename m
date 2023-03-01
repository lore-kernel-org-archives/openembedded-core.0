Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D303C88CB6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.24023.1677681914718146142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=drUK66In;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101869da26fde-ceb2239d-7558-4601-9d94-c8a41bb7eebc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xl1k34g+E/DfGoEMzn3r2di1rPqkfNRvDzebzkfhbTY=;
	b=drUK66InJHvwmed5kD2H5lv3GeXAVUwxABiRQJbGuooNPJcXNClk4sCW/dgyz92p
	NWsMMM209jOS/L7Jg4koMI9/lPyqm7g4ODkpilaOASGfXJZU7P5qi2Nj6vKxC7zvJg8
	qkvgpyyAbnNpPW9s+8rfq+ovQUka+VvmI6/TlNOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xl1k34g+E/DfGoEMzn3r2di1rPqkfNRvDzebzkfhbTY=;
	b=VPCcZA9fXrLgF19B7TIScVsuZ9kEDJzI1NQPkxjZYmf8NwbWZMsZIXsYfk6IFlxp
	h3NTsg3Y2/WL0VxifuQR2gi1VMScGZYtmNEyj9CfU9L9juX+CbYySfSjI6VlL6vcav5
	ICvfsvxxp9jWwC0lD+b1583qvO4k0sVfcjLozY6U=
Content-Type: multipart/mixed; boundary="===============3362201528541182320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.15.0 SUCCEEDED
Message-ID: <010101869da26fde-ceb2239d-7558-4601-9d94-c8a41bb7eebc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177906

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.14.0-3.15.0.patch
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
--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1699 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1697 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e3d17024ac3a98ef187cc944671402876f5bc59c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e3d17024ac3a98ef187cc944671402876f5bc59c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 314 (38% match, 96% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 970 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_fetch)
NOTE: Running task 1100 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-more-itertools/9.0.0-r0/temp/log.do_packagedata_setscene.1326161
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 331 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_setscene)
NOTE: Running task 1101 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_unpack)
NOTE: Running task 1102 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_patch)
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1227 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1242 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: Running task 1243 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1244 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic unihash changed to e8c1616d9de7fade437a38f1c99f12d762d9245d5ac511b0cc59f4ac19087102
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1245 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_configure)
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_compile)
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1247 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a2ffcc996d332fc811cbcfa9d450bc46756f44756a1a31643378580d2d3f8de
NOTE: Running task 1250 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package)
NOTE: Running task 1254 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Succeeded
NOTE: Running task 1255 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata)
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1256 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_write_rpm)
NOTE: Running task 1257 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_qa)
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1258 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1258 tasks of which 1238 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e3d17024ac3a98ef187cc944671402876f5bc59c"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e3d17024ac3a98ef187cc944671402876f5bc59c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 313 (42% match, 96% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 970 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_fetch)
NOTE: Running task 1100 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-more-itertools/9.0.0-r0/temp/log.do_packagedata_setscene.1332771
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 331 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_setscene)
NOTE: Running task 1101 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_unpack)
NOTE: Running task 1102 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_patch)
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1227 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1242 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1243 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1244 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic unihash changed to e8c1616d9de7fade437a38f1c99f12d762d9245d5ac511b0cc59f4ac19087102
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1245 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_configure)
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_compile)
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1247 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4f4afd15a80d48448aa20cf7cb73786eed2afa02b3e2bd86610490f4d02562e4
NOTE: Running task 1250 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package)
NOTE: Running task 1254 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Succeeded
NOTE: Running task 1255 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata)
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1256 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_write_rpm)
NOTE: Running task 1257 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_qa)
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1258 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1258 tasks of which 1238 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1698 targets, 49 skipped, 0 masked, 0 errors.
Removing 23 recipes from the core2-32 sysroot...done.
Removing 38 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e3d17024ac3a98ef187cc944671402876f5bc59c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e3d17024ac3a98ef187cc944671402876f5bc59c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 165 Local 154 Mirrors 0 Missed 11 Current 163 (93% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 164 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 166 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 176 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 649 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-more-itertools/9.0.0-r0/temp/log.do_packagedata_setscene.1339393
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 184 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 185 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 744 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Succeeded
NOTE: Running task 752 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 753 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 196 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 197 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 765 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic unihash changed to e8c1616d9de7fade437a38f1c99f12d762d9245d5ac511b0cc59f4ac19087102
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 207 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.67.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 779 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 780 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.67-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 218 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 789 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 225 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 227 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 228 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 799 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 808 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 809 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running setscene task 233 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 242 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 262 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 267 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 854 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7d756e1c04-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 890 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 10bb837f9be944a042a4976b2679f37e5098b65a05b35e8bee72a997cbf5fff5
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 328 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1182 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1234 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1235 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_configure)
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1236 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_compile)
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1237 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Succeeded
NOTE: Running task 1238 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package)
NOTE: Running task 1239 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Succeeded
NOTE: Running task 1240 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata)
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1241 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_write_rpm)
NOTE: Running task 1242 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_qa)
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1243 of 1243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1243 tasks of which 1217 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3362201528541182320==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.14.0-3.15.0.patch"

RnJvbSBkMTkyM2MyY2MxY2Q0NzU4NWM5YWQzNzgwOGEzOWFlMjNlNjU3N2NjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODozMToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSAzLjE0LjAgLT4gMy4xNS4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtemlwcF8zLjE0LjAuYmIgPT4gcHl0aG9uMy16aXBwXzMuMTUuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtemlwcF8zLjE0LjAuYmIgPT4gcHl0
aG9uMy16aXBwXzMuMTUuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjE0LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjE1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xNC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8z
LjE1LjAuYmIKaW5kZXggZGM1MDkxZjZjNy4uNWI0MmRkODEzOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xNC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTUuMC5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2phcmFjby96aXBwIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03YTcxMjZl
MDY4MjA2MjkwZjNmZTlmOGQ2YzcxM2VhNiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjllNTQy
MWUxNzZlZjVhYjRjMGFkODk2NjI0ZTg3YTdiMmYwN2FjYTc0NmM5YjJhYTMwNTk1MjgwMGNiOGVl
Y2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTEyOTI5YWQ2NDlkYTk0MWMyM2RlNTBmMzU2YTJi
NTU3MGM5NTRiNjUxNTA2NDJiY2NkZDY2YmYxOTRkMjI0YiIKIAogREVQRU5EUyArPSAiJHtQWVRI
T05fUE59LXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIAotLSAKMi4zOS4yCgo=

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.14.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.15.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.14.0" to "3.15.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 37164 to 37602 (+1%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.14.0 [default] to 3.15.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.14.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.15.0.dist-info

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 72 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e3d17024ac3a98ef187cc944671402876f5bc59c"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e3d17024ac3a98ef187cc944671402876f5bc59c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 313 (42% match, 96% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-more-itertools/9.0.0-r0/temp/log.do_packagedata_setscene.1336047
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 331 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_setscene)
NOTE: Running task 970 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_fetch)
NOTE: Running task 1100 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1101 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_unpack)
NOTE: Running task 1102 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_patch)
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1227 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1242 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1243 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1244 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic unihash changed to e8c1616d9de7fade437a38f1c99f12d762d9245d5ac511b0cc59f4ac19087102
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1245 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_configure)
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_compile)
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1247 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 60694d5580c37a2f0574470f273d7ef18b7e5cde6370332f9903f5368d5d61d1
NOTE: Running task 1250 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package)
NOTE: Running task 1254 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Succeeded
NOTE: Running task 1255 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata)
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1256 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_write_rpm)
NOTE: Running task 1257 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_qa)
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1258 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1258 tasks of which 1238 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1697 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e3d17024ac3a98ef187cc944671402876f5bc59c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e3d17024ac3a98ef187cc944671402876f5bc59c"
workspace            = "master:33d9b3a8ed186c2d212acb83f715367912010e7f"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 8 Mirrors 0 Missed 11 Current 313 (42% match, 96% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 321 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 970 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_fetch)
NOTE: Running task 1099 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-more-itertools/9.0.0-r0/temp/log.do_packagedata_setscene.1329496
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 331 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_setscene)
NOTE: Running task 1100 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_unpack)
NOTE: Running task 1101 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_patch)
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1227 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1242 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1243 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1244 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_lic unihash changed to e8c1616d9de7fade437a38f1c99f12d762d9245d5ac511b0cc59f4ac19087102
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1245 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_configure)
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1246 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_compile)
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1247 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c6ab2bbb7247973f1dc35a2a0c6970ad3f6e794f36525bdae98d736d5108d206
NOTE: Running task 1250 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_install)
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package)
NOTE: Running task 1254 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_populate_sysroot)
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package: Succeeded
NOTE: Running task 1255 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata)
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1256 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_write_rpm)
NOTE: Running task 1257 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_qa)
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1258 of 1258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1258 tasks of which 1238 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:9.1.0-r0 to 0:9.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-9.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3362201528541182320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.14.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.15.0.dist-info

--===============3362201528541182320==--

