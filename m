Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD55CD343C
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.11416.1725172853913164718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BLnp1YJo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zElSTdGo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010191ac50a999-d17ae305-5a98-4221-b167-1e337a3231c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YXOsN3ntpWadjnqKG31dsFSC+TtTss/XjBfSSr7dZvo=;
	b=BLnp1YJoygZ3IdkpMZ/VRIGTA+vKHPXKziKvtRSjvjJ41+JN2g5eScIiSwQtW4gK
	EoQXxsGZ9VEXDStScOw6k6/6+9zTcp1o7fRCRvdMajd06zHVUf8yr5oMv7d3Y911DrY
	fiD4xBjwfitIAbfoaw9k39tXXzt+/wsL6SeJIt8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YXOsN3ntpWadjnqKG31dsFSC+TtTss/XjBfSSr7dZvo=;
	b=zElSTdGo/2QnNkaujbfd8Jn9/jS+H9o4dJ84Xuz4bY7RIW1LPrzbQx54dTXcJeZ7
	aodXx/vF2wdDVUT/ChC5wxb/NkEjMpZ7JW98+NE+XwAl19/qt9Nl1hrkR0VcrK9xcPu
	7435cbH36hWcFd5rY9tj6LCEG7vwxIVl/gecoQpQ=
Content-Type: multipart/mixed; boundary="===============8187507462870193432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-db: upgrading to 2.13.0 FAILED
Message-ID: <01010191ac50a999-d17ae305-5a98-4221-b167-1e337a3231c8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204020

--===============8187507462870193432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *man-db* to *2.13.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake man-db' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-69fe8a0f5dace7480b8e2d398b3560c8d7759a73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69fe8a0f5dace7480b8e2d398b3560c8d7759a73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 173 Local 142 Mirrors 0 Missed 31 Current 254 (82% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 257 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 305 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 308 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 326 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 341 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 427 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe groff-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe man-db-2.12.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe man-db-2.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe less-661-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe man-db-2.12.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 416 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_setscene)
NOTE: recipe man-db-2.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe less-661-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe groff-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe groff-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe man-db-2.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe less-661-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 950 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_patch)
NOTE: Running task 969 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe less-661-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe groff-1.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpipeline-1.5.7-r0: task do_patch: Started
NOTE: Running setscene task 425 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 426 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_recipe_qa_setscene)
NOTE: Running task 971 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_fetch)
NOTE: Running task 1012 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1057 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1129 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_collect_spdx_deps)
NOTE: Running task 1136 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_ipk)
NOTE: Running task 1137 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_deb)
NOTE: recipe libpipeline-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-db-2.12.1-r0: task do_fetch: Started
NOTE: recipe groff-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe less-661-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe groff-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe less-661-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1141 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_fetch)
NOTE: Running task 1142 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_fetch)
NOTE: recipe glibc-2.40+git-r0: task do_package_write_deb: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_write_ipk: Started
NOTE: recipe groff-1.23.0-r0: task do_fetch: Started
NOTE: recipe less-661-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 427 of 427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1161 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_ipk)
NOTE: Running task 1162 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_deb)
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_ipk: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_deb: Started
NOTE: recipe less-661-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_unpack)
NOTE: Running task 1165 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_prepare_recipe_sysroot)
NOTE: recipe less-661-r0: task do_unpack: Started
NOTE: recipe less-661-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe less-661-r0: task do_unpack: Succeeded
NOTE: Running task 1166 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_patch)
NOTE: Running task 1167 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_collect_spdx_deps)
NOTE: recipe less-661-r0: task do_patch: Started
NOTE: recipe less-661-r0: task do_collect_spdx_deps: Started
NOTE: recipe man-db-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1168 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_unpack)
NOTE: recipe groff-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1169 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_unpack)
NOTE: Running task 1170 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-db-2.12.1-r0: task do_unpack: Started
NOTE: recipe groff-1.23.0-r0: task do_unpack: Started
NOTE: recipe groff-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe groff-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_patch)
NOTE: Running task 1172 of 1236 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_collect_spdx_deps)
NOTE: recipe groff-1.23.0-r0: task do_patch: Started
NOTE: recipe groff-1.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpipeline-1.5.7-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe glibc-2.40+git-r0: task do_package_write_ipk: Failed
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_ipk: Failed
NOTE: recipe less-661-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe man-db-2.12.1-r0: task do_unpack: Failed
NOTE: recipe groff-1.23.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libpipeline-1.5.7-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe glibc-2.40+git-r0: task do_package_write_deb: Failed
NOTE: recipe base-passwd-3.6.4-r0: task do_package_write_deb: Failed
NOTE: recipe less-661-r0: task do_collect_spdx_deps: Failed
NOTE: recipe groff-1.23.0-r0: task do_patch: Failed
NOTE: recipe libpipeline-1.5.7-r0: task do_collect_spdx_deps: Failed
NOTE: recipe less-661-r0: task do_patch: Failed
NOTE: recipe groff-1.23.0-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 1172 tasks of which 1151 didn't need to be rerun and 16 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062417.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062417.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 16 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_patch.2642842
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2642913
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc/2.40+git/temp/log.do_package_write_ipk.2642916
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_ipk
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_ipk.2643064
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/less/661/temp/log.do_prepare_recipe_sysroot.2643075
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-db/2.12.1/temp/log.do_unpack.2643097
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/groff/1.23.0/temp/log.do_prepare_recipe_sysroot.2643103
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_prepare_recipe_sysroot.2642906
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2642914
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc/2.40+git/temp/log.do_package_write_deb.2642920
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_deb
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_deb.2643066
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/less/661/temp/log.do_collect_spdx_deps.2643090
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/groff/1.23.0/temp/log.do_patch.2643124
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_collect_spdx_deps.2642915
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/less/661/temp/log.do_patch.2643086
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/groff/1.23.0/temp/log.do_collect_spdx_deps.2643125
Summary: There were 16 ERROR messages, returning a non-zero exit code.

ERROR: libpipeline-1.5.7-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: glibc-2.40+git-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: base-passwd-3.6.4-r0 do_package_write_ipk: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: less-661-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: man-db-2.12.1-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: groff-1.23.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_patch.2642842
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_patch) failed with exit code '1'
ERROR: libpipeline-1.5.7-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2642913
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc/2.40+git/temp/log.do_package_write_ipk.2642916
ERROR: glibc-2.40+git-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_ipk.2643064
ERROR: base-passwd-3.6.4-r0 do_package_write_deb: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_ipk) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/less/661/temp/log.do_prepare_recipe_sysroot.2643075
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: less-661-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/man-db/2.12.1/temp/log.do_unpack.2643097
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/man-db/man-db_2.12.1.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/groff/1.23.0/temp/log.do_prepare_recipe_sysroot.2643103
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: groff-1.23.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_prepare_recipe_sysroot.2642906
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: libpipeline-1.5.7-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2642914
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc/2.40+git/temp/log.do_package_write_deb.2642920
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/base-passwd/3.6.4/temp/log.do_package_write_deb.2643066
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_package_write_deb) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/less/661/temp/log.do_collect_spdx_deps.2643090
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: less-661-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/groff/1.23.0/temp/log.do_patch.2643124
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_patch) failed with exit code '1'
ERROR: groff-1.23.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libpipeline/1.5.7/temp/log.do_collect_spdx_deps.2642915
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/less/661/temp/log.do_patch.2643086
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/less/less_661.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/groff/1.23.0/temp/log.do_collect_spdx_deps.2643125
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8187507462870193432==--

