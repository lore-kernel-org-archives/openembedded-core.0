Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9542.1603981703515693383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j5LBBwFG;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id n18so2999157wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MbQ1dTpFKhMLY/xFBzFHibe7qzf8AgwV6TcHq9EL1/w=;
        b=j5LBBwFG655sIT4p/0nwqVQMg1k7rM0Ke3w7DGWcukU4oXz4vnyPUirbSBMrC0xxnE
         ROnktLN4IK/Dnc4P8noWiwDh5esE0ydaDhsxGnZ3724by2V8AfaewJ3NcfhIOz4VTtrH
         RuMXAPCja8vWR5x6GEn8U1YET6pQvqmSpIGbT/Dj91+tp7zCRqxRTIn9XH3VAJbLtSfW
         eXtKVUqYF8afaOsK+3WMF10Iqs+igP/bheHmJ1ReJysax8I+8Yfk3e+VrCTh4/8T73CY
         eh0S0u4h3b04eo6QS0vFSn8ZEP7U9VVZMHtO7jDUwMe73HtToQ68ns5wXxco8/1YwYHw
         QsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbQ1dTpFKhMLY/xFBzFHibe7qzf8AgwV6TcHq9EL1/w=;
        b=EjUMYU1NH0+plU7gm/JJY6gnAAXzxxDHIjjKM2/EOEnzwIFF3ahV6LgAqBv6U191Yq
         +OKPph/EuBMFDbHE3Wk91Pd/hWsoB0MypVVQuUf4BQf2O9SKteJseISyDl9+8uXpTVoK
         hjLPJE+3LvddG+ETS0A9YN7sKkEbLmyuduXi2uTfAN9/WU6ci+i07RElwCZT3R6xtYdQ
         +KqtDii3BWyqEbQY7wzT/DtJnrA/mYW6NVOlv67YASp0cJozcN19E0pdyYRDCr8lYpfZ
         Zty6bbpULyF+zOF6oyQ2/J6D8keUUk0O2ykM6Kyi79v9n0qygArwElJeXmrN8LaKHxNC
         TqnA==
X-Gm-Message-State: AOAM531m1/bYbomuw9YsZwySK5yX/MtdKMHAPDdouZFcV4Pn9KJrQzjE
	5BiKDw040ww21SpCcUm3o4LraOoJrwdC4g==
X-Google-Smtp-Source: ABdhPJzYsPrhfZQoKLFeIBy8jiPpWgIJ/6LbrX0D4DBDxwI8VLLTsAti8h4vIG92KMRq+1ypwt7kTA==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr6014369wrw.151.1603981701851;
        Thu, 29 Oct 2020 07:28:21 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:21 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 12/22] gstreamer1.0-python: upgrade to version 1.18.0
Date: Thu, 29 Oct 2020 14:27:56 +0000
Message-Id: <20201029142806.1830504-13-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
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
2.29.1

