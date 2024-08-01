Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C38C5321D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.75484.1722536823231731521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H+TMWQsu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XNS0AC0H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f3206a2-265294bd-ccc2-40f4-a351-2cec9cadcc64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DwUooDTpbAAxQDJiuE66IVQlJU2Iqpt0rfDyJ9QFYMQ=;
	b=H+TMWQsutdnosBDErTeVVE7dcA3HtL1NHrvTpCevG9PWXr+d5SxgPamJDJ+Sqpmf
	i7dUyx+7xW2o4X8bHk1nOwR8IgxCQrh0R5CcRhtt2j7XeJxtW8OKjXc6u6LwD67meI/
	05ZDHFcrien9Do4EThh/oWn/c8yO+BL0GIqnWplk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DwUooDTpbAAxQDJiuE66IVQlJU2Iqpt0rfDyJ9QFYMQ=;
	b=XNS0AC0H79AeX/2ZTpDrTtsSvRYgN0YOEMtcgyzquKiYy2ysxd0OO5C41AQTHKR2
	MppNu/BoeoP2xolrU4oZyp7Zx6fAtl2qvNQ5LByRYm8RYegmoyoIbapNvfCsosT5pQu
	uzD8g524uqNIIVFUrPLebZM4ils3y8ynlz446zmA=
Content-Type: multipart/mixed; boundary="===============1195728489911555465=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, 
	Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad:
 upgrading to 1.24.6,1.24.6,1.24.6,1.24.6,1.24.6 SUCCEEDED
Message-ID: <010101910f3206a2-265294bd-ccc2-40f4-a351-2cec9cadcc64-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202776

--===============1195728489911555465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad* to *1.24.6,1.24.6,1.24.6,1.24.6,1.24.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-base-g.patch
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
From 2e4bc5947e40456fc28f1eeff7b7c46a7093e272 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 08:16:34 +0000
Subject: [PATCH] 
 gstreamer1.0-rtsp-server,gstreamer1.0-plugins-base,gstreamer1.0-plugins-good,gstreamer1.0-plugins-ugly,gstreamer1.0-plugins-bad:
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
index 13a481485a..7e59ebcb76 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From bb7f964d51de6b888b3b7a6d0c3d260fcad24008 Mon Sep 17 00:00:00 2001
+From 801b8120860ca25c18dfd693bc98700a7533f29f Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index 298337cb0a..d115f79dcc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 25efc5b2d22aed4527470ef93970664b210bf8c5 Mon Sep 17 00:00:00 2001
+From 577814931b83bab1804a69a603c169f21c636c2d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 965053348f..5830ff418a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 39fbcdfc5383bdae95293a3109c847f64d193b54 Mon Sep 17 00:00:00 2001
+From 127f8282a39cff58a1b887f3578f700adfa8981a Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
index 6766a8c19a..549770868c 100644
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
index 38d0fbf6bf..1a743567ff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 5a4d65e13a326103ac02f156c01b6fcbb0269902 Mon Sep 17 00:00:00 2001
+From 83c1aa1eae5d405836931378486cbde69c51d0e8 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 4090b77c8d..e595d87937 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 21b8339077f52ec9220e0d3d1f3872e23c7c2e88 Mon Sep 17 00:00:00 2001
+From e60b393ee5a2f8767a424a8fe24395e1cceb7c19 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index ab46ecee5d..a8de3d0659 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 246e6f5ed75696b2e9d9a9ee8cd59252724e1334 Mon Sep 17 00:00:00 2001
+From f73e5a48bdd8d0220488598aa2d3992a523b2974 Mon Sep 17 00:00:00 2001
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


--===============1195728489911555465==
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

--===============1195728489911555465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 130 recipes from the core2-64 sysroot...done.
Removing 134 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-51243a62ad713bf9ea4580433ab3faf631faa86d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:51243a62ad713bf9ea4580433ab3faf631faa86d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 972 Local 857 Mirrors 0 Missed 115 Current 369 (88% match, 91% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 9 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 380 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 437 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 439 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 454 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 463 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_create_spdx_setscene)
NOTE: Running setscene task 465 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 470 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 480 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.54.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 481 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 482 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 484 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 485 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 490 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 492 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lame-3.100-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.58.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 505 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 507 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.58.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 511 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.58.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 518 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 519 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 525 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 528 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 530 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 533 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 536 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 547 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 553 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-9.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 567 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 571 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 575 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 577 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 580 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 582 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-9.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 590 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 594 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 601 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 607 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 611 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 614 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 618 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 623 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 624 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 630 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 633 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 644 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_recipe_qa_setscene)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 653 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.32.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 660 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 661 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_create_spdx_setscene)
NOTE: recipe lame-3.100-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/lame/lame_3.100.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 675 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 679 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 695 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 696 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe lame-3.100-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 700 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 703 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 706 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 707 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 711 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 712 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 714 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.67-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 718 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 720 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.67-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_package_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 723 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 736 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 742 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe ofono-2.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20240407-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 754 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe speex-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 763 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 766 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.67-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 794 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 801 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 808 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 814 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 826 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 828 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 829 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_package_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 836 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 837 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 838 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 840 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 847 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.67-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 848 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 849 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_package_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 853 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 857 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ell-0.67-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 862 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 863 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 865 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe ell-0.67-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 870 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_package_setscene)
NOTE: Running setscene task 872 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 874 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 875 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 877 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 882 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 884 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 885 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_package_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 886 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 887 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 890 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 892 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 901 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 905 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 906 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 908 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 917 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 925 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 926 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 930 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 988 of 1341 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1047 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1048 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1050 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe taglib-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1054 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1055 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1058 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-native-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1059 of 1341 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1341 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1065 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1066 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1069 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1070 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1074 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe rust-native-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1077 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_package_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1081 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1082 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1083 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1084 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1085 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1086 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1087 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1088 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1090 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe taglib-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1093 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1094 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1097 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1101 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1102 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1103 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1106 of 1341 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1112 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1114 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1117 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libx11/1.8.9/temp/log.do_packagedata_setscene.1162171
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1118 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe utfcpp-4.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1123 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1124 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1125 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 930 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 940 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1072 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: Running task 1086 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: Running task 1097 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1098 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1106 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_fetch)
NOTE: Running setscene task 1128 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1108 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_fetch)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: Running task 1228 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_write_config)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: Running task 1242 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_fetch: Started
NOTE: Running task 1258 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: Running setscene task 1131 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.77-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1284 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_fetch: Succeeded
NOTE: Running task 1292 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1316 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1134 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1135 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1136 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1137 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1138 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1139 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_write_config: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_write_config: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1414 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: Running task 1416 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_fetch)
NOTE: Running task 1510 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1141 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1647 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_fetch)
NOTE: Running setscene task 1145 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1147 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1660 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1674 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_unpack: Succeeded
NOTE: Running task 1694 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_recipe_qa)
NOTE: Running task 1695 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1696 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe bluez5-5.77-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1697 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_patch)
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: recipe ell-0.67-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1699 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe ell-0.67-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1707 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_fetch)
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1710 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 1711 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1151 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.77-r0: task do_patch: Started
NOTE: Running setscene task 1153 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1728 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_unpack)
NOTE: recipe ofono-2.9-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ofono-2.9-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1740 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libusb1-1.0.27-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 1747 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_patch)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1760 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack)
NOTE: Running task 1764 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1155 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.67-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1156 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1765 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Started
NOTE: recipe ofono-2.9-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_patch: Succeeded
NOTE: Running task 1767 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1158 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: Running task 1774 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe libx11-1_1.8.9-r0: task do_package_setscene: Succeeded
NOTE: recipe ell-0.67-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 1160 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1161 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_patch: Succeeded
NOTE: Running setscene task 1164 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1806 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 1807 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1808 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_patch)
NOTE: recipe util-linux-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1167 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1168 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1169 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1170 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: Running setscene task 1171 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1172 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1174 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.9-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1819 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_patch: Succeeded
NOTE: Running setscene task 1176 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1820 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1822 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_fetch)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1178 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1179 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1180 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1181 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1183 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1184 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1185 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1187 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1188 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.58.1-r0: task do_fetch: Started
NOTE: Running setscene task 1189 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1190 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1192 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1194 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1196 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.58.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1200 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1202 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1208 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1212 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1214 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1217 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1218 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1221 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1223 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1226 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1231 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1233 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1235 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1237 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1238 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1241 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1242 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1244 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1247 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1251 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1252 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1254 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1259 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1260 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1261 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1265 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1266 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 1267 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1269 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1270 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1271 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1274 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1275 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1277 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1279 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1285 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1937 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_patch)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1291 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1293 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1295 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1297 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: Running task 1963 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1980 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_write_config)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1985 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: Running task 1993 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_unpack)
NOTE: Running task 2006 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: Running task 2009 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2029 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2074 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: Running task 2077 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_unpack)
NOTE: recipe librsvg-2.58.1-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2100 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2109 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_recipe_qa)
NOTE: Running task 2110 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_recipe_qa)
NOTE: Running task 2111 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2112 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2113 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_recipe_qa)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1304 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe mpg123-1.32.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_patch: Succeeded
NOTE: Running task 2130 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 2131 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_recipe_qa: Started
NOTE: Running task 2132 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2142 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2178 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_write_config)
NOTE: Running task 2179 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 2181 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_write_config)
NOTE: recipe mpg123-1.32.6-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1306 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2183 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_write_config: Started
NOTE: Running task 2184 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mpg123-1.32.6-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: Running task 2185 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_write_config)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1309 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2186 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2187 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_fetch)
NOTE: Running task 2188 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2189 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2244 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_lic)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_write_config: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1311 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1312 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2246 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_unpack)
NOTE: Running task 2247 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_lic: Started
NOTE: Running task 2248 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 2251 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_unpack)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_unpack: Started
NOTE: Running setscene task 1314 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1316 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_lic unihash changed to dbc95409e68096c7e115841725d070a22a3d147b5fa1172aab0148d1e166d7cf
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_unpack: Succeeded
NOTE: Running task 2252 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_patch)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_unpack: Succeeded
NOTE: Running task 2253 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_patch)
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1321 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_patch: Succeeded
NOTE: Running task 2258 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2259 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_patch: Succeeded
NOTE: Running task 2260 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2261 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_populate_lic)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_patch: Started
NOTE: Running setscene task 1328 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1329 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1331 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2268 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2269 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_populate_lic)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_populate_lic unihash changed to 3918a379ec5a78e693c8f518f65282604a673472479bcd2896a57285e3e2a80e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_populate_lic unihash changed to df5e5e4b210c5e843a8b06e8357eae48c58a96b3e231c8e12fce620bdd0cc270
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_populate_lic unihash changed to 4d98bdc8d99b81696d8b798f82c5f5e8c2f6c7f3ba96d4e3a18ffbc8742bc31c
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2288 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_lic unihash changed to 23d9977c9e20f800acad2f3d10a2a739a6eb3026cdf160549589becc0116782a
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1336 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1337 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1339 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1341 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2638 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2703 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata)
NOTE: Running task 2759 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2766 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3008 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3012 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3122 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3126 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3181 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3240 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_collect_spdx_deps)
NOTE: Running task 3257 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 75482368ea8bb62c21e5ad540fc5e8ee0e758e6ed6bace533e0f25309336c555
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.58.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3324 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.58.1-r0: task do_unpack: Succeeded
NOTE: Running task 3325 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure)
NOTE: Running task 3327 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_patch)
NOTE: Running task 3345 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 3366 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 3377 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Started
NOTE: Running task 3397 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_configure)
NOTE: Running task 3398 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3399 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: Running task 3400 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe librsvg-2.58.1-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3412 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3413 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3414 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe libusb1-1.0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3415 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.58.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3416 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx)
NOTE: recipe librsvg-2.58.1-r0: task do_patch: Succeeded
NOTE: Running task 3418 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_rust_create_wrappers)
NOTE: Running task 3419 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_rust_gen_targets)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.58.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.58.1-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.58.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3420 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe librsvg-2.58.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3421 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3422 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: Running task 3423 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_collect_spdx_deps)
NOTE: Running task 3424 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.58.1-r0: task do_configure: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.58.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.58.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3425 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_collect_spdx_deps)
NOTE: Running task 3426 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe ell-0.67-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe ell-0.67-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3427 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.67.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ell-0.67-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3428 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3429 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe ell-0.67-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 3430 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Running task 3431 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3432 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure: Succeeded
NOTE: Running task 3433 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3434 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3435 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: Running task 3436 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3437 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3438 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3439 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3440 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libusb1-1.0.27-r0: task do_configure: Succeeded
NOTE: Running task 3441 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3442 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile)
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 7c5abe343338f3014520b56d394af8dbbdcd6e87d7a40b92b61d41a98f9e7354
NOTE: recipe librsvg-2.58.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3443 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_compile)
NOTE: Running task 3444 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.58.1-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_compile: Succeeded
NOTE: Running task 3445 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: Running task 3446 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_compile_ptest_base)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 9070ba335f30cd1c5e023819d7b2ca5c2780f260087621d438c42d67ec5ce83d
NOTE: recipe libusb1-1.0.27-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3447 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install)
NOTE: Running task 3448 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: Running task 3449 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.27-r0: task do_install: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install: Succeeded
NOTE: Running task 3450 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_install_ptest_base)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.27-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3451 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_package)
NOTE: Running task 3452 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_package: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 3453 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: Running task 3454 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 3455 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 3456 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: Running task 3457 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot unihash changed to 54a9aa46a335d2ef154ac629bb57b38ebad05707f2d22c2b8de880b80cd4eb78
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_populate_sysroot became valid
NOTE: recipe libusb1-1.0.27-r0: task do_package: Succeeded
NOTE: Running setscene task 1339 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 3458 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata)
NOTE: recipe ofono-2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Started
NOTE: recipe ofono-2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1341 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata unihash changed to 5522705a874288ad03eb095de726bdaabd24479415dda600f2823d4cd8ae8d5e
NOTE: recipe bluez5-5.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3459 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3460 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx)
NOTE: recipe bluez5-5.77-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3461 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe bluez5-5.77-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3462 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe bluez5-5.77-r0: task do_configure: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package unihash changed to 284b0d4f394a7ca2f6278bb43f82c92fde88a753ac05123f9dc85ce36505195c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_package became valid
NOTE: Running setscene task 1337 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1339 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 3463 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3465 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: recipe ofono-2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: Running setscene task 1340 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_package_setscene)
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.9-r0: task do_package_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to d8041488b69229194c56d86e956954157a9d6ac52fae1478802d74ab02867e99
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: recipe ofono-2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1341 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_packagedata_setscene)
NOTE: Running task 3466 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_collect_spdx_deps)
NOTE: Running task 3467 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe bluez5-5.77-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bluez5-5.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile: Succeeded
NOTE: Running task 3468 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3469 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install: Succeeded
NOTE: Running task 3470 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3471 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_populate_sysroot)
NOTE: Running task 3472 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3473 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3474 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Started
NOTE: recipe bluez5-5.77-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_package became valid
NOTE: Running setscene task 1341 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_package_setscene)
NOTE: recipe bluez5-5.77-r0: task do_package_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3475 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe bluez5-5.77-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3491 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.77.bb:do_create_spdx)
NOTE: recipe bluez5-5.77-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 3492 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_collect_spdx_deps)
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3493 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3494 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3495 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_create_spdx)
NOTE: recipe ofono-2.9-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot unihash changed to 120e480bcb2fa9fecf8997877af24fc7023a691a5015d3e279a069a30d0e633e
NOTE: Setscene tasks completed
NOTE: Running task 3496 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3497 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_package: Succeeded
NOTE: Running task 3498 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_packagedata unihash changed to 89212ca130990ec40a46f088aa61ce025e343e23c75f69a54e1fbb8b9bd43a06
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3499 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_compile)
NOTE: Running task 3500 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package unihash changed to c6d910723cbfc95f75d9613b3d58a0f61c3f40e4cfcaeaab636209653f1b1d6b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata became valid
NOTE: Running setscene task 1340 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3501 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3503 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3504 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_compile)
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3505 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Succeeded
NOTE: Running task 3506 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_install: Succeeded
NOTE: Running task 3507 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot)
NOTE: Running task 3508 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package)
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot unihash changed to aee3377e40fd6b310fd7e20a6593e01c343cfd0a72071ab959dcd7e8e4fc568c
NOTE: Setscene tasks completed
NOTE: Running task 3509 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.32.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.32.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3510 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_configure)
NOTE: recipe mpg123-1.32.6-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package unihash changed to 0da8f2fdefad270726fb80950a8bfbbb5cae4b31255a15e489883ed7bd087f9c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata became valid
NOTE: Running setscene task 1341 of 1341 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3511 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3513 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3514 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package)
NOTE: Running task 3515 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3516 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.32.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3517 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_compile)
NOTE: recipe mpg123-1.32.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.32.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3518 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3519 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3520 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3521 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.6-r0: task do_compile: Succeeded
NOTE: Running task 3522 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_install)
NOTE: recipe mpg123-1.32.6-r0: task do_install: Started
NOTE: recipe mpg123-1.32.6-r0: task do_install: Succeeded
NOTE: Running task 3523 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_package)
NOTE: Running task 3524 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_populate_sysroot)
NOTE: recipe mpg123-1.32.6-r0: task do_package: Started
NOTE: recipe mpg123-1.32.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 3525 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_compile: Started
NOTE: recipe mpg123-1.32.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3526 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_configure: Succeeded
NOTE: Running task 3527 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3528 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.6-r0: task do_package: Succeeded
NOTE: Running task 3529 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_packagedata)
NOTE: recipe mpg123-1.32.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3530 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_install: Started
NOTE: recipe mpg123-1.32.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_packagedata unihash changed to 5734a4ae2bc12868a486eb188c2776784a3c70f63a698dde9fa5df31cce52e1e
NOTE: Setscene tasks completed
NOTE: Running task 3531 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb:do_create_spdx)
NOTE: recipe mpg123-1.32.6-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3532 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package: Succeeded
NOTE: recipe mpg123-1.32.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_sysroot: Started
NOTE: Running task 3533 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3534 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package)
NOTE: Running task 3535 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_create_spdx)
NOTE: Running task 3536 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3537 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_write_deb)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package: Started
NOTE: Running task 3538 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3539 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3540 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_collect_spdx_deps)
NOTE: Running task 3541 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 3542 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3543 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3544 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3545 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3546 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package)
NOTE: Running task 3547 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3548 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3549 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3550 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3551 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_write_deb)
NOTE: Running task 3552 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3553 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3554 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3555 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3556 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_create_spdx)
NOTE: Running task 3557 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3558 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_write_deb)
NOTE: Running task 3559 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3560 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3561 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-ugly-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3562 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb:do_build)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3563 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb:do_build)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3564 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_build)
NOTE: recipe librsvg-2.58.1-r0: task do_compile: Succeeded
NOTE: Running task 3565 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_install)
NOTE: recipe librsvg-2.58.1-r0: task do_install: Started
NOTE: recipe librsvg-2.58.1-r0: task do_install: Succeeded
NOTE: Running task 3566 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_package)
NOTE: Running task 3567 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_populate_sysroot)
NOTE: recipe librsvg-2.58.1-r0: task do_package: Started
NOTE: recipe librsvg-2.58.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.58.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3568 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3569 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Started
NOTE: recipe librsvg-2.58.1-r0: task do_package: Succeeded
NOTE: Running task 3570 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_packagedata)
NOTE: recipe librsvg-2.58.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.58.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_packagedata unihash changed to 1e0411971e17a0ea78e087da8d7685d8cdf0f56aa5605f5bca587135962102a6
NOTE: Setscene tasks completed
NOTE: Running task 3571 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3572 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_install)
NOTE: recipe librsvg-2.58.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_install: Started
NOTE: recipe librsvg-2.58.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3573 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3574 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package)
NOTE: Running task 3575 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3576 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3577 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3578 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_create_spdx)
NOTE: Running task 3579 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3580 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_write_deb)
NOTE: Running task 3581 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3582 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3583 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3584 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb:do_build)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_compile: Succeeded
NOTE: Running task 3585 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_install: Succeeded
NOTE: Running task 3586 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package)
NOTE: Running task 3587 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package: Succeeded
NOTE: Running task 3588 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3589 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_create_spdx)
NOTE: Running task 3590 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_write_ipk)
NOTE: Running task 3591 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_write_deb)
NOTE: Running task 3592 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_write_rpm)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Started
NOTE: Running task 3593 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3594 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_create_package_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_package_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3595 of 3595 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_build)
NOTE: Tasks Summary: Attempted 3595 tasks of which 3317 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.8.10-r0 to 1:1.8.9-r0) [version-going-backwards]
ERROR: libx11-1_1.8.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1195728489911555465==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-gstreamer1.0-plugins-base-g.patch"

RnJvbSAyZTRiYzU5NDdlNDA0NTZmYzI4ZjFlZWZmN2I3YzQ2YTcwOTNlMjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwODoxNjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
Z3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyLGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UsZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtZ29vZCxnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5LGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhZDoKIHVwZ3JhZGUgMS4yNC41IC0+IDEuMjQuNiwxLjI0LjUgLT4gMS4yNC42
LDEuMjQuNSAtPiAxLjI0LjYsMS4yNC41IC0+CiAxLjI0LjYsMS4yNC41IC0+IDEuMjQuNgoKLS0t
CiAuLi4xLWZpeC1tYXliZS11bmluaXRpYWxpemVkLXdhcm5pbmdzLXdoZW4tY29tcGlsaW5nLXdp
dGgucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJl
Y3RseS5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiAuLi40LW9wZW5jdi1yZXNvbHZlLW1pc3Np
bmctb3BlbmN2LWRhdGEtZGlyLWluLXlvY3RvLWJ1aWwucGF0Y2ggfCAyICstCiAuLi5wbHVnaW5z
LWJhZF8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuNi5iYn0gfCAy
ICstCiAuLi4wMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5
LWNhcHMucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxp
bmVzLXBhcnNpbmcucGF0Y2ggICAgICAgICAgfCAyICstCiAuLi4vMDAwMy12aXYtZmItTWFrZS1z
dXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoICAgICAgICAgICAgfCAyICstCiAuLi51Z2lu
cy1iYXNlXzEuMjQuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuNi5iYn0g
fCAyICstCiAuLi51Z2lucy1nb29kXzEuMjQuNS5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1n
b29kXzEuMjQuNi5iYn0gfCAyICstCiAuLi51Z2lucy11Z2x5XzEuMjQuNS5iYiA9PiBnc3RyZWFt
ZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuNi5iYn0gfCAyICstCiAuLi5ydHNwLXNlcnZlcl8xLjI0
LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNi5iYn0gfCAyICstCiAxMSBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
ZF8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkXzEuMjQuNi5iYn0gKDk4JSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2VfMS4yNC41LmJiID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC42
LmJifSAoOTglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0
cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
Z29vZF8xLjI0LjYuYmJ9ICg5NyUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL3tnc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuNS5iYiA9PiBnc3RyZWFtZXIx
LjAtcGx1Z2lucy11Z2x5XzEuMjQuNi5iYn0gKDk0JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjUuYmIgPT4g
Z3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFk
LzAwMDEtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtd2FybmluZ3Mtd2hlbi1jb21waWxpbmctd2l0
aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNv
bXBpbGluZy13aXRoLnBhdGNoCmluZGV4IDEzYTQ4MTQ4NWEuLjdlNTllYmNiNzYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5ncy13aGVuLWNvbXBpbGlu
Zy13aXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwMS1maXgtbWF5YmUtdW5pbml0aWFsaXplZC13YXJuaW5n
cy13aGVuLWNvbXBpbGluZy13aXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYjdmOTY0
ZDUxZGU2Yjg4OGIzYjdhNmQwYzNkMjYwZmNhZDI0MDA4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA4MDFiODEyMDg2MGNhMjVjMThkZmQ2OTNiYzk4NzAwYTc1MzNmMjlmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNv
bT4KIERhdGU6IFR1ZSwgMjYgSmFuIDIwMTYgMTU6MTY6MDEgLTA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gZml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZ3Mgd2hlbiBjb21waWxpbmcgd2l0aCAt
T3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3Rs
eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYWQvMDAwMi1hdm9pZC1pbmNsdWRpbmctc3lzLXBvbGwuaC1kaXJlY3RseS5wYXRj
aAppbmRleCAyOTgzMzdjYjBhLi5kMTE1Zjc5ZGNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkLzAwMDItYXZvaWQt
aW5jbHVkaW5nLXN5cy1wb2xsLmgtZGlyZWN0bHkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZC8wMDAyLWF2b2lkLWlu
Y2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAy
NWVmYzViMmQyMmFlZDQ1Mjc0NzBlZjkzOTcwNjY0YjIxMGJmOGM1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA1Nzc4MTQ5MzFiODNiYWIxODA0YTY5YTYwM2MxNjlmMjFjNjM2YzJkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdt
YWlsLmNvbT4KIERhdGU6IFdlZCwgMyBGZWIgMjAxNiAxODowNTo0MSAtMDgwMAogU3ViamVjdDog
W1BBVENIXSBhdm9pZCBpbmNsdWRpbmcgPHN5cy9wb2xsLmg+IGRpcmVjdGx5CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMt
YmFkLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1vcGVuY3YtZGF0YS1kaXItaW4teW9jdG8t
YnVpbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRp
ci1pbi15b2N0by1idWlsLnBhdGNoCmluZGV4IDk2NTA1MzM0OGYuLjU4MzBmZjQxOGEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5jdi1kYXRhLWRpci1pbi15
b2N0by1idWlsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9n
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQvMDAwNC1vcGVuY3YtcmVzb2x2ZS1taXNzaW5nLW9wZW5j
di1kYXRhLWRpci1pbi15b2N0by1idWlsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzOWZi
Y2RmYzUzODNiZGFlOTUyOTNhMzEwOWM4NDdmNjRkMTkzYjU0IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAxMjdmODI4MmEzOWNmZjU4YTFiODg3ZjM1NzhmNzAwYWRmYTg5ODFhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmV5IFpoaXpoaWtpbiA8YW5kcmV5LnpAZ21h
aWwuY29tPgogRGF0ZTogTW9uLCAyNyBKYW4gMjAyMCAxMDoyMjozNSArMDAwMAogU3ViamVjdDog
W1BBVENIXSBvcGVuY3Y6IHJlc29sdmUgbWlzc2luZyBvcGVuY3YgZGF0YSBkaXIgaW4geW9jdG8g
YnVpbGQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC41LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI0LjYuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhZF8xLjI0LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC42LmJiCmlu
ZGV4IDY3NjZhOGMxOWEuLjU0OTc3MDg2OGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWRfMS4yNC41LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YWRfMS4yNC42LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFt
ZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYWQvZ3N0LXBsdWdpbnMtYmFkCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAyLWF2b2lkLWluY2x1ZGluZy1zeXMtcG9sbC5oLWRpcmVjdGx5
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDQtb3BlbmN2LXJlc29sdmUtbWlzc2luZy1v
cGVuY3YtZGF0YS1kaXItaW4teW9jdG8tYnVpbC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzMDI5YmZkNzI2NTMxNGQ2MDlkYzhlYWI1MDM2NzVhMzQ0ZWE0NmU4
Mjc0ZmQ3M2FiMzQ1NjZjODQ0MmRjODQ3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhmNGQ5NjU1
MTNlNzgyN2MxZjU0N2MxZTc0OWU0ZWYyODEyYjM3MTk3NGZlNjQ4NTdmZTUwMjlhMTljNWI2NGMi
CiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy1iYWQtJHtQVn0iCiAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1i
YXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNh
cHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hl
bi1xdWVyeS1jYXBzLnBhdGNoCmluZGV4IDM4ZDBmYmY2YmYuLjFhNzQzNTY3ZmYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5
LWNhcHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMt
cGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNWE0ZDY1ZTEz
YTMyNjEwM2FjMDJmMTU2YzAxYjZmY2JiMDI2OTkwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gODNjMWFhMWVhZTVkNDA1ODM2OTMxMzc4NDg2Y2JkZTY5YzUxZDBlOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IHpob3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KIERh
dGU6IFdlZCwgMTQgTWF5IDIwMTQgMTA6MTY6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRU5H
UjAwMzEyNTE1OiBnZXQgY2FwcyBmcm9tIHNyYyBwYWQgd2hlbiBxdWVyeSBjYXBzCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNo
CmluZGV4IDQwOTBiNzdjOGQuLmU1OTVkODc5MzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFy
c2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3Nh
cGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSAyMWI4MzM5MDc3ZjUyZWM5MjIwZTBkM2QxZjM4NzJlMjNjN2MyZTg4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNjBiMzkzZWU1YTJmODc2N2E0MjRhOGZlMjQzOTVlMWNj
ZWI3YzE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2tlIFdhbmcgPG1pbmdr
ZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBUaHUsIDE5IE1hciAyMDE1IDE0OjE3OjEwICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNzYXBhcnNlOiBlbmhhbmNlIFNTQSB0ZXh0IGxpbmVzIHBh
cnNpbmcuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMt
aW5jbHVkZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5j
bHVkZWQucGF0Y2gKaW5kZXggYWI0NmVjZWU1ZC4uYThkZTNkMDY1OSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Uv
MDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNl
LzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMjQ2ZTZmNWVkNzU2OTZiMmU5ZDlhOWVlOGNkNTkyNTI3MjRlMTMzNCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjczZTVhNDhiZGQ4ZDAyMjA0ODg1OThhYTJk
Mzk5MmE1MjNiMjk3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENhcmxvcyBSYWZh
ZWwgR2lhbmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+CiBEYXRlOiBUdWUsIDIxIE1heSAyMDE5IDE0
OjAxOjExICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZpdi1mYjogTWFrZSBzdXJlIGNvbmZpZy5o
IGlzIGluY2x1ZGVkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0LjUuYmIgYi9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0LjYuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC41LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8x
LjI0LjYuYmIKaW5kZXggOWQxOWVhMjMzZC4uN2MzMzkwZDUyZCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4y
NC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlXzEuMjQuNi5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJID0gImh0
dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtYmFzZS9nc3Qt
cGx1Z2lucy1iYQogICAgICAgICAgICBmaWxlOi8vMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZp
Zy5oLWlzLWluY2x1ZGVkLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDItc3NhcGFyc2Ut
ZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjBlMzNlYzliNTllZWY1ZWYzYTZhNTNiYmQ1NWM0NDM0MGU2ODFk
MDAwMDkxMGNhY2ExMjU0MWE3M2RiMzhhN2QiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Y1MmI1
MzVhMGNlN2VjOTc0NzU2ODkxODE4ZjM0ZjA2MzE3YzJlMTM2YWJiMjQxNDllMThjMjNlY2MyMjli
NSIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1wbHVnaW5zLWJhc2UtJHtQVn0iCiAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1nb29kXzEuMjQuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtZ29vZF8xLjI0LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEuMjQuNi5iYgppbmRleCAxYzMzZmZk
ZTAwLi45ZDkzY2EwOTY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjI0LjUuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yNC42
LmJiCkBAIC02LDcgKzYsNyBAQCBCVUdUUkFDS0VSID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9nc3RyZWFtZXIvZ3N0LXBsdWdpbnMtZ29vZC8tL2lzc3VlcwogCiBTUkNfVVJJID0g
Imh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LXBsdWdpbnMtZ29vZC9n
c3QtcGx1Z2lucy1nb29kLSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJh
ZGNmYzUyOTJiMDM1YmRlOTlhNzczMjdkNDY4YjJmMGIxMTZiNDA0MjBiYzlmMjVmYjhlMzk3MDgy
NGJhNzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTk2YjljOGQxZDI0NmVkNDNiZTMwNDcxOGI2
MDg2ZTVhMTdkNGFlODExNGQxOTIwYWVkOWVhNzViOTIwYmEyZCIKIAogUyA9ICIke1dPUktESVJ9
L2dzdC1wbHVnaW5zLWdvb2QtJHtQVn0iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5XzEuMjQuNS5iYiBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy11Z2x5
XzEuMjQuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtdWdseV8xLjI0LjUuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cGx1Z2lucy11Z2x5XzEuMjQuNi5iYgppbmRleCA2Y2FlNjFlZDM1Li43YjdkZTc1ZGFjIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtdWdseV8xLjI0LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLXVnbHlfMS4yNC42LmJiCkBAIC0xNSw3ICsxNSw3IEBA
IFNSQ19VUkkgPSAiIFwKICAgICAgICAgICAgIGh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9w
Lm9yZy9zcmMvZ3N0LXBsdWdpbnMtdWdseS9nc3QtcGx1Z2lucy11Z2x5LSR7UFZ9LnRhci54eiBc
CiAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMzMyNjdiNmUwMDc3MDQ0
MGE0YTAwNDAyOTEwZGQ1OWVkOGZkNjE5ZWFlYmY0MDI4MTVmYmUxMTFkYTc3NzZkIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjVkZmRiYjI5NzhhYjI4MmU2MzcyNTVjZDg3NWNmNWI3YjkzZmM4M2Ri
NjJmOGEwYjFhZjAyYzg1Yzg0YTc1YzQiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtcGx1Z2lucy11
Z2x5LSR7UFZ9IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC42LmJiCnNpbWls
YXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC41LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQu
Ni5iYgppbmRleCA5OTcxZWVlNDhlLi5jZGI3NGFmYmZjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQuNS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0
c3Atc2VydmVyXzEuMjQuNi5iYgpAQCAtMTAsNyArMTAsNyBAQCBQTlJFQUwgPSAiZ3N0LXJ0c3At
c2VydmVyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9z
cmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhMzA2MjY2NWU0MTgxNGQzZGJhM2UwMmI3YjA2Yjc3MzI2ZDU0ZDJiNmYxNzhmZmNiMTk2
YWY5YjkxYTFiZmI5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIwYmRkYTI2MTczZjEzZjU1MjFj
ODI5MzY3OTYzODI0YTc0ZmQwY2U4ZjUyYmNhYjY3NGQ3ZTcyN2Y3NGU5M2MiCiAKIFMgPSAiJHtX
T1JLRElSfS8ke1BOUkVBTH0tJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============1195728489911555465==
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: FILELIST: removed "/usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2405.0 /usr/lib/.debug/libgstplay-1.0.so.0.2405.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2405.0 /usr/lib/.debug/libgstmse-1.0.so.0.2405.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2405.0 /usr/lib/.debug/libgstplayer-1.0.so.0.2405.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2405.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2405.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2405.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2405.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2405.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2405.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2405.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2405.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2405.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2405.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2405.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2405.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2405.0 /usr/l
 ib/.debug/libgstsctp-1.0.so.0.2405.0", added "/usr/lib/.debug/libgstplayer-1.0.so.0.2406.0 /usr/lib/.debug/libgstplay-1.0.so.0.2406.0 /usr/lib/.debug/libgstvulkan-1.0.so.0.2406.0 /usr/lib/.debug/libgstwayland-1.0.so.0.2406.0 /usr/lib/.debug/libgstbasecamerabinsrc-1.0.so.0.2406.0 /usr/lib/.debug/libgstcodecs-1.0.so.0.2406.0 /usr/lib/.debug/libgstbadaudio-1.0.so.0.2406.0 /usr/lib/.debug/libgstmse-1.0.so.0.2406.0 /usr/lib/.debug/libgsturidownloader-1.0.so.0.2406.0 /usr/lib/.debug/libgstmpegts-1.0.so.0.2406.0 /usr/lib/.debug/libgstisoff-1.0.so.0.2406.0 /usr/lib/.debug/libgstadaptivedemux-1.0.so.0.2406.0 /usr/lib/.debug/libgstwebrtc-1.0.so.0.2406.0 /usr/lib/.debug/libgstcodecparsers-1.0.so.0.2406.0 /usr/lib/.debug/libgstinsertbin-1.0.so.0.2406.0 /usr/lib/.debug/libgstdxva-1.0.so.0.2406.0 /usr/lib/.debug/libgstphotography-1.0.so.0.2406.0 /usr/lib/.debug/libgstanalytics-1.0.so.0.2406.0 /usr/lib/.debug/libgstcuda-1.0.so.0.2406.0 /usr/lib/.debug/libgstsctp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-dbg: PKGSIZE changed from 28521568 to 28524456 (+0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/gstreamer1.0-plugins-bad-src: PKGSIZE changed from 16893554 to 16895865 (+0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.5.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.6.tar.xz file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch file://0002-avoid-including-sys-poll.h-directly.patch file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILELIST: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2405.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstadaptivedemux-1.0: FILES: removed "/usr/lib/libgstadaptivedemux-1.0.so.0.2405.0", added "/usr/lib/libgstadaptivedemux-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILELIST: removed "/usr/lib/libgstanalytics-1.0.so.0.2405.0", added "/usr/lib/libgstanalytics-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstanalytics-1.0: FILES: removed "/usr/lib/libgstanalytics-1.0.so.0.2405.0", added "/usr/lib/libgstanalytics-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILELIST: removed "/usr/lib/libgstbadaudio-1.0.so.0.2405.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbadaudio-1.0: FILES: removed "/usr/lib/libgstbadaudio-1.0.so.0.2405.0", added "/usr/lib/libgstbadaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILELIST: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstbasecamerabinsrc-1.0: FILES: removed "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2405.0", added "/usr/lib/libgstbasecamerabinsrc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILELIST: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2405.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecparsers-1.0: FILES: removed "/usr/lib/libgstcodecparsers-1.0.so.0.2405.0", added "/usr/lib/libgstcodecparsers-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILELIST: removed "/usr/lib/libgstcodecs-1.0.so.0.2405.0", added "/usr/lib/libgstcodecs-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcodecs-1.0: FILES: removed "/usr/lib/libgstcodecs-1.0.so.0.2405.0", added "/usr/lib/libgstcodecs-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILELIST: removed "/usr/lib/libgstcuda-1.0.so.0.2405.0", added "/usr/lib/libgstcuda-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstcuda-1.0: FILES: removed "/usr/lib/libgstcuda-1.0.so.0.2405.0", added "/usr/lib/libgstcuda-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILELIST: removed "/usr/lib/libgstdxva-1.0.so.0.2405.0", added "/usr/lib/libgstdxva-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstdxva-1.0: FILES: removed "/usr/lib/libgstdxva-1.0.so.0.2405.0", added "/usr/lib/libgstdxva-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILELIST: removed "/usr/lib/libgstinsertbin-1.0.so.0.2405.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstinsertbin-1.0: FILES: removed "/usr/lib/libgstinsertbin-1.0.so.0.2405.0", added "/usr/lib/libgstinsertbin-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILELIST: removed "/usr/lib/libgstisoff-1.0.so.0.2405.0", added "/usr/lib/libgstisoff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstisoff-1.0: FILES: removed "/usr/lib/libgstisoff-1.0.so.0.2405.0", added "/usr/lib/libgstisoff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILELIST: removed "/usr/lib/libgstmpegts-1.0.so.0.2405.0", added "/usr/lib/libgstmpegts-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmpegts-1.0: FILES: removed "/usr/lib/libgstmpegts-1.0.so.0.2405.0", added "/usr/lib/libgstmpegts-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILELIST: removed "/usr/lib/libgstmse-1.0.so.0.2405.0", added "/usr/lib/libgstmse-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstmse-1.0: FILES: removed "/usr/lib/libgstmse-1.0.so.0.2405.0", added "/usr/lib/libgstmse-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILELIST: removed "/usr/lib/libgstphotography-1.0.so.0.2405.0", added "/usr/lib/libgstphotography-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstphotography-1.0: FILES: removed "/usr/lib/libgstphotography-1.0.so.0.2405.0", added "/usr/lib/libgstphotography-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILELIST: removed "/usr/lib/libgstplay-1.0.so.0.2405.0", added "/usr/lib/libgstplay-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplay-1.0: FILES: removed "/usr/lib/libgstplay-1.0.so.0.2405.0", added "/usr/lib/libgstplay-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILELIST: removed "/usr/lib/libgstplayer-1.0.so.0.2405.0", added "/usr/lib/libgstplayer-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstplayer-1.0: FILES: removed "/usr/lib/libgstplayer-1.0.so.0.2405.0", added "/usr/lib/libgstplayer-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILELIST: removed "/usr/lib/libgstsctp-1.0.so.0.2405.0", added "/usr/lib/libgstsctp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstsctp-1.0: FILES: removed "/usr/lib/libgstsctp-1.0.so.0.2405.0", added "/usr/lib/libgstsctp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsttranscoder-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILELIST: removed "/usr/lib/libgsturidownloader-1.0.so.0.2405.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgsturidownloader-1.0: FILES: removed "/usr/lib/libgsturidownloader-1.0.so.0.2405.0", added "/usr/lib/libgsturidownloader-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILELIST: removed "/usr/lib/libgstvulkan-1.0.so.0.2405.0", added "/usr/lib/libgstvulkan-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstvulkan-1.0: FILES: removed "/usr/lib/libgstvulkan-1.0.so.0.2405.0", added "/usr/lib/libgstvulkan-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILELIST: removed "/usr/lib/libgstwayland-1.0.so.0.2405.0", added "/usr/lib/libgstwayland-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwayland-1.0: FILES: removed "/usr/lib/libgstwayland-1.0.so.0.2405.0", added "/usr/lib/libgstwayland-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILELIST: removed "/usr/lib/libgstwebrtc-1.0.so.0.2405.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-bad/libgstwebrtc-1.0: FILES: removed "/usr/lib/libgstwebrtc-1.0.so.0.2405.0", added "/usr/lib/libgstwebrtc-1.0.so.0.2406.0"
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtp-1.0.so.0.2405.0 /usr/lib/.debug/libgstapp-1.0.so.0.2405.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2405.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2405.0 /usr/lib/.debug/libgstriff-1.0.so.0.2405.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2405.0 /usr/lib/.debug/libgstfft-1.0.so.0.2405.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2405.0 /usr/lib/.debug/libgsttag-1.0.so.0.2405.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2405.0 /usr/lib/.debug/libgstgl-1.0.so.0.2405.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2405.0", added "/usr/lib/.debug/libgstapp-1.0.so.0.2406.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2406.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2406.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2406.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2406.0 /usr/lib/.debug/libgstriff-1.0.so.0.2406.0 /usr/lib/.debug/libgstfft-1.0.so.0.2406.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2406.0 /usr/lib/.debug/libgst
 gl-1.0.so.0.2406.0 /usr/lib/.debug/libgsttag-1.0.so.0.2406.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2406.0 /usr/lib/.debug/libgstpbutils-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 18698992 to 18730336 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 6216527 to 6216545 (+0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 14280630 to 14304505 (+0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGSIZE changed from 118960 to 132528 (+11%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.5.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.6.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2405.0", added "/usr/lib/libgstallocators-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2405.0", added "/usr/lib/libgstallocators-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2405.0", added "/usr/lib/libgstapp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2405.0", added "/usr/lib/libgstapp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2405.0", added "/usr/lib/libgstaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2405.0", added "/usr/lib/libgstaudio-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2405.0", added "/usr/lib/libgstfft-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2405.0", added "/usr/lib/libgstfft-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2405.0", added "/usr/lib/libgstgl-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2405.0", added "/usr/lib/libgstgl-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2405.0", added "/usr/lib/libgstpbutils-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2405.0", added "/usr/lib/libgstpbutils-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2405.0", added "/usr/lib/libgstriff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2405.0", added "/usr/lib/libgstriff-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2405.0", added "/usr/lib/libgstrtp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2405.0", added "/usr/lib/libgstrtp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2405.0", added "/usr/lib/libgstrtsp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2405.0", added "/usr/lib/libgstrtsp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2405.0", added "/usr/lib/libgstsdp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2405.0", added "/usr/lib/libgstsdp-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2405.0", added "/usr/lib/libgsttag-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2405.0", added "/usr/lib/libgsttag-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2405.0", added "/usr/lib/libgstvideo-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2405.0", added "/usr/lib/libgstvideo-1.0.so.0.2406.0"
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 21675464 to 21675432 (-0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 13318470 to 13318513 (+0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGSIZE changed from 783008 to 782824 (-0%)
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
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGSIZE changed from 441794 to 442109 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.6.tar.xz"
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
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2405.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2406.0"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2405.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2406.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2405.0 to libgstrtspserver-1.0.so.0.2406.0
  /usr/lib/libgstrtspserver-1.0.so.0.2405.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2406.0

--===============1195728489911555465==--

