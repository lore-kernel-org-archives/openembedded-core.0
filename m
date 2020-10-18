Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.18814.1603023033707414945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r06TU9Xc;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id j136so9983826wmj.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cG2C/fzctjdseIaJFQcNb3D/RaD/qI9O6DtiAUmcgEQ=;
        b=r06TU9XcbypW/CG0nmFiY/6Zo2lF7D57A1Q+uGwS4JNHO+FNojCAzX1U4v3uqrsUom
         xCJXJi/lyIf2f8l7t2uKKXiv3DB0pGh/Q1Chrsbl2izVrjQcIRoaBTc6yfH4aHVU2VUT
         d+nklIXqp8AcfD4o+eIIvH0yYaNDkVMoKzQtaDa2bW7yCrfWT0J+6oE0aypwffG7qOdZ
         9M8xNF+Z500KQP+xwM19HSmAFv7AbyQw39l7nYUjvpsU5SfR+e/uKcJkBKx9PQWq6Nmx
         j4sK5M9xtOmRJKkBPpK6c8xspP0hGKeHCftVu8qkFkar3ZD9jUV4UnFVkVSFmnUx+ivz
         2+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cG2C/fzctjdseIaJFQcNb3D/RaD/qI9O6DtiAUmcgEQ=;
        b=OI+jt9hZJkx/IqhCE2hamiUKqgEzAJ+R7SbxgwuP/9LOokSN39zzAZyA+ag2of/Wbt
         Am59o8/wq0SoUCCiROADuWsjc+F+pGvcxOGKThg6N7QHbr/0acKx+D48Pck6AAj0Y7Gt
         TAjJGLa5JEQl53Mp0AEobKdvuiATXOQugnEzU3x83HttXwFj6bhx02MeUW+c0sVaOySd
         YD0seutX5qmHOYsp7XG8uNV/gkG/R341rR+79mNunGoYIBIc03YT15takDvQ01PFZZ0R
         +Y2Usvf17reC2lOp/9XJnxrE909WiZBijdg0JcbgWhvBF6Hh9ggVz4pNI+yhNr7vSYpA
         Qchw==
X-Gm-Message-State: AOAM530vO8j6Fc9VBlmJo1zXwUXRCEXCpldhotuKgzOUfm9nj7cVLY4B
	Iti7oLauUG9L/N/ELLvnPFiZ8WEOHO27hg==
X-Google-Smtp-Source: ABdhPJzMXu6zmEI5VxCAbKQeu3rdw/lwozoHz2vJ4tc0nQEcb+2c5euVKclHbrXYeqYv52TRIaociQ==
X-Received: by 2002:a1c:b7c6:: with SMTP id h189mr13515198wmf.154.1603023031232;
        Sun, 18 Oct 2020 05:10:31 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:30 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 12/20] gstreamer1.0-python: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:54 +0100
Message-Id: <20201018121002.1417335-13-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-meson.build-fix-builds-with-python-3.8.patch
      Removed since these are included in 1.18.0

DEPENDS:
RDEPENDS:
 - Upstream now depends gstreamer1.0-plugins-base

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 -------------------
 ....16.2.bb => gstreamer1.0-python_1.18.0.bb} | 14 +++++------
 2 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.18.0.bb} (72%)

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
index 9e024eb9f3..f13f9c5a44 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
@@ -5,14 +5,12 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson.build-fix-builds-with-python-3.8.patch \
-           "
-SRC_URI[md5sum] = "6ac709767334d8d0a71cb4e016f6abeb"
-SRC_URI[sha256sum] = "208df3148d73d9f416d016564737585d8ea763d91201732d44b5fe688c6288a8"
-
-DEPENDS = "gstreamer1.0 python3-pygobject"
-RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2d55c22fcd57cae4fad55a07019aa334"
+SRC_URI[sha256sum] = "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b175213218516dd45"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
+RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 
 PNREAL = "gst-python"
 
-- 
2.28.0

