Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1517C4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.12069.1651248135043212142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PYz9Klp1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 15so6857857pgf.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qXg8GmoCwRcXoa7fd8Oz9Z6NDMZaz3XUMfyXudTclVE=;
        b=PYz9Klp1xD1MpvR2fYbSfRi7PCxcKeAJuVZF/1dafQM+hJ0NQPE+d+vCSaqBXXrs9g
         bWzBee8mkWX8G8bU5jaARVJta7Nq5L5oo3fG4dy3CJhS6lcjy4ntFQleKNS9wC3shRib
         g1y3o4o4X0hS11ZbC7qt+xZJXh5nGc8ZXNCKHfWHzgS3/rVoy6nvYj2mqcEB0AIg1ki+
         KIz/gwSBKK1nAFpQOdDlOfC9a4l6Uia51CO+AP7tDPETZbXyDUxkWHDmIsvkKVLcbOd2
         0wxyE5dE21yuppuREJfq/sLHgGH5w+mIS8l+xKywx4FXQKZGsv2TtERIYYeHzLpwEsIZ
         X8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXg8GmoCwRcXoa7fd8Oz9Z6NDMZaz3XUMfyXudTclVE=;
        b=MpLcWEPsqxMyHBUQTTH8JWlPtYg8l6NcFGgbaBAKEX1A+DzDj0Uz1Ni9MBU4hByjH3
         zwz8FjkGVuyaWm46w3D6Vb9hPYqOaoBA8yVZ7YUQeRuNx+NxbnnFwlr/PWMXHSur8DcM
         xSkGdoRigRZmuF8BqTPlp5WmlhO+2SRgkIrwpuasHcVHvAd2yZrUv/pO/jQ6OTTh6GdO
         6MAvdcZ9vxPZYiTU9aq+yOsN2AG2rcTCQO806c0QstGx/ePBPcLL98C15PtMSXmGGjIW
         T9q55K20HTvOb5/jGCksSN+zTFX0jVeA12xmQJ+HFX8yquxceqJoDlDLPwQy5Be4npSn
         KqfA==
X-Gm-Message-State: AOAM533EaE9ZLsr2pwi4FlIcsgpiXv4p6P/So1l/QcZHeylb15EkY5AM
	Zqo0XWGC6ohjDvQRdlqdOAll+W/TEXaSGjM5eso=
X-Google-Smtp-Source: 
 ABdhPJwmaL8IQ7JClrT/7yStoEHg6rAfUkv0l9e9H+vwIv9AWOaEmjunTkSBruwEHxWc3jfptoyzTQ==
X-Received: by 2002:a63:c54:0:b0:3c1:9510:8b9a with SMTP id
 20-20020a630c54000000b003c195108b9amr43867pgm.513.1651248133735;
        Fri, 29 Apr 2022 09:02:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/34] gstreamer1.0-plugins-bad: drop patch
Date: Fri, 29 Apr 2022 06:00:40 -1000
Message-Id: 
 <aaea86534127b1c78d78ffe3a98bacec63d2d8a2.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165040

From: Naveen Saini <naveen.kumar.saini@intel.com>

With latest gstreamer version pkg-config able to find header
path with msdk enabled.

Drop this patch as its not require anymore.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eaa3b31247b4d3cc47428f4d80ae31f232e344d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0005-msdk-fix-includedir-path.patch       | 40 -------------------
 .../gstreamer1.0-plugins-bad_1.20.1.bb        |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
deleted file mode 100644
index 273b45bd49..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e31f68c46ff0c29fa3c22755f18d5dde87b23bf2 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 30 Dec 2020 16:37:47 +0800
-Subject: [PATCH] msdk: fix includedir path
-
-In cross compilation, need to prepend PKG_CONFIG_SYSROOT_DIR to the dir path.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
-
----
- sys/msdk/meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/sys/msdk/meson.build b/sys/msdk/meson.build
-index 24aabc7..6003bb7 100644
---- a/sys/msdk/meson.build
-+++ b/sys/msdk/meson.build
-@@ -46,7 +46,9 @@ if mfx_api != 'oneVPL'
-   mfx_dep = dependency('libmfx', version: ['>= 1.0', '<= 1.99'], required: false)
- 
-   if mfx_dep.found()
-+    pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-     mfx_incdir = mfx_dep.get_variable('includedir')
-+    mfx_incdir = pkgconf_sysroot +  mfx_incdir
-     mfx_inc = []
-     use_msdk = true
-   else
-@@ -75,7 +77,9 @@ if not use_msdk and mfx_api != 'MSDK'
-   mfx_dep = dependency('vpl', version: '>= 2.2', required: false)
- 
-   if mfx_dep.found()
-+    pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-     mfx_incdir = mfx_dep.get_variable('includedir')
-+    mfx_incdir = pkgconf_sysroot +  mfx_incdir
-     mfx_inc = []
-     use_onevpl = true
-   endif
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
index f139281149..7c4665ae80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-           file://0005-msdk-fix-includedir-path.patch \
            "
 SRC_URI[sha256sum] = "09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848"
 
-- 
2.25.1


