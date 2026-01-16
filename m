Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB949D47CCD
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1430.1768526746331128762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gle45zJG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kiDFWTce;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc468b86a-b27fa0da-1c3a-44c8-91e9-86227bf8a96d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526756;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GnXCxDh/RMF3U6C1MsKXTYI1cyNaksZqAMs44UbpFI0=;
	b=gle45zJGMrF4Ph3ecE9L7puub3JjTlt9ymAhTMU3oDWfWzWiSmAt0iAcyq1hJYcb
	zKuyKBgvoQxQ4oHoN4mrymgYGig5qyKOCiggKv1LVWAO7Mk/rtGPiQnoFmF0U6xOK+b
	F0FPqozvRshL5G0v4bxwB5337lNuEPu/RDRVfVzs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526756;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GnXCxDh/RMF3U6C1MsKXTYI1cyNaksZqAMs44UbpFI0=;
	b=kiDFWTceFi+dkCXYOpdDeVg7Q+4ma0N4aEojp73n9GTzW78luLnNG3VpoelWY4MN
	d1vD/lQEqVxFFtLkJSK8WnVD6zHlHiu2N+2rK2++cxbOvpaed6do8slZE71rvG0DuXT
	1NNKnnRPWSmLkFz4wzzbHTdflmngO7vv8McS39Hk=
Content-Type: multipart/mixed; boundary="===============5562080972213247197=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-devtools: upgrading to 1.26.10 SUCCEEDED
Message-ID: <0101019bc468b86a-b27fa0da-1c3a-44c8-91e9-86227bf8a96d-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229499

--===============5562080972213247197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.26.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.26.9-1.26.10.patch
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
From bd7acd4507baac5034ffdb9b9efa1ca9ae78c64c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:26:04 +0000
Subject: [PATCH] gst-devtools: upgrade 1.26.9 -> 1.26.10

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.26.9.bb => gst-devtools_1.26.10.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.9.bb => gst-devtools_1.26.10.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..666aa8758e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From f55cf2c1a4860860fb62a35f1b240cc2cef70c9b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb
index 44c579f2a4..7021460374 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "55c7adaf9eee7a5219d44b736c401a947ebb5d0130c78e900017a6812026b567"
+SRC_URI[sha256sum] = "abc5ee63319901212834c2aebe4842fa68f8412424d97f53e6f4cda0bbb2e254"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============5562080972213247197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1956 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-adb6f3dbd67dd76c1402d3717d4b5c0af34eee07"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:adb6f3dbd67dd76c1402d3717d4b5c0af34eee07"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 594 Local 579 Mirrors 0 Missed 15 Current 319 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 350 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 371 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 415 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 423 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1135 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: Running task 1156 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_write_config)
NOTE: recipe git-2.52.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.52.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.52.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.52.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.52.0-r0: task do_package_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_write_config: Started
NOTE: recipe git-2.52.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1212 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_fetch)
NOTE: recipe git-2.52.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.10-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 428 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 441 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-devtools-1.26.10-r0: task do_fetch: Started
NOTE: recipe git-2.52.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.10-r0: task do_fetch: Succeeded
NOTE: Running task 1258 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_unpack)
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.52.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe git-2.52.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 483 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1260 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: recipe gst-devtools-1.26.10-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx_setscene)
NOTE: recipe git-2.52.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1261 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_unpack: Succeeded
NOTE: recipe git-2.52.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1262 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_patch)
NOTE: Running setscene task 490 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_patch: Started
NOTE: recipe git-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 510 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 511 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-devtools-1.26.10-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 513 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 515 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 517 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 519 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/harfbuzz/12.2.0/temp/log.do_packagedata_setscene.2811565
NOTE: Running setscene task 586 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 588 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 594 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 595 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_package_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1289 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: Running setscene task 638 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 650 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 651 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 654 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 657 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 658 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1400 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 664 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running task 1401 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_package_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_populate_lic unihash changed to ad8f4e505c94f15854e14c89e4c5a5224229bc4e33aff6f6891c4b1cbc871ff0
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_deploy_source_date_epoch unihash changed to 54e8ed6249879caf884653cefec1c409bde13c2fc8c779fd0716d5493bc99383
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-12.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 680 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe icu-78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 700 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.53-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 756 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.53-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.53-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 778 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xorgproto/2024.1/temp/log.do_packagedata_setscene.2814376
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 788 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 793 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 804 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_package_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 819 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 848 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 863 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 865 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 868 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 870 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 883 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 890 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 895 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 902 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 905 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 911 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1969 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata)
NOTE: Running task 2148 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata: Started
NOTE: Running task 2398 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2458 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2496 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure)
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 2506 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2507 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 2508 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2509 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install)
NOTE: recipe json-glib-1.10.8-r0: task do_install: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 2510 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2511 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_package)
NOTE: Running task 2512 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_package: Started
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot unihash changed to d03fb14011d9aa9ca2a5fe79d3ef79f217b998f2f13d54b9b06e9f1b7826e278
NOTE: Setscene tasks completed
NOTE: Running task 2513 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.26.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2514 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_configure)
NOTE: recipe gst-devtools-1.26.10-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_package unihash changed to 4fd55d912b5723b2ccb34fa0d1518ce5538b0ac02b76817fa93ce6c86edce81c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata became valid
NOTE: recipe gst-devtools-1.26.10-r0: task do_configure: Succeeded
NOTE: Running setscene task 913 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata_setscene)
NOTE: Running task 2515 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2517 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_create_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2518 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.26.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-devtools-1.26.10-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_install)
NOTE: recipe gst-devtools-1.26.10-r0: task do_install: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package)
NOTE: Running task 2521 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.26.10-r0: task do_package: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_populate_sysroot unihash changed to ed7c34cb657e196920bb54d8c0014ad5fcea0d298fd46292e9cb12276c1456fe
NOTE: Setscene tasks completed
NOTE: recipe gst-devtools-1.26.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package unihash changed to 3fd1e0037aa5e693e38c8cc8d64e520ad77bab0aaab41d0934ab32afaa15a9cb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_packagedata became valid
NOTE: Running setscene task 913 of 913 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_packagedata_setscene)
NOTE: recipe gst-devtools-1.26.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2523 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_create_spdx)
NOTE: Running task 2524 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_write_ipk)
NOTE: Running task 2525 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_write_deb)
NOTE: Running task 2526 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_write_rpm)
NOTE: Running task 2527 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_qa)
NOTE: recipe gst-devtools-1.26.10-r0: task do_create_spdx: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_write_ipk: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_write_deb: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_write_rpm: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_qa: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 2528 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_create_package_spdx)
NOTE: recipe gst-devtools-1.26.10-r0: task do_create_package_spdx: Started
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_write_ipk unihash changed to 494cae10aaa638a9fa1d6fe52967de2f393a9eb64a39c064d66a6022900dc474
NOTE: recipe gst-devtools-1.26.10-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_qa unihash changed to 680fded55eb94b60f8a62fd6b41f6cffd1b3deda3f173b707ba958eede2a02e7
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_write_rpm unihash changed to 3db79f85a3c676407704fdceafb35f8065f7a3176b08bb931ec16e9abcb0faa1
NOTE: recipe gst-devtools-1.26.10-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_package_write_deb unihash changed to af26bc2a00344e94794a20c84b69531f03167ae5f1db603bc3faa7f08849a971
NOTE: Running noexec task 2529 of 2529 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.10.bb:do_build)
NOTE: Tasks Summary: Attempted 2529 tasks of which 2492 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:12.3.0-r0 to 0:12.2.0-r0) [version-going-backwards]
ERROR: harfbuzz-12.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-src went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dbg went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-staticdev went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-dev went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-doc went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto-locale went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: QA Issue: Package version for package xorgproto went backwards which would break package feeds (from 0:2025.1-r0 to 0:2024.1-r0) [version-going-backwards]
ERROR: xorgproto-2024.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5562080972213247197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0 /usr/lib/libgstvalidate-1.0.so.0.2609.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2610.0 /usr/lib/libgstvalidate-1.0.so.0.2610.0"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2609.0 to libgstvalidate-1.0.so.0.2610.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2609.0 to libgstvalidate-default-overrides-1.0.so.0.2610.0
  /usr/lib/libgstvalidate-1.0.so.0.2609.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2610.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2610.0

--===============5562080972213247197==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.26.9-1.26.10.patch"

RnJvbSBiZDdhY2Q0NTA3YmFhYzUwMzRmZmRiOWI5ZWZhMWNhOWFlNzhjNjRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MjY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNi45IC0+IDEuMjYuMTAKCi0tLQogLi4uLzAwMDEtY29u
bmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggICAgICAgIHwgMiAr
LQogLi4uL3tnc3QtZGV2dG9vbHNfMS4yNi45LmJiID0+IGdzdC1kZXZ0b29sc18xLjI2LjEwLmJi
fSAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3Qt
ZGV2dG9vbHNfMS4yNi45LmJiID0+IGdzdC1kZXZ0b29sc18xLjI2LjEwLmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMv
MDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMvMDAwMS1jb25uZWN0
LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaAppbmRleCAzNGZjZjZhMzBh
Li42NjZhYTg3NThlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9u
LW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1k
ZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxM2IwZDhlNTVhZDQ5MGM4ZTg2N2M3NDBkYTJhMDBl
YjQ5MzE5ZjhlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNTVjZjJjMWE0ODYwODYw
ZmI2MmEzNWYxYjI0MGNjMmNlZjcwYzliIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgOSBTZXAgMjAxOCAxNzoz
ODoxMCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb25uZWN0IGhhcyBhIGRpZmZlcmVudCBzaWdu
YXR1cmUgb24gbXVzbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjYuMTAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI2
LjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHNfMS4yNi4xMC5iYgppbmRleCA0NGM1NzlmMmE0Li43MDIxNDYwMzc0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjYuOS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEu
MjYuMTAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1kZXZ0b29scy9nc3QtZGV2dG9vbHMtJHtQVn0KICAgICAg
ICAgICAgZmlsZTovLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11
c2wucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NWM3YWRh
ZjllZWU3YTUyMTlkNDRiNzM2YzQwMWE5NDdlYmI1ZDAxMzBjNzhlOTAwMDE3YTY4MTIwMjZiNTY3
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFiYzVlZTYzMzE5OTAxMjEyODM0YzJhZWJlNDg0MmZh
NjhmODQxMjQyNGQ5N2Y1M2U2ZjRjZGEwYmJiMmUyNTQiCiAKIERFUEVORFMgPSAianNvbi1nbGli
IGdsaWItMi4wIGdsaWItMi4wLW5hdGl2ZSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZSIKIFJSRUNPTU1FTkRTOiR7UE59ID0gImdpdCIKLS0gCjIuNDcuMQoK

--===============5562080972213247197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2609.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2609.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2610.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 2783248 to 2783328 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGSIZE changed from 401215 to 401216 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: FILELIST: directory renamed /usr/src/debug/gst-devtools/1.26.9/validate/plugins/gapplication -> /usr/src/debug/gst-devtools/1.26.10/validate/plugins/gapplication, directory renamed /usr/src/debug/gst-devtools/1.26.9/validate/tools -> /usr/src/debug/gst-devtools/1.26.10/validate/tools, directory renamed /usr/src/debug/gst-devtools/1.26.9/validate/gst/validate/flow -> /usr/src/debug/gst-devtools/1.26.10/validate/gst/validate/flow, directory renamed /usr/src/debug/gst-devtools/1.26.9/validate/plugins/fault_injection -> /usr/src/debug/gst-devtools/1.26.10/validate/plugins/fault_injection, directory renamed /usr/src/debug/gst-devtools/1.26.9/validate/gst/overrides -> /usr/src/debug/gst-devtools/1.26.10/validate/gst/overrides, directory renamed /usr/src/debug/gst-devtools/1.26.9/validate/gst/validate -> /usr/src/debug/gst-devtools/1.26.10/validate/gst/validate
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0 /usr/lib/libgstvalidate-1.0.so.0.2609.0", added "/usr/lib/libgstvalidate-1.0.so.0.2610.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2610.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PV changed from "1.26.9" to "1.26.10"
packages/x86-64-v3-poky-linux/gst-devtools: PKGV changed from 1.26.9 [default] to 1.26.10 [default]
packages/x86-64-v3-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.9.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.10.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/x86-64-v3-poky-linux/gst-devtools: PV changed from "1.26.9" to "1.26.10"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2609.0 to libgstvalidate-1.0.so.0.2610.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2609.0 to libgstvalidate-default-overrides-1.0.so.0.2610.0
  /usr/lib/libgstvalidate-1.0.so.0.2609.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2610.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2609.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2610.0

--===============5562080972213247197==--

