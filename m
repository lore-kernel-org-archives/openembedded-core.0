Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.1175.1604335779878758984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s8GCyw4M;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id za3so19792010ejb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JPGxORar1VM4fW4KwClSLYK3ofHwdOdO+m4wPJB2tnI=;
        b=s8GCyw4Msd7WZDcccIoJtBccqvm1g4l2GQJClJOy5iQeqNBPX0n9kv+I+fI6GSse7a
         QAFE4XQECMcE7LPG9QdP9eAFCT+YXZfOd2bVWjfApg329ggOVF0pDNwhkGJAZ4nynKHj
         GyWqO40KmEqlZGs7t7GZOzFHJWSrb94+Bi957EMJikSiAwNVmcUSedvNt7NlHZnrapT8
         jgVDSbGbzP3MoFP/UOmSBM3R64mGWkzfRbRdr7iQMcd5TSsT6vEOd4gnCAdKC9nekhZq
         yY2pGK5e9liNTqZ5IgRz+kfYrmoPnL1u9ck+x8Yvaef1HjM67uMbxlLcYLxgdijnSlxn
         wKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JPGxORar1VM4fW4KwClSLYK3ofHwdOdO+m4wPJB2tnI=;
        b=QCVvspd7clvQgBoFYS/moSmmt4e60aKKu7qcHdNNnsfCEzwzjegs5j2RI9FPvfXggI
         KB8OH6H7cCy9H9mP7oadvYm6HteIvUvmtQDJh8QWZqE6LvFgFHj6Z4TsweTkyBQBfXsv
         imgTCdm6PqUDldxH2dyrCJihEpzuBeEllYl37qaidoCivj37ZEJESpACjITbOjiKG9zx
         87vlE7F5BpIyW4+ErkeZ5j3V0iNxmL4jsBuFRtcScKMEKpnSZFS4z0MGWtT+pi9M8Yto
         Hr9q7Uzw0SWmlh4n15+crAra7YdMzE9qo10F8KkipMp8L86yXzrrTjmN4ewZtB1P0ce3
         r7bw==
X-Gm-Message-State: AOAM533HtfpNzsnT87YoLYnca+wywDCny9xjFRmqtmLOXVDAhrXrQf5n
	Rp3szAD2K3AuqVU8QF2e+cigU9M8UPydIA==
X-Google-Smtp-Source: ABdhPJy6L6ba4G1vcN3754JwBlXbcjHfHjRbGDuGRdzAb9Y+MxnNBHB6xcLe1l7ng0L0aa18HfhRZg==
X-Received: by 2002:a17:906:e10e:: with SMTP id gj14mr17077893ejb.134.1604335778064;
        Mon, 02 Nov 2020 08:49:38 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:37 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/80] gcr: upgrade 3.36.0 -> 3.38.0
Date: Mon,  2 Nov 2020 17:48:10 +0100
Message-Id: <20201102164907.27572-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-meson-Make-sure-gcr-oids.h-is-built.patch | 36 ---------------
 ...ectly-set-internal-vapi-dependencies.patch | 45 -------------------
 .../gcr/{gcr_3.36.0.bb => gcr_3.38.0.bb}      |  6 +--
 3 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
 delete mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
 rename meta/recipes-gnome/gcr/{gcr_3.36.0.bb => gcr_3.38.0.bb} (77%)

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch b/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
deleted file mode 100644
index 4bf5bfba94..0000000000
--- a/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9fca6ae0aa7355c27d0922c561b9fbe18dde5b3d Mon Sep 17 00:00:00 2001
-From: Niels De Graef <nielsdegraef@gmail.com>
-Date: Fri, 19 Jun 2020 22:37:31 +0200
-Subject: [PATCH 1/1] meson: Make sure gcr-oids.h is built
-
-Fixes https://gitlab.gnome.org/GNOME/gcr/-/issues/48
----
- gcr/meson.build | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
---- end of original header ---
-
-Upstream-Status: Backport  [https://github.com/GNOME/gcr.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 199452f..06c3a63 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -178,7 +178,10 @@ endif
- gcr_base_dep = declare_dependency(
-   link_with: gcr_base_lib,
-   include_directories: include_directories('..'),
--  sources: gcr_enums_gen[1], # Make sure gcr-enum-types-base.h can be included
-+  sources: [
-+    gcr_enums_gen[1],
-+    gcr_oids[1],
-+  ],
- )
- 
- if get_option('introspection')
--- 
-2.7.4
-
diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
deleted file mode 100644
index b484a1b222..0000000000
--- a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ebb77dad4563b882b449cbc5e882f36ac8c2de71 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 11 May 2020 22:19:16 +0000
-Subject: [PATCH] meson.build: correctly set internal vapi dependencies
-
-If they are set as strings, meson will supply the right
-arguments to vapigen, but will not set the ninja dependencies
-to ensure they get built first, and so races will occur:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1881/steps/8/logs/step1b
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/55]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gcr/meson.build | 2 +-
- ui/meson.build  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 254a933..199452f 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -203,7 +203,7 @@ if get_option('introspection')
- 
-   gcr_vapi = gnome.generate_vapi('gcr-@0@'.format(gcr_major_version),
-     sources: gcr_gir[0],
--    packages: [ 'glib-2.0', 'gio-2.0', 'gck-@0@'.format(gck_major_version) ],
-+    packages: [ 'glib-2.0', 'gio-2.0', gck_vapi ],
-     metadata_dirs: meson.current_source_dir(),
-     vapi_dirs: [
-       build_root / 'gck',
-diff --git a/ui/meson.build b/ui/meson.build
-index 5ca3753..477412d 100644
---- a/ui/meson.build
-+++ b/ui/meson.build
-@@ -174,8 +174,8 @@ if get_option('introspection')
-     packages: [
-       'glib-2.0',
-       'gio-2.0',
--      'gck-@0@'.format(gck_major_version),
--      'gcr-@0@'.format(gcr_major_version),
-+      gck_vapi,
-+      gcr_vapi,
-       'gtk+-3.0'
-     ],
-     metadata_dirs: meson.current_source_dir(),
diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/gcr/gcr_3.38.0.bb
similarity index 77%
rename from meta/recipes-gnome/gcr/gcr_3.36.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.38.0.bb
index ff455a68ec..49e8f1848b 100644
--- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.38.0.bb
@@ -17,11 +17,7 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " file://0001-meson.build-correctly-set-internal-vapi-dependencies.patch"
-SRC_URI += " file://0001-meson-Make-sure-gcr-oids.h-is-built.patch"
-
-SRC_URI[archive.md5sum] = "adc65563b6b458507b9a578a8b68fb61"
-SRC_URI[archive.sha256sum] = "aaf9bed017a2263c6145c89a1a84178f9f40f238426463e4ae486694ef5f6601"
+SRC_URI[archive.sha256sum] = "a64cc7b65757fc2cd16de1708d132a16d05cd1f62c6eba436d56fe45d4ba27e1"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.29.0

