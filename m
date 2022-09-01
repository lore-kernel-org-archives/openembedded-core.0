Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3585C6FA9B
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.12626.1662040786805022579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W+LVpJ0d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010182f959c40f-401c5d37-0b86-44cf-a01c-7ff039780589-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TVjvNs4bnn2plLYczsxKR6Tm6DvNIRnbXw7ZdtpyueE=;
	b=W+LVpJ0dqRAACD9ulQUK7XdLmHmDSlhhHPC+OIj2rT0akWiU5wi5mbJYNIx4RIq/
	Etcl/0KB+Wj9phKeJaPsrnQjqeiFKVjoYB4bFniL4YA1naSuI0iIe+1c7C/k+jvTR9U
	+/M37dN8bzYDjjeD1R9MTidqKh65kx5hFMbVrcSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TVjvNs4bnn2plLYczsxKR6Tm6DvNIRnbXw7ZdtpyueE=;
	b=Y216xKVOmXQmuoxDqQ/k/n2Ev8uHkSRnQGEDRzpPLZz8Fa/krjLd5sbvvPcj5lSQ
	9exWoj2FLuTXmqY0YPcubUdnrry1/f7XFK/TTuMFG+kS65nTOPkgYvJfZJRGYtQitH3
	9cNiVONiDnhSUkD//LwSAanChNEEd5nT+W51QuJE=
Content-Type: multipart/mixed; boundary="===============7492336134472247362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.29.1 SUCCEEDED
Message-ID: 
 <01010182f959c40f-401c5d37-0b86-44cf-a01c-7ff039780589-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170189

--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.29.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.28-2.29.1.patch
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
--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe repo-2.29.1-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.1-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic unihash changed to 9b663a6621f6429d43a47dddb81b1f11fb9014132a99126c2064967721f7fc14
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.1-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_configure: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_compile)
NOTE: recipe repo-2.29.1-r0: task do_compile: Started
NOTE: recipe repo-2.29.1-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_install)
NOTE: recipe repo-2.29.1-r0: task do_install: Started
NOTE: recipe repo-2.29.1-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_package: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_packagedata)
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.37.2-r0/temp/log.do_packagedata.495571
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.1-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic unihash changed to 9b663a6621f6429d43a47dddb81b1f11fb9014132a99126c2064967721f7fc14
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.1-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_configure: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_compile)
NOTE: recipe repo-2.29.1-r0: task do_compile: Started
NOTE: recipe repo-2.29.1-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_install)
NOTE: recipe repo-2.29.1-r0: task do_install: Started
NOTE: recipe repo-2.29.1-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_package: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_packagedata)
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.37.2-r0/temp/log.do_packagedata.477367
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1659 targets, 49 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-32 sysroot...done.
Removing 110 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 170 Local 159 Mirrors 0 Missed 11 Current 141 (93% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 143 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 144 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 149 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 157 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 160 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 161 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 595 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_fetch)
NOTE: Running task 596 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe curl-7.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 635 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe repo-2.29.1-r0: task do_fetch: Succeeded
NOTE: Running task 636 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_unpack)
NOTE: recipe repo-2.29.1-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 168 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 171 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 187 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 670 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_patch)
NOTE: Running task 671 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe repo-2.29.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 193 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_patch: Succeeded
NOTE: Running task 680 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 681 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 220 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Started
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 694 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 227 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic unihash changed to 9b663a6621f6429d43a47dddb81b1f11fb9014132a99126c2064967721f7fc14
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 240 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1058 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1096 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1152 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_configure)
NOTE: recipe repo-2.29.1-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_configure: Succeeded
NOTE: Running task 1153 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1154 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.1-r0: task do_compile: Started
NOTE: recipe repo-2.29.1-r0: task do_compile: Succeeded
NOTE: Running task 1155 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_install: Started
NOTE: recipe repo-2.29.1-r0: task do_install: Succeeded
NOTE: Running task 1156 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_package)
NOTE: Running task 1157 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_package: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_packagedata)
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1160 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1161 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1162 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1162 tasks of which 1140 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.37.2-r0/temp/log.do_packagedata.509053
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.28 [default] to 2.29.1 [default]
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 45312 to 45758 (+1%)
packages/core2-32-poky-linux/repo/repo: PV changed from "2.28" to "2.29.1"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.28 [default] to 2.29.1 [default]

--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_unpack: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_patch)
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_patch: Started
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.1-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic unihash changed to 9b663a6621f6429d43a47dddb81b1f11fb9014132a99126c2064967721f7fc14
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.1-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_configure: Succeeded
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_compile: Started
NOTE: recipe repo-2.29.1-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_install)
NOTE: recipe repo-2.29.1-r0: task do_install: Started
NOTE: recipe repo-2.29.1-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_package: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_packagedata)
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.37.2-r0/temp/log.do_packagedata.468246
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============7492336134472247362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (0 cached, 884 parsed). 1658 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2685be24c7c2c6e69244740ea118cb3510ac6b53"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2685be24c7c2c6e69244740ea118cb3510ac6b53"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 942 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_fetch)
NOTE: Running task 955 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_fetch)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Started
NOTE: recipe git-2.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_unpack)
NOTE: Running task 1159 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_fetch: Succeeded
NOTE: Running task 1160 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_unpack)
NOTE: Running task 1161 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.2-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_unpack: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 1162 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_patch)
NOTE: recipe git-2.37.2-r0: task do_patch: Started
NOTE: recipe repo-2.29.1-r0: task do_patch: Started
NOTE: recipe repo-2.29.1-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic)
NOTE: recipe git-2.37.2-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_lic unihash changed to 9b663a6621f6429d43a47dddb81b1f11fb9014132a99126c2064967721f7fc14
NOTE: recipe repo-2.29.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_configure)
NOTE: recipe git-2.37.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1168 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_configure)
NOTE: recipe repo-2.29.1-r0: task do_configure: Started
NOTE: recipe repo-2.29.1-r0: task do_configure: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Started
NOTE: Running task 1169 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_compile)
NOTE: recipe repo-2.29.1-r0: task do_compile: Started
NOTE: recipe repo-2.29.1-r0: task do_compile: Succeeded
NOTE: Running task 1170 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_install)
NOTE: recipe repo-2.29.1-r0: task do_install: Started
NOTE: recipe repo-2.29.1-r0: task do_install: Succeeded
NOTE: Running task 1171 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_package)
NOTE: Running task 1172 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.29.1-r0: task do_package: Started
NOTE: recipe repo-2.29.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.29.1-r0: task do_package: Succeeded
NOTE: Running task 1173 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.29.1.bb:do_packagedata)
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.29.1-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.2-r0: task do_configure: Succeeded
NOTE: Running task 1174 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_compile)
NOTE: recipe git-2.37.2-r0: task do_compile: Started
NOTE: recipe git-2.37.2-r0: task do_compile: Succeeded
NOTE: Running task 1175 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_install)
NOTE: recipe git-2.37.2-r0: task do_install: Started
NOTE: recipe git-2.37.2-r0: task do_install: Succeeded
NOTE: Running task 1176 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_package)
NOTE: recipe git-2.37.2-r0: task do_package: Started
NOTE: recipe git-2.37.2-r0: task do_package: Succeeded
NOTE: Running task 1177 of 1181 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata)
NOTE: recipe git-2.37.2-r0: task do_packagedata: Started
NOTE: recipe git-2.37.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1177 tasks of which 1155 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.3-r0 to 0:2.37.2-r0) [version-going-backwards]
ERROR: git-2.37.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.37.2-r0/temp/log.do_packagedata.486498
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.2.bb:do_packagedata) failed with exit code '1'

--===============7492336134472247362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.28-2.29.1.patch"

RnJvbSA5OTNhMzNhMzJkYzljMDliNzYzZDY0NzY2MzkyYzQ3MWUxZWJhMGQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwODowMjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4yOCAtPiAyLjI5LjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi4yOC5iYiA9PiByZXBvXzIuMjkuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjI4LmJiID0+IHJlcG9fMi4yOS4xLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjI5LjEuYmIKaW5kZXggMDUyMTA4
ZTllNS4uNzQwMTMyYzJmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjI4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4x
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9n
ZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiYThjZjU3NWQ2OGU3ZTIxMTI5MmQ5NjdmNGExMmNmNjA5
YTAyOGIyMCIKK1NSQ1JFViA9ICI0MTEyYzA3Njg4ZDBlMGU1Njg0NzhlOWY0MmJlMzQ5YmRkNTEx
ZDQ1IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi4zMS4xCgo=

--===============7492336134472247362==--

