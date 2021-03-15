Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.285.1615826520929878868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id AD28D38C1378
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.2.170.0 FAILED
Message-ID: <MADEUP.166C91A946177161.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149522
Content-Type: multipart/mixed; boundary="===============6244031873859246919=="

--===============6244031873859246919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.2.170.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.2.162.1-1.2.170.0.patch
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

--===============6244031873859246919==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.2.162.1-1.2.170.0.patch"

From 8ec397bc7d5c8a81a7017daa8e5731aabfdd84e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 13:00:01 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.2.162.1 -> 1.2.170.0

---
 .../{vulkan-tools_1.2.162.1.bb => vulkan-tools_1.2.170.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.162.1.bb => vulkan-tools_1.2.170.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
index a5c3bbcb14..3d3d58aa9e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
-SRCREV = "8f0c2e40d4134f53f82ce48de72c7be92baa6b3d"
+SRCREV = "88ea55de928a08ba5c5f65a93d1e7c8f666fc43f"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============6244031873859246919==
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
DISTRO_VERSION       = "3.2+snapshot-3448ddf0362ea1f5e5689eca51bda51080b628da"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3448ddf0362ea1f5e5689eca51bda51080b628da"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 214 Local 205 Network 0 Missed 9 Current 526 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1578 of 2330 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.2.170.0-r0: task do_fetch: Started
WARNING: vulkan-tools-1.2.170.0-r0 do_fetch: Failed to fetch URL git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162, attempting MIRRORS if available
ERROR: vulkan-tools-1.2.170.0-r0 do_fetch: Fetcher failure: Unable to find revision 88ea55de928a08ba5c5f65a93d1e7c8f666fc43f in branch sdk-1.2.162 even from upstream
ERROR: vulkan-tools-1.2.170.0-r0 do_fetch: Fetcher failure for URL: 'git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.2.170.0-r0/temp/log.do_fetch.31734
NOTE: recipe vulkan-tools-1.2.170.0-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2315 tasks of which 2314 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.2.170.0.bb:do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============6244031873859246919==--
