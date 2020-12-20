Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23884.1608473714106937002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id E248B38C1454
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 3.3.0 FAILED
Message-ID: <MADEUP.165272525AF1E4ED.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145941
Content-Type: multipart/mixed; boundary="===============1510379227471834909=="

--===============1510379227471834909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *3.3.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-3.1.1-3.3.0.patch
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

--===============1510379227471834909==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-3.1.1-3.3.0.patch"

From ee93ea4ff0626b7f3353f0dc978ee457686d854f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 00:31:11 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 3.1.1 -> 3.3.0

---
 ...tlib-metadata_3.1.1.bb => python3-importlib-metadata_3.3.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.1.1.bb => python3-importlib-metadata_3.3.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb
-- 
2.20.1


--===============1510379227471834909==
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
DISTRO_VERSION       = "3.2+snapshot-144c400e4b98f196da20891fe7079657a09d2b70"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:144c400e4b98f196da20891fe7079657a09d2b70"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 214 Found 203 Missed 11 Current 509 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1558 of 2303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1908 of 2303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_unpack)
NOTE: Running task 1909 of 2303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1962 of 2303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_patch)
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2292 of 2303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_populate_lic: Started
WARNING: python3-importlib-metadata-3.3.0-r0 do_populate_lic: Could not copy license file /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/3.3.0-r0/importlib_metadata-3.3.0/LICENSE to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/3.3.0-r0/license-destdir/python3-importlib-metadata/LICENSE: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/3.3.0-r0/importlib_metadata-3.3.0/LICENSE'
ERROR: python3-importlib-metadata-3.3.0-r0 do_populate_lic: QA Issue: python3-importlib-metadata: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/3.3.0-r0/importlib_metadata-3.3.0/LICENSE [license-checksum]
ERROR: python3-importlib-metadata-3.3.0-r0 do_populate_lic: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/3.3.0-r0/temp/log.do_populate_lic.40971
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_populate_lic: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_populate_lic) failed with exit code '1'
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-3.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 2292 tasks of which 2286 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.3.0.bb:do_populate_lic
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============1510379227471834909==--
