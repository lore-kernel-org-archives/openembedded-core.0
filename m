Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5170.1613463848543488864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 626FF38C1276
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psmisc: upgrading to 23.4 SUCCEEDED
Message-ID: <MADEUP.16642CD3139353D5.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148130
Content-Type: multipart/mixed; boundary="===============2277746377023561691=="

--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psmisc* to *23.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psmisc-upgrade-23.3-23.4.patch
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

--===============2277746377023561691==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-psmisc-upgrade-23.3-23.4.patch"

From 04b845435a1ac544e29e1815eea124183e99bcc3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:28:01 +0000
Subject: [PATCH] psmisc: upgrade 23.3 -> 23.4

---
 meta/recipes-extended/psmisc/{psmisc_23.3.bb => psmisc_23.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.3.bb => psmisc_23.4.bb} (84%)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.3.bb b/meta/recipes-extended/psmisc/psmisc_23.4.bb
similarity index 84%
rename from meta/recipes-extended/psmisc/psmisc_23.3.bb
rename to meta/recipes-extended/psmisc/psmisc_23.4.bb
index e569f1074b..894443f4ef 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.3.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.4.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "78bde849041e6c914a2a517ebe1255b86dc98772"
+SRCREV = "5fab6b7ab385080f1db725d6803136ec1841a15f"
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/psmisc: PACKAGES: added "psmisc-locale-es"
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGSIZE changed from 17432 to 19828 (+14%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGSIZE changed from 15194 to 17187 (+13%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PKGSIZE changed from 8988 to 16019 (+78%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGSIZE changed from 14919 to 21664 (+45%)

--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 18 Found 7 Missed 11 Current 639 (38% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 644 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1081 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 655 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1495 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_fetch)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Succeeded
NOTE: Running task 1916 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_unpack)
NOTE: Running task 1917 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_prepare_recipe_sysroot)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.4-r0: task do_unpack: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_patch)
NOTE: recipe psmisc-23.4-r0: task do_patch: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2020 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic)
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Started
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2021 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2022 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic unihash changed to fd64c3bb1f0d77afb30389072f8a9b4c408f7c533f1b159ba3020716d6957f3a
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2023 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9be73892817ccae6a1679d6602b61f68cb686db2a571abe1d29b85f617ac1e25
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2065 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 34ae1f9d59024cf3248f55464cec110c7b18e0eb3d540ee9ad905def0f031610
NOTE: Setscene tasks completed
NOTE: Running task 2091 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_compile)
NOTE: recipe psmisc-23.4-r0: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package)
NOTE: Running task 2098 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_sysroot)
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2100 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_write_rpm)
NOTE: Running task 2101 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_qa)
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2102 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2102 tasks of which 2082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 18 Found 7 Missed 11 Current 639 (38% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 644 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1081 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 655 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1495 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_fetch)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Succeeded
NOTE: Running task 1841 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_unpack)
NOTE: Running task 1842 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.4-r0: task do_unpack: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_patch)
NOTE: recipe psmisc-23.4-r0: task do_patch: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2020 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic)
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2021 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2022 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic unihash changed to fd64c3bb1f0d77afb30389072f8a9b4c408f7c533f1b159ba3020716d6957f3a
NOTE: Running task 2023 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 947b3f3eeb0dfbbf6b71a2570cf7038cea898c207019c744a3a1ca5df19e8530
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2065 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0b1db967e13a1cce76dacb0a93759952734dd0c6028b6c011e72a5e0f26fbaff
NOTE: Setscene tasks completed
NOTE: Running task 2091 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_compile)
NOTE: recipe psmisc-23.4-r0: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package)
NOTE: Running task 2098 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_sysroot)
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2100 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_write_rpm)
NOTE: Running task 2101 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_qa)
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2102 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2102 tasks of which 2082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 18 Found 7 Missed 11 Current 639 (38% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 644 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1081 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 655 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1495 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_fetch)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Succeeded
NOTE: Running task 1871 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_unpack)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: Running task 1872 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_prepare_recipe_sysroot)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_unpack: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.4-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_patch)
NOTE: recipe psmisc-23.4-r0: task do_patch: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2020 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic)
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic unihash changed to fd64c3bb1f0d77afb30389072f8a9b4c408f7c533f1b159ba3020716d6957f3a
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2021 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2022 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2023 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 517200faa79489c03aaee74d243275f29de67290a89364e59cd5fcf52c63e1e4
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2065 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4d36386f84f1f8a6eeadb3b159bce7be17a46afff77c0a8da00b9ade299130f5
NOTE: Setscene tasks completed
NOTE: Running task 2091 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_compile)
NOTE: recipe psmisc-23.4-r0: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package)
NOTE: Running task 2098 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_sysroot)
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2100 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_write_rpm)
NOTE: Running task 2101 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_qa)
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2102 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2102 tasks of which 2082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1428 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1428 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3af364a8bbd1a98be7ff4f74f529de5f4108a2c4"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 18 Found 7 Missed 11 Current 639 (38% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 644 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 646 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 647 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1081 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe e2fsprogs-1.45.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 655 of 657 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1495 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_fetch)
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-src went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dbg went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-staticdev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-dev went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-doc went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-lib went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-ps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-sysctl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-de went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-fr went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pl went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Started
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-pt-br went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-sv went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-uk went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-vi went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
ERROR: procps-3.3.16-r0 do_packagedata_setscene: QA Issue: Package version for package procps-locale-zh-cn went backwards which would break package feeds (from 0:3.3.17-r0 to 0:3.3.16-r0) [version-going-backwards]
NOTE: recipe psmisc-23.4-r0: task do_fetch: Succeeded
NOTE: Running task 1856 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_unpack)
NOTE: Running task 1857 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe psmisc-23.4-r0: task do_unpack: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_patch)
NOTE: recipe psmisc-23.4-r0: task do_patch: Started
NOTE: recipe psmisc-23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_patch: Succeeded
NOTE: Running task 2019 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2020 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic)
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Started
NOTE: recipe psmisc-23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_lic unihash changed to fd64c3bb1f0d77afb30389072f8a9b4c408f7c533f1b159ba3020716d6957f3a
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2021 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2022 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2023 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2e06541ff4c1e71ad371a85f393c3f35ed840fa219ee311f9a83df5e15081efc
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2065 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 664e107f7e4384d7a71270232afba85e211fe63f8509de7e39ef4650d4c4d829
NOTE: Setscene tasks completed
NOTE: Running task 2091 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_configure: Succeeded
NOTE: Running task 2095 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_compile)
NOTE: recipe psmisc-23.4-r0: task do_compile: Started
NOTE: recipe psmisc-23.4-r0: task do_compile: Succeeded
NOTE: Running task 2096 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_install)
NOTE: recipe psmisc-23.4-r0: task do_install: Started
NOTE: recipe psmisc-23.4-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package)
NOTE: Running task 2098 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_populate_sysroot)
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Started
NOTE: recipe psmisc-23.4-r0: task do_package: Started
NOTE: recipe psmisc-23.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_packagedata)
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Started
NOTE: recipe psmisc-23.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2100 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_write_rpm)
NOTE: Running task 2101 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_package_qa)
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Started
NOTE: recipe psmisc-23.4-r0: task do_package_qa: Succeeded
NOTE: recipe psmisc-23.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2102 of 2102 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2102 tasks of which 2082 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages shown, returning a non-zero exit code.

--===============2277746377023561691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/psmisc/fuser-doc: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/fuser-doc: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/fuser-doc: PKGSIZE changed from 7379 to 7389 (+0%)
packages/core2-32-poky-linux/psmisc/fuser: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/fuser: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/killall-doc: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/killall-doc: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/killall-doc: PKGSIZE changed from 5418 to 5435 (+0%)
packages/core2-32-poky-linux/psmisc/killall: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/killall: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/killall: PKGSIZE changed from 26576 to 26608 (+0%)
packages/core2-32-poky-linux/psmisc: PACKAGES: added "psmisc-locale-es"
packages/core2-32-poky-linux/psmisc: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PKGSIZE changed from 284392 to 287188 (+1%)
packages/core2-32-poky-linux/psmisc/psmisc-dev: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-dev: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-doc: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-doc: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-doc: PKGSIZE changed from 3487 to 3483 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-extras: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-extras: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PKGSIZE changed from 5266 to 5268 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PKGSIZE changed from 1694 to 1696 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PKGSIZE changed from 19376 to 18826 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PKGSIZE changed from 15061 to 14367 (-5%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PKGSIZE changed from 19547 to 19005 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGSIZE changed from 17432 to 19828 (+14%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGSIZE changed from 15194 to 17187 (+13%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PKGSIZE changed from 8282 to 8284 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PKGSIZE changed from 12707 to 12251 (-4%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PKGSIZE changed from 19704 to 19140 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PKGSIZE changed from 19115 to 18565 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PKGSIZE changed from 12306 to 11829 (-4%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGSIZE changed from 8318 to 8320 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PKGSIZE changed from 8988 to 16019 (+78%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PKGSIZE changed from 3901 to 3903 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PKGSIZE changed from 3888 to 3890 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PKGSIZE changed from 19188 to 17575 (-8%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PKGSIZE changed from 19340 to 18768 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PKGSIZE changed from 19305 to 18750 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PKGSIZE changed from 19163 to 18604 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGSIZE changed from 1848 to 1850 (+0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PKGSIZE changed from 24507 to 23834 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGSIZE changed from 14919 to 21664 (+45%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PKGSIZE changed from 18925 to 17319 (-8%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PKGSIZE changed from 24628 to 23965 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGSIZE changed from 17206 to 16449 (-4%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PKGSIZE changed from 18359 to 16680 (-9%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PKGSIZE changed from 18684 to 18124 (-3%)
packages/core2-32-poky-linux/psmisc/psmisc-src: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-src: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc-src: PKGSIZE changed from 158711 to 159578 (+1%)
packages/core2-32-poky-linux/psmisc/psmisc-staticdev: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc-staticdev: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/psmisc: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/psmisc: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/pstree-doc: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/pstree-doc: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/pstree-doc: PKGSIZE changed from 5250 to 5322 (+1%)
packages/core2-32-poky-linux/psmisc/pstree: PKGV changed from 23.3 [default] to 23.4 [default]
packages/core2-32-poky-linux/psmisc/pstree: PV changed from "23.3" to "23.4"
packages/core2-32-poky-linux/psmisc/pstree: PKGSIZE changed from 30588 to 30604 (+0%)

--===============2277746377023561691==--
