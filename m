Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31459CA9EB1
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7640.1685693434251883645
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bQoUK/OB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b28867d-401a2263-ae09-4bc6-8eeb-6ee55a869bfc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RUgS7KTPBxC900d4Xu/s/GFAl9t/zn5EDfA9nDtSL0o=;
	b=bQoUK/OBncKvOkJIztg5r2ohMpmHIiEIEOgmnB2i+aFDbZxxrxJKXMXDnSs5h0Yo
	l4VIrtiuk79v96LrlC4af2j1uF5d41tFBPUa7McAYn+2HyRET7QNafaMsiOjpMn/hTe
	cZVUm5TdWO0Aw5OzASf/Xy5vVBfj2fT6dYxLBCe4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RUgS7KTPBxC900d4Xu/s/GFAl9t/zn5EDfA9nDtSL0o=;
	b=NzhBNmPEyBeSoQIXJFYM4NdaqNyNOuzaWvEojZKe9X9HOd4LUA/RoZQ5g59Va9oY
	NWa8UoR+Sl4gYsI8BHcpiy6dWHnUGK5Lu4aXyj7z8ZBmiUKoe0kDeuon4D0K4Y856Nb
	P/FUBkqVyCVOod37K/bsIjsiz4hKfEg/HaMAsUbM=
Content-Type: multipart/mixed; boundary="===============6066702722570702966=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.34.1 SUCCEEDED
Message-ID: <010101887b28867d-401a2263-ae09-4bc6-8eeb-6ee55a869bfc-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182226

--===============6066702722570702966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.34.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.32-2.34.1.patch
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
--===============6066702722570702966==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da628c50b217ad246a9d33475edfdea0fded6aaf"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 13 Mirrors 0 Missed 11 Current 310 (54% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 313 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 938 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_fetch)
NOTE: Running task 948 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: recipe repo-2.34.1-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: Running task 1159 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.34.1-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_unpack)
NOTE: Running task 1161 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe repo-2.34.1-r0: task do_unpack: Started
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 1214 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_unpack: Succeeded
NOTE: Running task 1215 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe repo-2.34.1-r0: task do_patch: Started
NOTE: recipe repo-2.34.1-r0: task do_patch: Succeeded
NOTE: Running task 1216 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1217 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic)
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 1218 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.3944969
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 333 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic unihash changed to eb2fa1f2c73dbd736eb7326a32aae9e9143384a10322246d2038a22d0bf01324
NOTE: Running task 1219 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_configure)
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1220 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_configure: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe repo-2.34.1-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_compile)
NOTE: recipe repo-2.34.1-r0: task do_compile: Started
NOTE: recipe repo-2.34.1-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_install)
NOTE: recipe repo-2.34.1-r0: task do_install: Started
NOTE: recipe repo-2.34.1-r0: task do_install: Succeeded
NOTE: Running task 1223 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package)
NOTE: Running task 1224 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.34.1-r0: task do_package: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package: Succeeded
NOTE: Running task 1225 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_packagedata)
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 1238 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1243 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1244 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: Running task 1245 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_write_rpm)
NOTE: Running task 1246 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_qa)
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1247 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1247 tasks of which 1220 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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

--===============6066702722570702966==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da628c50b217ad246a9d33475edfdea0fded6aaf"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 15 Mirrors 0 Missed 11 Current 308 (57% match, 96% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 780 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_fetch)
NOTE: Running task 784 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: recipe repo-2.34.1-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 880 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: recipe repo-2.34.1-r0: task do_fetch: Succeeded
NOTE: Running task 881 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe repo-2.34.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe repo-2.34.1-r0: task do_unpack: Succeeded
NOTE: Running task 896 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe repo-2.34.1-r0: task do_patch: Started
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.34.1-r0: task do_patch: Succeeded
NOTE: Running task 898 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 899 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.11.2-r0/temp/log.do_packagedata_setscene.3956122
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 331 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic unihash changed to eb2fa1f2c73dbd736eb7326a32aae9e9143384a10322246d2038a22d0bf01324
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1123 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1169 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_configure: Succeeded
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1233 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_compile)
NOTE: Running task 1234 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_install)
NOTE: recipe repo-2.34.1-r0: task do_install: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_install: Succeeded
NOTE: Running task 1237 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package)
NOTE: Running task 1238 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.34.1-r0: task do_package: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package: Succeeded
NOTE: Running task 1239 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1243 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1244 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: Running task 1245 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_write_rpm)
NOTE: Running task 1246 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_qa)
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1247 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1247 tasks of which 1220 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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

--===============6066702722570702966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 9 recipes from the core2-32 sysroot...done.
Removing 43 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:da628c50b217ad246a9d33475edfdea0fded6aaf"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 175 Mirrors 0 Missed 11 Current 144 (94% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 145 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 148 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 149 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 160 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 161 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 162 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 163 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 164 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 614 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_fetch)
NOTE: Running task 615 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.34.1-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 663 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: recipe repo-2.34.1-r0: task do_fetch: Succeeded
NOTE: Running task 664 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_unpack: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 175 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 178 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 189 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running setscene task 197 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 693 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.34.1-r0: task do_unpack: Succeeded
NOTE: Running task 694 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_patch)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_patch: Started
NOTE: Running setscene task 207 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.11.2-r0/temp/log.do_packagedata_setscene.3994968
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 216 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 221 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 738 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 741 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 743 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic)
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic unihash changed to eb2fa1f2c73dbd736eb7326a32aae9e9143384a10322246d2038a22d0bf01324
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 233 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 241 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1113 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1149 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1217 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_configure: Succeeded
NOTE: Running task 1218 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1219 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_compile: Started
NOTE: recipe repo-2.34.1-r0: task do_compile: Succeeded
NOTE: Running task 1220 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_install: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_install: Succeeded
NOTE: Running task 1222 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package)
NOTE: Running task 1223 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.34.1-r0: task do_package: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package: Succeeded
NOTE: Running task 1224 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1225 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1226 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1227 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1228 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1229 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: Running task 1230 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_write_rpm)
NOTE: Running task 1231 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_qa)
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Started
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1232 of 1232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1232 tasks of which 1205 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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

--===============6066702722570702966==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da628c50b217ad246a9d33475edfdea0fded6aaf"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 15 Mirrors 0 Missed 11 Current 308 (57% match, 96% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 780 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_fetch)
NOTE: Running task 784 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe repo-2.34.1-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 880 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_fetch: Succeeded
NOTE: Running task 894 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe repo-2.34.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe repo-2.34.1-r0: task do_unpack: Succeeded
NOTE: Running task 896 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe repo-2.34.1-r0: task do_patch: Started
NOTE: recipe repo-2.34.1-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 898 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic)
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 899 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.3968037
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 331 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic unihash changed to eb2fa1f2c73dbd736eb7326a32aae9e9143384a10322246d2038a22d0bf01324
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1123 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1169 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_configure: Succeeded
NOTE: Running task 1233 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1234 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_install)
NOTE: recipe repo-2.34.1-r0: task do_install: Started
NOTE: recipe repo-2.34.1-r0: task do_install: Succeeded
NOTE: Running task 1236 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package)
NOTE: Running task 1237 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_sysroot)
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.34.1-r0: task do_package: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package: Succeeded
NOTE: Running task 1239 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1243 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1244 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: Running task 1245 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_write_rpm)
NOTE: Running task 1246 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_qa)
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1247 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1247 tasks of which 1220 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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

--===============6066702722570702966==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da628c50b217ad246a9d33475edfdea0fded6aaf"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 15 Mirrors 0 Missed 11 Current 308 (57% match, 96% complete)
Removing 1 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 311 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 780 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_fetch)
NOTE: Running task 784 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_fetch)
NOTE: recipe repo-2.34.1-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Started
NOTE: recipe git-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 880 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running task 894 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_unpack)
NOTE: recipe git-2.39.2-r0: task do_unpack: Started
NOTE: recipe repo-2.34.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 895 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_patch)
NOTE: recipe repo-2.34.1-r0: task do_unpack: Succeeded
NOTE: Running task 896 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_patch)
NOTE: recipe git-2.39.2-r0: task do_patch: Started
NOTE: recipe repo-2.34.1-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.11.2-r0/temp/log.do_packagedata_setscene.3979697
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 331 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_setscene)
NOTE: recipe repo-2.34.1-r0: task do_patch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 898 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 899 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic)
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_lic unihash changed to eb2fa1f2c73dbd736eb7326a32aae9e9143384a10322246d2038a22d0bf01324
NOTE: recipe repo-2.34.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 334 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1123 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1169 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_configure: Succeeded
NOTE: Running task 1233 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1234 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_configure)
NOTE: recipe repo-2.34.1-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_configure: Started
NOTE: recipe repo-2.34.1-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_install)
NOTE: recipe repo-2.34.1-r0: task do_install: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_install: Succeeded
NOTE: Running task 1237 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package)
NOTE: Running task 1238 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.34.1-r0: task do_package: Started
NOTE: recipe repo-2.34.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package: Succeeded
NOTE: Running task 1239 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_packagedata)
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.34.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.39.2-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_compile)
NOTE: recipe git-2.39.2-r0: task do_compile: Started
NOTE: recipe git-2.39.2-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_install)
NOTE: recipe git-2.39.2-r0: task do_install: Started
NOTE: recipe git-2.39.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package)
NOTE: recipe git-2.39.2-r0: task do_package: Started
NOTE: recipe git-2.39.2-r0: task do_package: Succeeded
NOTE: Running task 1243 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_packagedata)
NOTE: recipe git-2.39.2-r0: task do_packagedata: Started
NOTE: recipe git-2.39.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1244 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.39.2.bb:do_package_write_rpm)
NOTE: Running task 1245 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_write_rpm)
NOTE: Running task 1246 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_package_qa)
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Started
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Started
NOTE: recipe repo-2.34.1-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.34.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe git-2.39.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1247 of 1247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.34.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1247 tasks of which 1220 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 76 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
ERROR: python3-3.11.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.3-r0 to 0:3.11.2-r0) [version-going-backwards]
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

--===============6066702722570702966==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.32-2.34.1.patch"

RnJvbSAwY2FhNTg1YjI3OTdhODdiOWEwNjk5ZjQ1YTA3ZWUwZGUwZDQwNTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxODoyNToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4zMiAtPiAyLjM0LjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi4zMi5iYiA9PiByZXBvXzIuMzQuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjMyLmJiID0+IHJlcG9fMi4zNC4xLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zMi5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM0LjEuYmIKaW5kZXggZGM3NTU3
ZWUxZS4uMWM1ZDFhMDhiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjMyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNC4x
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9n
ZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiN2ZhMTQ5YjQ3YTk4MDc3OWYwMmNjYWYxZDFkYmQ1YWY1
Y2U5YWJjNyIKK1NSQ1JFViA9ICI5NDVjMDA2ZjQwNjU1MGFkZDhhM2NhZDMyYWRhMDc5MWY1YTE1
YzUzIgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi4zOS4yCgo=

--===============6066702722570702966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.32 [default] to 2.34.1 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.32" to "2.34.1"
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 45822 to 45840 (+0%)

--===============6066702722570702966==--

