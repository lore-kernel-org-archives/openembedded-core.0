Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.39788.1602506211112079499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bj+jKNe9;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id f21so17028180wml.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p653nTriw7Qs4IpjT601Yslx+JmHnq2VK5xVyiQKj0o=;
        b=Bj+jKNe9rew7kvss4Q4adO7lrtU78edu0WzsUsfN05wY1Nbtru2txnbrhtVDFCpJon
         wUd9xduGR54SI7wcApslucIHIsmKxNERqwWY74CW0dvxi5sDsHP14ormKD2QkATVWHpt
         adSs1MskP+wd05vu+kbPkCLffRTe1W61s7otXV5Zhf772k2+Rc6du1ug3UDVKyHPNwEb
         fZD/7WR60KXxtocaLi7S4q2zhsAK0M//2x2f7cfer6tmFTQodThbF5jFIu6FFv/YI2m/
         +U4E/yVQ3pJiWuL19rNDzo2mRpo5iI0n8pauW8fEFe93feHkv5MtOqL1E7hyF5+Qo6kK
         qQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p653nTriw7Qs4IpjT601Yslx+JmHnq2VK5xVyiQKj0o=;
        b=f8HWZTDGCRE5vwfhVpUatJK05Pk13vUj6+891EH7TBHwbZLQXgCHsvS44mOR66vdcB
         I3dOTpVnEzWSiAx2+UC3+dKVoHJDYEQiVibd6V8s5hEBu7QE7Z07YuMzZJuvzU4tX7Al
         +7/WFASBzshursWvnOfoon2FdFgHULkroc4R+4FXsLn/Jb9fPPR4bxTv79k9YvQx7HSZ
         64o+jF9PQbI0lHvFDmoNZGdf43iPyKJGGBIj+SzdkjK0t05OHm3lmBPTs+4pK7W55QJ6
         fp40nT/u9swtuTpMu5Aifq5Hz2ZL+syaZgjqrIySyCRc+1XQHdcsEV1pwsuC3DEWfTAL
         7Wyg==
X-Gm-Message-State: AOAM532FXOrr19hPIK7vthmDfPlsh+d6L8dxrTYiZfUHPYuuDJJjgRH1
	Fs1KZ2Ar6YO0MNpzsNq0dRLhmrJ34FUvOw==
X-Google-Smtp-Source: ABdhPJyFnqbCKHR13XZyjG3iGbUCCyN2h/7Ak/Tc6mvnVG1kcORI7k6wMOok1Mzyts5Ty3ldIqWQww==
X-Received: by 2002:a1c:1f12:: with SMTP id f18mr10663512wmf.15.1602506209404;
        Mon, 12 Oct 2020 05:36:49 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:48 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 10/13] gst-examples: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:17 +0100
Message-Id: <20201012123620.2095778-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...001-Make-player-examples-installable.patch | 24 +++++++++----------
 ...mples_1.16.0.bb => gst-examples_1.18.0.bb} |  2 +-
 2 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.16.0.bb => gst-examples_1.18.0.bb} (96%)

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
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
index e23d23d9ca..bb998f6526 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "d953c127c1146b50d5676618299933950685dcd7"
+SRCREV = "009290dc8784e6714dc2a29be123110c14a38123"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

