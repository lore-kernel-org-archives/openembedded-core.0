Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.2547.1617655101345241543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 13:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K6WZT3l9;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id v10so8898400pfn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zgd2czt5owJ3xcacS+60wppMFry5dAYekHhBKvuz7HU=;
        b=K6WZT3l95NeeLEL63Hkbxu7bS4O/qngzXrZsBJUCSO14c2CZUByqUOwvI+X/5PZ4D0
         a35ehcKFMEJ5DZPoml7IoojjbFsZBdh2QcSXiGD8yqrmEuhYhyiWWovQOjC3TM08ajw5
         DkaT3KyIDDrYKbr6Gv+XO9o0vR78yia7ntpOmRaSAp5HRTV6G0FUMGDMQE5WOFixwPVm
         7DNN0YwGBLrJxQM8LBIdDS9EczhOPIxXMsoeO1sxIunIdejADYyFIngq69PuA7s+QN+H
         qqbMsmMOf/s8pZt6CMJTuG1gS04VkK06blcrkg1GfZeyoyoLFDZY0hG36+O+s32wlIo4
         0q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zgd2czt5owJ3xcacS+60wppMFry5dAYekHhBKvuz7HU=;
        b=pq+VMeIo7rrQ1CBNItIFDBMR3nESi5ezkLEzkKXd0vCAC19exGNjNlTEZxBKTeeenA
         1mqTh9uswmkU/TQIjoPrprLax/WoazFHNCSoOQg62wpXEZRfOfbizwIMEQSTOsif+vo8
         L1Rdv6WQ+5tqXWTph5Pu8W9g297ZdRFY7PkozqjIACqUHrCrXbKGXhD2g2TwwbGg/FdC
         um2FhcM5syak6u14bwOzwaIdrqsMMeQ/0J73pyAlxvpP6dJS2/lpKDTgrw+QXC19NUcb
         etv/TAD+X6DSUJlo1VelZX3WVjuB+epJwhsKnGR+TdtmJQaH/Ng/wgvU2iNdLqilVvg9
         KDBw==
X-Gm-Message-State: AOAM533PWUWmjbz5aEKMXcQmsD2tCzWnMB/4XAZG4wWaCLJ60bm+Wsap
	30bDZgeQtZHTZiWKBMReGfLlVKvFJRTlLA==
X-Google-Smtp-Source: ABdhPJza25gwXnj10aTTdHFSzfyTK9quf8tu1+DJZeXvEvk2zfWxwVKh1uY3wb902AnZz6HZdHFtkw==
X-Received: by 2002:a65:640d:: with SMTP id a13mr23873472pgv.272.1617655100378;
        Mon, 05 Apr 2021 13:38:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id k13sm16371965pfc.50.2021.04.05.13.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 13:38:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vte: Upgrade to 0.64.0 release
Date: Mon,  5 Apr 2021 13:38:17 -0700
Message-Id: <20210405203817.3196227-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use git for SRC_URI as thi release has not appeared on gnome downloads yet
Drop LGPL-2.0 as it has fully moved to LGPL-3.1+ see [1] that also
covers for change in License checksums for GPL-3

Add license information to cover for Xterm files in libvte

Add new glade files into -dev package

[1] https://github.com/GNOME/vte/commit/5e14529d4219f3792690566ef7ec70febd87e070

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-W_EXITCODE-macro-for-non-glibc-systems.patch | 15 +++++++--------
 .../vte/{vte_0.62.3.bb => vte_0.64.0.bb}          | 13 +++++++++----
 2 files changed, 16 insertions(+), 12 deletions(-)
 rename meta/recipes-support/vte/{vte_0.62.3.bb => vte_0.64.0.bb} (83%)

diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
index a1d2e7ff27..b4100fc381 100644
--- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
+++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
@@ -17,20 +17,19 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  src/widget.cc  | 1 +
  2 files changed, 5 insertions(+)
 
-diff --git a/src/missing.hh b/src/missing.hh
-index 0742270..30ede62 100644
 --- a/src/missing.hh
 +++ b/src/missing.hh
-@@ -33,3 +33,7 @@ int fdwalk(int (*cb)(void* data, int fd),
- char* strchrnul(char const* s,
-                 int c);
+@@ -24,6 +24,10 @@
+ #define NSIG (8 * sizeof(sigset_t))
  #endif
-+
+ 
 +#ifndef W_EXITCODE
 +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
 +#endif
-diff --git a/src/widget.cc b/src/widget.cc
-index 44a2271..0668735 100644
++
+ #ifndef HAVE_FDWALK
+ int fdwalk(int (*cb)(void* data, int fd),
+            void* data);
 --- a/src/widget.cc
 +++ b/src/widget.cc
 @@ -21,6 +21,7 @@
diff --git a/meta/recipes-support/vte/vte_0.62.3.bb b/meta/recipes-support/vte/vte_0.64.0.bb
similarity index 83%
rename from meta/recipes-support/vte/vte_0.62.3.bb
rename to meta/recipes-support/vte/vte_0.64.0.bb
index 8d2470cad8..a16dac7e67 100644
--- a/meta/recipes-support/vte/vte_0.62.3.bb
+++ b/meta/recipes-support/vte/vte_0.64.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "Virtual terminal emulator GTK+ widget library"
 DESCRIPTION = "VTE provides a virtual terminal widget for GTK applications."
 HOMEPAGE = "https://wiki.gnome.org/Apps/Terminal/VTE"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "GPLv3 & LGPLv3+ & LGPLv2.1+"
+LICENSE = "GPLv3 & LGPLv3+ & MIT-X"
 LICENSE_libvte = "LGPLv3+"
 
 LIC_FILES_CHKSUM = " \
-    file://COPYING.GPL3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
-    file://COPYING.LGPL2;md5=4fbd65380cdd255951079008b364516c \
+    file://COPYING.GPL3;md5=cc702cf3444d1f19680c794cc61948f9 \
     file://COPYING.LGPL3;md5=b52f2d57d10c4f7ee67a7eb9615d5d24 \
+    file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
 "
 
 DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
@@ -18,9 +18,12 @@ GIR_MESON_OPTION = 'gir'
 
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
+SRCREV = "2520d6b6785646ceb5f501f9c37a1a0307fa4486"
+SRC_URI = "git://gitlab.gnome.org/GNOME/vte.git;protocol=https;branch=vte-0-64"
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "f5770285a52cc23a3c0428a43d492b7c0ba458ce7b8a73768a7d4f1e8a7db3b4"
+
+S = "${WORKDIR}/git"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -56,4 +59,6 @@ FILES_${PN}-prompt = " \
     ${libexecdir}/vte-urlencode-cwd \
 "
 
+FILES_${PN}-dev += "${datadir}/glade/"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

