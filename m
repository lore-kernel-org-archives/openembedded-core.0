Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.14991.1602947732686557909
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RMZ1pkND;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id s9so6681660wro.8
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p653nTriw7Qs4IpjT601Yslx+JmHnq2VK5xVyiQKj0o=;
        b=RMZ1pkND64eiVbSWjho1RuRgcnqJDql3JmK3NBdc2DIYd+Od1rDcJYNK3P5aYRxUmJ
         vFQ+NRrVqaRYnivtQqbSrc2f3p2ul22o1jo8o4egqZOlR0FOKJAWh08JsZ6H0ugZY8qb
         2OCqEdqc8OlsIZDns8vNnePNOirsJjTRXE7MA+emA0x/wovhISykjRGKi/kHGKkUezeq
         VfnkkfI4P8xpn7fX8cvdFL0M1s1E1bZnrncmPwRdaE5ZCmYDr059j74bgK5rulGTwU/f
         yjtcUfik3BrRE281WiS/HGTbFxNlGMqqwnQxQVOZUwKUnp+y+U6OIGAqTttb8OlgvGpi
         ZssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p653nTriw7Qs4IpjT601Yslx+JmHnq2VK5xVyiQKj0o=;
        b=ajgl4peZmW++WCGyyEYj6CJS0UBPt1E+4aWKyvtThLjG3khudhsJ7LgnC6mn40d+2s
         kF8p6K5k2ENH7Wg5z/yvseA8WTJ0+ll1/WoYehCtnLe8IAogQyATjVY/wNpM+zyhiCYt
         QIjrDXiG/kIw51PAYeXh8HMqdppDTpYzrrNhddxJWwYXwe+pSA59WP27jExT3JjA78/v
         X6y7xIIPx0MFwRsBoLBbee9x26WrbSHWxyeO2mVxVmP37ZuDxXYxUpGX3jivqdxJR2Eu
         sPuTJxvUD0wUZXNvSOaojoVg8lZfjEJ+tQWOWemn5yWeeyCtrAYzR7pqiwqqPSqV19je
         E/eg==
X-Gm-Message-State: AOAM530CvQuk7PpgwHeb27k5kfqAlJT2tiV1bAp+48p4LRINZbU+xYU/
	4MFNfoEsSjJysYDl0Y7PXt0cyo0SiFHQRA==
X-Google-Smtp-Source: ABdhPJwPB9Jb/1/HRII90wbUEXM2C8PHPz64BRRw0vN8QEmh8u2StWsdRXoS9nXiPUuFrXJCq3tMzw==
X-Received: by 2002:adf:e801:: with SMTP id o1mr10627718wrm.359.1602947731067;
        Sat, 17 Oct 2020 08:15:31 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:30 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 09/13] gst-examples: upgrade to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:20 +0100
Message-Id: <20201017151524.31550-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
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

