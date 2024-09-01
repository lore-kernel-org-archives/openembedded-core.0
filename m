Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37F0CD37AC
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11412.1725172853629342431
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=B61KRrkQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=f2Yu8Bvp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a8bd-0b4821e9-99f2-497b-884b-ec0f60b7d4fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/+PW7fZqQlOCuVpFQ9+pUmTxRG/zEJSvUv5J4v8/DFw=;
	b=B61KRrkQqg6kQ/QtdtjKMmvzjAD3nKAPGTr+ZtTm4lA3BxnP0Z6pIh7Uzj0JUIFw
	vNW+MfRYMa+vr6HnjVq+JynEYlV22zBk0cXrT10omQk+iuguRhExq6+k/EKnAM2i5rg
	kay6RH8gCnvRpt438S+WgT6VBfJuEits37bhOnnE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/+PW7fZqQlOCuVpFQ9+pUmTxRG/zEJSvUv5J4v8/DFw=;
	b=f2Yu8Bvp9jUO6PcJqjsNgHmA3r3a6GUM6Ra3Jh+GsqgK8SVGrJJ9G2eDPHxTcfF/
	LA2+liStR2aKdBLr1yOHAvlh45u6GUQXKym6hGzYFl6cB18FJ9r3AFQwIUq1gD7itM2
	Itqag72zb3yb26HzLUgszk7hoU/EHrsZADdC160I=
Content-Type: multipart/mixed; boundary="===============4475062047057728279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 2.1.0 FAILED
Message-ID: <01010191ac50a8bd-0b4821e9-99f2-497b-884b-ec0f60b7d4fb-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204000

--===============4475062047057728279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-numpy* to *2.1.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-numpy' failed
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
Sstate summary: Wanted 348 Local 312 Mirrors 0 Missed 36 Current 410 (89% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 428 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 483 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 484 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 758 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.11.bb:do_create_spdx_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cython-native-3.0.11-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1087 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_patch)
NOTE: Running task 1185 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-numpy-1.26.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-cython-native-3.0.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1274 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_patch)
NOTE: Running task 1282 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 743 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_package_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-24.2.0-r0: task do_patch: Started
NOTE: Running setscene task 744 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-numpy-1.26.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 758 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 1321 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Started
NOTE: recipe python3-cython-native-3.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 747 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cython-native-3.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 758 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cython_3.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1453 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_fetch)
NOTE: recipe python3-numpy-1.26.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1455 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_fetch)
NOTE: recipe python3-cython-native-3.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_fetch: Started
NOTE: recipe python3-cython-native-3.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_package_setscene: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_unpack)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 1470 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_fetch: Succeeded
NOTE: Running task 1471 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_unpack)
NOTE: recipe python3-numpy-1.26.4-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.26.4-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_patch)
NOTE: recipe python3-numpy-1.26.4-r0: task do_patch: Started
NOTE: recipe glibc-2.40+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 752 of 758 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1771 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1778 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1828 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1854 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1867 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.26.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2018 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-24.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2031 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2032 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_collect_spdx_deps)
NOTE: Running task 2033 of 2129 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.26.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe python3-attrs-24.2.0-r0: task do_patch: Failed
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_patch: Failed
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_patch: Failed
NOTE: recipe python3-numpy-1.26.4-r0: task do_patch: Failed
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_collect_spdx_deps: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-attrs-24.2.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-numpy-1.26.4-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-hypothesis-6.111.2-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-typing-extensions-4.12.2-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-numpy-1.26.4-r0: task do_collect_spdx_deps: Failed
NOTE: Tasks Summary: Attempted 2034 tasks of which 2014 didn't need to be rerun and 16 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061907.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901061907.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 16 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_patch.2629992
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2630080
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/24.2.0/temp/log.do_patch.2630098
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_patch.2630152
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typing-extensions/4.12.2/temp/log.do_patch.2630314
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/temp/log.do_patch.2630357
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_collect_spdx_deps.2630538
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2630103
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/24.2.0/temp/log.do_prepare_recipe_sysroot.2630533
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_prepare_recipe_sysroot.2630534
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typing-extensions/4.12.2/temp/log.do_prepare_recipe_sysroot.2630535
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/temp/log.do_prepare_recipe_sysroot.2630531
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_prepare_recipe_sysroot.2630532
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_collect_spdx_deps.2630539
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typing-extensions/4.12.2/temp/log.do_collect_spdx_deps.2630537
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/temp/log.do_collect_spdx_deps.2630536
Summary: There were 16 ERROR messages, returning a non-zero exit code.

ERROR: python3-hypothesis-6.111.2-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-attrs-24.2.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-sortedcontainers-2.4.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-typing-extensions-4.12.2-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-numpy-1.26.4-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_patch.2629992
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_patch) failed with exit code '1'
ERROR: python3-hypothesis-6.111.2-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2630080
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/24.2.0/temp/log.do_patch.2630098
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_patch) failed with exit code '1'
ERROR: python3-attrs-24.2.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_patch.2630152
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_patch) failed with exit code '1'
ERROR: python3-sortedcontainers-2.4.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typing-extensions/4.12.2/temp/log.do_patch.2630314
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_patch) failed with exit code '1'
ERROR: python3-typing-extensions-4.12.2-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/temp/log.do_patch.2630357
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_patch) failed with exit code '1'
ERROR: python3-numpy-1.26.4-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_collect_spdx_deps.2630538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2630103
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/24.2.0/temp/log.do_prepare_recipe_sysroot.2630533
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_24.2.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-hypothesis-6.111.2-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_prepare_recipe_sysroot.2630534
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-sortedcontainers-2.4.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typing-extensions/4.12.2/temp/log.do_prepare_recipe_sysroot.2630535
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-typing-extensions-4.12.2-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/temp/log.do_prepare_recipe_sysroot.2630531
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-numpy-1.26.4-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.111.2/temp/log.do_prepare_recipe_sysroot.2630532
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.111.2.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-sortedcontainers/2.4.0/temp/log.do_collect_spdx_deps.2630539
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-typing-extensions/4.12.2/temp/log.do_collect_spdx_deps.2630537
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-numpy/1.26.4/temp/log.do_collect_spdx_deps.2630536
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-numpy_1.26.4.bb:do_collect_spdx_deps) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4475062047057728279==--

