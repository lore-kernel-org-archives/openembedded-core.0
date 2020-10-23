Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.1071.1603478642012227034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FF9k7qUB;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id i1so3248689wro.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87My3Cl1PIczk2GLz7jg230AhlMDu3BB8QSAUIY0LYk=;
        b=FF9k7qUBs0vba5mlcS+c33qFBf8vL6+BxRabCKf1KwddH5UnbYae937yaKDfweRwxZ
         qer2CuVTD8DiFR4RrgCK8ZuQhQPo3JrWW2aTjeOjzhgWsMDx3hzBx6jleYvajigtWLaQ
         D21aw9yxKQylD/gS/7SMu06R8tvDeUiMbDD7KwZSYD7F943KWsSd7EaO7VLC95f35l9E
         xKg3avmidnAMWRY6d4fmrSLNM8A5dE9MtbEDXK9+/16TIFxygYo9WEVe6huQ7bIpI/ue
         yD5FhHS2zs0hiMIDBw87ObDT/UzF64RMOZkSx6vx5G67O1chZelFEZW1pB7SSG6Oe49a
         e9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87My3Cl1PIczk2GLz7jg230AhlMDu3BB8QSAUIY0LYk=;
        b=K7hvUeQsYFYZCnkvV69DkimBAAo39CZSSIWtbNgWjY1kCsNQBObI1qA4uUhxhW1usK
         HjLixnlKm47mxHQy5SlJ3Z9d2pExtKuESFA0uqZwBdJCJuK95Y0wZTNyYEHUY+5SSrGp
         Rjd/Qxm1JdrGIfJE7LUpimRfDtmG4nmDVIMCgw+lGfrfGJuV2cXpFMo2tyNCkp2iGyB2
         bWG9kan5P7eqp7/8u988KLKz+1doDgWZTKwvmOUmRqVAwLtjAKuKvDto7AvYzlLJ80cc
         sEAWLeU2Cv6ZP7HrRVJClTTHSqxdxHmqm4gbeafJTJI0G2iYd74YIUzmgNkykjQdyLfm
         /KmQ==
X-Gm-Message-State: AOAM531mBn+3qN4hbbL7RYNawE4QEvJWPU2vOf2k+Uv5eKuA/nH8uSwK
	Im7sjvbefEpzbj4mp6ewmewZMKEkPrf7Cw==
X-Google-Smtp-Source: ABdhPJxdLWugG6xSJAAHmO+Antq0JzGm5AujDo/YfQotwrly7XvrZ4NLiBcUmchumJzdHY6A+Xw+xg==
X-Received: by 2002:adf:bb43:: with SMTP id x3mr4011079wrg.250.1603478640312;
        Fri, 23 Oct 2020 11:44:00 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:59 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 16/21] gst-examples: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:27 +0100
Message-Id: <20201023184132.3208737-17-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEPENDS:
 - Upstream now depends on libsoup-2.4 and json-glib

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...001-Make-player-examples-installable.patch | 24 +++++++++----------
 ...mples_1.16.0.bb => gst-examples_1.18.0.bb} |  4 ++--
 2 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb => gst-examples_1.18.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index 0338bad1c0..ab93c13244 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 755f6dab07565aca7b6aefacad8be65de364ff75 Mon Sep 17 00:00:00 2001
+From 7924016fce2d0b435891a335cdae52fc939c7e3b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -7,16 +7,17 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Denied [Upstream considers these code examples, for now a least]
 
 https://bugzilla.gnome.org/show_bug.cgi?id=777827
+
 ---
  playback/player/gst-play/meson.build | 1 +
  playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
-index 719b55b..a56fe13 100644
+index 8ec021d..977cc5c 100644
 --- a/playback/player/gst-play/meson.build
 +++ b/playback/player/gst-play/meson.build
-@@ -8,5 +8,6 @@ executable('gst-play',
+@@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
       'gst-play-kb.h'],
@@ -24,16 +25,13 @@ index 719b55b..a56fe13 100644
      dependencies : [gst_dep, gstplayer_dep, m_dep])
  
 diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
-index 08aae4f..671a65d 100644
+index f7a7419..6281130 100644
 --- a/playback/player/gtk/meson.build
 +++ b/playback/player/gtk/meson.build
-@@ -18,5 +18,6 @@ executable('gtk-play',
-       gtk_play_resources,
-      'gtk-video-renderer.h',
-      'gtk-video-renderer.c'],
+@@ -13,5 +13,6 @@ if gtk_dep.found()
+         gtk_play_resources,
+        'gtk-video-renderer.h',
+        'gtk-video-renderer.c'],
 +    install: true,
-     dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gsttag_dep, gstplayer_dep, gtk_dep, x11_dep])
- 
--- 
-2.13.3
-
+       dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gsttag_dep, gstplayer_dep, gtk_dep, x11_dep])
+ endif
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
index e23d23d9ca..66db2f4eb8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
@@ -2,14 +2,14 @@ SUMMARY = "GStreamer examples (including gtk-play, gst-play)"
 LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://playback/player/gtk/gtk-play.c;beginline=1;endline=20;md5=f8c72dae3d36823ec716a9ebcae593b9"
 
-DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 glib-2.0-native"
+DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gtk+3 libsoup-2.4 json-glib glib-2.0-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=https \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop \
            "
 
-SRCREV = "d953c127c1146b50d5676618299933950685dcd7"
+SRCREV = "009290dc8784e6714dc2a29be123110c14a38123"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.0

