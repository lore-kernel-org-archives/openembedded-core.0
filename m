Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.981.1603478635602194414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ljaSwjag;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id d78so2702716wmd.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oizMbFGCReuB1gE+9S3MqhABrxLpFC/bvpOX1m/+IBs=;
        b=ljaSwjagWAyu8kZWVisx9JoOcH3Ma6cheQY6WC+pryXh1ThScBfKPnWENrjpnpeEsw
         66GWG2Lmeo/HbZDBTg5QoPReubd4SSc8qSMoTkcyhRkvQZ5Po3Vx/U5cduacn3/mqSPo
         PU7QK3Ax8bc3triPP2PF7dPI5jDNTwMrg/YppNA6ztnX5XjJQALELkfEqu4ImVK1eIhQ
         wYXmGw+DKNOQN/IxkSeUVHRMqOu5+PqoM9i6AqigfW0W+SOAD/bnrLKOnr03DTfkYItx
         v1wgOjRq7t6dWB0pP+778HN20gJQm0N3N7xdE/l77NtAkQ9DBI4OVj1Qx6da3G43/t+G
         oaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oizMbFGCReuB1gE+9S3MqhABrxLpFC/bvpOX1m/+IBs=;
        b=W50rdlpx2bPTYceKGwoZEVO0ch0jM8lYbGebya/yCyqACltr4b4JRQPoPNTxwJm1Jh
         HN9i3vYYXR81qccq1XGXuLgDVWmifOZtf1DGNLbmh9wQWV+EnwzBZnR0m0fQKb0GmCNV
         SaBF3RQmeYlQvjhHtHgtEyREAkUsmcKI8yLp7d6nrcXmoBnssgarDqiYcgZ6oKHOh34m
         gk2Bq2lj1c7YcMoWthWdztuWDdp35ilq4AONAFsP1a8Q5H4ly4syeV65ypwWMPAzRLSk
         WDjRH1hqDoSZUFh6+gcUkyHQsI3RKX1N//f41AvNczNw36eALaPJRiaxM8MRKk5z70hk
         yoaQ==
X-Gm-Message-State: AOAM533Vpq5oJO8g0oflpNJtyJpBkonGjSQv5r1ulL6vfpQkRhownUq9
	nT5GPnQPZL3jJCkk3hqkJdxiV0GQU1XGVA==
X-Google-Smtp-Source: ABdhPJweVlRhsaz04eubiA/NRD727bXAPoJtKfXD5jpawfdW+hh9RAO49Gy0nmYLRNASEeUk0cqFoA==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr3657284wmb.32.1603478633927;
        Fri, 23 Oct 2020 11:43:53 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:53 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 12/21] gstreamer1.0-python: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:23 +0100
Message-Id: <20201023184132.3208737-13-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
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
2.29.0

