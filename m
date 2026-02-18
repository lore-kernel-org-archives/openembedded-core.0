Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5391FE9A051
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1406.1771440093880767134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I6R5dO6A;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tq+O7GlB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c720eb7d0-3c84854a-a527-4634-9ff4-cdbf7264aa9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440093;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MlyOuooqAEIgnky3Fofua8mru7PUEiqPLbkwSSIL+V4=;
	b=I6R5dO6A+OOsL7E8m3cQ/CDLDE5RdkQTise5Zx49m+DT29MYRLWQ8rfa9nZQtgEM
	FQHs30sQvULt0Ge0Dw84WC9Y4mcysvX9IOb5wJN25hPyeTz7BN0GYTsR69f+ms+20md
	51aKkZA3+pBraJ2kQHQYvmzJ9VbdA1Oh2VGegJ9A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440093;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MlyOuooqAEIgnky3Fofua8mru7PUEiqPLbkwSSIL+V4=;
	b=tq+O7GlBnpjEi4mOsko/4QZAekAWSQaKWcw37BZz4a3wVQ0nTSQhBrpKv4HmvFtB
	3snRVbrxe9WyqOMfmbUGJw65ctB57MuIg9tXCg/k1bW/jEsEZWMJExweH8EjCDKqX5J
	C12kMVcOxQUX/dhCtFLmWqDp7cyAVLiMNpqT6lWk=
Content-Type: multipart/mixed; boundary="===============1800771664310070903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cross-localedef-native,glibc-testsuite,glibc: upgrading to
 2.43,2.43,2.43 FAILED
Message-ID: <0101019c720eb7d0-3c84854a-a527-4634-9ff4-cdbf7264aa9a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231319

--===============1800771664310070903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cross-localedef-native,glibc-testsuite,glibc* to *2.43,2.43,2.43* has Failed(other errors).

Detailed error information:

' bitbake cross-localedef-native glibc-testsuite glibc' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 2 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-0dbc300ff37660960f604b020bd9afe190dab7a3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:0dbc300ff37660960f604b020bd9afe190dab7a3"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 180 Local 178 Mirrors 0 Missed 2 Current 203 (98% match, 99% complete)
done.
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 205 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_populate_lic_setscene)
NOTE: Running setscene task 222 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 231 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_populate_lic_setscene)
NOTE: Running setscene task 235 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 239 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_create_package_spdx_setscene)
NOTE: Running setscene task 252 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 276 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_qa_setscene)
NOTE: Running setscene task 286 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_lic_setscene)
NOTE: Running setscene task 294 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package_qa_setscene)
NOTE: Running setscene task 295 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 298 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 306 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 383 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_package_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_deb_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_qa_setscene: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_populate_lic_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_create_package_spdx_setscene: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_populate_lic_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_ipk_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_deb_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: recipe gawk-native-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 329 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_populate_lic_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 343 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_qa_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_populate_lic_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_create_package_spdx_setscene: Succeeded
NOTE: Running setscene task 347 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-native-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1046 of 1125 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_fetch)
NOTE: Running noexec task 1093 of 1125 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_build)
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 383 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_fetch: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cross-localedef-native-2.42+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running noexec task 1117 of 1125 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.42.bb:do_build)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_fetch: Succeeded
NOTE: Running task 1118 of 1125 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_unpack: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_unpack: Succeeded
NOTE: Running task 1120 of 1125 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_collect_spdx_deps)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_collect_spdx_deps: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1123 of 1125 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_create_spdx)
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_create_spdx: Started
NOTE: recipe glibc-testsuite-2.42+git-r1: task do_create_spdx: Failed
NOTE: Tasks Summary: Attempted 1123 tasks of which 1117 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218095056.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218095056.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_create_spdx
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/temp/log.do_create_spdx.523849
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.42+git-r1 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/temp/log.do_create_spdx.523849
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-testsuite_2.42.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1800771664310070903==--

