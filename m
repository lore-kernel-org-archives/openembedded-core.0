Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9304DC87FC3
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1413.1751386808187201249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ds5d3n4A;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BYfwodAW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010197c6ca1846-d231626a-6b9a-4772-9f64-1a80f585f01e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vDXY0WF0u/HDK78HVvpoIUGnrTxYo7VuuLDnJMkrF7M=;
	b=ds5d3n4A4YFFZNl3TtZuE3rOd3BCvR+4ouwFJVgf0gDehmICZ0l5dtpVj51/HTyQ
	jVlZAyndOe8kELJoLhuMPKJKhhWS+VKoo+nEzkuAbrdwGWVPhouVbe3TJG2Fd2nhkcM
	x40ZvnkGIHrHsqD8Mgnu/tjfwKkaXV+0PAsMOPW0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vDXY0WF0u/HDK78HVvpoIUGnrTxYo7VuuLDnJMkrF7M=;
	b=BYfwodAWSCE7UrL6N0/+JeFJlr/R8g3p071RigqGBfYDOfH9FXH87q4RTJzT+SSd
	Z5E+XbiSVhZEvg5TFmtf8EiKcTjhNZJcrVGjmK1n/WtZyePZmYmXcv2EKg+QLvJxo+o
	1SeSWTtvQ3WGxyMYrxwhHQsywLXxpFsX1fUz0ev4=
Content-Type: multipart/mixed; boundary="===============5202165132033558154=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.18.0 FAILED
Message-ID: <01010197c6ca1846-d231626a-6b9a-4772-9f64-1a80f585f01e-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219665

--===============5202165132033558154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.17.4-4.18.0.patch
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
From 89df6eac73a1ed73fd94e57cb03aa623593d8a32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 11:24:30 +0000
Subject: [PATCH] shadow: upgrade 4.17.4 -> 4.18.0

---
 ...unexpected-open-failure-in-chroot-env.patch |  6 +++---
 .../shadow/files/disable_syslog.patch          | 18 +++++++++++++-----
 .../shadow/files/shadow-update-pam-conf.patch  |  5 +----
 .../{shadow_4.17.4.bb => shadow_4.18.0.bb}     |  5 ++++-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.17.4.bb => shadow_4.18.0.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 699269ed64..980675c307 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
+From 60d946aaa43bdebc60a1775a83116ad6b8b6f818 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 4d83e83..9ee0e13 100644
+index 7304ec0..77dd870 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -604,10 +604,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -600,10 +600,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61c..24a38bb0ae 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -1,15 +1,23 @@
+From 41f90eb5c7c2b0669090e0a60592cfdd5fcdd5c2 Mon Sep 17 00:00:00 2001
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
+index 8673a09..5b26806 100644
+--- a/lib/defines.h
++++ b/lib/defines.h
+@@ -91,7 +91,9 @@
  
  /* cleaner than lots of #ifdefs everywhere - use this as follows:
     SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
diff --git a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
index 318e2665c2..4e09db8f34 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
+From 88ab9bb7fe2b6bc63e6683bcd56d5bac853403fa Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/shadow/shadow_4.17.4.bb b/meta/recipes-extended/shadow/shadow_4.18.0.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.17.4.bb
rename to meta/recipes-extended/shadow/shadow_4.18.0.bb
index 73942888b6..d774c2f90a 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
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
-SRC_URI[sha256sum] = "0a288c251f339846af6bdfd4447b196153204deba42407bce5b0917998322e9b"
+SRC_URI[sha256sum] = "ae486ce4c0bce55c42d76d8478e428c41586f1da2f89fbf5228243fb4d849db4"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============5202165132033558154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-90dcdc0d355a3fa236b23ef4c2d78036abc2266b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:90dcdc0d355a3fa236b23ef4c2d78036abc2266b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 437 Local 405 Mirrors 0 Missed 32 Current 412 (92% match, 96% complete)
Removing 8 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 596 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_package_setscene)
NOTE: Running setscene task 605 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_package_setscene)
NOTE: Running setscene task 611 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 621 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 638 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 701 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 726 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 729 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 735 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 748 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 759 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 764 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 771 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 797 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1211 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 818 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 820 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running task 1289 of 2415 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-native-4.18.0-r0: task do_recipe_qa: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1423 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 1426 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1434 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 1464 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-native-4.18.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1484 of 2415 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Started
NOTE: Running task 1526 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1527 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_fetch)
NOTE: Running task 1540 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_warn_musl)
NOTE: Running task 1541 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_write_config)
NOTE: recipe shadow-native-4.18.0-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Started
NOTE: Running task 1585 of 2415 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1586 of 2415 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1597 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Started
NOTE: recipe systemd-1_257.6-r0: task do_warn_musl: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_257.6-r0: task do_fetch: Succeeded
NOTE: Running task 1612 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_unpack)
NOTE: recipe systemd-1_257.6-r0: task do_write_config: Succeeded
NOTE: recipe shadow-native-4.18.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1613 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_unpack)
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Started
NOTE: recipe procps-4.0.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-native-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 43a5eed45be5f03da4b85c3553d0f54d484743ea1bf86e066be2f808a536e5e1
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1614 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1616 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/procps/procps_4.0.5.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1617 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe procps-4.0.5-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 823 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1624 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1625 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_lic)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1626 of 2415 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe systemd-1_257.6-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_patch)
NOTE: recipe shadow-native-4.18.0-r0: task do_patch: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_257.6-r0: task do_patch: Started
NOTE: recipe systemd-1_257.6-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 824 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 830 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 849 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2062 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2347 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2371 of 2415 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe shadow-native-4.18.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2371 tasks of which 2345 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701112405.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701112405.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.18.0/temp/log.do_patch.1444833
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.18.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.18.0/sources/shadow-4.18.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.18.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.18.0/temp/log.do_patch.1444833
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch) failed with exit code '1'

--===============5202165132033558154==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.17.4-4.18.0.patch"

RnJvbSA4OWRmNmVhYzczYTFlZDczZmQ5NGU1N2NiMDNhYTYyMzU5M2Q4YTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMToyNDozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE3LjQgLT4gNC4xOC4wCgotLS0KIC4uLnVuZXhwZWN0ZWQtb3Blbi1m
YWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggfCAgNiArKystLS0KIC4uLi9zaGFkb3cvZmlsZXMv
ZGlzYWJsZV9zeXNsb2cucGF0Y2ggICAgICAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KIC4u
Li9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCAgfCAgNSArLS0tLQog
Li4uL3tzaGFkb3dfNC4xNy40LmJiID0+IHNoYWRvd180LjE4LjAuYmJ9ICAgICB8ICA1ICsrKyst
CiA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cve3NoYWRvd180LjE3LjQuYmIgPT4gc2hh
ZG93XzQuMTguMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNo
cm9vdC1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1v
bmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKaW5k
ZXggNjk5MjY5ZWQ2NC4uOTgwNjc1YzMwNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1p
bi1jaHJvb3QtZW52LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmls
ZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjdiNzY1YzAyMmU0Y2FkOTE0MGFjNDQ3MTI4ODVj
NjZlMTQ5YWJkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjBkOTQ2YWFhNDNiZGVi
YzYwYTE3NzVhODMxMTZhZDZiOGI2ZjgxOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTcgSnVsIDIwMTQg
MTU6NTM6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29tbW9uaW8uYy1maXgtdW5leHBlY3Rl
ZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudgpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYi9jb21t
b25pby5jIGIvbGliL2NvbW1vbmlvLmMKLWluZGV4IDRkODNlODMuLjllZTBlMTMgMTAwNjQ0Citp
bmRleCA3MzA0ZWMwLi43N2RkODcwIDEwMDY0NAogLS0tIGEvbGliL2NvbW1vbmlvLmMKICsrKyBi
L2xpYi9jb21tb25pby5jCi1AQCAtNjA0LDEwICs2MDQsMTggQEAgaW50IGNvbW1vbmlvX29wZW4g
KHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2RlKQorQEAgLTYwMCwxMCArNjAwLDE4IEBA
IGludCBjb21tb25pb19vcGVuIChzdHJ1Y3QgY29tbW9uaW9fZGIgKmRiLCBpbnQgbW9kZSkKICAJ
ZGItPmN1cnNvciA9IE5VTEw7CiAgCWRiLT5jaGFuZ2VkID0gZmFsc2U7CiAgCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRj
aAppbmRleCA3Mjk5YThlNjFjLi4yNGEzOGJiMGFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2gKQEAgLTEsMTUg
KzEsMjMgQEAKK0Zyb20gNDFmOTBlYjVjN2MyYjA2NjkwOTBlMGE2MDU5MmNmZGQ1ZmNkZDVjMiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0ZTogRnJpLCAyOCBGZWIgMjAyNSAxMDowOTo1
NiArMDAwMAorU3ViamVjdDogW1BBVENIXSBzaGFkb3ctbmF0aXZlOiBEaXNhYmxlIHN5c2xvZyB1
c2FnZQorCiBXaGVuIGJ1aWxkaW5nIGltYWdlcyB1c2luZyBzaGFkb3ctbmF0aXZlLCB3ZSBzaG91
bGRuJ3QgYmUgc3BhbW1pbmcgdGhlIGhvc3QncwogbG9nIHdpdGggbG90cyBvZiBzeXNsb2cgbWVz
c2FnZXMgd2hpY2ggYXJlbid0IHJlbGF2ZW50LiBEaXNhYmxlIHN5c2xvZyB1c2UKIGluIHRoZSBu
YXRpdmUgY2FzZS4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtXb3VsZCB1cHN0
cmVhbSBhY2NlcHQgYSBjb25maWd1cmUgb3B0aW9uP10KIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQg
UHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorLS0tCisgbGliL2Rl
ZmluZXMuaCB8IDQgKysrLQorIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKIAotSW5kZXg6IHNoYWRvdy00LjE3LjIvbGliL2RlZmluZXMuaAotPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotLS0tIHNoYWRvdy00LjE3LjIub3JpZy9saWIvZGVmaW5lcy5oCi0rKysgc2hhZG93LTQuMTcu
Mi9saWIvZGVmaW5lcy5oCi1AQCAtODgsNyArODgsOSBAQAorZGlmZiAtLWdpdCBhL2xpYi9kZWZp
bmVzLmggYi9saWIvZGVmaW5lcy5oCitpbmRleCA4NjczYTA5Li41YjI2ODA2IDEwMDY0NAorLS0t
IGEvbGliL2RlZmluZXMuaAorKysrIGIvbGliL2RlZmluZXMuaAorQEAgLTkxLDcgKzkxLDkgQEAK
ICAKICAvKiBjbGVhbmVyIHRoYW4gbG90cyBvZiAjaWZkZWZzIGV2ZXJ5d2hlcmUgLSB1c2UgdGhp
cyBhcyBmb2xsb3dzOgogICAgIFNZU0xPRygoTE9HX0NSSVQsICJ1c2VyICVzIGNyYWNrZWQgcm9v
dCIsIHVzZXIpKTsgKi8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cv
ZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaAppbmRleCAzMThlMjY2
NWMyLi40ZTA5ZGI4ZjM0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93
L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3NoYWRvdy9maWxlcy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBlYjE3Y2Q5MWQ4ZTRkNzZlZTk1ZGU5YzBjOWY0OTM4YmEyZTNlODJhIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4OGFiOWJiN2ZlMmI2YmM2M2U2NjgzYmNkNTZk
NWJhYzg1MzQwM2ZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FuZyBLYWkgPGth
aS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDIwIEp1bCAyMDExIDE5OjE4OjE0ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNoYWRvdzogdXBkYXRlIHBhbSByZWxhdGVkIGNvbmZpZ3Vy
ZSBmaWxlcwpAQCAtMTA1LDYgKzEwNSwzIEBAIGluZGV4IDhmNDlmNWMuLmIxZjM2NWQgMTAwNjQ0
CiAgYWNjb3VudAkJcmVxdWlyZWQJcGFtX3Blcm1pdC5zbwogLXBhc3N3b3JkCWluY2x1ZGUJCXN5
c3RlbS1hdXRoCiArcGFzc3dvcmQJaW5jbHVkZQkJY29tbW9uLXBhc3N3b3JkCi0tLSAKLTIuNDMu
MAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE3
LjQuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE4LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRv
dy9zaGFkb3dfNC4xNy40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93
L3NoYWRvd180LjE4LjAuYmIKaW5kZXggNzM5NDI4ODhiNi4uZDc3NGMyZjkwYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xNy40LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTguMC5iYgpAQCAtMTQsNiArMTQs
OSBAQCBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NoYWRvdy1tYWludC9z
aGFkb3cvcmVsZWFzZXMiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8k
e1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnUEFD
S0FHRUNPTkZJRycsICdwYW0nLCAnJHtQQU1fU1JDX1VSSX0nLCAnJywgZCl9IFwKICAgICAgICAg
ICAgZmlsZTovL3VzZXJhZGQgXAorICAgICAgICAgICBmaWxlOi8vbG9naW5fZGVmc19wYW0uc2Vk
IFwKKyAgICAgICAgICAgZmlsZTovL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWls
dXJlLWluLWNocm9vdC1lbnYucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vZGlzYWJsZV9zeXNs
b2cucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdldCA9
ICIgXApAQCAtMjUsNyArMjgsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwK
ICAgICAgICAgICAgZmlsZTovL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJl
LWluLWNocm9vdC1lbnYucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzYWJsZV9zeXNsb2cu
cGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGEyODhjMjUxZjMz
OTg0NmFmNmJkZmQ0NDQ3YjE5NjE1MzIwNGRlYmE0MjQwN2JjZTViMDkxNzk5ODMyMmU5YiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJhZTQ4NmNlNGMwYmNlNTVjNDJkNzZkODQ3OGU0MjhjNDE1ODZm
MWRhMmY4OWZiZjUyMjgyNDNmYjRkODQ5ZGI0IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVs
ZWFzZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKIAogIyBBZGRpdGlvbmFsIFBvbGlj
eSBmaWxlcyBmb3IgUEFNCi0tIAoyLjQ3LjEKCg==

--===============5202165132033558154==--

