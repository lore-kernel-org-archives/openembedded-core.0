Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E29DC54ECD
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2152.1706810405225963034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aMoIpDaG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U7izn5WL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018d65d3eec3-47e1c263-70c5-4fec-a9ad-4ed1b230fdeb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CAYEYudKlK1oISB0sOg373vQlYZOjYSnGmuHPuy1+jM=;
	b=aMoIpDaG3jWpGaxUmBohdazckHwwxMruVkqM09iQX6e45+SntjUgGudR/oDYcmLw
	MvvhfCG+JdXJXbgQLumyeZffIo7WmBXPhkEPhXub7RJrCWJ4XHJRgE8Ymv2QCw7D3Eg
	rV8f/KAxdZVrOXT9/Uwq+nv/3ng6RrfGNGpyeq1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810404;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CAYEYudKlK1oISB0sOg373vQlYZOjYSnGmuHPuy1+jM=;
	b=U7izn5WLRXicrRtKQ9tdAxwY47qwuvQuoTTlkBkA6dIR142fdrBTx851l+oHBRwA
	0J0pM8RPlke+eCDiQXkl8J5jnaDtuRO1GnQWPfw+6uKJIEPzCHyye3wdNVOkjmOzga6
	16lenVMgTpmQ2ZAw2Lh0ZDj0p6+sgLT86k7U+Cos=
Content-Type: multipart/mixed; boundary="===============5109775490602904543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go: upgrading to 1.21.6 FAILED
Message-ID: <0101018d65d3eec3-47e1c263-70c5-4fec-a9ad-4ed1b230fdeb-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194616

--===============5109775490602904543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go* to *1.21.6* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake go' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-7596767c592f937eebb2ad9a0acd91b4cb1be35c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7596767c592f937eebb2ad9a0acd91b4cb1be35c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 102 Local 88 Mirrors 0 Missed 14 Current 202 (86% match, 95% complete)
Removing 5 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 239 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_populate_lic_setscene)
NOTE: Running setscene task 240 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 834 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package)
NOTE: recipe go-1.20.12-r0: task do_populate_lic_setscene: Started
NOTE: recipe go-1.20.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe go-1.20.12-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe go-1.20.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe go-runtime-1.20.12-r0: task do_package: Started
NOTE: recipe go-1.20.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe go-1.20.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 304 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_recipe_qa_setscene)
NOTE: recipe go-1.20.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe go-1.20.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 891 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_fetch)
NOTE: recipe go-1.20.12-r0: task do_fetch: Started
NOTE: recipe go-1.20.12-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_unpack)
NOTE: Running task 893 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe go-1.20.12-r0: task do_unpack: Started
NOTE: recipe go-1.20.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe go-1.20.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe go-1.20.12-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_patch)
NOTE: Running task 895 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_collect_spdx_deps)
NOTE: recipe go-1.20.12-r0: task do_patch: Started
NOTE: recipe go-1.20.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe go-1.20.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe go-1.20.12-r0: task do_patch: Succeeded
NOTE: Running noexec task 897 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_configure)
NOTE: Running task 898 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_compile)
NOTE: recipe go-1.20.12-r0: task do_compile: Started
NOTE: recipe go-runtime-1.20.12-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package unihash changed to 19229c88b683790edc77d1e7a3f7bfc460c75ae3c8acd0e1c5e993223dca9b2f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_create_spdx became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_packagedata became valid
NOTE: Running setscene task 295 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 297 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_create_spdx_setscene)
NOTE: recipe go-runtime-1.20.12-r0: task do_package_write_deb_setscene: Started
NOTE: recipe go-runtime-1.20.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe go-runtime-1.20.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe go-runtime-1.20.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe go-runtime-1.20.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe go-runtime-1.20.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe go-runtime-1.20.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe go-runtime-1.20.12-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 304 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_packagedata_setscene)
NOTE: recipe go-runtime-1.20.12-r0: task do_packagedata_setscene: Started
NOTE: recipe go-runtime-1.20.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe go-1.20.12-r0: task do_compile: Succeeded
NOTE: Running task 905 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_install)
NOTE: recipe go-1.20.12-r0: task do_install: Started
NOTE: recipe go-1.20.12-r0: task do_install: Succeeded
NOTE: Running task 906 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package)
NOTE: recipe go-1.20.12-r0: task do_package: Started
NOTE: recipe go-1.20.12-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package unihash changed to 21a61d51066d3b461d75c846b3a8bb46be8bf3968f1acae45554ea8f0be508d1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_qa became valid
NOTE: Running setscene task 300 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_qa_setscene)
NOTE: recipe go-1.20.12-r0: task do_package_qa_setscene: Started
NOTE: recipe go-1.20.12-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 304 of 304 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_packagedata_setscene)
NOTE: recipe go-1.20.12-r0: task do_packagedata_setscene: Started
NOTE: recipe go-1.20.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 909 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_create_spdx)
NOTE: Running task 910 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_write_ipk)
NOTE: Running task 911 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_write_deb)
NOTE: Running task 912 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_write_rpm)
NOTE: recipe go-1.20.12-r0: task do_create_spdx: Started
NOTE: recipe go-1.20.12-r0: task do_package_write_ipk: Started
NOTE: recipe go-1.20.12-r0: task do_package_write_deb: Started
NOTE: recipe go-1.20.12-r0: task do_package_write_rpm: Started
NOTE: recipe go-1.20.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 914 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_create_runtime_spdx)
NOTE: recipe go-1.20.12-r0: task do_create_runtime_spdx: Started
NOTE: recipe go-1.20.12-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_write_ipk unihash changed to 9fa1f5de0c41fab8b3d81122f2d512f5d7243d85d5a2d676d627e51418ae28f3
NOTE: recipe go-1.20.12-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe go-1.20.12-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_write_deb unihash changed to d8c8d095adc0d3ee6942eb3ae0a3940debb11b03c2f069343e440257d1809ede
NOTE: recipe go-1.20.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_package_write_rpm unihash changed to 810d51fbb78c1d0517535be377dd517018c914760ac046f75a0237798f389974
NOTE: Running noexec task 915 of 915 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go_1.20.12.bb:do_build)
NOTE: Tasks Summary: Attempted 915 tasks of which 899 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 31 ERROR messages, returning a non-zero exit code.

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package, the basehash value changed from d1dd96488d13632e36f74d4e2b61ff2c2862fbcab004a14f5176694a702c0dd2 to a34a79a72ab698d20a1c5efa7d0a4884fa5b9e46d55c061f7e8256e0e7373139. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: Taskhash mismatch ef5b7ae2f371c033fe0e2a25a5ca6aac0d1d079473e92b0b0dde857dd664a838 versus aedb409a08ae823fe9fcc1b5f3af0f6dad96b42dfcaa70391571d0575351f726 for /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package, the basehash value changed from d1dd96488d13632e36f74d4e2b61ff2c2862fbcab004a14f5176694a702c0dd2 to a34a79a72ab698d20a1c5efa7d0a4884fa5b9e46d55c061f7e8256e0e7373139. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package, the basehash value changed from d1dd96488d13632e36f74d4e2b61ff2c2862fbcab004a14f5176694a702c0dd2 to a34a79a72ab698d20a1c5efa7d0a4884fa5b9e46d55c061f7e8256e0e7373139. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package, the basehash value changed from d1dd96488d13632e36f74d4e2b61ff2c2862fbcab004a14f5176694a702c0dd2 to a34a79a72ab698d20a1c5efa7d0a4884fa5b9e46d55c061f7e8256e0e7373139. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package, the basehash value changed from d1dd96488d13632e36f74d4e2b61ff2c2862fbcab004a14f5176694a702c0dd2 to a34a79a72ab698d20a1c5efa7d0a4884fa5b9e46d55c061f7e8256e0e7373139. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff

ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/go/go-runtime_1.20.12.bb:do_package, the basehash value changed from d1dd96488d13632e36f74d4e2b61ff2c2862fbcab004a14f5176694a702c0dd2 to a34a79a72ab698d20a1c5efa7d0a4884fa5b9e46d55c061f7e8256e0e7373139. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake go-runtime -cdo_package -Snone
ERROR: Then:
ERROR: $ bitbake go-runtime -cdo_package -Sprintdiff



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5109775490602904543==--

