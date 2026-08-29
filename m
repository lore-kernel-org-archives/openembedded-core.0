Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4A3C61DD9
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2090.1787982254463197257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ifZxwkVa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zvHbLtJm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a04c0c0d55-6ce6f855-efad-4ceb-9f3f-9034ec361e00-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qgMGwT9WZ3DHudo1M8+9e5HIMzj1BADcCR6NPrz7jDc=;
	b=ifZxwkVau3KlQJCuE5K7fJ2RpXJXqwnwR1BWYtQlZOKLccDuuQNkfQDmM0aUNfoG
	Pdw7jLthxjl5r9wb7AD9VWM14ISwK1JMrYWY/1OXKqsmcCwmJBU3oHG/GJ4NPRNHYIo
	drMnFOdwgIxkcq/aM4fA0X/FHqavdK/jpHREvwPw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982253;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qgMGwT9WZ3DHudo1M8+9e5HIMzj1BADcCR6NPrz7jDc=;
	b=zvHbLtJm0Ra7A52I0+XkJsG+7OxT/JRdzHhJhblV+OtArGV5AGat4m6T8FeEe+MP
	SLMmZIIRVfehjg+8eN1eNnzRNNZaBQWZICc6c18hzcsELfJYjL5Nzr5sb2DaPaIwYdM
	KLuvvvXrGk7Guk6ikICurTQGt5YWqF9igx6U/WwU=
Content-Type: multipart/mixed; boundary="===============4822822332396991390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.8.0 FAILED
Message-ID: <010101a04c0c0d55-6ce6f855-efad-4ceb-9f3f-9034ec361e00-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244627

--===============4822822332396991390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysstat* to *12.8.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.7.9-12.8.0.patch
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
From 0cb33fa796415d1a72f5c591d4d46b9a47ba8505 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:26:22 +0000
Subject: [PATCH] sysstat: upgrade 12.7.9 -> 12.8.0

Source: CHANGES

2026/08/28: Version 12.8.0 - Sebastien Godard (sysstat <at> orange.fr)
	* [Agenticode]: sadc: Read /proc/stat once per collection cycle.
	* rd_stats.c: Rework functions to read /proc files once.
	* Read all /proc files once per collection cycle.
	* [Sagar Sagar]: Avoid all-zero CPU rows on counter regression.
	* [Lilu]: svg_stats.c: Fix integer overflow in allocate_graph_lines
	  size computation.
	* [Hang Zhao]: sadc: Fix pgscan_direct counter incorrectly including
	  pgscan_direct_throttle.
	* [Andy Lau]: sadc: Fix pgsteal/s double counting by only summing
	  pgsteal_anon and pgsteal_file.
	* [Andy Lau]: sar, mpstat: use write() instead of printf() in signal
	  handler to ensure JSON output is properly closed on SIGTERM.
	* [Andy Lau]: Remove unnecessary unsigned int cast that truncates
	  irq_nr in read_stat_total_irq().
	* [Andy Lau]: Fix typo in sar manual page.
	* [Dean Chen]: sadf, sar: let --fs match mountpoints as well as device
	  names.
	* sar/sadf: Don't test for empty "--fs=" list.
	* [Nathan Scott]: iostat/tapestat/cifsiostat: add -G flag for gibibyte
	  display.
	* [Nathan Scott]: sa1: derive LONG_NAME from SADC_OPTIONS, not just
	  HISTORY.
	* [Nathan Scott]: sa2: honour -D in SADC_OPTIONS for date format.
	* [Nathan Scott]: Slightly reduce scope of install-cron configure script
	  option.
	* [Nathan Scott]: Rename --enable-install-cron to
	  --disable-automated-sar-reporting.
	* [Nathan Scott]: Enable automated sar reporting by default.
	* [Nathan Scott]: sadc: Fix heap buffer overflow in reallocate_buffer().
	* [Nathan Scott]: do_test: Replace bash-ism with POSIX arithmetic.
	* [Nathan Scott]: do_test: Exit with error status on test failure.
	* [Nathan Scott]: tests: Fix PCP archive test portability.
	* [Nathan Scott]: ci: Add GitHub Actions CI workflow.
	* sa1: Remove "iso" option.
	* cifsiostat: Add JSON output for option -G (display in Gigabytes).
	* pidstat: Add fflush() after JSON closing output.
	* sadc: Now only read pgscan_kswapd counter.
	* sa_wrap.c: Also use reallocate_buffer() function for A_PWR_FREQ
	  activity.
	* cifsiostat, iostat, sa1, sadf, sar and tapestat manual pages updated.
	* Non-regression tests updated. New tests added.
	* simtest: Fix issue related to 19th day of the month.
	* Makefile: Fix EXTRALIST variable contents.
	* Fix some tests for out-of-tree build.
	* do_test: Make options available with out-of-tree target.
	* [orbisai0security]: Fix a (theoretical) security vulnerability.
	* [Peter Dave Hello]: Refresh sysstat gettext template file.
	* FAQ file updated.
	* NLS translations updated.
	* Update year in copyright messages.
	* tapestat: Cosmetic change.
---
 .../0001-configure.in-remove-check-for-chkconfig.patch        | 4 ++--
 .../sysstat/{sysstat_12.7.9.bb => sysstat_12.8.0.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.9.bb => sysstat_12.8.0.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 431a60aee1..3bbf769929 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From f41b0253d1583f7e1286fa2f29393c3d3f5183b4 Mon Sep 17 00:00:00 2001
+From 7df414e3a4919d6bc68728ea593d00098ef1fc13 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,7 +13,7 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8b5f9b73..910ebd5a 100644
+index 17507ea9..a08d717b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.9.bb b/meta/recipes-extended/sysstat/sysstat_12.8.0.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.9.bb
rename to meta/recipes-extended/sysstat/sysstat_12.8.0.bb
index ffc7c0ac37..967e60f2d4 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.8.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "b8f987807e7c7ba5c1b2ca8b7b1e9d80e61bce6c"
+SRCREV = "ffabe8175aa9a7aa056380c66ed3648e50c1967d"
 
 DEPENDS += "base-passwd xz-native"
 
-- 
2.47.1


--===============4822822332396991390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1986 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-1fc620991840da72f31392a1e60f6941e6aa4d63"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1fc620991840da72f31392a1e60f6941e6aa4d63"
meta-yocto-bsp       
meta-poky            = "master:6ce984c0a3a68c2fdc3c32bc185b6729d09e7829"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 188 Local 175 Mirrors 0 Missed 13 Current 178 (93% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 323 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 366 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_spdx_setscene)
NOTE: Running task 457 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_recipe_qa)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sysstat-12.8.0-r0: task do_recipe_qa: Started
NOTE: recipe xz-native-5.8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 352 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 366 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sysstat-12.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 491 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 359 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xz-native-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 362 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sysstat-12.8.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xz-native-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 979 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 366 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe sysstat-12.8.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sysstat-12.8.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sysstat-12.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_unpack)
NOTE: Running task 1000 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sysstat-12.8.0-r0: task do_unpack: Started
NOTE: recipe sysstat-12.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sysstat-12.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sysstat-12.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_patch)
NOTE: recipe sysstat-12.8.0-r0: task do_patch: Started
NOTE: recipe sysstat-12.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1002 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1003 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_populate_lic)
NOTE: recipe sysstat-12.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sysstat-12.8.0-r0: task do_populate_lic: Started
NOTE: recipe sysstat-12.8.0-r0: task do_populate_lic: Succeeded
NOTE: recipe sysstat-12.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1004 of 1016 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_configure)
NOTE: recipe sysstat-12.8.0-r0: task do_configure: Started
NOTE: recipe sysstat-12.8.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1004 tasks of which 995 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260829052602.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260829052602.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/sysstat/12.8.0/temp/log.do_configure.3333728
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: sysstat-12.8.0-r0 do_configure: QA Issue: sysstat: configure was passed unrecognised options: --disable-install-cron [unknown-configure-option]
ERROR: sysstat-12.8.0-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/sysstat/12.8.0/temp/log.do_configure.3333728
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sysstat/sysstat_12.8.0.bb:do_configure) failed with exit code '1'

--===============4822822332396991390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sysstat-changelog.txt"

Changelog for sysstat: 12.7.9 -> 12.8.0
Source: CHANGES

2026/08/28: Version 12.8.0 - Sebastien Godard (sysstat <at> orange.fr)
	* [Agenticode]: sadc: Read /proc/stat once per collection cycle.
	* rd_stats.c: Rework functions to read /proc files once.
	* Read all /proc files once per collection cycle.
	* [Sagar Sagar]: Avoid all-zero CPU rows on counter regression.
	* [Lilu]: svg_stats.c: Fix integer overflow in allocate_graph_lines
	  size computation.
	* [Hang Zhao]: sadc: Fix pgscan_direct counter incorrectly including
	  pgscan_direct_throttle.
	* [Andy Lau]: sadc: Fix pgsteal/s double counting by only summing
	  pgsteal_anon and pgsteal_file.
	* [Andy Lau]: sar, mpstat: use write() instead of printf() in signal
	  handler to ensure JSON output is properly closed on SIGTERM.
	* [Andy Lau]: Remove unnecessary unsigned int cast that truncates
	  irq_nr in read_stat_total_irq().
	* [Andy Lau]: Fix typo in sar manual page.
	* [Dean Chen]: sadf, sar: let --fs match mountpoints as well as device
	  names.
	* sar/sadf: Don't test for empty "--fs=" list.
	* [Nathan Scott]: iostat/tapestat/cifsiostat: add -G flag for gibibyte
	  display.
	* [Nathan Scott]: sa1: derive LONG_NAME from SADC_OPTIONS, not just
	  HISTORY.
	* [Nathan Scott]: sa2: honour -D in SADC_OPTIONS for date format.
	* [Nathan Scott]: Slightly reduce scope of install-cron configure script
	  option.
	* [Nathan Scott]: Rename --enable-install-cron to
	  --disable-automated-sar-reporting.
	* [Nathan Scott]: Enable automated sar reporting by default.
	* [Nathan Scott]: sadc: Fix heap buffer overflow in reallocate_buffer().
	* [Nathan Scott]: do_test: Replace bash-ism with POSIX arithmetic.
	* [Nathan Scott]: do_test: Exit with error status on test failure.
	* [Nathan Scott]: tests: Fix PCP archive test portability.
	* [Nathan Scott]: ci: Add GitHub Actions CI workflow.
	* sa1: Remove "iso" option.
	* cifsiostat: Add JSON output for option -G (display in Gigabytes).
	* pidstat: Add fflush() after JSON closing output.
	* sadc: Now only read pgscan_kswapd counter.
	* sa_wrap.c: Also use reallocate_buffer() function for A_PWR_FREQ
	  activity.
	* cifsiostat, iostat, sa1, sadf, sar and tapestat manual pages updated.
	* Non-regression tests updated. New tests added.
	* simtest: Fix issue related to 19th day of the month.
	* Makefile: Fix EXTRALIST variable contents.
	* Fix some tests for out-of-tree build.
	* do_test: Make options available with out-of-tree target.
	* [orbisai0security]: Fix a (theoretical) security vulnerability.
	* [Peter Dave Hello]: Refresh sysstat gettext template file.
	* FAQ file updated.
	* NLS translations updated.
	* Update year in copyright messages.
	* tapestat: Cosmetic change.

--===============4822822332396991390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.7.9-12.8.0.patch"

RnJvbSAwY2IzM2ZhNzk2NDE1ZDFhNzJmNWM1OTFkNGQ0NmI5YTQ3YmE4NTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6MjY6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNzdGF0OiB1cGdyYWRlIDEyLjcuOSAtPiAxMi44LjAKClNvdXJjZTogQ0hBTkdFUwoKMjAyNi8w
OC8yODogVmVyc2lvbiAxMi44LjAgLSBTZWJhc3RpZW4gR29kYXJkIChzeXNzdGF0IDxhdD4gb3Jh
bmdlLmZyKQoJKiBbQWdlbnRpY29kZV06IHNhZGM6IFJlYWQgL3Byb2Mvc3RhdCBvbmNlIHBlciBj
b2xsZWN0aW9uIGN5Y2xlLgoJKiByZF9zdGF0cy5jOiBSZXdvcmsgZnVuY3Rpb25zIHRvIHJlYWQg
L3Byb2MgZmlsZXMgb25jZS4KCSogUmVhZCBhbGwgL3Byb2MgZmlsZXMgb25jZSBwZXIgY29sbGVj
dGlvbiBjeWNsZS4KCSogW1NhZ2FyIFNhZ2FyXTogQXZvaWQgYWxsLXplcm8gQ1BVIHJvd3Mgb24g
Y291bnRlciByZWdyZXNzaW9uLgoJKiBbTGlsdV06IHN2Z19zdGF0cy5jOiBGaXggaW50ZWdlciBv
dmVyZmxvdyBpbiBhbGxvY2F0ZV9ncmFwaF9saW5lcwoJICBzaXplIGNvbXB1dGF0aW9uLgoJKiBb
SGFuZyBaaGFvXTogc2FkYzogRml4IHBnc2Nhbl9kaXJlY3QgY291bnRlciBpbmNvcnJlY3RseSBp
bmNsdWRpbmcKCSAgcGdzY2FuX2RpcmVjdF90aHJvdHRsZS4KCSogW0FuZHkgTGF1XTogc2FkYzog
Rml4IHBnc3RlYWwvcyBkb3VibGUgY291bnRpbmcgYnkgb25seSBzdW1taW5nCgkgIHBnc3RlYWxf
YW5vbiBhbmQgcGdzdGVhbF9maWxlLgoJKiBbQW5keSBMYXVdOiBzYXIsIG1wc3RhdDogdXNlIHdy
aXRlKCkgaW5zdGVhZCBvZiBwcmludGYoKSBpbiBzaWduYWwKCSAgaGFuZGxlciB0byBlbnN1cmUg
SlNPTiBvdXRwdXQgaXMgcHJvcGVybHkgY2xvc2VkIG9uIFNJR1RFUk0uCgkqIFtBbmR5IExhdV06
IFJlbW92ZSB1bm5lY2Vzc2FyeSB1bnNpZ25lZCBpbnQgY2FzdCB0aGF0IHRydW5jYXRlcwoJICBp
cnFfbnIgaW4gcmVhZF9zdGF0X3RvdGFsX2lycSgpLgoJKiBbQW5keSBMYXVdOiBGaXggdHlwbyBp
biBzYXIgbWFudWFsIHBhZ2UuCgkqIFtEZWFuIENoZW5dOiBzYWRmLCBzYXI6IGxldCAtLWZzIG1h
dGNoIG1vdW50cG9pbnRzIGFzIHdlbGwgYXMgZGV2aWNlCgkgIG5hbWVzLgoJKiBzYXIvc2FkZjog
RG9uJ3QgdGVzdCBmb3IgZW1wdHkgIi0tZnM9IiBsaXN0LgoJKiBbTmF0aGFuIFNjb3R0XTogaW9z
dGF0L3RhcGVzdGF0L2NpZnNpb3N0YXQ6IGFkZCAtRyBmbGFnIGZvciBnaWJpYnl0ZQoJICBkaXNw
bGF5LgoJKiBbTmF0aGFuIFNjb3R0XTogc2ExOiBkZXJpdmUgTE9OR19OQU1FIGZyb20gU0FEQ19P
UFRJT05TLCBub3QganVzdAoJICBISVNUT1JZLgoJKiBbTmF0aGFuIFNjb3R0XTogc2EyOiBob25v
dXIgLUQgaW4gU0FEQ19PUFRJT05TIGZvciBkYXRlIGZvcm1hdC4KCSogW05hdGhhbiBTY290dF06
IFNsaWdodGx5IHJlZHVjZSBzY29wZSBvZiBpbnN0YWxsLWNyb24gY29uZmlndXJlIHNjcmlwdAoJ
ICBvcHRpb24uCgkqIFtOYXRoYW4gU2NvdHRdOiBSZW5hbWUgLS1lbmFibGUtaW5zdGFsbC1jcm9u
IHRvCgkgIC0tZGlzYWJsZS1hdXRvbWF0ZWQtc2FyLXJlcG9ydGluZy4KCSogW05hdGhhbiBTY290
dF06IEVuYWJsZSBhdXRvbWF0ZWQgc2FyIHJlcG9ydGluZyBieSBkZWZhdWx0LgoJKiBbTmF0aGFu
IFNjb3R0XTogc2FkYzogRml4IGhlYXAgYnVmZmVyIG92ZXJmbG93IGluIHJlYWxsb2NhdGVfYnVm
ZmVyKCkuCgkqIFtOYXRoYW4gU2NvdHRdOiBkb190ZXN0OiBSZXBsYWNlIGJhc2gtaXNtIHdpdGgg
UE9TSVggYXJpdGhtZXRpYy4KCSogW05hdGhhbiBTY290dF06IGRvX3Rlc3Q6IEV4aXQgd2l0aCBl
cnJvciBzdGF0dXMgb24gdGVzdCBmYWlsdXJlLgoJKiBbTmF0aGFuIFNjb3R0XTogdGVzdHM6IEZp
eCBQQ1AgYXJjaGl2ZSB0ZXN0IHBvcnRhYmlsaXR5LgoJKiBbTmF0aGFuIFNjb3R0XTogY2k6IEFk
ZCBHaXRIdWIgQWN0aW9ucyBDSSB3b3JrZmxvdy4KCSogc2ExOiBSZW1vdmUgImlzbyIgb3B0aW9u
LgoJKiBjaWZzaW9zdGF0OiBBZGQgSlNPTiBvdXRwdXQgZm9yIG9wdGlvbiAtRyAoZGlzcGxheSBp
biBHaWdhYnl0ZXMpLgoJKiBwaWRzdGF0OiBBZGQgZmZsdXNoKCkgYWZ0ZXIgSlNPTiBjbG9zaW5n
IG91dHB1dC4KCSogc2FkYzogTm93IG9ubHkgcmVhZCBwZ3NjYW5fa3N3YXBkIGNvdW50ZXIuCgkq
IHNhX3dyYXAuYzogQWxzbyB1c2UgcmVhbGxvY2F0ZV9idWZmZXIoKSBmdW5jdGlvbiBmb3IgQV9Q
V1JfRlJFUQoJICBhY3Rpdml0eS4KCSogY2lmc2lvc3RhdCwgaW9zdGF0LCBzYTEsIHNhZGYsIHNh
ciBhbmQgdGFwZXN0YXQgbWFudWFsIHBhZ2VzIHVwZGF0ZWQuCgkqIE5vbi1yZWdyZXNzaW9uIHRl
c3RzIHVwZGF0ZWQuIE5ldyB0ZXN0cyBhZGRlZC4KCSogc2ltdGVzdDogRml4IGlzc3VlIHJlbGF0
ZWQgdG8gMTl0aCBkYXkgb2YgdGhlIG1vbnRoLgoJKiBNYWtlZmlsZTogRml4IEVYVFJBTElTVCB2
YXJpYWJsZSBjb250ZW50cy4KCSogRml4IHNvbWUgdGVzdHMgZm9yIG91dC1vZi10cmVlIGJ1aWxk
LgoJKiBkb190ZXN0OiBNYWtlIG9wdGlvbnMgYXZhaWxhYmxlIHdpdGggb3V0LW9mLXRyZWUgdGFy
Z2V0LgoJKiBbb3JiaXNhaTBzZWN1cml0eV06IEZpeCBhICh0aGVvcmV0aWNhbCkgc2VjdXJpdHkg
dnVsbmVyYWJpbGl0eS4KCSogW1BldGVyIERhdmUgSGVsbG9dOiBSZWZyZXNoIHN5c3N0YXQgZ2V0
dGV4dCB0ZW1wbGF0ZSBmaWxlLgoJKiBGQVEgZmlsZSB1cGRhdGVkLgoJKiBOTFMgdHJhbnNsYXRp
b25zIHVwZGF0ZWQuCgkqIFVwZGF0ZSB5ZWFyIGluIGNvcHlyaWdodCBtZXNzYWdlcy4KCSogdGFw
ZXN0YXQ6IENvc21ldGljIGNoYW5nZS4KLS0tCiAuLi4vMDAwMS1jb25maWd1cmUuaW4tcmVtb3Zl
LWNoZWNrLWZvci1jaGtjb25maWcucGF0Y2ggICAgICAgIHwgNCArKy0tCiAuLi4vc3lzc3RhdC97
c3lzc3RhdF8xMi43LjkuYmIgPT4gc3lzc3RhdF8xMi44LjAuYmJ9ICAgICAgICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQve3N5c3N0YXRfMTIuNy45LmJiID0+IHN5c3N0
YXRfMTIuOC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9z
eXNzdGF0L3N5c3N0YXQvMDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25m
aWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LzAwMDEtY29u
ZmlndXJlLmluLXJlbW92ZS1jaGVjay1mb3ItY2hrY29uZmlnLnBhdGNoCmluZGV4IDQzMWE2MGFl
ZTEuLjNiYmY3Njk5MjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0
L3N5c3N0YXQvMDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdC8wMDAxLWNvbmZp
Z3VyZS5pbi1yZW1vdmUtY2hlY2stZm9yLWNoa2NvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gZjQxYjAyNTNkMTU4M2Y3ZTEyODZmYTJmMjkzOTNjM2QzZjUxODNiNCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2RmNDE0ZTNhNDkxOWQ2YmM2ODcyOGVhNTkzZDAwMDk4ZWYx
ZmMxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFdlbmxpbiBLYW5nIDx3ZW5saW4u
a2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA1IE5vdiAyMDE5IDE2OjE2OjQ0ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogcmVtb3ZlIGNoZWNrIGZvciBjaGtjb25m
aWcKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogV2VubGluIEthbmcgPHdlbmxpbi5r
YW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1p
bmRleCA4YjVmOWI3My4uOTEwZWJkNWEgMTAwNjQ0CitpbmRleCAxNzUwN2VhOS4uYTA4ZDcxN2Ig
MTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTQyLDcg
KzQyLDggQEAgQUNfU1VCU1QoVkVSX0pTT04pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjcuOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9z
eXNzdGF0L3N5c3N0YXRfMTIuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXRfMTIuNy45LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjguMC5iYgppbmRleCBm
ZmM3YzBhYzM3Li45NjdlNjBmMmQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3lzc3RhdC9zeXNzdGF0XzEyLjcuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lz
c3RhdC9zeXNzdGF0XzEyLjguMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vc3lzc3RhdC9zeXNzdGF0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFz
dGVyO3RhZwogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hMjNhNzRi
M2Y0Y2FmOTYxNjIzMDc4OWQ5NDIxN2FjYiIKIAotU1JDUkVWID0gImI4Zjk4NzgwN2U3YzdiYTVj
MWIyY2E4YjdiMWU5ZDgwZTYxYmNlNmMiCitTUkNSRVYgPSAiZmZhYmU4MTc1YWE5YTdhYTA1NjM4
MGM2NmVkMzY0OGU1MGMxOTY3ZCIKIAogREVQRU5EUyArPSAiYmFzZS1wYXNzd2QgeHotbmF0aXZl
IgogCi0tIAoyLjQ3LjEKCg==

--===============4822822332396991390==--

