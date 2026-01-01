Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6203FEEB58D
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103049.1767267465864508282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uMWpmCK7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pJovlJH5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b7959a771-9fb95603-1d4b-416e-9c7d-d743e8115c0a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267477;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LyXZWaoiO6hRhQnLZUS4i/p0lDQftRf8l6F5NR4xEkM=;
	b=uMWpmCK7STeJgri4RTQpC04x1N0Fz99ILn7z4+U0QJCl2j1VVAfWYYGwOz0t9AO/
	zAPsSyyfikq0wPQj+2+mwC5mdbCZnQ8DozEYisUmb1DHLk6fPlCg/dPYfJkAJcE3Ysq
	pgUjPivf4V/OdVM3sASh6ikbqlVHO2u0HdsGL5oE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267477;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LyXZWaoiO6hRhQnLZUS4i/p0lDQftRf8l6F5NR4xEkM=;
	b=pJovlJH5AdxzuVnqmtMz8t+OLNnvAV8SKJMJ1qRuFDZ/yltWS5tQvRsPbNfpeIxM
	r4wPFdm8+cJ28qOvIUOJolcvqMZtQTJqRkwERRfWO/7lKBiRtR6gEWdUpn9gkJkjQF9
	9pMO1bIxj0n9ZNwvnvTwzjAmDf5HcsoIIi2PBZK4=
Content-Type: multipart/mixed; boundary="===============1195944189865484002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shadow: upgrading to 4.19.0 FAILED
Message-ID: <0101019b7959a771-9fb95603-1d4b-416e-9c7d-d743e8115c0a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228786

--===============1195944189865484002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shadow* to *4.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shadow-upgrade-4.18.0-4.19.0.patch
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
From 60f473fa88ec948583ace2d2ac14091ba2696030 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:44:26 +0000
Subject: [PATCH] shadow: upgrade 4.18.0 -> 4.19.0

---
 ...unexpected-open-failure-in-chroot-env.patch |  6 +++---
 .../shadow/files/disable_syslog.patch          | 18 +++++++++++++-----
 .../shadow/files/shadow-update-pam-conf.patch  |  5 +----
 .../{shadow_4.18.0.bb => shadow_4.19.0.bb}     |  5 ++++-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/shadow/{shadow_4.18.0.bb => shadow_4.19.0.bb} (97%)

diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 699269ed64..eb61968315 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From f7b765c022e4cad9140ac44712885c66e149abdc Mon Sep 17 00:00:00 2001
+From 942475fefe2486fe84c4e3e042a18ecba76336d2 Mon Sep 17 00:00:00 2001
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
index 7299a8e61c..ecb8d4960d 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -1,15 +1,23 @@
+From 7e1fe6f8e74fa0e0353467aa02c9973e3945652a Mon Sep 17 00:00:00 2001
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
index 318e2665c2..04b8b0189b 100644
--- a/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
+++ b/meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
@@ -1,4 +1,4 @@
-From eb17cd91d8e4d76ee95de9c0c9f4938ba2e3e82a Mon Sep 17 00:00:00 2001
+From b848b8adc41c83862feabf3c3cfc8c947438ffc9 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes-extended/shadow/shadow_4.19.0.bb
similarity index 97%
rename from meta/recipes-extended/shadow/shadow_4.18.0.bb
rename to meta/recipes-extended/shadow/shadow_4.19.0.bb
index d9a49d8ccf..621fdfb53b 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.0.bb
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
+SRC_URI[sha256sum] = "684da1612f46b2c2da6a4f220a801bcd5e28e0715a620d663c393df5b4c4333f"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
-- 
2.47.1


--===============1195944189865484002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-adec00e1f2f9814446fc027f64c792556bab201e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:adec00e1f2f9814446fc027f64c792556bab201e"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 237 Local 206 Mirrors 0 Missed 31 Current 621 (86% match, 96% complete)
done.
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 805 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package_setscene)
NOTE: Running setscene task 819 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_package_setscene)
NOTE: Running setscene task 822 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 831 of 858 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Started
NOTE: Running task 1581 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_recipe_qa)
NOTE: Running task 1703 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_recipe_qa)
NOTE: recipe shadow-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_recipe_qa: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2259 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_fetch)
NOTE: recipe shadow-4.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2260 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_fetch)
NOTE: recipe shadow-4.19.0-r0: task do_fetch: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.19.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-native-4.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_unpack)
NOTE: Running task 2262 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_unpack)
NOTE: Running task 2263 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.19.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_unpack: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch)
NOTE: recipe shadow-4.19.0-r0: task do_patch: Started
NOTE: recipe shadow-4.19.0-r0: task do_patch: Succeeded
NOTE: Running task 2265 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2266 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_populate_lic)
NOTE: recipe shadow-4.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.19.0-r0: task do_populate_lic: Started
NOTE: recipe shadow-native-4.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 2267 of 2429 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch)
NOTE: recipe shadow-native-4.19.0-r0: task do_patch: Started
NOTE: recipe shadow-4.19.0-r0: task do_populate_lic: Succeeded
NOTE: recipe shadow-4.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2305 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2335 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2336 of 2429 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_configure)
NOTE: recipe shadow-4.19.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-native-4.19.0-r0: task do_patch: Failed
NOTE: recipe shadow-4.19.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2385 tasks of which 2371 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101084405.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101084405.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/temp/log.do_patch.3699793
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: shadow-native-4.19.0-r0 do_patch: Applying patch 'commonio.c-fix-unexpected-open-failure-in-chroot-env.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/sources/shadow-4.19.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch commonio.c-fix-unexpected-open-failure-in-chroot-env.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shadow-native/4.19.0/temp/log.do_patch.3699793
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.0.bb:do_patch) failed with exit code '1'

--===============1195944189865484002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shadow-upgrade-4.18.0-4.19.0.patch"

RnJvbSA2MGY0NzNmYTg4ZWM5NDg1ODNhY2UyZDJhYzE0MDkxYmEyNjk2MDMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODo0NDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRvdzogdXBncmFkZSA0LjE4LjAgLT4gNC4xOS4wCgotLS0KIC4uLnVuZXhwZWN0ZWQtb3Blbi1m
YWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2ggfCAgNiArKystLS0KIC4uLi9zaGFkb3cvZmlsZXMv
ZGlzYWJsZV9zeXNsb2cucGF0Y2ggICAgICAgICAgfCAxOCArKysrKysrKysrKysrLS0tLS0KIC4u
Li9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaCAgfCAgNSArLS0tLQog
Li4uL3tzaGFkb3dfNC4xOC4wLmJiID0+IHNoYWRvd180LjE5LjAuYmJ9ICAgICB8ICA1ICsrKyst
CiA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cve3NoYWRvd180LjE4LjAuYmIgPT4gc2hh
ZG93XzQuMTkuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c2hhZG93L2ZpbGVzL2NvbW1vbmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNo
cm9vdC1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2NvbW1v
bmlvLmMtZml4LXVuZXhwZWN0ZWQtb3Blbi1mYWlsdXJlLWluLWNocm9vdC1lbnYucGF0Y2gKaW5k
ZXggNjk5MjY5ZWQ2NC4uZWI2MTk2ODMxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1p
bi1jaHJvb3QtZW52LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmls
ZXMvY29tbW9uaW8uYy1maXgtdW5leHBlY3RlZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjdiNzY1YzAyMmU0Y2FkOTE0MGFjNDQ3MTI4ODVj
NjZlMTQ5YWJkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTQyNDc1ZmVmZTI0ODZm
ZTg0YzRlM2UwNDJhMThlY2JhNzYzMzZkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTcgSnVsIDIwMTQg
MTU6NTM6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29tbW9uaW8uYy1maXgtdW5leHBlY3Rl
ZC1vcGVuLWZhaWx1cmUtaW4tY2hyb290LWVudgpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYi9jb21t
b25pby5jIGIvbGliL2NvbW1vbmlvLmMKLWluZGV4IDRkODNlODMuLjllZTBlMTMgMTAwNjQ0Citp
bmRleCAyYzZhMWEyLi4wMWUyZmM3IDEwMDY0NAogLS0tIGEvbGliL2NvbW1vbmlvLmMKICsrKyBi
L2xpYi9jb21tb25pby5jCi1AQCAtNjA0LDEwICs2MDQsMTggQEAgaW50IGNvbW1vbmlvX29wZW4g
KHN0cnVjdCBjb21tb25pb19kYiAqZGIsIGludCBtb2RlKQorQEAgLTU5OCwxMCArNTk4LDE4IEBA
IGNvbW1vbmlvX29wZW4oc3RydWN0IGNvbW1vbmlvX2RiICpkYiwgaW50IG1vZGUpCiAgCWRiLT5j
dXJzb3IgPSBOVUxMOwogIAlkYi0+Y2hhbmdlZCA9IGZhbHNlOwogIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvZmlsZXMvZGlzYWJsZV9zeXNsb2cucGF0Y2gKaW5k
ZXggNzI5OWE4ZTYxYy4uZWNiOGQ0OTYwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3NoYWRvdy9maWxlcy9kaXNhYmxlX3N5c2xvZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc2hhZG93L2ZpbGVzL2Rpc2FibGVfc3lzbG9nLnBhdGNoCkBAIC0xLDE1ICsxLDIz
IEBACitGcm9tIDdlMWZlNmY4ZTc0ZmEwZTAzNTM0NjdhYTAyYzk5NzNlMzk0NTY1MmEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IEZyaSwgMjggRmViIDIwMjUgMTA6MDk6NTYgKzAw
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2hhZG93LW5hdGl2ZTogRGlzYWJsZSBzeXNsb2cgdXNhZ2UK
KwogV2hlbiBidWlsZGluZyBpbWFnZXMgdXNpbmcgc2hhZG93LW5hdGl2ZSwgd2Ugc2hvdWxkbid0
IGJlIHNwYW1taW5nIHRoZSBob3N0J3MKIGxvZyB3aXRoIGxvdHMgb2Ygc3lzbG9nIG1lc3NhZ2Vz
IHdoaWNoIGFyZW4ndCByZWxhdmVudC4gRGlzYWJsZSBzeXNsb2cgdXNlCiBpbiB0aGUgbmF0aXZl
IGNhc2UuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbV291bGQgdXBzdHJlYW0g
YWNjZXB0IGEgY29uZmlndXJlIG9wdGlvbj9dCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KKy0tLQorIGxpYi9kZWZpbmVz
LmggfCA0ICsrKy0KKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiAKLUluZGV4OiBzaGFkb3ctNC4xNy4yL2xpYi9kZWZpbmVzLmgKLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0t
LSBzaGFkb3ctNC4xNy4yLm9yaWcvbGliL2RlZmluZXMuaAotKysrIHNoYWRvdy00LjE3LjIvbGli
L2RlZmluZXMuaAotQEAgLTg4LDcgKzg4LDkgQEAKK2RpZmYgLS1naXQgYS9saWIvZGVmaW5lcy5o
IGIvbGliL2RlZmluZXMuaAoraW5kZXggMDljMDk2NS4uNWM3MGYzMiAxMDA2NDQKKy0tLSBhL2xp
Yi9kZWZpbmVzLmgKKysrKyBiL2xpYi9kZWZpbmVzLmgKK0BAIC03NSw3ICs3NSw5IEBACiAgCiAg
LyogY2xlYW5lciB0aGFuIGxvdHMgb2YgI2lmZGVmcyBldmVyeXdoZXJlIC0gdXNlIHRoaXMgYXMg
Zm9sbG93czoKICAgICBTWVNMT0coKExPR19DUklULCAidXNlciAlcyBjcmFja2VkIHJvb3QiLCB1
c2VyKSk7ICovCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hhZG93L2ZpbGVz
L3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2hh
ZG93L2ZpbGVzL3NoYWRvdy11cGRhdGUtcGFtLWNvbmYucGF0Y2gKaW5kZXggMzE4ZTI2NjVjMi4u
MDRiOGIwMTg5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9maWxl
cy9zaGFkb3ctdXBkYXRlLXBhbS1jb25mLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zaGFkb3cvZmlsZXMvc2hhZG93LXVwZGF0ZS1wYW0tY29uZi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZWIxN2NkOTFkOGU0ZDc2ZWU5NWRlOWMwYzlmNDkzOGJhMmUzZTgyYSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjg0OGI4YWRjNDFjODM4NjJmZWFiZjNjM2NmYzhjOTQ3
NDM4ZmZjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEthbmcgS2FpIDxrYWkua2Fu
Z0B3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyMCBKdWwgMjAxMSAxOToxODoxNCArMDgwMAog
U3ViamVjdDogW1BBVENIXSBzaGFkb3c6IHVwZGF0ZSBwYW0gcmVsYXRlZCBjb25maWd1cmUgZmls
ZXMKQEAgLTEwNSw2ICsxMDUsMyBAQCBpbmRleCA4ZjQ5ZjVjLi5iMWYzNjVkIDEwMDY0NAogIGFj
Y291bnQJCXJlcXVpcmVkCXBhbV9wZXJtaXQuc28KIC1wYXNzd29yZAlpbmNsdWRlCQlzeXN0ZW0t
YXV0aAogK3Bhc3N3b3JkCWluY2x1ZGUJCWNvbW1vbi1wYXNzd29yZAotLS0gCi0yLjQzLjAKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xOC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xOS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hh
ZG93XzQuMTguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NoYWRvdy9zaGFk
b3dfNC4xOS4wLmJiCmluZGV4IGQ5YTQ5ZDhjY2YuLjYyMWZkZmI1M2IgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zaGFkb3cvc2hhZG93XzQuMTguMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc2hhZG93L3NoYWRvd180LjE5LjAuYmIKQEAgLTE0LDYgKzE0LDkgQEAg
R0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9zaGFkb3ctbWFpbnQvc2hhZG93
L3JlbGVhc2VzIgogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0v
JHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VD
T05GSUcnLCAncGFtJywgJyR7UEFNX1NSQ19VUkl9JywgJycsIGQpfSBcCiAgICAgICAgICAgIGZp
bGU6Ly91c2VyYWRkIFwKKyAgICAgICAgICAgZmlsZTovL2xvZ2luX2RlZnNfcGFtLnNlZCBcCisg
ICAgICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1p
bi1jaHJvb3QtZW52LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2Rpc2FibGVfc3lzbG9nLnBh
dGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiIFwK
QEAgLTI1LDcgKzI4LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAg
ICAgICAgIGZpbGU6Ly9jb21tb25pby5jLWZpeC11bmV4cGVjdGVkLW9wZW4tZmFpbHVyZS1pbi1j
aHJvb3QtZW52LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc2FibGVfc3lzbG9nLnBhdGNo
IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImFlNDg2Y2U0YzBiY2U1NWM0
MmQ3NmQ4NDc4ZTQyOGM0MTU4NmYxZGEyZjg5ZmJmNTIyODI0M2ZiNGQ4NDlkYjQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNjg0ZGExNjEyZjQ2YjJjMmRhNmE0ZjIyMGE4MDFiY2Q1ZTI4ZTA3MTVh
NjIwZDY2M2MzOTNkZjViNGM0MzMzZiIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
L3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKICMgQWRkaXRpb25hbCBQb2xpY3kgZmls
ZXMgZm9yIFBBTQotLSAKMi40Ny4xCgo=

--===============1195944189865484002==--

