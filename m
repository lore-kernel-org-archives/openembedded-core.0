Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.15103.1602947729652510765
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DSlOkOH8;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id d3so8484776wma.4
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6KSCsbNwlkFJVREc+cKiWL+CEEADvHjPr8OzuBD2Oc=;
        b=DSlOkOH8N5qW263aD0zSSRPWjzD4AxW/gzSI+bo8yUZBbgvcuH/1N2loWWcd5TUsNi
         PPL0HUIcHAAuAbpdN9o8Ffzx5KWh46LoXkH5aGREMMO2KA6HY7AYwroTJVuFbHOb+NkC
         eyIyPjp/LV888o7tbhPiQCS7/POMrT7do4zfRtSvdgNC6VjM7UzZTpGAXJlj7aYB7agu
         wuuIrcSJjCDXT75A9Wvge+aVilLpuYNpn+pxwRdUklY8k1+CmhZGBycZGyCMzPKSSOFT
         r0doZ8SlvTlhclMVphkgN3Rrz32sOiezdpUhIzRJt0KUFls2NTnZd8zCtL4z2Cnf3GVl
         qYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6KSCsbNwlkFJVREc+cKiWL+CEEADvHjPr8OzuBD2Oc=;
        b=cIruvgq+3dDUsw81xng7MPNgYJrEcXtC0G/T6/y4ZR4bPBbXiUeTewXEaJZIkLJPyj
         1NHYr33RN71NwrXAd9k9F1EFgPIulotmgwfGjvTrpH6MPgnpAB7a7pTGUty0syEL1Uj+
         /4ZAhSnDdboBMtJxOUhr+7uSAhbZ/Mdgz0JkH/Ct4SnthomTrtGb7hviAbPeItOQ6OQB
         SoH8fZu1UYvSVRt13D4jWKGoPQuu+ZMHUlwTqyh4rPjE740ls9GNGpVHJiUgIAixxYpV
         BwCCVrBaGQh6pVx04XLNEHVBMG1lz9PVPaVQuZ6IFQdSivMisGLRCUcS3xTP2+IJ9Q+G
         HSJw==
X-Gm-Message-State: AOAM533UzqpR+TnQgQUyagA8Ma0cqNuwB665LYhwptDxQ6My1j+VuoGy
	iTF+MPT9w1IZffDTUzCmNu3LLtGVw0AdVA==
X-Google-Smtp-Source: ABdhPJxCYwqn/wJz42RTdy8fP2WoZIAz37TWQsv8BDhxrxlwYrfRlw5L8/3SViy3zGMHDOcoD4k1rA==
X-Received: by 2002:a1c:b6d4:: with SMTP id g203mr8614258wmf.132.1602947727937;
        Sat, 17 Oct 2020 08:15:27 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:27 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 06/13] gstreamer1.0-python: upgrade to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:17 +0100
Message-Id: <20201017151524.31550-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-meson.build-fix-builds-with-python-3.8.patch
      Removed since these are included in 1.18.0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 -------------------
 ....16.2.bb => gstreamer1.0-python_1.18.0.bb} |  8 +++----
 2 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.18.0.bb} (80%)

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
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
index 9e024eb9f3..4400a018d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
@@ -5,11 +5,9 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson.build-fix-builds-with-python-3.8.patch \
-           "
-SRC_URI[md5sum] = "6ac709767334d8d0a71cb4e016f6abeb"
-SRC_URI[sha256sum] = "208df3148d73d9f416d016564737585d8ea763d91201732d44b5fe688c6288a8"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2d55c22fcd57cae4fad55a07019aa334"
+SRC_URI[sha256sum] = "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b175213218516dd45"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.28.0

