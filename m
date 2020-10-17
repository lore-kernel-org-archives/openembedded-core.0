Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.15096.1602947735925314903
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TEF5pM8k;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id g12so6677830wrp.10
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HC/uw1F3AAcrxaugH115Mv9rT07mQP7vPr/J+a+JJ3U=;
        b=TEF5pM8kLuIJHy0FRTadOr7nPOjnOHrOkmVGm8LuUa1O2uoPLN4pkjv16QiVWxgBcP
         cLa9Aur3NhUyAhWSbVH3Ky0T6io45klmkurEGb6HaSSLgnlJz2K9yiEBlLBrXMmrUx37
         X4erqLXfkvQH0QAoiL9bP8vRtnJIRCotahydhi6jFBRwqv1tLJVwUpXjmWqirB677G+Z
         /Qpiq1T1hdweYnZhwU9h6jsatW+fWDp/+hj8i3Ngqiml2oTqmPfuMQ1G4yYNBPmmL1F0
         kSZQJxBkr/b051hEEZHZJ15/FoJWZeH/Rj//64qE/f32kIKSrRAyv8XXzF2m3j8cBi6E
         hO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HC/uw1F3AAcrxaugH115Mv9rT07mQP7vPr/J+a+JJ3U=;
        b=JnUCYYKCuDANUYfEZyrdEAp5MFkM8Fc9s57GkXqnYHByURjit4RFU/AboZxERKTRKt
         kAkS1UUc8FQYvaNlzjN18teUxaHjgPvZYhzRBwTbUzWPAdLYDCAzaXvbbmcpn7VEOcwe
         rTy8Ne6a6LhLM7Z2g2nENYBdiwVCW+HmhfPRe6RVQyomutOJvkR58mci9odrSZYtA1AG
         nClXbdeTwhs5Bpa7UFGrPjAiVCrmVWKZQsQQO97lDyT2KWMvFShH5J1lXDsq3Mh4Kaho
         JKDHbjn9t9BFgz6+luvPA7rocHP1XsR+HrMjNuYneGdd2/obw+5MRuzQeK0LVlgztgGS
         be+w==
X-Gm-Message-State: AOAM533bvShawO9hLtT3QdlL+56nW34nvB0AFhNf21twmWQSD3ftKhPC
	wZWk187ZfLMEiL7fmfSl4rSTt1GGm0U9Ww==
X-Google-Smtp-Source: ABdhPJwH8tFEEcYCo8ICx5DHD3OLJMJOhQIUtfchEektjFFkjz+24YQqKnxt6uk/nFCqdM0vRZHIGw==
X-Received: by 2002:a5d:490a:: with SMTP id x10mr10163982wrq.289.1602947734198;
        Sat, 17 Oct 2020 08:15:34 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:33 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 12/13] gstreamer1.0-libav: upgrade to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:23 +0100
Message-Id: <20201017151524.31550-13-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
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
2.28.0

