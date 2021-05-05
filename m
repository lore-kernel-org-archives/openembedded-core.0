Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.9794.1620227964826530696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g4FpFwzX;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id u21so3416025ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uC9FZ2qivgMIa6zpCheNFujMl5nGD5ua99SVzY6/Wb0=;
        b=g4FpFwzXkiVBsh0gccbuE9NyClxMGXwE7EVpamFnwV8zoWxrdRBYgUfBnCkP/D/vgR
         /5GGPGnZzS9I83e+Bjsut4ovYbowWhhyHUQr9uLuwZr+fQpdlLe4mMWehbYvrCGLLwLd
         1wv7kTk2RhSGot+WLxYMfKVp5dXJme+1w8HCLV0BDaT1tlTd4kX4b3Es3zVlZnjN4pZ1
         I6/v/inGSbMZUPHv/AVgJ6bkY0DbB/Du6oofKGh2sTpV96FY9TVFatilT51CbcC9RcbV
         Q8vf2DFSqNEbsGEApKMefDmLvzZUGlS+zijd/ke6IF84ENh2CeRlFZcFlKkQ4pljxD7O
         noxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uC9FZ2qivgMIa6zpCheNFujMl5nGD5ua99SVzY6/Wb0=;
        b=fUIZxCwV86UzNXO8IZAXex/wZeSWDsCLuyp7jaJ1mLw8Dwk04dDzbkraWS4qkK0PgD
         fa8qZ8nnRXBznocms3Nv8rg0PFzJ0MkghfysMccD9AUXVFpZrrw6LguYYFfFATjA+zhG
         Pe/EZT1dpujJP+65YniVsnlORXH58v+Xe17AK2ZDCPGVPalUuAZMmniPDRTtZp3CFkNu
         GlI2aX7iHQkx70iJ+LBQCMP9ozxeqnih1S86IRYP2YdUTty8YyEVTt6gqHlESHmfhF6e
         dVWr415hZC6DqgXt4c/QgBGPmnKYs5EQqqip6JcOL9q6EjeqoSZxjufKJ7MaKQsMAgjd
         WU8Q==
X-Gm-Message-State: AOAM5305KrKWCWoA+FpXJ0peHf914JLHTHMQqts+jzyYDBnx5YnSKz0b
	fQGYddEkBrLStPuIp9iC+g1Iz+KJOEqFhQ==
X-Google-Smtp-Source: ABdhPJzEw6sOEZTWFFpw88eef9VlH4BJTFj7r5hrQvkM6YM1FZ5I/fXJrZYDUwpb9xeI2TXVerclqw==
X-Received: by 2002:a17:906:22cf:: with SMTP id q15mr28841800eja.474.1620227963458;
        Wed, 05 May 2021 08:19:23 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/61] gobject-introspection: upgrade 1.66.1 -> 1.68.0
Date: Wed,  5 May 2021 17:18:23 +0200
Message-Id: <20210505151850.660512-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...pository-directory-for-native-builds.patch |  2 +-
 ...ude-girepo_dep-if-introspection-data.patch | 25 -------------------
 ...6.1.bb => gobject-introspection_1.68.0.bb} |  3 +--
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.66.1.bb => gobject-introspection_1.68.0.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 185ebc154a..9071245a84 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 41c3ee549787333a073a3ce6303efef625c74dce Mon Sep 17 00:00:00 2001
+From 5c606356523431769dffb02fffd2fbca8fb20232 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
deleted file mode 100644
index 8fba0124cf..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ef5446af0ddad6a341b47957097ac40c6cb5e6d3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 20 Oct 2020 22:40:14 +0200
-Subject: [PATCH] meson.build: exclude girepo_dep if introspection data is
- disabled
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/248]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 14af2b1..a3c27c3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -283,7 +283,7 @@ pkg.generate(
- # FIXME: meson.override_dependency() and declare_dependency()'s variable arguments
- # are new in Meson 0.54.0, older versions of Meson won't be able to use g-i as
- # subproject anyway
--if meson.version().version_compare('>=0.54.0')
-+if meson.version().version_compare('>=0.54.0') and get_option('build_introspection_data') == true
-   girepo_dep = declare_dependency(
-     sources: typelibs,
-     dependencies: girepo_dep,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
index ebac8d3a43..4c986a574f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
@@ -15,10 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
-           file://0001-meson.build-exclude-girepo_dep-if-introspection-data.patch \
            "
 
-SRC_URI[sha256sum] = "dd44a55ee5f426ea22b6b89624708f9e8d53f5cc94e5485c15c87cb30e06161d"
+SRC_URI[sha256sum] = "d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.31.1

