Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.6381.1614679677480846800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 02:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kVFBUFNj;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id o2so1551430wme.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 02:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nAlOAuZqHfjcyWpzyOKB3Vz4HTRKlKh7NrLSqFSKQd0=;
        b=kVFBUFNjjwd5uZd7yPYJI7I4cW97PGfafdSo2jg3FOLGCveHKvjPf7SK1mPdG313aK
         wYlqBaLxNbSwcBzm9kg0Jse5sWw/ufudKk0MPhb2lgWTFmm4MXqdIaiE2ms9VOKqc5fx
         pw6xY+aDT0FtsB1uMCGsuNdvGWTIfJyVvwCkxA3L6kwTgchoa71hcS1eP1T36AsPrk2O
         SUv5g43ryne1Bl1umpT/fnUU92IuY9BQ86TQyR82ipwG0S5j4z9VN0Un1bhH6yypYsUD
         2XMECpnE9+lOpXOS/2qPpJt8qSiywn9n4lF6DaEO4ZoiPZIycKMZzDpIDTLh4FXSYIBq
         jD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nAlOAuZqHfjcyWpzyOKB3Vz4HTRKlKh7NrLSqFSKQd0=;
        b=eTk6nFNUzYz0Umq2bHrCNsg5osiGhIZrtiKe4we2qrwbpoWsm322N8VXf9v1ilB3oD
         8PpmGLuKq4rrFIO3oB71VaFOZ/2cM+hQ8DZYiYy4ucHIY9VJL69Q5rWBNHh/TLHTJwso
         Bd1/j8I/jJyQsxOG/VhEaK+rGs88hbOwkbLc40RnI2Dkem1gOF1gSfNJbHtk5tudlBvt
         hh5xwh1CXiBiTNPZb693AaUhBwpxMpxVYaPIadLjXMeiNBIl56I40asnFlzPz5Z/3ISt
         sEV6Yt7h7qbqAqYYX7cdVjGCM7eaZw4+5p4ESai9bsHWiaZvHVsQRDh7fuPcoorBV6Pm
         zC7w==
X-Gm-Message-State: AOAM5330jqMa2BJH5ejxlWHZNXUmRtDwVmR7gYD108QKoiQ1O/u3qd/1
	1l8lEvPNvs3QeD13htmO+LXkx19BiV6vHQ==
X-Google-Smtp-Source: ABdhPJwnx/zcWOY1+KNm/n5yYcco6j3616FWMMRJ5hVj9As9Ce5Rsz11guyqxTA1HEatJDMm0HEoTw==
X-Received: by 2002:a1c:400b:: with SMTP id n11mr3141358wma.167.1614679675504;
        Tue, 02 Mar 2021 02:07:55 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([154.72.153.141])
        by smtp.gmail.com with ESMTPSA id m11sm15369568wrz.40.2021.03.02.02.07.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:07:55 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] Edit DESCRIPTION of recipes
Date: Tue,  2 Mar 2021 11:07:34 +0100
Message-Id: <20210302100734.114315-4-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302100734.114315-1-idadelm@gmail.com>
References: <20210302100734.114315-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to fix the ParseError during the build.
Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/recipes-gnome/libhandy/libhandy_1.0.3.bb                | 3 +--
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc            | 3 +--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb | 3 +--
 meta/recipes-sato/l3afpad/l3afpad_git.bb                     | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
index 424ad67a86..a53a1388f9 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.3.bb
@@ -1,6 +1,5 @@
 SUMMARY = "A library full of GTK+ widgets for mobile phones"
-DESCRIPTION = "Library with GTK widgets for mobile phones.
-Libhandy provides \
+DESCRIPTION = "Library with GTK widgets for mobile phones. Libhandy provides \
 GTK widgets and GObjects to ease developing applications for mobile phones. \
 It was developed by Purism (and used by several official GNOME projects) \
 to extend Gtk by providing mobile-friendly widgets and make the creation of \
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 1385027ceb..73315c97ec 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -1,8 +1,7 @@
 SUMMARY = "GStreamer integration library for Clutter"
 DESCRIPTION = "Clutter-Gst is an integration library for using GStreamer with Clutter. \
 It provides a GStreamer sink to upload frames to GL and an actor that \
-implements the ClutterGstPlayer interface using playbin.
-"
+implements the ClutterGstPlayer interface using playbin."
 HOMEPAGE = "http://www.clutter-project.org/"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/clutter-gst/-/issues"
 LICENSE = "LGPLv2+"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
index 36bb5b5dd7..d55f45ac6a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
@@ -1,6 +1,5 @@
 SUMMARY = "OpenMAX IL plugins for GStreamer"
-DESCRIPTION = "Wraps available OpenMAX IL components and makes
- them available as standard GStreamer elements."
+DESCRIPTION = "Wraps available OpenMAX IL components and makes them available as standard GStreamer elements."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
index e399a9d2af..85c2c500ea 100644
--- a/meta/recipes-sato/l3afpad/l3afpad_git.bb
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -2,8 +2,7 @@ SUMMARY = "Simple GTK+ Text Editor"
 DESCRIPTION = "L3afpad is a simple GTK+ text editor that emphasizes simplicity. As development \
 focuses on keeping weight down to a minimum, only the most essential features \
 are implemented in the editor. L3afpad is simple to use, is easily compiled, \
-requires few libraries, and starts up quickly.
-"
+requires few libraries, and starts up quickly."
 HOMEPAGE = "https://github.com/stevenhoneyman/l3afpad"
 
 # Note that COPYING seems to mistakenly contain LGPLv2.1.
-- 
2.25.1

