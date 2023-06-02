Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ECDC7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:20:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7802.1685694007707586889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BIxokd8w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b31444e-75159638-114b-4c78-acb6-68aa3a07e310-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685694006;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oYtFHt/+r8MxvQocvULXOVkgfffEHUw1ZnIK1PSCmh0=;
	b=BIxokd8wuhH7Nq0AkID/yTynOnTjxmHOHuCfE/EyGGcizwZXyUyHlHYNg3yK/znX
	7Le/iO8tSvrqTDAX1cvN3yB0w1IxyvLhf+6yl2a7zRZgDv96EeX2gJTyr9p0ZufukJC
	76LiMT3XRCjDORIjPtE6j6XC3jguROjA6HuDSLqg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685694006;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oYtFHt/+r8MxvQocvULXOVkgfffEHUw1ZnIK1PSCmh0=;
	b=pSOHvcpsFbqoG3TpHw1fsTWjf4p489KL+AIOl419rZO7IKUp9J7EUm/sSKSa091A
	vDddijQjKI3cnqqP/fTCis/YPvcgasLEZ5gBUglMweDdKBcltYXBS51jR1bDiFJuTzT
	NCBk7VcDZhmgg60tFetGWwSWTH2aP0q8s8tclL5U=
Content-Type: multipart/mixed; boundary="===============1585806819149967036=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] serf: upgrading to 1.3.10 SUCCEEDED
Message-ID: <010101887b31444e-75159638-114b-4c78-acb6-68aa3a07e310-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:20:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182291

--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *serf* to *1.3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-serf-upgrade-1.3.9-1.3.10.patch
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
--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39996834dc3d293e3cf66851ae538707990e8f12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 10 Mirrors 0 Missed 15 Current 227 (40% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 803 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 847 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 917 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: Running task 963 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 964 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 972 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 973 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 974 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 975 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 976 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 977 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 978 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 979 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 980 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 981 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 982 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 982 tasks of which 957 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/apr/1.7.3-r0/temp/log.do_packagedata.2099928
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39996834dc3d293e3cf66851ae538707990e8f12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 11 Mirrors 0 Missed 15 Current 226 (42% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 804 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 847 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 917 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: Running task 963 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 964 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 972 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 973 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 974 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 975 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 976 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 977 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 978 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 979 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 980 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 981 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 982 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 982 tasks of which 957 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/apr/1.7.3-r0/temp/log.do_packagedata.2117357
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 21 recipes from the core2-32 sysroot...done.
Removing 20 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39996834dc3d293e3cf66851ae538707990e8f12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 106 Local 91 Mirrors 0 Missed 15 Current 147 (85% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 154 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 155 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 163 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 164 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 167 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 169 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running task 623 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 631 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 683 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 707 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 708 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 709 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 719 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 724 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 725 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 726 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 727 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 728 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 188 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 193 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 195 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 733 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 207 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 212 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 216 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 221 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 223 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 226 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 228 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 230 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 231 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 234 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 239 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 247 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 250 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 251 of 253 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 918 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 973 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 974 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 975 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 976 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 977 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 978 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 979 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 980 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 981 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 982 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 983 of 1001 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 983 tasks of which 958 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/apr/1.7.3-r0/temp/log.do_packagedata.2172888
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============1585806819149967036==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-serf-upgrade-1.3.9-1.3.10.patch"

RnJvbSBiZDkyNGI2ZGE3ODdjNzJjMDg5ODczNDM2MzEzMGQxOGM3ZmZmZDI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwNzozNzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNl
cmY6IHVwZ3JhZGUgMS4zLjkgLT4gMS4zLjEwCgotLS0KIC4uLnByaW50LWluLXRoZS1zY29ucy1m
aWxlLXRvLXVuYnJlYWstYi5wYXRjaCB8IDI5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLnNsX2J1
Y2tldHMuYy1kby1ub3QtdXNlLUVSUl9HRVRfRlVOQy5wYXRjaCB8IDI4IC0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uMTEwODMtZml4LWJ1aWxkaW5nLXdpdGgtc2NvbnMtMy4wLjAtLnBhdGNoIHwgMjkg
LS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL3NlcmYve3NlcmZfMS4zLjkuYmIgPT4gc2VyZl8xLjMu
MTAuYmJ9ICAgIHwgIDYgKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOTEg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2Vy
Zi9zZXJmLzAwMDEtRml4LXN5bnRheC1vZi1hLXByaW50LWluLXRoZS1zY29ucy1maWxlLXRvLXVu
YnJlYWstYi5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Nl
cmYvc2VyZi8wMDAxLWJ1Y2tldHMtc3NsX2J1Y2tldHMuYy1kby1ub3QtdXNlLUVSUl9HRVRfRlVO
Qy5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2Vy
Zi8wMDA0LUZvbGxvdy11cC10by1yMTgxMTA4My1maXgtYnVpbGRpbmctd2l0aC1zY29ucy0zLjAu
MC0ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3tzZXJmXzEuMy45LmJi
ID0+IHNlcmZfMS4zLjEwLmJifSAoNzglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3NlcmYvc2VyZi8wMDAxLUZpeC1zeW50YXgtb2YtYS1wcmludC1pbi10aGUtc2NvbnMtZmls
ZS10by11bmJyZWFrLWIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmYvMDAw
MS1GaXgtc3ludGF4LW9mLWEtcHJpbnQtaW4tdGhlLXNjb25zLWZpbGUtdG8tdW5icmVhay1iLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0YTU4MzJhYzFhLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZi8wMDAxLUZpeC1zeW50YXgtb2Yt
YS1wcmludC1pbi10aGUtc2NvbnMtZmlsZS10by11bmJyZWFrLWIucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSwyOSArMCwwIEBACi1Gcm9tIDk5ZjZlMWIwZDY4MjgxYjYzMjE4ZDZhZGZlNjhjZDll
MzMxYWM1YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgotRGF0ZTogTW9uLCAzIFNlcCAyMDE4IDEwOjUwOjA4IC0wNzAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIEZpeCBzeW50YXggb2YgYSBwcmludCgpIGluIHRoZSBzY29ucyBmaWxlIHRv
IHVuYnJlYWsgYnVpbGRpbmcKLSB3aXRoIG1vc3QgcmVjZW50IHNjb25zIHZlcnNpb24uCi0KLSog
U0NvbnN0cnVjdCBVc2UgUHl0aG9uIDMuMCB2YWxpZCBzeW50YXggdG8gbWFrZSBTY29ucyAzLjAu
MCBoYXBweSBvbiBib3RoIHB5dGhvbgotICAzLjAgYW5kIDIuNy4KLQotVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydAotW2h0dHBzOi8vc3ZuLmFwYWNoZS5vcmcvdmlld3ZjL3NlcmYvdHJ1bmsvU0Nv
bnN0cnVjdD9yMT0xODA5MTMyJnIyPTE4MTEwODMmZGlmZl9mb3JtYXQ9aF0KLVNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBTQ29uc3RydWN0IHwgMiAr
LQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZm
IC0tZ2l0IGEvU0NvbnN0cnVjdCBiL1NDb25zdHJ1Y3QKLWluZGV4IDE2NzA0NTkuLjE4YTQ1ZmEg
MTAwNjQ0Ci0tLS0gYS9TQ29uc3RydWN0Ci0rKysgYi9TQ29uc3RydWN0Ci1AQCAtMTg0LDcgKzE4
NCw3IEBAIENBTExPVVRfT0tBWSA9IG5vdCAoZW52LkdldE9wdGlvbignY2xlYW4nKSBvciBlbnYu
R2V0T3B0aW9uKCdoZWxwJykpCi0gCi0gdW5rbm93biA9IG9wdHMuVW5rbm93blZhcmlhYmxlcygp
Ci0gaWYgdW5rbm93bjoKLS0gIHByaW50ICdXYXJuaW5nOiBVc2VkIHVua25vd24gdmFyaWFibGVz
OicsICcsICcuam9pbih1bmtub3duLmtleXMoKSkKLSsgIHByaW50KCdXYXJuaW5nOiBVc2VkIHVu
a25vd24gdmFyaWFibGVzOicsICcsICcuam9pbih1bmtub3duLmtleXMoKSkpCi0gCi0gYXByID0g
c3RyKGVudlsnQVBSJ10pCi0gYXB1ID0gc3RyKGVudlsnQVBVJ10pCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmYvMDAwMS1idWNrZXRzLXNzbF9idWNrZXRzLmMtZG8t
bm90LXVzZS1FUlJfR0VUX0ZVTkMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3Nl
cmYvMDAwMS1idWNrZXRzLXNzbF9idWNrZXRzLmMtZG8tbm90LXVzZS1FUlJfR0VUX0ZVTkMucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDkxY2NjOGE0NzQuLjAwMDAwMDAwMDAK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmLzAwMDEtYnVja2V0cy1zc2xfYnVj
a2V0cy5jLWRvLW5vdC11c2UtRVJSX0dFVF9GVU5DLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEs
MjggKzAsMCBAQAotRnJvbSAyZjQ1NzExYTY2ZmY5OTg4NmI2ZTRhNTcwOGUyZGIwMWE2M2U1YWY0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhA
bGludXRyb25peC5kZT4KLURhdGU6IEZyaSwgMTAgU2VwIDIwMjEgMTE6MDU6MTAgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSF0gYnVja2V0cy9zc2xfYnVja2V0cy5jOiBkbyBub3QgdXNlIEVSUl9HRVRf
RlVOQwotCi1VcHN0cmVhbSByZW1vdmVkIGl0IGluCi1odHRwczovL2dpdGh1Yi5jb20vb3BlbnNz
bC9vcGVuc3NsL3B1bGwvMTYwMDQKLQotVXBzdHJlYW0tU3RhdHVzOiBJbmFjdGl2ZS1VcHN0cmVh
bSBbbGFzdHJlbGVhc2U6IDIwMTUsIGxhc3Rjb21taXQ6IDIwMTldCi1TaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gYnVja2V0cy9zc2xf
YnVja2V0cy5jIHwgMyArLS0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9idWNrZXRzL3NzbF9idWNrZXRzLmMgYi9idWNrZXRz
L3NzbF9idWNrZXRzLmMKLWluZGV4IGIwMWU1MzUuLjk4MDFmODcgMTAwNjQ0Ci0tLS0gYS9idWNr
ZXRzL3NzbF9idWNrZXRzLmMKLSsrKyBiL2J1Y2tldHMvc3NsX2J1Y2tldHMuYwotQEAgLTEzMjUs
OCArMTMyNSw3IEBAIHN0YXRpYyBpbnQgc3NsX25lZWRfY2xpZW50X2NlcnQoU1NMICpzc2wsIFg1
MDkgKipjZXJ0LCBFVlBfUEtFWSAqKnBrZXkpCi0gICAgICAgICAgICAgICAgIHJldHVybiAwOwot
ICAgICAgICAgICAgIH0KLSAgICAgICAgICAgICBlbHNlIHsKLS0gICAgICAgICAgICAgICAgcHJp
bnRmKCJPcGVuU1NMIGNlcnQgZXJyb3I6ICVkICVkICVkXG4iLCBFUlJfR0VUX0xJQihlcnIpLAot
LSAgICAgICAgICAgICAgICAgICAgICAgRVJSX0dFVF9GVU5DKGVyciksCi0rICAgICAgICAgICAg
ICAgIHByaW50ZigiT3BlblNTTCBjZXJ0IGVycm9yOiAlZCAlZFxuIiwgRVJSX0dFVF9MSUIoZXJy
KSwKLSAgICAgICAgICAgICAgICAgICAgICAgIEVSUl9HRVRfUkVBU09OKGVycikpOwotICAgICAg
ICAgICAgICAgICBQS0NTMTJfZnJlZShwMTIpOwotICAgICAgICAgICAgICAgICBiaW9fbWV0aF9m
cmVlKGJpb20pOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmLzAw
MDQtRm9sbG93LXVwLXRvLXIxODExMDgzLWZpeC1idWlsZGluZy13aXRoLXNjb25zLTMuMC4wLS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZi8wMDA0LUZvbGxvdy11cC10by1y
MTgxMTA4My1maXgtYnVpbGRpbmctd2l0aC1zY29ucy0zLjAuMC0ucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAyZmE5ZTNhMDYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvc2VyZi9zZXJmLzAwMDQtRm9sbG93LXVwLXRvLXIxODExMDgzLWZpeC1idWls
ZGluZy13aXRoLXNjb25zLTMuMC4wLS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDI5ICswLDAg
QEAKLUZyb20gNTY1MjExZmQwODJlZjY1M2NhOWM0NGEzNDUzNTBmYzE0NTFmNWEwZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1E
YXRlOiBNb24sIDMgU2VwIDIwMTggMTE6MTI6MzggLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gRm9s
bG93LXVwIHRvIHIxODExMDgzIGZpeCBidWlsZGluZyB3aXRoIHNjb25zIDMuMC4wIGFuZAotIFB5
dGhvbjMKLQotKiBTQ29uc3RydWN0OiBBcHBlbmQgZGVjb2RlKCd1dGYtOCkgdG8gRklMRS5nZXRf
Y29udGVudHMoKSB0byBhdm9pZAotICBUeXBlRXJyb3I6IGNhbm5vdCB1c2UgYSBzdHJpbmcgcGF0
dGVybiBvbiBhIGJ5dGVzLWxpa2Ugb2JqZWN0Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQK
LVtodHRwczovL3N2bi5hcGFjaGUub3JnL3ZpZXd2Yy9zZXJmL3RydW5rL1NDb25zdHJ1Y3Q/cjE9
MTgxMTA4OCZyMj0xODE0NjA0XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KLS0tLQotIFNDb25zdHJ1Y3QgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9TQ29uc3RydWN0IGIvU0Nv
bnN0cnVjdAotaW5kZXggODc3NzMxZS4uNzY3OGJiMSAxMDA2NDQKLS0tLSBhL1NDb25zdHJ1Y3QK
LSsrKyBiL1NDb25zdHJ1Y3QKLUBAIC0xNjksNyArMTY5LDcgQEAgZW52LkFwcGVuZChCVUlMREVS
UyA9IHsKLSBtYXRjaCA9IHJlLnNlYXJjaCgnU0VSRl9NQUpPUl9WRVJTSU9OIChbMC05XSspLion
Ci0gICAgICAgICAgICAgICAgICAgJ1NFUkZfTUlOT1JfVkVSU0lPTiAoWzAtOV0rKS4qJwotICAg
ICAgICAgICAgICAgICAgICdTRVJGX1BBVENIX1ZFUlNJT04gKFswLTldKyknLAotLSAgICAgICAg
ICAgICAgICAgIGVudi5GaWxlKCdzZXJmLmgnKS5nZXRfY29udGVudHMoKSwKLSsgICAgICAgICAg
ICAgICAgICBlbnYuRmlsZSgnc2VyZi5oJykuZ2V0X2NvbnRlbnRzKCkuZGVjb2RlKCd1dGYtOCcp
LAotICAgICAgICAgICAgICAgICAgIHJlLkRPVEFMTCkKLSBNQUpPUiwgTUlOT1IsIFBBVENIID0g
W2ludCh4KSBmb3IgeCBpbiBtYXRjaC5ncm91cHMoKV0KLSBlbnYuQXBwZW5kKE1BSk9SPXN0cihN
QUpPUikpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmZfMS4zLjku
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zZXJmL3NlcmZfMS4zLjEwLmJiCnNpbWlsYXJpdHkg
aW5kZXggNzglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3NlcmYvc2VyZl8xLjMu
OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9zZXJmXzEuMy4xMC5iYgpp
bmRleCA2NjlmNDJiOGU3Li5jNmI1MTQ1MmFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9zZXJmL3NlcmZfMS4zLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2VyZi9z
ZXJmXzEuMy4xMC5iYgpAQCAtNywxNiArNywxMiBAQCBIT01FUEFHRSA9ICJodHRwOi8vc2VyZi5h
cGFjaGUub3JnLyIKIFNSQ19VUkkgPSAiJHtBUEFDSEVfTUlSUk9SfS8ke0JQTn0vJHtCUE59LSR7
UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbm9ycGF0aC5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly9lbnYucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtc3ludGF4
LW9mLWEtcHJpbnQtaW4tdGhlLXNjb25zLWZpbGUtdG8tdW5icmVhay1iLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDItU0NvbnN0cnVjdC1GaXgtcGF0aC1xdW90aW5nLWZvci0uZGVmLWdl
bmVyYXRvci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLWdlbl9kZWYucGF0Y2ggXAot
ICAgICAgICAgICBmaWxlOi8vMDAwNC1Gb2xsb3ctdXAtdG8tcjE4MTEwODMtZml4LWJ1aWxkaW5n
LXdpdGgtc2NvbnMtMy4wLjAtLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL1NDb25zdHJ1Y3Qu
c3RvcC5jcmVhdGluZy5kaXJlY3Rvcmllcy53aXRob3V0LnNhbmRib3gtaW5zdGFsbC5wcmVmaXgu
cGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1idWNrZXRzLXNzbF9idWNrZXRzLmMtZG8t
bm90LXVzZS1FUlJfR0VUX0ZVTkMucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbbWQ1
c3VtXSA9ICIzNzBhNjM0MGZmMjAzNjZhYjA4ODAxMmNkMTNmMmI1NyIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI1NDljMmQyMWM1NzdhOGE5YzA0NTBmYWNiNWNjYTgwOWYyNjU5MWYwNDhlNDY2NTUy
MjQwOTQ3YmRmN2E4N2NjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJlODFlZjA4YmFhMjUxNmVj
ZGE3NmE3N2FkZjdkZWY3YmMzMjI3ZWViNTc4YjlhMzNiNDVmN2I0MWRjMDY0ZTYiCiAKIExJQ0VO
U0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IgotLSAKMi4zOS4yCgo=

--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39996834dc3d293e3cf66851ae538707990e8f12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 11 Mirrors 0 Missed 15 Current 226 (42% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 803 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 847 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 917 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 963 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 964 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 972 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 973 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 974 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 975 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 976 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 977 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 978 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 979 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 980 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 981 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 982 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 982 tasks of which 957 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/apr/1.7.3-r0/temp/log.do_packagedata.2135064
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39996834dc3d293e3cf66851ae538707990e8f12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 11 Mirrors 0 Missed 15 Current 226 (42% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 803 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_fetch)
NOTE: Running task 847 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_fetch)
NOTE: Running task 917 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_fetch)
NOTE: recipe serf-1.3.10-r0: task do_fetch: Started
NOTE: recipe apr-1.7.3-r0: task do_fetch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Started
NOTE: recipe serf-1.3.10-r0: task do_fetch: Succeeded
NOTE: Running task 961 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_unpack)
NOTE: recipe apr-util-1.6.3-r0: task do_fetch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_unpack)
NOTE: Running task 963 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_unpack)
NOTE: Running task 964 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe serf-1.3.10-r0: task do_unpack: Started
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Started
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe serf-1.3.10-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_patch)
NOTE: recipe apr-util-1.6.3-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_patch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Started
NOTE: recipe apr-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 967 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_patch)
NOTE: recipe apr-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Started
NOTE: recipe apr-util-1.6.3-r0: task do_patch: Succeeded
NOTE: Running task 968 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe serf-1.3.10-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 970 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic)
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Started
NOTE: recipe serf-1.3.10-r0: task do_populate_lic: Succeeded
NOTE: recipe apr-util-1.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/serf/serf_1.3.10.bb:do_populate_lic unihash changed to 761254ce560f32f5fbba85247c1fcf35f5ea740f624164a70bf91b6133c5de5f
NOTE: recipe serf-1.3.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe apr-1.7.3-r0: task do_patch: Succeeded
NOTE: Running task 971 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apr-1.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 972 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure)
NOTE: recipe apr-1.7.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 973 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 974 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile)
NOTE: recipe apr-1.7.3-r0: task do_compile: Started
NOTE: recipe apr-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 975 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 976 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install)
NOTE: recipe apr-1.7.3-r0: task do_install: Started
NOTE: recipe apr-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 977 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_install_ptest_base)
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe apr-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 978 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_populate_sysroot)
NOTE: Running task 979 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_package)
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Started
NOTE: recipe apr-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 980 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apr-util-1.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 981 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr-util_1.6.3.bb:do_configure)
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Started
NOTE: recipe apr-1.7.3-r0: task do_package: Succeeded
NOTE: Running task 982 of 1000 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata)
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Started
NOTE: recipe apr-1.7.3-r0: task do_packagedata: Failed
NOTE: recipe apr-util-1.6.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 982 tasks of which 957 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-src went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dbg went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-ptest went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-staticdev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-dev went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-doc went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-locale went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr-bin went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: QA Issue: Package version for package apr went backwards which would break package feeds (from 0:1.7.4-r0 to 0:1.7.3-r0) [version-going-backwards]
ERROR: apr-1.7.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/apr/1.7.3-r0/temp/log.do_packagedata.2152540
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/apr/apr_1.7.3.bb:do_packagedata) failed with exit code '1'

--===============1585806819149967036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/serf: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf: SRC_URI changed from "https://archive.apache.org/dist/serf/serf-1.3.9.tar.bz2 file://norpath.patch file://env.patch file://0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch file://0003-gen_def.patch file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch file://0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch" to "https://archive.apache.org/dist/serf/serf-1.3.10.tar.bz2 file://norpath.patch file://env.patch file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch file://0003-gen_def.patch file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch"
packages/core2-32-poky-linux/serf: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-dbg: PKGSIZE changed from 299984 to 300116 (+0%)
packages/core2-32-poky-linux/serf/serf-dbg: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-dbg: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-dev: PKGSIZE changed from 69732 to 69734 (+0%)
packages/core2-32-poky-linux/serf/serf-dev: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-dev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-doc: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-doc: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-locale: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-locale: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-src: PKGSIZE changed from 435970 to 437497 (+0%)
packages/core2-32-poky-linux/serf/serf-src: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-src: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf-staticdev: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf-staticdev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-32-poky-linux/serf/serf: PV changed from "1.3.9" to "1.3.10"
packages/core2-32-poky-linux/serf/serf: PKGV changed from 1.3.9 [default] to 1.3.10 [default]

--===============1585806819149967036==--

