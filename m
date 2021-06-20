Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.32524.1624189110245150226
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8131E38C08A7
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.16.18 FAILED
Message-ID: <MADEUP.168A476400CD1CD2.3236@lists.openembedded.org>
X-Groupsio-MsgNum: 153103
Content-Type: multipart/mixed; boundary="===============4608869965554769950=="

--===============4608869965554769950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bind* to *9.16.18* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.16.16-9.16.18.patch
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

--===============4608869965554769950==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.16.16-9.16.18.patch"

From 6afa13ed6cc83043ba7c33ee30ced035a3630698 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 06:23:01 +0000
Subject: [PATCH] bind: upgrade 9.16.16 -> 9.16.18

---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/bind9                   | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/conf.patch              | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/named.service           | 0
 .../bind/{bind_9.16.16.bb => bind_9.16.18.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.16.bb => bind_9.16.18.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.18/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.18/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.18/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/bind9 b/meta/recipes-connectivity/bind/bind-9.16.18/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.18/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.18/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.18/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.18/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.18/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.18/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/named.service b/meta/recipes-connectivity/bind/bind-9.16.18/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.18/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.16.bb b/meta/recipes-connectivity/bind/bind_9.16.18.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.16.bb
rename to meta/recipes-connectivity/bind/bind_9.16.18.bb
index b152598402..078a1a463e 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b"
+SRC_URI[sha256sum] = "3c6263a4364eb5dce233f9f22b90acfa1ec2488d534f91d21663d0ac25ce5e65"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.20.1


--===============4608869965554769950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-f585bf4c959ae0b52be8462d278cd289db79b813"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f585bf4c959ae0b52be8462d278cd289db79b813"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 751 (41% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1796 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_fetch)
NOTE: recipe bind-9.16.18-r0: task do_fetch: Started
NOTE: recipe bind-9.16.18-r0: task do_fetch: Succeeded
NOTE: Running task 2362 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_unpack)
NOTE: Running task 2363 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe bind-9.16.18-r0: task do_unpack: Started
NOTE: recipe bind-9.16.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bind-9.16.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bind-9.16.18-r0: task do_unpack: Succeeded
NOTE: Running task 2402 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_patch)
NOTE: recipe bind-9.16.18-r0: task do_patch: Started
NOTE: recipe bind-9.16.18-r0: task do_patch: Succeeded
NOTE: Running task 2403 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2404 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_populate_lic)
NOTE: recipe bind-9.16.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bind-9.16.18-r0: task do_populate_lic: Started
NOTE: recipe bind-9.16.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2405 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_configure)
NOTE: recipe bind-9.16.18-r0: task do_populate_lic: Succeeded
NOTE: recipe bind-9.16.18-r0: task do_configure: Started
NOTE: recipe bind-9.16.18-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_compile)
NOTE: recipe bind-9.16.18-r0: task do_compile: Started
NOTE: recipe bind-9.16.18-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2413 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_install)
NOTE: recipe bind-9.16.18-r0: task do_install: Started
ERROR: bind-9.16.18-r0 do_install: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/temp/run.do_install.42537' failed with exit code 1:
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/enumtype.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/enumtype.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/enumclass.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/enumclass.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/rdatastruct.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/rdatastruct.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make code.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'code.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
  [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
done
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/enumtype.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/enumtype.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/enumclass.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/enumclass.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/rdatastruct.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/rdatastruct.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make code.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'code.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
for i in aes.h app.h assertions.h astack.h atomic.h backtrace.h barrier.h base32.h base64.h bind9.h buffer.h bufferlist.h cmocka.h commandline.h counter.h crc64.h deprecated.h endian.h errno.h error.h event.h eventclass.h file.h formatcheck.h fsaccess.h fuzz.h hash.h heap.h hex.h hmac.h hp.h ht.h httpd.h interfaceiter.h iterated_hash.h lang.h lex.h lfsr.h lib.h likely.h list.h log.h magic.h managers.h md.h mem.h meminfo.h mutexatomic.h mutexblock.h netaddr.h netmgr.h netscope.h nonce.h os.h parseint.h pool.h portset.h print.h queue.h quota.h radix.h random.h ratelimiter.h refcount.h regex.h region.h resource.h result.h resultclass.h rwlock.h safe.h serial.h siphash.h sockaddr.h socket.h stats.h stdio.h strerr.h string.h symtab.h task.h taskpool.h timer.h tm.h types.h url.h utf8.h util.h version.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
done
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 platform.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11
for i in constants.h internal.h pk11.h result.h site.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/pk11/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11 || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11
for i in pkcs11.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/pkcs11/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11 || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
/bin/bash ../../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
for i in align.h dir.h net.h netdb.h offset.h stat.h stdatomic.h stdtime.h syslog.h time.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../../bind-9.16.18/lib/isc/unix/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
done
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
/bin/bash ../../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
for i in condition.h mutex.h once.h thread.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../../bind-9.16.18/lib/isc/pthreads/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
done
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisc.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisc-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisc-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisc-9.16.18.so libisc.so || { rm -f libisc.so && ln -s libisc-9.16.18.so libisc.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisc.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisc.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc
for i in alist.h base64.h cc.h ccmsg.h events.h result.h sexpr.h symtab.h symtype.h types.h util.h version.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isccc/include/isccc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisccc.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccc-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccc-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisccc-9.16.18.so libisccc.so || { rm -f libisccc.so && ln -s libisccc-9.16.18.so libisccc.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccc.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccc.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/enumtype.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/enumtype.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/enumclass.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/enumclass.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make include/dns/rdatastruct.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'include/dns/rdatastruct.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make code.h
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
make[3]: 'code.h' is up to date.
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns
for i in acl.h adb.h badcache.h bit.h byaddr.h cache.h callbacks.h catz.h cert.h client.h clientinfo.h compress.h db.h dbiterator.h dbtable.h diff.h dispatch.h dlz.h dlz_dlopen.h dns64.h dnsrps.h dnssec.h ds.h dsdigest.h dnstap.h dyndb.h ecs.h edns.h ecdb.h events.h fixedname.h forward.h geoip.h ipkeylist.h iptable.h journal.h kasp.h keydata.h keyflags.h keymgr.h keytable.h keyvalues.h lib.h librpz.h lmdb.h lookup.h log.h master.h masterdump.h message.h name.h ncache.h nsec.h nsec3.h nta.h opcode.h order.h peer.h portlist.h private.h rbt.h rcode.h rdata.h rdataclass.h rdatalist.h rdataset.h rdatasetiter.h rdataslab.h rdatatype.h request.h resolver.h result.h rootns.h rpz.h rriterator.h rrl.h sdb.h sdlz.h secalg.h secproto.h soa.h ssu.h stats.h tcpmsg.h time.h timer.h tkey.h tsec.h tsig.h ttl.h types.h update.h validator.h version.h view.h xfrin.h zone.h zonekey.h zoneverify.h zt.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/dns/include/dns/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns || exit 1; \
done
for i in enumclass.h enumtype.h rdatastruct.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst
for i in dst.h gssapi.h result.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/dns/include/dst/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libdns.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libdns-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libdns-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libdns-9.16.18.so libdns.so || { rm -f libdns.so && ln -s libdns-9.16.18.so libdns.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libdns.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libdns.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns
for i in client.h hooks.h interfacemgr.h lib.h listenlist.h log.h notify.h query.h server.h sortlist.h stats.h types.h update.h version.h xfrout.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/ns/include/ns/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns || exit 1 ; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libns.la \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libns-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libns-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libns-9.16.18.so libns.so || { rm -f libns.so && ln -s libns-9.16.18.so libns.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libns.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libns.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg
for i in aclconf.h cfg.h dnsconf.h grammar.h kaspconf.h log.h namedconf.h version.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isccfg/include/isccfg/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisccfg.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccfg-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccfg-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisccfg-9.16.18.so libisccfg.so || { rm -f libisccfg.so && ln -s libisccfg-9.16.18.so libisccfg.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccfg.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccfg.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9
for i in check.h getaddresses.h version.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/bind9/include/bind9/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9 || exit 1; \
done
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libbind9.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libbind9-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libbind9-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libbind9-9.16.18.so libbind9.so || { rm -f libbind9.so && ln -s libbind9-9.16.18.so libbind9.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libbind9.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libbind9.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
/bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
for i in context.h dnsconf.h resconf.h types.h version.h; do \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/irs/include/irs/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs || exit 1; \
done
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 netdb.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 platform.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libirs.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libirs-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libirs-9.16.18.so
i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libirs-9.16.18.so libirs.so || { rm -f libirs.so && ln -s libirs-9.16.18.so libirs.so; }; })
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libirs.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libirs.la
i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccc/libisccc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c rndc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccc/libisccc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/rndc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/rndc
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
	dig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/dig
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
	host /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/host /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/host
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
	nslookup /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nslookup /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/nslookup
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
	delv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/delv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/delv
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
for t in dnssec-cds dnssec-dsfromkey dnssec-importkey dnssec-keyfromlabel dnssec-keygen dnssec-revoke dnssec-settime dnssec-signzone dnssec-verify; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c $t /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin || exit 1; done
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-cds /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-cds
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-dsfromkey /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-dsfromkey
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-importkey /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-importkey
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-keyfromlabel /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-keyfromlabel
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-keygen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-keygen
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-revoke /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-revoke
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-settime /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-settime
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-signzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-signzone
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-verify /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-verify
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c arpaname \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/arpaname /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/arpaname
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-journalprint \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-journalprint /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-journalprint
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-rrchecker \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-rrchecker /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/named-rrchecker
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c nsec3hash \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nsec3hash /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/nsec3hash
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c mdig \
	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/mdig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/mdig
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c nsupdate /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nsupdate /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/nsupdate
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-checkconf /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-checkconf /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-checkconf
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-checkzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-checkzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-checkzone
(cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin; rm -f named-compilezone; ln -s named-checkzone named-compilezone)
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c rndc-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/rndc-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/rndc-confgen
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c ddns-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/ddns-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/ddns-confgen
(cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin; rm -f tsig-keygen; ln -s ddns-confgen tsig-keygen)
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named
for i in filter-aaaa.so ; \
do \
	if test -f $i ; \
	then \
		/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c $i \
			 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named; \
	fi \
done
i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c filter-aaaa.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named/filter-aaaa.so
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
  [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
done
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
  [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
done
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
for m in arpaname.1 delv.1 dig.1 host.1 mdig.1 named-rrchecker.1 nslookup.1 nsupdate.1; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
for m in named.conf.5 rndc.conf.5; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5/; done
for m in ddns-confgen.8 dnssec-cds.8 dnssec-checkds.8 dnssec-coverage.8 dnssec-dsfromkey.8 dnssec-importkey.8 dnssec-keyfromlabel.8 dnssec-keygen.8 dnssec-keymgr.8 dnssec-revoke.8 dnssec-settime.8 dnssec-signzone.8 dnssec-verify.8 filter-aaaa.8 named-checkconf.8 named-checkzone.8 named-journalprint.8 named.8 nsec3hash.8 rndc-confgen.8 rndc.8; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
( cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; rm -f named-compilezone.8; ln -s named-checkzone.8 named-compilezone.8 )
( cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; rm -f tsig-keygen.8; ln -s ddns-confgen.8 tsig-keygen.8 )
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
/bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5/; done
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
/bin/bash ../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc
mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../bind-9.16.18/bind.keys /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
rmdir: failed to remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/var/run': No such file or directory
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/temp/log.do_install.42537
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/automak
 e/automake_1.16.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/reci
 pes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libuv/libuv_1.41.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_
 1.2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.50.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['initscripts', 'readline', 'glibc', 'pseudo-native', 'pkgconfig-native', 'patch-native', 'quilt-native', 'automake-native', 'opkg-utils', 'autoconf-native', 'openssl', 'xz-native', 'base-files', 'shadow-native', 'libtool-cross', 'shadow', 'base-passwd', 'libtool-native', 'shadow-sysroot', 'gcc-runtime', 'libuv', 'systemd-systemctl-native', 'gcc-cross-i686', 'zlib', 'libcap', 'update-rc.d', 'ncurses', 'linux-libc-headers', 'attr-native', 'texinfo-dummy-native', 'gnu-config-native', 'm4-native', 'gettext-minimal-native', 'binutils-cross-i686', 'attr', 'libxcrypt', 'libpam', 'libgcc', 'gmp-native', 'mpfr-native', 'libmpc-native', 'zlib-native', 'flex-native', 'cracklib', 'flex']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| NOTE: make -j 48 DESTDIR=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image install
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumtype.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumtype.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumclass.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumclass.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/rdatastruct.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/rdatastruct.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make code.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'code.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
|   [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
| done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumtype.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumtype.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumclass.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumclass.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/rdatastruct.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/rdatastruct.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make code.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'code.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| for i in aes.h app.h assertions.h astack.h atomic.h backtrace.h barrier.h base32.h base64.h bind9.h buffer.h bufferlist.h cmocka.h commandline.h counter.h crc64.h deprecated.h endian.h errno.h error.h event.h eventclass.h file.h formatcheck.h fsaccess.h fuzz.h hash.h heap.h hex.h hmac.h hp.h ht.h httpd.h interfaceiter.h iterated_hash.h lang.h lex.h lfsr.h lib.h likely.h list.h log.h magic.h managers.h md.h mem.h meminfo.h mutexatomic.h mutexblock.h netaddr.h netmgr.h netscope.h nonce.h os.h parseint.h pool.h portset.h print.h queue.h quota.h radix.h random.h ratelimiter.h refcount.h regex.h region.h resource.h result.h resultclass.h rwlock.h safe.h serial.h siphash.h sockaddr.h socket.h stats.h stdio.h strerr.h string.h symtab.h task.h taskpool.h timer.h tm.h types.h url.h utf8.h util.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
| done
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 platform.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11
| for i in constants.h internal.h pk11.h result.h site.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/pk11/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11 || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11
| for i in pkcs11.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/pkcs11/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11 || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| /bin/bash ../../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| for i in align.h dir.h net.h netdb.h offset.h stat.h stdatomic.h stdtime.h syslog.h time.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../../bind-9.16.18/lib/isc/unix/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
| done
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| /bin/bash ../../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| for i in condition.h mutex.h once.h thread.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../../bind-9.16.18/lib/isc/pthreads/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
| done
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisc.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisc-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisc-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisc-9.16.18.so libisc.so || { rm -f libisc.so && ln -s libisc-9.16.18.so libisc.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisc.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisc.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc
| for i in alist.h base64.h cc.h ccmsg.h events.h result.h sexpr.h symtab.h symtype.h types.h util.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isccc/include/isccc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisccc.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccc-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccc-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisccc-9.16.18.so libisccc.so || { rm -f libisccc.so && ln -s libisccc-9.16.18.so libisccc.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccc.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccc.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumtype.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumtype.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumclass.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumclass.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/rdatastruct.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/rdatastruct.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make code.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'code.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns
| for i in acl.h adb.h badcache.h bit.h byaddr.h cache.h callbacks.h catz.h cert.h client.h clientinfo.h compress.h db.h dbiterator.h dbtable.h diff.h dispatch.h dlz.h dlz_dlopen.h dns64.h dnsrps.h dnssec.h ds.h dsdigest.h dnstap.h dyndb.h ecs.h edns.h ecdb.h events.h fixedname.h forward.h geoip.h ipkeylist.h iptable.h journal.h kasp.h keydata.h keyflags.h keymgr.h keytable.h keyvalues.h lib.h librpz.h lmdb.h lookup.h log.h master.h masterdump.h message.h name.h ncache.h nsec.h nsec3.h nta.h opcode.h order.h peer.h portlist.h private.h rbt.h rcode.h rdata.h rdataclass.h rdatalist.h rdataset.h rdatasetiter.h rdataslab.h rdatatype.h request.h resolver.h result.h rootns.h rpz.h rriterator.h rrl.h sdb.h sdlz.h secalg.h secproto.h soa.h ssu.h stats.h tcpmsg.h time.h timer.h tkey.h tsec.h tsig.h ttl.h types.h update.h validator.h version.h view.h xfrin.h zone.h zonekey.h zoneverify.h zt.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/dns/include/dns/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns || exit 1; \
| done
| for i in enumclass.h enumtype.h rdatastruct.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst
| for i in dst.h gssapi.h result.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/dns/include/dst/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libdns.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libdns-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libdns-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libdns-9.16.18.so libdns.so || { rm -f libdns.so && ln -s libdns-9.16.18.so libdns.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libdns.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libdns.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns
| for i in client.h hooks.h interfacemgr.h lib.h listenlist.h log.h notify.h query.h server.h sortlist.h stats.h types.h update.h version.h xfrout.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/ns/include/ns/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns || exit 1 ; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libns.la \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libns-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libns-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libns-9.16.18.so libns.so || { rm -f libns.so && ln -s libns-9.16.18.so libns.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libns.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libns.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg
| for i in aclconf.h cfg.h dnsconf.h grammar.h kaspconf.h log.h namedconf.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isccfg/include/isccfg/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisccfg.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccfg-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccfg-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisccfg-9.16.18.so libisccfg.so || { rm -f libisccfg.so && ln -s libisccfg-9.16.18.so libisccfg.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccfg.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccfg.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9
| for i in check.h getaddresses.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/bind9/include/bind9/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9 || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libbind9.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libbind9-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libbind9-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libbind9-9.16.18.so libbind9.so || { rm -f libbind9.so && ln -s libbind9-9.16.18.so libbind9.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libbind9.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libbind9.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| for i in context.h dnsconf.h resconf.h types.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/irs/include/irs/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs || exit 1; \
| done
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 netdb.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 platform.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libirs.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libirs-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libirs-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libirs-9.16.18.so libirs.so || { rm -f libirs.so && ln -s libirs-9.16.18.so libirs.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libirs.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libirs.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccc/libisccc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c rndc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccc/libisccc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/rndc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/rndc
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	dig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/dig
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	host /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/host /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/host
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	nslookup /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nslookup /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/nslookup
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	delv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/delv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/delv
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| for t in dnssec-cds dnssec-dsfromkey dnssec-importkey dnssec-keyfromlabel dnssec-keygen dnssec-revoke dnssec-settime dnssec-signzone dnssec-verify; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c $t /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin || exit 1; done
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-cds /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-cds
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-dsfromkey /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-dsfromkey
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-importkey /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-importkey
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-keyfromlabel /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-keyfromlabel
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-keygen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-keygen
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-revoke /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-revoke
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-settime /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-settime
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-signzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-signzone
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-verify /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-verify
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c arpaname \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/arpaname /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/arpaname
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-journalprint \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-journalprint /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-journalprint
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-rrchecker \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-rrchecker /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/named-rrchecker
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c nsec3hash \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nsec3hash /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/nsec3hash
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c mdig \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/mdig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/mdig
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c nsupdate /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nsupdate /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/nsupdate
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-checkconf /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-checkconf /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-checkconf
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-checkzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-checkzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-checkzone
| (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin; rm -f named-compilezone; ln -s named-checkzone named-compilezone)
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c rndc-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/rndc-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/rndc-confgen
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c ddns-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/ddns-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/ddns-confgen
| (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin; rm -f tsig-keygen; ln -s ddns-confgen tsig-keygen)
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named
| for i in filter-aaaa.so ; \
| do \
| 	if test -f $i ; \
| 	then \
| 		/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c $i \
| 			 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named; \
| 	fi \
| done
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c filter-aaaa.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named/filter-aaaa.so
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
|   [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
| done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
|   [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
| done
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| for m in arpaname.1 delv.1 dig.1 host.1 mdig.1 named-rrchecker.1 nslookup.1 nsupdate.1; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
| for m in named.conf.5 rndc.conf.5; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5/; done
| for m in ddns-confgen.8 dnssec-cds.8 dnssec-checkds.8 dnssec-coverage.8 dnssec-dsfromkey.8 dnssec-importkey.8 dnssec-keyfromlabel.8 dnssec-keygen.8 dnssec-keymgr.8 dnssec-revoke.8 dnssec-settime.8 dnssec-signzone.8 dnssec-verify.8 filter-aaaa.8 named-checkconf.8 named-checkzone.8 named-journalprint.8 named.8 nsec3hash.8 rndc-confgen.8 rndc.8; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| ( cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; rm -f named-compilezone.8; ln -s named-checkzone.8 named-compilezone.8 )
| ( cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; rm -f tsig-keygen.8; ln -s ddns-confgen.8 tsig-keygen.8 )
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| /bin/bash ../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../bind-9.16.18/bind.keys /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
| rmdir: failed to remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/var/run': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/temp/run.do_install.42537' failed with exit code 1:
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumtype.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumtype.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumclass.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumclass.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/rdatastruct.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/rdatastruct.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make code.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'code.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
|   [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
| done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/make'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumtype.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumtype.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumclass.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumclass.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/rdatastruct.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/rdatastruct.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make code.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'code.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| for i in aes.h app.h assertions.h astack.h atomic.h backtrace.h barrier.h base32.h base64.h bind9.h buffer.h bufferlist.h cmocka.h commandline.h counter.h crc64.h deprecated.h endian.h errno.h error.h event.h eventclass.h file.h formatcheck.h fsaccess.h fuzz.h hash.h heap.h hex.h hmac.h hp.h ht.h httpd.h interfaceiter.h iterated_hash.h lang.h lex.h lfsr.h lib.h likely.h list.h log.h magic.h managers.h md.h mem.h meminfo.h mutexatomic.h mutexblock.h netaddr.h netmgr.h netscope.h nonce.h os.h parseint.h pool.h portset.h print.h queue.h quota.h radix.h random.h ratelimiter.h refcount.h regex.h region.h resource.h result.h resultclass.h rwlock.h safe.h serial.h siphash.h sockaddr.h socket.h stats.h stdio.h strerr.h string.h symtab.h task.h taskpool.h timer.h tm.h types.h url.h utf8.h util.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
| done
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 platform.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11
| for i in constants.h internal.h pk11.h result.h site.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/pk11/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pk11 || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pk11'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11
| for i in pkcs11.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isc/include/pkcs11/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/pkcs11 || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include/pkcs11'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/netmgr'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| /bin/bash ../../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| for i in align.h dir.h net.h netdb.h offset.h stat.h stdatomic.h stdtime.h syslog.h time.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../../bind-9.16.18/lib/isc/unix/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
| done
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/unix'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| /bin/bash ../../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc
| for i in condition.h mutex.h once.h thread.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../../bind-9.16.18/lib/isc/pthreads/include/isc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isc || exit 1; \
| done
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include/isc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads/include'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/pthreads'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisc.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisc-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisc-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisc-9.16.18.so libisc.so || { rm -f libisc.so && ln -s libisc-9.16.18.so libisc.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisc.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisc.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc
| for i in alist.h base64.h cc.h ccmsg.h events.h result.h sexpr.h symtab.h symtype.h types.h util.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isccc/include/isccc/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccc || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include/isccc'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisccc.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccc-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccc-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisccc-9.16.18.so libisccc.so || { rm -f libisccc.so && ln -s libisccc-9.16.18.so libisccc.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccc.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccc.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumtype.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumtype.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/enumclass.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/enumclass.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make include/dns/rdatastruct.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'include/dns/rdatastruct.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make code.h
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| make[3]: 'code.h' is up to date.
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns
| for i in acl.h adb.h badcache.h bit.h byaddr.h cache.h callbacks.h catz.h cert.h client.h clientinfo.h compress.h db.h dbiterator.h dbtable.h diff.h dispatch.h dlz.h dlz_dlopen.h dns64.h dnsrps.h dnssec.h ds.h dsdigest.h dnstap.h dyndb.h ecs.h edns.h ecdb.h events.h fixedname.h forward.h geoip.h ipkeylist.h iptable.h journal.h kasp.h keydata.h keyflags.h keymgr.h keytable.h keyvalues.h lib.h librpz.h lmdb.h lookup.h log.h master.h masterdump.h message.h name.h ncache.h nsec.h nsec3.h nta.h opcode.h order.h peer.h portlist.h private.h rbt.h rcode.h rdata.h rdataclass.h rdatalist.h rdataset.h rdatasetiter.h rdataslab.h rdatatype.h request.h resolver.h result.h rootns.h rpz.h rriterator.h rrl.h sdb.h sdlz.h secalg.h secproto.h soa.h ssu.h stats.h tcpmsg.h time.h timer.h tkey.h tsec.h tsig.h ttl.h types.h update.h validator.h version.h view.h xfrin.h zone.h zonekey.h zoneverify.h zt.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/dns/include/dns/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns || exit 1; \
| done
| for i in enumclass.h enumtype.h rdatastruct.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dns || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst
| for i in dst.h gssapi.h result.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/dns/include/dst/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/dst || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include/dst'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libdns.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libdns-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libdns-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libdns-9.16.18.so libdns.so || { rm -f libdns.so && ln -s libdns-9.16.18.so libdns.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libdns.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libdns.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns
| for i in client.h hooks.h interfacemgr.h lib.h listenlist.h log.h notify.h query.h server.h sortlist.h stats.h types.h update.h version.h xfrout.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/ns/include/ns/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/ns || exit 1 ; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include/ns'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libns.la \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libns-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libns-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libns-9.16.18.so libns.so || { rm -f libns.so && ln -s libns-9.16.18.so libns.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libns.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libns.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg
| for i in aclconf.h cfg.h dnsconf.h grammar.h kaspconf.h log.h namedconf.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/isccfg/include/isccfg/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/isccfg || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include/isccfg'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libisccfg.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccfg-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccfg-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libisccfg-9.16.18.so libisccfg.so || { rm -f libisccfg.so && ln -s libisccfg-9.16.18.so libisccfg.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libisccfg.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libisccfg.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9
| for i in check.h getaddresses.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/bind9/include/bind9/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/bind9 || exit 1; \
| done
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include/bind9'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libbind9.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libbind9-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libbind9-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libbind9-9.16.18.so libbind9.so || { rm -f libbind9.so && ln -s libbind9-9.16.18.so libbind9.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libbind9.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libbind9.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/bind9'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| /bin/bash ../../../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| for i in context.h dnsconf.h resconf.h types.h version.h; do \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../../../../../bind-9.16.18/lib/irs/include/irs/$i /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs || exit 1; \
| done
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 netdb.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 platform.h /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/include/irs
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include/irs'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs/include'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c libirs.la /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libirs-9.16.18.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libirs-9.16.18.so
| i686-poky-linux-libtool: install: (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib && { ln -s -f libirs-9.16.18.so libirs.so || { rm -f libirs.so && ln -s libirs-9.16.18.so libirs.so; }; })
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/libirs.lai /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/libirs.la
| i686-poky-linux-libtool: warning: remember to run 'i686-poky-linux-libtool --finish /usr/lib'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/irs'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/fuzz'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named/unix'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccc/libisccc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/named'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c rndc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccc/libisccc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/rndc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/rndc
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/rndc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	dig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/dig
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	host /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/host /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/host
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	nslookup /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nslookup /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/nslookup
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dig'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c \
| 	delv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/delv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/delv
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/delv'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| for t in dnssec-cds dnssec-dsfromkey dnssec-importkey dnssec-keyfromlabel dnssec-keygen dnssec-revoke dnssec-settime dnssec-signzone dnssec-verify; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c $t /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin || exit 1; done
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-cds /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-cds
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-dsfromkey /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-dsfromkey
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-importkey /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-importkey
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-keyfromlabel /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-keyfromlabel
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-keygen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-keygen
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-revoke /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-revoke
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-settime /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-settime
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-signzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-signzone
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/dnssec-verify /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/dnssec-verify
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/dnssec'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c arpaname \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/arpaname /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/arpaname
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-journalprint \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-journalprint /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-journalprint
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-rrchecker \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-rrchecker /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/named-rrchecker
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c nsec3hash \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nsec3hash /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/nsec3hash
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c mdig \
| 	/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/mdig /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/mdig
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tools'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c nsupdate /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/irs/libirs.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/nsupdate /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/bin/nsupdate
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/nsupdate'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-checkconf /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/bind9/libbind9.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-checkconf /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-checkconf
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c named-checkzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/ns/libns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isccfg/libisccfg.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/named-checkzone /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/named-checkzone
| (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin; rm -f named-compilezone; ln -s named-checkzone named-compilezone)
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/check'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen/unix'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c rndc-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/rndc-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/rndc-confgen
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c ddns-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin
| i686-poky-linux-libtool: warning: '../../lib/dns/libdns.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: warning: '../../lib/isc/libisc.la' has not been installed in '/usr/lib'
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c .libs/ddns-confgen /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin/ddns-confgen
| (cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/sbin; rm -f tsig-keygen; ln -s ddns-confgen tsig-keygen)
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/confgen'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named
| for i in filter-aaaa.so ; \
| do \
| 	if test -f $i ; \
| 	then \
| 		/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/i686-poky-linux-libtool --mode=install /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c $i \
| 			 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named; \
| 	fi \
| done
| i686-poky-linux-libtool: install: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c filter-aaaa.so /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/lib/named/filter-aaaa.so
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/plugins'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dlzexternal'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver
| make[5]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[5]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb/driver'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/dyndb'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/pipelined'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rndc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rpz'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/rsabigexponent'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system/tkey'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests/system'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin/tests'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/bin'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
|   [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
| done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| making all in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| for man in arpaname.1in ddns-confgen.8in delv.1in dig.1in dnssec-cds.8in dnssec-checkds.8in dnssec-coverage.8in dnssec-dsfromkey.8in dnssec-importkey.8in dnssec-keyfromlabel.8in dnssec-keygen.8in dnssec-keymgr.8in dnssec-revoke.8in dnssec-settime.8in dnssec-signzone.8in dnssec-verify.8in dnstap-read.1in filter-aaaa.8in host.1in mdig.1in named-checkconf.8in named-checkzone.8in named-journalprint.8in named-nzd2nzf.8in named-rrchecker.1in named.conf.5in named.8in nsec3hash.8in nslookup.1in nsupdate.1in rndc-confgen.8in rndc.conf.5in rndc.8in pkcs11-destroy.8in pkcs11-keygen.8in pkcs11-list.8in pkcs11-tokens.8in; do \
|   [ -e "$man" ] || cp -f ../../../bind-9.16.18/doc/man/"$man" .; \
| done
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| for m in arpaname.1 delv.1 dig.1 host.1 mdig.1 named-rrchecker.1 nslookup.1 nsupdate.1; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
| for m in named.conf.5 rndc.conf.5; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5/; done
| for m in ddns-confgen.8 dnssec-cds.8 dnssec-checkds.8 dnssec-coverage.8 dnssec-dsfromkey.8 dnssec-importkey.8 dnssec-keyfromlabel.8 dnssec-keygen.8 dnssec-keymgr.8 dnssec-revoke.8 dnssec-settime.8 dnssec-signzone.8 dnssec-verify.8 filter-aaaa.8 named-checkconf.8 named-checkzone.8 named-journalprint.8 named.8 nsec3hash.8 rndc-confgen.8 rndc.8; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| ( cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; rm -f named-compilezone.8; ln -s named-checkzone.8 named-compilezone.8 )
| ( cd /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; rm -f tsig-keygen.8; ln -s ddns-confgen.8 tsig-keygen.8 )
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/man'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5
| /bin/bash ../../../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man1/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man5/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| for m in ; do /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 $m /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/usr/share/man/man8/; done
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/arm'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/misc'
| making install in /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc/doxygen'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/build/doc'
| /bin/bash ../bind-9.16.18/mkinstalldirs /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc
| mkdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/install -c -m 644 ../bind-9.16.18/bind.keys /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/etc/bind
| rmdir: failed to remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bind/9.16.18-r0/image/var/run': No such file or directory
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe bind-9.16.18-r0: task do_install: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2407 tasks of which 2398 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bind/bind_9.16.18.bb:do_install
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============4608869965554769950==--
