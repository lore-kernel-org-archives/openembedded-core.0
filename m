Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1290.1618510599610507745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0B48438C13B7
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] x264: upgrading to 55d517bc4569272a2c9a367a4106c234aba2ffbc SUCCEEDED
Message-ID: <MADEUP.16761AD174A34D2D.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150566
Content-Type: multipart/mixed; boundary="===============8727196127402931426=="

--===============8727196127402931426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *x264* to *55d517bc4569272a2c9a367a4106c234aba2ffbc* has Succeeded.

Next steps:
    - apply the patch: git am 0001-x264-upgrade-to-latest-revision.patch
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

--===============8727196127402931426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/x264/x264-bin: RPROVIDES: removed "x264-bin (['= r3039+git0+544c61f082'])", added "x264-bin (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-dbg: RPROVIDES: removed "x264-dbg (['= r3039+git0+544c61f082'])", added "x264-dbg (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-dev: RPROVIDES: removed "x264-dev (['= r3039+git0+544c61f082'])", added "x264-dev (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-dev: RDEPENDS: removed "x264 (['= r3039+git0+544c61f082-r0'])", added "x264 (['= r3039+git0+55d517bc45-r0'])"
packages/core2-32-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-doc: RPROVIDES: removed "x264-doc (['= r3039+git0+544c61f082'])", added "x264-doc (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-locale: RPROVIDES: removed "x264-locale (['= r3039+git0+544c61f082'])", added "x264-locale (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-src: RPROVIDES: removed "x264-src (['= r3039+git0+544c61f082'])", added "x264-src (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-src: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-staticdev: RPROVIDES: removed "x264-staticdev (['= r3039+git0+544c61f082'])", added "x264-staticdev (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-staticdev: RDEPENDS: removed "x264-dev (['= r3039+git0+544c61f082-r0'])", added "x264-dev (['= r3039+git0+55d517bc45-r0'])"
packages/core2-32-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264: RPROVIDES: removed "x264 (['= r3039+git0+544c61f082'])", added "x264 (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45

--===============8727196127402931426==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-x264-upgrade-to-latest-revision.patch"

From 234e0dfae56e0ef721fc44882f6692cc9cbf356b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 15:52:51 +0000
Subject: [PATCH] x264: upgrade to latest revision

---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index f95fb0c41e..81354a8fd3 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "544c61f082194728d0391fb280a6e138ba320a96"
+SRCREV = "55d517bc4569272a2c9a367a4106c234aba2ffbc"
 
 PV = "r3039+git${SRCPV}"
 
-- 
2.27.0


--===============8727196127402931426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:277e423913f5bacc6f345353912473aa2c00f425"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 8 Network 0 Missed 7 Current 124 (53% match, 94% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 506 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_fetch)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_fetch: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_fetch: Succeeded
NOTE: Running task 547 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_unpack)
NOTE: Running task 548 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_unpack: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_unpack: Succeeded
NOTE: Running task 549 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_patch)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_patch: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_patch: Succeeded
NOTE: Running task 550 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 551 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_lic)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_populate_lic: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 552 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_configure)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_populate_lic: Succeeded
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_configure: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_configure: Succeeded
NOTE: Running task 553 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_compile)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_compile: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_compile: Succeeded
NOTE: Running task 554 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_install)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_install: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_install: Succeeded
NOTE: Running task 555 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package)
NOTE: Running task 556 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_populate_sysroot)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_populate_sysroot: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_package: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_package: Succeeded
NOTE: Running task 557 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_packagedata)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_packagedata: Started
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-src went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-dbg went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-staticdev went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-dev went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-doc went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-locale went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264-bin went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
ERROR: x264-r3039+gitAUTOINC+55d517bc45-r0 do_packagedata: QA Issue: Package version for package x264 went backwards which would break package feeds (from 0:r3039+git0+544c61f082-r0 to 0:r3039+git0+55d517bc45-r0) [version-going-backwards]
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_packagedata: Succeeded
NOTE: Running task 558 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_write_rpm)
NOTE: Running task 559 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_package_qa)
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_package_write_rpm: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_package_qa: Started
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_package_qa: Succeeded
NOTE: recipe x264-r3039+gitAUTOINC+55d517bc45-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 560 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/x264/x264_git.bb:do_build)
NOTE: Tasks Summary: Attempted 560 tasks of which 545 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============8727196127402931426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/x264: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264: PKGV changed from r3039+gitAUTOINC+544c61f082 [default] to r3039+gitAUTOINC+55d517bc45 [default]
packages/core2-32-poky-linux/x264/x264-bin: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-bin: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-bin: RPROVIDES: removed "x264-bin (['= r3039+git0+544c61f082'])", added "x264-bin (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-dbg: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-dbg: PKGSIZE changed from 12095304 to 12094744 (-0%)
packages/core2-32-poky-linux/x264/x264-dbg: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-dbg: RPROVIDES: removed "x264-dbg (['= r3039+git0+544c61f082'])", added "x264-dbg (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-dev: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-dev: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-dev: RPROVIDES: removed "x264-dev (['= r3039+git0+544c61f082'])", added "x264-dev (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-dev: RDEPENDS: removed "x264 (['= r3039+git0+544c61f082-r0'])", added "x264 (['= r3039+git0+55d517bc45-r0'])"
packages/core2-32-poky-linux/x264/x264-doc: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-doc: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-doc: RPROVIDES: removed "x264-doc (['= r3039+git0+544c61f082'])", added "x264-doc (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-locale: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-locale: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-locale: RPROVIDES: removed "x264-locale (['= r3039+git0+544c61f082'])", added "x264-locale (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-src: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-src: PKGSIZE changed from 1982078 to 1982264 (+0%)
packages/core2-32-poky-linux/x264/x264-src: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-src: RPROVIDES: removed "x264-src (['= r3039+git0+544c61f082'])", added "x264-src (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-staticdev: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264-staticdev: PKGSIZE changed from 5850304 to 5849952 (-0%)
packages/core2-32-poky-linux/x264/x264-staticdev: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264-staticdev: RPROVIDES: removed "x264-staticdev (['= r3039+git0+544c61f082'])", added "x264-staticdev (['= r3039+git0+55d517bc45'])"
packages/core2-32-poky-linux/x264/x264-staticdev: RDEPENDS: removed "x264-dev (['= r3039+git0+544c61f082-r0'])", added "x264-dev (['= r3039+git0+55d517bc45-r0'])"
packages/core2-32-poky-linux/x264/x264: PV changed from "r3039+gitAUTOINC+544c61f082" to "r3039+gitAUTOINC+55d517bc45"
packages/core2-32-poky-linux/x264/x264: PKGV changed from r3039+git0+544c61f082 to r3039+git0+55d517bc45
packages/core2-32-poky-linux/x264/x264: RPROVIDES: removed "x264 (['= r3039+git0+544c61f082'])", added "x264 (['= r3039+git0+55d517bc45'])"

--===============8727196127402931426==--
