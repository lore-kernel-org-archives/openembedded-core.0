Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A5BCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.44900.1711995070553826825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DdrOXOFZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=L8CB/vNP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e9adba617-001b2901-3706-404e-9a55-ca7b70aac279-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=omVLZ8SFFO2qnFCK/+mZybCkw+5ijue4PDc6F5ezPNA=;
	b=DdrOXOFZeCxnjBiqNiKUWxeIKZN1EhSmYuH10/Y7dWJWCxaz9LJ76UyINSSF2TUC
	xYq3I3xMJAEIVs6rHgx5mfbMce4OI+hWFtzYy0puw7F0ZkEWuTBnmX3jpSxI8zg54vd
	Gw4xpswn2JeNIrY5ggucPjS3V9LdLz/MxiUYN3J8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=omVLZ8SFFO2qnFCK/+mZybCkw+5ijue4PDc6F5ezPNA=;
	b=L8CB/vNPF7JDijeKq3XjcgBVioTUcOyspI8EgkWp5W+qiV8Vp6oRXFb3mXoOrnrK
	Fe8G5jmsEZDjkHKAHHwlsQe8rRtzDtJRH3amTM7y76DVX+D3B5b4J9fvtH+rpvXmSGq
	8+pNnw13q92gHe7o5POhVVWkXDiFdOvScbpA3/h8=
Content-Type: multipart/mixed; boundary="===============3884766098612173336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-base: upgrading to 1.24.1 FAILED
Message-ID: <0101018e9adba617-001b2901-3706-404e-9a55-ca7b70aac279-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197820

--===============3884766098612173336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-base* to *1.24.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-base-upgrade-1.22.11-1.24.1.patch
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
From 860fdf4ba5f9e2d670130b36c7c4a8b188c0b367 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 15:51:41 +0000
Subject: [PATCH] gstreamer1.0-plugins-base: upgrade 1.22.11 -> 1.24.1

---
 ...-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 5 ++---
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch       | 5 ++---
 .../0003-viv-fb-Make-sure-config.h-is-included.patch         | 3 +--
 ...s-base_1.22.11.bb => gstreamer1.0-plugins-base_1.24.1.bb} | 2 +-
 4 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.24.1.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 34c99ded42..05e6f15e02 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 63fe5a7b4ef70e2c490bad3b0838329935a8d77c Mon Sep 17 00:00:00 2001
+From 671ee38b2b64f1c3f1194d6ed899106a1f72d023 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -8,7 +8,6 @@ https://bugzilla.gnome.org/show_bug.cgi?id=728312
 Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
-
 ---
  gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
@@ -17,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 173da37..2b7f34c
+index ef0ff90..53f05c8
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 2adeae93d6..7644faeb70 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 7bf9525528c8f4a47413d7f82214d76f95f0c5f6 Mon Sep 17 00:00:00 2001
+From e89c08f0e5cebe5f2dcf1d78593d14bf62b12a1c Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -9,7 +9,6 @@ and there's are maybe multiple Dialog lines in one input buffer.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/178]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
-
 ---
  gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
@@ -18,7 +17,7 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index d6fdb9c..5ebe678
+index 42fbb42..2dab51c
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
 @@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index a605533be8..a1dde2b64f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 2b07840122bc2e83bd23dad59aa80d9479f2e1e4 Mon Sep 17 00:00:00 2001
+From 4d86770ec581f4b4e4084b81cb3c565380647ee7 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
@@ -8,7 +8,6 @@ This prevents build errors due to missing GST_API_* symbols
 Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
-
 ---
  gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb
index 7aa10eb646..dd2f178ac7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "65eaf72296cc5edc985695a4d80affc931e64a79f4879d05615854f7a2cf5bd1"
+SRC_URI[sha256sum] = "884045d1d7c5d6bb8605e45c7ee0e9f1341888e81c2b7c42dff52bb98ede8ec3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.42.0


--===============3884766098612173336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1876 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f7d0269b6020c18025a1f35d663365073ba8eba8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f7d0269b6020c18025a1f35d663365073ba8eba8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 353 Local 341 Mirrors 0 Missed 12 Current 556 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 614 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 616 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 635 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 636 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.52.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 780 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 792 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 801 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 802 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 815 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1701 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_recipe_qa)
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1797 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_write_config)
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 845 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_recipe_qa: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2182 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_fetch)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 2506 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_unpack)
NOTE: Running task 2507 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 2508 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_patch)
NOTE: Running task 2509 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 2510 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2511 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2512 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '
 /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_po
 pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:nat
 ive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0', 'lib
 ogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2
 c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Dgl_api=opengl,gles2 -Dgl_platform=egl,glx -Dgl_winsys=egl,wayland,x11 -Dalsa=enabled -Dcdparanoia=disabled -Dgl-graphene=disabled -Dgl-jpeg=enabled -Dogg=enabled -Dopus=disabled -Dorc=enabled -Dpango=enabled -Dgl-png=enabled -Dqt5=disabled -Dtheora=enabled -Dtremor=disabled -Dlibvisual=disabled -Dvorbis=enabled -Dx11=enabled -Dxvideo=enabled -Dxshm=enabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/gst-plugins-base-1.24.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/build
| Build type: cross build
| Project name: gst-plugins-base
| Project version: 1.24.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.41.0.20230926
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/recipe-sysroot ld.bfd 2.42.0.20240216
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "emmintrin.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "process.h" : NO
| Has header "smmintrin.h" : YES
| Has header "stdint.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/wait.h" : YES
| Has header "unistd.h" : YES
| Has header "winsock2.h" : NO
| Has header "xmmintrin.h" : YES
| Has header "linux/dma-buf.h" : YES
| Library m found: YES
| Checking for function "dcgettext" with dependency -lm: YES
| Checking for function "gmtime_r" with dependency -lm: YES
| Checking for function "localtime_r" with dependency -lm: YES
| Checking for function "lrintf" with dependency -lm: YES
| Checking for function "mmap" with dependency -lm: YES
| Checking for function "log2" with dependency -lm: YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Checking for size of "short" : 2
| Checking for size of "void*" : 8
| Compiler for C++ supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C++ supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C++ supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libdrm found: YES 2.4.120
| Run-time dependency x11 found: YES 1.8.7
| Run-time dependency gio-2.0 found: YES 2.78.4
| Run-time dependency gio-unix-2.0 found: YES 2.78.4
| Run-time dependency gmodule-no-export-2.0 found: YES 2.78.4
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Dependency gstreamer-1.0 found: NO found 1.22.11 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-base-1.24.1/meson.build:362:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/run.do_configure.2599271:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/run.do_configure.2599271, line 176
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/run.do_configure.2599271, line 165
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/run.do_configure.2599271, line 154
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/run.do_configure.2599271, line 189
NOTE: recipe gstreamer1.0-plugins-base-1.24.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2512 tasks of which 2502 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401155119.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401155119.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.24.1-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-base-1.24.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/run.do_configure.2599271', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.1/temp/log.do_configure.2599271
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.1.bb:do_configure) failed with exit code '1'

--===============3884766098612173336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-base-upgrade-1.22.11-1.24.1.patch"

RnJvbSA4NjBmZGY0YmE1ZjllMmQ2NzAxMzBiMzZjN2M0YThiMTg4YzBiMzY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNTo1MTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2U6IHVwZ3JhZGUgMS4yMi4xMSAtPiAxLjI0LjEKCi0tLQog
Li4uLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBh
dGNoIHwgNSArKy0tLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1w
YXJzaW5nLnBhdGNoICAgICAgIHwgNSArKy0tLQogLi4uLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1j
b25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCAgICAgICAgIHwgMyArLS0KIC4uLnMtYmFzZV8xLjIy
LjExLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC4xLmJifSB8IDIgKy0KIDQg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZV8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC4xLmJifSAoOTgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBh
ZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1m
cm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCmluZGV4IDM0Yzk5ZGVkNDIuLjA1ZTZm
MTVlMDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3Jj
LXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0
LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNjNmZTVhN2I0ZWY3MGUyYzQ5MGJhZDNiMDgzODMyOTkzNWE4ZDc3YyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjcxZWUzOGIyYjY0ZjFjM2YxMTk0ZDZlZDg5OTEwNmExZjcy
ZDAyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IHpob3VtaW5nIDxiNDI1ODZAZnJl
ZXNjYWxlLmNvbT4KIERhdGU6IFdlZCwgMTQgTWF5IDIwMTQgMTA6MTY6MjAgKzA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRU5HUjAwMzEyNTE1OiBnZXQgY2FwcyBmcm9tIHNyYyBwYWQgd2hlbiBxdWVy
eSBjYXBzCkBAIC04LDcgKzgsNiBAQCBodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1
Zy5jZ2k/aWQ9NzI4MzEyCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1i
eTogemhvdW1pbmcgPGI0MjU4NkBmcmVlc2NhbGUuY29tPgotCiAtLS0KICBnc3QtbGlicy9nc3Qv
dGFnL2dzdHRhZ2RlbXV4LmMgfCAxMyArKysrKysrKysrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKykKQEAgLTE3LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogemhvdW1pbmcg
PGI0MjU4NkBmcmVlc2NhbGUuY29tPgogZGlmZiAtLWdpdCBhL2dzdC1saWJzL2dzdC90YWcvZ3N0
dGFnZGVtdXguYyBiL2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVtdXguYwogb2xkIG1vZGUgMTAw
NjQ0CiBuZXcgbW9kZSAxMDA3NTUKLWluZGV4IDE3M2RhMzcuLjJiN2YzNGMKK2luZGV4IGVmMGZm
OTAuLjUzZjA1YzgKIC0tLSBhL2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVtdXguYwogKysrIGIv
Z3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jCiBAQCAtMTc5Niw2ICsxNzk2LDE5IEBAIGdz
dF90YWdfZGVtdXhfcGFkX3F1ZXJ5IChHc3RQYWQgKiBwYWQsIEdzdE9iamVjdCAqIHBhcmVudCwg
R3N0UXVlcnkgKiBxdWVyeSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1T
U0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNT
QS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2gKaW5kZXggMmFkZWFlOTNkNi4uNzY0NGZhZWI3MCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNp
bmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1wbHVnaW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBh
cnNpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdiZjk1MjU1MjhjOGY0YTQ3NDEzZDdm
ODIyMTRkNzZmOTVmMGM1ZjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU4OWMwOGYw
ZTVjZWJlNWYyZGNmMWQ3ODU5M2QxNGJmNjJiMTJhMWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBNaW5na2UgV2FuZyA8bWluZ2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFRo
dSwgMTkgTWFyIDIwMTUgMTQ6MTc6MTAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc3NhcGFyc2U6
IGVuaGFuY2UgU1NBIHRleHQgbGluZXMgcGFyc2luZy4KQEAgLTksNyArOSw2IEBAIGFuZCB0aGVy
ZSdzIGFyZSBtYXliZSBtdWx0aXBsZSBEaWFsb2cgbGluZXMgaW4gb25lIGlucHV0IGJ1ZmZlci4K
IFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWJhc2UvLS9pc3N1ZXMvMTc4XQogCiBTaWduZWQtb2Zm
LWJ5OiBNaW5na2UgV2FuZyA8bWluZ2tlLndhbmdAZnJlZXNjYWxlLmNvbT4KLQogLS0tCiAgZ3N0
L3N1YnBhcnNlL2dzdHNzYXBhcnNlLmMgfCAxNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxMzQgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRp
b25zKC0pCkBAIC0xOCw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdrZSBXYW5nIDxtaW5n
a2Uud2FuZ0BmcmVlc2NhbGUuY29tPgogZGlmZiAtLWdpdCBhL2dzdC9zdWJwYXJzZS9nc3Rzc2Fw
YXJzZS5jIGIvZ3N0L3N1YnBhcnNlL2dzdHNzYXBhcnNlLmMKIG9sZCBtb2RlIDEwMDY0NAogbmV3
IG1vZGUgMTAwNzU1Ci1pbmRleCBkNmZkYjljLi41ZWJlNjc4CitpbmRleCA0MmZiYjQyLi4yZGFi
NTFjCiAtLS0gYS9nc3Qvc3VicGFyc2UvZ3N0c3NhcGFyc2UuYwogKysrIGIvZ3N0L3N1YnBhcnNl
L2dzdHNzYXBhcnNlLmMKIEBAIC0yNzAsNiArMjcwLDcgQEAgZ3N0X3NzYV9wYXJzZV9yZW1vdmVf
b3ZlcnJpZGVfY29kZXMgKEdzdFNzYVBhcnNlICogcGFyc2UsIGdjaGFyICogdHh0KQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCmlu
ZGV4IGE2MDU1MzNiZTguLmExZGRlMmI2NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1h
a2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1N
YWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDJiMDc4NDAxMjJiYzJlODNiZDIzZGFkNTlhYTgwZDk0NzlmMmUxZTQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDRkODY3NzBlYzU4MWY0YjRlNDA4NGI4MWNiM2M1NjUzODA2NDdlZTcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYXJsb3MgUmFmYWVsIEdpYW5pIDxjcmc3
NDc1QG1haWxib3gub3JnPgogRGF0ZTogVHVlLCAyMSBNYXkgMjAxOSAxNDowMToxMSArMDIwMAog
U3ViamVjdDogW1BBVENIXSB2aXYtZmI6IE1ha2Ugc3VyZSBjb25maWcuaCBpcyBpbmNsdWRlZApA
QCAtOCw3ICs4LDYgQEAgVGhpcyBwcmV2ZW50cyBidWlsZCBlcnJvcnMgZHVlIHRvIG1pc3Npbmcg
R1NUX0FQSV8qIHN5bWJvbHMKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2Zm
LWJ5OiBDYXJsb3MgUmFmYWVsIEdpYW5pIDxjcmc3NDc1QG1haWxib3gub3JnPgotCiAtLS0KICBn
c3QtbGlicy9nc3QvZ2wvZ2wtcHJlbHVkZS5oIHwgNCArKysrCiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yMi4xMS5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjIyLjExLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZV8xLjI0LjEuYmIKaW5kZXggN2FhMTBlYjY0Ni4uZGQyZjE3OGFjNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Vf
MS4yMi4xMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0LjEuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9
ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJhc2Uv
Z3N0LXBsdWdpbnMtYmEKICAgICAgICAgICAgZmlsZTovLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1j
b25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXNzYXBh
cnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBcCiAgICAgICAgICAgICIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2NWVhZjcyMjk2Y2M1ZWRjOTg1Njk1YTRkODBhZmZjOTMx
ZTY0YTc5ZjQ4NzlkMDU2MTU4NTRmN2EyY2Y1YmQxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg4
NDA0NWQxZDdjNWQ2YmI4NjA1ZTQ1YzdlZTBlOWYxMzQxODg4ZTgxYzJiN2M0MmRmZjUyYmI5OGVk
ZThlYzMiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1iYXNlLSR7UFZ9IgogCi0tIAoy
LjQyLjAKCg==

--===============3884766098612173336==--

