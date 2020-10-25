Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.27406.1603635848378848049
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VV8DO78c;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id h5so9581121wrv.7
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gVTtXOAHlOtlcbM1aFZPHRAGd7FQsKSX4sy9WibPjjE=;
        b=VV8DO78c6LZXk8tvMrceDesVEahjtpe8XIi498E3Nd9cXGUaQnyr9nTvkCvCE6x0+/
         m+fRPQkT6fac0fHV4VRaP/m4THlF3tgZXfQOWEMm6CAYMWfHlszJWRdjskc18Tp3GCkV
         dt7Wv0GDvJcrax2zTSZHBeb+ZrvEdOR0g4bSBJjlkf5WrTgc9SVic80OR2P4PdlvSq/g
         Y6VU2g3LL7Ik9JNyIofMduTpXHFL+m5GmO67RyByGrxSegMeTlcNU+uXcRrQdjlu8hHR
         B79sxnzATwf3LeIG401R4uqBnVAukSyhfBuLuJIv6VRGjYkEmWSi5bhIbNPQvQGrZ7Zk
         2Qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVTtXOAHlOtlcbM1aFZPHRAGd7FQsKSX4sy9WibPjjE=;
        b=rqeNmVQPfGpvAF9kUrDXbg0LfigHoM+5k1B9CBqIFSTh9LLG4J+MMda1wIcQPIhzus
         SHfUeouMgjLeP+0vsehvkuKE2hPsP4ydc/S/tzDDpmphzrlwnaYHguAOBsbyNUMVB3ML
         4kT6vctaFD62KXnbriXXPwsxsqfqb7GjLC34B9CjLGnv+U0vAwWInfgj9wl2frntHK9L
         myGWiveY8KN4VM2soDdGRzF+z0FsJwUfiSzDnQgrA0Ngho8VAVLzCfz5nzRwcj+uijUZ
         TfGUA1XC9am4G9sX2Bj1+CAYSyVxZP3O1wSuNS8XQI/XTJrmj+UyXGOKud6lEOaOEMIh
         eq0A==
X-Gm-Message-State: AOAM531VJsxtm0TzMLpAmXAqPUK/xWnz5B+x8hpxd2Npp1Kzmj71s/6m
	ZcrhUMniTLHDV253i1Ovb5qxjiHaQHeiHg==
X-Google-Smtp-Source: ABdhPJzktYfr9to9AKrDJkYRRvA3OimftbbpdOKywwM3yklshubvi419yApOvy6HYhnNXgYlFGRTAQ==
X-Received: by 2002:adf:a501:: with SMTP id i1mr12713343wrb.162.1603635846698;
        Sun, 25 Oct 2020 07:24:06 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:24:06 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 11/12] gstreamer1.0-python: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:52 +0000
Message-Id: <20201025142353.1929717-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.29.0

