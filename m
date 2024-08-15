Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAA4C54ED0
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.131427.1723748334347217732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P7k/E3ub;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=gFhfJ9UU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101915768376d-724826cc-c449-4c97-934a-6365cfd1c4fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SZvQv5+Hbzcozhl+l9bNhuqxWI39yg4cYl3YS+ll/Gw=;
	b=P7k/E3ubJJ23pe41H+wCvPz7r0WcGT1ORrO3+9NUAOg7ng1hDSUrbkK8NtPl49le
	CMgN5r+YmQ8u0Or7cH6u9ja1hTljcIQ55dwPZJoUQleJsq7o3D/d2jOQIS/V0HxQODx
	RZhpfTTucTVPZJ/ZBwaVAXRrl+ja2imglYn96K5Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SZvQv5+Hbzcozhl+l9bNhuqxWI39yg4cYl3YS+ll/Gw=;
	b=gFhfJ9UU9q7hbApXpBBkZf6Ghda4qmjX2YleR2KMeNnvEyb83lkD/QoQkcF39w4q
	JMiYm7c+5pTtLX11gIlWUs2m7NsQY+sKIWTqOQwaqV0dqV6IJGQ7S3Ptvfn4hrWXxsT
	BZDivVCEivKp11R7DOXbER0I9z6H4cjGLQLw/bgk=
Content-Type: multipart/mixed; boundary="===============3035977969857895494=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrading to 1.24.6,1.24.6,1.24.6,1.24.6,1.24.6 SUCCEEDED
Message-ID: <010101915768376d-724826cc-c449-4c97-934a-6365cfd1c4fc-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203377

--===============3035977969857895494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base* to *1.24.6,1.24.6,1.24.6,1.24.6,1.24.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-bad-gstreamer1.0-plugins-ugly-g.patch
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
From d1213a3a9bd50fbcfe9c9f659adb99a7e299d582 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 08:46:28 +0000
Subject: [PATCH] 
 gstreamer1.0-plugins-bad,gstreamer1.0-plugins-ugly,gstreamer1.0-rtsp-server,gstreamer1.0-plugins-good,gstreamer1.0-plugins-base:
 upgrade 1.24.5 -> 1.24.6,1.24.5 -> 1.24.6,1.24.5 -> 1.24.6,1.24.5 ->
 1.24.6,1.24.5 -> 1.24.6

---
 ...1-fix-maybe-uninitialized-warnings-when-compiling-with.patch | 2 +-
 .../0002-avoid-including-sys-poll.h-directly.patch              | 2 +-
 ...4-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch | 2 +-
 ...plugins-bad_1.24.5.bb => gstreamer1.0-plugins-bad_1.24.6.bb} | 2 +-
 ...001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 .../0003-viv-fb-Make-sure-config.h-is-included.patch            | 2 +-
 ...ugins-base_1.24.5.bb => gstreamer1.0-plugins-base_1.24.6.bb} | 2 +-
 ...ugins-good_1.24.5.bb => gstreamer1.0-plugins-good_1.24.6.bb} | 2 +-
 ...ugins-ugly_1.24.5.bb => gstreamer1.0-plugins-ugly_1.24.6.bb} | 2 +-
 ...rtsp-server_1.24.5.bb => gstreamer1.0-rtsp-server_1.24.6.bb} | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.5.bb => gstreamer1.0-plugins-bad_1.24.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.5.bb => gstreamer1.0-plugins-base_1.24.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.5.bb => gstreamer1.0-plugins-good_1.24.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.5.bb => gstreamer1.0-plugins-ugly_1.24.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.5.bb => gstreamer1.0-rtsp-server_1.24.6.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index 13a481485a..da455c8b20 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From bb7f964d51de6b888b3b7a6d0c3d260fcad24008 Mon Sep 17 00:00:00 2001
+From 653f194c2ce141bbb7a7440f65ea279cf4fe3f78 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 298337cb0a..9b77bfeb48 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 25efc5b2d22aed4527470ef93970664b210bf8c5 Mon Sep 17 00:00:00 2001
+From 441b90195aff1ececa9ea6dd228546fa3c16bf84 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 965053348f..0214ce3eec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 39fbcdfc5383bdae95293a3109c847f64d193b54 Mon Sep 17 00:00:00 2001
+From d3121e8febdb5cb00511624983c24e50441b64e8 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
index 75efbad49c..48e6955039 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3029bfd7265314d609dc8eab503675a344ea46e8274fd73ab34566c8442dc847"
+SRC_URI[sha256sum] = "8f4d965513e7827c1f547c1e749e4ef2812b371974fe64857fe5029a19c5b64c"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 38d0fbf6bf..0c2c34aa0d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 5a4d65e13a326103ac02f156c01b6fcbb0269902 Mon Sep 17 00:00:00 2001
+From ffe65c3e4998042b030b91c09a706a03768a1e40 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 4090b77c8d..abca62a491 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 21b8339077f52ec9220e0d3d1f3872e23c7c2e88 Mon Sep 17 00:00:00 2001
+From 1cd4da7d4739dcfa2b66899ef8a49e5ed88d41b8 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index ab46ecee5d..40c91c9df6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 246e6f5ed75696b2e9d9a9ee8cd59252724e1334 Mon Sep 17 00:00:00 2001
+From 48652bcf057b74460eadf8cb943b6381fca4423f Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
index 9d19ea233d..7c3390d52d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "0e33ec9b59eef5ef3a6a53bbd55c44340e681d0000910caca12541a73db38a7d"
+SRC_URI[sha256sum] = "cf52b535a0ce7ec974756891818f34f06317c2e136abb24149e18c23ecc229b5"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
index 1c33ffde00..9d93ca0967 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "badcfc5292b035bde99a77327d468b2f0b116b40420bc9f25fb8e3970824ba75"
+SRC_URI[sha256sum] = "996b9c8d1d246ed43be304718b6086e5a17d4ae8114d1920aed9ea75b920ba2d"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
index 6cae61ed35..7b7de75dac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "333267b6e00770440a4a00402910dd59ed8fd619eaebf402815fbe111da7776d"
+SRC_URI[sha256sum] = "5dfdbb2978ab282e637255cd875cf5b7b93fc83db62f8a0b1af02c85c84a75c4"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
index 9971eee48e..cdb74afbfc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a3062665e41814d3dba3e02b7b06b77326d54d2b6f178ffcb196af9b91a1bfb9"
+SRC_URI[sha256sum] = "b0bdda26173f13f5521c829367963824a74fd0ce8f52bcab674d7e727f74e93c"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.44.0


--===============3035977969857895494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 130 recipes from the core2-64 sysroot...done.
Removing 133 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8b8fb1c22be21b6ea2730f0483dcd2a6641b0542"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8b8fb1c22be21b6ea2730f0483dcd2a6641b0542"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 970 Local 848 Mirrors 0 Missed 122 Current 369 (87% match, 90% complete)
Removing 3 stale sstate objects for arch allarch...done.
Removing 9 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 379 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 394 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 403 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 430 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 434 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 436 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 437 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 453 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 462 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.77.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 463 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx_setscene)
NOTE: Running setscene task 464 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 465 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 466 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 467 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 468 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.77.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 470 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 474 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.58.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 479 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.77.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.77.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 481 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 482 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 487 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.77.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 504 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.39.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 510 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 514 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 522 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 526 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 535 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.77.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.77.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 539 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 546 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 548 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 549 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.77.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 551 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 554 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.77.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 561 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 562 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 577 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 581 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 599 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 625 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 629 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.32.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 635 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 640 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 647 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 648 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 650 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 651 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 652 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 659 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 666 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 680 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 693 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 694 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 702 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 703 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 707 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 709 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 710 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 719 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 724 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 725 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 727 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxtst/1.2.4/temp/log.do_packagedata_setscene.332263
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 728 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 729 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.67-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 732 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_package_setscene)
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-2.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 740 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 755 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 768 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 769 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 775 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 778 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 811 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 813 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 814 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 817 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 822 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 826 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 836 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 839 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 841 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 843 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 845 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 850 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 853 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 865 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 866 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 882 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 885 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 891 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 896 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 898 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 904 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 909 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 910 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 911 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 915 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 917 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 920 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 922 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 927 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 930 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libx11/1.8.9/temp/log.do_packagedata_setscene.334886
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 933 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 935 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 936 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 938 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_package_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 939 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 940 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 943 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_package_setscene: Started
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 995 of 1339 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.77.2.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.77.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1060 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1064 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1070 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1074 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1075 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1080 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1082 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1083 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1084 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-native-1.77.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1093 of 1339 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.77.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1094 of 1339 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.77.2.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1101 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1102 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1103 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1105 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1106 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe cargo-native-1.77.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.77.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1111 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1112 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1113 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1114 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.77.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1117 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1119 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1121 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 942 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1123 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 953 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1125 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1127 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1129 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1087 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: Running task 1093 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1094 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1103 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1121 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_fetch)
NOTE: Running task 1123 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1135 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1136 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1137 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_fetch: Started
NOTE: Running task 1130 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1140 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1141 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1142 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1144 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1150 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: Running task 1163 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_unpack)
NOTE: Running task 1166 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_unpack)
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.77.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1339 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.77.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1148 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1150 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe bluez5-5.77-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1151 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1154 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1157 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe rust-native-1.77.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1158 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1163 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1165 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1169 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1172 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_unpack: Succeeded
NOTE: Running task 1189 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: Running task 1191 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1179 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1181 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.77-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1192 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1184 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1185 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1203 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1204 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1189 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1210 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: Running task 1216 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_patch)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1191 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1192 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1299 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: Running task 1303 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_write_config)
NOTE: Running task 1310 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_patch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1196 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1198 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_write_config: Started
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1201 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1202 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1203 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1204 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1206 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1207 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_write_config: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1209 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1210 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1211 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1212 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1213 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 1214 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1215 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1217 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1219 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1225 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1227 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1229 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1232 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1234 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1237 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1239 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1240 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1241 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1243 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1247 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.77.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1251 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1253 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1255 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1258 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1259 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1261 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1263 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1265 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1267 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1269 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1571 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_fetch)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1622 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: Running setscene task 1274 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1275 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1639 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1646 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_unpack)
NOTE: Running setscene task 1279 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1282 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1283 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1801 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1819 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: Running task 1824 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1844 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1861 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_fetch)
NOTE: Running task 1867 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_fetch)
NOTE: recipe libcap-2.70-r0: task do_unpack: Succeeded
NOTE: Running task 1870 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1877 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_patch)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_fetch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 1914 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_unpack)
NOTE: Running task 1919 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: Running task 1926 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1287 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1954 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 1956 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_fetch)
NOTE: recipe ofono-2.9-r0: task do_fetch: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Started
NOTE: Running task 1984 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2002 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_fetch)
NOTE: Running task 2003 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2004 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack)
NOTE: recipe ell-0.67-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running setscene task 1289 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1290 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1291 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: Running setscene task 1293 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_fetch: Started
NOTE: Running task 2005 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe ofono-2.9-r0: task do_unpack: Started
NOTE: Running task 2007 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe mpg123-1.32.6-r0: task do_fetch: Succeeded
NOTE: Running task 2008 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Started
NOTE: recipe librsvg-2.58.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_patch: Succeeded
NOTE: Running task 2014 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe ell-0.67-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2016 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: Running task 2017 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2035 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1295 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2052 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_unpack)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: Running task 2061 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_unpack)
NOTE: Running task 2062 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.9-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1297 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: Running task 2083 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2091 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running setscene task 1299 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1300 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2105 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: Running task 2107 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.9-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2108 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Succeeded
NOTE: Running task 2109 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_fetch: Started
NOTE: recipe librsvg-2.58.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe ofono-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2115 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_fetch)
NOTE: Running task 2116 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 2129 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2136 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: Running task 2137 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_unpack)
NOTE: Running task 2141 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 2144 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1302 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Started
NOTE: Running task 2155 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_patch)
NOTE: Running task 2162 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2180 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_unpack)
NOTE: Running task 2186 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2187 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_unpack)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_write_config: Started
NOTE: Running task 2188 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_patch: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1304 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1306 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1307 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2189 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2193 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_patch)
NOTE: Running task 2194 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_patch)
NOTE: Running task 2195 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_patch)
NOTE: Running task 2196 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_write_config)
NOTE: Running task 2197 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_write_config)
NOTE: Running task 2250 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_lic)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_write_config: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_patch: Succeeded
NOTE: Running task 2251 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2252 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2253 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_populate_lic)
NOTE: Running task 2254 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2255 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2256 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_populate_lic)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1309 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1311 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_deploy_source_date_epoch unihash changed to 0492409bae5c174ad349b75e0b2e9a9863ba90fd3afa7cd1290a6288e1b3b4a1
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_lic unihash changed to dbc95409e68096c7e115841725d070a22a3d147b5fa1172aab0148d1e166d7cf
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_deploy_source_date_epoch unihash changed to 5fd5c21e837e85bd76a0b524579b6b0e7bd2b1709d3b2d13c1d4d9d39ab47bbc
NOTE: Running setscene task 1270 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_deploy_source_date_epoch unihash changed to a3cf622a8e75b0fc1adeaa82322ceaf11d98dedecb62cbd5ce4cf92e3e355135
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_deploy_source_date_epoch unihash changed to 2a7aade0580577293d342a04fedbc62439a41fa3e227c3919fa0e5532d2aee82
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_populate_lic unihash changed to 3918a379ec5a78e693c8f518f65282604a673472479bcd2896a57285e3e2a80e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_populate_lic unihash changed to df5e5e4b210c5e843a8b06e8357eae48c58a96b3e231c8e12fce620bdd0cc270
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_populate_lic unihash changed to 4d98bdc8d99b81696d8b798f82c5f5e8c2f6c7f3ba96d4e3a18ffbc8742bc31c
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1272 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running task 2261 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2263 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1326 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1328 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1329 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_lic unihash changed to 23d9977c9e20f800acad2f3d10a2a739a6eb3026cdf160549589becc0116782a
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch unihash changed to e42b4c747f22792b21ab25394c1e3cadd6fb3fafcc92ae6f2e445a00385109a8
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1334 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1335 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1337 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1339 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2638 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2703 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata)
NOTE: Running task 2743 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2759 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2966 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2998 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3001 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3110 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3223 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.58.2-r0: task do_unpack: Succeeded
NOTE: Running task 3240 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.70-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3241 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_patch)
NOTE: Running task 3250 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_collect_spdx_deps)
NOTE: Running task 3251 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_configure)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3270 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3311 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.70-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3312 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.58.2-r0: task do_patch: Started
NOTE: Running task 3313 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3316 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libcap-2.70-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libcap-2.70-r0: task do_configure: Succeeded
NOTE: Running task 3337 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 3338 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_compile)
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: Running task 3368 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3375 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3376 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe librsvg-2.58.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.70-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3378 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_rust_gen_targets)
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure: Started
NOTE: Running task 3379 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3380 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_rust_gen_targets: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3382 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3383 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure)
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_configure: Started
NOTE: recipe libcap-2.70-r0: task do_compile: Succeeded
NOTE: Running task 3384 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_install)
NOTE: recipe libcap-2.70-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3385 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3386 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libcap-2.70-r0: task do_install: Succeeded
NOTE: Running task 3388 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package)
NOTE: recipe libcap-2.70-r0: task do_package: Started
NOTE: recipe libcap-2.70-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_package unihash changed to 5c30df9496fcaea75ad6666a9dbdcfe2b9a7c55061f2456eaeaaf16e23024050
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata became valid
NOTE: Running setscene task 1339 of 1339 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3389 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure: Succeeded
NOTE: Running task 3390 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_configure_ptest_base)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3392 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3393 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile: Started
NOTE: recipe libcap-2.70-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3394 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: Running task 3395 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3396 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3397 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3398 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3399 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: Running task 3400 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to ce565e506fb70010d42d39b977edb29e003b4c5bc9cf0f74af1fa1c73fd0f506
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3401 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: Running task 3402 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 3403 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3404 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 3405 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 64463b1fe66766a816490bb26dc4eeda0512e6deef665713de0b3d95fb8a9f13
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3406 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: Running task 3407 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 3408 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3409 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_package)
NOTE: Running task 3410 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_package: Succeeded
NOTE: Running task 3411 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata unihash changed to e064d40c4960fa9bda5bcb3204515d17eb102159dd866a8af4f9f2bb92a69b05
NOTE: Setscene tasks completed
NOTE: Running task 3412 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile: Succeeded
NOTE: Running task 3413 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3414 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install: Succeeded
NOTE: Running task 3415 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3416 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_populate_sysroot)
NOTE: Running task 3417 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_package)
NOTE: recipe dbus-1.14.10-r0: task do_configure: Succeeded
NOTE: Running task 3418 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_package: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3419 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile)
NOTE: recipe dbus-1.14.10-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3420 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3421 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile: Succeeded
NOTE: Running task 3422 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3423 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install)
NOTE: recipe dbus-1.14.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_package: Succeeded
NOTE: Running task 3424 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.10-r0: task do_install: Succeeded
NOTE: Running task 3425 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_packagedata unihash changed to 134ac297e763e0db20287c17d54aaf43b29811c6eb0d8e9c7d1846e7319bee82
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.10-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3426 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot)
NOTE: Running task 3427 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package)
NOTE: Running task 3428 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_create_spdx)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.14.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3429 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3430 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3431 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.67-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.67-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3432 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_configure)
NOTE: recipe ell-0.67-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3433 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3434 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_package: Succeeded
NOTE: Running task 3435 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 3436 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata unihash changed to 3abc3454693100b265f649260ea4a18be6c82f27fbf050ece0e15bb66b3533e0
NOTE: Setscene tasks completed
NOTE: Running task 3437 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3438 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_collect_spdx_deps)
NOTE: Running task 3439 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 3440 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 3441 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe ell-0.67-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe ell-0.67-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3442 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3443 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3444 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.58.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3445 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3446 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.58.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3447 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_rust_create_wrappers)
NOTE: recipe ell-0.67-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3448 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_compile)
NOTE: recipe ell-0.67-r0: task do_compile: Started
NOTE: recipe librsvg-2.58.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.58.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3449 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_configure)
NOTE: recipe librsvg-2.58.2-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 3450 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe ell-0.67-r0: task do_compile: Succeeded
NOTE: Running task 3451 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe ell-0.67-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to 1ea88ec75acc8bddbf7d36a43287e6e9fa63c8df0e878268c272ae32b1e5c57e
NOTE: recipe ell-0.67-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3452 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3453 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_package)
NOTE: Running task 3454 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: Running task 3455 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe ell-0.67-r0: task do_populate_sysroot: Started
NOTE: recipe ell-0.67-r0: task do_package: Started
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe ell-0.67-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3456 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: Running task 3457 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: Running task 3458 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3459 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe ell-0.67-r0: task do_package: Succeeded
NOTE: Running task 3460 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_packagedata)
NOTE: recipe ell-0.67-r0: task do_packagedata: Started
NOTE: recipe ell-0.67-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_packagedata unihash changed to a5eb9d8b829bd833619915256a063548c9d3e3070436e108482309d3ff46a228
NOTE: Setscene tasks completed
NOTE: Running task 3461 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_create_spdx)
NOTE: recipe ell-0.67-r0: task do_create_spdx: Started
NOTE: recipe ell-0.67-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3462 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: Running task 3463 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.58.2-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 3464 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 3465 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: Running task 3466 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 3467 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 3468 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: Running task 3469 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3470 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3471 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_configure)
NOTE: recipe bluez5-5.77-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3472 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Running task 3473 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3474 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package)
NOTE: Running task 3475 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata unihash changed to fa01d470048e66c8f220cc1dbf2b0e7c0ad253f20f03fd51297999787e5710d1
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3476 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3477 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: Running task 3478 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 3479 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3480 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3481 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to a032f25d1e2fd7f8bbadc81aa17a882efaf6b6909e5d076a011caccb6ea3fd03
NOTE: Setscene tasks completed
NOTE: Running task 3482 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3483 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3484 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3485 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3486 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 3487 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 3488 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_compile: Started
NOTE: recipe bluez5-5.77-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3489 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.77-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.77-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3490 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_compile)
NOTE: recipe bluez5-5.77-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3491 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3492 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata unihash changed to 5d319cfc7bf9341878a46fa17450b7f42f4c165996f2b9fde97c7e363e8da869
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3493 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx)
NOTE: Running task 3494 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3495 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3496 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package)
NOTE: Running task 3497 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_create_spdx)
NOTE: Running task 3498 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3499 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_write_deb)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package: Started
NOTE: Running task 3500 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_write_rpm)
NOTE: Running task 3501 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3502 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_collect_spdx_deps)
NOTE: Running task 3503 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_collect_spdx_deps)
NOTE: Running task 3504 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3505 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3506 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package)
NOTE: Running task 3507 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_qa unihash changed to 54d008155b4ee58b3443e74d153e7928ec9efb581b0418ffb050b85348d5ffba
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3508 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.77-r0: task do_compile: Succeeded
NOTE: Running task 3509 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.77-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3510 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_create_spdx)
NOTE: Running task 3511 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3512 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_write_deb)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3513 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_write_rpm)
NOTE: Running task 3514 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3515 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_package_spdx: Started
NOTE: Running task 3516 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_qa unihash changed to 3ecc5d733862b1463bef2f562d40f8911e6f865cb34ae08571374df8f0fc9c85
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3517 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_create_spdx)
NOTE: Running task 3518 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3519 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_write_deb)
NOTE: Running task 3520 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_write_rpm)
NOTE: Running task 3521 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3522 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_qa unihash changed to 7bfb08bd094b683c05b4847b670c1438ad4a2fdf82c6dfdc43d51b15f0166e60
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3523 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_build)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3524 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_build)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3525 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_build)
NOTE: recipe librsvg-2.58.2-r0: task do_compile: Succeeded
NOTE: Running task 3526 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_install)
NOTE: recipe librsvg-2.58.2-r0: task do_install: Started
NOTE: recipe librsvg-2.58.2-r0: task do_install: Succeeded
NOTE: Running task 3527 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_package)
NOTE: Running task 3528 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot)
NOTE: recipe librsvg-2.58.2-r0: task do_package: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.58.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.58.2-r0: task do_package: Succeeded
NOTE: Running task 3529 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata)
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.58.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_packagedata unihash changed to 61f5eb86323f98aeef50468b12dd952bef320662d57074f22104d33ce8a62886
NOTE: Setscene tasks completed
NOTE: Running task 3530 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_create_spdx)
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.58.2-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3531 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_install)
NOTE: recipe bluez5-5.77-r0: task do_install: Started
NOTE: recipe bluez5-5.77-r0: task do_install: Succeeded
NOTE: Running task 3532 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.77-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.77-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3533 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_populate_sysroot)
NOTE: Running task 3534 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_package)
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.77-r0: task do_package: Started
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3535 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3536 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3537 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_configure)
NOTE: recipe ofono-2.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3538 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Started
NOTE: recipe bluez5-5.77-r0: task do_package: Succeeded
NOTE: Running task 3539 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata)
NOTE: recipe bluez5-5.77-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.77-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata unihash changed to 89848a6a87a5fc22c129339fb4365ac3086dd8629b91272cc373408d5ba3f145
NOTE: Setscene tasks completed
NOTE: Running task 3540 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_create_spdx)
NOTE: recipe bluez5-5.77-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 3541 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_collect_spdx_deps)
NOTE: Running task 3542 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3543 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_compile)
NOTE: recipe ofono-2.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3544 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Started
NOTE: recipe ofono-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3545 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_install)
NOTE: recipe ofono-2.9-r0: task do_install: Started
NOTE: recipe ofono-2.9-r0: task do_install: Succeeded
NOTE: Running task 3546 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_populate_sysroot)
NOTE: Running task 3547 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_package)
NOTE: recipe ofono-2.9-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.9-r0: task do_package: Started
NOTE: recipe ofono-2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3548 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3549 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Started
NOTE: recipe ofono-2.9-r0: task do_package: Succeeded
NOTE: Running task 3550 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_packagedata)
NOTE: recipe ofono-2.9-r0: task do_packagedata: Started
NOTE: recipe ofono-2.9-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_packagedata unihash changed to 4379fa748796f3a6fcbb9194ea42a84a4073abba717e08998e0f82d581828444
NOTE: Setscene tasks completed
NOTE: Running task 3551 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_create_spdx)
NOTE: recipe ofono-2.9-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3552 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3553 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_compile)
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Succeeded
NOTE: Running task 3554 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_install: Succeeded
NOTE: Running task 3555 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot)
NOTE: Running task 3556 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package)
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3557 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.32.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.32.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3558 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_configure)
NOTE: recipe mpg123-1.32.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3559 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3560 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package)
NOTE: Running task 3561 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_package: Succeeded
NOTE: Running task 3562 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata)
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata unihash changed to 79a170a56138ee145605220e81bd8ff8759cdcb64c822ed6a525a43f8d51c020
NOTE: Setscene tasks completed
NOTE: Running task 3563 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_create_spdx)
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Started
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3564 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.32.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.32.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3565 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_compile)
NOTE: recipe mpg123-1.32.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_compile: Started
NOTE: recipe mpg123-1.32.6-r0: task do_compile: Succeeded
NOTE: Running task 3566 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_install)
NOTE: recipe mpg123-1.32.6-r0: task do_install: Started
NOTE: recipe mpg123-1.32.6-r0: task do_install: Succeeded
NOTE: Running task 3567 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_package)
NOTE: Running task 3568 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.32.6-r0: task do_populate_sysroot: Started
NOTE: recipe mpg123-1.32.6-r0: task do_package: Started
NOTE: recipe mpg123-1.32.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3569 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3570 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.6-r0: task do_package: Succeeded
NOTE: Running task 3571 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_packagedata)
NOTE: recipe mpg123-1.32.6-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.32.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_packagedata unihash changed to 440fb74b18940513efad08866c130b1d0142eb5fcb75ab2340159b5e31cd1e7b
NOTE: Setscene tasks completed
NOTE: Running task 3572 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_create_spdx)
NOTE: recipe mpg123-1.32.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3573 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata: Started
NOTE: recipe mpg123-1.32.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3574 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3575 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_create_spdx)
NOTE: Running task 3576 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3577 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_write_deb)
NOTE: Running task 3578 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3579 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3580 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3581 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_qa unihash changed to fed06917cc5a5fa2badadba2e48272ad288787c56dd8092bcb653c65512f945c
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3582 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_build)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3583 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3584 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package)
NOTE: Running task 3585 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3586 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3587 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_create_spdx)
NOTE: Running task 3588 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3589 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_write_deb)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3590 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_write_rpm)
NOTE: Running task 3591 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3592 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_qa unihash changed to 3136e1316a437a94d27a86c3e0f803997a5637f295b7cf4f5a7806191ef54e65
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3593 of 3593 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3593 tasks of which 3264 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst-src went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst-dbg went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst-staticdev went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst-dev went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst-doc went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst-locale went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxtst went backwards which would break package feeds (from 1:1.2.5-r0 to 1:1.2.4-r0) [version-going-backwards]
ERROR: libxtst-1_1.2.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3035977969857895494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2405.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2405.0", added "/usr/lib/libgstanalytics-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2405.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2405.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2405.0", added "/usr/lib/libgstcodecs-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2405.0", added "/usr/lib/libgstcuda-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2405.0", added "/usr/lib/libgstdxva-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2405.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2405.0", added "/usr/lib/libgstisoff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2405.0", added "/usr/lib/libgstmpegts-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2405.0", added "/usr/lib/libgstmse-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2405.0", added "/usr/lib/libgstphotography-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2405.0", added "/usr/lib/libgstplay-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2405.0", added "/usr/lib/libgstplayer-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2405.0", added "/usr/lib/libgstsctp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2405.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2405.0", added "/usr/lib/libgstvulkan-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2405.0", added "/usr/lib/libgstwayland-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2405.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2406.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2405.0 to libgstadaptivedemux-1.0.so.0.2406.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2405.0 to libgstanalytics-1.0.so.0.2406.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2405.0 to libgstbadaudio-1.0.so.0.2406.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2405.0 to libgstbasecamerabinsrc-1.0.so.0.2406.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2405.0 to libgstcodecparsers-1.0.so.0.2406.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2405.0 to libgstcodecs-1.0.so.0.2406.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2405.0 to libgstcuda-1.0.so.0.2406.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2405.0 to libgstdxva-1.0.so.0.2406.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2405.0 to libgstinsertbin-1.0.so.0.2406.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2405.0 to libgstisoff-1.0.so.0.2406.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2405.0 to libgstmpegts-1.0.so.0.2406.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2405.0 to libgstmse-1.0.so.0.2406.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2405.0 to libgstphotography-1.0.so.0.2406.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2405.0 to libgstplay-1.0.so.0.2406.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2405.0 to libgstplayer-1.0.so.0.2406.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2405.0 to libgstsctp-1.0.so.0.2406.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2405.0 to libgsturidownloader-1.0.so.0.2406.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2405.0 to libgstvulkan-1.0.so.0.2406.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2405.0 to libgstwayland-1.0.so.0.2406.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2405.0 to libgstwebrtc-1.0.so.0.2406.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2405.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2406.0
  /usr/lib/libgstanalytics-1.0.so.0.2405.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2406.0
  /usr/lib/libgstbadaudio-1.0.so.0.2405.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2406.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2405.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2406.0
  /usr/lib/libgstcodecs-1.0.so.0.2405.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2406.0
  /usr/lib/libgstcuda-1.0.so.0.2405.0 moved to /usr/lib/libgstcuda-1.0.so.0.2406.0
  /usr/lib/libgstdxva-1.0.so.0.2405.0 moved to /usr/lib/libgstdxva-1.0.so.0.2406.0
  /usr/lib/libgstinsertbin-1.0.so.0.2405.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2406.0
  /usr/lib/libgstisoff-1.0.so.0.2405.0 moved to /usr/lib/libgstisoff-1.0.so.0.2406.0
  /usr/lib/libgstmpegts-1.0.so.0.2405.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2406.0
  /usr/lib/libgstmse-1.0.so.0.2405.0 moved to /usr/lib/libgstmse-1.0.so.0.2406.0
  /usr/lib/libgstphotography-1.0.so.0.2405.0 moved to /usr/lib/libgstphotography-1.0.so.0.2406.0
  /usr/lib/libgstplay-1.0.so.0.2405.0 moved to /usr/lib/libgstplay-1.0.so.0.2406.0
  /usr/lib/libgstplayer-1.0.so.0.2405.0 moved to /usr/lib/libgstplayer-1.0.so.0.2406.0
  /usr/lib/libgstsctp-1.0.so.0.2405.0 moved to /usr/lib/libgstsctp-1.0.so.0.2406.0
  /usr/lib/libgsturidownloader-1.0.so.0.2405.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2406.0
  /usr/lib/libgstvulkan-1.0.so.0.2405.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2406.0
  /usr/lib/libgstwayland-1.0.so.0.2405.0 moved to /usr/lib/libgstwayland-1.0.so.0.2406.0
  /usr/lib/libgstwebrtc-1.0.so.0.2405.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2406.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGSIZE changed from 118960 to 132528 (+11%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2405.0", added "/usr/lib/libgstallocators-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2405.0", added "/usr/lib/libgstapp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2405.0", added "/usr/lib/libgstaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2405.0", added "/usr/lib/libgstfft-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2405.0", added "/usr/lib/libgstgl-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2405.0", added "/usr/lib/libgstpbutils-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2405.0", added "/usr/lib/libgstriff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2405.0", added "/usr/lib/libgstrtp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2405.0", added "/usr/lib/libgstrtsp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2405.0", added "/usr/lib/libgstsdp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2405.0", added "/usr/lib/libgsttag-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2405.0", added "/usr/lib/libgstvideo-1.0.so.0.2406.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2405.0 to libgstallocators-1.0.so.0.2406.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2405.0 to libgstapp-1.0.so.0.2406.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2405.0 to libgstaudio-1.0.so.0.2406.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2405.0 to libgstfft-1.0.so.0.2406.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2405.0 to libgstgl-1.0.so.0.2406.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2405.0 to libgstpbutils-1.0.so.0.2406.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2405.0 to libgstriff-1.0.so.0.2406.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2405.0 to libgstrtp-1.0.so.0.2406.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2405.0 to libgstrtsp-1.0.so.0.2406.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2405.0 to libgstsdp-1.0.so.0.2406.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2405.0 to libgsttag-1.0.so.0.2406.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2405.0 to libgstvideo-1.0.so.0.2406.0
  /usr/lib/libgstallocators-1.0.so.0.2405.0 moved to /usr/lib/libgstallocators-1.0.so.0.2406.0
  /usr/lib/libgstapp-1.0.so.0.2405.0 moved to /usr/lib/libgstapp-1.0.so.0.2406.0
  /usr/lib/libgstaudio-1.0.so.0.2405.0 moved to /usr/lib/libgstaudio-1.0.so.0.2406.0
  /usr/lib/libgstfft-1.0.so.0.2405.0 moved to /usr/lib/libgstfft-1.0.so.0.2406.0
  /usr/lib/libgstgl-1.0.so.0.2405.0 moved to /usr/lib/libgstgl-1.0.so.0.2406.0
  /usr/lib/libgstpbutils-1.0.so.0.2405.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2406.0
  /usr/lib/libgstriff-1.0.so.0.2405.0 moved to /usr/lib/libgstriff-1.0.so.0.2406.0
  /usr/lib/libgstrtp-1.0.so.0.2405.0 moved to /usr/lib/libgstrtp-1.0.so.0.2406.0
  /usr/lib/libgstrtsp-1.0.so.0.2405.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2406.0
  /usr/lib/libgstsdp-1.0.so.0.2405.0 moved to /usr/lib/libgstsdp-1.0.so.0.2406.0
  /usr/lib/libgsttag-1.0.so.0.2405.0 moved to /usr/lib/libgsttag-1.0.so.0.2406.0
  /usr/lib/libgstvideo-1.0.so.0.2405.0 moved to /usr/lib/libgstvideo-1.0.so.0.2406.0
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2405.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2406.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2405.0 to libgstrtspserver-1.0.so.0.2406.0
  /usr/lib/libgstrtspserver-1.0.so.0.2405.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2406.0

--===============3035977969857895494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-accurip: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmdec: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-adpcmenc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aes: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-aiff: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analytics-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-analyticsoverlay: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-apps: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-asfmux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiobuffersplit: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiofxbad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiolatency: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiomixmatrix: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-audiovisualizers: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-autoconvert: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-badaudio-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bayer: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bluez: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-bz2: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-camerabin: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-closedcaption: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecalpha: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codecs-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-codectimestamper: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-coloreffects: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-cuda-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-curl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dash: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstwayland-1.0.so.0.2405.0 /usr/lib/.debug/libgstmse-1.0.so.0.2405.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2405.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2405.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2405.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2405.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2405.0 /usr/lib/.debug/libgstplay-1.0.so.0.2405.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2405.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2405.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2405.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2405.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2405.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2405.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2405.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2405.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2405.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2405.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2405.0 /usr/lib/.deb
 ug/libgstphotography-1.0.so.0.2405.0", added "/usr/lib/.debug/libgstwayland-1.0.so.0.2406.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2406.0 /usr/lib/.debug/libgstmse-1.0.so.0.2406.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2406.0 /usr/lib/.debug/libgstplay-1.0.so.0.2406.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2406.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2406.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2406.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2406.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2406.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2406.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2406.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2406.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2406.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2406.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2406.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2406.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2406.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2406.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 28533384 to 28536272 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-debugutilsbad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-decklink: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dtls: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsubenc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvbsuboverlay: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dvdspu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dxva-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-faceoverlay: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fbdevsink: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-festival: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-fieldanalysis: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-freeverb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-frei0r: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gaudieffects: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-gdp: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-geometrictransform: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-glib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-hls: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-id3tag: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-insertbin: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-inter: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-interlace: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ipcpipeline: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivfparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ivtc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jp2kdecimator: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-jpegformat: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-legacyrawparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-af: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ast: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-az: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-bg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ca: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-cs: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-da: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-de: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-el: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-en-gb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eo: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-es: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-eu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-fur: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-gl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-hu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-id: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-it: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ja: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ka: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ky: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-lv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-mt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-nl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-or: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-pt-br: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ro: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-ru: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sq: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-sv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-tr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-uk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-vi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-cn: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-locale-zh-tw: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-meta: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-midi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsdemux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegpsmux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegts-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsdemux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mpegtsmux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-mxf: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-netsim: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pcapparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-play-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-player-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-pnm: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-proxy: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-removesilence: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rfbsrc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rist: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rsvg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtmp2: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtpmanagerbad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-rtponvif: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sbc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sdpelem: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-segmentclip: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-shm: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-siren: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smooth: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-smoothstreaming: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-sndfile: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-speed: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGSIZE changed from 16896039 to 16898350 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-subenc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-switchbin: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-timecode: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcode: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-transcoder-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-ttmlsubs: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-unixfd: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvcgadget: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-uvch264: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videofiltersbad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoframe-audiolevel: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videoparsersbad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-videosignal: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vmnc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkan: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanwayland-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-vulkanxcb-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-waylandsink: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webp: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-webrtc-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-y4mdec: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.5.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.6.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2405.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2405.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2405.0", added "/usr/lib/libgstanalytics-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2405.0", added "/usr/lib/libgstanalytics-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2405.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2405.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2405.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2405.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2405.0", added "/usr/lib/libgstcodecs-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2405.0", added "/usr/lib/libgstcodecs-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2405.0", added "/usr/lib/libgstcuda-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2405.0", added "/usr/lib/libgstcuda-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2405.0", added "/usr/lib/libgstdxva-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2405.0", added "/usr/lib/libgstdxva-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2405.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2405.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2405.0", added "/usr/lib/libgstisoff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2405.0", added "/usr/lib/libgstisoff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2405.0", added "/usr/lib/libgstmpegts-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2405.0", added "/usr/lib/libgstmpegts-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2405.0", added "/usr/lib/libgstmse-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2405.0", added "/usr/lib/libgstmse-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2405.0", added "/usr/lib/libgstphotography-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2405.0", added "/usr/lib/libgstphotography-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2405.0", added "/usr/lib/libgstplay-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2405.0", added "/usr/lib/libgstplay-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2405.0", added "/usr/lib/libgstplayer-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2405.0", added "/usr/lib/libgstplayer-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2405.0", added "/usr/lib/libgstsctp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2405.0", added "/usr/lib/libgstsctp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2405.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2405.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2405.0", added "/usr/lib/libgstvulkan-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2405.0", added "/usr/lib/libgstvulkan-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2405.0", added "/usr/lib/libgstwayland-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2405.0", added "/usr/lib/libgstwayland-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2405.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2405.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.24.5" to "1.24.6"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-bad (sysroot):
  /usr/lib/libgstadaptivedemux-1.0.so.0 changed symlink target from libgstadaptivedemux-1.0.so.0.2405.0 to libgstadaptivedemux-1.0.so.0.2406.0
  /usr/lib/libgstanalytics-1.0.so.0 changed symlink target from libgstanalytics-1.0.so.0.2405.0 to libgstanalytics-1.0.so.0.2406.0
  /usr/lib/libgstbadaudio-1.0.so.0 changed symlink target from libgstbadaudio-1.0.so.0.2405.0 to libgstbadaudio-1.0.so.0.2406.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0 changed symlink target from libgstbasecamerabinsrc-1.0.so.0.2405.0 to libgstbasecamerabinsrc-1.0.so.0.2406.0
  /usr/lib/libgstcodecparsers-1.0.so.0 changed symlink target from libgstcodecparsers-1.0.so.0.2405.0 to libgstcodecparsers-1.0.so.0.2406.0
  /usr/lib/libgstcodecs-1.0.so.0 changed symlink target from libgstcodecs-1.0.so.0.2405.0 to libgstcodecs-1.0.so.0.2406.0
  /usr/lib/libgstcuda-1.0.so.0 changed symlink target from libgstcuda-1.0.so.0.2405.0 to libgstcuda-1.0.so.0.2406.0
  /usr/lib/libgstdxva-1.0.so.0 changed symlink target from libgstdxva-1.0.so.0.2405.0 to libgstdxva-1.0.so.0.2406.0
  /usr/lib/libgstinsertbin-1.0.so.0 changed symlink target from libgstinsertbin-1.0.so.0.2405.0 to libgstinsertbin-1.0.so.0.2406.0
  /usr/lib/libgstisoff-1.0.so.0 changed symlink target from libgstisoff-1.0.so.0.2405.0 to libgstisoff-1.0.so.0.2406.0
  /usr/lib/libgstmpegts-1.0.so.0 changed symlink target from libgstmpegts-1.0.so.0.2405.0 to libgstmpegts-1.0.so.0.2406.0
  /usr/lib/libgstmse-1.0.so.0 changed symlink target from libgstmse-1.0.so.0.2405.0 to libgstmse-1.0.so.0.2406.0
  /usr/lib/libgstphotography-1.0.so.0 changed symlink target from libgstphotography-1.0.so.0.2405.0 to libgstphotography-1.0.so.0.2406.0
  /usr/lib/libgstplay-1.0.so.0 changed symlink target from libgstplay-1.0.so.0.2405.0 to libgstplay-1.0.so.0.2406.0
  /usr/lib/libgstplayer-1.0.so.0 changed symlink target from libgstplayer-1.0.so.0.2405.0 to libgstplayer-1.0.so.0.2406.0
  /usr/lib/libgstsctp-1.0.so.0 changed symlink target from libgstsctp-1.0.so.0.2405.0 to libgstsctp-1.0.so.0.2406.0
  /usr/lib/libgsturidownloader-1.0.so.0 changed symlink target from libgsturidownloader-1.0.so.0.2405.0 to libgsturidownloader-1.0.so.0.2406.0
  /usr/lib/libgstvulkan-1.0.so.0 changed symlink target from libgstvulkan-1.0.so.0.2405.0 to libgstvulkan-1.0.so.0.2406.0
  /usr/lib/libgstwayland-1.0.so.0 changed symlink target from libgstwayland-1.0.so.0.2405.0 to libgstwayland-1.0.so.0.2406.0
  /usr/lib/libgstwebrtc-1.0.so.0 changed symlink target from libgstwebrtc-1.0.so.0.2405.0 to libgstwebrtc-1.0.so.0.2406.0
  /usr/lib/libgstadaptivedemux-1.0.so.0.2405.0 moved to /usr/lib/libgstadaptivedemux-1.0.so.0.2406.0
  /usr/lib/libgstanalytics-1.0.so.0.2405.0 moved to /usr/lib/libgstanalytics-1.0.so.0.2406.0
  /usr/lib/libgstbadaudio-1.0.so.0.2405.0 moved to /usr/lib/libgstbadaudio-1.0.so.0.2406.0
  /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0 moved to /usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0
  /usr/lib/libgstcodecparsers-1.0.so.0.2405.0 moved to /usr/lib/libgstcodecparsers-1.0.so.0.2406.0
  /usr/lib/libgstcodecs-1.0.so.0.2405.0 moved to /usr/lib/libgstcodecs-1.0.so.0.2406.0
  /usr/lib/libgstcuda-1.0.so.0.2405.0 moved to /usr/lib/libgstcuda-1.0.so.0.2406.0
  /usr/lib/libgstdxva-1.0.so.0.2405.0 moved to /usr/lib/libgstdxva-1.0.so.0.2406.0
  /usr/lib/libgstinsertbin-1.0.so.0.2405.0 moved to /usr/lib/libgstinsertbin-1.0.so.0.2406.0
  /usr/lib/libgstisoff-1.0.so.0.2405.0 moved to /usr/lib/libgstisoff-1.0.so.0.2406.0
  /usr/lib/libgstmpegts-1.0.so.0.2405.0 moved to /usr/lib/libgstmpegts-1.0.so.0.2406.0
  /usr/lib/libgstmse-1.0.so.0.2405.0 moved to /usr/lib/libgstmse-1.0.so.0.2406.0
  /usr/lib/libgstphotography-1.0.so.0.2405.0 moved to /usr/lib/libgstphotography-1.0.so.0.2406.0
  /usr/lib/libgstplay-1.0.so.0.2405.0 moved to /usr/lib/libgstplay-1.0.so.0.2406.0
  /usr/lib/libgstplayer-1.0.so.0.2405.0 moved to /usr/lib/libgstplayer-1.0.so.0.2406.0
  /usr/lib/libgstsctp-1.0.so.0.2405.0 moved to /usr/lib/libgstsctp-1.0.so.0.2406.0
  /usr/lib/libgsturidownloader-1.0.so.0.2405.0 moved to /usr/lib/libgsturidownloader-1.0.so.0.2406.0
  /usr/lib/libgstvulkan-1.0.so.0.2405.0 moved to /usr/lib/libgstvulkan-1.0.so.0.2406.0
  /usr/lib/libgstwayland-1.0.so.0.2405.0 moved to /usr/lib/libgstwayland-1.0.so.0.2406.0
  /usr/lib/libgstwebrtc-1.0.so.0.2405.0 moved to /usr/lib/libgstwebrtc-1.0.so.0.2406.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-basedebug: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstfft-1.0.so.0.2405.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2405.0 /usr/lib/.debug/libgstriff-1.0.so.0.2405.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2405.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2405.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2405.0 /usr/lib/.debug/libgstapp-1.0.so.0.2405.0 /usr/lib/.debug/libgstgl-1.0.so.0.2405.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2405.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2405.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2405.0 /usr/lib/.debug/libgsttag-1.0.so.0.2405.0", added "/usr/lib/.debug/libgstallocators-1.0.so.0.2406.0 /usr/lib/.debug/libgstgl-1.0.so.0.2406.0 /usr/lib/.debug/libgstriff-1.0.so.0.2406.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2406.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2406.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2406.0 /usr/lib/.debug/libgstapp-1.0.so.0.2406.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2406.0 /usr/lib/.debug/
 libgstsdp-1.0.so.0.2406.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2406.0 /usr/lib/.debug/libgstfft-1.0.so.0.2406.0 /usr/lib/.debug/libgsttag-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 18704728 to 18736056 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6216275 to 6216293 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dsd: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGSIZE changed from 664312 to 668408 (+1%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 14277763 to 14301638 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGSIZE changed from 118960 to 132528 (+11%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.5.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.6.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2405.0", added "/usr/lib/libgstallocators-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2405.0", added "/usr/lib/libgstallocators-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2405.0", added "/usr/lib/libgstapp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2405.0", added "/usr/lib/libgstapp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2405.0", added "/usr/lib/libgstaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2405.0", added "/usr/lib/libgstaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2405.0", added "/usr/lib/libgstfft-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2405.0", added "/usr/lib/libgstfft-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2405.0", added "/usr/lib/libgstgl-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2405.0", added "/usr/lib/libgstgl-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2405.0", added "/usr/lib/libgstpbutils-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2405.0", added "/usr/lib/libgstpbutils-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2405.0", added "/usr/lib/libgstriff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2405.0", added "/usr/lib/libgstriff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2405.0", added "/usr/lib/libgstrtp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2405.0", added "/usr/lib/libgstrtp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2405.0", added "/usr/lib/libgstrtsp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2405.0", added "/usr/lib/libgstrtsp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2405.0", added "/usr/lib/libgstsdp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2405.0", added "/usr/lib/libgstsdp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2405.0", added "/usr/lib/libgsttag-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2405.0", added "/usr/lib/libgsttag-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2405.0", added "/usr/lib/libgstvideo-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2405.0", added "/usr/lib/libgstvideo-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.24.5" to "1.24.6"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2405.0 to libgstallocators-1.0.so.0.2406.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2405.0 to libgstapp-1.0.so.0.2406.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2405.0 to libgstaudio-1.0.so.0.2406.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2405.0 to libgstfft-1.0.so.0.2406.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2405.0 to libgstgl-1.0.so.0.2406.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2405.0 to libgstpbutils-1.0.so.0.2406.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2405.0 to libgstriff-1.0.so.0.2406.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2405.0 to libgstrtp-1.0.so.0.2406.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2405.0 to libgstrtsp-1.0.so.0.2406.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2405.0 to libgstsdp-1.0.so.0.2406.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2405.0 to libgsttag-1.0.so.0.2406.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2405.0 to libgstvideo-1.0.so.0.2406.0
  /usr/lib/libgstallocators-1.0.so.0.2405.0 moved to /usr/lib/libgstallocators-1.0.so.0.2406.0
  /usr/lib/libgstapp-1.0.so.0.2405.0 moved to /usr/lib/libgstapp-1.0.so.0.2406.0
  /usr/lib/libgstaudio-1.0.so.0.2405.0 moved to /usr/lib/libgstaudio-1.0.so.0.2406.0
  /usr/lib/libgstfft-1.0.so.0.2405.0 moved to /usr/lib/libgstfft-1.0.so.0.2406.0
  /usr/lib/libgstgl-1.0.so.0.2405.0 moved to /usr/lib/libgstgl-1.0.so.0.2406.0
  /usr/lib/libgstpbutils-1.0.so.0.2405.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2406.0
  /usr/lib/libgstriff-1.0.so.0.2405.0 moved to /usr/lib/libgstriff-1.0.so.0.2406.0
  /usr/lib/libgstrtp-1.0.so.0.2405.0 moved to /usr/lib/libgstrtp-1.0.so.0.2406.0
  /usr/lib/libgstrtsp-1.0.so.0.2405.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2406.0
  /usr/lib/libgstsdp-1.0.so.0.2405.0 moved to /usr/lib/libgstsdp-1.0.so.0.2406.0
  /usr/lib/libgsttag-1.0.so.0.2405.0 moved to /usr/lib/libgsttag-1.0.so.0.2406.0
  /usr/lib/libgstvideo-1.0.so.0.2405.0 moved to /usr/lib/libgstvideo-1.0.so.0.2406.0
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 21682456 to 21682424 (-0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 13316998 to 13317041 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGSIZE changed from 783112 to 782936 (-0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ka: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGSIZE changed from 441794 to 442109 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2405.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2405.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2405.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.24.5" to "1.24.6"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2405.0 to libgstrtspserver-1.0.so.0.2406.0
  /usr/lib/libgstrtspserver-1.0.so.0.2405.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2406.0

--===============3035977969857895494==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-bad-gstreamer1.0-plugins-ugly-g.patch"

RnJvbSBkMTIxM2EzYTliZDUwZmJjZmU5YzlmNjU5YWRiOTlhN2UyOTlkNTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDg6NDY6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSAK
IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCxnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5LGdzdHJl
YW1lcjEuMC1ydHNwLXNlcnZlcixnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kLGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2U6CiB1cGdyYWRlIDEuMjQuNSAtPiAxLjI0LjYsMS4yNC41IC0+IDEuMjQu
NiwxLjI0LjUgLT4gMS4yNC42LDEuMjQuNSAtPgogMS4yNC42LDEuMjQuNSAtPiAxLjI0LjYKCi0t
LQogLi4uMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGluZy13
aXRoLnBhdGNoIHwgMiArLQogLi4uLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGly
ZWN0bHkucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogLi4uNC1vcGVuY3YtcmVzb2x2ZS1taXNz
aW5nLW9wZW5jdi1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoIHwgMiArLQogLi4ucGx1Z2lu
cy1iYWRfMS4yNC41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI0LjYuYmJ9IHwg
MiArLQogLi4uMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVy
eS1jYXBzLnBhdGNoIHwgMiArLQogLi4uLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1s
aW5lcy1wYXJzaW5nLnBhdGNoICAgICAgICAgIHwgMiArLQogLi4uLzAwMDMtdml2LWZiLU1ha2Ut
c3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCAgICAgICAgICAgIHwgMiArLQogLi4udWdp
bnMtYmFzZV8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0LjYuYmJ9
IHwgMiArLQogLi4udWdpbnMtZ29vZF8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZF8xLjI0LjYuYmJ9IHwgMiArLQogLi4udWdpbnMtdWdseV8xLjI0LjUuYmIgPT4gZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjYuYmJ9IHwgMiArLQogLi4ucnRzcC1zZXJ2ZXJfMS4y
NC41LmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjYuYmJ9IHwgMiArLQogMTEg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWRfMS4yNC41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI0LjYuYmJ9ICg5OCUp
CiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlXzEuMjQuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQu
Ni5iYn0gKDk4JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNC41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWdvb2RfMS4yNC42LmJifSAoOTclKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci97Z3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtdWdseV8xLjI0LjYuYmJ9ICg5NCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC41LmJiID0+
IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjYuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZC8wMDAxLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdp
dGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1j
b21waWxpbmctd2l0aC5wYXRjaAppbmRleCAxM2E0ODE0ODVhLi5kYTQ1NWM4YjIwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxp
bmctd2l0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2Fybmlu
Z3Mtd2hlbi1jb21waWxpbmctd2l0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmI3Zjk2
NGQ1MWRlNmI4ODhiM2I3YTZkMGMzZDI2MGZjYWQyNDAwOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNjUzZjE5NGMyY2UxNDFiYmI3YTc0NDBmNjVlYTI3OWNmNGZlM2Y3OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5j
b20+CiBEYXRlOiBUdWUsIDI2IEphbiAyMDE2IDE1OjE2OjAxIC0wODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGZpeCBtYXliZS11bmluaXRpYWxpemVkIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGgg
LU9zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0
bHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFkLzAwMDItYXZvaWQtaW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0
Y2gKaW5kZXggMjk4MzM3Y2IwYS4uOWI3N2JmZWI0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lk
LWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1p
bmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MjVlZmM1YjJkMjJhZWQ0NTI3NDcwZWY5Mzk3MDY2NGIyMTBiZjhjNSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNDQxYjkwMTk1YWZmMWVjZWNhOWVhNmRkMjI4NTQ2ZmEzYzE2YmY4NCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBn
bWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgRmViIDIwMTYgMTg6MDU6NDEgLTA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gYXZvaWQgaW5jbHVkaW5nIDxzeXMvcG9sbC5oPiBkaXJlY3RseQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhZC8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3Rv
LWJ1aWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1k
aXItaW4teW9jdG8tYnVpbC5wYXRjaAppbmRleCA5NjUwNTMzNDhmLi4wMjE0Y2UzZWVjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4t
eW9jdG8tYnVpbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVu
Y3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzlm
YmNkZmM1MzgzYmRhZTk1MjkzYTMxMDljODQ3ZjY0ZDE5M2I1NCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZDMxMjFlOGZlYmRiNWNiMDA1MTE2MjQ5ODNjMjRlNTA0NDFiNjRlOCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJleSBaaGl6aGlraW4gPGFuZHJleS56QGdt
YWlsLmNvbT4KIERhdGU6IE1vbiwgMjcgSmFuIDIwMjAgMTA6MjI6MzUgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gb3BlbmN2OiByZXNvbHZlIG1pc3Npbmcgb3BlbmN2IGRhdGEgZGlyIGluIHlvY3Rv
IGJ1aWxkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC42LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuNi5iYgpp
bmRleCA3NWVmYmFkNDljLi40OGU2OTU1MDM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuNS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkXzEuMjQuNi5iYgpAQCAtMTAsNyArMTAsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVh
bWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtYmFkL2dzdC1wbHVnaW5zLWJhZAog
ICAgICAgICAgICBmaWxlOi8vMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3Rs
eS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA0LW9wZW5jdi1yZXNvbHZlLW1pc3Npbmct
b3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMzAyOWJmZDcyNjUzMTRkNjA5ZGM4ZWFiNTAzNjc1YTM0NGVhNDZl
ODI3NGZkNzNhYjM0NTY2Yzg0NDJkYzg0NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZjRkOTY1
NTEzZTc4MjdjMWY1NDdjMWU3NDllNGVmMjgxMmIzNzE5NzRmZTY0ODU3ZmU1MDI5YTE5YzViNjRj
IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtYmFkLSR7UFZ9IgogCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1j
YXBzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdo
ZW4tcXVlcnktY2Fwcy5wYXRjaAppbmRleCAzOGQwZmJmNmJmLi4wYzJjMzRhYTBkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVy
eS1jYXBzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3Jj
LXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNGQ2NWUx
M2EzMjYxMDNhYzAyZjE1NmMwMWI2ZmNiYjAyNjk5MDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGZmZTY1YzNlNDk5ODA0MmIwMzBiOTFjMDlhNzA2YTAzNzY4YTFlNDAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2FsZS5jb20+CiBE
YXRlOiBXZWQsIDE0IE1heSAyMDE0IDEwOjE2OjIwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEVO
R1IwMDMxMjUxNTogZ2V0IGNhcHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVlcnkgY2FwcwpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVn
aW5zLWJhc2UvMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRj
aAppbmRleCA0MDkwYjc3YzhkLi5hYmNhNjJhNDkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBh
cnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNz
YXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMjFiODMzOTA3N2Y1MmVjOTIyMGUwZDNkMWYzODcyZTIzYzdjMmU4OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWNkNGRhN2Q0NzM5ZGNmYTJiNjY4OTllZjhhNDllNWVk
ODhkNDFiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdrZSBXYW5nIDxtaW5n
a2Uud2FuZ0BmcmVlc2NhbGUuY29tPgogRGF0ZTogVGh1LCAxOSBNYXIgMjAxNSAxNDoxNzoxMCAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBzc2FwYXJzZTogZW5oYW5jZSBTU0EgdGV4dCBsaW5lcyBw
YXJzaW5nLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlz
LWluY2x1ZGVkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWlu
Y2x1ZGVkLnBhdGNoCmluZGV4IGFiNDZlY2VlNWQuLjQwYzkxYzlkZjYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
LzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDI0NmU2ZjVlZDc1Njk2YjJlOWQ5YTllZThjZDU5MjUyNzI0ZTEzMzQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ4NjUyYmNmMDU3Yjc0NDYwZWFkZjhjYjk0
M2I2MzgxZmNhNDQyM2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYXJsb3MgUmFm
YWVsIEdpYW5pIDxjcmc3NDc1QG1haWxib3gub3JnPgogRGF0ZTogVHVlLCAyMSBNYXkgMjAxOSAx
NDowMToxMSArMDIwMAogU3ViamVjdDogW1BBVENIXSB2aXYtZmI6IE1ha2Ugc3VyZSBjb25maWcu
aCBpcyBpbmNsdWRlZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC41LmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC42LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuNS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Vf
MS4yNC42LmJiCmluZGV4IDlkMTllYTIzM2QuLjdjMzM5MGQ1MmQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEu
MjQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZV8xLjI0LjYuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWJhc2UvZ3N0
LXBsdWdpbnMtYmEKICAgICAgICAgICAgZmlsZTovLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25m
aWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLXNzYXBhcnNl
LWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIwZTMzZWM5YjU5ZWVmNWVmM2E2YTUzYmJkNTVjNDQzNDBlNjgx
ZDAwMDA5MTBjYWNhMTI1NDFhNzNkYjM4YTdkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNmNTJi
NTM1YTBjZTdlYzk3NDc1Njg5MTgxOGYzNGYwNjMxN2MyZTEzNmFiYjI0MTQ5ZTE4YzIzZWNjMjI5
YjUiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1iYXNlLSR7UFZ9IgogCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtZ29vZF8xLjI0LjUuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWdvb2RfMS4yNC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjYuYmIKaW5kZXggMWMzM2Zm
ZGUwMC4uOWQ5M2NhMDk2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNC41LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQu
Ni5iYgpAQCAtNiw3ICs2LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWdvb2QvLS9pc3N1ZXMKIAogU1JDX1VSSSA9
ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdvb2Qv
Z3N0LXBsdWdpbnMtZ29vZC0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJi
YWRjZmM1MjkyYjAzNWJkZTk5YTc3MzI3ZDQ2OGIyZjBiMTE2YjQwNDIwYmM5ZjI1ZmI4ZTM5NzA4
MjRiYTc1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk5NmI5YzhkMWQyNDZlZDQzYmUzMDQ3MThi
NjA4NmU1YTE3ZDRhZTgxMTRkMTkyMGFlZDllYTc1YjkyMGJhMmQiCiAKIFMgPSAiJHtXT1JLRElS
fS9nc3QtcGx1Z2lucy1nb29kLSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjUuYmIgYi9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWds
eV8xLjI0LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC41LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtdWdseV8xLjI0LjYuYmIKaW5kZXggNmNhZTYxZWQzNS4uN2I3ZGU3NWRhYyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
bHVnaW5zLXVnbHlfMS4yNC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuNi5iYgpAQCAtMTUsNyArMTUsNyBA
QCBTUkNfVVJJID0gIiBcCiAgICAgICAgICAgICBodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3Rv
cC5vcmcvc3JjL2dzdC1wbHVnaW5zLXVnbHkvZ3N0LXBsdWdpbnMtdWdseS0ke1BWfS50YXIueHog
XAogICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzMzMjY3YjZlMDA3NzA0
NDBhNGEwMDQwMjkxMGRkNTllZDhmZDYxOWVhZWJmNDAyODE1ZmJlMTExZGE3Nzc2ZCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1ZGZkYmIyOTc4YWIyODJlNjM3MjU1Y2Q4NzVjZjViN2I5M2ZjODNk
YjYyZjhhMGIxYWYwMmM4NWM4NGE3NWM0IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMt
dWdseS0ke1BWfSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjUuYmIgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNi5iYgpzaW1p
bGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0
LjYuYmIKaW5kZXggOTk3MWVlZTQ4ZS4uY2RiNzRhZmJmYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1y
dHNwLXNlcnZlcl8xLjI0LjYuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUE5SRUFMID0gImdzdC1ydHNw
LXNlcnZlciIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcv
c3JjLyR7UE5SRUFMfS8ke1BOUkVBTH0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYTMwNjI2NjVlNDE4MTRkM2RiYTNlMDJiN2IwNmI3NzMyNmQ1NGQyYjZmMTc4ZmZjYjE5
NmFmOWI5MWExYmZiOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMGJkZGEyNjE3M2YxM2Y1NTIx
YzgyOTM2Nzk2MzgyNGE3NGZkMGNlOGY1MmJjYWI2NzRkN2U3MjdmNzRlOTNjIgogCiBTID0gIiR7
V09SS0RJUn0vJHtQTlJFQUx9LSR7UFZ9IgogCi0tIAoyLjQ0LjAKCg==

--===============3035977969857895494==--

