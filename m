Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.8729.1604910712870514958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uzuZnCZr;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id me8so1541356ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5+y1i+7BU97RyeU+KBL7uv7h1qBCkqQ/aMt977qqb9g=;
        b=uzuZnCZr3A/Y6SY1j4MDJ8eX/ZCEOlkojeX92hBUzwDea1cUJ5VgrwTz7gKwllSCOA
         SMAtsVzvTvkrrqTH06nLVxg08NUZj3q3GMR5EFccbLLCe1cMTekqTy+O3AOOQhoWecIe
         STm57mwsq7/68WupoU1ma30njcDkDL/wu/QQp5FrSSufa5kpzkZxu4LjP+QMglOIpY4P
         4U/To8n5IRWIxHuURhApotrSkXtCXpvVy30eXB/r4quP+4mbjpmG52aaGujR3JTAktWf
         FOQ4lRBHMWvjno/6gFLUIkNrG5QONkw/x0KJCOkHJ5/AhB4ivSLh+Ssa4uk7JDdjeHh2
         d5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+y1i+7BU97RyeU+KBL7uv7h1qBCkqQ/aMt977qqb9g=;
        b=nHuMHFGAnKadmPUGT9fmDZpq6pKNWRLsvfPG/8FSiDSi4GYZd5Ikz4raZeM7Q9uzxd
         OOC2NIibOmu1E0+UvXX5pvCdg+q5s1O/9zQDu4aP6zP5dAlxILWyeAOLAw1oyhZ5Cfzg
         Rrn6vgSw2mW7wiBHGNk50Z+mXPXQikiVv7EXtJ1FvfHCeI9ZJjW7XvS7PCSzldU6RdyD
         h9wG1Nn47qAmQs+Wd0Fo04FNt1xAQ8nE/cCRy0cZRK6Gel79yIXOlHNHdODHgMScpBaN
         lmRuA4nyOMVVVP0U3dkIl1KFQMEFzyiKA5AfGaH2JwkjMTXGr+egpubKkawPhRFLRyt/
         WCqw==
X-Gm-Message-State: AOAM530ToUQsFsJeFQgKuu8cqkQ/ehHg73blmgKD642rpUckdjGYbppf
	PIXIzYVWXYCaTihZd+OLQ105TGQ9+u5FOg==
X-Google-Smtp-Source: ABdhPJwbwwYGZlHvPXn6SwYe2FaaFBlPs/1R8v9qwoZxzOAAqYvV9VLH0i81T0mJHoEbAcxXUawBVg==
X-Received: by 2002:a17:907:262d:: with SMTP id aq13mr13429544ejc.484.1604910711196;
        Mon, 09 Nov 2020 00:31:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:50 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 10/12] wayland-utils: introduce a recipe
Date: Mon,  9 Nov 2020 09:31:31 +0100
Message-Id: <20201109083133.16503-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wayland-utils contains wayland-info utility which deprecates
and replaces weston-info from weston.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/runtime/cases/weston.py         |  8 ++++----
 .../images/core-image-weston.bb               |  2 +-
 .../wayland/wayland-utils_1.0.0.bb            | 20 +++++++++++++++++++
 4 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ae04ef07c1..0911ddd461 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -724,6 +724,7 @@ RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-wayland-utils = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index d3fbf8ba92..a1c7183213 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -51,10 +51,10 @@ class WestonTest(OERuntimeTestCase):
 
         return new_wl_processes, try_cnt
 
-    @OEHasPackage(['weston'])
-    def test_weston_info(self):
-        status, output = self.target.run(self.get_weston_command('weston-info'))
-        self.assertEqual(status, 0, msg='weston-info error: %s' % output)
+    @OEHasPackage(['wayland-utils'])
+    def test_wayland_info(self):
+        status, output = self.target.run(self.get_weston_command('wayland-info'))
+        self.assertEqual(status, 0, msg='wayland-info error: %s' % output)
 
     @OEHasPackage(['weston'])
     def test_weston_can_initialize_new_wayland_compositor(self):
diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index fa7e9ef421..8d88e3bc0c 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -8,7 +8,7 @@ inherit core-image features_check
 
 REQUIRED_DISTRO_FEATURES = "wayland"
 
-CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples wayland-utils gtk+3-demo clutter-1.0-examples"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
 
 QB_MEM = "-m 512"
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb
new file mode 100644
index 0000000000..4c51f7e8c5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.0.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Wayland utilities"
+DESCRIPTION = "Wayland-utils contains (for now) \
+wayland-info, a utility for displaying information about the Wayland \
+protocols supported by a Wayland compositor. \
+wayland-info is basically a standalone version of weston-info as found \
+in weston repository. "
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
+                   "
+
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           "
+SRC_URI[sha256sum] = "64fecc4c58e87ae9b302901abe10c2e8af69c7503c221a96ecd0700e0aa268c0"
+
+UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+
+inherit meson pkgconfig
+
+DEPENDS += "wayland wayland-native wayland-protocols"
-- 
2.29.1

