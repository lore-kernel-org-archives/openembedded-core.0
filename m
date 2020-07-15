Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.127.1594831457817925289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8FEDE01E94; Wed, 15 Jul 2020 09:44:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10AE8E01ECF
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:43:02 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.2.141.0 FAILED
Message-Id: <20200715164417.A8FEDE01E94@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:44:17 -0700 (PDT)
X-Groupsio-MsgNum: 140677
Content-Type: multipart/mixed; boundary="===============5277691144617370519=="

--===============5277691144617370519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.2.141.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.2.135.0-1.2.141.0.patch
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

--===============5277691144617370519==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.2.135.0-1.2.141.0.patch"

From a02f33bf72dcb729f7cf1b3d9ef6a800dd455613 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 12:11:10 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.2.135.0 -> 1.2.141.0

---
 .../{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.141.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.141.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.141.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.141.0.bb
index 8bab58f0b9..5729915e1e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.141.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135"
-SRCREV = "86429d9e7f3542e88fb98ffa7d8a82c10c9828ac"
+SRCREV = "006586926adece57adea3e006140b5df19826371"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============5277691144617370519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1339 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1339 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:97ec3785bfe90621968fe5f2de954e30c468023d"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 255 Found 247 Missed 8 Current 531 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1613 of 2430 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.141.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.2.141.0-r0: task do_fetch: Started
WARNING: vulkan-loader-1.2.141.0-r0 do_fetch: Failed to fetch URL git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135, attempting MIRRORS if available
ERROR: vulkan-loader-1.2.141.0-r0 do_fetch: Fetcher failure: Unable to find revision 006586926adece57adea3e006140b5df19826371 in branch sdk-1.2.135 even from upstream
ERROR: vulkan-loader-1.2.141.0-r0 do_fetch: Fetcher failure for URL: 'git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.141.0-r0/temp/log.do_fetch.47675
NOTE: recipe vulkan-loader-1.2.141.0-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.141.0.bb:do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2415 tasks of which 2414 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.141.0.bb:do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============5277691144617370519==--
