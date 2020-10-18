Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.18819.1603023040036267918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=StjaYctm;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id s9so8300178wro.8
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HC/uw1F3AAcrxaugH115Mv9rT07mQP7vPr/J+a+JJ3U=;
        b=StjaYctmquDTbjouL6Cp2tGV4baZE8JNKnsB0gsan0BJN27Xhiwq8reNVQSYotnlce
         h5cHlwEqE+m0fbhn5TGnQreFwpE1aWwlwu8eL9KpAVcRVi/TtJY7Xnixv7QNJ042eo28
         4MsswzTbNUCra2Qa272H8821Vyj/AaA7MO5G0wHGwXT+i0+81NcfBTkzTrlS0gXC4Gb2
         v/zyustX4W4OOIxnFmKZLmktiumZGIlQvwfl5GCvsYk9ndHPatnzz7RbPnWH1D20N5Cl
         wBHH/Ld6KAFcfNJrNt7c+jvzTzCOVsXAjQXKdSWS9XrxODdwpOh07IHbSGCac8YxTWqT
         2vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HC/uw1F3AAcrxaugH115Mv9rT07mQP7vPr/J+a+JJ3U=;
        b=uCNqoDxqcEir1HmbQbCe+AHXoQIgypvgUBVqd0n+0CpgFYWAYNqRhDGTUsTwcfeNmH
         nPMU4xk3PilBcVVbC/L5oyC5Zz0DBLtOsdxdaNvoBZ1zWNUu4fufdW6HzPZSzLzE132h
         crPuXpfh1VgTvXoFdU3qiZWky51S+wT6forrlmEzwx0j3InJK/fOLavOxQ50orVNum8U
         +3eMLDbo9PA1izY7ery1TesgdcgTfwzq3YQcBnpz+jqySZHnMVcfLqeh1OKGoV6N/qLF
         WdDU80amJpVTRvLM82eJqKIKw42OFZJ8zvyRpsfaw/8l6R79V8f3y8NhVH/4WWregpVx
         DBtQ==
X-Gm-Message-State: AOAM53262PVP7PqDpCniAFmAPJO/4OPdQoXEJUTZxcnUT9ufrBmXl15w
	9BY9tO5gGl6z+yJfZqi+b+eV2MEeu8ylrg==
X-Google-Smtp-Source: ABdhPJwF6EOXme2iC9/xW1jwxvd92tLL1dobAWFxey0pmcKCqkoyPT3GkZ24clndZbg37VK3Qxbp8g==
X-Received: by 2002:a5d:6345:: with SMTP id b5mr15105854wrw.288.1603023038298;
        Sun, 18 Oct 2020 05:10:38 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:37 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 18/20] gstreamer1.0-libav: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:10:00 +0100
Message-Id: <20201018121002.1417335-19-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
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

