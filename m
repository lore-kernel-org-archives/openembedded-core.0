Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12421.1602843683351804404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B2D4338C17A6
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 5.9 SUCCEEDED
Message-ID: <MADEUP.163E71D6C2A252CB.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143449
Content-Type: multipart/mixed; boundary="===============8125285996090567895=="

--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *strace* to *5.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-5.8-5.9.patch
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

--===============8125285996090567895==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-strace-upgrade-5.8-5.9.patch"

From e223e5d6e814ca35f59cbb84338df36b1abb0e57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 05:33:47 +0000
Subject: [PATCH] strace: upgrade 5.8 -> 5.9

---
 meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} (95%)

diff --git a/meta/recipes-devtools/strace/strace_5.8.bb b/meta/recipes-devtools/strace/strace_5.9.bb
similarity index 95%
rename from meta/recipes-devtools/strace/strace_5.8.bb
rename to meta/recipes-devtools/strace/strace_5.9.bb
index 0415588b97..bee2616a44 100644
--- a/meta/recipes-devtools/strace/strace_5.8.bb
+++ b/meta/recipes-devtools/strace/strace_5.9.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch \
            "
-SRC_URI[sha256sum] = "df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9"
+SRC_URI[sha256sum] = "39473eb8465546c3e940fb663cb381eba5613160c7302794699d194a4d5d66d9"
 
 inherit autotools ptest
 
-- 
2.18.4


--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1461 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdf3290f0b5c594e070a104d808d3b97bc5107c2"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 49 Found 36 Missed 13 Current 685 (73% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1057 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_fetch)
NOTE: Running task 1264 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_fetch)
NOTE: recipe bluez5-5.54-r0: task do_fetch: Started
NOTE: recipe bluez5-5.54-r0: task do_fetch: Succeeded
NOTE: Running task 1473 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_unpack)
NOTE: Running task 1474 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_fetch: Started
NOTE: recipe strace-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 1568 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_unpack)
NOTE: recipe bluez5-5.54-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_patch)
NOTE: recipe bluez5-5.54-r0: task do_patch: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_patch)
NOTE: recipe strace-5.9-r0: task do_patch: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-5.9-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic unihash changed to 412ebd79993fb4d22f47da2cb2be93565a509eb6c0fff7cb39bbf3a400f9ea97
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_configure: Succeeded
NOTE: Running task 2280 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2281 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile)
NOTE: recipe bluez5-5.54-r0: task do_compile: Started
NOTE: recipe bluez5-5.54-r0: task do_compile: Succeeded
NOTE: Running task 2282 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2283 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install)
NOTE: recipe bluez5-5.54-r0: task do_install: Started
NOTE: recipe bluez5-5.54-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2285 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package)
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Started
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2287 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_packagedata)
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Started
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure_ptest_base)
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2292 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile)
NOTE: recipe strace-5.9-r0: task do_compile: Started
NOTE: recipe strace-5.9-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile_ptest_base)
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2294 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install)
NOTE: recipe strace-5.9-r0: task do_install: Started
NOTE: recipe strace-5.9-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install_ptest_base)
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2296 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package)
NOTE: Running task 2297 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_sysroot)
NOTE: recipe strace-5.9-r0: task do_package: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.9-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_packagedata)
NOTE: recipe strace-5.9-r0: task do_packagedata: Started
NOTE: recipe strace-5.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_qa)
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.9-r0: task do_package_qa: Started
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2301 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_build)
NOTE: Tasks Summary: Attempted 2301 tasks of which 2268 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1419 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdf3290f0b5c594e070a104d808d3b97bc5107c2"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 47 Found 34 Missed 13 Current 687 (72% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1057 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_fetch)
NOTE: Running task 1264 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_fetch)
NOTE: recipe bluez5-5.54-r0: task do_fetch: Started
NOTE: recipe bluez5-5.54-r0: task do_fetch: Succeeded
NOTE: Running task 1428 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_unpack)
NOTE: Running task 1429 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_fetch: Started
NOTE: recipe strace-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 1552 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_unpack)
NOTE: recipe bluez5-5.54-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_patch)
NOTE: recipe bluez5-5.54-r0: task do_patch: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_patch)
NOTE: recipe strace-5.9-r0: task do_patch: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.54-r0: task do_configure: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic unihash changed to 412ebd79993fb4d22f47da2cb2be93565a509eb6c0fff7cb39bbf3a400f9ea97
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_configure: Succeeded
NOTE: Running task 2280 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2281 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile)
NOTE: recipe bluez5-5.54-r0: task do_compile: Started
NOTE: recipe bluez5-5.54-r0: task do_compile: Succeeded
NOTE: Running task 2282 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2283 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install)
NOTE: recipe bluez5-5.54-r0: task do_install: Started
NOTE: recipe bluez5-5.54-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2285 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package)
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Started
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2287 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_packagedata)
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Started
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure_ptest_base)
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2292 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile)
NOTE: recipe strace-5.9-r0: task do_compile: Started
NOTE: recipe strace-5.9-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile_ptest_base)
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2294 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install)
NOTE: recipe strace-5.9-r0: task do_install: Started
NOTE: recipe strace-5.9-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install_ptest_base)
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2296 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package)
NOTE: Running task 2297 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_sysroot)
NOTE: recipe strace-5.9-r0: task do_package: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.9-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_packagedata)
NOTE: recipe strace-5.9-r0: task do_packagedata: Started
NOTE: recipe strace-5.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_qa)
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.9-r0: task do_package_qa: Started
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2301 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_build)
NOTE: Tasks Summary: Attempted 2301 tasks of which 2268 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1418 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 46 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-32 sysroot...done.
Removing 111 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdf3290f0b5c594e070a104d808d3b97bc5107c2"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 554 Found 541 Missed 13 Current 191 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 192 of 745 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 286 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 291 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 306 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 313 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 314 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 322 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 325 of 745 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 326 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 333 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-67.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 365 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 375 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 376 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 398 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 400 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-3.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 428 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 429 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 559 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 619 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_fetch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-67.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.54-r0: task do_fetch: Started
NOTE: recipe bluez5-5.54-r0: task do_fetch: Succeeded
NOTE: Running task 808 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_unpack)
NOTE: recipe strace-5.9-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 461 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe strace-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_unpack: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 476 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe strace-5.9-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe icu-67.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.54-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_patch)
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-67.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 508 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe icu-67.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.54-r0: task do_patch: Succeeded
NOTE: Running setscene task 532 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1071 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_deploy_source_date_epoch)
NOTE: recipe strace-5.9-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 564 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe strace-5.9-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1127 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1128 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe strace-5.9-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic unihash changed to 412ebd79993fb4d22f47da2cb2be93565a509eb6c0fff7cb39bbf3a400f9ea97
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 594 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 601 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 611 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 612 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 615 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 623 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 636 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 683 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 701 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 712 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 725 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 739 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 742 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 745 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1657 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure)
NOTE: recipe bluez5-5.54-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2302 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile)
NOTE: recipe bluez5-5.54-r0: task do_compile: Started
NOTE: recipe bluez5-5.54-r0: task do_compile: Succeeded
NOTE: Running task 2303 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2304 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install)
NOTE: recipe bluez5-5.54-r0: task do_install: Started
NOTE: recipe bluez5-5.54-r0: task do_install: Succeeded
NOTE: Running task 2305 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2306 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_populate_sysroot)
NOTE: Running task 2307 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package)
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Started
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2308 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2309 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Succeeded
NOTE: Running task 2310 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_packagedata)
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Started
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Succeeded
NOTE: Running task 2311 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure_ptest_base)
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2313 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile)
NOTE: recipe strace-5.9-r0: task do_compile: Started
NOTE: recipe strace-5.9-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile_ptest_base)
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2315 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install)
NOTE: recipe strace-5.9-r0: task do_install: Started
NOTE: recipe strace-5.9-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install_ptest_base)
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2317 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package)
NOTE: Running task 2318 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_sysroot)
NOTE: recipe strace-5.9-r0: task do_package: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.9-r0: task do_package: Succeeded
NOTE: Running task 2319 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_packagedata)
NOTE: recipe strace-5.9-r0: task do_packagedata: Started
NOTE: recipe strace-5.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2320 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_write_rpm)
NOTE: Running task 2321 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_qa)
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.9-r0: task do_package_qa: Started
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2322 of 2322 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_build)
NOTE: Tasks Summary: Attempted 2322 tasks of which 2289 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1419 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdf3290f0b5c594e070a104d808d3b97bc5107c2"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 37 Missed 13 Current 684 (74% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1057 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_fetch)
NOTE: Running task 1264 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_fetch)
NOTE: recipe bluez5-5.54-r0: task do_fetch: Started
NOTE: recipe bluez5-5.54-r0: task do_fetch: Succeeded
NOTE: Running task 1468 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_unpack)
NOTE: Running task 1469 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_fetch: Started
NOTE: recipe strace-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 1605 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_unpack)
NOTE: recipe bluez5-5.54-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_patch)
NOTE: recipe bluez5-5.54-r0: task do_patch: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_patch)
NOTE: recipe strace-5.9-r0: task do_patch: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.54-r0: task do_configure: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic unihash changed to 412ebd79993fb4d22f47da2cb2be93565a509eb6c0fff7cb39bbf3a400f9ea97
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_configure: Succeeded
NOTE: Running task 2280 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2281 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile)
NOTE: recipe bluez5-5.54-r0: task do_compile: Started
NOTE: recipe bluez5-5.54-r0: task do_compile: Succeeded
NOTE: Running task 2282 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2283 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install)
NOTE: recipe bluez5-5.54-r0: task do_install: Started
NOTE: recipe bluez5-5.54-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2285 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package)
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Started
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2287 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_packagedata)
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Started
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure_ptest_base)
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2292 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile)
NOTE: recipe strace-5.9-r0: task do_compile: Started
NOTE: recipe strace-5.9-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile_ptest_base)
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2294 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install)
NOTE: recipe strace-5.9-r0: task do_install: Started
NOTE: recipe strace-5.9-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install_ptest_base)
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2296 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package)
NOTE: Running task 2297 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_sysroot)
NOTE: recipe strace-5.9-r0: task do_package: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.9-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_packagedata)
NOTE: recipe strace-5.9-r0: task do_packagedata: Started
NOTE: recipe strace-5.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_qa)
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.9-r0: task do_package_qa: Started
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2301 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_build)
NOTE: Tasks Summary: Attempted 2301 tasks of which 2268 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1419 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdf3290f0b5c594e070a104d808d3b97bc5107c2"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 47 Found 34 Missed 13 Current 687 (72% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1057 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_fetch)
NOTE: Running task 1264 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_fetch)
NOTE: recipe bluez5-5.54-r0: task do_fetch: Started
NOTE: recipe bluez5-5.54-r0: task do_fetch: Succeeded
NOTE: Running task 1544 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_unpack)
NOTE: Running task 1545 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_fetch: Started
NOTE: recipe strace-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 1621 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_unpack)
NOTE: recipe bluez5-5.54-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Started
NOTE: recipe bluez5-5.54-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_patch)
NOTE: recipe bluez5-5.54-r0: task do_patch: Started
NOTE: recipe strace-5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_patch)
NOTE: recipe strace-5.9-r0: task do_patch: Started
NOTE: recipe bluez5-5.54-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_patch: Succeeded
NOTE: Running task 2277 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic)
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-5.9-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.54-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_lic unihash changed to 412ebd79993fb4d22f47da2cb2be93565a509eb6c0fff7cb39bbf3a400f9ea97
NOTE: recipe strace-5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bluez5-5.54-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_configure: Succeeded
NOTE: Running task 2280 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2281 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile)
NOTE: recipe bluez5-5.54-r0: task do_compile: Started
NOTE: recipe bluez5-5.54-r0: task do_compile: Succeeded
NOTE: Running task 2282 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2283 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install)
NOTE: recipe bluez5-5.54-r0: task do_install: Started
NOTE: recipe bluez5-5.54-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.54-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2285 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_populate_sysroot)
NOTE: Running task 2286 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package)
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Started
NOTE: recipe bluez5-5.54-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2287 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure)
NOTE: recipe strace-5.9-r0: task do_configure: Started
NOTE: recipe bluez5-5.54-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_packagedata)
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Started
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
ERROR: bluez5-5.54-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.55-r0 to 0:5.54-r0) [version-going-backwards]
NOTE: recipe bluez5-5.54-r0: task do_packagedata: Succeeded
NOTE: Running task 2290 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.54-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_configure: Succeeded
NOTE: Running task 2291 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_configure_ptest_base)
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2292 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile)
NOTE: recipe strace-5.9-r0: task do_compile: Started
NOTE: recipe strace-5.9-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_compile_ptest_base)
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2294 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install)
NOTE: recipe strace-5.9-r0: task do_install: Started
NOTE: recipe strace-5.9-r0: task do_install: Succeeded
NOTE: Running task 2295 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_install_ptest_base)
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Started
NOTE: recipe strace-5.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2296 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package)
NOTE: Running task 2297 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_populate_sysroot)
NOTE: recipe strace-5.9-r0: task do_package: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Started
NOTE: recipe strace-5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe strace-5.9-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_packagedata)
NOTE: recipe strace-5.9-r0: task do_packagedata: Started
NOTE: recipe strace-5.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_write_rpm)
NOTE: Running task 2300 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_package_qa)
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Started
NOTE: recipe strace-5.9-r0: task do_package_qa: Started
NOTE: recipe strace-5.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-5.9-r0: task do_package_qa: Succeeded
NOTE: Running noexec task 2301 of 2301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_5.9.bb:do_build)
NOTE: Tasks Summary: Attempted 2301 tasks of which 2268 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages shown, returning a non-zero exit code.

--===============8125285996090567895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/strace: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-dbg: PKGSIZE changed from 31107328 to 33302548 (+7%)
packages/core2-32-poky-linux/strace/strace-dbg: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-dbg: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-dev: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-dev: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-doc: PKGSIZE changed from 49463 to 49697 (+0%)
packages/core2-32-poky-linux/strace/strace-doc: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-doc: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-locale: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-locale: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-ptest: PKGSIZE changed from 16609900 to 17758298 (+7%)
packages/core2-32-poky-linux/strace/strace-ptest: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-ptest: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-src: PKGSIZE changed from 7292275 to 7430601 (+2%)
packages/core2-32-poky-linux/strace/strace-src: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-src: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace-staticdev: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace-staticdev: PKGV changed from 5.8 [default] to 5.9 [default]
packages/core2-32-poky-linux/strace/strace: PKGSIZE changed from 1027501 to 1056173 (+3%)
packages/core2-32-poky-linux/strace/strace: PV changed from "5.8" to "5.9"
packages/core2-32-poky-linux/strace/strace: PKGV changed from 5.8 [default] to 5.9 [default]

--===============8125285996090567895==--
