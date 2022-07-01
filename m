Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A91C04E85
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.39383.1656687063326132163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ihE06/OG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181ba3e6e6f-2d4efb04-5e6b-4ae4-a573-9cb56796bd35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QypI3zjyg8qBf3TbmyBOav0NNlBtvP18yGQvp3OHofk=;
	b=ihE06/OGSuIY77DuoB82D9nJuxmqYpAIkbBHl2TEbAevZTpv3PqZ3bFi+DrSwv28
	BNKo7s3rAgEOUkyG7PDionrKHeW1z4tpNmMstI2bXetNHcIQfz8h/J8DqBpoNvwasHF
	YUstSslOvQu3XUUTBFgErPMjXZ8Ddb3yXjsyXEe4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QypI3zjyg8qBf3TbmyBOav0NNlBtvP18yGQvp3OHofk=;
	b=LxE4L4EoXpqKbAMSyifhgCduCsK7vD+HwwWSnK0HhHF9v1LQNrgujBY8MjakqdfS
	MQAcdbz2R//vHjdLp4xurk0gSz2y3uKbNxZiNAvhdaDfMVmWuiCctPBLtRTt/28TDK/
	lycIqjx7zM8hCQd5waVtcJpvpgn/QX+XPuyjlnSE=
Content-Type: multipart/mixed; boundary="===============4248630003024632822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.27 SUCCEEDED
Message-ID: 
 <01010181ba3e6e6f-2d4efb04-5e6b-4ae4-a573-9cb56796bd35-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167496

--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.26-2.27.patch
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
--===============4248630003024632822==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-repo-upgrade-2.26-2.27.patch"

From b6c70a73923670e91e972f708f02a2faec417862 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 09:09:10 +0000
Subject: [PATCH] repo: upgrade 2.26 -> 2.27

---
 meta/recipes-devtools/repo/{repo_2.26.bb => repo_2.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.26.bb => repo_2.27.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.26.bb b/meta/recipes-devtools/repo/repo_2.27.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.26.bb
rename to meta/recipes-devtools/repo/repo_2.27.bb
index ff5b7eb6aa..3c1e3acd7c 100644
--- a/meta/recipes-devtools/repo/repo_2.26.bb
+++ b/meta/recipes-devtools/repo/repo_2.27.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "bdcba7dc36f1c8e6041681eb5b3b5229c93c7c5c"
+SRCREV = "68d69635c7bfef6ed8a5c7e29246265611471e0f"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.31.1


--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 928 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_fetch)
NOTE: Running task 947 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: recipe repo-2.27-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: Running task 1156 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.27-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_unpack)
NOTE: Running task 1158 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_unpack: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_patch)
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe repo-2.27-r0: task do_patch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe repo-2.27-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic)
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic unihash changed to 2c99e6dc208e0b4f3855c117381ea3b03f6ef4d6457e67b017a7c6146b68365f
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1164 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1165 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_configure)
NOTE: recipe repo-2.27-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_configure: Succeeded
NOTE: recipe git-2.36.1-r0: task do_configure: Started
NOTE: Running task 1166 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_compile)
NOTE: recipe repo-2.27-r0: task do_compile: Started
NOTE: recipe repo-2.27-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_install)
NOTE: recipe repo-2.27-r0: task do_install: Started
NOTE: recipe repo-2.27-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_package)
NOTE: Running task 1169 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_sysroot)
NOTE: recipe repo-2.27-r0: task do_package: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_packagedata)
NOTE: recipe repo-2.27-r0: task do_packagedata: Started
NOTE: recipe repo-2.27-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1172 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_install)
NOTE: recipe git-2.36.1-r0: task do_install: Started
NOTE: recipe git-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1173 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_package)
NOTE: recipe git-2.36.1-r0: task do_package: Started
NOTE: recipe git-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata)
NOTE: recipe git-2.36.1-r0: task do_packagedata: Started
NOTE: recipe git-2.36.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1174 tasks of which 1152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.36.1-r0/temp/log.do_packagedata.3562756
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata) failed with exit code '1'

--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.26" to "2.27"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.26 [default] to 2.27 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.26" to "2.27"

--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1656 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 928 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_fetch)
NOTE: Running task 947 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: recipe repo-2.27-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: Running task 1156 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.27-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_unpack)
NOTE: Running task 1158 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: recipe repo-2.27-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_patch)
NOTE: Running task 1160 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe repo-2.27-r0: task do_patch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe repo-2.27-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic)
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic unihash changed to 2c99e6dc208e0b4f3855c117381ea3b03f6ef4d6457e67b017a7c6146b68365f
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1164 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1165 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_configure)
NOTE: recipe repo-2.27-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_configure: Succeeded
NOTE: Running task 1166 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_compile: Started
NOTE: recipe repo-2.27-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_install)
NOTE: recipe repo-2.27-r0: task do_install: Started
NOTE: recipe repo-2.27-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_package)
NOTE: Running task 1169 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_sysroot)
NOTE: recipe repo-2.27-r0: task do_package: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_packagedata)
NOTE: recipe repo-2.27-r0: task do_packagedata: Started
NOTE: recipe repo-2.27-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1172 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_install)
NOTE: recipe git-2.36.1-r0: task do_install: Started
NOTE: recipe git-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1173 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_package)
NOTE: recipe git-2.36.1-r0: task do_package: Started
NOTE: recipe git-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata)
NOTE: recipe git-2.36.1-r0: task do_packagedata: Started
NOTE: recipe git-2.36.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1174 tasks of which 1152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.36.1-r0/temp/log.do_packagedata.3535499
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata) failed with exit code '1'

--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-32 sysroot...done.
Removing 41 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 170 Local 159 Mirrors 0 Missed 11 Current 141 (93% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 143 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 144 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 149 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 157 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 159 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 160 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 161 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.83.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 595 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_fetch)
NOTE: Running task 596 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: recipe repo-2.27-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 635 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: recipe repo-2.27-r0: task do_fetch: Succeeded
NOTE: Running task 636 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 166 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.83.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 169 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 171 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 172 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 183 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe repo-2.27-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 666 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_patch)
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 671 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.27-r0: task do_patch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 194 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe repo-2.27-r0: task do_patch: Succeeded
NOTE: Running task 684 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 685 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 690 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 220 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe repo-2.27-r0: task do_populate_lic: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 225 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic unihash changed to 2c99e6dc208e0b4f3855c117381ea3b03f6ef4d6457e67b017a7c6146b68365f
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 237 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
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
NOTE: Running setscene task 278 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1055 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1149 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_configure)
NOTE: recipe repo-2.27-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_configure: Succeeded
NOTE: Running task 1150 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1151 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_configure)
NOTE: recipe repo-2.27-r0: task do_compile: Started
NOTE: recipe git-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_compile: Succeeded
NOTE: Running task 1152 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_install)
NOTE: recipe repo-2.27-r0: task do_install: Started
NOTE: recipe repo-2.27-r0: task do_install: Succeeded
NOTE: Running task 1153 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_package)
NOTE: Running task 1154 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_sysroot)
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_package: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_package: Succeeded
NOTE: Running task 1155 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_packagedata)
NOTE: recipe repo-2.27-r0: task do_packagedata: Started
NOTE: recipe repo-2.27-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1156 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1157 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_install)
NOTE: recipe git-2.36.1-r0: task do_install: Started
NOTE: recipe git-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1158 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_package)
NOTE: recipe git-2.36.1-r0: task do_package: Started
NOTE: recipe git-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1159 of 1163 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata)
NOTE: recipe git-2.36.1-r0: task do_packagedata: Started
NOTE: recipe git-2.36.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1159 tasks of which 1137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.36.1-r0/temp/log.do_packagedata.3576010
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata) failed with exit code '1'

--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 928 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_fetch)
NOTE: Running task 947 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: recipe repo-2.27-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: Running task 1156 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.27-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_unpack)
NOTE: Running task 1158 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_unpack: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_patch)
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1160 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe repo-2.27-r0: task do_patch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe repo-2.27-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic)
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.27-r0: task do_populate_lic: Started
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic unihash changed to 2c99e6dc208e0b4f3855c117381ea3b03f6ef4d6457e67b017a7c6146b68365f
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1164 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1165 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_configure)
NOTE: recipe repo-2.27-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_configure: Succeeded
NOTE: Running task 1166 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_compile: Started
NOTE: recipe repo-2.27-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_install)
NOTE: recipe repo-2.27-r0: task do_install: Started
NOTE: recipe repo-2.27-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_package)
NOTE: Running task 1169 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_sysroot)
NOTE: recipe repo-2.27-r0: task do_package: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_packagedata)
NOTE: recipe repo-2.27-r0: task do_packagedata: Started
NOTE: recipe repo-2.27-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1172 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_install)
NOTE: recipe git-2.36.1-r0: task do_install: Started
NOTE: recipe git-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1173 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_package)
NOTE: recipe git-2.36.1-r0: task do_package: Started
NOTE: recipe git-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata)
NOTE: recipe git-2.36.1-r0: task do_packagedata: Started
NOTE: recipe git-2.36.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1174 tasks of which 1152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.36.1-r0/temp/log.do_packagedata.3553668
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata) failed with exit code '1'

--===============4248630003024632822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1f8834b0fb01a23e8efe8d661444d47e5024c9cb"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 1 Mirrors 0 Missed 11 Current 303 (8% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 928 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_fetch)
NOTE: Running task 947 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_fetch)
NOTE: recipe repo-2.27-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1155 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_unpack)
NOTE: Running task 1156 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.27-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_unpack)
NOTE: Running task 1158 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.36.1-r0: task do_unpack: Started
NOTE: recipe repo-2.27-r0: task do_unpack: Started
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.36.1-r0: task do_unpack: Succeeded
NOTE: recipe repo-2.27-r0: task do_unpack: Succeeded
NOTE: recipe git-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1159 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_patch)
NOTE: Running task 1160 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_patch)
NOTE: recipe repo-2.27-r0: task do_patch: Started
NOTE: recipe git-2.36.1-r0: task do_patch: Started
NOTE: recipe repo-2.27-r0: task do_patch: Succeeded
NOTE: Running task 1161 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1162 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic)
NOTE: recipe git-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1163 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Started
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.27-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_lic unihash changed to 2c99e6dc208e0b4f3855c117381ea3b03f6ef4d6457e67b017a7c6146b68365f
NOTE: recipe repo-2.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1164 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_configure)
NOTE: recipe git-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1165 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_configure)
NOTE: recipe repo-2.27-r0: task do_configure: Started
NOTE: recipe git-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.27-r0: task do_configure: Succeeded
NOTE: Running task 1166 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_compile)
NOTE: recipe repo-2.27-r0: task do_compile: Started
NOTE: recipe repo-2.27-r0: task do_compile: Succeeded
NOTE: Running task 1167 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_install)
NOTE: recipe repo-2.27-r0: task do_install: Started
NOTE: recipe repo-2.27-r0: task do_install: Succeeded
NOTE: Running task 1168 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_package)
NOTE: Running task 1169 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_populate_sysroot)
NOTE: recipe repo-2.27-r0: task do_package: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.27-r0: task do_package: Succeeded
NOTE: Running task 1170 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.27.bb:do_packagedata)
NOTE: recipe repo-2.27-r0: task do_packagedata: Started
NOTE: recipe repo-2.27-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_compile)
NOTE: recipe git-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1172 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_install)
NOTE: recipe git-2.36.1-r0: task do_install: Started
NOTE: recipe git-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1173 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_package)
NOTE: recipe git-2.36.1-r0: task do_package: Started
NOTE: recipe git-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1174 of 1178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata)
NOTE: recipe git-2.36.1-r0: task do_packagedata: Started
NOTE: recipe git-2.36.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1174 tasks of which 1152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.37.0-r0 to 0:2.36.1-r0) [version-going-backwards]
ERROR: git-2.36.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.36.1-r0/temp/log.do_packagedata.3544559
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.36.1.bb:do_packagedata) failed with exit code '1'

--===============4248630003024632822==--

