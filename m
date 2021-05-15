Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4464.1621074783442767245
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 277DA38C1336
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rxvt-unicode: upgrading to 9.26 FAILED
Message-ID: <MADEUP.167F36EDDABC7196.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151844
Content-Type: multipart/mixed; boundary="===============1400747993593433506=="

--===============1400747993593433506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rxvt-unicode* to *9.26* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-rxvt-unicode-upgrade-9.22-9.26.patch
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

--===============1400747993593433506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-d53fd297f51834676fa681fd00b97aa05b00954d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d53fd297f51834676fa681fd00b97aa05b00954d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 197 Local 189 Network 0 Missed 8 Current 600 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1906 of 2495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb:do_fetch)
NOTE: recipe rxvt-unicode-9.26-r0: task do_fetch: Started
NOTE: recipe rxvt-unicode-9.26-r0: task do_fetch: Succeeded
NOTE: Running task 2308 of 2495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb:do_unpack)
NOTE: Running task 2309 of 2495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe rxvt-unicode-9.26-r0: task do_unpack: Started
NOTE: recipe rxvt-unicode-9.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rxvt-unicode-9.26-r0: task do_unpack: Succeeded
NOTE: Running task 2484 of 2495 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb:do_patch)
NOTE: recipe rxvt-unicode-9.26-r0: task do_patch: Started
ERROR: rxvt-unicode-9.26-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rxvt-unicode/9.26-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Patch xwc.patch is already applied; check your series file

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/rxvt-unicode/9.26-r0/temp/log.do_patch.4022282
NOTE: recipe rxvt-unicode-9.26-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb:do_patch) failed with exit code '1'
NOTE: recipe rxvt-unicode-9.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2484 tasks of which 2480 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb:do_patch
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1400747993593433506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-rxvt-unicode-upgrade-9.22-9.26.patch"

From 0eb1bd16a58127cc417a083040f31c56e8d4d5eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 09:17:58 +0000
Subject: [PATCH] rxvt-unicode: upgrade 9.22 -> 9.26

---
 ...emove-deprecated-throw-specification.patch | 30 -------------------
 ...t-unicode_9.22.bb => rxvt-unicode_9.26.bb} |  8 +++--
 2 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.22.bb => rxvt-unicode_9.26.bb} (44%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
deleted file mode 100644
index f10dca09d6..0000000000
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9a8f1d73e7b7e183768a8379ef32429a84f0e5c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Feb 2021 18:11:56 -0800
-Subject: [PATCH] libev: remove deprecated throw specification
-
-removes the throw specifications that are deprecated since C++11:
-warning: dynamic exception specifications are deprecated in C++11 [-Wdeprecated]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libev/ev++.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libev/ev++.h b/libev/ev++.h
-index 4f0a36a..85ddf44 100644
---- a/libev/ev++.h
-+++ b/libev/ev++.h
-@@ -376,7 +376,7 @@ namespace ev {
- 
-   struct default_loop : loop_ref
-   {
--    default_loop (unsigned int flags = AUTO) throw (bad_loop)
-+    default_loop (unsigned int flags = AUTO)
- #if EV_MULTIPLICITY
-     : loop_ref (ev_default_loop (flags))
- #endif
--- 
-2.30.1
-
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
similarity index 44%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
index 283e8d7751..74dfcc186d 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.26.bb
@@ -4,7 +4,11 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch"
+SRC_URI += "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
+           file://xwc.patch \
+           file://rxvt.desktop \
+           file://rxvt.png \
+           "
 
-SRC_URI[sha256sum] = "e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
+SRC_URI[sha256sum] = "643116b9a25d29ad29f4890131796d42e6d2d21312282a613ef66c80c5b8c98b"
 
-- 
2.27.0


--===============1400747993593433506==--
