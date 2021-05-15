Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4463.1621074783402865640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B760938C13F5
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.176.0 FAILED
Message-ID: <MADEUP.167F36EDB8E4B08D.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151829
Content-Type: multipart/mixed; boundary="===============5818628305406436958=="

--===============5818628305406436958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.176.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.170.0-1.2.176.0.patch
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

--===============5818628305406436958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.170.0-1.2.176.0.patch"

From 5067e51cc491d0fc9b982a9ac6f1e81c2ba7c3ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:21:41 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.170.0 -> 1.2.176.0

---
 .../{vulkan-tools_1.2.170.0.bb => vulkan-tools_1.2.176.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.170.0.bb => vulkan-tools_1.2.176.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
index 0c8bcaa085..151186c046 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170"
-SRCREV = "88ea55de928a08ba5c5f65a93d1e7c8f666fc43f"
+SRCREV = "eb3d67bd17ee433e2b0a8e56a7249bd83908812e"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============5818628305406436958==
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
DISTRO_VERSION       = "3.3+snapshot-be8d2b39ed85f259bc8b4fe5951ffac3c7c224a2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:be8d2b39ed85f259bc8b4fe5951ffac3c7c224a2"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 247 Local 238 Network 0 Missed 9 Current 550 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1708 of 2477 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.2.176.0-r0: task do_fetch: Started
WARNING: vulkan-tools-1.2.176.0-r0 do_fetch: Failed to fetch URL git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170, attempting MIRRORS if available
ERROR: vulkan-tools-1.2.176.0-r0 do_fetch: Fetcher failure: Unable to find revision eb3d67bd17ee433e2b0a8e56a7249bd83908812e in branch sdk-1.2.170 even from upstream
ERROR: vulkan-tools-1.2.176.0-r0 do_fetch: Fetcher failure for URL: 'git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.170'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.176.0-r0/temp/log.do_fetch.1563518
NOTE: recipe vulkan-tools-1.2.176.0-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2462 tasks of which 2461 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.176.0.bb:do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============5818628305406436958==--
