Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.1348.1618510600151102655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4AFE438C13A6
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 6a4be9e9946df310d9402f995f371c7deb8c27ba SUCCEEDED
Message-ID: <MADEUP.16761AD1510FA32C.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150554
Content-Type: multipart/mixed; boundary="===============1539452892512135168=="

--===============1539452892512135168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *6a4be9e9946df310d9402f995f371c7deb8c27ba* has Succeeded.

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

--===============1539452892512135168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit (['= 1.0+gitr0+6a4be9e994-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit-dev (['= 1.0+gitr0+6a4be9e994-r0'])"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994

--===============1539452892512135168==
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
meta-yocto-bsp       = "tmp-auh-upgrades:69d4106ea08a9e2e86ed3303bebaa8f356aba23a"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 188 Local 180 Network 0 Missed 8 Current 601 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1719 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_fetch: Succeeded
NOTE: Running task 2448 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2449 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_patch: Succeeded
NOTE: Running task 2451 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2452 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2453 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2454 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2458 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_packagedata: Started
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6a4be9e994-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+d4d9353b72-r0 to 0:1.0+gitr0+6a4be9e994-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2461 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6a4be9e994-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2462 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2462 tasks of which 2446 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 31 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============1539452892512135168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 4a841447aabe5fdfb66da2cb6f36b2c70f8f502f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 13:51:09 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 14f4c75a2c..b64a20a586 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d4d9353b7290ed22cb7349226a8e4017402d3f02"
+SRCREV = "6a4be9e9946df310d9402f995f371c7deb8c27ba"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.27.0


--===============1539452892512135168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+d4d9353b72 [default] to 1.0+gitrAUTOINC+6a4be9e994 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit (['= 1.0+gitr0+6a4be9e994-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d4d9353b72-r0'])", added "piglit-dev (['= 1.0+gitr0+6a4be9e994-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d4d9353b72 to 1.0+gitr0+6a4be9e994
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2041747147 to 2041785714 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+d4d9353b72" to "1.0+gitrAUTOINC+6a4be9e994"

--===============1539452892512135168==--
