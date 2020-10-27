Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.97.1603837804961490050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Dggfqpfj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id lt2so1478836pjb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DsbijsOPpyfOogOLWoeXWtesFbNYEwz/LnF/0sBBE2U=;
        b=DggfqpfjVQ20JkUrf4EPFq/XhXFIwqBO+lUt87RmAIpUWKgfMRm7USinAz5dLH9qW2
         we3XapATybfvK9oHfcvf55hbP+Y2fUzHbz3rfC7Fqs5+GqpvFTCXpG/iuiVYRk5Vjk0k
         xJ1121kk8HsjwOnRay4BWbcoogRjMxPFa3JCyAvhd1TtiI5L9YKziSJQ7IAZmjd+V0cg
         BJSbB319VkHyuaX3sgdh3yNUqc3osdmlOSbwmxZ+PwnDWD8AgzosgMYcdqXc2ZURmPaR
         ItrimIrCiSbQGWJISNXa6DsMo2AKLJE0TlAHBCuoapP8vqqamJUn+g2Z8q7pijf1vWMb
         3i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DsbijsOPpyfOogOLWoeXWtesFbNYEwz/LnF/0sBBE2U=;
        b=VQmJ305OQnFfpIg1w+LH6+m8olmAEJfq4lzHKpS1+aN9SMvoiElXboYUogRHvYY/cu
         1VgME0LWfqcJKsXASf2xRIXBV5yBj1GhWfSHmRkVuAIwEexxcW6MnNS4JF9Z4sm9fLLM
         hPUnzjhG6sY5B7ABD/LpKk6uLT8ykbP6NVxGAr3eSE2jgZ4WeiL5Jq98SM2MqXtCMskk
         wa2tsXlCR0JpXZ9yU1/ggl4QEUrhnldrfPBM3+qQA7rRZEJMtj/ssWRJjiomLcCb3IqA
         teqFCvnr0OFcRrJftBBDnhC7jEOX7CHMpCEH0JXchGL4xe2KcbqIqNiZH5gpQ/M8Oz2S
         qi2A==
X-Gm-Message-State: AOAM531T4VFtxy86hnwUUPHs4PYLUvweChGPZ3LZJBS3kYjVOuUDG2FL
	56RA0rdxwZog/1oQ1hcUQ5FjpyeJjjpgMTHw
X-Google-Smtp-Source: ABdhPJzcMVt5Vmrhf5oitTsAke905xcAbYQiWtlnmnGzfjiBVi20d4IguGFxDLXJEkxeAPl/Q9emiA==
X-Received: by 2002:a17:90a:5b15:: with SMTP id o21mr298264pji.45.1603837804072;
        Tue, 27 Oct 2020 15:30:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.30.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:30:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/16] gstreamer1.0-python: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:18 -1000
Message-Id: <5e93456e8e03d457173d7b07ba030b86d50b7335.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

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
2.17.1

