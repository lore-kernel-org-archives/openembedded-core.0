Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.9546.1603981714066890428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePPQY/tk;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id p22so52394wmg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Ay3fbopZG+pEBElVjMAHfuu+p9LQarnrMPXnMBSeyw=;
        b=ePPQY/tkDXaTzqhskFwVty/ppHohzr6zjVrhrHIV+2M8zlaVo39aFo4E+PYRlfUqXi
         DnNoT30ukxREEL76gbb4+FYY515MHe2jN1pyQp//sgk3vrT+gc/ADqXULIaJ/I9WbFov
         aHyRdOzf/VUB+aOFhF4qyT1KPv6dXc1TIT6jLs5QgA1Q83GyAe2PSsIn4R4BF0qEnA0L
         SBtW0OZzXGrUjBN/PgDpIsvUIlRQAUyhZuIugfD2Q4AR2stWJH0OboSn8h14Z6aKmW8/
         ge4j0ntSwFzMvr2aXWDzLIgZv5WTlo+i065TgUy+67BNefJ1lBp7/hNoH04RBwDSNeYL
         1faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Ay3fbopZG+pEBElVjMAHfuu+p9LQarnrMPXnMBSeyw=;
        b=ipHCJzIhwz5yGUUHYSbfrc8F278xG3ANUMLTKOKNb+ggDU8NQJGBv6wOrJl7X3Sii/
         1saVooQUkoPoo0Qfhk+1creITtJ4cosXqOaKTeXxDmVy5GSd7dInnsizYbRfnfBtgdak
         TkaZ1M7oZQxOj6E0MOtFv65TPhnZHFw8tOj1G/jCiNmBDpF4cXpDU9yQuy2/IJxQSAUm
         vOhA0kpGnh8qvpsi7pwPXD0yDs0TMYtpJy5ob2EEwfQha4GJgHhlFsJLnj+ejH3XSCvo
         CdmbWQIIj1dHHlHT4afTEtsMfT6dIKOqcjeou4Lwi93Sf5U7Cqz83ih7jBhcMR+B/+b9
         xEMA==
X-Gm-Message-State: AOAM533tRnq8icOqphKrI9H7eRORnT/zha1SQD3B3OFN3E9qLAOPqBnT
	NUrjm5/1+w9p55G1+PfgjaYmNwMMjBKCow==
X-Google-Smtp-Source: ABdhPJzNz23Wm4HxWPz12zm8oWo97O1i01Psur3o82FE0WR1ZP7o5BKsXbTcJeRU6VBhJUFniPO2oA==
X-Received: by 2002:a7b:c401:: with SMTP id k1mr105854wmi.120.1603981709321;
        Thu, 29 Oct 2020 07:28:29 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:28 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 18/22] gstreamer1.0-libav: upgrade to version 1.18.0
Date: Thu, 29 Oct 2020 14:28:02 +0000
Message-Id: <20201029142806.1830504-19-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
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
2.29.1

