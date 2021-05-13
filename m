Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.178.1620939406799935575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HuAdLMyt;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id n25so32456376edr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+DT7nvqiPTR2yfvqMCYTVeWph41GdXUlqbIFxmeNzo0=;
        b=HuAdLMytlBvZU9x2UALQdKdDMT6hxRhjuoRwBNrkIEcSvs+cKcpWnqV+YV6UIWJaq+
         q1V0OTHP4F9sSO6IqwpH+QdvQSIlCN2gWEoc8WqndgtrEQkhkQ8MuxE21ygewGEohaBJ
         EQg355r4zxwoaaQdbg9plDPELNk7ipC0/sz/UXv1zI+mlY3IsRhZjIZgcTy9iOWj1dyD
         UepN4wTpAYv17NdlaQNNa/wchuhjoSUW4vSVCsDQ/g3BpXPNruU+p85O67eWwRodQoj0
         YDN/Q2EPRfu/7YOjnUxaO1piQCnhMJ4AUrx+U2HlCf1QNvLi5BbFHvTptp1RXjS0gAni
         /uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+DT7nvqiPTR2yfvqMCYTVeWph41GdXUlqbIFxmeNzo0=;
        b=UOkZbfen7VkYWu8/vNv+aOGezq4mVslcFVoSMkDgWDO5k+4YYyP3wtpxuOaDtK3Fg7
         0Ig9TX2e2cNiDwVMJOqPs5mbdRSxt7aEqTC/M+naPYALLm/ZONKsAWR4MwZbsXthBcyr
         IsONA3pGTux7n9wcNGy1P6TV+D5WEIH6DR3tGauDpVf4+mpI+xSRCAjgit6FBsQ+VFco
         FILsDmGQHPU4CbryMyTlcCw+FP0xIjBc6L+2T6679wtNo/1BxyNKezRgy0IOGx1CmLoA
         mYIz+ZgZ6iwgvRtR4pSyBY1BSE9NCQRDBnJ9T1Wqg44cst2njy4vClxpt3JkC0nKbxCE
         1ueA==
X-Gm-Message-State: AOAM533jPt699iSnLLTWi0G41ePomCHTWICuxxaEGU1EIveJKTwlDo0y
	+cHdcM1Rp60Qu2LuN4n3hEYLLXkEO78=
X-Google-Smtp-Source: ABdhPJwl6ZDf3t13YwL1oNCrokFS+oMsBkBhNlvKfxhOB8bs5qw8V3IIoB/rlVrWh6OjBQKcB5lrNQ==
X-Received: by 2002:a50:9f6b:: with SMTP id b98mr846285edf.318.1620939405425;
        Thu, 13 May 2021 13:56:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm2934768edd.91.2021.05.13.13.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:56:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 7/8] gstreamer1.0-plugins-base: backport a patch to fix meson 0.58 builds
Date: Thu, 13 May 2021 22:56:21 +0200
Message-Id: <20210513205622.60879-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513205622.60879-1-alex.kanavin@gmail.com>
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
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

