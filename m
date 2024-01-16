Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B60C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 10:07:54 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9954.1705399665176387191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 02:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nV5z0W18;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d51bf8a7dcso20838465ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705399664; x=1706004464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjOtgaVYmMOB7aZO6TGu3C9Bzu2oLXutv0+x+rK1uKQ=;
        b=nV5z0W18vlJIjFV2xaiabhp9pVyB9f2p9xL7f3Z63IZnAkGR59buyaSRJ3ZSnSm444
         tBz5l5Ixcizc2PXkVbOC1fArNLuG5wlstw3PIuvqBQ9HrNm/02WlPp0F1Z6VvVa5l+hd
         zsG5si4GUUaA0lSAoLo+iGiriXEu/uyFiyFv0a34sOT5r9B7vHq2fLSQpo0NKk/iId+n
         4Tm8Cw9QiO+TomRwBuoV9Z3uyv7/t/OlsPk2m62cc4yicLQ98dHCuPaCe3LY4o9Dh2gY
         jwE0qtQzNDB92xzsNCBjoqT5hFWsyC/8M5GrWucjYU01gf7cKjHHfSGEjK4/KIjenwwB
         HZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705399664; x=1706004464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjOtgaVYmMOB7aZO6TGu3C9Bzu2oLXutv0+x+rK1uKQ=;
        b=korR+/n5PIjRE2ibV0m+CNOZXTgbP44vppiT9F125JBKV2igLGC0gJVRDO8hfGbtyZ
         0TlrOoQZFJN/t+HscDlON59brfujsf7h2PVAK6tazznujC3FM+fBVbx+504BS+jdgEmO
         AOwGWCLabJvkRN4BlwNGHTe4doO/UZyhb71UuYZ9LxwVt1gb87yUTJkIdFNlXXOGwHlt
         /sbk5o1E9LAgGdd+/PWH+pGBT7s2heKx730PC6ZB2sqbAE9BFCKdrJRJKQ+WZMhYVKfI
         cWyXlOw8y1mc9eJOtjv94Q7Dyt1CLaX1y5nqRcBM6Vu5mtwn+YEH81yjTdgEB4KxuA0x
         RyLA==
X-Gm-Message-State: AOJu0YzqHhcNqI3LMG7D3b7Ngujm1m6oMyRosqHgG9ZyXuVcz6XYpYAQ
	9Znr2ANUlInc7hrip1bqM6DFCSiYolM=
X-Google-Smtp-Source: AGHT+IFwBHlCRCNnRWXKUte0Se5ScjGr3vojqGei5NIKKpQRZdXZ75hVcUUcJ7bdQliskPpwulQ/Vg==
X-Received: by 2002:a17:902:e803:b0:1d4:b46d:81fe with SMTP id u3-20020a170902e80300b001d4b46d81femr13821274plg.3.1705399664123;
        Tue, 16 Jan 2024 02:07:44 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:6721:ae83:1e87:5aff])
        by smtp.gmail.com with ESMTPSA id ja20-20020a170902efd400b001d5e7348692sm915158plb.277.2024.01.16.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 02:07:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] weston: Update to 13.0.0
Date: Tue, 16 Jan 2024 07:07:37 -0300
Message-Id: <20240116100737.3324375-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193849

From: Fabio Estevam <festevam@denx.de>

Update to Weston 13.0.0.

Remove the following options that were no longer exist in 13.0.0:
deprecated-launcher-logind and launcher-libseat.

Add seatd as a required dependency for kms.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fixed typo in the commit log. (Khem)

 .../wayland/{weston_12.0.2.bb => weston_13.0.0.bb}       | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_12.0.2.bb => weston_13.0.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/weston_12.0.2.bb b/meta/recipes-graphics/wayland/weston_13.0.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/weston_12.0.2.bb
rename to meta/recipes-graphics/wayland/weston_13.0.0.bb
index cfcaaca9c7..c74f471f07 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "eb686a7cf00992a23b17f192fca9a887313e92c346ee35d8575196983d656b4a"
+SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -38,7 +38,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
-                   launcher-libseat \
                    image-jpeg \
                    screenshare \
                    shell-desktop \
@@ -54,7 +53,7 @@ SIMPLECLIENTS ?= "all"
 # Compositor choices
 #
 # Weston on KMS
-PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/egl virtual/libgles2 virtual/libgbm mtdev"
+PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev seatd virtual/egl virtual/libgles2 virtual/libgbm mtdev"
 # Weston on Wayland (nested Weston)
 PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl virtual/libgles2"
 # Weston on X11
@@ -93,10 +92,6 @@ PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
 PACKAGECONFIG[shell-kiosk] = "-Dshell-kiosk=true,-Dshell-kiosk=false"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
-# support libseat based launch
-PACKAGECONFIG[launcher-libseat] = "-Dlauncher-libseat=true,-Dlauncher-libseat=false,seatd"
-# deprecated and superseded by libseat launcher
-PACKAGECONFIG[launcher-logind] = "-Ddeprecated-launcher-logind=true,-Ddeprecated-launcher-logind=false,"
 # screencasting via PipeWire
 PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire"
 # VNC remote screensharing
-- 
2.37.3


