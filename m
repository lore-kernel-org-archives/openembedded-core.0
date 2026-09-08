Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB36C79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3679.1788861521241021478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qVhB2NmX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 971C71A1A56
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CB24603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BAA811C7AF4E;
	Tue,  8 Sep 2026 11:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xoD5Aa+Mz7qIhPgYlN9qPb5KLq03tPcZWl3012n4zXg=;
	b=qVhB2NmXem0zG/Ctqh2vvyd4REjtJJkgb+AaskNhfoRqX1vxstCzRiTJoWgCNEdcOoe2aS
	jvXe0+pnXD8sIV1GRacyogBsL3yjxD2lVlAtX6LQmBuSSjWv59MEGDWjzAEH+3UL74d8lQ
	Fpd5HwYVp33gdC5Ac+mEmEt+8gk/N95BLO/zG2HQ1TsOQBXRRtIYinvUuBS7+/Hie2Esjy
	V4bPgqbu50c/q4pZZxODO18u9o2QVvx/h1CtoHmHNH2J/YU5TJQcLeEBdfJa4wr4GyUDJ9
	Qr8gxBXPL6Q6BscE/t4wHCoqWr8N4E63sZcIhDvkHKUkqn1iq9zAiN+oopDVMg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:28 +0200
Subject: [PATCH 06/10] gstreamer1.0-plugins-bad: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-6-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=8661;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=0FkXq0McW8Kj1Gu3vkb3SEg8r+eAEiDeA/xwni1/Uec=;
 b=A8PYkLcQLY5hx+n7sdBLgTlT3a9dj2jbXtYxvo4t9ayst3h/+vByYoBXKLKDiGJGZoEVfdaP1
 KpViinVdIgrAV+WVDkUtmMZAnzaYLPO3vyK92cwFYrlXd4ARtkVsVdN
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245346

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...ix-maybe-uninitialized-warnings-when-compiling-with.patch |  4 ++--
 .../0002-avoid-including-sys-poll.h-directly.patch           |  4 ++--
 ...pencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch |  6 +++---
 ...ayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch | 12 ++++++------
 ...gins-bad_1.28.6.bb => gstreamer1.0-plugins-bad_1.28.7.bb} |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
index f5eb011ffade..39219f3f24d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -1,4 +1,4 @@
-From bcc4c0d84f573e5d53195a726b475d818759550d Mon Sep 17 00:00:00 2001
+From 82e81317ef3dc7c12d6a75a9bc3cbdfedafcbdb4 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 26 Jan 2016 15:16:01 -0800
 Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
@@ -11,7 +11,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/codecparsers/gstvc1parser.c
-index d91cc3f..c9058cd 100644
+index d91cc3feb481..c9058cdcbd44 100644
 --- a/gst-libs/gst/codecparsers/gstvc1parser.c
 +++ b/gst-libs/gst/codecparsers/gstvc1parser.c
 @@ -1732,7 +1732,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data, gsize size,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
index ed0a248381dd..b9a8315ba2fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 86d9fc16f8d165e79d29ab1130e08663502dcd25 Mon Sep 17 00:00:00 2001
+From c35690641af3eac21dcb7a010620e7fbd8ad975c Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Wed, 3 Feb 2016 18:05:41 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -13,7 +13,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
-index ef565f7..6254420 100644
+index ef565f7dcb60..625442066533 100644
 --- a/sys/dvb/gstdvbsrc.c
 +++ b/sys/dvb/gstdvbsrc.c
 @@ -98,7 +98,7 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
index 78981c037149..640a5dcd870d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -1,4 +1,4 @@
-From 08cf48c1ad094a522b558f10d24d4aec670dcc88 Mon Sep 17 00:00:00 2001
+From 566c97e20bf023278db486ab07f13a4217358a6e Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 10:22:35 +0000
 Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
@@ -17,10 +17,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
-index 60cb12b..4046b70 100644
+index 4ddf71f9f823..1fd341c9ad79 100644
 --- a/gst-libs/gst/opencv/meson.build
 +++ b/gst-libs/gst/opencv/meson.build
-@@ -61,6 +61,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
+@@ -64,6 +64,9 @@ gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
  # /usr/include/opencv4/opencv2/flann/logger.h:83:36: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
  gstopencv_cargs += cxx.get_supported_arguments(['-Wno-missing-include-dirs', '-Wno-format-nonliteral'])
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
index 97b138a660cf..01e9987e5fc4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -1,4 +1,4 @@
-From 8ff54f765defbb343340da5de3cf5c89e400a8ff Mon Sep 17 00:00:00 2001
+From c1680a0a91fd383cfb918f3baf39434be75add36 Mon Sep 17 00:00:00 2001
 From: Tushar Darote <tdarote@qti.qualcomm.com>
 Date: Mon, 8 Jun 2026 18:05:51 +0530
 Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
@@ -30,7 +30,7 @@ Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
  5 files changed, 52 insertions(+), 35 deletions(-)
 
 diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
-index 0660b30..81bcd7f 100644
+index 7844645818b9..13d846e083cc 100644
 --- a/ext/gtk/gstgtkwaylandsink.c
 +++ b/ext/gtk/gstgtkwaylandsink.c
 @@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
@@ -73,7 +73,7 @@ index 0660b30..81bcd7f 100644
  
          if (G_UNLIKELY (!wbuf))
 diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
-index 443db24..60aa11d 100644
+index 3aa454076609..0baafd7e453c 100644
 --- a/ext/wayland/gstwaylandsink.c
 +++ b/ext/wayland/gstwaylandsink.c
 @@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, GstBuffer * buffer)
@@ -116,7 +116,7 @@ index 443db24..60aa11d 100644
  
          if (G_UNLIKELY (!wbuf))
 diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayland/gstwlshmallocator.c
-index 671f2b7..11fb22c 100644
+index 671f2b7295d4..11fb22c797b2 100644
 --- a/gst-libs/gst/wayland/gstwlshmallocator.c
 +++ b/gst-libs/gst/wayland/gstwlshmallocator.c
 @@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * vinfo)
@@ -206,7 +206,7 @@ index 671f2b7..11fb22c 100644
  
    return wbuffer;
 diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayland/gstwlshmallocator.h
-index 4309bd7..38f3ba5 100644
+index 4309bd7f4950..38f3ba53eba3 100644
 --- a/gst-libs/gst/wayland/gstwlshmallocator.h
 +++ b/gst-libs/gst/wayland/gstwlshmallocator.h
 @@ -33,7 +33,7 @@ GST_WL_API
@@ -219,7 +219,7 @@ index 4309bd7..38f3ba5 100644
  
  G_END_DECLS
 diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gstwlwindow.c
-index 3c5c3cc..cd9c964 100644
+index 3c5c3cc017dd..cd9c964f7cfa 100644
 --- a/gst-libs/gst/wayland/gstwlwindow.c
 +++ b/gst-libs/gst/wayland/gstwlwindow.c
 @@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
index 518fde30d7e1..7964d5b6deb2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "6636f2c2289ceda52c4aba971338c81e2b5780d3381bd3673c1c116ec87587c3"
+SRC_URI[sha256sum] = "dc525383c18b2c265bbe6a43d498656cd918aaa130aa4e3abeabcdaa741c3ffe"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 

-- 
2.47.3


