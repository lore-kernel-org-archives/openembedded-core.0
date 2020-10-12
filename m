Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.39507.1602506208853640884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nbsBNUh2;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id d3so17370691wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DKVkhVagdRst7Uqu19XwF6UfNEfU4nw+V1fjeqY9FUM=;
        b=nbsBNUh2tNm3OB7R3n0i7r2XDIBJxjqL3XOa4phGlpauhLKlZ99iJyLknW2Rnkq6d5
         EAWNZYExxSuKIrG1xB+ZJ9X4Ie7esUjNZaf9NfH0biJY01G982MEU8osc8kTrbz5ZtEo
         hWjMeU1fg4+LtOjUF3XCp9+5+jA3cf76a0EaCcHBkzqWiobbZVUapAGTtndK+tcY5GGz
         Ls0+q1YWZt3mfYr9Iio0oG97JSInjNk7vVFBMQxBcxS9Q21hSjo4bEDdUDBshkVwyOHO
         7IjGYkNnyyV3JI6Y8fXx5GHA3fL29rhJmQ/sM0p9ahWfaBzY0XE0jgpkVgsg3xmLxpKo
         V9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DKVkhVagdRst7Uqu19XwF6UfNEfU4nw+V1fjeqY9FUM=;
        b=NLEWhY8lG7job5QBmLdKrw054cmOry4qsyBe2ZDFvKvIfPC1334paiJ3+kQuoxq9Mg
         FCZxwom1FKhvQrgxc6HovO8LLDgbv3QL8Ai59MJOT8oRl1AZJXtGJcBs+GM9hlxDoLpO
         LA40pDgE3W4VJ1X34SpekSDAp8840ArJEM0eWgBKrDJNVB6ahZ2ndbIsHwnXW13ydtqP
         hbvDHW37L7fMwRj4PR806yz/nfBlGmyE2AoDD/qf8buNbJaMOyZPGoHRitXjJohjxAtv
         LkF1wt6Ko+GaHPxA+K/IytZJoR+524+EUCodt/VMlJCFyt5M9Jnu5Zb/EiXlH/D4NBhH
         2kcA==
X-Gm-Message-State: AOAM531K9lRLBoaaOFoNqQfruklHktua+8OwKqN1v2PLkIG2cRHdHJ9X
	+hFSvBbvMR9ZMTPkzrKPotdkotrPWSn1WA==
X-Google-Smtp-Source: ABdhPJxSEt9Dxy7e4vgJfUc7F5h9NHBotqqqrRSaQLHDwOm0OHgFujf2Cogx5KBNf1Sq8Oyb4L4VPQ==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr3372093wmk.67.1602506204163;
        Mon, 12 Oct 2020 05:36:44 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:43 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
Date: Mon, 12 Oct 2020 13:36:12 +0100
Message-Id: <20201012123620.2095778-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vulkan build fail
to build vulkan, a new package is needed.
add shaderc package as a separate pacth

https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1349

| Program glslc found: NO
| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc'] not found or not executable

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb       | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 680b9a5cf5..7fc2eec0cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -22,7 +22,7 @@ inherit gobject-introspection
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
@@ -76,7 +76,13 @@ PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 l
 PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
-PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader"
+# FIXME: vulkan build fail
+# to build vulkan, a new package is needed.
+# add shaderc package as a separate pacth
+# https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1349
+#| Program glslc found: NO
+#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc'] not found or not executable
+#PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc"
 PACKAGECONFIG[wayland]         = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
-- 
2.28.0

