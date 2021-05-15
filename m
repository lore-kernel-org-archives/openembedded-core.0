Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4465.1621074783516824425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7B38738C13C1
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.12.08 SUCCEEDED
Message-ID: <MADEUP.167F36ED8A95E393.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151817
Content-Type: multipart/mixed; boundary="===============7494622674243283100=="

--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.12.08* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.12.06-0.12.08.patch
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

--===============7494622674243283100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.12.06-0.12.08.patch"

From 3ae1ca923f496e7e83d3152ad10f1a6bd92ba0de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 06:05:48 +0000
Subject: [PATCH] stress-ng: upgrade 0.12.06 -> 0.12.08

---
 ...reserve-ownership-when-installing-example-jo.patch | 11 ++++++-----
 .../{stress-ng_0.12.06.bb => stress-ng_0.12.08.bb}    |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.06.bb => stress-ng_0.12.08.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
index c860c717ac..2ee0be54ba 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
@@ -1,21 +1,22 @@
-From bbc85a439672120fa1d36be79e959b28fe840919 Mon Sep 17 00:00:00 2001
+From f14d9d8184753dfbff99d7a51939145355627dcd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 30 Jul 2019 18:38:03 +0200
 Subject: [PATCH] Do not preserve ownership when installing example jobs
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index f36e57e..20488af 100644
+index 91d8ed4..72d0ca0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -452,6 +452,6 @@ install: stress-ng stress-ng.1.gz
- 	mkdir -p ${DESTDIR}${MANDIR}
- 	cp stress-ng.1.gz ${DESTDIR}${MANDIR}
+@@ -502,6 +502,6 @@ else
+ 	cp stress-ng.1 ${DESTDIR}${MANDIR}
+ endif
  	mkdir -p ${DESTDIR}${JOBDIR}
 -	cp -rp example-jobs/*.job ${DESTDIR}${JOBDIR}
 +	cp -r example-jobs/*.job ${DESTDIR}${JOBDIR}
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
index 7e9135ad01..24de8e39be 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.06.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "75eb340266b1bbae944d8f9281af978bd5bc2c8085df97a098d5500d6f177296"
+SRC_URI[sha256sum] = "39e98cbb682bd3f907b2c718c20747bc94804abc92fbc4dad3a50bf530108d09"
 
 DEPENDS = "coreutils-native"
 
-- 
2.27.0


--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 14 Network 0 Missed 11 Current 702 (56% match, 98% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 722 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 723 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1100 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1561 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_fetch)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_unpack)
NOTE: Running task 1884 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2206 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_patch)
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Succeeded
NOTE: Running task 2207 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_deploy_source_date_epoch)
NOTE: Running task 2208 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2209 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2210 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic unihash changed to 7dbdab3a5fba03fa5787de2469c6113d97a8871f9fdf126a9c449a5b05610f73
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_compile)
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2254 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: Running task 2282 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_install)
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package)
NOTE: Running task 2286 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_write_rpm)
NOTE: Running task 2289 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2290 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_build)
NOTE: Tasks Summary: Attempted 2290 tasks of which 2270 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 14 Network 0 Missed 11 Current 702 (56% match, 98% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 722 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 725 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1100 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1650 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_fetch)
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Succeeded
NOTE: Running task 1961 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_unpack)
NOTE: Running task 1962 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_patch)
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Succeeded
NOTE: Running task 2207 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_deploy_source_date_epoch)
NOTE: Running task 2208 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2209 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2210 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic unihash changed to 7dbdab3a5fba03fa5787de2469c6113d97a8871f9fdf126a9c449a5b05610f73
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_compile)
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dfc85dadf1206a4718fcd43404d130a7b709788edf0b6c43786e4dda281f1a9e
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2254 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 061780a75f7483885c15732173b5f425eb7788983e95873c1e812fae0568b1c3
NOTE: Setscene tasks completed
NOTE: Running task 2281 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_install)
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package)
NOTE: Running task 2286 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_write_rpm)
NOTE: Running task 2289 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2290 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_build)
NOTE: Tasks Summary: Attempted 2290 tasks of which 2270 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 41 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 537 Local 525 Network 0 Missed 12 Current 201 (97% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 202 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 259 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 262 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 265 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 283 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 303 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 314 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 320 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 331 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 336 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 342 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 350 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 353 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 367 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-conf-247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 387 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 734 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 997 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_unpack)
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata_setscene)
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_deploy_source_date_epoch)
NOTE: Running task 1037 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic unihash changed to 7dbdab3a5fba03fa5787de2469c6113d97a8871f9fdf126a9c449a5b05610f73
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 474 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.41.bb:do_packagedata_setscene)
NOTE: recipe curl-7.76.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libgpg-error-1.41-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 499 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 504 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 531 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1117 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1118 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1119 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1155 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 575 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1170 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1179 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1188 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.34+gitAUTOINC+38eb7ca3f4_85c17ad073-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.35.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1272 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1297 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e26bb56718bc9073a8415f8e3429c9bc0634b7262f81b3677d8b04efe3b0e42e
NOTE: Running task 1306 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 738 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2061 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2303 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_configure)
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_compile)
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_install)
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Succeeded
NOTE: Running task 2306 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package)
NOTE: Running task 2307 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Succeeded
NOTE: Running task 2309 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_write_rpm)
NOTE: Running task 2310 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2311 of 2311 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_build)
NOTE: Tasks Summary: Attempted 2311 tasks of which 2286 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 14 Network 0 Missed 11 Current 702 (56% match, 98% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 722 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 723 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running task 1100 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1650 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_fetch)
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Succeeded
NOTE: Running task 1989 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_unpack)
NOTE: Running task 1990 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_patch)
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Succeeded
NOTE: Running task 2207 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_deploy_source_date_epoch)
NOTE: Running task 2208 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2209 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2210 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic unihash changed to 7dbdab3a5fba03fa5787de2469c6113d97a8871f9fdf126a9c449a5b05610f73
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_configure)
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_compile)
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65bc2a999d0249cb2ac560c03e36a22609b1ba46f75d58326fd303d12a9c2adc
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2254 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 185fae5bf3ad4b72e8f86b78c04c5d7744ac78cbbc043d6773f94805f81a53c8
NOTE: Setscene tasks completed
NOTE: Running task 2282 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_install)
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package)
NOTE: Running task 2286 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_write_rpm)
NOTE: Running task 2289 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2290 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_build)
NOTE: Tasks Summary: Attempted 2290 tasks of which 2270 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (0 cached, 825 parsed). 1459 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 14 Network 0 Missed 11 Current 702 (56% match, 98% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 711 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 714 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 722 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1100 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-src went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dbg went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-staticdev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-src went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-dev went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-doc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc-locale went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dbg went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libtirpc-1.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libtirpc went backwards which would break package feeds (from 0:1.3.2-r0 to 0:1.3.1-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-staticdev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-dev went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-doc went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-bin went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2 went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-cs went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-da went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-de went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-eo went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-es went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-fur went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-hu went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-id went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-it went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ja went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-nl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pl went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-pt-br went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ro went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-ru went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: Running setscene task 725 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sr went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-sv went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-uk went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-vi went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
ERROR: libidn2-2.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package libidn2-locale-zh-cn went backwards which would break package feeds (from 0:2.3.1-r0 to 0:2.3.0-r0) [version-going-backwards]
NOTE: recipe libidn2-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 727 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1561 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_fetch)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.12.08-r0: task do_fetch: Succeeded
NOTE: Running task 1854 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_unpack)
NOTE: Running task 1884 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_unpack: Succeeded
NOTE: Running task 2206 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_patch)
NOTE: recipe stress-ng-0.12.08-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_patch: Succeeded
NOTE: Running task 2207 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_deploy_source_date_epoch)
NOTE: Running task 2208 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic)
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2209 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2210 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_lic unihash changed to 7dbdab3a5fba03fa5787de2469c6113d97a8871f9fdf126a9c449a5b05610f73
NOTE: recipe stress-ng-0.12.08-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2211 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_configure)
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3efc4f5e67f95cd8a1a7756b3c20cad69a0ca7af90542ea68811d9f5bb3f5e72
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2254 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6d0e6e66a0affae81c0be3ba3f3e6c5aaac827a3f69de942bd3e101e3df77be5
NOTE: Setscene tasks completed
NOTE: Running task 2281 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_compile: Succeeded
NOTE: Running task 2284 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_install)
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_install: Succeeded
NOTE: Running task 2285 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package)
NOTE: Running task 2286 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_populate_sysroot: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package: Succeeded
NOTE: Running task 2287 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_packagedata)
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_packagedata: Succeeded
NOTE: Running task 2288 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_write_rpm)
NOTE: Running task 2289 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_package_qa)
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.12.08-r0: task do_package_qa: Succeeded
NOTE: recipe stress-ng-0.12.08-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2290 of 2290 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.12.08.bb:do_build)
NOTE: Tasks Summary: Attempted 2290 tasks of which 2270 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 37 ERROR messages shown, returning a non-zero exit code.

--===============7494622674243283100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/stress-ng: SRC_URI changed from "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.06.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch" to "https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.12.08.tar.xz file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch file://no_daddr_t.patch"
packages/core2-32-poky-linux/stress-ng: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 5400852 to 5435928 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 51425 to 51965 (+1%)
packages/core2-32-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 2911237 to 2960920 (+2%)
packages/core2-32-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.12.06 [default] to 0.12.08 [default]
packages/core2-32-poky-linux/stress-ng/stress-ng: PV changed from "0.12.06" to "0.12.08"
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 4131176 to 4143592 (+0%)
packages/core2-32-poky-linux/stress-ng/stress-ng: PKGV changed from 0.12.06 [default] to 0.12.08 [default]

--===============7494622674243283100==--
