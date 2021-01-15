Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.700.1610713822710119607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0569138C127B
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.20.7.1 FAILED
Message-ID: <MADEUP.165A67B01BC9F5C0.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146753
Content-Type: multipart/mixed; boundary="===============5863079482564181635=="

--===============5863079482564181635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.20.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.20.5-1.20.7.1.patch
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

--===============5863079482564181635==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.20.5-1.20.7.1.patch"

From c0420e8cd269addaa218f3a6947f0c1de8c21d84 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 04:25:42 +0000
Subject: [PATCH] dpkg: upgrade 1.20.5 -> 1.20.7.1

---
 .../0001-build.c-ignore-return-of-1-from-tar-cf.patch     | 8 ++++----
 .../dpkg/{dpkg_1.20.5.bb => dpkg_1.20.7.1.bb}             | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.20.5.bb => dpkg_1.20.7.1.bb} (93%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index ffe520c513..1ddb15687d 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 15b081cc8bead80c493ab83369ecb3345a24a3dc Mon Sep 17 00:00:00 2001
+From 249601a446b07a194e46390ddfdec6e420c336b8 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -29,10 +29,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 8436839cd..6b44a36f7 100644
+index a585f35a1..f6f995fc2 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -434,6 +434,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -438,6 +438,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
    pid_t pid_tar, pid_comp;
@@ -40,7 +40,7 @@ index 8436839cd..6b44a36f7 100644
  
    /* Fork off a tar. We will feed it a list of filenames on stdin later. */
    m_pipe(pipe_filenames);
-@@ -486,7 +487,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -490,7 +491,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
    /* All done, clean up wait for tar and <compress> to finish their job. */
    close(pipe_filenames[1]);
    subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.5.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
similarity index 93%
rename from meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
index d97b69c0b9..0fdbe6f462 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.5.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=sid \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https \
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "823a67d67538b1b403a32d1fef40e6e228265566"
+SRCREV = "667bf0aeb92e0e7bb225ee273569c5e2389083bd"
 
 S = "${WORKDIR}/git"
-- 
2.27.0


--===============5863079482564181635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1420 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1420 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-fd857e1d9673eda4618446ea041429979ef327dd"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fd857e1d9673eda4618446ea041429979ef327dd"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 145 Found 137 Missed 8 Current 514 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1529 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_fetch)
NOTE: recipe dpkg-1.20.7.1-r0: task do_fetch: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 2095 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_unpack)
NOTE: Running task 2096 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dpkg-1.20.7.1-r0: task do_unpack: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2097 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_patch)
NOTE: recipe dpkg-1.20.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dpkg-1.20.7.1-r0: task do_patch: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2098 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_populate_lic)
NOTE: recipe dpkg-1.20.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_populate_lic: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_populate_lic: Succeeded
NOTE: recipe dpkg-1.20.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2100 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_configure)
NOTE: recipe dpkg-1.20.7.1-r0: task do_configure: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_compile)
NOTE: recipe dpkg-1.20.7.1-r0: task do_compile: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2102 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_install)
NOTE: recipe dpkg-1.20.7.1-r0: task do_install: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_install: Succeeded
NOTE: Running task 2103 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_package)
NOTE: Running task 2104 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_populate_sysroot)
NOTE: recipe dpkg-1.20.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_package: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dpkg-1.20.7.1-r0: task do_package: Succeeded
NOTE: Running task 2105 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_packagedata)
NOTE: recipe dpkg-1.20.7.1-r0: task do_packagedata: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2106 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_package_write_rpm)
NOTE: Running task 2107 of 2108 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_package_qa)
NOTE: recipe dpkg-1.20.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe dpkg-1.20.7.1-r0: task do_package_qa: Started
ERROR: dpkg-1.20.7.1-r0 do_package_qa: QA Issue: dpkg: /work/core2-32-poky-linux/dpkg/1.20.7.1-r0/packages-split/dpkg/usr/sbin/dpkg-fsys-usrunmess maximum shebang size exceeded, the maximum size is 128. [shebang-size]
ERROR: dpkg-1.20.7.1-r0 do_package_qa: QA Issue: /usr/sbin/dpkg-fsys-usrunmess contained in package dpkg requires /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/dpkg/1.20.7.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl, but no providers found in RDEPENDS_dpkg? [file-rdeps]
ERROR: dpkg-1.20.7.1-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/dpkg/1.20.7.1-r0/temp/log.do_package_qa.3367263
NOTE: recipe dpkg-1.20.7.1-r0: task do_package_qa: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_package_qa) failed with exit code '1'
NOTE: recipe dpkg-1.20.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 2107 tasks of which 2093 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb:do_package_qa
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

--===============5863079482564181635==--
