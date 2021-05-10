Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.31343.1620651684045589626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ul9wRR4f;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w3so24391779ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+DT7nvqiPTR2yfvqMCYTVeWph41GdXUlqbIFxmeNzo0=;
        b=ul9wRR4fbfUywzTXUvRBZ4ZnQsfBu2TmmgBmEw+eB6k1zCfVXUad2NuJbNmTim0s7T
         mU3ywO0C7XvWtobhkyUZxoeVFzqlPsJhyvtbminhNF+VF0NncLxCTfU2fTzOFIq+DeFc
         rP/vDoxP0PKYTZ6ib64P3j1gwaEzqfKhfOA5o5r7mIfxLn67xFxx27ReAQbD6VCbmsDV
         ZmUs0etkd3QoiQsSCHdcvFFE27nh0G7JsMZEh/aW/01plZHWXVhcmLTipHs5vBpzHHmI
         MUpBIRPItTheGGDepCOSBBnXikoPoY2IHwjtA9L2BiDyi6DIataYuXy8XHC8rkUdv5xn
         hBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+DT7nvqiPTR2yfvqMCYTVeWph41GdXUlqbIFxmeNzo0=;
        b=Ei6d49mqK3g7AycbR4s8BS7YOyJi+KGFwEoVtTn2yU+uvop8e1SjV19WHT/hVjPHHx
         VU0NdD+iAbu7YNEk3Ay5mQLxCawMzLg4nYiIpu67NnO9dkpyGvTae3m0LJwzRERRHvkR
         2SulhTNu6EE6U5k5z+RZGz+nfVDXUrW+QWB+EC8/iX2F2YuSTEx777qT8tubinCf23SG
         jVk8viQzmoOBQPP6zdH5KrDgQcnDdQV9evEZnWOXFwvAeu2d49bBCCk4Z6B9IIRkOzWQ
         Sbq2VnAnjwXTKqh0dY697fpoWYizWs5t04qsVTCQ7fgJN6Z8LoNrWFyCifcPgKmVlvOW
         rEeQ==
X-Gm-Message-State: AOAM531G9rrHjHOv23ZeEA/EENLmY6RAlaT7Wkiz/O6Z/SbA5p6ow51k
	YOU9G2UGtivWZ3yKfRr01mpM8MDbLeo=
X-Google-Smtp-Source: ABdhPJwkvg0cK4Lcvh7zPP1g8mjPUEKUgEh2Q/pP+r7Ylc5d3JjkLJ1sXsE6XcElQHf61G0spoGBYg==
X-Received: by 2002:a17:906:bc4c:: with SMTP id s12mr24041083ejv.57.1620651682609;
        Mon, 10 May 2021 06:01:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:22 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 8/8] gstreamer1.0-plugins-base_1.18.4.bb: backport a patch to fix meson 0.58 builds
Date: Mon, 10 May 2021 15:01:10 +0200
Message-Id: <20210510130110.939820-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510130110.939820-1-alex.kanavin@gmail.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...c91697a141fea7317aff7f0f28e5a861db99.patch | 50 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.18.4.bb       |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
new file mode 100644
index 0000000000..a2f5dff5e9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
@@ -0,0 +1,50 @@
+From 4ef5c91697a141fea7317aff7f0f28e5a861db99 Mon Sep 17 00:00:00 2001
+From: Xavier Claessens <xavier.claessens@collabora.com>
+Date: Mon, 26 Apr 2021 14:25:03 -0400
+Subject: [PATCH] gstgl: Fix build when Meson >= 0.58.0rc1
+
+"implicit_include_directories: false" now also means that current build
+directory is not added to include paths by default any more. We have to
+add it manually because we have some custom_target() that generate
+headers in current build directory.
+
+See https://github.com/mesonbuild/meson/issues/8700.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1125>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gst-libs/gst/gl/meson.build | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/gl/meson.build b/gst-libs/gst/gl/meson.build
+index 66668644e..53891625a 100644
+--- a/gst-libs/gst/gl/meson.build
++++ b/gst-libs/gst/gl/meson.build
+@@ -1004,11 +1004,20 @@ if build_gstgl
+     command : [mkenums, glib_mkenums, '@OUTPUT@', '@INPUT@'])
+   gen_sources = [gl_enumtypes_h]
+ 
++  common_args = gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL']
++
++  # We have custom_target() that generate headers in the current build dir,
++  # but with implicit_include_directories: false, meson >= 0.58.0 won't include
++  # it by default. We cannot use include_directories('.') here because it would
++  # also include current source dir which is what we want to avoid because
++  # case-insensitive FS would include gst-libs/gl/egl/egl.h as EGL/egl.h.
++  common_args += '-I@0@'.format(meson.current_build_dir())
++
+   gstgl = library('gstgl-' + api_version,
+     gl_sources, gl_egl_sources, gl_x11_sources, gl_wayland_sources, gl_priv_sources, gl_enumtypes_c, gl_enumtypes_h,
+-    c_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
+-    cpp_args : gst_plugins_base_args + gl_cpp_args + ['-DBUILDING_GST_GL'],
+-    objc_args : gst_plugins_base_args + gl_cpp_args + gl_objc_args + ['-DBUILDING_GST_GL'],
++    c_args : common_args,
++    cpp_args : common_args,
++    objc_args : common_args + gl_objc_args,
+     include_directories : [configinc, libsinc, gl_includes],
+     version : libversion,
+     soversion : soversion,
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
index beddfb0386..73b433ab91 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
+           file://4ef5c91697a141fea7317aff7f0f28e5a861db99.patch \
            "
 SRC_URI[sha256sum] = "29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323"
 
-- 
2.31.1

