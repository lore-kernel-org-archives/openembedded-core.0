Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.181516.1598214097445312559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GFXnE8XD;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id f24so3958803edw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNnmqgMDS8FcTF79dJqFcmSDZa2An1XJJXc64uX2ywQ=;
        b=GFXnE8XDTR/PPoSzvpFDVlDNVtBDVswfs9cnTzD0RVRcuPHHY6PiiAx/mfFdUeP5dS
         oNhPkTYcYQSP7nVx0z/nfAA4RZKuHFyKdWPe90I9paqhyVUpiA8mhVxYDDrn/wrjlcan
         BqF+KDdhuXeulRjweLLeKUxd29HAJxmpEwgk6RtmkBXPhHfkwKFDadC351z+ySBBdp8e
         IQKsqzqfwZqQWZypeJjjHoFJmhXSg0ilwbN26ncSN/Fsbuc6J0jEjqSudUlwRuxTQzuz
         iDe9Pg35WcWwdzKe+20vpdw246+HXUp5gMZREBafwxeJh2OlTNCwgelwlwj2xNp9u1qc
         IgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNnmqgMDS8FcTF79dJqFcmSDZa2An1XJJXc64uX2ywQ=;
        b=slRu57fms6Vnxzmnmi3jS6iQGMXeyEjrw9k6VMUS7QxRHkN/yh9d82CLjxxiXWWnDR
         IdNW6O6xjzSLtYKiV+N2b6ZonyQFbdmU11WcgwgYsSe7MwSQwC9X5u8UINJbeqK8pXeN
         C//7xuzBOP/2ej7LtXSLwUfq4UKkWKWopRXxec8anQg0eLwC15TyOSnKdpsgSlg9GYOb
         RBGBEZUOJkzRQL68g9PIs5LTSJcdCRmeYtuErqwR6q9PHL9celgCw6r0pTug/8NL8zMa
         buWAsxqvKPbOsMSk7q7hNFK350rSjtbZuPH3VoMTyWrdvtco4X7FdVVx1zlusqPvO37h
         1iUw==
X-Gm-Message-State: AOAM531FEU7lSSFaZS5Eej56D7O2V4C3rUypGlWJewlzz1M+7oFmrAk/
	+g8DmrLOCmBn38Gmtmayv5Wuq5+kNSk=
X-Google-Smtp-Source: ABdhPJwMKBqCeMG2OZNJL2GRNTCCjZCSC0ZHGcFyFGTKcrfz81hQcT9OOcRfzS52kPqj/UtxyKMGKQ==
X-Received: by 2002:a50:ef15:: with SMTP id m21mr2639312eds.300.1598214095629;
        Sun, 23 Aug 2020 13:21:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 33/37] libpsl: update 0.21.0 -> 0.21.1.
Date: Sun, 23 Aug 2020 22:20:27 +0200
Message-Id: <20200823202031.24686-33-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-PYTHON-when-invoking-psl-make-dafsa.patch | 50 -------------------
 ...k-doc-do-not-include-tree_index.sgml.patch | 28 -----------
 .../{libpsl_0.21.0.bb => libpsl_0.21.1.bb}    |  7 +--
 3 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch
 delete mode 100644 meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
 rename meta/recipes-support/libpsl/{libpsl_0.21.0.bb => libpsl_0.21.1.bb} (64%)

diff --git a/meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch b/meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch
deleted file mode 100644
index 6d6ccf4d25..0000000000
--- a/meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a0e6f0ec9dc6dd1db1c03f7f273cc16cb3af5561 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 11 Jul 2019 17:47:11 +0100
-Subject: [PATCH] Makefile.am: use PYTHON when invoking psl-make-dafsa
-
-In an environment where only Python 3 is installed, configure.ac finds and sets
-PYTHON=python3 correctly but src/psl-make-dafsa is called directly, so the hashbang of
-`#!/usr/bin/env python` is used which doesn't exist.
-
-Fix this by explicitly running $(PYTHON) when using the tool.
-
-Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/b4fec5d0ddb70fc4f5360eb14f2f5c5e91194333]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/Makefile.am   | 2 +-
- tests/Makefile.am | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f9c0a3d..a05ea05 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -19,7 +19,7 @@ libpsl_la_LDFLAGS = -no-undefined -version-info $(LIBPSL_SO_VERSION)
- # Build rule for suffix_dafsa.c
- # PSL_FILE can be set by ./configure --with-psl-file=[PATH]
- suffixes_dafsa.h: $(PSL_FILE) $(srcdir)/psl-make-dafsa
--	$(srcdir)/psl-make-dafsa --output-format=cxx+ "$(PSL_FILE)" suffixes_dafsa.h
-+	$(PYTHON) $(srcdir)/psl-make-dafsa --output-format=cxx+ "$(PSL_FILE)" suffixes_dafsa.h
- 
- EXTRA_DIST = psl-make-dafsa LICENSE.chromium
- 
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 8b29b61..28a9a0b 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -34,9 +34,9 @@ TESTS = $(PSL_TESTS)
- # check-local target works in parallel to the tests, so the test suite will likely fail
- BUILT_SOURCES = psl.dafsa psl_ascii.dafsa
- psl.dafsa: $(top_srcdir)/list/public_suffix_list.dat
--	$(top_srcdir)/src/psl-make-dafsa --output-format=binary "$(PSL_FILE)" psl.dafsa
-+	$(PYTHON) $(top_srcdir)/src/psl-make-dafsa --output-format=binary "$(PSL_FILE)" psl.dafsa
- psl_ascii.dafsa: $(top_srcdir)/list/public_suffix_list.dat
--	$(top_srcdir)/src/psl-make-dafsa --output-format=binary --encoding=ascii "$(PSL_FILE)" psl_ascii.dafsa
-+	$(PYTHON) $(top_srcdir)/src/psl-make-dafsa --output-format=binary --encoding=ascii "$(PSL_FILE)" psl_ascii.dafsa
- 
- clean-local:
- 	rm -f psl.dafsa psl_ascii.dafsa
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch b/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
deleted file mode 100644
index c78d6fd981..0000000000
--- a/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8691105e1808ec9b031b6c25f70204a0908ae9c1 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sat, 1 Jun 2019 13:09:41 +0200
-Subject: [PATCH] gtk-doc: do not include tree_index.sgml
-
-gtk-doc 1.30 no longer generates the file if the object tree is empty
-
-Upstream-Status: Backport [87d1add318b5e5d09977f7f374e923577b6ff3be]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- docs/libpsl/libpsl-docs.sgml | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/docs/libpsl/libpsl-docs.sgml b/docs/libpsl/libpsl-docs.sgml
-index 1eca9a2..1c38dbc 100644
---- a/docs/libpsl/libpsl-docs.sgml
-+++ b/docs/libpsl/libpsl-docs.sgml
-@@ -22,10 +22,6 @@
-         </para>
-         <xi:include href="xml/libpsl.xml"/>
-   </chapter>
--  <chapter id="object-tree">
--    <title>Object Hierarchy</title>
--     <xi:include href="xml/tree_index.sgml"/>
--  </chapter>
-   <index id="api-index-full">
-     <title>API Index</title>
-     <xi:include href="xml/api-index-full.xml"><xi:fallback /></xi:include>
diff --git a/meta/recipes-support/libpsl/libpsl_0.21.0.bb b/meta/recipes-support/libpsl/libpsl_0.21.1.bb
similarity index 64%
rename from meta/recipes-support/libpsl/libpsl_0.21.0.bb
rename to meta/recipes-support/libpsl/libpsl_0.21.1.bb
index 9831b4b94f..0a48db65c3 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.1.bb
@@ -4,12 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
                     file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
 
-SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz \
-           file://0001-gtk-doc-do-not-include-tree_index.sgml.patch \
-           file://0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch \
+SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "171e96d887709e36a57f4ee627bf82d2"
-SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd653ee12"
+SRC_URI[sha256sum] = "ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c"
 
 UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.28.0

