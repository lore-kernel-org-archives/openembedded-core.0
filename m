Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23ACC44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15161.1782798750828915248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YTEAlp22;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Aep4Cnez;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f17161166-6c6a8b95-a140-47d4-b0f0-33cf51d49f9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ChlsYEnf1/TMaL/8A/kkbEUX/CXEocW5tWjpu0JEaUE=;
	b=YTEAlp225RXh9GyZ9xP/GGtDKwUk4QZq614FWYuDG1gRsiBFQJvMSPfhQNXc3cfG
	BzImsYtpFLpHpFguz/17p3DPXOf7ukBv6iurLsKiTWjgnKBMfnMAPHahhI9tK6eTQz5
	JlyWFF4tw6/ljztVrByw8vCCGb7MXSmenwKBFqDA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ChlsYEnf1/TMaL/8A/kkbEUX/CXEocW5tWjpu0JEaUE=;
	b=Aep4CnezyjwKaPgWleEQddtVq+q14FOexhAQ7kf3aJd4wBwsThrjtt/ldT/WaUEs
	J8YCM8LAOoEWnlA0HQa/LLlE+jbt7I0p+ShlS65WJqD1J8NfGBCOVDSwQHDvP2B9+Dy
	Oe+GI6HvYMOFnBQnq4JEBeP/vO8fvIWyUjlYbMQs=
Content-Type: multipart/mixed; boundary="===============6676837822241168045=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] shared-mime-info: upgrading to 2.5.1 FAILED
Message-ID: <0101019f17161166-6c6a8b95-a140-47d4-b0f0-33cf51d49f9e-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239844

--===============6676837822241168045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *shared-mime-info* to *2.5.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-shared-mime-info-upgrade-2.4-2.5.1.patch
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
From 2eded098a63a47ccfe8d0cda5968535d0bdb7e47 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 30 Jun 2026 05:52:23 +0000
Subject: [PATCH] shared-mime-info: upgrade 2.4 -> 2.5.1

---
 .../{shared-mime-info_2.4.bb => shared-mime-info_2.5.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_2.4.bb => shared-mime-info_2.5.1.bb} (96%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
similarity index 96%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
index f307aca35d..fe05405a43 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "libxml2 glib-2.0 shared-mime-info-native xmlto-native"
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
            file://0002-Handle-build-with-older-versions-of-GCC.patch"
-SRCREV = "9a6d6b8e963935f145f3a1ef446552de6996dada"
+SRCREV = "fd8ab89c20093f1bfba8fa9e302ba584fffd0fd7"
 
 inherit meson pkgconfig gettext python3native mime
 
-- 
2.47.1


--===============6676837822241168045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-b0b96a6f58970c151af40419f21234b5a43c4e8a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:b0b96a6f58970c151af40419f21234b5a43c4e8a"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 220 Local 202 Mirrors 0 Missed 18 Current 420 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 527 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 640 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_spdx_setscene)
NOTE: Running task 811 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa)
NOTE: Running task 813 of 1576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa)
NOTE: Running task 815 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_write_config)
NOTE: Running task 816 of 1576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_write_config)
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_recipe_qa: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.15.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 567 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 568 of 640 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 591 of 640 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.15.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 935 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_fetch)
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 621 of 640 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1063 of 1576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 640 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.88.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1444 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_unpack)
NOTE: Running task 1472 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 1576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_unpack)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1552 of 1576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 1576 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1554 of 1576 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_patch: Failed
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1554 tasks of which 1541 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260630055207.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260630055207.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shared-mime-info-native/2.5.1/temp/log.do_patch.2505966
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/shared-mime-info/2.5.1/temp/log.do_patch.2506128
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: shared-mime-info-native-2.5.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shared-mime-info-native/2.5.1/sources/shared-mime-info-2.5.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shared-mime-info-native/2.5.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
patching file src/test-subclassing.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file src/test-subclassing.c
Patch 0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch can be reverse-applied

stderr: ')
ERROR: shared-mime-info-2.5.1-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/shared-mime-info/2.5.1/sources/shared-mime-info-2.5.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/shared-mime-info/2.5.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
patching file src/test-subclassing.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file src/test-subclassing.c
Patch 0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/shared-mime-info-native/2.5.1/temp/log.do_patch.2505966
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/shared-mime-info/2.5.1/temp/log.do_patch.2506128
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch) failed with exit code '1'

--===============6676837822241168045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shared-mime-info-upgrade-2.4-2.5.1.patch"

RnJvbSAyZWRlZDA5OGE2M2E0N2NjZmU4ZDBjZGE1OTY4NTM1ZDBiZGI3ZTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMzAgSnVuIDIwMjYgMDU6NTI6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
aGFyZWQtbWltZS1pbmZvOiB1cGdyYWRlIDIuNCAtPiAyLjUuMQoKLS0tCiAuLi4ve3NoYXJlZC1t
aW1lLWluZm9fMi40LmJiID0+IHNoYXJlZC1taW1lLWluZm9fMi41LjEuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9zaGFyZWQtbWltZS1pbmZvL3tzaGFyZWQtbWltZS1pbmZvXzIu
NC5iYiA9PiBzaGFyZWQtbWltZS1pbmZvXzIuNS4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L3NoYXJlZC1taW1lLWluZm8vc2hhcmVkLW1pbWUtaW5mb18yLjQu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zaGFyZWQtbWltZS1pbmZvL3NoYXJlZC1taW1lLWlu
Zm9fMi41LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFyZWQtbWltZS1pbmZvXzIuNC5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFyZWQtbWltZS1pbmZv
XzIuNS4xLmJiCmluZGV4IGYzMDdhY2EzNWQuLmZlMDU0MDVhNDMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L3NoYXJlZC1taW1lLWluZm8vc2hhcmVkLW1pbWUtaW5mb18yLjQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc2hhcmVkLW1pbWUtaW5mby9zaGFyZWQtbWltZS1p
bmZvXzIuNS4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIERFUEVORFMgPSAibGlieG1sMiBnbGliLTIu
MCBzaGFyZWQtbWltZS1pbmZvLW5hdGl2ZSB4bWx0by1uYXRpdmUiCiBTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveGRnL3NoYXJlZC1taW1lLWluZm8uZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtYnVpbGQt
d2l0aC1saWJ4bWwyLTIuMTIuMC1hbmQtY2xhbmctMTcucGF0Y2ggXAogICAgICAgICAgICBmaWxl
Oi8vMDAwMi1IYW5kbGUtYnVpbGQtd2l0aC1vbGRlci12ZXJzaW9ucy1vZi1HQ0MucGF0Y2giCi1T
UkNSRVYgPSAiOWE2ZDZiOGU5NjM5MzVmMTQ1ZjNhMWVmNDQ2NTUyZGU2OTk2ZGFkYSIKK1NSQ1JF
ViA9ICJmZDhhYjg5YzIwMDkzZjFiZmJhOGZhOWUzMDJiYTU4NGZmZmQwZmQ3IgogCiBpbmhlcml0
IG1lc29uIHBrZ2NvbmZpZyBnZXR0ZXh0IHB5dGhvbjNuYXRpdmUgbWltZQogCi0tIAoyLjQ3LjEK
Cg==

--===============6676837822241168045==--

