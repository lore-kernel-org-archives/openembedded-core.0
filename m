Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.39506.1602506207802229851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tyPzHc3Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id j136so17383765wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6KSCsbNwlkFJVREc+cKiWL+CEEADvHjPr8OzuBD2Oc=;
        b=tyPzHc3QNQegrxqdcZDg8kx402jFuNlZCuUWsZGHOVJPcsvCbu8hR6Q6utqz3smoGh
         /oCLvoBwaHih1Gkuj5xZPJhItLf/2jn4Sby5F2LR67d3JkGOY/3sPbt3SdgcpCyqrgZw
         /KPVqBzGYT9+kGmi/XVwGWTJOs6ak0bVaF8VSSSH7PHYEt9LZ5U8FflBT7YE/9jPiDih
         spvB8tpvohbXy+YJq5K/XbY4gUfxrEeP73XLbOizaQjumxXrV5HpapRPvM6GYmz6Qlxw
         2145q3Vj0tlkurGo3K1VbDulFp+B3YNTWkvsnBcYzADF2+0R5SlqBzd2rGFByQDLvwsT
         i76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6KSCsbNwlkFJVREc+cKiWL+CEEADvHjPr8OzuBD2Oc=;
        b=nD3PAP2ovh+S75OEy0YG+dSggo6fTtTpb8XumBVBCP5j7Sr6jI1fNW04SM24pXs04h
         aGNa7TMcS0yEITDt2KOUBlUkKnlyVpkQn3PnBO12FmzpWjOSnLtFRHP8OH9HW6WihLcH
         UKECX18+M+/ZKfCjEQ387CEFnsv7MXBrzbZ0ILlHKgYEz9PnBkCbgl7cdhJn+5ttUX1X
         6WkR16PFYPHg29WXic1XLNY67OMV+ogMyCC+s3STTyzSygfvxZkO/FFsrckWGVYOUw12
         KX0BLCt2cW16/YYMDIUGR5+bLaEXTJ1kRB+CBn+MKKx3LhVxL1VWtd29WPKYE5K/u9AQ
         SxQQ==
X-Gm-Message-State: AOAM530BFq9/kkhfgzvjSJqSUP+RJmdYK22NQX/YE6EOM2zcnFZ6gAFL
	OKbRMSkeGtchmu34WswQ+j06YloPtTF9dg==
X-Google-Smtp-Source: ABdhPJxOXER6Bm/k4ezc5S7uDAtlIVVMJQhx3PnpKP5B0ACmXmskM7Z4lxTC8laC8NAbkeAJpg6i5A==
X-Received: by 2002:a1c:bbc6:: with SMTP id l189mr11282987wmf.52.1602506206062;
        Mon, 12 Oct 2020 05:36:46 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:45 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 07/13] gstreamer1.0-python: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:14 +0100
Message-Id: <20201012123620.2095778-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
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

