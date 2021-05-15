Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4497.1621074783901288369
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8BE8E38C13DD
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 2.8.1 FAILED
Message-ID: <MADEUP.167F36EDBBA64911.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151830
Content-Type: multipart/mixed; boundary="===============2696135313375918738=="

--===============2696135313375918738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *2.8.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-2.8.0-2.8.1.patch
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

--===============2696135313375918738==
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
DISTRO_VERSION       = "3.3+snapshot-999b90017a3536e344e1ea9f691d7dc85514a1c9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:999b90017a3536e344e1ea9f691d7dc85514a1c9"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 208 Local 200 Network 0 Missed 8 Current 625 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1920 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 2198 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2432 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 2433 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2575 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2576 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2577 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2578 of 2586 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
ERROR: harfbuzz-2.8.1-r0 do_configure: QA Issue: harfbuzz: configure was passed unrecognised options: fontconfig [unknown-configure-option]
ERROR: harfbuzz-2.8.1-r0 do_configure: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/harfbuzz/2.8.1-r0/temp/log.do_configure.1404102
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2578 tasks of which 2570 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============2696135313375918738==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-2.8.0-2.8.1.patch"

From e2fc7ad4aaa69a92e5f736830e5409752bec510f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 06:48:26 +0000
Subject: [PATCH] harfbuzz: upgrade 2.8.0 -> 2.8.1

---
 .../harfbuzz/{harfbuzz_2.8.0.bb => harfbuzz_2.8.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.8.0.bb => harfbuzz_2.8.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
index 6e3fed7357..6d6d52c94f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "a1079fd021adaf5683351f34587a255975cc3bcadba31246ae40ebebb95ecd42"
+SRC_URI[sha256sum] = "4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.27.0


--===============2696135313375918738==--
