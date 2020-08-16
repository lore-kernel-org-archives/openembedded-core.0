Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19806.1597558878104656752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEAC9E02027; Sat, 15 Aug 2020 23:21:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2C4DE0204A
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:39 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 5.8 FAILED
Message-Id: <20200816062117.EEAC9E02027@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:21:17 -0700 (PDT)
X-Groupsio-MsgNum: 141489
Content-Type: multipart/mixed; boundary="===============7408711620662626160=="

--===============7408711620662626160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *5.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.7-5.8.patch
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

--===============7408711620662626160==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-ethtool-upgrade-5.7-5.8.patch"

From d280009f7e3b9582f759e59870933bcbf894db85 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 18:12:38 +0000
Subject: [PATCH] ethtool: upgrade 5.7 -> 5.8

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.7.bb => ethtool_5.8.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.7.bb => ethtool_5.8.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 8ecfde1417..9686a77308 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 1c6c017e56ec536f5cceacdb02092777d390debb Mon Sep 17 00:00:00 2001
+From 119ac16fee900843591535bef713c0cf7908e3c6 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1169b7f..ed82524 100644
+index 19223f7..8a58d15 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.7, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.8, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.7.bb b/meta/recipes-extended/ethtool/ethtool_5.8.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.7.bb
rename to meta/recipes-extended/ethtool/ethtool_5.8.bb
index d9fc30cb55..0a6e7a2b1f 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.7.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "c2e16f8bf510c5822f8e25061c2533972308a421767c54abcacb1038b08bb782"
+SRC_URI[sha256sum] = "91e8bbda48a7fd5d374efacca542364ceb3a6c1f286f024b64ec40ccc799e125"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.17.1


--===============7408711620662626160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1342 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1342 targets, 33 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.1+snapshot-20200815"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:00465e8942fbb2953f54d610127eaa24855859a4"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 314 Found 306 Missed 8 Current 467 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1245 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_fetch)
NOTE: recipe ethtool-5.8-r0: task do_fetch: Started
NOTE: recipe ethtool-5.8-r0: task do_fetch: Succeeded
NOTE: Running task 1638 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_unpack)
NOTE: Running task 1639 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ethtool-5.8-r0: task do_unpack: Started
NOTE: recipe ethtool-5.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ethtool-5.8-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_patch)
NOTE: recipe ethtool-5.8-r0: task do_patch: Started
NOTE: recipe ethtool-5.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ethtool-5.8-r0: task do_patch: Succeeded
NOTE: Running task 2411 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2412 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_populate_lic)
NOTE: recipe ethtool-5.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ethtool-5.8-r0: task do_populate_lic: Started
NOTE: recipe ethtool-5.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2413 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_configure)
NOTE: recipe ethtool-5.8-r0: task do_populate_lic: Succeeded
NOTE: recipe ethtool-5.8-r0: task do_configure: Started
NOTE: recipe ethtool-5.8-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_configure_ptest_base)
NOTE: recipe ethtool-5.8-r0: task do_configure_ptest_base: Started
NOTE: recipe ethtool-5.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2415 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_compile)
NOTE: recipe ethtool-5.8-r0: task do_compile: Started
NOTE: recipe ethtool-5.8-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_compile_ptest_base)
NOTE: recipe ethtool-5.8-r0: task do_compile_ptest_base: Started
NOTE: recipe ethtool-5.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2417 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_install)
NOTE: recipe ethtool-5.8-r0: task do_install: Started
NOTE: recipe ethtool-5.8-r0: task do_install: Succeeded
NOTE: Running task 2418 of 2424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_install_ptest_base)
NOTE: recipe ethtool-5.8-r0: task do_install_ptest_base: Started
ERROR: ethtool-5.8-r0 do_install_ptest_base: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ethtool/5.8-r0/temp/run.do_install_ptest_base.30347' failed with exit code 1:
install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ethtool/5.8-r0/build/test-features': No such file or directory
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ethtool/5.8-r0/temp/log.do_install_ptest_base.30347
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ethtool/5.8-r0/build/test-features': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ethtool/5.8-r0/temp/run.do_install_ptest_base.30347' failed with exit code 1:
| install: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ethtool/5.8-r0/build/test-features': No such file or directory
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe ethtool-5.8-r0: task do_install_ptest_base: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_install_ptest_base) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2418 tasks of which 2406 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ethtool/ethtool_5.8.bb:do_install_ptest_base
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7408711620662626160==--
