Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28571C54EBC
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2148.1706810404538100987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ta1nl+Zy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ICVQMitq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3eb41-619dc587-a8f6-4aec-9bbd-68290dbbfc1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ShhjALbxdwUKN0G5mqMg/g5lLXKIg3zbWgcYar9sL7U=;
	b=Ta1nl+Zy2s/WtagiL17TdEII9cBrbkeQvxbLbHOsQ8C3RuR9qGMZ+ax+muVu4dg7
	x0ugL8E4nDUQOtmFbVegwlMQ2vyFmNSLRpcPTghyS5SDF5Eme5yypGSmD2+R3dXiY42
	ocx4m8WEqJcXYzMRCKPikCooEprIkyp3vBOWcZcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ShhjALbxdwUKN0G5mqMg/g5lLXKIg3zbWgcYar9sL7U=;
	b=ICVQMitqQ4ZdIicwK3QgkjyTWdENH+lWq7BlQSn+kbRMC2bwiAE4eCBmgWnEIJXa
	U/6Wlr9eUh1LdtwyyCz+vjIzZOmxb6JnDcGVxha5051h7YJJKXSb+ZZChQU88lgLMAx
	7YJlTn3yXVPtIrtCmrxfDTZmU6s89qeZy0FJjOB4=
Content-Type: multipart/mixed; boundary="===============5283882313842943548=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-testsuite: upgrading to 2.39 FAILED
Message-ID: <0101018d65d3eb41-619dc587-a8f6-4aec-9bbd-68290dbbfc1e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194601

--===============5283882313842943548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-testsuite* to *2.39* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake glibc-testsuite' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1849 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-704ba8e8fdd25a4c407f2cf700bc67d4677683ff"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:704ba8e8fdd25a4c407f2cf700bc67d4677683ff"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 114 Local 111 Mirrors 0 Missed 3 Current 226 (97% match, 99% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 235 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 236 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 237 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 238 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 250 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 253 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 254 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 255 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 256 of 340 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_package_write_rpm_setscene)
NOTE: recipe qemu-native-8.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe qemu-native-8.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 409 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_fetch: Succeeded
NOTE: Running task 987 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_unpack: Started
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 988 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_collect_spdx_deps)
NOTE: Running task 989 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_patch)
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_patch: Started
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 990 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_create_spdx)
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_create_spdx: Started
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_patch: Succeeded
NOTE: Running task 991 of 993 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_populate_lic)
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_populate_lic: Started
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_populate_lic: Succeeded
NOTE: recipe glibc-testsuite-2.38+git-r0: task do_create_spdx: Failed
NOTE: Tasks Summary: Attempted 991 tasks of which 985 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201053823.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201053823.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_create_spdx
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.38+git-r0 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glibc-testsuite/2.38+git/temp/log.do_create_spdx.628162
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-testsuite_2.38.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5283882313842943548==--

