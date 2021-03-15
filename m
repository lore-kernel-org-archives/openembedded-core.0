Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.286.1615826521123335023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7EAB838C1285
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 0a7f9cfbb62f9d1b1ef9d22f6d9f212a89aa06f3 SUCCEEDED
Message-ID: <MADEUP.166C91A93825BA44.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149514
Content-Type: multipart/mixed; boundary="===============1182284302478749992=="

--===============1182284302478749992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *0a7f9cfbb62f9d1b1ef9d22f6d9f212a89aa06f3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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

--===============1182284302478749992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+d4d9353b72 [default] to 1.0+gitrAUTOINC+0a7f9cfbb6 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit (['= 1.0+gitr0+0a7f9cfbb6-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit-dev (['= 1.0+gitr0+0a7f9cfbb6-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2041747147 to 2041751065 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+0a7f9cfbb6"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6

--===============1182284302478749992==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 01fd87bb36894228b22dd937f8f43c8118725995 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 12:46:44 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 14f4c75a2c..03528b4390 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d4d9353b7290ed22cb7349226a8e4017402d3f02"
+SRCREV = "0a7f9cfbb62f9d1b1ef9d22f6d9f212a89aa06f3"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.17.1


--===============1182284302478749992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit (['= 1.0+gitr0+0a7f9cfbb6-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit-dev (['= 1.0+gitr0+0a7f9cfbb6-r0'])"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+0a7f9cfbb6

--===============1182284302478749992==
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
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-1fd1eb56bef10aaf6329e9790652ffb1b495ad66"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1fd1eb56bef10aaf6329e9790652ffb1b495ad66"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 179 Local 171 Network 0 Missed 8 Current 610 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1719 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_fetch: Succeeded
NOTE: Running task 2448 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2449 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_patch: Succeeded
NOTE: Running task 2451 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2452 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2453 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2454 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2458 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_packagedata: Started
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+0a7f9cfbb6-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2461 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0a7f9cfbb6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2462 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2462 tasks of which 2446 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1182284302478749992==--
