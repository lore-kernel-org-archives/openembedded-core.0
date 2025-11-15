Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED915CEBF73
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11956.1763224742061355366
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PYlh+gWc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kTx1AuUB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a88628650-2abd87c3-f4d4-4379-8d72-248d1b5fa0fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KlGElrpEAE+g8UIYofvmwXAWCx4sgFOEmsP9gwj8fsA=;
	b=PYlh+gWcYhoiNCHUB4g2bKC3alo5HDYKUSrjTPeHlw7excAhbkCY1NVeuWsnbOQH
	V249zENm6RL/98fgsHk57/jlRlOFMqJeY0ZzpRMjnmd7I9jz4Q+8Ub1bYoCF9DSjt5M
	52kV0JUw3X2vQLWRlRNnD15MN1YGfYLjxnRKaAww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KlGElrpEAE+g8UIYofvmwXAWCx4sgFOEmsP9gwj8fsA=;
	b=kTx1AuUBlna+DzouDbOVqetF7D6uU4PB9vdebu9HtWL9sU2zA87WTqj4Y0KrJFVo
	CN15Vno2HPGLlHxdmaBrmgfRaui+dlPoA+QNfgAkHNNa+A0jIfBKcqEzFVW2H+enqM8
	f4UznZqJTdkoJZli6tbOh9C19RtHHgBhb9+biiIs=
Content-Type: multipart/mixed; boundary="===============7452336857213309925=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gst-devtools: upgrading to 1.26.8 SUCCEEDED
Message-ID: <0101019a88628650-2abd87c3-f4d4-4379-8d72-248d1b5fa0fd-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226435

--===============7452336857213309925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.26.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.26.5-1.26.8.patch
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
From 3c823f296ccae41aa3accf151217d18f50aa9700 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:14:27 +0000
Subject: [PATCH] gst-devtools: upgrade 1.26.5 -> 1.26.8

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.26.5.bb => gst-devtools_1.26.8.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.8.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..0ed3196324 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From 460c72a4a6630c1d0a8046094e23038f0ea68f8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb
index b0de19c10d..f136e5a259 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "63d46a8effa8a225e25a464ba7538ace853fe0dc1e70366b27c208135e5401ce"
+SRC_URI[sha256sum] = "4baa1d9bb4d68ab663254f703d436f77226d22b45aa304c199c3c3268b4e812f"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============7452336857213309925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 2782752 to 2783000 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2605.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2608.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGSIZE changed from 401198 to 401215 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGSIZE changed from 1493613 to 1493546 (-0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2605.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0", added "/usr/lib/libgstvalidate-1.0.so.0.2608.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2608.0"
packages/x86-64-v3-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.5.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.8.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
packages/x86-64-v3-poky-linux/gst-devtools: PV changed from "1.26.5" to "1.26.8"
packages/x86-64-v3-poky-linux/gst-devtools: PKGV changed from 1.26.5 [default] to 1.26.8 [default]
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2605.0 to libgstvalidate-1.0.so.0.2608.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2605.0 to libgstvalidate-default-overrides-1.0.so.0.2608.0
  /usr/lib/libgstvalidate-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2608.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2608.0

--===============7452336857213309925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 102 recipes from the qemux86_64 sysroot...done.
Removing 100 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-cf468b806097e328e322c920dfd62819f679c47e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:cf468b806097e328e322c920dfd62819f679c47e"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 823 Local 804 Mirrors 0 Missed 19 Current 373 (97% match, 98% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 380 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 384 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 421 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_populate_lic_setscene)
NOTE: Running setscene task 433 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 469 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 470 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 474 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 478 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 480 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 481 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_populate_lic_setscene: Started
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 482 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.8-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 489 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 492 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 494 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 508 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 513 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe git-2.51.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 514 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe git-2.51.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 516 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 519 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 527 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 528 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 529 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 539 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 540 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 553 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 554 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 576 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 580 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 581 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 584 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.50-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 586 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/harfbuzz/11.4.5/temp/log.do_packagedata_setscene.741238
NOTE: Running setscene task 600 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 603 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 624 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 627 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_package_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 656 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.5-r1: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 695 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 706 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libclc-21.1.5-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 752 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 754 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 765 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 774 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 776 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libclc-21.1.5-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 793 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 807 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 825 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-21.1.5-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libclc-21.1.5-r1: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 831 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 833 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 842 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 844 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libclc-21.1.5-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 849 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 852 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 853 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 854 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 859 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 864 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 865 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 871 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 873 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 877 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 883 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 886 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 902 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 906 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 909 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 910 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 911 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 912 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 915 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 917 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 921 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 922 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 924 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 926 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 928 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 930 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 935 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 936 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 943 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 947 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 957 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 961 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 965 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 969 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 971 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 974 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 980 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 988 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 990 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 993 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 997 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1003 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1005 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1006 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.50-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1015 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1019 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1024 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.50.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1029 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1031 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1033 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1036 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1038 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1041 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1045 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1047 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1049 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1051 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1054 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1058 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1062 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1064 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1069 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1071 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1075 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1080 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1082 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1084 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1086 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1087 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1088 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1090 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1093 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1099 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1104 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1107 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1110 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1111 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1115 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1116 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1125 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1127 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1630 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1134 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1135 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1139 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1141 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1145 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: Running task 1788 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1148 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1887 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_fetch)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: Running setscene task 1149 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: Running setscene task 1156 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 1981 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_recipe_qa)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1996 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2030 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_write_config)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2069 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.8-r0: task do_recipe_qa: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2147 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_unpack: Started
NOTE: Running setscene task 1157 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1161 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2154 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_patch)
NOTE: recipe gst-devtools-1.26.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2155 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_fetch: Succeeded
NOTE: Running task 2156 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1166 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1169 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 1170 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gst-devtools-1.26.8-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1176 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-devtools-1.26.8-r0: task do_unpack: Succeeded
NOTE: Running task 2160 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.8-r0: task do_patch: Succeeded
NOTE: Running task 2163 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1178 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe gst-devtools-1.26.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1186 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1194 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1195 of 1196 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2835 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3055 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3083 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata)
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3244 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3257 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3258 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure)
NOTE: recipe json-glib-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3259 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3260 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3261 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile)
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3262 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3263 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install)
NOTE: recipe json-glib-1.10.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_configure: Succeeded
NOTE: Running task 3264 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3265 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3266 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_package)
NOTE: Running task 3267 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.8-r0: task do_package: Started
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3268 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata)
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata unihash changed to 7b049746241d844da489e278a1b464e682cb103e7cd013ce4abd4bba305045d7
NOTE: Setscene tasks completed
NOTE: Running task 3269 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_create_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_compile: Succeeded
NOTE: Running task 3270 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_install: Succeeded
NOTE: Running task 3271 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_package)
NOTE: Running task 3272 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3273 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.26.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3274 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_configure)
NOTE: recipe gst-devtools-1.26.8-r0: task do_configure: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_configure: Succeeded
NOTE: Running task 3275 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_compile)
NOTE: recipe gst-devtools-1.26.8-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_package: Succeeded
NOTE: Running task 3276 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_packagedata: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_compile: Succeeded
NOTE: Running task 3277 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_install)
NOTE: recipe gst-devtools-1.26.8-r0: task do_install: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_install: Succeeded
NOTE: Running task 3278 of 3289 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.8.bb:do_populate_sysroot)
NOTE: recipe gst-devtools-1.26.8-r0: task do_populate_sysroot: Started
NOTE: recipe gst-devtools-1.26.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3278 tasks of which 3238 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115151334.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115151334.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/gstreamer1.0-plugins-base/1.26.5/temp/log.do_packagedata.760527
Summary: There were 118 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:12.2.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.26.8-r0 to 0:1.26.5-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/gstreamer1.0-plugins-base/1.26.5/temp/log.do_packagedata.760527
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_packagedata) failed with exit code '1'

--===============7452336857213309925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2605.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2608.0 /usr/lib/libgstvalidate-1.0.so.0.2608.0"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2605.0 to libgstvalidate-1.0.so.0.2608.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2605.0 to libgstvalidate-default-overrides-1.0.so.0.2608.0
  /usr/lib/libgstvalidate-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2608.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2608.0

--===============7452336857213309925==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.26.5-1.26.8.patch"

RnJvbSAzYzgyM2YyOTZjY2FlNDFhYTNhY2NmMTUxMjE3ZDE4ZjUwYWE5NzAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6MTQ6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNi41IC0+IDEuMjYuOAoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI2LjUuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjYuOC5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI2LjUuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjYuOC5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMzRmY2Y2YTMwYS4u
MGVkMzE5NjMyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTNiMGQ4ZTU1YWQ0OTBjOGU4NjdjNzQwZGEyYTAwZWI0
OTMxOWY4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDYwYzcyYTRhNjYzMGMxZDBh
ODA0NjA5NGUyMzAzOGYwZWE2OGY4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yNi41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI2LjguYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI2LjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yNi44LmJiCmluZGV4IGIwZGUxOWMxMGQuLmYxMzZlNWEyNTkgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi41LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi44
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjNkNDZhOGVmZmE4
YTIyNWUyNWE0NjRiYTc1MzhhY2U4NTNmZTBkYzFlNzAzNjZiMjdjMjA4MTM1ZTU0MDFjZSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI0YmFhMWQ5YmI0ZDY4YWI2NjMyNTRmNzAzZDQzNmY3NzIyNmQy
MmI0NWFhMzA0YzE5OWMzYzMyNjhiNGU4MTJmIgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ3LjEKCg==

--===============7452336857213309925==--

