Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.18911.1603023037730716956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ic0amKQk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id e2so9987359wme.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/cONyPqYKbfuBpABg8jvSQunqg5KlsUM8x2mVtlNjNM=;
        b=Ic0amKQk00+b+unJowXkYs6+Fy6rcsryk3Ibhjl8dtiByaSQJhpNnGpoeUrcIazj89
         PdjdfMd3xeinvmuNhcRhMnl4SknVGhW3rdgiHLUeCHU1hc6PEy2CFjugaG0p+NGyQLzn
         SLx/7aTGku6SiRNiBcFwe4g6s6Pn6v/eC44Xj41/c25937Elh0r+uyAx/kHjMFwhZDiC
         s5RfCqpPai1bgZYVhdlPCbn1JfjvPcDzyQzuSdoLxmSMG+kG404Od+voAGZW8yd5yOAL
         V6J6wcmWjlbAEPOlDU05Nzy4Qa9CezwAw/EWCgFYvhWUG8dgr+7o+0mXR+1NIV3KHgwM
         wpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/cONyPqYKbfuBpABg8jvSQunqg5KlsUM8x2mVtlNjNM=;
        b=cldvIt8tEWV2BtqysKzIQxCxr5FqTT6dL6p1l1MV6O4cWI0iaqTX/DchhEmPQIgrEo
         978jC4SLgj4FTBa6chPZDHqbkTAvFToS1/ai5Hcza3Db3ItKdVefaSO+QHSZ2PaQSVy2
         k9Pd6fyWFXlQZMSlpZ57H9nRG12qoJYea3uAv2JTr7dh/fqceWN1gEVEOHHDbNH/6h8P
         IwBv3RwiyqAPz4Nkw8OJWflK1tpZtR6oxSMVCHvFrpk2iGV35hmJszRbN7/5xZsjNKnS
         FFL8R91zVwTTyE9NoXG9TWmEqPMuz1n8ru+Ym/62Gdp/WkuPOjO4lEiEKX4SFzlbrMGB
         AOsQ==
X-Gm-Message-State: AOAM530XKN+NV7xJ6iNEP3qWMvBRop8GUBK5aWqUn7CXHcLnanCIi7O5
	tAn6pHasmCH1bAbL+pFK2O0eN9nArjh5tg==
X-Google-Smtp-Source: ABdhPJxHwaLdj1KezBQ1fbA+qJoEBn5MSYW8kWJLYlyBQO6OoEvkriCW1pByINMLbmEtLYSCCHt+8A==
X-Received: by 2002:a1c:4943:: with SMTP id w64mr13256067wma.165.1603023036017;
        Sun, 18 Oct 2020 05:10:36 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:35 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 16/20] gst-examples: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:58 +0100
Message-Id: <20201018121002.1417335-17-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
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
2.28.0

