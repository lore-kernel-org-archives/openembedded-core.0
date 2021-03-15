Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.320.1615826520483812499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id D065E38C118E
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:41:59 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.16.12 FAILED
Message-ID: <MADEUP.166C91A8D55B2C02.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149471
Content-Type: multipart/mixed; boundary="===============0935942179691583263=="

--===============0935942179691583263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.16.12* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.16.11-9.16.12.patch
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

--===============0935942179691583263==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.16.11-9.16.12.patch"

From 22cfff5ab760c9bbd54f6c49584ff00322ea6228 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 02:18:37 +0000
Subject: [PATCH] bind: upgrade 9.16.11 -> 9.16.12

---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/bind9                   | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/conf.patch              | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/named.service           | 0
 .../bind/{bind_9.16.11.bb => bind_9.16.12.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.11.bb => bind_9.16.12.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind9 b/meta/recipes-connectivity/bind/bind-9.16.12/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.12/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.12/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/named.service b/meta/recipes-connectivity/bind/bind-9.16.12/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.12/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.11.bb b/meta/recipes-connectivity/bind/bind_9.16.12.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.11.bb
rename to meta/recipes-connectivity/bind/bind_9.16.12.bb
index f48cc74c2e..2f5967c5d7 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.12.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0111f64dd7d8f515cfa129e181cce96ff82070d1b27f11a21f6856110d0699c1"
+SRC_URI[sha256sum] = "9914af9311fd349cab441097898d94fb28d0bfd9bf6ed04fe1f97f042644da7f"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.17.1


--===============0935942179691583263==
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
DISTRO_VERSION       = "3.2+snapshot-896b5339ee99793d7f739e9d4d038ba46b2579e8"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:896b5339ee99793d7f739e9d4d038ba46b2579e8"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 661 (41% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1543 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_fetch)
NOTE: recipe bind-9.16.12-r0: task do_fetch: Started
NOTE: recipe bind-9.16.12-r0: task do_fetch: Succeeded
NOTE: Running task 2133 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_unpack)
NOTE: Running task 2134 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe bind-9.16.12-r0: task do_unpack: Started
NOTE: recipe bind-9.16.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bind-9.16.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bind-9.16.12-r0: task do_unpack: Succeeded
NOTE: Running task 2135 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_patch)
NOTE: recipe bind-9.16.12-r0: task do_patch: Started
NOTE: recipe bind-9.16.12-r0: task do_patch: Succeeded
NOTE: Running task 2136 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2137 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_populate_lic)
NOTE: recipe bind-9.16.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bind-9.16.12-r0: task do_populate_lic: Started
NOTE: recipe bind-9.16.12-r0: task do_populate_lic: Succeeded
NOTE: recipe bind-9.16.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2138 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_configure)
NOTE: recipe bind-9.16.12-r0: task do_configure: Started
NOTE: recipe bind-9.16.12-r0: task do_configure: Succeeded
NOTE: Running task 2139 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_compile)
NOTE: recipe bind-9.16.12-r0: task do_compile: Started
NOTE: recipe bind-9.16.12-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_install)
NOTE: recipe bind-9.16.12-r0: task do_install: Started
NOTE: recipe bind-9.16.12-r0: task do_install: Succeeded
NOTE: Running task 2141 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_package)
NOTE: Running task 2142 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_populate_sysroot)
NOTE: recipe bind-9.16.12-r0: task do_package: Started
NOTE: recipe bind-9.16.12-r0: task do_populate_sysroot: Started
NOTE: recipe bind-9.16.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bind-9.16.12-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_packagedata)
NOTE: recipe bind-9.16.12-r0: task do_packagedata: Started
NOTE: recipe bind-9.16.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2144 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_package_write_rpm)
NOTE: Running task 2145 of 2146 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_package_qa)
NOTE: recipe bind-9.16.12-r0: task do_package_qa: Started
NOTE: recipe bind-9.16.12-r0: task do_package_write_rpm: Started
ERROR: bind-9.16.12-r0 do_package_qa: QA Issue: bind-utils rdepends on bind-dev [dev-deps]
ERROR: bind-9.16.12-r0 do_package_qa: QA Issue: -dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libisccc-9.16.12.so'
-dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libbind9-9.16.12.so'
-dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libisccfg-9.16.12.so'
-dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libns-9.16.12.so'
-dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libisc-9.16.12.so'
-dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libirs-9.16.12.so'
-dev package contains non-symlink .so: bind-dev path '/work/core2-32-poky-linux/bind/9.16.12-r0/packages-split/bind-dev/usr/lib/libdns-9.16.12.so' [dev-elf]
ERROR: bind-9.16.12-r0 do_package_qa: QA Issue: bind rdepends on bind-dev [dev-deps]
ERROR: bind-9.16.12-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.12-r0/temp/log.do_package_qa.45028
NOTE: recipe bind-9.16.12-r0: task do_package_qa: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_package_qa) failed with exit code '1'
NOTE: recipe bind-9.16.12-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2145 tasks of which 2131 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.12.bb:do_package_qa
Summary: There were 4 ERROR messages shown, returning a non-zero exit code.

--===============0935942179691583263==--
