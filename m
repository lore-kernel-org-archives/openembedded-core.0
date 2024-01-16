Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A32AC4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 03:25:42 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.3485.1705375540401257540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 19:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LyKwNqt7;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: festevam@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2057f388b2dso1918081fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 19:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705375539; x=1705980339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuOzXlE6i/3olq0VaLTz70ax4gszlexTy75RyBAnXWs=;
        b=LyKwNqt7JO7qFjXI/YlKW2vkoqA9fuIb0xOzHZdwUOOQeEQQpnRq7K7ijLsmcm6N9B
         Uk9tl+4QVxR6gYrEFsZ4yBdfyjH3bSa+HlFBCJeAWSiqHy7l5p/NmFyFGK2vxVJBxFwq
         B0gdmufslshL/q4iRbu8DA7k3tDcjf5+F5w/n5uGZ6pwlJJLHOQxKIrphMWbCxrJqGLX
         OdoVCEiGT8YM3RZXHtcIUrOZral6fpTZf1HXdyGeumue4XP4Q3rqTj0+BPG1gKoko/SX
         ZUQeCZjuaHQLKcs0D4ACg7ek/a2W4FhJcp23oCSLuyww9wwgMrJ8SwPmMCOKK/4Qzzh+
         7/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705375539; x=1705980339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuOzXlE6i/3olq0VaLTz70ax4gszlexTy75RyBAnXWs=;
        b=myC4BzKOZIyEyaNoaHbfC0FScMYKvxV9r75N9B1eTt1K/1mfC2K2zSMTKU1ZWk0pIE
         p3CYfg/yr83Ff8O50UFTP7QLol7/Fom6Iyx/Dhv4enPywwYGyaIO20vu0xwphr7KM4xN
         GMvBw1hLlxPcNJCaiic6vQ/axN2nGDvTJ/u1MVj/l2u/PJwb3OJVI87uf0TiBIuVEKED
         qX31btg1+02GMqiPcqYaYmeG3o6j1kkkv9nugOBHY9ruiG81MgeVds93rD0AnFxikzAX
         6s+VGLWqSZD2n2FnyI3IEXG7CRAvOvppDncZecu+P/HeJ93j3mn2fH0EffEKEYAgHe77
         HZoQ==
X-Gm-Message-State: AOJu0Yww90PrE238wXiujmDZnxYzISPcr9xgZdnrxBsA7oTUT9YYViFJ
	SuVZAQpSsNYV29v19INoxFD069TDCnI=
X-Google-Smtp-Source: AGHT+IHDrUyk/jZ9V833SLbPqRn9ZIgZDGsjAh3xMKjWm6CvzNHOVyCtxT2DJEhdvIEa/u/Ge4gDFA==
X-Received: by 2002:aca:2413:0:b0:3bd:660d:5d6a with SMTP id n19-20020aca2413000000b003bd660d5d6amr9501392oic.2.1705375539270;
        Mon, 15 Jan 2024 19:25:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3ce7:bbce:335e:2c36])
        by smtp.gmail.com with ESMTPSA id k18-20020aa792d2000000b006d9b0336a27sm8282869pfa.125.2024.01.15.19.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 19:25:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] weston: Update to 13.0.0
Date: Tue, 16 Jan 2024 00:25:29 -0300
Message-Id: <20240116032529.3321994-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 03:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193815

From: Fabio Estevam <festevam@denx.de>

Update to Weston 13.0.0.

Remove the following options that were no longer exist in 13.0.0:
launcher-libseat and launcher-libseat.

Add seatd as a required dependency for kms.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
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


