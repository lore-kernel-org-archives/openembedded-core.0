Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.994.1603478645565704610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d190gmJU;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id w23so1616512wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHBTq+oGkCN/Wh/8zqF9XkhGKjcZo3dU7pBfwompPqA=;
        b=d190gmJUK+6wccYXyrl5awPiHP3LgwlDQCS9JQ0JWlvDZllwaor4SW1qNVblz3DW6R
         cohRqxgyLO6hNpYiWeIMzGtiTrV7WBB8wGns1rYpfLZMSFf5l/ViUF6QBdHU5yji28QX
         qSkUc52RZaUoSxzvIOCl+qdyUgwhVwo3c4PsoNFwGwFILBbwYwTND10jy9pfBNQV5K4/
         dIYVhGyFRxY8myfCe+ZA9tgLA17e4MJ+VoRfhyL2xBqVAT2vgYN1Eid7R916M3swAsq8
         CyLgYjeAmgvRKiWP464WyDEH36HPvtEmZeKnt82SY75Taz4UPgyiF3V7JzbEp6YFSSuN
         1Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHBTq+oGkCN/Wh/8zqF9XkhGKjcZo3dU7pBfwompPqA=;
        b=VWhPOxmeVuDqWUkv9jxNiy80x9Mmt/5wxhv94T27P3szm3Y+Mt6FFEiRAoyKNP4khf
         Vrv06rrRmRAeXrYuAtmGs0VqLTV50HFhCsU/hXefYaq3Mt9PXvHwWCcXBV9WpivwMtSs
         D3if/MfGf3u/Tad3D6DykqWVzzGCRrwYJ5bHnFNBcqecXEksopKkbGKu2yJKX8+q9Sze
         rNsuQuOIxoPWltKESXykmnt6QP3tKDgSed5T0oK6wwbuVJbsMcJpk6jj2ms7YrpAeb3W
         UbTDypldGlVMZRKS1H2wRYe+pFk4gOXbUFD2ZhGhqCHiVLk83L7xOXRD6Tr349p6p+RJ
         EhnQ==
X-Gm-Message-State: AOAM533fr12zfE/L0RalkV5G0wEiroXxHUacxbOMckKinswXK4e38VAY
	5wDYudx+NLbl5rO9Td00eG92m0Bg1Txpjw==
X-Google-Smtp-Source: ABdhPJzNiTAuuUbnOBGTqrN+cmw/7CXsTwp3d1gW/0S1UN1jcX/oERNYfl893dBN/XgJACHH7SO7ng==
X-Received: by 2002:a05:600c:2905:: with SMTP id i5mr550973wmd.161.1603478643835;
        Fri, 23 Oct 2020 11:44:03 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:44:02 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 18/21] gstreamer1.0-libav: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:29 +0100
Message-Id: <20201023184132.3208737-19-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: All code is now LGPL-2.1+

Starting with 1.17, we will not ship a copy of FFmpeg in our release
tarballs, and all the remaining code is LGPL2.
https://gitlab.freedesktop.org/gstreamer/gst-libav/-/commit/c437e175ad9c82732ac46e36ccc398ad041bf13b

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-libav_1.16.2.bb    | 35 -------------------
 .../gstreamer/gstreamer1.0-libav_1.18.0.bb    | 21 +++++++++++
 2 files changed, 21 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
deleted file mode 100644
index 2fdefc925e..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Libav-based GStreamer 1.x plugin"
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-SECTION = "multimedia"
-
-LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
-LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c"
-
-SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           "
-SRC_URI[md5sum] = "eacebd0136ede3a9bd3672eeb338806b"
-SRC_URI[sha256sum] = "c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2"
-
-S = "${WORKDIR}/gst-libav-${PV}"
-
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
-
-inherit meson pkgconfig upstream-version-is-even
-
-FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-
-delete_unused_libav_copy() {
-        # When building with meson, the internal libav copy is not used.
-        # It is only present for legacy autotools based builds. In future
-        # GStreamer versions, the autotools scripts will be gone, and so
-        # will this internal copy. Until then, it will be present. In order
-        # to make sure this copy is not included in the -src package, just
-        # manually delete the copy.
-        rm -rf "${S}/gst-libs/ext/libav/"
-}
-
-do_unpack[postfuncs] += " delete_unused_libav_copy"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
new file mode 100644
index 0000000000..a50f65e981
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Libav-based GStreamer 1.x plugin"
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
+SECTION = "multimedia"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
+                    "
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
+SRC_URI[md5sum] = "fe2f07356fa37445837cdde274027117"
+SRC_URI[sha256sum] = "42f93f5ce9a3fc22051e5f783a4574b56ebf213f331f75dcbc3552459bd3a06a"
+
+S = "${WORKDIR}/gst-libav-${PV}"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
+
+inherit meson pkgconfig upstream-version-is-even
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
-- 
2.29.0

