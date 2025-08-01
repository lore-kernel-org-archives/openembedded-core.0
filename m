Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84E7CA0ECF
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.88618.1754057264357149762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=y4xxFNEo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U6HptDm2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019865f5c9ed-6130e1a1-475e-4ff1-8779-4948f10a1b53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057263;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ksfqWcfODWyLdfKQVjl6b6xZEJDSAZcRm1M59y3Zids=;
	b=y4xxFNEo27LfjRqY64CpK3f2oTK03U23zvekqc9ttPIWgfsA33AOJmv4h/5Y2KKY
	aACDi6usvDgZwxTcnuGk0PTla+ciN9JS1FT0pLA4Ei+ga/V3GYtNBr6cYhWGPUpSmh7
	EpSnXjsNj/9vyLeLm0mpAA93niUkxWvezI0E4NcQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057263;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ksfqWcfODWyLdfKQVjl6b6xZEJDSAZcRm1M59y3Zids=;
	b=U6HptDm278fqqz5DKBE89Ps1VWOibzsYh68I+hyMUmxf4YgrGJXOygPuS3D31OM9
	Me0S4dZ7vqcv2FPO9zo2ZDsRLZ49FfvePQpL8yMVpR1ia/6GGOskg8kcUpe5rpeOCkf
	atDFluTqDBwzK+URn734HyoFaEmPdJB2B6zvQvQI=
Content-Type: multipart/mixed; boundary="===============7009386742844014675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc,cross-localedef-native,glibc-testsuite: upgrading to
 2.42,2.42,2.42 FAILED
Message-ID: <0101019865f5c9ed-6130e1a1-475e-4ff1-8779-4948f10a1b53-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221248

--===============7009386742844014675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glibc,cross-localedef-native,glibc-testsuite* to *2.42,2.42,2.42* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake glibc cross-localedef-native glibc-testsuite' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-96010bfacceb3bdd7565c854645a539f648bce79"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:96010bfacceb3bdd7565c854645a539f648bce79"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 194 Local 188 Mirrors 0 Missed 6 Current 185 (96% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 189 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 208 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 214 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_lic_setscene)
NOTE: Running setscene task 230 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 235 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 246 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_package_qa_setscene)
NOTE: Running setscene task 252 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package_qa_setscene)
NOTE: Running setscene task 262 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_populate_lic_setscene)
NOTE: Running setscene task 284 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 285 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 291 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe qemu-native-10.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_package_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe qemu-native-10.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 667 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_fetch: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 313 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 314 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 316 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_packagedata_setscene)
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 317 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 320 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 324 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_create_spdx_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_unpack: Started
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_patch)
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_patch: Started
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_patch: Succeeded
NOTE: Running task 948 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 949 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_populate_lic)
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_populate_lic: Started
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_populate_lic: Succeeded
NOTE: recipe glibc-locale-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_deploy_source_date_epoch unihash changed to c2b0fcc9e3272621186d26e26b01021f0d8ba802973096de4fc924c6b5e718aa
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 345 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.41+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 967 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/cross-localedef-native_2.41.bb:do_build)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 357 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 368 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 379 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 1105 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package_write_ipk)
NOTE: Running task 1106 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_package_write_deb)
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.41+git-r0: task do_package_write_ipk: Started
NOTE: recipe glibc-2.41+git-r0: task do_package_write_deb: Started
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1110 of 1113 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_create_spdx)
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.41+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe glibc-testsuite-2.41+git-r0: task do_create_spdx: Failed
NOTE: recipe glibc-2.41+git-r0: task do_package_write_deb: Succeeded
NOTE: Tasks Summary: Attempted 1110 tasks of which 1100 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801052341.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801052341.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_create_spdx
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc-testsuite/2.41+git/temp/log.do_create_spdx.394914
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.41+git-r0 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc-testsuite/2.41+git/temp/log.do_create_spdx.394914
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.41.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7009386742844014675==--

