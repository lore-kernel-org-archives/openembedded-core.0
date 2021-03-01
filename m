Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.12569.1614607074043648990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 05:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G3clmz9d;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id u187so11681289wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 05:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TqV1e57kBdzjTYxizb7tlIhdlr02m2GNEXYWV2Huff0=;
        b=G3clmz9d7uFjD954Nd8VLtus7caxJzE1f6lDcc3NaSgSZnqyILmM6bE3ywXqMNlrD0
         o5LejmpKdD8Sv0rgJ/tMAt2WAGJ8k0eXPlgLu+RMeCLKM0PTQFdNXl1fYmkj14MnQRaQ
         AWU5tGXeDL5B49VVyAxnsOa+3t7uHmr7KlcYNm5PckYVgFq2LrRuMPaBd8l9E/RzqbUE
         6UbyZWCNqbG1baN7Rcy99vIgDNTPNkGaFkx3ZgAkeXQnQmUA/GcUCoLdtUh5fSSRPTxt
         GspHsa5/s34W8d4xnC3kHewc7Sez/rMfkcWYmi1Mz/RNj2qX8t4nCMh/ONdh6t5iKy8n
         WgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TqV1e57kBdzjTYxizb7tlIhdlr02m2GNEXYWV2Huff0=;
        b=sq1HqHn8JoA264H+2au6jS8CJzSfkISVOSytv/5NVNEZqBpzKXSDeDe0X78e3+7gaD
         0YtUvhL9OTPRHehpShHcq7g3366KST+gCG66/iVknvUVNrwzIJNge/DwbQQRAb5Tr1/K
         5c/Je1gwwFttrGoqb1ycfG2RWPHkVPUZiHWL7RYYBTtJvwsujYI8yJIXOJKghNkdZZ2H
         F32zFU7cX/xgHIui3KNl/AG9l2YSIhXTqg/OwNh9lSR0qbFGZQmhcGhxMNX3l8VsyUQ9
         dpCi/3ktb/kIUQiPS2hSA3oUZTXo5ect1dQWE8S6e6bmh1wxTWxsPW1tyMs85TrsfuXv
         3Cxg==
X-Gm-Message-State: AOAM532viJD9ZjYt3ISNgZwGluj9GNqrC3TiOuLE08VmnsVWUnvI3qGi
	2un8hlhJ9aaohAPWNMa08RvPUgqN9Ju8kA==
X-Google-Smtp-Source: ABdhPJwjC1f1YG2d7/5vd3T+9HphQVTgCS4tKgvZ44CuXell/gkRYjYO0Y1ptL2S4oGf2OIFLefnaQ==
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr16192954wmg.168.1614607072246;
        Mon, 01 Mar 2021 05:57:52 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.131])
        by smtp.gmail.com with ESMTPSA id d13sm17611472wro.23.2021.03.01.05.57.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 05:57:52 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] recipes-graphics: Add missing HOMEPAGE and DESCRIPTION for recipes.
Date: Mon,  1 Mar 2021 14:57:34 +0100
Message-Id: <20210301135738.12541-2-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301135738.12541-1-idadelm@gmail.com>
References: <20210301135738.12541-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc         | 5 +++++
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc         | 5 +++++
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb  | 2 ++
 meta/recipes-graphics/kmscube/kmscube_git.bb              | 6 +++++-
 .../recipes-graphics/mini-x-session/mini-x-session_0.1.bb | 1 +
 meta/recipes-graphics/mx/mx.inc                           | 6 ++++++
 meta/recipes-graphics/piglit/piglit_git.bb                | 2 ++
 meta/recipes-graphics/spir/spirv-tools_2020.5.bb          | 1 +
 .../startup-notification/startup-notification_0.12.bb     | 5 ++++-
 meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb  | 4 ++++
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb        | 2 ++
 meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb    | 1 +
 meta/recipes-graphics/waffle/waffle_1.6.1.bb              | 8 +++++++-
 .../xinput-calibrator/pointercal-xinput_0.0.bb            | 3 +++
 14 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 7d9db1f38c..1385027ceb 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -1,5 +1,10 @@
 SUMMARY = "GStreamer integration library for Clutter"
+DESCRIPTION = "Clutter-Gst is an integration library for using GStreamer with Clutter. \
+It provides a GStreamer sink to upload frames to GL and an actor that \
+implements the ClutterGstPlayer interface using playbin.
+"
 HOMEPAGE = "http://www.clutter-project.org/"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/clutter-gst/-/issues"
 LICENSE = "LGPLv2+"
 
 inherit clutter features_check upstream-version-is-even gobject-introspection
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 7bf2278555..9a28b5219b 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -1,5 +1,10 @@
 SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
+DESCRIPTION = "Clutter-GTK is a library providing facilities to integrate Clutter into GTK+ \
+applications and vice versa. It provides a GTK+ widget, GtkClutterEmbed, for embedding the \
+a Clutter stage into any GtkContainer; and GtkClutterActor, a Clutter \
+actor for embedding any GtkWidget inside a Clutter stage."
 HOMEPAGE = "http://www.clutter-project.org/"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/clutter/-/issues"
 LICENSE = "LGPLv2+"
 
 CLUTTERBASEBUILDCLASS = "meson"
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 89480d79d2..93e9192625 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -1,5 +1,7 @@
 SUMMARY = "IGT GPU Tools"
 DESCRIPTION = "IGT GPU Tools is a collection of tools for development and testing of the DRM drivers"
+HOMEPAGE = "https://gitlab.freedesktop.org/drm/igt-gpu-tools"
+BUGTRACKER = "https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
 
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 478d5c4de4..fbabd33aeb 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -1,4 +1,8 @@
-DESCRIPTION = "Demo application to showcase 3D graphics using kms and gbm"
+SUMMARY = "Demo application to showcase 3D graphics using kms and gbm"
+DESCRIPTION = "kmscube is a little demonstration program for how to drive bare metal graphics \
+without a compositor like X11, wayland or similar, using DRM/KMS (kernel mode \
+setting), GBM (graphics buffer manager) and EGL for rendering content using \
+OpenGL or OpenGL ES."
 HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
 LICENSE = "MIT"
 SECTION = "graphics"
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 4e89d631c3..549b0cbdf7 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Very simple session manager for X"
+DESCRIPTION = "Simple session manager for X, that provides just the right boilerplate to create a session and launch the browser "
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index 714a06f0af..c977849c96 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -1,4 +1,10 @@
 SUMMARY = "Clutter based UI widget library"
+DESCRIPTION = "Mx is a widget toolkit using Clutter that provides a set of standard interface \
+elements, including buttons, progress bars, scroll bars and others. It also \
+implements some standard  managers. One other interesting feature is the \
+possibility setting style properties from a CSS format file."
+HOMEPAGE = "https://github.com/clutter-project/mx"
+BUGTRACKER = "https://github.com/clutter-project/mx/issues"
 LICENSE = "LGPLv2.1"
 
 inherit clutter autotools features_check gobject-introspection gtk-doc
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a9d1d39dfe..7cc6a4647f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -1,6 +1,8 @@
 SUMMARY = "OpenGL driver testing framework"
 DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
 implementations."
+HOMEPAGE = "https://gitlab.freedesktop.org/mesa/piglit"
+BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.5.bb b/meta/recipes-graphics/spir/spirv-tools_2020.5.bb
index 5e42987240..d66d119ce1 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.5.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.5.bb
@@ -2,6 +2,7 @@ SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
 processing SPIR-V modules"
 DESCRIPTION = "The project includes an assembler, binary module parser, \
 disassembler, validator, and optimizer for SPIR-V."
+HOMEPAGE = "https://github.com/KhronosGroup/SPIRV-Tools"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "graphics"
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index d10bddb529..f69e4838f4 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -1,6 +1,9 @@
 SUMMARY = "Enables monitoring and display of application startup"
+DESCRIPTION = "Contains a reference implementation of the startup notification protocol. \
+The reference implementation is mostly under an X Window System style license, and has \
+no special dependencies. "
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/startup-notification/"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=Specifications"
+BUGTRACKER = "https://gitlab.freedesktop.org/xdg/startup-notification/-/issues"
 
 # most files are under MIT, but libsn/sn-util.c is under LGPL, the
 # effective license is LGPL
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
index 0e4d260960..538d252b63 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Vulkan Header files and API registry"
+DESCRIPTION = "Vulkan is a 3D graphics and compute API providing cross-platform access \
+to modern GPUs with low overhead and targeting realtime graphics applications such as \
+games and interactive media. This package contains the development headers \
+for packages wanting to make use of Vulkan."
 HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Headers"
 SECTION = "libs"
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 980557a3b9..c356df0e94 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -1,4 +1,6 @@
 DESCRIPTION = "The Vulkan Samples is collection of resources to help develop optimized Vulkan applications."
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Samples/issues"
 LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
index 0fc3494eea..786c949bba 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Vulkan Utilities and Tools"
+DESCRIPTION = "Assist development by enabling developers to verify their applications correct use of the Vulkan API."
 HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Tools"
 SECTION = "libs"
diff --git a/meta/recipes-graphics/waffle/waffle_1.6.1.bb b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
index 3f3c0e9028..07d7279c2b 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.1.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.1.bb
@@ -1,4 +1,10 @@
-SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
+SUMMARY = "A C library for selecting an OpenGL API and window system at runtime"
+DESCRIPTION = "A cross-platform C library that allows one to defer selection \
+of an OpenGL API and window system until runtime. For example, on Linux, Waffle \
+enables an application to select X11/EGL with an OpenGL 3.3 core profile, \
+Wayland with OpenGL ES2, and other window system / API combinations."
+HOMEPAGE = "http://www.waffle-gl.org/"
+BUGTRACKER = "https://gitlab.freedesktop.org/mesa/waffle"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 65348c3762..baaf8fa9ad 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Touchscreen calibration data from xinput-calibrator"
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/xinput_calibrator/"
+BUGTRACKER = "https://github.com/tias/xinput_calibrator/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-- 
2.25.1

