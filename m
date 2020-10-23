Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.984.1603478638376719208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WaiCkbmu;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id n15so3253685wrq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BSprujKUNR/6B+2KJSo1704TwIi0rWwGFt8/wMJOC9o=;
        b=WaiCkbmuzJ6TeJ/z6Lo5gtiElNNOFEfKe5eHFEdw4kiGPAo11Rzm2hcZJECPaAtEGM
         9oy7ZfHSnF4nXHDPYp699cmBUFwQwCNxOgwbr0OKNeTCm2ohE7IfvkF4cvWrFRXD+RMP
         539GC1Dq5/3BhMbwr3tJbVH7A3j4/bbngS9MNC+t9ihBe7R4AUyiJ6yKs3x1EnDBSR2f
         hCI0TojzpIYceLg1lV6XRBc5hDH2BTxLCtpjSlQQERmLwF/9r4eOuruR1Fk1LbnY/mK8
         NrzJf6kl8Uvm6SHQnJa++XcGdXcOo6kP8OF/uwERWR2pZCeJXCpVnRaYR2pbtNvaWkah
         S40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BSprujKUNR/6B+2KJSo1704TwIi0rWwGFt8/wMJOC9o=;
        b=qYfUZKPomf61xvOG7wPvwAzlHXj/kWvmR3VydZKFaUwCjrEnR0UFz1I8NKl5PUR8rI
         5DnfvobCi959GFvidiSxMaPeO3ZL695YYn9jSdRq5BJfe+SZbiqL+I1poCiSmcYGPz12
         zpuT7ZJLHMI0KE01jJwVKO0mqIkjUZFTvmA+YxXheE/KhkxX+7IjNu/VFPuu15qQRCpD
         UXmo4LWAmib0jckjYzWwDP12uJOnGjlRTAcZ+LgTixcdu+6eMkmNiODZ9E8tlNK/M8FS
         5ROsFqGgKvs8ieyuSaH33cjLPFVQweb2jAvQ3H7UQ9CQvOroZcKR8QJdwuFFbZFLrMrn
         Vbsw==
X-Gm-Message-State: AOAM533v4yUWlTbHQYXMdxdWkQtmjKbimZJMH8jzwnd5cdQ/FUM1TLY6
	Hrg69D9M3PWlKQ+TQHlQfPBGwWzXcX5rmA==
X-Google-Smtp-Source: ABdhPJwkqkKYChKiYlXCyKh3E69EceAoiiJdEX10SSiUKAQvk0PjL1YPMEZuQP3QdBoE8N/tEZJ2KQ==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr4020881wrw.151.1603478636654;
        Fri, 23 Oct 2020 11:43:56 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:56 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 14/21] gstreamer1.0-rtsp-server: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:25 +0100
Message-Id: <20201023184132.3208737-15-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
      Removed since these are included in 1.18.0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...even-when-cross-compiling-if-introsp.patch | 36 -------------------
 ....bb => gstreamer1.0-rtsp-server_1.18.0.bb} |  9 +++--
 2 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.18.0.bb} (74%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 6962a50d6e..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Fri, 18 Oct 2019 00:42:12 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream-Status: Backport [95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index e1e3b1d..3f45f0e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -173,7 +173,7 @@ endif
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
similarity index 74%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
index 02c3c83840..0adfa2aac9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.0.bb
@@ -8,18 +8,17 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-           "
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
-SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
+SRC_URI[md5sum] = "77fe28c702a83566811ab5c7bbe99ab2"
+SRC_URI[sha256sum] = "2ad19311054cbf2df0d0622936bc703dedc06ced706df46a3d3a3ea5a4b7c70f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit meson pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dexamples=disabled \
     -Dtests=disabled \
 "
-- 
2.29.0

