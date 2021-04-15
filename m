Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.1362.1618510600061197652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CF2E538C139D
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.17.2 SUCCEEDED
Message-ID: <MADEUP.16761AD0D1E7A979.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150501
Content-Type: multipart/mixed; boundary="===============4578572527555440066=="

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.17.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.17.0-0.17.2.patch
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

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.17.0 to libcreaterepo_c.so.0.17.2
  /usr/lib/libcreaterepo_c.so.0.17.0 moved to /usr/lib/libcreaterepo_c.so.0.17.2
  /usr/lib/python3.9/site-packages/createrepo_c-0.17.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/createrepo_c-0.17.2-py3.9.egg-info

--===============4578572527555440066==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.17.0-0.17.2.patch"

From e082bccf4591501cc82bf32c3a56a0ced7f5a2b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 04:17:44 +0000
Subject: [PATCH] createrepo-c: upgrade 0.17.0 -> 0.17.2

---
 ...01-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 6 +++---
 .../{createrepo-c_0.17.0.bb => createrepo-c_0.17.2.bb}      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.0.bb => createrepo-c_0.17.2.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index d675af4f8b..4b844574ea 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 218a4760945be7a404df6515ffbc769c92791f9b Mon Sep 17 00:00:00 2001
+From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 855127f..dff1d97 100644
+index ecc262d..a86514c 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -14,7 +14,7 @@ if (NOT SKBUILD)
-     FIND_PACKAGE(PythonInterp 3 EXACT REQUIRED)
+     FIND_PACKAGE(PythonLibs 3 REQUIRED)
  endif (NOT SKBUILD)
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
index e0433806b2..76bdd69836 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
+SRCREV = "8eff6ed99f5fd0ba844cb8513963435caab5fd3c"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:137febd8f7026d9ed3d3494870cc8a34b55e24c5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 13 Network 0 Missed 57 Current 648 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_fetch)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1300 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1338 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1374 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Started
NOTE: Running task 1443 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1444 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_fetch)
NOTE: Running task 1445 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_fetch)
NOTE: Running task 1489 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 1490 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_fetch)
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_fetch)
NOTE: Running task 1551 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_unpack)
NOTE: Running task 1552 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1649 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1650 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1705 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: Running task 1743 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: Running task 1763 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1764 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: Running task 1765 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_fetch: Started
NOTE: Running task 1766 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Started
NOTE: Running task 1783 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_unpack)
NOTE: recipe curl-7.75.0-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_unpack)
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1816 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_unpack)
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Succeeded
NOTE: Running task 1834 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: Running task 1850 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2147 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_patch)
NOTE: recipe curl-7.75.0-r0: task do_unpack: Started
NOTE: Running task 2148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_patch: Started
NOTE: Running task 2149 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2154 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2155 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2156 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.1-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2159 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 2160 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Succeeded
NOTE: Running task 2161 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_patch)
NOTE: Running task 2162 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_generate_toolchain_file)
NOTE: Running task 2163 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2164 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2165 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2166 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 2167 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2168 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_patch)
NOTE: Running task 2169 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2170 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic unihash changed to a6efac4138262ed657545e659c9170da5551045a3b65a25e11e9edbbd973370b
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe curl-7.75.0-r0: task do_patch: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Started
NOTE: recipe curl-7.75.0-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2174 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2176 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2177 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2181 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2182 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2183 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2185 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2186 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2187 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2191 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2192 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2193 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2194 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2195 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2197 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2198 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2199 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install)
NOTE: recipe nettle-3.7.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2201 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2202 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package)
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2203 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_packagedata)
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2204 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2205 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2210 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2212 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2213 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2215 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2216 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2217 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2219 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2222 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2223 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_configure)
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_compile)
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_install)
NOTE: recipe gnutls-3.7.1-r0: task do_install: Started
NOTE: recipe gnutls-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2238 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package)
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2239 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_install)
NOTE: recipe curl-7.75.0-r0: task do_install: Started
NOTE: recipe curl-7.75.0-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package)
NOTE: Running task 2246 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Started
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2247 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_package: Succeeded
NOTE: Running task 2250 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2251 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_install)
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package)
NOTE: Running task 2254 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Succeeded
NOTE: Running task 2255 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2256 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_write_rpm)
NOTE: Running task 2257 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2258 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2258 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:137febd8f7026d9ed3d3494870cc8a34b55e24c5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 13 Network 0 Missed 57 Current 648 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running task 1148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_fetch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1300 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1338 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1372 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1374 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Started
NOTE: Running task 1443 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_fetch)
NOTE: Running task 1444 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_fetch)
NOTE: Running task 1445 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1478 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_unpack)
NOTE: Running task 1479 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_fetch)
NOTE: Running task 1492 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: Running task 1544 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_fetch)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1586 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1587 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe file-5.39-r0: task do_fetch: Started
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: Running task 1602 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 1657 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1658 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1659 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: Running task 1660 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1670 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe curl-7.75.0-r0: task do_fetch: Started
NOTE: Running task 1671 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_unpack)
NOTE: Running task 1672 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_unpack)
NOTE: Running task 1673 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe curl-7.75.0-r0: task do_fetch: Succeeded
NOTE: Running task 1686 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_unpack)
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1754 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: Running task 1890 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_unpack)
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1969 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_patch)
NOTE: recipe curl-7.75.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1996 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2149 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe nettle-3.7.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2154 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2156 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Started
NOTE: recipe nettle-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 2160 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 2161 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2162 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2163 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_generate_toolchain_file)
NOTE: Running task 2164 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2165 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2166 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2167 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2168 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe curl-7.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 2169 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2170 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe nettle-3.7.1-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_patch)
NOTE: recipe curl-7.75.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic unihash changed to a6efac4138262ed657545e659c9170da5551045a3b65a25e11e9edbbd973370b
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2174 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2176 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2177 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2181 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2182 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2183 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2185 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2186 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2187 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2191 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2192 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2193 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2194 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2195 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2197 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2198 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2199 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install)
NOTE: recipe nettle-3.7.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2201 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2202 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package)
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2203 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Started
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2205 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package_write_rpm)
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2210 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2212 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2213 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2215 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2216 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2217 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2218 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2223 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_configure)
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_compile)
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_install)
NOTE: recipe gnutls-3.7.1-r0: task do_install: Started
NOTE: recipe gnutls-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2238 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package)
NOTE: recipe gnutls-3.7.1-r0: task do_package: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2239 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_install)
NOTE: recipe curl-7.75.0-r0: task do_install: Started
NOTE: recipe curl-7.75.0-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package)
NOTE: Running task 2246 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Started
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2247 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_package: Succeeded
NOTE: Running task 2250 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2251 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_install)
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package)
NOTE: Running task 2254 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Succeeded
NOTE: Running task 2255 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2256 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_write_rpm)
NOTE: Running task 2257 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2258 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2258 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-32 sysroot...done.
Removing 109 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:137febd8f7026d9ed3d3494870cc8a34b55e24c5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 533 Local 475 Network 0 Missed 58 Current 196 (89% match, 92% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 301 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 330 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 335 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 361 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 374 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 376 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running setscene task 392 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 397 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: Running task 616 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 668 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 672 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 682 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 683 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 697 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_fetch)
NOTE: Running task 698 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 699 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_fetch)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 710 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_fetch)
NOTE: Running task 711 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: Running task 723 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_fetch)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 426 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 427 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Started
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: Running task 854 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 866 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe curl-7.75.0-r0: task do_fetch: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_unpack)
NOTE: Running task 878 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 879 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_unpack)
NOTE: Running task 896 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Started
NOTE: Running task 897 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 925 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 942 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_unpack)
NOTE: Running task 944 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_unpack)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: Running setscene task 458 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe curl-7.75.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 464 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 995 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 472 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 474 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 1002 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_patch)
NOTE: Running task 1004 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 1005 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe nettle-3.7.1-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 486 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1025 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1026 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 1031 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 492 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 1037 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 496 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1042 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_generate_toolchain_file)
NOTE: Running task 1043 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1044 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.7.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 1049 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1050 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic unihash changed to a6efac4138262ed657545e659c9170da5551045a3b65a25e11e9edbbd973370b
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_patch: Started
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_patch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Started
NOTE: recipe curl-7.75.0-r0: task do_patch: Succeeded
NOTE: Running task 1066 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 503 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1073 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 510 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 532 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 557 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 561 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 566 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 603 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 652 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 655 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 665 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 729 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1713 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1755 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1847 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1848 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1872 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2192 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure)
NOTE: Running task 2193 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2194 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: Running task 2195 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: Running task 2196 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2198 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2205 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2207 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2208 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2210 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2211 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2212 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2213 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2214 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2215 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2216 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2217 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2218 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2219 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2220 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install)
NOTE: recipe nettle-3.7.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2222 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2223 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package)
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2224 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_compile)
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2226 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_packagedata)
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2227 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package_write_rpm)
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2238 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2242 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2243 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2244 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2246 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2247 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2248 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2250 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2251 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2252 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2253 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_configure)
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2254 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2255 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_compile)
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2257 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_install)
NOTE: recipe gnutls-3.7.1-r0: task do_install: Started
NOTE: recipe gnutls-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2258 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2259 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package)
NOTE: recipe gnutls-3.7.1-r0: task do_package: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2260 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2263 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_configure: Succeeded
NOTE: Running task 2264 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_install)
NOTE: recipe curl-7.75.0-r0: task do_install: Started
NOTE: recipe curl-7.75.0-r0: task do_install: Succeeded
NOTE: Running task 2266 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package)
NOTE: Running task 2267 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Started
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2268 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2269 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Succeeded
NOTE: Running task 2270 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_compile)
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_packagedata)
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Succeeded
NOTE: Running task 2272 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_install)
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2273 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package_write_rpm)
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Started
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Succeeded
NOTE: Running task 2274 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package)
NOTE: Running task 2275 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Succeeded
NOTE: Running task 2276 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2277 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_write_rpm)
NOTE: Running task 2278 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2279 of 2279 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2279 tasks of which 2140 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:137febd8f7026d9ed3d3494870cc8a34b55e24c5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 13 Network 0 Missed 57 Current 648 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_fetch)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1300 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1338 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
NOTE: Running task 1372 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1374 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Started
NOTE: Running task 1443 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_fetch)
NOTE: Running task 1444 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1445 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_fetch)
NOTE: Running task 1489 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_fetch)
NOTE: Running task 1490 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1532 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_unpack)
NOTE: Running task 1533 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1544 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_fetch)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: Running task 1638 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1639 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1684 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: Running task 1730 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1731 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Started
NOTE: Running task 1732 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1733 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe curl-7.75.0-r0: task do_fetch: Started
NOTE: Running task 1755 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1756 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1770 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Started
NOTE: Running task 1771 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_unpack)
NOTE: recipe curl-7.75.0-r0: task do_fetch: Succeeded
NOTE: Running task 1784 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_unpack)
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: Running task 1862 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_unpack)
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1899 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_patch)
NOTE: recipe curl-7.75.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 2148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2149 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe nettle-3.7.1-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 2151 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2154 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2155 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2156 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.1-r0: task do_patch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: Running task 2159 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: Running task 2160 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 2161 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_generate_toolchain_file)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2162 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_patch)
NOTE: Running task 2163 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2164 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2165 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Started
NOTE: Running task 2166 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2167 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 2168 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2169 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: Running task 2170 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic unihash changed to a6efac4138262ed657545e659c9170da5551045a3b65a25e11e9edbbd973370b
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe curl-7.75.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_patch)
NOTE: recipe nettle-3.7.1-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Started
NOTE: recipe curl-7.75.0-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2176 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2177 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2181 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2182 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2183 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2185 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2186 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2187 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2191 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2192 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2193 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2194 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2195 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2197 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2198 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2199 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install)
NOTE: recipe nettle-3.7.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2201 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2202 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package)
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_compile)
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2205 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_packagedata)
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2206 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package_write_rpm)
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2210 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2212 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2213 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2215 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2216 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2217 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2218 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2219 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2220 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2221 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2222 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2224 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_configure)
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_compile)
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_install)
NOTE: recipe gnutls-3.7.1-r0: task do_install: Started
NOTE: recipe gnutls-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2238 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package)
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2239 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_install)
NOTE: recipe curl-7.75.0-r0: task do_install: Started
NOTE: recipe curl-7.75.0-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package)
NOTE: Running task 2246 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Started
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2247 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Succeeded
NOTE: Running task 2249 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Succeeded
NOTE: Running task 2250 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2251 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_install)
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package)
NOTE: Running task 2254 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Succeeded
NOTE: Running task 2255 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2256 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_write_rpm)
NOTE: Running task 2257 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2258 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2258 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:137febd8f7026d9ed3d3494870cc8a34b55e24c5"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 13 Network 0 Missed 57 Current 648 (18% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 655 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 716 of 718 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_fetch)
NOTE: Running task 1300 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_fetch)
NOTE: Running task 1338 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_fetch)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1372 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_fetch)
NOTE: Running task 1374 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: Running task 1443 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_fetch)
NOTE: Running task 1444 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1445 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_fetch)
ERROR: btrfs-tools-5.10.1-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:5.11.1-r0 to 0:5.10.1-r0) [version-going-backwards]
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Started
NOTE: Running task 1489 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_fetch)
NOTE: Running task 1490 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_fetch)
NOTE: recipe nettle-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_fetch)
NOTE: Running task 1550 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_unpack)
NOTE: Running task 1551 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe libunistring-0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 1622 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_unpack)
NOTE: Running task 1623 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1648 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Started
NOTE: Running task 1696 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_unpack)
NOTE: Running task 1697 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Started
NOTE: Running task 1713 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: Running task 1714 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1729 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1730 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_unpack)
NOTE: Running task 1739 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_unpack)
NOTE: recipe curl-7.75.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Started
NOTE: Running task 1761 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_unpack)
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1867 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_fetch: Succeeded
NOTE: Running task 1972 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Started
NOTE: Running task 2041 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_patch)
NOTE: recipe curl-7.75.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Started
NOTE: Running task 2148 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2149 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_patch: Started
NOTE: Running task 2150 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_patch)
NOTE: recipe libidn2-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_unpack: Succeeded
NOTE: Running task 2152 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_patch)
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Started
NOTE: recipe nettle-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 2154 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2156 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 2159 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2160 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2161 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_generate_toolchain_file)
NOTE: Running task 2162 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2163 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_unpack: Succeeded
NOTE: Running task 2164 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_patch)
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2165 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Started
NOTE: recipe libunistring-0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2166 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 2167 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_patch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2168 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2169 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2170 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_configure)
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_lic unihash changed to a6efac4138262ed657545e659c9170da5551045a3b65a25e11e9edbbd973370b
NOTE: recipe curl-7.75.0-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2171 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_patch)
NOTE: recipe nettle-3.7.1-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Started
NOTE: recipe curl-7.75.0-r0: task do_patch: Succeeded
NOTE: Running task 2172 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2173 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_patch: Succeeded
NOTE: Running task 2174 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.75.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.9.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2176 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2177 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile)
NOTE: recipe nettle-3.7.1-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 2178 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2181 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2182 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2183 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe libgpg-error-1.41-r0: task do_configure: Succeeded
NOTE: Running task 2185 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_compile)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2186 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2187 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2191 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_compile: Succeeded
NOTE: Running task 2192 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_install)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_install: Started
NOTE: recipe libgpg-error-1.41-r0: task do_install: Succeeded
NOTE: Running task 2193 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_populate_sysroot)
NOTE: Running task 2194 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package)
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Started
NOTE: recipe libgpg-error-1.41-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2195 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_configure)
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package: Succeeded
NOTE: Running task 2197 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata)
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata: Succeeded
NOTE: Running task 2198 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2199 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install)
NOTE: recipe nettle-3.7.1-r0: task do_install: Started
NOTE: recipe nettle-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_install_ptest_base)
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2201 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2202 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package)
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Started
NOTE: recipe nettle-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_compile)
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Started
NOTE: recipe nettle-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2204 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_packagedata)
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2205 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.1.bb:do_package_write_rpm)
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe libunistring-0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2206 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_compile)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_compile: Succeeded
NOTE: Running task 2207 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_install)
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package)
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2210 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2211 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_configure)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package: Succeeded
NOTE: Running task 2212 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata)
NOTE: recipe nettle-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2213 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_compile)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2215 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_install)
NOTE: recipe libunistring-0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_install)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Started
NOTE: recipe libunistring-0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2217 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2218 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package)
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package: Started
NOTE: recipe libunistring-0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2219 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2220 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_configure)
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package)
NOTE: Running task 2222 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2224 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.16.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_compile)
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_install)
NOTE: recipe libidn2-2.3.0-r0: task do_install: Started
NOTE: recipe libidn2-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package)
NOTE: recipe libidn2-2.3.0-r0: task do_package: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_configure)
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata)
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_compile)
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2236 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_install)
NOTE: recipe gnutls-3.7.1-r0: task do_install: Started
NOTE: recipe gnutls-3.7.1-r0: task do_install: Succeeded
NOTE: Running task 2237 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot)
NOTE: Running task 2238 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package)
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Started
NOTE: recipe gnutls-3.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2239 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_configure)
NOTE: recipe curl-7.75.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package: Succeeded
NOTE: Running task 2241 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2242 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_configure: Succeeded
NOTE: Running task 2243 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_install)
NOTE: recipe curl-7.75.0-r0: task do_install: Started
NOTE: recipe curl-7.75.0-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package)
NOTE: Running task 2246 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Started
NOTE: recipe curl-7.75.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2247 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2248 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_configure)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Started
NOTE: recipe curl-7.75.0-r0: task do_package: Succeeded
NOTE: Running task 2249 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_configure: Succeeded
NOTE: Running task 2250 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_compile)
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Started
NOTE: recipe curl-7.75.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2251 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.75.0.bb:do_package_write_rpm)
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_install)
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package)
NOTE: Running task 2254 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.75.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package: Succeeded
NOTE: Running task 2255 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_packagedata)
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2256 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_write_rpm)
NOTE: Running task 2257 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_package_qa)
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-0.17.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2258 of 2258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2258 tasks of which 2119 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4578572527555440066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1185092 to 1185160 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 137162 to 137165 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1176001 to 1176269 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.17.0" to "0.17.2"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.17.0 to libcreaterepo_c.so.0.17.2
  /usr/lib/libcreaterepo_c.so.0.17.0 moved to /usr/lib/libcreaterepo_c.so.0.17.2
  /usr/lib/python3.9/site-packages/createrepo_c-0.17.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/createrepo_c-0.17.2-py3.9.egg-info

--===============4578572527555440066==--
