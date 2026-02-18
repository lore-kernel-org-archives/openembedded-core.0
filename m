Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7B3C531EA
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1385.1771440096850223046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nSx/l/Qn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kKmdT5pZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720ef362-cc74c846-e4ff-4b66-8184-04b50f17383d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q4lHzuoE4jEqufX1gEdM0zD4wsGxxL0kRXCU3S3QLPk=;
	b=nSx/l/Qn/jwYwppm0KROBcyu5pBYPx8MX8o5TGT1oI9n/gcyG3v5bC5bpx1fgeSG
	cBhQTtKcpBuwOQglzkWrnWACfFqOJKI88T9ultWnN4CYh6+ltT0j8ntvS/LubdhFCSI
	GRfiv52Xq/7Y1bCpz6uMelViXuaKMAY4RRxVpLtU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440108;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q4lHzuoE4jEqufX1gEdM0zD4wsGxxL0kRXCU3S3QLPk=;
	b=kKmdT5pZGE7gjtT3MuZmU+b3ScurYuzDhiU1Zp0S5wsgcBXYcXAa1bvhWfFW7Rph
	KX4SR3tx19tk0Pt92mQxKyaqKdfipZ2C+LuO3Kz60D09pKd5PkuMBSN+6NT96SS8wX/
	HZniJkoqJ0VJt04+htvMtp3xEVnr3omTPrVo6X7A=
Content-Type: multipart/mixed; boundary="===============9187334618925189451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.19.3 FAILED
Message-ID: <0101019c720ef362-cc74c846-e4ff-4b66-8184-04b50f17383d-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231375

--===============9187334618925189451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.19.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.18.0-4.19.3.patch
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
From 9c4291000d0dc598611eb0bb4318424b4c259888 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 14:46:14 +0000
Subject: [PATCH] shadow: upgrade 4.18.0 -> 4.19.3

---
 ...unexpected-open-failure-in-chroot-env.patch |  6 +++---
 .../shadow/files/disable_syslog.patch          | 18 +++++++++++++-----
 .../shadow/files/shadow-update-pam-conf.patch  |  5 +----
 .../{shadow_4.18.0.bb => shadow_4.19.3.bb}     |  5 ++++-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.3.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 699269ed64..04cbd6ff50 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
+From c08fc27a618ae606dd2d07e6ac8388c818185f56 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 4d83e83..9ee0e13 100644
+index 2c6a1a2..01e2fc7 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -598,10 +598,18 @@ commonio_open(struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61c..0623dedb79 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -1,15 +1,23 @@
+From d65059e17f86d592d9ccc5bffc80324b7c919332 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 28 Feb 2025 10:09:56 +0000
+Subject: [PATCH] shadow-native: Disable syslog usage
+
 When building images using shadow-native, we shouldn't be spamming the host's
 log with lots of syslog messages which aren't relavent. Disable syslog use
 in the native case.
 
 Upstream-Status: Inappropriate [Would upstream accept a configure option?]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ lib/defines.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
-Index: shadow-4.17.2/lib/defines.h
-===================================================================
---- shadow-4.17.2.orig/lib/defines.h
-+++ shadow-4.17.2/lib/defines.h
-@@ -88,7 +88,9 @@
+diff --git a/lib/defines.h b/lib/defines.h
+index 09c0965..5c70f32 100644
+--- a/lib/defines.h
++++ b/lib/defines.h
+@@ -75,7 +75,9 @@
  
  /* cleaner than lots of #ifdefs everywhere - use this as follows:
     SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 318e2665c2..ecf2cee01f 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
+From 7438284fcc2bdd7e07eaed0829628b826a7fdbbf Mon Sep 17 00:00:00 2001
 From: Kang Kai <kai.kang@windriver.com>
 Date: Wed, 20 Jul 2011 19:18:14 +0800
 Subject: [PATCH] shadow: update pam related configure files
@@ -105,6 +105,3 @@ index 8f49f5c..b1f365d 100644
  account		required	pam_permit.so
 -password	include		system-auth
 +password	include		common-password
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.3.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.3.bb
index d9a49d8ccf..0ee0ca7ba7 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.3.bb
@@ -14,6 +14,9 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://login_defs_pam.sed \
+           file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://disable_syslog.patch \
            "
 
 SRC_URI:append:class-target = " \
@@ -25,7 +28,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
            "
-SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
+SRC_URI[sha256sum] = "3bd304a2f3936a7bd31a29aa59e61a1873d15fd4f3e041b0175d2b91e0b25c5d"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============9187334618925189451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-cbe4cd727b4cadfe090ad83b8b12f51096c88e86"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:cbe4cd727b4cadfe090ad83b8b12f51096c88e86"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 229 Local 198 Mirrors 0 Missed 31 Current 616 (86% match, 96% complete)
done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 791 of 845 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 845 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_package_setscene)
NOTE: Running setscene task 814 of 845 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 845 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-securetty-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 844 of 845 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Started
NOTE: Running task 1586 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_recipe_qa)
NOTE: Running task 1704 of 2398 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_recipe_qa)
NOTE: recipe shadow-4.19.3-r0: task do_recipe_qa: Started
NOTE: recipe shadow-native-4.19.3-r0: task do_recipe_qa: Started
NOTE: recipe shadow-4.19.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_recipe_qa unihash changed to 8f310f66e9ee331263be0f6f8e429bdd99f8488fd3051bfd926ba171fcd6fa47
NOTE: Running task 2228 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_fetch)
NOTE: recipe shadow-native-4.19.3-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_recipe_qa unihash changed to 75274f9b5de19bdc0f264b7164a2e6a8dbcaf33ade4aa962dffe34d587fccbbb
NOTE: recipe shadow-4.19.3-r0: task do_fetch: Started
NOTE: recipe shadow-4.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 2229 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_unpack)
NOTE: Running task 2230 of 2398 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_fetch)
NOTE: recipe shadow-4.19.3-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.3-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 2231 of 2398 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_unpack)
NOTE: Running task 2232 of 2398 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-native-4.19.3-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.19.3-r0: task do_unpack: Succeeded
NOTE: recipe shadow-native-4.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2233 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_patch)
NOTE: recipe shadow-4.19.3-r0: task do_patch: Started
NOTE: recipe shadow-4.19.3-r0: task do_patch: Succeeded
NOTE: Running task 2234 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2235 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_populate_lic)
NOTE: recipe shadow-4.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.19.3-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2398 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_patch)
NOTE: recipe shadow-native-4.19.3-r0: task do_patch: Started
NOTE: recipe shadow-4.19.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_populate_lic unihash changed to 7fe8ce697cdb709a8eb5e89804aad09eeea2e6f5df7b7f3c71d6be48ffd03251
NOTE: recipe shadow-4.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_deploy_source_date_epoch unihash changed to b44ac9f892a9868025764f212c6bd86121b89cfdf7537d9c9fd5af718c9bee5f
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 839 of 845 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2274 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2304 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.19.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2305 of 2398 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_configure)
NOTE: recipe shadow-4.19.3-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-native-4.19.3-r0: task do_patch: Failed
NOTE: recipe shadow-4.19.3-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2354 tasks of which 2340 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218144552.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218144552.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.3/temp/log.do_patch.993117
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.19.3-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.3/sources/shadow-4.19.3'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.3/temp/log.do_patch.993117
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.3.bb:do_patch) failed with exit code '1'

--===============9187334618925189451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.18.0-4.19.3.patch"

RnJvbSA5YzQyOTEwMDBkMGRjNTk4NjExZWIwYmI0MzE4NDI0YjRjMjU5ODg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTQ6NDY6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFkb3c6IHVwZ3JhZGUgNC4xOC4wIC0+IDQuMTkuMwoKLS0tCiAuLi51bmV4cGVjdGVkLW9wZW4t
ZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vc2hhZG93L2ZpbGVz
L2Rpc2FibGVfc3lzbG9nLnBhdGNoICAgICAgICAgIHwgMTggKysrKysrKysrKysrKy0tLS0tCiAu
Li4vc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggIHwgIDUgKy0tLS0K
IC4uLi97c2hhZG93XzQuMTguMC5iYiA9PiBzaGFkb3dfNC4xOS4zLmJifSAgICAgfCAgNSArKysr
LQogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3tzaGFkb3dfNC4xOC4wLmJiID0+IHNo
YWRvd180LjE5LjMuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9jb21t
b25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1jaHJvb3QtZW52LnBhdGNoCmlu
ZGV4IDY5OTI2OWVkNjQuLjA0Y2JkNmZmNTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zaGFkb3cvZmlsZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUt
aW4tY2hyb290LWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2Zp
bGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY3Yjc2NWMwMjJlNGNhZDkxNDBhYzQ0NzEyODg1
YzY2ZTE0OWFiZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGMwOGZjMjdhNjE4YWU2
MDZkZDJkMDdlNmFjODM4OGM4MTgxODVmNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE3IEp1bCAyMDE0
IDE1OjUzOjM0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbW1vbmlvLmMtZml4LXVuZXhwZWN0
ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvY29t
bW9uaW8uYyBiL2xpYi9jb21tb25pby5jCi1pbmRleCA0ZDgzZTgzLi45ZWUwZTEzIDEwMDY0NAor
aW5kZXggMmM2YTFhMi4uMDFlMmZjNyAxMDA2NDQKIC0tLSBhL2xpYi9jb21tb25pby5jCiArKysg
Yi9saWIvY29tbW9uaW8uYwotQEAgLTYwNCwxMCArNjA0LDE4IEBAIGludCBjb21tb25pb19vcGVu
IChzdHJ1Y3QgY29tbW9uaW9fZGIgKmRiLCBpbnQgbW9kZSkKK0BAIC01OTgsMTAgKzU5OCwxOCBA
QCBjb21tb25pb19vcGVuKHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2RlKQogIAlkYi0+
Y3Vyc29yID0gTlVMTDsKICAJZGItPmNoYW5nZWQgPSBmYWxzZTsKICAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNoCmlu
ZGV4IDcyOTlhOGU2MWMuLjA2MjNkZWRiNzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaApAQCAtMSwxNSArMSwy
MyBAQAorRnJvbSBkNjUwNTllMTdmODZkNTkyZDljY2M1YmZmYzgwMzI0YjdjOTE5MzMyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBGcmksIDI4IEZlYiAyMDI1IDEwOjA5OjU2ICsw
MDAwCitTdWJqZWN0OiBbUEFUQ0hdIHNoYWRvdy1uYXRpdmU6IERpc2FibGUgc3lzbG9nIHVzYWdl
CisKIFdoZW4gYnVpbGRpbmcgaW1hZ2VzIHVzaW5nIHNoYWRvdy1uYXRpdmUsIHdlIHNob3VsZG4n
dCBiZSBzcGFtbWluZyB0aGUgaG9zdCdzCiBsb2cgd2l0aCBsb3RzIG9mIHN5c2xvZyBtZXNzYWdl
cyB3aGljaCBhcmVuJ3QgcmVsYXZlbnQuIERpc2FibGUgc3lzbG9nIHVzZQogaW4gdGhlIG5hdGl2
ZSBjYXNlLgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW1dvdWxkIHVwc3RyZWFt
IGFjY2VwdCBhIGNvbmZpZ3VyZSBvcHRpb24/XQogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CistLS0KKyBsaWIvZGVmaW5l
cy5oIHwgNCArKystCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQogCi1JbmRleDogc2hhZG93LTQuMTcuMi9saWIvZGVmaW5lcy5oCi09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0t
LS0gc2hhZG93LTQuMTcuMi5vcmlnL2xpYi9kZWZpbmVzLmgKLSsrKyBzaGFkb3ctNC4xNy4yL2xp
Yi9kZWZpbmVzLmgKLUBAIC04OCw3ICs4OCw5IEBACitkaWZmIC0tZ2l0IGEvbGliL2RlZmluZXMu
aCBiL2xpYi9kZWZpbmVzLmgKK2luZGV4IDA5YzA5NjUuLjVjNzBmMzIgMTAwNjQ0CistLS0gYS9s
aWIvZGVmaW5lcy5oCisrKysgYi9saWIvZGVmaW5lcy5oCitAQCAtNzUsNyArNzUsOSBAQAogIAog
IC8qIGNsZWFuZXIgdGhhbiBsb3RzIG9mICNpZmRlZnMgZXZlcnl3aGVyZSAtIHVzZSB0aGlzIGFz
IGZvbGxvd3M6CiAgICAgU1lTTE9HKChMT0dfQ1JJVCwgInVzZXIgJXMgY3JhY2tlZCByb290Iiwg
dXNlcikpOyAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxl
cy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3No
YWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCmluZGV4IDMxOGUyNjY1YzIu
LmVjZjJjZWUwMWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmls
ZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc2hhZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGViMTdjZDkxZDhlNGQ3NmVlOTVkZTljMGM5ZjQ5MzhiYTJlM2U4MmEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc0MzgyODRmY2MyYmRkN2UwN2VhZWQwODI5NjI4Yjgy
NmE3ZmRiYmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYW5nIEthaSA8a2FpLmth
bmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjAgSnVsIDIwMTEgMTk6MTg6MTQgKzA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gc2hhZG93OiB1cGRhdGUgcGFtIHJlbGF0ZWQgY29uZmlndXJlIGZp
bGVzCkBAIC0xMDUsNiArMTA1LDMgQEAgaW5kZXggOGY0OWY1Yy4uYjFmMzY1ZCAxMDA2NDQKICBh
Y2NvdW50CQlyZXF1aXJlZAlwYW1fcGVybWl0LnNvCiAtcGFzc3dvcmQJaW5jbHVkZQkJc3lzdGVt
LWF1dGgKICtwYXNzd29yZAlpbmNsdWRlCQljb21tb24tcGFzc3dvcmQKLS0tIAotMi40My4wCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTguMC5i
YiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTkuMy5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3No
YWRvd180LjE4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMTkuMy5iYgppbmRleCBkOWE0OWQ4Y2NmLi4wZWUwY2E3YmE3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE4LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xOS4zLmJiCkBAIC0xNCw2ICsxNCw5IEBA
IEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hhZG93LW1haW50L3NoYWRv
dy9yZWxlYXNlcyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9
LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdF
Q09ORklHJywgJ3BhbScsICcke1BBTV9TUkNfVVJJfScsICcnLCBkKX0gXAogICAgICAgICAgICBm
aWxlOi8vdXNlcmFkZCBcCisgICAgICAgICAgIGZpbGU6Ly9sb2dpbl9kZWZzX3BhbS5zZWQgXAor
ICAgICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUt
aW4tY2hyb290LWVudi5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9kaXNhYmxlX3N5c2xvZy5w
YXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBc
CkBAIC0yNSw3ICsyOCw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAg
ICAgICAgICBmaWxlOi8vY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4t
Y2hyb290LWVudi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXNhYmxlX3N5c2xvZy5wYXRj
aCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZTQ4NmNlNGMwYmNlNTVj
NDJkNzZkODQ3OGU0MjhjNDE1ODZmMWRhMmY4OWZiZjUyMjgyNDNmYjRkODQ5ZGI0IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjNiZDMwNGEyZjM5MzZhN2JkMzFhMjlhYTU5ZTYxYTE4NzNkMTVmZDRm
M2UwNDFiMDE3NWQyYjkxZTBiMjVjNWQiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNl
cy90YWcvdj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgogCiAjIEFkZGl0aW9uYWwgUG9saWN5IGZp
bGVzIGZvciBQQU0KLS0gCjIuNDcuMQoK

--===============9187334618925189451==--

