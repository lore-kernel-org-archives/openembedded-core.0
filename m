Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E23C4708E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.11731.1650052688454589878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MDxd2J1G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101802ecde631-a5419f47-66cd-4e37-866a-a50ff5ef7bd8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b1i818uXOyPkyhQ+AKUARWiBg6c/iAhNXnSuGsuPkfw=;
	b=MDxd2J1G6Jz8XzFGxK/JH3XZrqyh+ydGdvRhKLrcdy+hmak+7k5OtDJiOAYwqpdE
	/c1va//fkzlBvJXvxVIlb7KcZ/uPPhpQmDN6I2G8N8HVEagqDYxJSN3aQKXYKPAjWDi
	rzDDmBNN12MJ9S4jXayOTHEwL907p5ioicDNbI74=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b1i818uXOyPkyhQ+AKUARWiBg6c/iAhNXnSuGsuPkfw=;
	b=g9F/huMibk0ExpYmlkUrfIMEChkXTwh4y23mAZ4xQsIV+GEa5EGascNxvThEDekb
	DPLitFHi+q4EjK/LzaJmwFHfkSx/smHEWvb3Zx9rh3H4iFbs1thzU8asmw4plcAvk5h
	HYQoxGvyshM4UdhIDSwmk6f4J3QvK1bOMlPdVHtA=
Content-Type: multipart/mixed; boundary="===============3937114086472623546=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.23 SUCCEEDED
Message-ID: 
 <010101802ecde631-a5419f47-66cd-4e37-866a-a50ff5ef7bd8-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164473

--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.23* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.22-2.23.patch
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
--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cac9905a760a46b6f39a0a56f0d0395858ad528"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 5 Mirrors 0 Missed 11 Current 301 (31% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_fetch)
NOTE: Running task 956 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: recipe repo-2.23-r0: task do_fetch: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe repo-2.23-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_unpack)
NOTE: Running task 1165 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1167 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.23-r0: task do_unpack: Started
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_patch: Succeeded
NOTE: Running task 1169 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 1170 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_populate_lic: Started
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic unihash changed to 869149e3575832434b31ac797599a3d71cf4c46a814bcc38578b907efc71d63c
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1172 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_configure)
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.23-r0: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_compile)
NOTE: recipe repo-2.23-r0: task do_compile: Started
NOTE: recipe repo-2.23-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1176 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe repo-2.23-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe repo-2.23-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_package)
NOTE: Running task 1178 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_sysroot)
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_package: Started
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_package: Succeeded
NOTE: Running task 1179 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_packagedata)
NOTE: recipe repo-2.23-r0: task do_packagedata: Started
NOTE: recipe repo-2.23-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1181 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1182 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1183 tasks of which 1161 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.35.1-r0/temp/log.do_packagedata.3181613
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata) failed with exit code '1'

--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cac9905a760a46b6f39a0a56f0d0395858ad528"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 5 Mirrors 0 Missed 11 Current 301 (31% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_fetch)
NOTE: Running task 956 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: recipe repo-2.23-r0: task do_fetch: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe repo-2.23-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_unpack)
NOTE: Running task 1165 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1167 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.23-r0: task do_unpack: Started
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_patch: Succeeded
NOTE: Running task 1169 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 1170 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic unihash changed to 869149e3575832434b31ac797599a3d71cf4c46a814bcc38578b907efc71d63c
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1172 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_configure)
NOTE: Running task 1173 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.23-r0: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_compile)
NOTE: recipe repo-2.23-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1175 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe repo-2.23-r0: task do_compile: Succeeded
NOTE: Running task 1176 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe repo-2.23-r0: task do_install: Started
NOTE: recipe repo-2.23-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_package)
NOTE: Running task 1178 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_sysroot)
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_package: Started
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_package: Succeeded
NOTE: Running task 1179 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_packagedata)
NOTE: recipe repo-2.23-r0: task do_packagedata: Started
NOTE: recipe repo-2.23-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1181 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1182 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1183 tasks of which 1161 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.35.1-r0/temp/log.do_packagedata.3172753
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata) failed with exit code '1'

--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-32 sysroot...done.
Removing 41 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cac9905a760a46b6f39a0a56f0d0395858ad528"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 174 Local 163 Mirrors 0 Missed 11 Current 137 (93% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 140 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 141 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 146 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 147 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 154 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 155 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 156 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 157 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 595 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_fetch)
NOTE: Running task 596 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.23-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe repo-2.23-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 635 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_unpack)
NOTE: Running task 636 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.23-r0: task do_unpack: Started
NOTE: Running setscene task 164 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 168 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 171 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.23-r0: task do_unpack: Succeeded
NOTE: Running task 650 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.23-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 185 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe repo-2.23-r0: task do_patch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: Running task 672 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 673 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic)
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 194 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.23-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic unihash changed to 869149e3575832434b31ac797599a3d71cf4c46a814bcc38578b907efc71d63c
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 217 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 690 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 222 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 227 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 236 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 304 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1055 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1149 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_configure)
NOTE: recipe repo-2.23-r0: task do_configure: Started
NOTE: recipe repo-2.23-r0: task do_configure: Succeeded
NOTE: Running task 1150 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1151 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe repo-2.23-r0: task do_compile: Started
NOTE: recipe repo-2.23-r0: task do_compile: Succeeded
NOTE: Running task 1152 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe repo-2.23-r0: task do_install: Started
NOTE: recipe repo-2.23-r0: task do_install: Succeeded
NOTE: Running task 1153 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_package)
NOTE: Running task 1154 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_sysroot)
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_package: Started
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_package: Succeeded
NOTE: Running task 1155 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_packagedata)
NOTE: recipe repo-2.23-r0: task do_packagedata: Started
NOTE: recipe repo-2.23-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1157 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1158 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1159 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1159 tasks of which 1137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.35.1-r0/temp/log.do_packagedata.3203461
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata) failed with exit code '1'

--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cac9905a760a46b6f39a0a56f0d0395858ad528"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 5 Mirrors 0 Missed 11 Current 301 (31% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_fetch)
NOTE: Running task 956 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: recipe repo-2.23-r0: task do_fetch: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe repo-2.23-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_unpack)
NOTE: Running task 1165 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1167 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.23-r0: task do_unpack: Started
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_patch: Succeeded
NOTE: Running task 1169 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 1170 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic unihash changed to 869149e3575832434b31ac797599a3d71cf4c46a814bcc38578b907efc71d63c
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1172 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_configure)
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.23-r0: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_compile)
NOTE: recipe repo-2.23-r0: task do_compile: Started
NOTE: recipe repo-2.23-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1176 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe repo-2.23-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe repo-2.23-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_package)
NOTE: Running task 1178 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_sysroot)
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_package: Started
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_package: Succeeded
NOTE: Running task 1179 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_packagedata)
NOTE: recipe repo-2.23-r0: task do_packagedata: Started
NOTE: recipe repo-2.23-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1181 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1182 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1183 tasks of which 1161 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.35.1-r0/temp/log.do_packagedata.3163878
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata) failed with exit code '1'

--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1cac9905a760a46b6f39a0a56f0d0395858ad528"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 16 Local 5 Mirrors 0 Missed 11 Current 301 (31% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_fetch)
NOTE: Running task 956 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_fetch)
NOTE: recipe repo-2.23-r0: task do_fetch: Started
NOTE: recipe git-2.35.1-r0: task do_fetch: Started
NOTE: recipe repo-2.23-r0: task do_fetch: Succeeded
NOTE: recipe git-2.35.1-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_unpack)
NOTE: Running task 1165 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_unpack)
NOTE: Running task 1167 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.23-r0: task do_unpack: Started
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.35.1-r0: task do_unpack: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_patch: Started
NOTE: recipe repo-2.23-r0: task do_patch: Succeeded
NOTE: Running task 1169 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 1170 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic)
NOTE: recipe git-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_patch)
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_populate_lic: Started
NOTE: recipe git-2.35.1-r0: task do_patch: Started
NOTE: recipe git-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_lic unihash changed to 869149e3575832434b31ac797599a3d71cf4c46a814bcc38578b907efc71d63c
NOTE: recipe repo-2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1172 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_configure)
NOTE: recipe git-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.23-r0: task do_configure: Started
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.23-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_compile)
NOTE: recipe repo-2.23-r0: task do_compile: Started
NOTE: recipe repo-2.23-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1176 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_configure)
NOTE: recipe repo-2.23-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_configure: Started
NOTE: recipe repo-2.23-r0: task do_install: Succeeded
NOTE: Running task 1177 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_package)
NOTE: Running task 1178 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_populate_sysroot)
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.23-r0: task do_package: Started
NOTE: recipe repo-2.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.23-r0: task do_package: Succeeded
NOTE: Running task 1179 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.23.bb:do_packagedata)
NOTE: recipe repo-2.23-r0: task do_packagedata: Started
NOTE: recipe repo-2.23-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1180 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_compile)
NOTE: recipe git-2.35.1-r0: task do_compile: Started
NOTE: recipe git-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1181 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_install)
NOTE: recipe git-2.35.1-r0: task do_install: Started
NOTE: recipe git-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1182 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_package)
NOTE: recipe git-2.35.1-r0: task do_package: Started
NOTE: recipe git-2.35.1-r0: task do_package: Succeeded
NOTE: Running task 1183 of 1187 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata)
NOTE: recipe git-2.35.1-r0: task do_packagedata: Started
NOTE: recipe git-2.35.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1183 tasks of which 1161 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.35.3-r0 to 0:2.35.1-r0) [version-going-backwards]
ERROR: git-2.35.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.35.1-r0/temp/log.do_packagedata.3190456
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.35.1.bb:do_packagedata) failed with exit code '1'

--===============3937114086472623546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.22 [default] to 2.23 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.22" to "2.23"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.22 [default] to 2.23 [default]

--===============3937114086472623546==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-repo-upgrade-2.22-2.23.patch"

From d7d27a9ab809687af4cb7727663c5cdd1969228d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:47:30 +0000
Subject: [PATCH] repo: upgrade 2.22 -> 2.23

---
 meta/recipes-devtools/repo/{repo_2.22.bb => repo_2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.22.bb => repo_2.23.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.22.bb b/meta/recipes-devtools/repo/repo_2.23.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.22.bb
rename to meta/recipes-devtools/repo/repo_2.23.bb
index a99d5d7070..0b4e9743a6 100644
--- a/meta/recipes-devtools/repo/repo_2.22.bb
+++ b/meta/recipes-devtools/repo/repo_2.23.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "cc879a97c3e2614d19b15b4661c3cab4d33139c9"
+SRCREV = "d56e2eb4216827284220fcc35af42e60b4faaea6"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.27.0


--===============3937114086472623546==--

