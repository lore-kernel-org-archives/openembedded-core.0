Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B6EC88C96
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13522.1681581684972964731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bjvzadjb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018786143954-09f40949-9472-473b-88fe-33ca992189db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t+IPjFfxVZlDiDDAeOd0arZJPpCPeDkm5DqoQNYagWk=;
	b=bjvzadjbl+VnLM/GMrKUcVpDhYna9YYr4WJJkPZaMuMFsofFc+fvwCNfo3Jzo4mH
	T/56eIvWcuI6GsfF8sJdAezkcZCX1buN8Ti1+68EMW3OuRu3hGpnt++PtJykY+cb502
	6qLwraa4HMGdz5AarevKxEU1lsaA9ppPekOFTDIY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t+IPjFfxVZlDiDDAeOd0arZJPpCPeDkm5DqoQNYagWk=;
	b=IL3ZqoYLU4/Hij69g9ZJqNqm2sS1f25wRCOs2tfj1NhjUOUieH5QbQtzB3BMsa63
	nUG7/rQdPPW4WYSwYc1zl50/KbNs95Z5ejVZQ6j0Bp6FCVtMt8kTYqQptawQjgiP7XP
	gvgVHm1nHWY6OIMMbG5oKTf+6R8PzamCbnwQqjrc=
Content-Type: multipart/mixed; boundary="===============6057464613308847183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.24 SUCCEEDED
Message-ID: <0101018786143954-09f40949-9472-473b-88fe-33ca992189db-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180059

--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsolv* to *0.7.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.23-0.7.24.patch
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
--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:395a87ce21fb6e5e6d46222152630bf0982f0327"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 13 Mirrors 0 Missed 7 Current 464 (65% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1553 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.700600
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 483 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: Running task 1651 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: Running task 1653 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1654 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 1655 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic)
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic unihash changed to 674174b7eb14dde9142c54a1fc0be1f6f4b723ffa4f53ae7e78376102d447830
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1701 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1709 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Succeeded
NOTE: Running task 1723 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_compile)
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_install)
NOTE: recipe libsolv-0.7.24-r0: task do_install: Started
NOTE: recipe libsolv-0.7.24-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package)
NOTE: Running task 1726 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_package: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_packagedata)
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1728 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_write_rpm)
NOTE: Running task 1729 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_qa)
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1730 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1730 tasks of which 1713 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 73 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsolv: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2364884 to 2374764 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-dev: PKGSIZE changed from 128805 to 129442 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-doc: PKGSIZE changed from 296630 to 297156 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-src: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1637219 to 1642876 (+0%)
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolv: PV changed from "0.7.23" to "0.7.24"
packages/core2-32-poky-linux/libsolv/libsolv: PKGSIZE changed from 674232 to 678328 (+1%)
packages/core2-32-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.23 [default] to 0.7.24 [default]
packages/core2-32-poky-linux/libsolv/libsolvext: PV changed from "0.7.23" to "0.7.24"

--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:395a87ce21fb6e5e6d46222152630bf0982f0327"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 21 Local 14 Mirrors 0 Missed 7 Current 463 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1553 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.712697
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 483 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: Running task 1651 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: Running task 1653 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1654 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 1655 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic)
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic unihash changed to 674174b7eb14dde9142c54a1fc0be1f6f4b723ffa4f53ae7e78376102d447830
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1701 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1709 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Succeeded
NOTE: Running task 1723 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_compile)
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_install)
NOTE: recipe libsolv-0.7.24-r0: task do_install: Started
NOTE: recipe libsolv-0.7.24-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package)
NOTE: Running task 1726 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_package: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_packagedata)
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1728 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_write_rpm)
NOTE: Running task 1729 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_qa)
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1730 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1730 tasks of which 1713 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 73 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6057464613308847183==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.23-0.7.24.patch"

RnJvbSA0M2I0MjMxZjI5MWYwOWI5YjUwMWIyYWNiZDY4MWFjZDE2ZGUxMDc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTE6Mjk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb2x2OiB1cGdyYWRlIDAuNy4yMyAtPiAwLjcuMjQKCi0tLQogLi4uL2xpYnNvbHYve2xpYnNv
bHZfMC43LjIzLmJiID0+IGxpYnNvbHZfMC43LjI0LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYve2xpYnNvbHZfMC43LjIzLmJiID0+IGxpYnNvbHZfMC43
LjI0LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2
L2xpYnNvbHZfMC43LjIzLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29s
dl8wLjcuMjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZfMC43LjI0LmJiCmluZGV4IDEyNTY5MDU3MjAuLjdj
OGYxZmQzNzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNv
bHZfMC43LjIzLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJzb2x2L2xpYnNvbHZf
MC43LjI0LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9v
cGVuU1VTRS9saWJzb2x2LmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtdXRpbHMtQ29uc2lkZS1tdXNsLXdoZW4td3JhcHBpbmctcXNvcnRf
ci5wYXRjaCBcCiAiCiAKLVNSQ1JFViA9ICI2ZGVhY2E3Y2Y2MWVjMmIzMmM0YTNiNDk0YTc1MWM4
ZDE1ZWZiZThiIgorU1JDUkVWID0gIjRkMDVkY2EzOTc0MTU2ZmFmMmYwMjVjYTRhODJiNjg5MDQ4
NDgzMDciCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxk
KykrKSIKIAotLSAKMi4zOS4yCgo=

--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 81 recipes from the core2-32 sysroot...done.
Removing 80 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:395a87ce21fb6e5e6d46222152630bf0982f0327"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 203 Local 196 Mirrors 0 Missed 7 Current 130 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 136 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 137 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 140 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 141 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 595 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: Running task 596 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 147 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_packagedata_setscene)
NOTE: Running setscene task 148 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 149 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 152 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.188.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 153 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 154 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 156 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 159 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 161 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 162 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.188-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 164 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 165 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 167 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 168 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: Running task 618 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 174 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 179 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 182 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 183 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 184 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 185 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: Running setscene task 188 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.11.2-r0/temp/log.do_packagedata_setscene.717230
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 191 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 198 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 207 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 214 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 216 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 659 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 660 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 661 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 219 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic unihash changed to 674174b7eb14dde9142c54a1fc0be1f6f4b723ffa4f53ae7e78376102d447830
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 222 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 243 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 248 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 274 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 280 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 333 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1192 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1196 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_compile)
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Succeeded
NOTE: Running task 1203 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_install)
NOTE: recipe libsolv-0.7.24-r0: task do_install: Started
NOTE: recipe libsolv-0.7.24-r0: task do_install: Succeeded
NOTE: Running task 1204 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package)
NOTE: Running task 1205 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package: Succeeded
NOTE: Running task 1206 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_packagedata)
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1207 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_write_rpm)
NOTE: Running task 1208 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_qa)
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1209 of 1209 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1209 tasks of which 1192 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 73 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:395a87ce21fb6e5e6d46222152630bf0982f0327"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 21 Local 14 Mirrors 0 Missed 7 Current 463 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1553 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: Running task 1651 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.11.2-r0/temp/log.do_packagedata_setscene.704679
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 483 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: Running task 1653 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1654 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 1655 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic)
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic unihash changed to 674174b7eb14dde9142c54a1fc0be1f6f4b723ffa4f53ae7e78376102d447830
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1701 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1709 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Succeeded
NOTE: Running task 1723 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_compile)
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_install)
NOTE: recipe libsolv-0.7.24-r0: task do_install: Started
NOTE: recipe libsolv-0.7.24-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package)
NOTE: Running task 1726 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_package: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_packagedata)
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1728 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_write_rpm)
NOTE: Running task 1729 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_qa)
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1730 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1730 tasks of which 1713 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 73 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6057464613308847183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:395a87ce21fb6e5e6d46222152630bf0982f0327"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 21 Local 14 Mirrors 0 Missed 7 Current 463 (66% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 467 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1553 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_fetch: Succeeded
NOTE: Running task 1651 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_unpack)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.708664
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 483 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe libsolv-0.7.24-r0: task do_unpack: Succeeded
NOTE: Running task 1652 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_patch)
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_patch: Succeeded
NOTE: Running task 1653 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1654 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_generate_toolchain_file)
NOTE: Running task 1655 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic)
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsolv-0.7.24-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_lic unihash changed to 674174b7eb14dde9142c54a1fc0be1f6f4b723ffa4f53ae7e78376102d447830
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libsolv-0.7.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1701 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: Running task 1709 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_configure)
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.24-r0: task do_configure: Succeeded
NOTE: Running task 1723 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_compile)
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.24-r0: task do_compile: Succeeded
NOTE: Running task 1724 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_install)
NOTE: recipe libsolv-0.7.24-r0: task do_install: Started
NOTE: recipe libsolv-0.7.24-r0: task do_install: Succeeded
NOTE: Running task 1725 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package)
NOTE: Running task 1726 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_populate_sysroot)
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package: Started
NOTE: recipe libsolv-0.7.24-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_packagedata)
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.24-r0: task do_packagedata: Succeeded
NOTE: Running task 1728 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_write_rpm)
NOTE: Running task 1729 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_package_qa)
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Started
NOTE: recipe libsolv-0.7.24-r0: task do_package_qa: Succeeded
NOTE: recipe libsolv-0.7.24-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1730 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.24.bb:do_build)
NOTE: Tasks Summary: Attempted 1730 tasks of which 1713 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 73 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6057464613308847183==--

