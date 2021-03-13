Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.2531.1615661439813497546
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dZjutd+8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id j22so5187945otp.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mZwYN6TAR3bmNI6qbH+BgrQL8y9COBcJsrpt9zVr3n4=;
        b=dZjutd+8RIGuuabEVH4T7oqg9E/BFsn3ijY/IbgDs9wY6Fq4D5i1QtfekWwa6Pdit1
         eNIR6oq3eP5BM3Lvc6ZbSPVk5Tpur40gC8ZRr7tFpkcEDRb/qJDIFUmEkRVQHCHCPTM1
         nS/3eT7IbM4DbZEBoQ2DjKohJ52wCs9RtLCTo68VBHnKWljpi/fjbKqGPm/UqIII0vTb
         9xcwSp9zvlBTjSJdAjyJHExuDvSxaSRRtWzSx/zT9Bvk3AHBp5H43/wXfDNXHUy7TQNp
         LxqG1LSFKhqOohdsWRFkh1r6gssBaC2oKwreJyycUuvEA+RIFOvFBIrACoFNgshIclnX
         aS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZwYN6TAR3bmNI6qbH+BgrQL8y9COBcJsrpt9zVr3n4=;
        b=EdlrTC1WIf/6omYptS7jQXpb/p6STd+7r6ZdkPujIznbirgzZXlQ+Ri5HxGySkPbmg
         +UvQTgy2rlJCAG+uwWS5UlmsexXsbE5OCaYN8NJFSSQLBwbwA+FvDunIsRCa82VnrJ+G
         Dtw5GraYmiRLMGYeVDlUBGm+psZ/FHRe/BSP/3hcmydI/wrAqIBtpmPvOhVXiHGCYx5A
         SRRBoUWaJ90AjdK7afKkbx2cbTOxdzErK4plGlU0pxdvpYn2usTJPQp7pJxgWa+0Duqr
         uZFNoDhYcsdI3vbp/9OiUsCNoBF4I/S95liyo3h8rY2R9ykpg41yiR5/RhBLA5UyvarV
         f9iw==
X-Gm-Message-State: AOAM530eAYX83E51tZfer/zfa70aUOQ+MwsyGa1qSYHbbVzZ8cAlzD5Z
	ymVgC8t0vTBZVH3AepzuVYxrpV2KyIa11bl6
X-Google-Smtp-Source: ABdhPJzdOvcfYkS7FFPT1J39yZePtZ93RFLCnW137HNGLYWN2NHm7avc8dXjsuRe5csQ88/0oogm3g==
X-Received: by 2002:a05:6830:3197:: with SMTP id p23mr8133968ots.3.1615661438528;
        Sat, 13 Mar 2021 10:50:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/38] recipes-graphics: Add missing HOMEPAGE and DESCRIPTION for recipes.
Date: Sat, 13 Mar 2021 08:48:58 -1000
Message-Id: <4041267ed54a005f904af7a326b3465e40602ec2.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meh Mbeh Ida Delphine <idadelm@gmail.com>

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 24eac1fef8892484cc3dede1853d180e0c235120)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc         | 4 ++++
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc         | 5 +++++
 meta/recipes-graphics/kmscube/kmscube_git.bb              | 6 +++++-
 .../recipes-graphics/mini-x-session/mini-x-session_0.1.bb | 1 +
 meta/recipes-graphics/mx/mx.inc                           | 6 ++++++
 meta/recipes-graphics/piglit/piglit_git.bb                | 2 ++
 .../startup-notification/startup-notification_0.12.bb     | 5 ++++-
 meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb  | 4 ++++
 meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb    | 1 +
 meta/recipes-graphics/waffle/waffle_1.6.0.bb              | 8 +++++++-
 .../xinput-calibrator/pointercal-xinput_0.0.bb            | 3 +++
 11 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 7d9db1f38c..73315c97ec 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -1,5 +1,9 @@
 SUMMARY = "GStreamer integration library for Clutter"
+DESCRIPTION = "Clutter-Gst is an integration library for using GStreamer with Clutter. \
+It provides a GStreamer sink to upload frames to GL and an actor that \
+implements the ClutterGstPlayer interface using playbin."
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
diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index a1a295f660..0aae6df357 100644
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
index 58d10d6b9b..4229412554 100644
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
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
index 72c29a72a2..b9658d3afa 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Vulkan Header files and API registry"
+DESCRIPTION = "Vulkan is a 3D graphics and compute API providing cross-platform access \
+to modern GPUs with low overhead and targeting realtime graphics applications such as \
+games and interactive media. This package contains the development headers \
+for packages wanting to make use of Vulkan."
 HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Headers"
 SECTION = "libs"
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
index 2fd61c989a..8eef1bca73 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.1.126.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Vulkan Utilities and Tools"
+DESCRIPTION = "Assist development by enabling developers to verify their applications correct use of the Vulkan API."
 HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Tools"
 SECTION = "libs"
diff --git a/meta/recipes-graphics/waffle/waffle_1.6.0.bb b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
index a620295978..14d6a61525 100644
--- a/meta/recipes-graphics/waffle/waffle_1.6.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.6.0.bb
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

