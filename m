Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.8588.1604191477792580392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H4ilaWUQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id p9so13703376eji.4
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ku+Rwj08ZzVJM3vq2ZMn6qdiZvLa5Cd6xnE2LyZhXfc=;
        b=H4ilaWUQgJBzg89zoMNOKmTvbjkaHM2fiUSuftBL6GIcJGhcoLFZ2Gj1cuIiIyrosH
         Fdl9HcBMg7bwqjgbbkXH6yUhGmazWxvfWGTylfJmkZW7jvHAm0XzsIOFZdnJunWHol13
         1LX72+dikS5x+2U/f46lwvL1Xz4PbrJ7xFMVHcCDmBRKJa01LW66AcIpsdQuFaVZSsPE
         mbU64RBHu9fHb7B0niifWjgk6JXbOygI0d6CpIHPCZV+WmxJChCrGIzLN/Jj3cqitFeF
         pWHvpY1LJeRJuzlJ9cFJaAeZ1JQiNffklnTRkA3t7p8Y6yX1u5QjCPTe1/7DMZSPciK4
         ZUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ku+Rwj08ZzVJM3vq2ZMn6qdiZvLa5Cd6xnE2LyZhXfc=;
        b=ZgikyLhmyN3rmvhaKyz3CR+DNRkSkOf/n3qEqykRFt3UJeRUNTBnXpIM8hnTrRMMXy
         eDCXMNJIItQP2bJtwhezvHkl4Yvz/CAygVsxQ2IJUbALTB4FNF75/dsC0kEWJRLEIPYg
         65uT6YmzYZVg7mtW9kvCyoNE1+9qx80SboycJF52H9dFBta8cFOs32I6V5Ju7tHkIdGG
         V8LRfXxsPMS8hRwtb0gQvNyeXRT1Gsa7QT42F64tJQ/HBueUhkNqEUYeKRipN9G8Qhyf
         K+ImLrnacIdZGGPiXNMjdACmGopGpIwSP5IarJp3kFAtx0P3rEMhvRrlNOSF6UDUyqDo
         3MNQ==
X-Gm-Message-State: AOAM532+Gaj0HQ6YAQGU5P0MvCmzTTLWYwSg3x/ZAs4l1+DgBhx6M1fq
	wzdZkbO/ep8SIpHv2R6fdb1F5TEacyE=
X-Google-Smtp-Source: ABdhPJwYblz384POUtNsYBRrpsNtLTonCFdXrjRx1np2Ga9vTHO2ZnQ76bOeNpn46/vbiMzEhQp4aw==
X-Received: by 2002:a17:906:30c8:: with SMTP id b8mr9565787ejb.77.1604191476185;
        Sat, 31 Oct 2020 17:44:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y15sm2780187eds.56.2020.10.31.17.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:35 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 11/12] gstreamer1.0-python: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:39 +0100
Message-Id: <20201101004340.4019257-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 -------------------
 ....16.2.bb => gstreamer1.0-python_1.16.3.bb} |  8 +++----
 2 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.16.3.bb} (80%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
deleted file mode 100644
index 053108ad50..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 2 Dec 2019 18:16:41 +0100
-Subject: [PATCH] meson.build: fix builds with python 3.8
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1da81d5..3e0db38 100644
---- a/meson.build
-+++ b/meson.build
-@@ -24,7 +24,7 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
- 
- pymod = import('python')
- python = pymod.find_installation(get_option('python'))
--python_dep = python.dependency(required : true)
-+python_dep = dependency('python3-embed', required : true)
- 
- python_abi_flags = python.get_variable('ABIFLAGS', '')
- pylib_loc = get_option('libpython-dir')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
index 9e024eb9f3..14b34a2808 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.3.bb
@@ -5,11 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson.build-fix-builds-with-python-3.8.patch \
-           "
-SRC_URI[md5sum] = "6ac709767334d8d0a71cb4e016f6abeb"
-SRC_URI[sha256sum] = "208df3148d73d9f416d016564737585d8ea763d91201732d44b5fe688c6288a8"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI[md5sum] = "326f4f4c23e2477bf3d5839c465a42ca"
+SRC_URI[sha256sum] = "36a00a256c25ccaaa9b965a6f09d6158dfb77558145ab6b25809938732c7161f"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.27.0

