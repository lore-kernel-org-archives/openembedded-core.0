Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9666.1603981712191916262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oca/+dry;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id d3so46415wma.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxpgUIKZCozMTIKBPoTDdoLc/f6nRQ9Szym1Vqw4Ycg=;
        b=oca/+dryNA5lf/lThLOUnheRZjovy9Ca2jOQkcHK8p6Y71IaKRElTUpzcg29UQrabA
         DSCN+ztinkS4Aj/KTt7kNms2cyShaWxpkyRwW/Pvwqr/rfjmbM/Q4JQvdlkN/Yy18CuL
         4ObP4Qz9MoY6Vjve3k2Uzb4FeK5GF7IWsXbwwi6Jlv7s2alXydLO9f1cwZl7Uu/XqePd
         LzGdoltLq4cFeOumXA6n00O0uU0dqsXQRV3IiLGyYTrJnK4jNetv5I+fZgh85w+6Bq3d
         QaHl01GGL1tNRJnCuPa8u8wB9bvVQnrxEllvaj06mteSIQfQ/HMCAmi4TLSM1EW9OdyN
         CTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxpgUIKZCozMTIKBPoTDdoLc/f6nRQ9Szym1Vqw4Ycg=;
        b=h5OH1i4SkFDRJFddLa91ux6HIQ1BNpGZxVJDU0yxLIltNovy3N7hEbvTMqpG1AJf6s
         ag6NFnYwLtbuNe0dsdmzRSub+J9m6mudb1dRoscnobaRSlC85/n54s8jITB43TFw8mlU
         Wd0Xez3CLv5WstKLDKFZjxeuYkiOqdgnbduU3lO7z8syMByU3RHiX1i1SaoILbI83WZA
         oZuOrIY52wLEMf2GEsPvrlJ02Jidj+GbhvKDiCfqatn7k+TWHlZTcC5NaDVPQETG64fK
         I8Zp0iWEdwSWaIHQuy2dwkq6VCp/BT61TUFpoteCu3lWEBz7nxMjor9ByetxcPM3tsqk
         CQuA==
X-Gm-Message-State: AOAM530V/PIKQ7X6KTUlkmFS59bOHd9qEIzEzCzQf5s/TmtdMEIWH5X5
	4FgDoUZBGa0xPcXJ2IGeu7lwJ2ig5/VHoQ==
X-Google-Smtp-Source: ABdhPJwnD2N/CXQbKPVt9t8iZObx9+g9tiwWXl5YTcB+fztUzxAtWadP4VEvZrjBoijBy/qhBc/XyA==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr96160wma.152.1603981710515;
        Thu, 29 Oct 2020 07:28:30 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:29 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 19/22] gst-devtools: add version 1.18.0 (gst-validate -> gst-devtools)
Date: Thu, 29 Oct 2020 14:28:03 +0000
Message-Id: <20201029142806.1830504-20-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gst-validate tarball has been superseded by the gst-devtools tarball for consistency with the git module name.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ct-has-a-different-signature-on-musl.patch | 10 ++---
 .../gstreamer/gst-devtools_1.18.0.bb          | 43 +++++++++++++++++++
 .../gstreamer/gst-validate_1.16.2.bb          | 25 -----------
 3 files changed, 48 insertions(+), 30 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate => gst-devtools}/0001-connect-has-a-different-signature-on-musl.patch (76%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch
rename to meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index a0d215c5a0..c0e4581358 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 0bd8004d8dddc486d3961a5316d24e8f2645e4c8 Mon Sep 17 00:00:00 2001
+From 73b1002eda17451db1f58431b42c25203f1d3097 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
@@ -12,13 +12,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- plugins/fault_injection/socket_interposer.c | 7 ++++++-
+ validate/plugins/fault_injection/socket_interposer.c | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/plugins/fault_injection/socket_interposer.c b/plugins/fault_injection/socket_interposer.c
+diff --git a/validate/plugins/fault_injection/socket_interposer.c b/validate/plugins/fault_injection/socket_interposer.c
 index 53c1ebb..ad7adf8 100644
---- a/plugins/fault_injection/socket_interposer.c
-+++ b/plugins/fault_injection/socket_interposer.c
+--- a/validate/plugins/fault_injection/socket_interposer.c
++++ b/validate/plugins/fault_injection/socket_interposer.c
 @@ -100,10 +100,15 @@ socket_interposer_set_callback (struct sockaddr_in *addrin,
  }
  
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
new file mode 100644
index 0000000000..63e7a99b4f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.0.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Gstreamer validation tool"
+DESCRIPTION = "A Tool to test GStreamer components"
+HOMEPAGE = "https://gstreamer.freedesktop.org/documentation/gst-devtools/index.html"
+SECTION = "multimedia"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://validate/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+#S = "${WORKDIR}/gst-devtools-${PV}"
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}.tar.xz \
+           file://0001-connect-has-a-different-signature-on-musl.patch \
+           "
+
+SRC_URI[md5sum] = "37ca48ea06fb4304cfc9009ec924bc52"
+SRC_URI[sha256sum] = "82337141b5654f11c440f783892ba9d9498b3b6b98c2286b000f96dce6945f16"
+
+DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
+RRECOMMENDS_${PN} = "git"
+
+FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
+
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection
+
+# TODO: put this in a gettext.bbclass patch
+def gettext_oemeson(d):
+    if d.getVar('USE_NLS') == 'no':
+        return '-Dnls=disabled'
+    # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
+    if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 'cross-canadian'):
+        return '-Dnls=disabled'
+    return '-Dnls=enabled'
+
+EXTRA_OEMESON += " \
+    -Ddoc=disabled \
+    -Ddebug_viewer=disabled \
+    -Dtests=disabled \
+    -Dvalidate=enabled \
+    ${@gettext_oemeson(d)} \
+"
+
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
deleted file mode 100644
index 35492fe861..0000000000
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Gstreamer validation tool"
-DESCRIPTION = "A Tool to test GStreamer components"
-HOMEPAGE = "https://gstreamer.freedesktop.org/releases/gst-validate/1.12.3.html"
-SECTION = "multimedia"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
-           file://0001-connect-has-a-different-signature-on-musl.patch \
-           "
-SRC_URI[md5sum] = "688f42c52d62e8c5e506df911553fb2c"
-SRC_URI[sha256sum] = "4861ccb9326200e74d98007e316b387d48dd49f072e0b78cb9d3303fdecfeeca"
-
-DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
-RRECOMMENDS_${PN} = "git"
-
-FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
-
-inherit pkgconfig gettext autotools gobject-introspection gtk-doc upstream-version-is-even
-
-# With gtk-doc enabled this recipe fails to build, so forcibly disable it:
-# WORKDIR/build/docs/validate/gst-validate-scan: line 117:
-# WORKDIR/build/docs/validate/.libs/lt-gst-validate-scan: No such file or directory
-GTKDOC_ENABLED = "False"
-- 
2.29.1

