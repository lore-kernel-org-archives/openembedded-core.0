Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.24165.1608473714355701775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2EAC538C13B6
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.2.162.0 FAILED
Message-ID: <MADEUP.16527252C474433F.28097@lists.openembedded.org>
X-Groupsio-MsgNum: 145973
Content-Type: multipart/mixed; boundary="===============0664918388294643015=="

--===============0664918388294643015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.2.162.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.2.154.1-1.2.162.0.patch
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

--===============0664918388294643015==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.2.154.1-1.2.162.0.patch"

From 12cfa8e27627f9eace12b0655ff82cabb56b7214 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 09:06:15 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.2.154.1 -> 1.2.162.0

---
 .../{vulkan-loader_1.2.154.1.bb => vulkan-loader_1.2.162.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.154.1.bb => vulkan-loader_1.2.162.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
index 23bf59f8a6..5715ce3962 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.154"
-SRCREV = "2aa801755eab3fab610d9676c4dd94054e30c854"
+SRCREV = "7a313093b5c4af964d50a5a64e73d7df6152ea3f"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


--===============0664918388294643015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1416 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1416 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-e37a545aa0da11f0a5f08704380fd7f957213ae4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e37a545aa0da11f0a5f08704380fd7f957213ae4"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 217 Found 208 Missed 9 Current 509 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1554 of 2291 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_fetch: Started
WARNING: vulkan-loader-1.2.162.0-r0 do_fetch: Failed to fetch URL git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.154, attempting MIRRORS if available
ERROR: vulkan-loader-1.2.162.0-r0 do_fetch: Fetcher failure: Unable to find revision 7a313093b5c4af964d50a5a64e73d7df6152ea3f in branch sdk-1.2.154 even from upstream
ERROR: vulkan-loader-1.2.162.0-r0 do_fetch: Fetcher failure for URL: 'git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.154'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.162.0-r0/temp/log.do_fetch.36595
NOTE: recipe vulkan-loader-1.2.162.0-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2276 tasks of which 2275 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb:do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============0664918388294643015==--
