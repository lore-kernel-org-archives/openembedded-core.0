Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D499FCD37AB
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11344.1725172853160169470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LAd/p9tU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zZZPK6BQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50aa51-08eb988d-c1cb-472d-b1bf-9b03174ccfcf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZzQapxJkWiM+tu4hp3x89O2tmMHtnQNuD12Tnd7kcxc=;
	b=LAd/p9tUFjrvmSzoXCcHNHQ9JQ0QdOnRH+n3xVKHwACSGnbxDKyaHpDX7qXRy85v
	SXElIdKezLms4zCDPBHrYmjEV8YgvZQrbKu5bHyojLVUb7X+KrKPQfIT7SYRGqXBMcE
	WHis632ScxQbIeflMGMISYDVLqZkPxCx7aqcSxMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZzQapxJkWiM+tu4hp3x89O2tmMHtnQNuD12Tnd7kcxc=;
	b=zZZPK6BQSX/qwOnslWilISBzRBDq97fS3Tf1CXdRu0Xjf+xDbLd1Ocf1sHtjq+Kv
	muHtbKONzw/hmhh0Z+wfvHE4tfSbuh33A6B+zH9Rc9qmZ4RwEKBK632bHh4ypUQi3Ul
	RZI4/MgKusK1ji3TVb+DhQhy0J+KywrwdJIBvbJ0=
Content-Type: multipart/mixed; boundary="===============1367840135035175559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.20.1 FAILED
Message-ID: <01010191ac50aa51-08eb988d-c1cb-472d-b1bf-9b03174ccfcf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204002

--===============1367840135035175559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-zipp* to *3.20.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-zipp' failed
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
Sstate summary: Wanted 281 Local 270 Mirrors 0 Missed 11 Current 369 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 439 of 650 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 440 of 650 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-zipp-3.20.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-zipp-3.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 650 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1541 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1606 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 650 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-zipp-3.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1816 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_fetch)
NOTE: recipe python3-zipp-3.20.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1817 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_unpack)
NOTE: Running task 1818 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.20.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1819 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_patch)
NOTE: Running task 1820 of 1851 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-zipp-3.20.0-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.20.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Failed
NOTE: recipe python3-zipp-3.20.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe python3-zipp-3.20.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe python3-zipp-3.20.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1820 tasks of which 1813 didn't need to be rerun and 5 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062152.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901062152.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 5 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2637006
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.20.0/temp/log.do_prepare_recipe_sysroot.2637051
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2637007
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.20.0/temp/log.do_collect_spdx_deps.2637063
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.20.0/temp/log.do_patch.2637061
Summary: There were 5 ERROR messages, returning a non-zero exit code.

ERROR: base-files-3.0.14-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: python3-zipp-3.20.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_patch.2637006
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch) failed with exit code '1'
ERROR: base-files-3.0.14-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.20.0/temp/log.do_prepare_recipe_sysroot.2637051
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: python3-zipp-3.20.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_prepare_recipe_sysroot.2637007
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.20.0/temp/log.do_collect_spdx_deps.2637063
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: python3-zipp-3.20.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-zipp/3.20.0/temp/log.do_patch.2637061
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.20.0.bb:do_patch) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1367840135035175559==--

