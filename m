Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ADDCCD180
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30927.1757937283157684428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IUU3f44+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=neGicWno;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101994d3a55ce-88150d6b-669a-4731-90f4-5d600c6a06ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZAUUsQItdPATeaYrZ+DNFMsPxTllAzri8+fem3AYC+0=;
	b=IUU3f44+8BQSVCnXcY/E37Jx2wA0ibs9CmBpqtzx0o4pakb0DTBTZTNmjUfSThpH
	E9UeZGv11mCa0inr46vOl2Wxsn5owkwFqcpfl09YLt+aMwTrGdMKCrtE02zmUqMY7+b
	AYHJGyYMMVqXXt+ep/U0A0VARw2RennAtW0DLEO4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZAUUsQItdPATeaYrZ+DNFMsPxTllAzri8+fem3AYC+0=;
	b=neGicWnouboP/VieJc/ejUn+AHORBpWxNjSL+GUZoehSZdOvggaC0pg4RaauzKPz
	oMOEcE4LPtUwC6vd5e0VOfv0p0QTDRIpXpsG+LkVlx9ue1vSITbynR4DAmIaIJCl41w
	Ii13z29YNoUhOW1WD/jyfLdum+7jdPtuAb0w5W0A=
Content-Type: multipart/mixed; boundary="===============7310583412123846855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.26.6 SUCCEEDED
Message-ID: <010101994d3a55ce-88150d6b-669a-4731-90f4-5d600c6a06ad-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223466

--===============7310583412123846855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.26.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.26.5-1.26.6.patch
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
From 5dc57ff350f1f08e4ca03e98e5d3acf73e3805c0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 10:55:46 +0000
Subject: [PATCH] gst-devtools: upgrade 1.26.5 -> 1.26.6

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.26.5.bb => gst-devtools_1.26.6.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index 34fcf6a30a..02bd39f417 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 13b0d8e55ad490c8e867c740da2a00eb49319f8e Mon Sep 17 00:00:00 2001
+From 571ef61166f96ecc0c0baaeaae50f7daa0195e64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb
index b0de19c10d..67af01efe6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "63d46a8effa8a225e25a464ba7538ace853fe0dc1e70366b27c208135e5401ce"
+SRC_URI[sha256sum] = "dec8fc56d578d65c498e65e56efe44994c5d3f4e85dbbdff0242b441b32e19b2"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.47.1


--===============7310583412123846855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-1.0.so.0.2605.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2605.0", added "/usr/lib/.debug/libgstvalidate-1.0.so.0.2606.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2606.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 2782744 to 2783312 (+0%)
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-1.0.so.0.2605.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2606.0 /usr/lib/libgstvalidate-1.0.so.0.2606.0"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools: PV changed from "1.26.5" to "1.26.6"
packages/x86-64-v3-poky-linux/gst-devtools: PKGV changed from 1.26.5 [default] to 1.26.6 [default]
packages/x86-64-v3-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.5.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.26.6.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2605.0 to libgstvalidate-1.0.so.0.2606.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2605.0 to libgstvalidate-default-overrides-1.0.so.0.2606.0
  /usr/lib/libgstvalidate-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2606.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2606.0

--===============7310583412123846855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 103 recipes from the qemux86_64 sysroot...done.
Removing 102 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f5fe35ad7a35d0b85881730ba54cd756b64bd07b"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f5fe35ad7a35d0b85881730ba54cd756b64bd07b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 834 Local 815 Mirrors 0 Missed 19 Current 368 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 389 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 390 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 413 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 430 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 464 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 486 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 492 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_qa_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gst-devtools-1.26.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 497 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gst-devtools-1.26.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.56.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 511 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 525 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 528 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe git-2.51.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe git-2.51.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 529 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe json-glib-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 542 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 546 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 549 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 562 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 589 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 598 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe git-2.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.10.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 602 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 629 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 639 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 642 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 648 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/harfbuzz/11.4.5/temp/log.do_packagedata_setscene.1401427
NOTE: Running setscene task 650 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 655 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 658 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 672 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.51.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_package_setscene)
NOTE: recipe harfbuzz-11.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe git-2.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 749 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 770 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 790 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_package_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 794 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 797 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 798 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-21.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 804 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 819 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 833 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 838 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 868 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 870 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 891 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 893 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 900 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 907 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: Running task 1336 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 916 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1468 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_write_config)
NOTE: Running setscene task 923 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.10.6-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 931 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 938 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.10.6-r0: task do_write_config: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_write_config: Succeeded
NOTE: Running setscene task 940 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 941 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 943 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 944 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 953 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 954 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 963 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 965 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 968 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 969 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1547 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_unpack)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1585 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 972 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.10.6-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 980 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 985 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_fetch: Started
NOTE: Running task 1661 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_recipe_qa)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1662 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1694 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_write_config)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1704 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_write_config)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.6-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 991 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_unpack: Started
NOTE: recipe json-glib-1.10.6-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1798 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.26.6-r0: task do_write_config: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.26.6-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1817 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_fetch)
NOTE: recipe json-glib-1.10.6-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 999 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1001 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1002 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1003 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_unpack: Succeeded
NOTE: Running task 1829 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_patch)
NOTE: recipe gst-devtools-1.26.6-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.26.6-r0: task do_fetch: Succeeded
NOTE: Running task 1830 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_unpack)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1005 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1007 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1008 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1010 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.26.6-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1012 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1013 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1018 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1025 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.6-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_patch)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.6-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe clang-21.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1033 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1036 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gst-devtools-1.26.6-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1863 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.6.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 1039 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gst-devtools-1.26.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1042 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1045 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1046 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gst-devtools-1.26.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1054 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1055 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1056 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1057 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1068 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1069 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1070 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1077 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1079 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1080 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1081 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1083 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1085 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1086 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1087 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1088 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1089 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1091 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1092 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1095 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1096 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1104 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1108 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1109 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1113 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1114 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1115 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1118 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1120 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1122 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1124 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1125 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1127 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1128 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1131 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1136 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1139 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1140 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1141 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1146 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1147 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1149 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1155 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1156 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1158 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1160 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1163 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1164 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1172 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1182 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1184 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1189 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1193 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1194 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1196 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1202 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2863 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3073 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3104 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_packagedata)
NOTE: recipe json-glib-1.10.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3258 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3271 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.10.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3272 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_configure)
NOTE: recipe json-glib-1.10.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3273 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.6-r0: task do_configure: Succeeded
NOTE: Running task 3274 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.6-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.10.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3275 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_compile)
NOTE: recipe json-glib-1.10.6-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.6-r0: task do_compile: Succeeded
NOTE: Running task 3276 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.10.6-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3277 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_install)
NOTE: recipe json-glib-1.10.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_configure: Succeeded
NOTE: Running task 3278 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.6-r0: task do_install: Succeeded
NOTE: Running task 3279 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.10.6-r0: task do_install_ptest_base: Started
NOTE: recipe json-glib-1.10.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3280 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_package)
NOTE: Running task 3281 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.6-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.6-r0: task do_package: Started
NOTE: recipe json-glib-1.10.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_package: Succeeded
NOTE: Running task 3282 of 3303 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata)
NOTE: recipe json-glib-1.10.6-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.6-r0: task do_packagedata: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3282 tasks of which 3252 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915105509.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915105509.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/json-glib/1.10.6/temp/log.do_packagedata.1413252
Summary: There were 83 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.5-r0) [version-going-backwards]
ERROR: harfbuzz-11.4.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-src went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dbg went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-ptest went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-staticdev went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-dev went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-doc went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ab went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-as went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-be went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bg went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bn-in went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-bs went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ca+valencia went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-cs went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-da went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-de went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-el went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-en-gb went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eo went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-es went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-et went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-eu went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fa went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fr went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-fur went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-gl went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-he went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hi went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hr went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-hu went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-id went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-it went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ja went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ka went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-kab went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ko went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ky went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lt went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-lv went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ml went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ms went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nb went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ne went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-nl went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-oc went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-or went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pa went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pl went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-pt-br went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ro went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ru went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sk went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sl went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sr+latin went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-sv went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-te went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tg went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-th went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-tr went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-ug went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-uk went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-vi went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-cn went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-hk went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-locale-zh-tw went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib-bin went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: QA Issue: Package version for package json-glib went backwards which would break package feeds (from 0:1.10.8-r0 to 0:1.10.6-r0) [version-going-backwards]
ERROR: json-glib-1.10.6-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/json-glib/1.10.6/temp/log.do_packagedata.1413252
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata) failed with exit code '1'

--===============7310583412123846855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.26.5-1.26.6.patch"

RnJvbSA1ZGM1N2ZmMzUwZjFmMDhlNGNhMDNlOThlNWQzYWNmNzNlMzgwNWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTA6NTU6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNi41IC0+IDEuMjYuNgoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI2LjUuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjYuNi5iYn0g
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI2LjUuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjYuNi5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAw
MDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1o
YXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2gKaW5kZXggMzRmY2Y2YTMwYS4u
MDJiZDM5ZjQxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTNiMGQ4ZTU1YWQ0OTBjOGU4NjdjNzQwZGEyYTAwZWI0
OTMxOWY4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTcxZWY2MTE2NmY5NmVjYzBj
MGJhYWVhYWU1MGY3ZGFhMDE5NWU2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDkgU2VwIDIwMTggMTc6Mzg6
MTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ubmVjdCBoYXMgYSBkaWZmZXJlbnQgc2lnbmF0
dXJlIG9uIG11c2wKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yNi41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI2LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI2LjUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9v
bHNfMS4yNi42LmJiCmluZGV4IGIwZGUxOWMxMGQuLjY3YWYwMWVmZTYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi41LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNi42
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtZGV2dG9vbHMvZ3N0LWRldnRvb2xzLSR7UFZ9CiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjNkNDZhOGVmZmE4
YTIyNWUyNWE0NjRiYTc1MzhhY2U4NTNmZTBkYzFlNzAzNjZiMjdjMjA4MTM1ZTU0MDFjZSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJkZWM4ZmM1NmQ1NzhkNjVjNDk4ZTY1ZTU2ZWZlNDQ5OTRjNWQz
ZjRlODVkYmJkZmYwMjQyYjQ0MWIzMmUxOWIyIgogCiBERVBFTkRTID0gImpzb24tZ2xpYiBnbGli
LTIuMCBnbGliLTIuMC1uYXRpdmUgZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UiCiBSUkVDT01NRU5EUzoke1BOfSA9ICJnaXQiCi0tIAoyLjQ3LjEKCg==

--===============7310583412123846855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0 /usr/lib/libgstvalidate-1.0.so.0.2605.0", added "/usr/lib/libgstvalidate-1.0.so.0.2606.0 /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2606.0"
Changes to packages/x86-64-v3-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2605.0 to libgstvalidate-1.0.so.0.2606.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2605.0 to libgstvalidate-default-overrides-1.0.so.0.2606.0
  /usr/lib/libgstvalidate-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2606.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2605.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2606.0

--===============7310583412123846855==--

