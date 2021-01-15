Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.690.1610713822970266237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5F74138C13BB
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.0.3 FAILED
Message-ID: <MADEUP.165A67B0569B2CEC.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146783
Content-Type: multipart/mixed; boundary="===============3523509943900343302=="

--===============3523509943900343302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libhandy-upgrade-1.0.2-1.0.3.patch
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

--===============3523509943900343302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libhandy-upgrade-1.0.2-1.0.3.patch"

From eee95e1c471346986f56d7eef3b0a9d47988d98b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 07:36:16 +0000
Subject: [PATCH] libhandy: upgrade 1.0.2 -> 1.0.3

---
 .../libhandy/{libhandy_1.0.2.bb => libhandy_1.0.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.0.2.bb => libhandy_1.0.3.bb} (77%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
similarity index 77%
rename from meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
index 4daa3c1a54..d7d8e94919 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.2.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
@@ -2,8 +2,8 @@ SUMMARY = "A library full of GTK+ widgets for mobile phones"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "465c00f8f80c27330be494ed7c0ba2ffe26321c4"
+SRC_URI = "git://gitlab.gnome.org/GNOME/%24%7BBPN%7D.git;protocol=https;branch=libhandy-1-0"
+SRCREV = "7126d2e8da9dcdeb5751e60ff6a74930804f9637"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.27.0


--===============3523509943900343302==
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
DISTRO_VERSION       = "3.2+snapshot-b72a24615fcae0e12c5f50d2901c19c8430030ec"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b72a24615fcae0e12c5f50d2901c19c8430030ec"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 190 Found 182 Missed 8 Current 751 (95% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2245 of 3018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb:do_fetch)
NOTE: recipe libhandy-1.0.3-r0: task do_fetch: Started
NOTE: Running task 2554 of 3018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb:do_write_config)
NOTE: recipe libhandy-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2589 of 3018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb:do_unpack)
NOTE: Running task 2590 of 3018 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.0.3-r0: task do_write_config: Started
NOTE: recipe libhandy-1.0.3-r0: task do_unpack: Started
ERROR: libhandy-1.0.3-r0 do_unpack: Unpack failure for URL: 'git://gitlab.gnome.org/GNOME/%24%7BBPN%7D.git;protocol=https;branch=libhandy-1-0'. No up to date source found: clone directory not available or not up to date: /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/gitlab.gnome.org.GNOME.${BPN}.git; shallow clone not enabled
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libhandy/1.0.3-r0/temp/log.do_unpack.2115887
NOTE: recipe libhandy-1.0.3-r0: task do_unpack: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb:do_unpack) failed with exit code '1'
NOTE: recipe libhandy-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2781 tasks of which 2777 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb:do_unpack
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============3523509943900343302==--
