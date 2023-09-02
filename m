Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90F2EE49B7
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.5735.1693650554248654014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AhcDDw8f;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l9B/+x0g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a55708aef-23d4de63-e985-4722-9566-83a1934cae22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=GQiY7FrL3jrODLn79vrKSSpFcA2+rLmCz9/cpGxbcN8=;
	b=AhcDDw8fr30VmEwsJIGXNDcfk1liRZ8UEVpRP7gv6belfW7VrpsgBZ4lPjKB0rkD
	JsG6DV5qW9pT9P711o3jULfC370z+rQnNkVIj+CspjzcyFYr40rHQoJ/xjLOa0uotGQ
	GsQuTFKR2isG/Pr3m++f8+bptpMTEvK5jWc3HI3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=GQiY7FrL3jrODLn79vrKSSpFcA2+rLmCz9/cpGxbcN8=;
	b=l9B/+x0gFOtNdDleYi2ZSXLwcv3NB+62q5cQlP1kdEr26I80T0/6/TF5J9/BDraX
	0fHL4HiuVhm4fDyHZAla88hZLfQ6gHRlxQiirwdzNlX0se1fYJhswcX4K4XGLhGuikK
	BkczRlEHnKeKHX6+AuqCYrmp3QPvMqx2nKD3VmX8=
Content-Type: multipart/mixed; boundary="===============4857492009576427699=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.36.1 SUCCEEDED
Message-ID: <0101018a55708aef-23d4de63-e985-4722-9566-83a1934cae22-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187087

--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.36.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.35-2.36.1.patch
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

-- >8 --
From 439f996ee9f97b14712f1faa4d4c256f310542c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 18:54:27 +0000
Subject: [PATCH] repo: upgrade 2.35 -> 2.36.1

---
 meta/recipes-devtools/repo/{repo_2.35.bb => repo_2.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.35.bb => repo_2.36.1.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.35.bb b/meta/recipes-devtools/repo/repo_2.36.1.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.35.bb
rename to meta/recipes-devtools/repo/repo_2.36.1.bb
index d34c3db746..a3b43439f2 100644
--- a/meta/recipes-devtools/repo/repo_2.35.bb
+++ b/meta/recipes-devtools/repo/repo_2.36.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "c657844efe40b97700c3654989bdbe3a33e409d7"
+SRCREV = "1e9f7b9e9ef473305d10a26a48138bc6ad38ccf6"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.39.2


--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-89e0ebb079d3921e3af36db386d71995dbe02190"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:89e0ebb079d3921e3af36db386d71995dbe02190"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 48 Mirrors 0 Missed 19 Current 539 (71% match, 96% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
Removing 23 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 544 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 547 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 898 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_recipe_qa)
NOTE: Running task 924 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_recipe_qa)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 594 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 595 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running task 1073 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 596 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 598 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1103 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_fetch)
NOTE: Running task 1104 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3/3.11.4/temp/log.do_packagedata_setscene.1377685
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 600 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1174 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_unpack)
NOTE: recipe git-2.41.0-r0: task do_fetch: Succeeded
NOTE: Running task 1175 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.36.1-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1185 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe git-2.41.0-r0: task do_unpack: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1186 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_patch)
NOTE: Running task 1187 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Started
NOTE: recipe git-2.41.0-r0: task do_patch: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic)
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.41.0-r0: task do_patch: Succeeded
NOTE: Running task 1190 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic unihash changed to 6de22a99ff684611fe8c4a04f9e2f28f58a137ca5246eed84500df59b04c8981
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1191 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1525 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1549 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: Running task 1585 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_collect_spdx_deps)
NOTE: Running task 1683 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1695 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1697 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_install)
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_install: Started
NOTE: recipe repo-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_package)
NOTE: Running task 1702 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_packagedata)
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_create_spdx)
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Started
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Succeeded
NOTE: recipe git-2.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_install: Started
NOTE: recipe git-2.41.0-r0: task do_install: Succeeded
NOTE: Running task 1707 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_package)
NOTE: recipe git-2.41.0-r0: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata)
NOTE: recipe git-2.41.0-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1708 tasks of which 1677 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.41.0/temp/log.do_packagedata.1418281
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata) failed with exit code '1'

--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.35 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.35" to "2.36.1"
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 45832 to 44506 (-3%)

--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 102 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-89e0ebb079d3921e3af36db386d71995dbe02190"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:89e0ebb079d3921e3af36db386d71995dbe02190"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 358 Local 339 Mirrors 0 Missed 19 Current 258 (94% match, 96% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 259 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 282 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 735 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_recipe_qa)
NOTE: Running task 744 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 293 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 295 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 309 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 813 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_fetch)
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 814 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_fetch: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 327 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 825 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_unpack)
NOTE: recipe repo-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 826 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 349 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 354 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: Running task 880 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 378 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: Running task 901 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_patch)
NOTE: recipe repo-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3/3.11.4/temp/log.do_packagedata_setscene.1446172
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 380 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_patch: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 383 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running task 912 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 914 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 915 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 916 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic)
NOTE: recipe git-2.41.0-r0: task do_patch: Succeeded
NOTE: Running task 917 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic unihash changed to 6de22a99ff684611fe8c4a04f9e2f28f58a137ca5246eed84500df59b04c8981
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 408 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running task 943 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 945 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 427 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: Running task 966 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: Running task 982 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1013 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1039 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 502 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 514 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a1cc294b777438cf57075b2ade5a9c63b5460abf3eed3615217df9727300a7a
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 553 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 605 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 611 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1523 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1546 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1570 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: Running task 1606 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_collect_spdx_deps)
NOTE: Running task 1704 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1715 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1716 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1717 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_install)
NOTE: recipe repo-2.36.1-r0: task do_install: Started
NOTE: recipe repo-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1719 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_package)
NOTE: Running task 1720 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_sysroot)
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1723 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_packagedata)
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1724 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_create_spdx)
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Started
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Succeeded
NOTE: recipe git-2.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1725 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_compile: Succeeded
NOTE: Running task 1726 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_install: Started
NOTE: recipe git-2.41.0-r0: task do_install: Succeeded
NOTE: Running task 1727 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_package)
NOTE: recipe git-2.41.0-r0: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_package: Succeeded
NOTE: Running task 1728 of 1734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata)
NOTE: recipe git-2.41.0-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1728 tasks of which 1691 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.41.0/temp/log.do_packagedata.1483982
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata) failed with exit code '1'

--===============4857492009576427699==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.35-2.36.1.patch"

RnJvbSA0MzlmOTk2ZWU5Zjk3YjE0NzEyZjFmYWE0ZDRjMjU2ZjMxMDU0MmM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxODo1NDoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4zNSAtPiAyLjM2LjEKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi4zNS5iYiA9PiByZXBvXzIuMzYuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjM1LmJiID0+IHJlcG9fMi4zNi4xLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjM2LjEuYmIKaW5kZXggZDM0YzNk
Yjc0Ni4uYTNiNDM0MzlmMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjM1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zNi4x
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9n
ZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiYzY1Nzg0NGVmZTQwYjk3NzAwYzM2NTQ5ODliZGJlM2Ez
M2U0MDlkNyIKK1NSQ1JFViA9ICIxZTlmN2I5ZTllZjQ3MzMwNWQxMGEyNmE0ODEzOGJjNmFkMzhj
Y2Y2IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi4zOS4yCgo=

--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-89e0ebb079d3921e3af36db386d71995dbe02190"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:89e0ebb079d3921e3af36db386d71995dbe02190"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 48 Mirrors 0 Missed 19 Current 539 (71% match, 96% complete)
Removing 23 stale sstate objects for arch mips32r2...done.
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 544 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 547 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 594 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 955 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_recipe_qa)
NOTE: Running task 983 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 597 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running task 1077 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Started
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1111 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_fetch)
NOTE: Running task 1112 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_fetch)
NOTE: recipe repo-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Succeeded
NOTE: Running task 1182 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_unpack)
NOTE: recipe repo-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1183 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3/3.11.4/temp/log.do_packagedata_setscene.1277016
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 600 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe git-2.41.0-r0: task do_unpack: Started
NOTE: recipe repo-2.36.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe git-2.41.0-r0: task do_unpack: Succeeded
NOTE: Running task 1185 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1186 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_patch)
NOTE: recipe repo-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_patch: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Started
NOTE: recipe git-2.41.0-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic)
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic unihash changed to 6de22a99ff684611fe8c4a04f9e2f28f58a137ca5246eed84500df59b04c8981
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1191 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1525 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1549 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: Running task 1585 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_collect_spdx_deps)
NOTE: Running task 1684 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1695 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1696 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1697 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_compile: Started
NOTE: recipe repo-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_install: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_package)
NOTE: Running task 1702 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_packagedata)
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_create_spdx)
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Started
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Succeeded
NOTE: recipe git-2.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_install: Started
NOTE: recipe git-2.41.0-r0: task do_install: Succeeded
NOTE: Running task 1707 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_package)
NOTE: recipe git-2.41.0-r0: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata)
NOTE: recipe git-2.41.0-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1708 tasks of which 1677 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.41.0/temp/log.do_packagedata.1358853
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata) failed with exit code '1'

--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1810 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-89e0ebb079d3921e3af36db386d71995dbe02190"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:89e0ebb079d3921e3af36db386d71995dbe02190"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 26 Mirrors 0 Missed 19 Current 561 (57% match, 96% complete)
Removing 2 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 566 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 569 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 590 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1159 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_recipe_qa)
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1208 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1379 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Started
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1403 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_fetch)
NOTE: Running task 1406 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_fetch)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Succeeded
NOTE: Running task 1660 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_unpack)
NOTE: Running task 1661 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1662 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_unpack)
NOTE: Running task 1663 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.41.0-r0: task do_unpack: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_unpack: Started
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_patch)
NOTE: Running task 1665 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1666 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_patch)
NOTE: Running task 1667 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_collect_spdx_deps)
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3/3.11.4/temp/log.do_packagedata_setscene.1111737
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 604 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: recipe git-2.41.0-r0: task do_patch: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Started
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe git-2.41.0-r0: task do_patch: Succeeded
NOTE: Running task 1668 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1670 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic)
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1674 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic unihash changed to 6de22a99ff684611fe8c4a04f9e2f28f58a137ca5246eed84500df59b04c8981
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1677 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_configure)
NOTE: Running task 1678 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_configure: Started
NOTE: recipe git-2.41.0-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1679 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_compile)
NOTE: recipe repo-2.36.1-r0: task do_compile: Started
NOTE: recipe repo-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1680 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_install)
NOTE: recipe repo-2.36.1-r0: task do_install: Started
NOTE: recipe repo-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_package)
NOTE: Running task 1682 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1683 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 606 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1699 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: recipe repo-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1701 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_packagedata)
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1702 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_create_spdx)
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Started
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_install: Started
NOTE: recipe git-2.41.0-r0: task do_install: Succeeded
NOTE: Running task 1707 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_package)
NOTE: recipe git-2.41.0-r0: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata)
NOTE: recipe git-2.41.0-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1708 tasks of which 1677 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.41.0/temp/log.do_packagedata.1164154
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata) failed with exit code '1'

--===============4857492009576427699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-89e0ebb079d3921e3af36db386d71995dbe02190"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:89e0ebb079d3921e3af36db386d71995dbe02190"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 48 Mirrors 0 Missed 19 Current 539 (71% match, 96% complete)
Removing 23 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 544 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 547 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 568 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 907 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_recipe_qa)
NOTE: Running task 935 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_recipe_qa)
NOTE: Running task 1029 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Started
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Started
NOTE: recipe repo-2.36.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 580 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running task 1082 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_fetch)
NOTE: recipe git-2.41.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1152 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_fetch)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_fetch: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 601 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.41.0-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_patch)
NOTE: recipe repo-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1185 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_patch)
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.41.0-r0: task do_patch: Started
NOTE: recipe repo-2.36.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3/3.11.4/temp/log.do_packagedata_setscene.1193053
NOTE: Running task 1187 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe repo-2.36.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 602 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_setscene)
NOTE: Running task 1188 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic)
NOTE: recipe git-2.41.0-r0: task do_patch: Succeeded
NOTE: Running task 1190 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_deploy_source_date_epoch)
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_lic unihash changed to 6de22a99ff684611fe8c4a04f9e2f28f58a137ca5246eed84500df59b04c8981
NOTE: recipe repo-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.41.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1191 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: recipe python3-3.11.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 603 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1525 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1549 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata)
NOTE: Running task 1585 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_collect_spdx_deps)
NOTE: Running task 1683 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1695 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_configure)
NOTE: recipe git-2.41.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1696 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_configure)
NOTE: recipe repo-2.36.1-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 1697 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_configure: Started
NOTE: recipe repo-2.36.1-r0: task do_compile: Started
NOTE: recipe repo-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_install)
NOTE: recipe python3-3.11.4-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_install: Started
NOTE: recipe repo-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_package)
NOTE: Running task 1702 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_populate_sysroot)
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.36.1-r0: task do_package: Started
NOTE: recipe repo-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_packagedata)
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/repo/repo_2.36.1.bb:do_create_spdx)
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Started
NOTE: recipe repo-2.36.1-r0: task do_create_spdx: Succeeded
NOTE: recipe git-2.41.0-r0: task do_configure: Succeeded
NOTE: Running task 1705 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_compile)
NOTE: recipe git-2.41.0-r0: task do_compile: Started
NOTE: recipe git-2.41.0-r0: task do_compile: Succeeded
NOTE: Running task 1706 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_install)
NOTE: recipe git-2.41.0-r0: task do_install: Started
NOTE: recipe git-2.41.0-r0: task do_install: Succeeded
NOTE: Running task 1707 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_package)
NOTE: recipe git-2.41.0-r0: task do_package: Started
NOTE: recipe git-2.41.0-r0: task do_package: Succeeded
NOTE: Running task 1708 of 1714 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata)
NOTE: recipe git-2.41.0-r0: task do_packagedata: Started
NOTE: recipe git-2.41.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1708 tasks of which 1677 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata
Summary: There were 88 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-2to3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cgitb went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils-windows went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-distutils went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-smtpd went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-turtle went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.11.5-r0 to 0:3.11.4-r0) [version-going-backwards]
ERROR: python3-3.11.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.42.0-r0 to 0:2.41.0-r0) [version-going-backwards]
ERROR: git-2.41.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.41.0/temp/log.do_packagedata.1245093
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.41.0.bb:do_packagedata) failed with exit code '1'

--===============4857492009576427699==--

