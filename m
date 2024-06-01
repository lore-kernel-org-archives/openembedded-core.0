Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DE8C2BA12
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42205.1717263217645819647
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LL0r2EyD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KzoNTazo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018fd4dd3700-9db09a88-3063-4e42-89ae-6a54c962697b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=myQ6TrV0112Tj8CRCw4veebWSI8b9XS5k6M4jZn7sSk=;
	b=LL0r2EyD7pskudem5x7Twa5XXGv96GWuIfKlivbbFhgw/nmmPgL+w01G/xycCZfo
	TxS+QRsbxFTXI+1rQdu4phuO5BptY2UN6NabPmSYUUiPkRJbWhbuzkLGhy9eg3LvHtO
	EOpBiMpWNOpUkbsmYFc0t7AaCeqne8DD2KpSECG8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=myQ6TrV0112Tj8CRCw4veebWSI8b9XS5k6M4jZn7sSk=;
	b=KzoNTazofb4KLIcIFhLKcfgJAACXwmdMGl7OAZLkDQcOUXA91D9rYTlJ69sj3AAb
	uYczGoxm82jwDyUdxY5x6HYJLi+i6O7rl6b19VgPg56DkZ/wr94bPnJnXorWQwvvubY
	bGdKnhLOybqMjjzWdvfO+vmbC1mRonTtdLZZgEwE=
Content-Type: multipart/mixed; boundary="===============9201783537627669668=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20240524 SUCCEEDED
Message-ID: <0101018fd4dd3700-9db09a88-3063-4e42-89ae-6a54c962697b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200151

--===============9201783537627669668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20240524* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20240129-20240524.patch
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

-- >8 --
From 5df0bce83108bca96f6df66b6f63e53e1340b118 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 11:33:09 +0000
Subject: [PATCH] ltp: upgrade 20240129 -> 20240524

---
 ...001-Remove-OOM-tests-from-runtest-mm.patch |  9 ++--
 ...rio_groups-default-remove-connectors.patch | 34 ------------
 ...-Use-time_t-instead-of-long-for-type.patch | 54 -------------------
 .../ltp/{ltp_20240129.bb => ltp_20240524.bb}  |  4 +-
 4 files changed, 4 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
 rename meta/recipes-extended/ltp/{ltp_20240129.bb => ltp_20240524.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index cc98079651..5b6c780bec 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
+From 768159aa53257d247645a12518778f50b8fdf578 Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index d859b331c..3c2962f44 100644
+index 6a8cd0b9d..8ce3f4416 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -74,12 +74,6 @@ ksm07 ksm07
+@@ -76,12 +76,6 @@ ksm07 ksm07
  
  cpuset01 cpuset01
  
@@ -30,6 +30,3 @@ index d859b331c..3c2962f44 100644
  swapping01 swapping01 -i 5
  
  thp01 thp01 -I 120
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch b/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
deleted file mode 100644
index 4a50d1ae38..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-scenario_groups-default-remove-connectors.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 14c710cae38aa96bd8d681e891b6a1d691f99988 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Thu, 14 Mar 2024 09:47:10 +0800
-Subject: [PATCH] scenario_groups/default: remove connectors
-
-runtest/connectors was removed in 9b642d89c, thus update scenario_groups/default.
-
-Fixes: 9b642d89c ("runtest: Merge runtest/connectors to kernel_misc")
-Closes: https://github.com/linux-test-project/ltp/pull/1144
-
-Upstream-Status: Backport from
-[https://github.com/linux-test-project/ltp/commit/14c710ca]
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- scenario_groups/default | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scenario_groups/default b/scenario_groups/default
-index f17b2061a..ec77d8fb8 100644
---- a/scenario_groups/default
-+++ b/scenario_groups/default
-@@ -16,7 +16,6 @@ controllers
- filecaps
- cap_bounds
- fcntl-locktests
--connectors
- power_management_tests
- hugetlb
- commands
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch b/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
deleted file mode 100644
index ae8dc8706e..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sched_stress-Use-time_t-instead-of-long-for-type.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 74074f9a71c876d6e95c2d72702888dd2fabc761 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 May 2024 11:43:20 -0700
-Subject: [PATCH] sched_stress: Use time_t instead of long for type
-
-This ensures it works across different architectures
-Fixes
-
-| sched_driver.c:744:43: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
-|   744 |         printf("\nend time = %s\n", ctime(&end_time));
-|       |                                           ^~~~~~~~~
-
-With gcc-14
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/0a682f1af42d8d261202821be580fe26d17ee9b7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/sched/sched_stress/sched_driver.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
-index 61573d788..5b8c187fe 100644
---- a/testcases/kernel/sched/sched_stress/sched_driver.c
-+++ b/testcases/kernel/sched/sched_stress/sched_driver.c
-@@ -136,7 +136,7 @@ int debug = 0;
- /*
-  * Function prototypes
-  */
--void startup(long);
-+void startup(time_t);
- int start_testcase(char *, char *, char *, char *, char *, char *);
- int process_slots_in_use();
- int available_user_process_slots();
-@@ -251,7 +251,7 @@ int main(int argc, char **argv)
-  * information to the screen and .  It also initializes the	 *
-  * process id list and other global variables.	 			 *
-  *-----------------------------------------------------------------------*/
--void startup(long start_time)
-+void startup(time_t start_time)
- {
- 	char tempbuffer[50];	/* temporary buffer to hold names */
- 
-@@ -734,7 +734,7 @@ void kill_short_term_testcases()
- void finishup(start_time)
- long start_time;		/* starting time to calculate elapsed time */
- {
--	long end_time;		/* time when program finished */
-+	time_t end_time;		/* time when program finished */
- 
- 	/*
- 	 * Get the end time and calculate elapsed time; write all this out
--- 
-2.45.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240524.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20240129.bb
rename to meta/recipes-extended/ltp/ltp_20240524.bb
index f8e6d3987e..1aafed0bf5 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240524.bb
@@ -24,12 +24,10 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
+SRCREV = "8f21ebba42216dbb7e8d44c23b4a977d6823f7a1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://0001-scenario_groups-default-remove-connectors.patch \
-           file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============9201783537627669668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 103 recipes from the core2-64 sysroot...done.
Removing 117 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-4d6ae9cc4696aa43f075338aea3ea8d1d4d38254"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4d6ae9cc4696aa43f075338aea3ea8d1d4d38254"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 937 Local 859 Mirrors 0 Missed 78 Current 236 (91% match, 93% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 240 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 241 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 244 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 245 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 246 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/socat/socat_1.8.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 259 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 260 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 262 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 263 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 270 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe file-5.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 273 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_deb_setscene)
NOTE: recipe file-5.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_ipk_setscene)
NOTE: recipe socat-1.8.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_rpm_setscene)
NOTE: recipe expect-5.45.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 282 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe btrfs-tools-6.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 283 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.45-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 284 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 286 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 287 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_deb_setscene)
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 288 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 289 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 293 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_deb_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 294 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_ipk_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 296 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 297 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_deb_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 300 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_ipk_setscene)
NOTE: recipe cpio-2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 305 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_deb_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 306 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_ipk_setscene)
NOTE: recipe coreutils-9.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 313 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx_setscene)
NOTE: recipe gzip-1.13-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 315 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_create_spdx_setscene)
NOTE: Running setscene task 316 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 318 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.38.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 319 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 321 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 324 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 325 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 328 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 335 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx_setscene)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 337 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.38.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 347 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 350 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe gzip-1.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 354 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe cpio-2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cpio/cpio_2.15.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.38.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gzip/gzip_1.13.bb:do_packagedata_setscene)
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 358 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 359 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gdb-14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 360 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 363 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdb-14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gzip-1.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe expect-5.45.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/tcltk/tcl_8.6.14.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 373 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata_setscene)
NOTE: recipe iputils-20240117-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot_setscene)
NOTE: recipe gdb-14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tcl-8.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-6.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gzip-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_deb_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_ipk_setscene)
NOTE: recipe iputils-20240117-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 407 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_recipe_qa_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdb-14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 408 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe cpio-2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_create_spdx_setscene)
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe tcl-8.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_deb_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_ipk_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 420 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 424 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iputils-20240117-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 429 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe iputils-20240117-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 435 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 438 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 439 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iptables/iptables_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 443 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 453 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe logrotate-3.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 454 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 455 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 456 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 458 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_deb_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 459 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_ipk_setscene)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libaio-0.3.113-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 460 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 468 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 469 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 470 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_deb_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 476 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_ipk_setscene)
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tar-1.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 482 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-4.0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 483 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe tar-1.35-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 486 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe quota-4.09-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 493 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 499 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 506 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 507 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tar/tar_1.35.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 508 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 511 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 512 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_deb_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_ipk_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 520 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 521 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Started
NOTE: Running setscene task 526 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 532 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 536 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 537 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe which-2.21-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 540 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 541 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_deploy_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe which-2.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 542 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_package_write_deb_setscene)
NOTE: recipe which-2.21-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 543 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_package_write_ipk_setscene)
NOTE: recipe tcp-wrappers-7.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 545 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 550 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 554 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tar-1.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 563 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 581 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe which-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 593 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 600 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 604 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 610 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk_setscene)
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 631 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 632 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 639 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 642 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/gawk/gawk_5.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 651 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_package_setscene)
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_package_setscene)
NOTE: Running setscene task 670 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 681 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_package_write_deb_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 686 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 697 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 702 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 706 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 707 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 716 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 723 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.9.0.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 724 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 726 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 732 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 752 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 768 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 771 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 773 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 774 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 777 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 781 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 789 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 793 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 797 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 805 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 808 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 809 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 815 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 817 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libnl/libnl_3.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 826 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 837 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libnl-1_3.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 838 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 841 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 843 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 849 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 856 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 861 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 866 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 872 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 873 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 925 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 985 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1011 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1012 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1016 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1018 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1019 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1021 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1024 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1028 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1029 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1034 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 906 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 935 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_fetch)
NOTE: Running task 992 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1038 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1090 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Started
NOTE: Running task 1156 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1157 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1176 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_fetch)
NOTE: Running task 1192 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_recipe_qa)
NOTE: Running task 1199 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: Running task 1210 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_recipe_qa)
NOTE: Running task 1215 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 1217 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1219 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_fetch: Started
NOTE: recipe ltp-20240524-r0: task do_recipe_qa: Started
NOTE: recipe coreutils-9.5-r0: task do_package_setscene: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe gdb-14.2-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 1039 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1042 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe iproute2-6.9.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1043 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1044 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1045 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe gdb-14.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: Running setscene task 1047 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1407 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1408 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_unpack)
NOTE: recipe cronie-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_recipe_qa unihash changed to 8ef75862205e8baa21fa9f0c4ad3a925c92584d8196a69c9174121e76c99310a
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1041 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_recipe_qa_setscene)
NOTE: recipe ltp-20240524-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1411 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1061 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1062 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1063 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1421 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 1429 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1435 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_unpack)
NOTE: Running task 1436 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_fetch)
NOTE: Running task 1439 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_fetch)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe ltp-20240524-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1451 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_fetch)
NOTE: Running task 1457 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1459 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_fetch)
NOTE: Running task 1472 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_unpack)
NOTE: Running task 1484 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 1485 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_unpack)
NOTE: Running task 1487 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: Running task 1538 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_write_config)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1550 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1066 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe ltp-20240524-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Started
NOTE: Running task 1551 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_unpack)
NOTE: recipe iputils-20240117-r0: task do_fetch: Started
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe gdb-14.2-r0: task do_unpack: Started
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_fetch: Succeeded
NOTE: Running task 1552 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_unpack)
NOTE: Running task 1553 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe perl-5.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1071 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe iputils-20240117-r0: task do_write_config: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1559 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ltp-20240524-r0: task do_unpack: Started
NOTE: recipe iputils-20240117-r0: task do_write_config: Succeeded
NOTE: Running task 1560 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe iproute2-6.9.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_unpack: Started
NOTE: Running task 1561 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iputils-20240117-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1567 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_unpack)
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 1610 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.7.2-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_unpack: Succeeded
NOTE: Running task 1611 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_unpack)
NOTE: Running task 1612 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_patch)
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe iputils-20240117-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_unpack: Succeeded
NOTE: Running task 1650 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_patch)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_patch: Started
NOTE: recipe cronie-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1693 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe btrfs-tools-6.8.1-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1694 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux/linux-yocto_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1733 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_patch)
NOTE: recipe iputils-20240117-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_deploy_source_date_epoch unihash changed to 02a0a087163a0dd5ca004706bd78bd413d77a6d2adf864eebb99be67deeea72e
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_patch: Succeeded
NOTE: Running task 1735 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_patch)
NOTE: recipe linux-yocto-6.6.32+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_patch: Started
NOTE: recipe iputils-20240117-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1746 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_patch: Succeeded
NOTE: recipe iputils-20240117-r0: task do_patch: Succeeded
NOTE: recipe ltp-20240524-r0: task do_unpack: Succeeded
NOTE: Running task 1749 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_patch)
NOTE: recipe btrfs-tools-6.8.1-r0: task do_patch: Started
NOTE: recipe ltp-20240524-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1088 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1092 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1093 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1094 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1095 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1096 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1097 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1098 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ltp-20240524-r0: task do_patch: Succeeded
NOTE: Running task 1751 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_deploy_source_date_epoch)
NOTE: Running task 1752 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ltp-20240524-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20240524-r0: task do_populate_lic: Started
NOTE: recipe util-linux-2.39.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1099 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1111 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1112 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1113 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ltp-20240524-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_populate_lic unihash changed to ff4b8f90dcde85ab0de132cdab5438b26c9279d5eaaff878eb6ee562c987e779
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ltp-20240524-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1116 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdb-14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1778 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1118 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdb-14.2-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1789 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1123 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1124 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1125 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1127 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdb-14.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1129 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1134 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Running task 1796 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1136 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1139 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1141 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1142 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1144 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1148 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1150 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1152 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1163 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1168 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1171 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1173 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2181 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2266 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2270 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2518 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2617 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2631 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2643 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2791 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2792 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ltp-20240524-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2793 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_configure)
NOTE: Running task 2794 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_collect_spdx_deps)
NOTE: recipe iputils-20240117-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2821 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_collect_spdx_deps)
NOTE: Running task 2822 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure)
NOTE: Running task 2827 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2838 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.5-r0: task do_configure: Started
NOTE: recipe ltp-20240524-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 2839 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2853 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2854 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_configure)
NOTE: recipe ltp-20240524-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Started
NOTE: Running task 2855 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2863 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20240524-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2874 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_collect_spdx_deps)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2900 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_configure)
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_configure: Started
NOTE: recipe ltp-20240524-r0: task do_configure: Started
NOTE: recipe cronie-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iputils-20240117-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2938 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iputils-20240117-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_configure: Started
NOTE: recipe iputils-20240117-r0: task do_configure: Started
NOTE: recipe iputils-20240117-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2939 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_compile)
NOTE: recipe cronie-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2940 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_configure)
NOTE: recipe iproute2-6.9.0-r0: task do_compile: Started
NOTE: recipe cronie-1.7.2-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2941 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_configure: Started
NOTE: recipe iputils-20240117-r0: task do_configure: Succeeded
NOTE: Running task 2942 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_compile)
NOTE: recipe iputils-20240117-r0: task do_compile: Started
NOTE: recipe iputils-20240117-r0: task do_compile: Succeeded
NOTE: Running task 2943 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_install)
NOTE: recipe iputils-20240117-r0: task do_install: Started
NOTE: recipe iputils-20240117-r0: task do_install: Succeeded
NOTE: Running task 2944 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package)
NOTE: recipe iputils-20240117-r0: task do_package: Started
NOTE: recipe cronie-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2945 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_compile)
NOTE: recipe cronie-1.7.2-r0: task do_compile: Started
NOTE: recipe iputils-20240117-r0: task do_package: Succeeded
NOTE: Running task 2946 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_packagedata)
NOTE: recipe iputils-20240117-r0: task do_packagedata: Started
NOTE: recipe cronie-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2947 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_install)
NOTE: recipe cronie-1.7.2-r0: task do_install: Started
NOTE: recipe iputils-20240117-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_packagedata unihash changed to 5d4ed6cd1eecb109c88a3003e9ecd00c6bd836e5a6470cff1e91c9a0e4d77883
NOTE: Setscene tasks completed
NOTE: Running task 2948 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_create_spdx)
NOTE: Running task 2949 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package_write_ipk)
NOTE: Running task 2950 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package_write_deb)
NOTE: Running task 2951 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package_write_rpm)
NOTE: recipe cronie-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 2952 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package)
NOTE: recipe iputils-20240117-r0: task do_package_write_ipk: Started
NOTE: recipe iputils-20240117-r0: task do_package_write_deb: Started
NOTE: recipe iputils-20240117-r0: task do_create_spdx: Started
NOTE: recipe iputils-20240117-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.7.2-r0: task do_package: Started
NOTE: recipe iputils-20240117-r0: task do_create_spdx: Succeeded
NOTE: recipe iputils-20240117-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package_write_ipk unihash changed to 83bc0e76086c36e1301689cb89d1f1e5d056377fceaf20f2622592135a8c1f74
NOTE: recipe iputils-20240117-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package_write_deb unihash changed to b924c7f8231d440319f5ec23a0c94a2b80174251ef63f3663b2b0f52f317ea2f
NOTE: recipe iputils-20240117-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/iputils/iputils_20240117.bb:do_package_write_rpm unihash changed to 1918a7fcddc5da1a94b0461ae38f5102e1ff1f83b1a18eacb5d315ce901876f7
NOTE: recipe cronie-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 2953 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_packagedata)
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Started
NOTE: recipe cronie-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2954 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_create_spdx)
NOTE: Running task 2955 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_ipk)
NOTE: Running task 2956 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_deb)
NOTE: Running task 2957 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cronie/cronie_1.7.2.bb:do_package_write_rpm)
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe cronie-1.7.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Started
NOTE: recipe cronie-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2959 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Started
NOTE: recipe iproute2-6.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_install)
NOTE: recipe iproute2-6.9.0-r0: task do_install: Started
NOTE: recipe iproute2-6.9.0-r0: task do_install: Succeeded
NOTE: Running task 2961 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package)
NOTE: recipe iproute2-6.9.0-r0: task do_package: Started
NOTE: recipe ltp-20240524-r0: task do_configure: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_package: Succeeded
NOTE: Running task 2962 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ltp/ltp_20240524.bb:do_compile)
NOTE: Running task 2963 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_packagedata)
NOTE: recipe ltp-20240524-r0: task do_compile: Started
NOTE: recipe iproute2-6.9.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.9.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_packagedata unihash changed to ffd8a6928d3f347bc5491ce0179c81068b878db68278087bc491ac4f16bc76f4
NOTE: Setscene tasks completed
NOTE: Running task 2964 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_create_spdx)
NOTE: Running task 2965 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package_write_ipk)
NOTE: Running task 2966 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package_write_deb)
NOTE: Running task 2967 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.9.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.9.0-r0: task do_package_write_deb: Started
NOTE: recipe iproute2-6.9.0-r0: task do_package_write_ipk: Started
NOTE: recipe iproute2-6.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_configure: Succeeded
NOTE: Running task 2968 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_compile: Started
NOTE: recipe iproute2-6.9.0-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.9.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package_write_ipk unihash changed to 76ac0ff92ea186cff34684b88ee25f5c370ab84f6465735e71655d483931e277
NOTE: recipe iproute2-6.9.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package_write_deb unihash changed to 8de5e355977f00a633c99e926c29fbadb3d38990a3864b1c0f67453d80fb8a77
NOTE: recipe iproute2-6.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/iproute2/iproute2_6.9.0.bb:do_package_write_rpm unihash changed to b8f54ace47d609778a9b59cdde7724f753db6a95f5bf43da63fa5d0bc750c080
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2970 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2972 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile)
NOTE: recipe dbus-1.14.10-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install: Succeeded
NOTE: Running task 2973 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2974 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package)
NOTE: Running task 2975 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2976 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2977 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_configure)
NOTE: recipe btrfs-tools-6.8.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2979 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install)
NOTE: recipe dbus-1.14.10-r0: task do_install: Started
NOTE: recipe dbus-1.14.10-r0: task do_install: Succeeded
NOTE: Running task 2980 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2981 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package)
NOTE: Running task 2982 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_compile)
NOTE: recipe btrfs-tools-6.8.1-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2984 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_compile: Succeeded
NOTE: Running task 2985 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_install: Succeeded
NOTE: Running task 2987 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_package)
NOTE: Running task 2988 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_populate_sysroot)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_package: Started
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2989 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata)
NOTE: recipe gdb-14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2991 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Started
NOTE: recipe gdb-14.2-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_package: Succeeded
NOTE: Running task 2992 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata unihash changed to f49ab16e41745d6379a231625338557181ee82bd73387e66b5881559d3ddf01f
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_package: Succeeded
NOTE: Running task 2993 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_packagedata)
NOTE: Running task 2994 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Started
NOTE: recipe btrfs-tools-6.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb:do_install)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_packagedata unihash changed to 026747e4641da9bce03ca5899344283234c04f82ccbbcbe5bb1cd29faa1c97f0
NOTE: recipe btrfs-tools-6.8.1-r0: task do_install: Started
NOTE: Running task 2996 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/lttng/lttng-ust_2.13.8.bb:do_create_spdx)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2997 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe gdb-14.2-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_compile)
NOTE: recipe lttng-ust-2_2.13.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2999 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_14.2.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe gdb-14.2-r0: task do_compile: Started
NOTE: recipe gdb-14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gdb-14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 3000 of 3075 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: recipe btrfs-tools-6.8.1-r0: task do_install: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata: Failed
NOTE: recipe coreutils-9.5-r0: task do_configure: Succeeded
NOTE: recipe gdb-14.2-r0: task do_compile: Succeeded
NOTE: recipe ltp-20240524-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3000 tasks of which 2862 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240601112910.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240601112910.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata
Summary: There were 41 ERROR messages, returning a non-zero exit code.
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-src went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-dbg went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package libcomerr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package libss went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package libe2p went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package libext2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-badblocks went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-dumpe2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-e2fsck went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-e2scrub went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-mke2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-resize2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-tune2fs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-ptest went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-staticdev went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-dev went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-doc went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-ca went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-cs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-da went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-de went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-eo went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-es went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-fi went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-fr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-fur went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-hu went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-id went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-it went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-ms went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-nl went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-pl went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-pt went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-sr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-sv went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-tr went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-uk went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-vi went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs-locale-zh-cn went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: QA Issue: Package version for package e2fsprogs went backwards which would break package feeds (from 0:1.47.1-r0 to 0:1.47.0-r0) [version-going-backwards]
ERROR: e2fsprogs-1.47.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/e2fsprogs/1.47.0/temp/log.do_packagedata.4044320
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata) failed with exit code '1'

--===============9201783537627669668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ltp: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp: SRC_URI changed from "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch file://0001-scenario_groups-default-remove-connectors.patch file://0001-sched_stress-Use-time_t-instead-of-long-for-type.patch" to "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https file://0001-Remove-OOM-tests-from-runtest-mm.patch"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp-dbg: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 1041647544 to 1069741640 (+3%)
packages/core2-64-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/msgstress03 /opt/ltp/testcases/bin/.debug/waitpid05 /opt/ltp/testcases/bin/.debug/waitpid02 /opt/ltp/testcases/bin/.debug/msgstress02 /opt/ltp/testcases/bin/.debug/msgstress04 /opt/ltp/testcases/bin/.debug/fcntl28_64 /opt/ltp/testcases/bin/.debug/fcntl28", added "/opt/ltp/testcases/bin/.debug/splice08 /opt/ltp/testcases/bin/.debug/splice09 /opt/ltp/testcases/bin/.debug/kallsyms /opt/ltp/testcases/bin/.debug/kvm_svm04 /opt/ltp/testcases/bin/.debug/utime07 /opt/ltp/testcases/bin/.debug/getrandom05 /opt/ltp/testcases/bin/.debug/unlink09 /opt/ltp/testcases/bin/.debug/arch_prctl01 /opt/ltp/testcases/bin/.debug/aslr01 /opt/ltp/testcases/bin/.debug/shmat04 /opt/ltp/testcases/bin/.debug/mlock05 /opt/ltp/testcases/bin/.debug/gethostname02"
packages/core2-64-poky-linux/ltp/ltp-dev: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp-dev: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp-dev: PKGSIZE changed from 280396 to 312465 (+11%)
packages/core2-64-poky-linux/ltp/ltp-dev: FILELIST: removed "/opt/ltp/include/tst_fips.h /opt/ltp/include/tst_lockdown.h", added "/opt/ltp/include/tst_security.h /opt/ltp/include/tst_safe_macros_inline.h /opt/ltp/include/tst_parse.h"
packages/core2-64-poky-linux/ltp/ltp-doc: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp-doc: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp-doc: PKGSIZE changed from 62798 to 0 (-100%)
packages/core2-64-poky-linux/ltp/ltp-doc: FILELIST: removed all items "/opt/ltp/share/man/man1/iogen.1 /opt/ltp/share/man/man1/doio.1 /opt/ltp/share/man/man3/random_range.3 /opt/ltp/share/man/man1/ltp-pan.1 /opt/ltp/share/man/man3/tst_res.3 /opt/ltp/share/man/man3/tst_sig.3 /opt/ltp/share/man/man3/tst_tmpdir.3 /opt/ltp/share/man/man1/ltp-bump.1 /opt/ltp/share/man/man3/usctest.3 /opt/ltp/share/man/man3/parse_ranges.3 /opt/ltp/share/man/man3/random_range_seed.3 /opt/ltp/share/man/man3/parse_opts.3"
packages/core2-64-poky-linux/ltp/ltp-locale: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp-locale: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp-src: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp-src: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp-src: PKGSIZE changed from 12908020 to 12866720 (-0%)
packages/core2-64-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigsuspend, direct
 ory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fsconfig -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsconfig, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_t
 estsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20240524/testcases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/logging/kmsg -> /usr/src/d
 ebug/ltp/20240524/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20240524/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/process_madvise -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/process_madvise, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /u
 sr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20240129/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/20240524/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/io_pgete
 vents -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20240129/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20240524/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20240129/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20240524/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/timens -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20
 240129/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/madvise -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/madvise, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/2
 0240129/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mlock2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20240129/testcase
 s/kernel/sched/autogroup -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20240524/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/co
 nformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20240524/testcases/realtime/stress/pi-tests, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mount -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mount, directory renamed /usr/src/debug/ltp
 /20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/irq -> /usr/src/debug/ltp/20240524/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20240129/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20240524/te
 stcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug
 /ltp/20240129/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/faccessat2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/faccessat2, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pselect -> 
 /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_wait,
  directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/d
 ebug/ltp/20240129/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/2
 0240129/testcases/network/can/cve -> /usr/src/debug/ltp/20240524/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sendto -> /usr/src/
 debug/ltp/20240524/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20240524/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/exec
 veat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20240524/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformanc
 e/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/fptests -> /usr/src/debug/ltp/20240524/testcases/misc/math/fptests, dir
 ectory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/confo
 rmance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20240524/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/brk, direct
 ory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/page -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20240129/testcases
 /kernel/syscalls/tee -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20240129/testcases/network/iptables -> /usr/src/debug/ltp/20240524/testcases/network/iptables, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20240524/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/con
 formance/interfaces/mq_receive -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20240524/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/abs -> /usr/src/debug/ltp/20240524/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fdatasync, direc
 tory renamed /usr/src/debug/ltp/20240129/testcases/commands/nm/datafiles -> /usr/src/debug/ltp/20240524/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_
 condattr_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20240524/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/i
 nterfaces/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20240524/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/gethostid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/crash -> /usr/src/debug/ltp/20240524/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/bind -> /usr/src/debug/lt
 p/20240524/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20240524/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20240524/testcases/kernel/tracing/pt_test, directory re
 named /usr/src/debug/ltp/20240129/libs/libltpvdso -> /usr/src/debug/ltp/20240524/libs/libltpvdso, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/time -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/utsname -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/utsname, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/io/direct_io -> /usr/src/debug/ltp/20240524/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsu
 ite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20240524/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getaffinit
 y, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/functional/semaphores -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/c
 onformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/time, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_
 destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/perf/latency -> /usr/src/debug/ltp/20240524/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20240524/testcases/realtime/func/p
 i_perf, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/uevents -> /usr/src/debug/ltp/20240524/
 testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20240524/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20
 240129/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20240524/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mallinfo2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/in
 terfaces/sched_setparam -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20240524/testcases/
 kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/semop -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/semop, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20240524/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mlockall -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mkdirat -> /usr/src
 /debug/ltp/20240524/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20240524/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/timer_d
 elete -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/sysctl -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/sysctl, directory renamed /usr/src/debug/ltp/20240129/te
 stcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20240524/testcases/kerne
 l/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/llseek, directory ren
 amed /usr/src/debug/ltp/20240129/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite
 /conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendmsg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/flock, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/tools, directo
 ry renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20240524/testcase
 s/open_posix_testsuite/conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/block/block_dev_user, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20240524/testcases/kernel/syscall
 s/utimes, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/io_setup -> /usr/src/debug/
 ltp/20240524/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/ksm -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/recv -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_submit, directory rena
 med /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/io_destroy -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setregid
 , directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/futex, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigignore -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/openat, directory renamed /usr/src/de
 bug/ltp/20240129/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20240524/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/eventfd2 -> /usr/src/debug/ltp/20240524/testcases/ker
 nel/syscalls/eventfd2, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/mmapstress -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20240129/testca
 ses/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20240129/libs/libltpuinput -> /usr/src/debug/ltp/20240524/libs/libltpuinput, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/doio -> /usr/
 src/debug/ltp/20240524/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/2
 0240129/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/input -> /usr/src/debug/ltp/20240524/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20240524/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/pty -> /usr/src/debug/ltp/20240524/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/2
 0240524/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/time, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20240129
 /testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20240524/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_clos
 e, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20240524/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20240129/testca
 ses/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getxattr, directory renamed /usr/src/debug/ltp/20240129/t
 estcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix
 _testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/numa -> /usr/src/debug/ltp/20240524/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20240129/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20240524/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/2024
 0129/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpriority, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/lib -> /usr/src/debug/l
 tp/20240524/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/hugemmap -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugemmap, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp
 /20240524/testcases/kernel/mem/hugetlb/hugefork, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ulimit, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20240129/tools/genload -> /usr/src/debug/ltp/20240524/tools/genload, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20240129/tools/apicmds -> /usr/src/debug/ltp/20240524/tools/apicmds, dire
 ctory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/sched_stress, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20240129/testcases/network/sockets -> /usr/src/debug/ltp/20240524/testcases/network/sockets, d
 irectory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory 
 renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/regression, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pe
 rsonality, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, directory renamed /usr/src/debug/ltp/20240129/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20240524/testcases/networ
 k/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mprotect -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mprotect, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/lib -> /usr/src/debug/ltp/20240524/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/in
 terfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20240129/testca
 ses/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20240129/pan -> /usr/src/debug/ltp/20240524/pan, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20240524/testcases/kerne
 l/syscalls/wait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20240524/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/20240524/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20240129/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20240524/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/specu
 lative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmdt, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/
 mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20240129/utils/sctp/func_tests -> /usr/src/debug/ltp/20240524/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/doio/include -> 
 /usr/src/debug/ltp/20240524/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20240129/tes
 tcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20240129/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20240524/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/abort, d
 irectory renamed /usr/src/debug/ltp/20240129/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20240524/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/crypto -> /usr/src/debug/ltp/20240524/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20240129/testcases/commands/eject -> /usr/src
 /debug/ltp/20240524/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setsockopt -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20240129/testcases/k
 ernel/syscalls/pipe -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/alarm, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/2
 0240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/umip -> /usr/src/debug/ltp/20240524/testcases/kernel/security/umip, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/
 src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/float/power -> /usr/src/debug/ltp/20240524/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/cap_bound -> /usr/src/debug/ltp/20240524/testcases/kernel/security/cap_bound, directory renamed /usr/src/
 debug/ltp/20240129/testcases/kernel/power_management -> /usr/src/debug/ltp/20240524/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20240129/testcases/network/sctp -> /usr/src/debug/ltp/20240524/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/lib -> /usr/src/debug/ltp/20240524/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/pids -> /usr/src/debug/ltp
 /20240524/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/network/lib6 -> /usr/src/debug/ltp/20240524/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_sysca
 ll_test -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20240524/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/specul
 ative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sysinfo -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20240524/test
 cases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20240129/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20240524/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/202405
 24/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/semget -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/semget, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20240524/testcases/realtime/func/measurement, directory r
 enamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/f00f -> /usr/src/debug/ltp/20240524/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20240
 129/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20240129/utils/sctp/lib -> /usr/src/debug/ltp/20240524/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20240524/
 testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/prio-wake -> /usr/src/debug/ltp/20240524/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/20
 240129/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20240129/libs/libltpsigwait -> /usr/src/debug/ltp/20240524/libs/libltpsigwait, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20240524/testcases/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/smack -> /usr/src/debug/ltp/20240524/testcases/kernel/security/smack, di
 rectory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20240129/testcases/lib -> /usr/src/debug/ltp/20240524/testcases/lib, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/kvm -> /usr/src/debug/ltp/20240524/testcases/kernel/kvm, directo
 ry renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20240129/testcases/cve -> /usr/src/debug/ltp/20240524/testcases/cve, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/munmap, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src
 /debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-driv
 ers/tbio/tbio_user -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20240524/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/libcontrollers, directory renamed /
 usr/src/debug/ltp/20240129/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/inode, directory renamed /usr/src/debug/ltp/20240129/libs/libltpnewipc -> /usr/src/debug/ltp/20240524/libs/libltpnewipc, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls
 /mknodat, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuit
 e/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20240524/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gettimeofday, directory renamed 
 /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/settimeofday, directory renamed /usr/src/debug/ltp/20240129/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20240524/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fanotify, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20240129/testcases/network/packet -> /usr/src/debug/ltp/20240524/testcases/network/packet, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/vhangup -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conf
 ormance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20240524/testcases/kernel/security/prot_hsymlinks, directory renamed
  /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20240129/utils/sctp
 /testlib -> /usr/src/debug/ltp/20240524/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/float -> /usr/src/debug/ltp/20240524/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/nptl, directory renamed /usr/src/de
 bug/ltp/20240129/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rmdir, directory renamed /u
 sr/src/debug/ltp/20240129/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mmap -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mmap, directory renamed /usr/src/debug/ltp/20240129/utils/sctp/include/netinet -> /usr/src/debug/ltp/20240524/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/
 conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/include -> /usr/src/debug/ltp/20240524/testcases/kernel/include, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20240129/testcases/
 kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/io/aio -> /usr/src/debug/ltp/20240524/testcases/kernel/io/aio, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls
 /sched_setparam, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_te
 stsuite/conformance/interfaces/mq_open -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/uaccess -> /usr/
 src/debug/ltp/20240524/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20240524/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20240524/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20240524/testcases/open_p
 osix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20240524/testcases/
 open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20240524/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/include -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/include, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sigaltstack 
 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/statx, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_bar
 rier_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sysca
 lls/fsmount -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fsmount, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/syslog -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuit
 e/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/2024
 0524/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20240129/testcases/misc/math/atof -> /usr/src/debug/ltp/20240524/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/finit_module, directory renamed /usr/src/debug/ltp/20240129/libs/libltpswap -> /usr/src/debug/ltp/20240524/libs/libltpswap, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/aio_h, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/sr
 c/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/s
 yscalls/futimesat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/fil
 ecaps -> /usr/src/debug/ltp/20240524/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20240129/testcases/network/netstress -> /usr/src/debug/ltp/20240524/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20240524/testcases/kernel/sysc
 alls/set_thread_area, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgget -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20240129/include/old -> /usr/src/debug/ltp/20240524/include/old, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20240524/testcases/realtime/func/sched_latency, directory renamed /usr/src/deb
 ug/ltp/20240129/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/clock_getres, directory renamed /
 usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/sound -> /usr/src/debug/ltp/20240524/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20240524/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20240129/testcases/ker
 nel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20240524/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/hugetlb/hugeshmget 
 -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20240129/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20240524/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20240524/testcases/kernel/mem/oom, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20240129/include/lapi -> /usr/src/debug/ltp/20240524/include/lapi, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/sr
 c/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20240524/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cgroup -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cgroup, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/con
 formance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20240524/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /u
 sr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20240524/testcases/kernel/s
 yscalls/getuid, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/execve -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execve, directory renamed /u
 sr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20240524/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/include -> /usr/src/debug/ltp/20240524/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20240129
 /testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20240129/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20240524/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mq_notify -> /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mq_notify, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/mq
 _timedreceive -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20240524/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp
 /20240524/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20240129/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20240524/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, removed "/usr/src/debug/ltp/20240129/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/gethostname/gethostname01.c /usr/src/debug/ltp/20240129/lib/tst_fs_link_count.c /usr/src/debug/ltp/20240129/lib/tst_status.c /usr/src/debug/ltp/20240129/lib/tst_bool_expr.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20240129/lib/tst_kvercmp.c /usr/src/debug/ltp/20240129/include/libsigwait.h /usr/src/debug/ltp/20240129/lib/tst_fill_fs.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20240129/include/tst_lockdown.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice04.c /usr/src/debug/ltp/202401
 29/include/tst_coredump.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice02.c /usr/src/debug/ltp/20240129/lib/parse_opts.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getrandom/getrandom02.c /usr/src/debug/ltp/20240129/lib/tst_sig.c /usr/src/debug/ltp/20240129/lib/tst_uid.c /usr/src/debug/ltp/20240129/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20240129/lib/tst_cmd.c /usr/src/debug/ltp/20240129/lib/tst_cpu.c /usr/src/debug/ltp/20240129/lib/tst_kernel.c /usr/src/debug/ltp/20240129/lib/tst_net.c /usr/src/debug/ltp/20240129/lib/tst_pid.c /usr/src/debug/ltp/20240129/lib/tst_res.c /usr/src/debug/ltp/20240129/lib/tst_rtctime.c /usr/src/debug/ltp/20240129/include/tst_uid.h /usr/src/debug/ltp/20240129/lib/tst_epoll.c /usr/src/debug/ltp/20240129/lib/tst_ioctl.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20240129/lib/tst_fill_file.c /usr/src/debug/ltp/20240129/include/tst_module.h /usr/src/debug/ltp/20240129/testc
 ases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20240129/include/tst_buffers.h /usr/src/debug/ltp/20240129/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20240129/lib/tst_crypto.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/unlink/unlink05.c /usr/src/debug/ltp/20240129/lib/safe_file_ops.c /usr/src/debug/ltp/20240129/include/tst_test.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid01.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid02.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice07.c /usr/src/debug/ltp/20240129/include/tst_pid.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid03.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid04.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid05.c /usr/src/
 debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid06.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid07.c /usr/src/debug/ltp/20240129/lib/tst_clone.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20240129/include/tst_checkpoint.h /usr/src/debug/ltp/20240129/libs/libltpipc/libmsgctl.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice01.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20240129/lib/tst_tmpdir.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20240129/include/tst_clocks.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20240129/include/tst_hugepage.h /usr/src/debug/ltp/20240129/lib/tst_netdevice.c /usr/src/debug/ltp/20240129/include/tst_capability.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20240129/include/ts
 t_safe_pthread.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20240129/include/tst_assert.h /usr/src/debug/ltp/20240129/lib/tst_wallclock.c /usr/src/debug/ltp/20240129/include/tst_cpu.h /usr/src/debug/ltp/20240129/include/tst_memutils.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/unlink/unlink08.c /usr/src/debug/ltp/20240129/libs/libltpipc/libipc.c /usr/src/debug/ltp/20240129/include/time64_variants.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice05.c /usr/src/debug/ltp/20240129/include/tst_af_alg.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice03.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid08.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid
 /waitpid09.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid10.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid11.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid12.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/waitpid/waitpid13.c /usr/src/debug/ltp/20240129/lib/tst_memutils.c /usr/src/debug/ltp/20240129/lib/tst_clocks.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20240129/include/tst_device.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mlock/mlock04.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20240129/include/tst_kconfig.h /usr/src/debug/ltp/20240129/include/tst_arch.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20240129/include/ipcmsg.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice.h /usr/src/debug/ltp/20240129/include/tst_rand_data.h /us
 r/src/debug/ltp/20240129/lib/tst_lockdown.c /usr/src/debug/ltp/20240129/lib/safe_macros.c /usr/src/debug/ltp/20240129/lib/tst_checksum.c /usr/src/debug/ltp/20240129/include/tst_fips.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20240129/include/parse_vdso.h /usr/src/debug/ltp/20240129/include/tst_wallclock.h /usr/src/debug/ltp/20240129/lib/tst_assert.c /usr/src/debug/ltp/20240129/lib/safe_net.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/unlink/unlink07.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20240129/include/tst_get_bad_addr.h /usr/src/debug/ltp/20240129/include/libswap.h /usr/src/debug/ltp/20240129/include/tst_net.h /usr/src/debug/ltp/20240129/include/tst_bool_expr.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utime/utime06.c /usr/src/debug/ltp/20240129/lib/tst_fs_has_free.c /usr/src/debug/ltp/2024
 0129/include/tst_mkfs.h /usr/src/debug/ltp/20240129/lib/tst_capability.c /usr/src/debug/ltp/20240129/include/tst_safe_timerfd.h /usr/src/debug/ltp/20240129/include/libnewipc.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20240129/lib/tst_checkpoint.c /usr/src/debug/ltp/20240129/include/tst_cmd.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20240129/include/tst_netlink.h /usr/src/debug/ltp/20240129/lib/tst_fd.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utime/utime05.c /usr/src/debug/ltp/20240129/include/tst_atomic.h /usr/src/debug/ltp/20240129/include/tst_checksum.h /usr/src/debug/ltp/20240129/include/tst_sched.h /usr/src/debug/ltp/20240129/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20240129/lib/get_path.c /usr/src/debug/ltp/20240129/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20240129/include/tst_cgroup.h /u
 sr/src/debug/ltp/20240129/include/ipcsem.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mlock/mlock03.c /usr/src/debug/ltp/20240129/lib/tst_hugepage.c /usr/src/debug/ltp/20240129/lib/tst_timer.c /usr/src/debug/ltp/20240129/lib/cloner.c /usr/src/debug/ltp/20240129/lib/random_range.c /usr/src/debug/ltp/20240129/lib/tst_parse_opts.c /usr/src/debug/ltp/20240129/include/safe_file_ops_fn.h /usr/src/debug/ltp/20240129/include/tst_clone.h /usr/src/debug/ltp/20240129/lib/tst_kconfig.c /usr/src/debug/ltp/20240129/include/libmsgctl.h /usr/src/debug/ltp/20240129/lib/tst_taint.c /usr/src/debug/ltp/20240129/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20240129/include/tst_private.h /usr/src/debug/ltp/20240129/lib/tst_rand_data.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/debug/ltp/20240129/include/tst_taint.h /usr/src/debug/ltp/20240129/lib/tst_arch.c /usr/src/debug/ltp/20240129/lib/tst_fips.c /usr/src/debug/ltp/20240129/include/tst_fd.h /usr/src/debug/l
 tp/20240129/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20240129/lib/tst_mkfs.c /usr/src/debug/ltp/20240129/lib/tst_test.c /usr/src/debug/ltp/20240129/include/safe_net_fn.h /usr/src/debug/ltp/20240129/lib/tst_virt.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20240129/include/tst_uinput.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20240129/include/tst_process_state.h /usr/src/debug/ltp/20240129/lib/tst_fs_setup.c /usr/src/debug/ltp/20240129/include/tst_crypto.h /usr/src/debug/ltp/20240129/include/tst_safe_macros.h /usr/src/debug/ltp/20240129/lib/tst_buffers.c /usr/src/debug/ltp/20240129/lib/tst_sig_proc.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utime/utime03.c /usr/src/debug/ltp/20240129/include/tst_kernel.h /usr/src/debug/ltp/20240129/lib/errnos.h /usr/src/debug/ltp/20240129/include/tst_test_macros.h /usr/src/debug/ltp/20240129/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20240129/te
 stcases/kernel/syscalls/waitpid/waitpid_common.h /usr/src/debug/ltp/20240129/lib/tst_sys_conf.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utime/utime01.c /usr/src/debug/ltp/20240129/lib/tst_coredump.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c /usr/src/debug/ltp/20240129/lib/safe_stdio.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20240129/include/tst_netdevice.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20240129/lib/tst_device.c /usr/src/debug/ltp/20240129/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20240129/include/tst_epoll.h 
 /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utime/utime04.c /usr/src/debug/ltp/20240129/include/tst_safe_clocks.h /usr/src/debug/ltp/20240129/lib/tst_netlink.c /usr/src/debug/ltp/20240129/include/tst_ansi_color.h /usr/src/debug/ltp/20240129/lib/safe_pthread.c /usr/src/debug/ltp/20240129/include/tst_safe_io_uring.h /usr/src/debug/ltp/20240129/lib/tst_fs_type.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getrandom/getrandom03.c /usr/src/debug/ltp/20240129/lib/tst_resource.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/mlock/mlock02.c /usr/src/debug/ltp/20240129/lib/tst_af_alg.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20240129/include/tst_fs.h /usr/src/debug/ltp/20240129/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20240129/include/safe_stdio_fn.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getrandom/getrandom01.c /usr/src/debug/lt
 p/20240129/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20240129/lib/tst_module.c /usr/src/debug/ltp/20240129/include/tst_kvercmp.h /usr/src/debug/ltp/20240129/include/tst_safe_file_at.h /usr/src/debug/ltp/20240129/lib/tst_process_state.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20240129/lib/tst_safe_macros.c /usr/src/debug/ltp/20240129/include/tst_rtctime.h /usr/src/debug/ltp/20240129/include/tst_safe_prw.h /usr/src/debug/ltp/20240129/include/tst_sig_proc.h /usr/src/debug/ltp/20240129/include/tst_sys_conf.h /usr/src/debug/ltp/20240129/include/tst_timer.h /usr/src/debug/ltp/20240129/lib/tst_ansi_color.c /usr/src/debug/ltp/20240129/include/safe_macros_fn.h /usr/src/debug/ltp/20240129/lib/tst_test_macros.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/getrandom/getrandom04.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/splice/splice06.c /usr/src/debug/lt
 p/20240129/testcases/kernel/syscalls/mlock/mlock01.c /usr/src/debug/ltp/20240129/lib/tlibio.c /usr/src/debug/ltp/20240129/lib/tst_safe_file_at.c /usr/src/debug/ltp/20240129/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20240129/lib/signame.h /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/shmat/shmat01.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/shmat/shmat02.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/ipc/shmat/shmat03.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/utime/utime02.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20240129/include/tst_timer_test.h /usr/src/debug/ltp/20240129/lib/tst_timer_test.c /usr/src/debug/ltp/20240129/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20240129/lib/tst_cgroup.c", added "/usr/src/debug/ltp/20240524/tes
 tcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20240524/lib/get_path.c /usr/src/debug/ltp/20240524/include/tst_rtctime.h /usr/src/debug/ltp/20240524/include/libnewipc.h /usr/src/debug/ltp/20240524/lib/safe_macros.c /usr/src/debug/ltp/20240524/lib/tst_ansi_color.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink05.c /usr/src/debug/ltp/20240524/lib/tst_safe_timerfd.c /usr/src/debug/ltp/20240524/lib/tst_safe_file_at.c /usr/src/debug/ltp/20240524/include/tst_safe_io_uring.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20240524/lib/tst_netdevice.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid_common.h /usr/src/debug/ltp/20240524/include/tst_taint.h /usr/src/debug/ltp/20240524/lib/tst_cgroup.c /usr/src/debug/ltp/20240524/include/tst_memutils.h /usr/src/debug/ltp/20240524/lib/tst_sig_proc.c /usr/src/debug/ltp/20240524/lib/tst_kconfig.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcnt
 l/fcntl24.c /usr/src/debug/ltp/20240524/include/tst_kernel.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime03.c /usr/src/debug/ltp/20240524/lib/tst_safe_macros.c /usr/src/debug/ltp/20240524/lib/tst_test_macros.c /usr/src/debug/ltp/20240524/include/tst_cgroup.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20240524/include/tst_safe_prw.h /usr/src/debug/ltp/20240524/include/tst_security.h /usr/src/debug/ltp/20240524/include/tst_sig_proc.h /usr/src/debug/ltp/20240524/include/tst_sys_conf.h /usr/src/debug/ltp/20240524/lib/tst_cmd.c /usr/src/debug/ltp/20240524/lib/tst_cpu.c /usr/src/debug/ltp/20240524/lib/tst_net.c /usr/src/debug/ltp/20240524/lib/tst_pid.c /usr/src/debug/ltp/20240524/lib/tst_res.c /usr/src/debug/ltp/20240524/lib/tst_memutils.c /usr/src/debug/ltp/20240524/lib/tst_sig.c /usr/src/debug/ltp/20240524/lib/tst_timer_test.c /usr/src/debug/ltp/20240524/include/ipcsem.h /usr/src/debug/ltp/20240524/include/tst_hugepage.h
  /usr/src/debug/ltp/20240524/lib/tst_taint.c /usr/src/debug/ltp/20240524/include/tst_checkpoint.h /usr/src/debug/ltp/20240524/lib/tst_capability.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid10.c /usr/src/debug/ltp/20240524/lib/tst_uid.c /usr/src/debug/ltp/20240524/lib/tst_safe_sysv_ipc.c /usr/src/debug/ltp/20240524/lib/tst_security.c /usr/src/debug/ltp/20240524/include/tst_process_state.h /usr/src/debug/ltp/20240524/include/tst_path_has_mnt_flags.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20240524/include/libsigwait.h /usr/src/debug/ltp/20240524/lib/tst_supported_fs_types.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostname/gethostname01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/gethostname/gethostname02.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20240524/lib/sa
 fe_pthread.c /usr/src/debug/ltp/20240524/lib/tst_process_state.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20240524/include/tst_safe_posix_ipc.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20240524/include/tst_crypto.h /usr/src/debug/ltp/20240524/lib/tst_get_bad_addr.c /usr/src/debug/ltp/20240524/lib/tst_safe_io_uring.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20240524/lib/tst_mkfs.c /usr/src/debug/ltp/20240524/lib/tst_test.c /usr/src/debug/ltp/20240524/lib/tst_virt.c /usr/src/debug/ltp/20240524/lib/tst_arch.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20240524/include/tst_af_alg.h /usr/src/debug/ltp/20240524/lib/tst_dir_is_empty.c /usr/src/debug/ltp/20240524
 /testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20240524/lib/tst_clone.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20240524/lib/tst_fs_setup.c /usr/src/debug/ltp/20240524/lib/tst_hugepage.c /usr/src/debug/ltp/20240524/include/tst_safe_file_at.h /usr/src/debug/ltp/20240524/lib/tst_path_has_mnt_flags.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20240524/include/tst_wallclock.h /usr/src/debug/ltp/20240524/include/tst_safe_macros.h /usr/src/debug/ltp/20240524/include/tst_timer_test.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime02.c /usr/src/debug/ltp/20240524/include/tst_res_flags.h /usr/src/debug/ltp/20240524/lib/tst_status.c /usr/src/debug/ltp/20240524/include/tst_device.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20240524/include/tst_fd.h /usr
 /src/debug/ltp/20240524/lib/tst_checkpoint.c /usr/src/debug/ltp/20240524/include/ipcmsg.h /usr/src/debug/ltp/20240524/lib/tst_fill_file.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid11.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid12.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid13.c /usr/src/debug/ltp/20240524/include/tst_uid.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid06.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/waitpid/waitpid08.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice.h /usr/src/debug/ltp/20240524/include/tst_clocks.h /usr/src/debug/ltp/20240524/
 include/tst_safe_pthread.h /usr/src/debug/ltp/20240524/lib/tst_bool_expr.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrandom/getrandom05.c /usr/src/debug/ltp/20240524/lib/tst_rtctime.c /usr/src/debug/ltp/20240524/include/tst_netlink.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20240524/lib/tst_af_alg.c /usr/src/debug/ltp/20240524/lib/tst_timer.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20240524/lib/tst_fs_link_count.c /usr/src/debug/ltp/20240524/lib/tst_tmpdir.c /usr/src/debug/ltp/20240524/lib/tst_kernel.c /usr/src/debug/ltp/20240524/include/tst_pid.h /usr/src/debug/ltp/20240524/lib/safe_net.c /usr/src/debug/ltp/20240524/lib/tst_module.c /usr/src/debug/ltp/20240524/include/tst_checksum.h /usr/src/debug/ltp/20240524/include/tst_kvercmp.h /usr/src/debug/ltp/20240524/include/tst_rand_data.h /usr/src/debug/ltp/2
 0240524/lib/tst_buffers.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20240524/lib/tst_fs_type.c /usr/src/debug/ltp/20240524/include/tst_sched.h /usr/src/debug/ltp/20240524/lib/tst_clocks.c /usr/src/debug/ltp/20240524/include/tst_fs.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/unlink/unlink08.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20240524/include/tst_timer.h /usr/src/debug/ltp/20240524/lib/cloner.c /usr/src/debug/ltp/20240524/lib/tst_epoll.c /usr/src/debug/ltp/20240524/lib/tst_ioctl.c /usr/src/debug/ltp/20240524/lib/tst_coredump.c /usr/src/debug/ltp/20240524/testcases/kernel/security/kallsyms/kallsyms.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock/mlock03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrandom/g
 etrandom01.c /usr/src/debug/ltp/20240524/lib/tst_rand_data.c /usr/src/debug/ltp/20240524/include/safe_macros_fn.h /usr/src/debug/ltp/20240524/lib/errnos.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock/mlock01.c /usr/src/debug/ltp/20240524/include/tst_epoll.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice06.c /usr/src/debug/ltp/20240524/include/tst_get_bad_addr.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime07.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20240524/include/tst_arch.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime05.c /usr/src/debug/ltp/20240524/lib/tst_crypto.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/
 ltp/20240524/testcases/kernel/syscalls/getrandom/getrandom03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock/mlock05.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice02.c /usr/src/debug/ltp/20240524/include/tst_test_macros.h /usr/src/debug/ltp/20240524/lib/tst_resource.c /usr/src/debug/ltp/20240524/include/tst_checkpoint_fn.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20240524/libs/libltpipc/libipc.c /usr/src/debug/ltp/20240524/include/tst_cpu.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrandom/getrandom04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmat/shmat04.c /usr/src/debug/ltp/20240524/include/tst_safe_file_ops.h /usr/src/debug/ltp/20240524/include/tst_cmd.h /usr/src/debug/ltp/20240524/include/tst_capability.h /usr/src/debug/ltp/20240524/include/tst_bool_expr.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c /usr/src/debug/ltp/2024052
 4/lib/tst_kvercmp.c /usr/src/debug/ltp/20240524/lib/tst_sys_conf.c /usr/src/debug/ltp/20240524/include/tst_assert.h /usr/src/debug/ltp/20240524/include/safe_file_ops_fn.h /usr/src/debug/ltp/20240524/include/tst_fuzzy_sync.h /usr/src/debug/ltp/20240524/include/time64_variants.h /usr/src/debug/ltp/20240524/include/tst_safe_sysv_ipc.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice08.c /usr/src/debug/ltp/20240524/include/parse_vdso.h /usr/src/debug/ltp/20240524/lib/parse_opts.c /usr/src/debug/ltp/20240524/lib/tst_wallclock.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20240524/lib/tst_fd.c /usr/src/debug/ltp/20240524/include/tst_mkfs.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20240524/include/tst_netdevice.h /usr/src/debug/ltp/20240524/l
 ib/signame.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice07.c /usr/src/debug/ltp/20240524/include/tst_clone.h /usr/src/debug/ltp/20240524/include/tst_ansi_color.h /usr/src/debug/ltp/20240524/include/tst_private.h /usr/src/debug/ltp/20240524/lib/tst_fs_has_free.c /usr/src/debug/ltp/20240524/testcases/kernel/security/aslr/aslr01.c /usr/src/debug/ltp/20240524/include/tst_module.h /usr/src/debug/ltp/20240524/include/safe_net_fn.h /usr/src/debug/ltp/20240524/include/tst_safe_timerfd.h /usr/src/debug/ltp/20240524/include/safe_stdio_fn.h /usr/src/debug/ltp/20240524/lib/tst_assert.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime06.c /usr/src/debug/ltp/20240524/include/tst_safe_macros_inline.h /usr/src/debug/ltp/20240524/lib/safe_stdio.c /usr/src/debug/ltp/20240524/lib/safe_file_ops.c /usr/src/debug/ltp/20240524/include/tst_atomic.h /usr/src/debug/ltp/20240524/lib/tst_device.c /usr
 /src/debug/ltp/20240524/lib/tlibio.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/getrandom/getrandom02.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/utime/utime04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/arch_prctl/arch_prctl01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock/mlock04.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice03.c /usr/src/debug/ltp/20240524/include/tst_safe_clocks.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20240524/include/tst_test.h /usr/src/debug/ltp/20240524/include/tst_net.h /usr/src/debug/ltp/20240524/include/tst_parse.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice05.c /usr/src/debug/ltp/20240524/lib/tst_netlink.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/mlock/mlock02
 .c /usr/src/debug/ltp/20240524/include/tst_buffers.h /usr/src/debug/ltp/20240524/lib/tst_parse_opts.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice09.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmat/shmat01.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmat/shmat02.c /usr/src/debug/ltp/20240524/include/tst_coredump.h /usr/src/debug/ltp/20240524/include/tst_kconfig.h /usr/src/debug/ltp/20240524/lib/random_range.c /usr/src/debug/ltp/20240524/lib/tst_checksum.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/ipc/shmat/shmat03.c /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/splice/splice01.c /usr/src/debug/ltp/20240524/include/tst_uinput.h /usr/src/debug/ltp/20240524/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20240524/lib/tst_fill_fs.c /usr/src/debug/ltp/20240524/i
 nclude/libswap.h"
packages/core2-64-poky-linux/ltp/ltp-staticdev: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp-staticdev: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp: PKGV changed from 20240129 [default] to 20240524 [default]
packages/core2-64-poky-linux/ltp/ltp: PV changed from "20240129" to "20240524"
packages/core2-64-poky-linux/ltp/ltp: PKGSIZE changed from 429641781 to 438845556 (+2%)
packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/fcntl28 /opt/ltp/testcases/bin/xinetd_tests.sh /opt/ltp/testcases/bin/clockdiff01.sh /opt/ltp/testcases/bin/fcntl28_64 /opt/ltp/runtest/cap_bounds /opt/ltp/runtest/securebits /opt/ltp/testcases/bin/msgstress02 /opt/ltp/testcases/bin/msgstress03 /opt/ltp/testcases/bin/msgstress04 /opt/ltp/testcases/bin/host01.sh /opt/ltp/runtest/io /opt/ltp/testcases/bin/telnet01.sh /opt/ltp/runtest/filecaps /opt/ltp/testcases/bin/waitpid05 /opt/ltp/testcases/bin/waitpid02", added "/opt/ltp/testcases/bin/utime07 /opt/ltp/testcases/bin/kallsyms /opt/ltp/testcases/bin/arch_prctl01 /opt/ltp/testcases/bin/mlock05 /opt/ltp/runtest/capability /opt/ltp/testcases/bin/kvm_svm04 /opt/ltp/testcases/bin/splice09 /opt/ltp/testcases/bin/splice08 /opt/ltp/testcases/bin/gethostname02 /opt/ltp/testcases/bin/aslr01 /opt/ltp/testcases/bin/nfs09.sh /opt/ltp/testcases/bin/shmat04 /opt/ltp/testcases/bin/getrandom05 /opt/ltp/testcases/bin/unlink
 09"
Changes to packages/core2-64-poky-linux/ltp (sysroot):
  /opt/ltp/include/tst_parse.h was added
  /opt/ltp/include/tst_safe_macros_inline.h was added
  /opt/ltp/include/tst_security.h was added
  /opt/ltp/include/tst_fips.h was removed
  /opt/ltp/include/tst_lockdown.h was removed
  /opt/ltp/share was removed

--===============9201783537627669668==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20240129-20240524.patch"

RnJvbSA1ZGYwYmNlODMxMDhiY2E5NmY2ZGY2NmI2ZjYzZTUzZTEzNDBiMTE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxMTozMzowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
cDogdXBncmFkZSAyMDI0MDEyOSAtPiAyMDI0MDUyNAoKLS0tCiAuLi4wMDEtUmVtb3ZlLU9PTS10
ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0Y2ggfCAgOSArKy0tCiAuLi5yaW9fZ3JvdXBzLWRlZmF1
bHQtcmVtb3ZlLWNvbm5lY3RvcnMucGF0Y2ggfCAzNCAtLS0tLS0tLS0tLS0KIC4uLi1Vc2UtdGlt
ZV90LWluc3RlYWQtb2YtbG9uZy1mb3ItdHlwZS5wYXRjaCB8IDU0IC0tLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLi9sdHAve2x0cF8yMDI0MDEyOS5iYiA9PiBsdHBfMjAyNDA1MjQuYmJ9ICB8ICA0ICst
CiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOTcgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1zY2VuYXJp
b19ncm91cHMtZGVmYXVsdC1yZW1vdmUtY29ubmVjdG9ycy5wYXRjaAogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtc2NoZWRfc3RyZXNzLVVzZS10
aW1lX3QtaW5zdGVhZC1vZi1sb25nLWZvci10eXBlLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2x0cC97bHRwXzIwMjQwMTI5LmJiID0+IGx0cF8yMDI0MDUyNC5iYn0gKDk2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAxLVJlbW92ZS1P
T00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0
cC9sdHAvMDAwMS1SZW1vdmUtT09NLXRlc3RzLWZyb20tcnVudGVzdC1tbS5wYXRjaAppbmRleCBj
Yzk4MDc5NjUxLi41YjZjNzgwYmVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bHRwL2x0cC8wMDAxLVJlbW92ZS1PT00tdGVzdHMtZnJvbS1ydW50ZXN0LW1tLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9t
LXJ1bnRlc3QtbW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU4N2MyYWQxZTE2Y2RiZDYy
YmE3MWIyYWNlMzI3MDUwM2RlY2FhNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc2
ODE1OWFhNTMyNTdkMjQ3NjQ1YTEyNTE4Nzc4ZjUwYjhmZGY1NzggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiAiTWluZ2RlIChNYXR0aGV3KSBaZW5nIiA8bWF0dGhld3ptZEBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDI5IEp1bCAyMDIwIDA4OjQ3OjA5IC0wNDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIFJlbW92ZSBPT00gdGVzdHMgZnJvbSBydW50ZXN0L21tCkBAIC0xNCwxMCArMTQsMTAgQEAg
U2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9ydW50ZXN0L21tIGIvcnVu
dGVzdC9tbQotaW5kZXggZDg1OWIzMzFjLi4zYzI5NjJmNDQgMTAwNjQ0CitpbmRleCA2YThjZDBi
OWQuLjhjZTNmNDQxNiAxMDA2NDQKIC0tLSBhL3J1bnRlc3QvbW0KICsrKyBiL3J1bnRlc3QvbW0K
LUBAIC03NCwxMiArNzQsNiBAQCBrc20wNyBrc20wNworQEAgLTc2LDEyICs3Niw2IEBAIGtzbTA3
IGtzbTA3CiAgCiAgY3B1c2V0MDEgY3B1c2V0MDEKICAKQEAgLTMwLDYgKzMwLDMgQEAgaW5kZXgg
ZDg1OWIzMzFjLi4zYzI5NjJmNDQgMTAwNjQ0CiAgc3dhcHBpbmcwMSBzd2FwcGluZzAxIC1pIDUK
ICAKICB0aHAwMSB0aHAwMSAtSSAxMjAKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtc2NlbmFyaW9fZ3JvdXBzLWRlZmF1bHQtcmVt
b3ZlLWNvbm5lY3RvcnMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cC8wMDAx
LXNjZW5hcmlvX2dyb3Vwcy1kZWZhdWx0LXJlbW92ZS1jb25uZWN0b3JzLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0YTUwZDFhZTM4Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtc2NlbmFyaW9fZ3JvdXBzLWRlZmF1bHQtcmVt
b3ZlLWNvbm5lY3RvcnMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNCArMCwwIEBACi1Gcm9t
IDE0YzcxMGNhZTM4YWE5NmJkOGQ2ODFlODkxYjZhMWQ2OTFmOTk5ODggTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkB3aW5kcml2ZXIuY29t
PgotRGF0ZTogVGh1LCAxNCBNYXIgMjAyNCAwOTo0NzoxMCArMDgwMAotU3ViamVjdDogW1BBVENI
XSBzY2VuYXJpb19ncm91cHMvZGVmYXVsdDogcmVtb3ZlIGNvbm5lY3RvcnMKLQotcnVudGVzdC9j
b25uZWN0b3JzIHdhcyByZW1vdmVkIGluIDliNjQyZDg5YywgdGh1cyB1cGRhdGUgc2NlbmFyaW9f
Z3JvdXBzL2RlZmF1bHQuCi0KLUZpeGVzOiA5YjY0MmQ4OWMgKCJydW50ZXN0OiBNZXJnZSBydW50
ZXN0L2Nvbm5lY3RvcnMgdG8ga2VybmVsX21pc2MiKQotQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5j
b20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9wdWxsLzExNDQKLQotVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCBmcm9tCi1baHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAv
Y29tbWl0LzE0YzcxMGNhXQotCi1SZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2Uu
Y3o+Ci1TaWduZWQtb2ZmLWJ5OiBYaWFuZ3l1IENoZW4gPHhpYW5neXUuY2hlbkB3aW5kcml2ZXIu
Y29tPgotLS0tCi0gc2NlbmFyaW9fZ3JvdXBzL2RlZmF1bHQgfCAxIC0KLSAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc2NlbmFyaW9fZ3JvdXBzL2RlZmF1bHQg
Yi9zY2VuYXJpb19ncm91cHMvZGVmYXVsdAotaW5kZXggZjE3YjIwNjFhLi5lYzc3ZDhmYjggMTAw
NjQ0Ci0tLS0gYS9zY2VuYXJpb19ncm91cHMvZGVmYXVsdAotKysrIGIvc2NlbmFyaW9fZ3JvdXBz
L2RlZmF1bHQKLUBAIC0xNiw3ICsxNiw2IEBAIGNvbnRyb2xsZXJzCi0gZmlsZWNhcHMKLSBjYXBf
Ym91bmRzCi0gZmNudGwtbG9ja3Rlc3RzCi0tY29ubmVjdG9ycwotIHBvd2VyX21hbmFnZW1lbnRf
dGVzdHMKLSBodWdldGxiCi0gY29tbWFuZHMKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwLzAwMDEtc2NoZWRfc3RyZXNzLVVzZS10aW1lX3Qt
aW5zdGVhZC1vZi1sb25nLWZvci10eXBlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0
cC9sdHAvMDAwMS1zY2hlZF9zdHJlc3MtVXNlLXRpbWVfdC1pbnN0ZWFkLW9mLWxvbmctZm9yLXR5
cGUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGFlOGRjODcwNmUuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHAvMDAwMS1zY2hlZF9zdHJl
c3MtVXNlLXRpbWVfdC1pbnN0ZWFkLW9mLWxvbmctZm9yLXR5cGUucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSw1NCArMCwwIEBACi1Gcm9tIDc0MDc0ZjlhNzFjODc2ZDZlOTVjMmQ3MjcwMjg4OGRk
MmZhYmM3NjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgotRGF0ZTogTW9uLCA2IE1heSAyMDI0IDExOjQzOjIwIC0wNzAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIHNjaGVkX3N0cmVzczogVXNlIHRpbWVfdCBpbnN0ZWFkIG9mIGxvbmcgZm9y
IHR5cGUKLQotVGhpcyBlbnN1cmVzIGl0IHdvcmtzIGFjcm9zcyBkaWZmZXJlbnQgYXJjaGl0ZWN0
dXJlcwotRml4ZXMKLQotfCBzY2hlZF9kcml2ZXIuYzo3NDQ6NDM6IGVycm9yOiBwYXNzaW5nIGFy
Z3VtZW50IDEgb2YgJ2N0aW1lJyBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5j
b21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCi18ICAgNzQ0IHwgICAgICAgICBwcmludGYoIlxuZW5k
IHRpbWUgPSAlc1xuIiwgY3RpbWUoJmVuZF90aW1lKSk7Ci18ICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+Ci0KLVdpdGggZ2NjLTE0Ci0K
LVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0
LXByb2plY3QvbHRwL2NvbW1pdC8wYTY4MmYxYWY0MmQ4ZDI2MTIwMjgyMWJlNTgwZmUyNmQxN2Vl
OWI3XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQot
IHRlc3RjYXNlcy9rZXJuZWwvc2NoZWQvc2NoZWRfc3RyZXNzL3NjaGVkX2RyaXZlci5jIHwgNiAr
KystLS0KLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQot
Ci1kaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRf
ZHJpdmVyLmMgYi90ZXN0Y2FzZXMva2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF9kcml2
ZXIuYwotaW5kZXggNjE1NzNkNzg4Li41YjhjMTg3ZmUgMTAwNjQ0Ci0tLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL3NjaGVkL3NjaGVkX3N0cmVzcy9zY2hlZF9kcml2ZXIuYwotKysrIGIvdGVzdGNhc2Vz
L2tlcm5lbC9zY2hlZC9zY2hlZF9zdHJlc3Mvc2NoZWRfZHJpdmVyLmMKLUBAIC0xMzYsNyArMTM2
LDcgQEAgaW50IGRlYnVnID0gMDsKLSAvKgotICAqIEZ1bmN0aW9uIHByb3RvdHlwZXMKLSAgKi8K
LS12b2lkIHN0YXJ0dXAobG9uZyk7Ci0rdm9pZCBzdGFydHVwKHRpbWVfdCk7Ci0gaW50IHN0YXJ0
X3Rlc3RjYXNlKGNoYXIgKiwgY2hhciAqLCBjaGFyICosIGNoYXIgKiwgY2hhciAqLCBjaGFyICop
OwotIGludCBwcm9jZXNzX3Nsb3RzX2luX3VzZSgpOwotIGludCBhdmFpbGFibGVfdXNlcl9wcm9j
ZXNzX3Nsb3RzKCk7Ci1AQCAtMjUxLDcgKzI1MSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikKLSAgKiBpbmZvcm1hdGlvbiB0byB0aGUgc2NyZWVuIGFuZCAuICBJdCBhbHNvIGlu
aXRpYWxpemVzIHRoZQkgKgotICAqIHByb2Nlc3MgaWQgbGlzdCBhbmQgb3RoZXIgZ2xvYmFsIHZh
cmlhYmxlcy4JIAkJCSAqCi0gICotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSovCi0tdm9pZCBzdGFydHVwKGxvbmcg
c3RhcnRfdGltZSkKLSt2b2lkIHN0YXJ0dXAodGltZV90IHN0YXJ0X3RpbWUpCi0gewotIAljaGFy
IHRlbXBidWZmZXJbNTBdOwkvKiB0ZW1wb3JhcnkgYnVmZmVyIHRvIGhvbGQgbmFtZXMgKi8KLSAK
LUBAIC03MzQsNyArNzM0LDcgQEAgdm9pZCBraWxsX3Nob3J0X3Rlcm1fdGVzdGNhc2VzKCkKLSB2
b2lkIGZpbmlzaHVwKHN0YXJ0X3RpbWUpCi0gbG9uZyBzdGFydF90aW1lOwkJLyogc3RhcnRpbmcg
dGltZSB0byBjYWxjdWxhdGUgZWxhcHNlZCB0aW1lICovCi0gewotLQlsb25nIGVuZF90aW1lOwkJ
LyogdGltZSB3aGVuIHByb2dyYW0gZmluaXNoZWQgKi8KLSsJdGltZV90IGVuZF90aW1lOwkJLyog
dGltZSB3aGVuIHByb2dyYW0gZmluaXNoZWQgKi8KLSAKLSAJLyoKLSAJICogR2V0IHRoZSBlbmQg
dGltZSBhbmQgY2FsY3VsYXRlIGVsYXBzZWQgdGltZTsgd3JpdGUgYWxsIHRoaXMgb3V0Ci0tLSAK
LTIuNDUuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI0
MDEyOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjQwNTI0LmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRw
XzIwMjQwMTI5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI0
MDUyNC5iYgppbmRleCBmOGU2ZDM5ODdlLi4xYWFmZWQwYmY1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHRwL2x0cF8yMDI0MDEyOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvbHRwL2x0cF8yMDI0MDUyNC5iYgpAQCAtMjQsMTIgKzI0LDEwIEBAIFRVTkVfQ0NBUkdT
OnJlbW92ZTp4ODYtNjQgPSAiLW1mcG1hdGg9c3NlIgogCiBDRkxBR1M6YXBwZW5kOnBvd2VycGM2
NCA9ICIgLURfX1NBTkVfVVNFUlNQQUNFX1RZUEVTX18iCiBDRkxBR1M6YXBwZW5kOm1pcHNhcmNo
bjY0ID0gIiAtRF9fU0FORV9VU0VSU1BBQ0VfVFlQRVNfXyIKLVNSQ1JFViA9ICI2ODczN2QyMDU1
NmQzNzM2NGM5NTc3NjA0NGIxMTE5YzA5MTJhMzZhIgorU1JDUkVWID0gIjhmMjFlYmJhNDIyMTZk
YmI3ZThkNDRjMjNiNGE5NzdkNjgyM2Y3YTEiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNv
bS9saW51eC10ZXN0LXByb2plY3QvbHRwLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBz
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3Qt
bW0ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1zY2VuYXJpb19ncm91cHMtZGVmYXVs
dC1yZW1vdmUtY29ubmVjdG9ycy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXNjaGVk
X3N0cmVzcy1Vc2UtdGltZV90LWluc3RlYWQtb2YtbG9uZy1mb3ItdHlwZS5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuNDQuMAoK

--===============9201783537627669668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ltp/ltp-dev: PKGSIZE changed from 280396 to 312465 (+11%)
packages/core2-64-poky-linux/ltp/ltp-dev: FILELIST: removed "/opt/ltp/include/tst_fips.h /opt/ltp/include/tst_lockdown.h", added "/opt/ltp/include/tst_parse.h /opt/ltp/include/tst_security.h /opt/ltp/include/tst_safe_macros_inline.h"
packages/core2-64-poky-linux/ltp/ltp-doc: PKGSIZE changed from 62798 to 0 (-100%)
packages/core2-64-poky-linux/ltp/ltp-doc: FILELIST: removed all items "/opt/ltp/share/man/man1/doio.1 /opt/ltp/share/man/man3/random_range_seed.3 /opt/ltp/share/man/man1/ltp-pan.1 /opt/ltp/share/man/man3/random_range.3 /opt/ltp/share/man/man3/parse_ranges.3 /opt/ltp/share/man/man3/tst_tmpdir.3 /opt/ltp/share/man/man1/ltp-bump.1 /opt/ltp/share/man/man3/parse_opts.3 /opt/ltp/share/man/man3/tst_res.3 /opt/ltp/share/man/man3/tst_sig.3 /opt/ltp/share/man/man3/usctest.3 /opt/ltp/share/man/man1/iogen.1"
packages/core2-64-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/fcntl28_64 /opt/ltp/runtest/securebits /opt/ltp/runtest/cap_bounds /opt/ltp/testcases/bin/clockdiff01.sh /opt/ltp/testcases/bin/host01.sh /opt/ltp/testcases/bin/telnet01.sh /opt/ltp/testcases/bin/msgstress04 /opt/ltp/runtest/io /opt/ltp/testcases/bin/msgstress03 /opt/ltp/testcases/bin/msgstress02 /opt/ltp/testcases/bin/waitpid02 /opt/ltp/testcases/bin/xinetd_tests.sh /opt/ltp/testcases/bin/waitpid05 /opt/ltp/testcases/bin/fcntl28 /opt/ltp/runtest/filecaps", added "/opt/ltp/testcases/bin/shmat04 /opt/ltp/testcases/bin/gethostname02 /opt/ltp/testcases/bin/splice08 /opt/ltp/testcases/bin/splice09 /opt/ltp/testcases/bin/utime07 /opt/ltp/testcases/bin/mlock05 /opt/ltp/runtest/capability /opt/ltp/testcases/bin/getrandom05 /opt/ltp/testcases/bin/aslr01 /opt/ltp/testcases/bin/kvm_svm04 /opt/ltp/testcases/bin/kallsyms /opt/ltp/testcases/bin/unlink09 /opt/ltp/testcases/bin/nfs09.sh /opt/ltp/testcases/bin/arch_prctl
 01"
Changes to packages/core2-64-poky-linux/ltp (sysroot):
  /opt/ltp/include/tst_parse.h was added
  /opt/ltp/include/tst_safe_macros_inline.h was added
  /opt/ltp/include/tst_security.h was added
  /opt/ltp/include/tst_fips.h was removed
  /opt/ltp/include/tst_lockdown.h was removed
  /opt/ltp/share was removed

--===============9201783537627669668==--

