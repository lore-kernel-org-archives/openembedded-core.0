Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 978FF7F436
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e16so6854316wro.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GdatZlzWICOOsLHAXEQrgYzlPnQ+Ed1hlyTvaG0z6Lc=;
	b=M3ZBZbcmy2Uc/wqnCm0Lv25w9SoNnTTLwClBfdjrwPI67RHX0LK0H9BOa31iwIVxuE
	PkvdoNK/XV07t0jiERw8fjE/UO+7ULL56J3f4dZYBMi8ZCEhsu1XOjpMEl1yzBfFdvoM
	pK1UrGx41i8MJOADtGauhK8jaPF8nOtlLPbDHh6ccggWem0Bz8jj962UWxUy4UkoaNKF
	cjMjQ+Hw+0CbwU7SCGwBt6/WyOOHsHdbCeNDIGneIHB2NkwTfOntyGH9iwjN+pcQJz2X
	qifOeUGuNTWhGRkHJyym1RbN/K0f5deeNrGr342pkR4EsjkSFda1CfsVlFV85wEeuxPA
	Cmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GdatZlzWICOOsLHAXEQrgYzlPnQ+Ed1hlyTvaG0z6Lc=;
	b=pDCy7IcQIWBiC7WSW/C+e2rWl5L1VNW5s0IW8U/p+rstswD4+ZZjvACM2mqYgLwhaT
	HDD4D3ym8H8D8kR06OoHB0s3SaXXnFBDuFtSCxNgMntuA0CC2n0RkA9dpCbjonWH0OZo
	YWKHg3DIFeqCemy0P+TveP6e3ZHLQQyTOppeYpRcof5KwdkOIaza0x7CO9BnoIMBMUwh
	UAjehzGrrSAmNgkJo3oo4Zhr+Asxv+dFmoISJ7Ui3Nf/wGHPbdEdo3srv/QC0AH8AxJz
	sfPY0CMPAhtqFrVS7OjIhLe1UoLtoyeQq2ledha67SRme6XLmdcMnO6+j1UqOli/e2OD
	GOvA==
X-Gm-Message-State: APjAAAXSILTeRrmCbVgKrXdtFRIdM5hDcjAXTfpFaL9REc2oHxx8CmsT
	zkpqHPzyY6cCgqxJA/dv1ve+EJKy
X-Google-Smtp-Source: APXvYqzu4fY/9NVVgBL0630UtgBhaBI8vrTJ/VBSNglyFHb5LasLO+Es6qujtyWT2/x2S9AwxM2q3g==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr16927907wrn.264.1567169411268; 
	Fri, 30 Aug 2019 05:50:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:52 +0200
Message-Id: <3f2d3b5e1526f9069235cebbe7c5bce378bf0bff.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 07/13] libpsl: use python 3 during builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2019 12:50:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-PYTHON-when-invoking-psl-make-dafsa.patch | 50 +++++++++++++++++++
 meta/recipes-support/libpsl/libpsl_0.21.0.bb  |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch

diff --git a/meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch b/meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch
new file mode 100644
index 00000000000..6d6ccf4d259
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl/0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch
@@ -0,0 +1,50 @@
+From a0e6f0ec9dc6dd1db1c03f7f273cc16cb3af5561 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Thu, 11 Jul 2019 17:47:11 +0100
+Subject: [PATCH] Makefile.am: use PYTHON when invoking psl-make-dafsa
+
+In an environment where only Python 3 is installed, configure.ac finds and sets
+PYTHON=python3 correctly but src/psl-make-dafsa is called directly, so the hashbang of
+`#!/usr/bin/env python` is used which doesn't exist.
+
+Fix this by explicitly running $(PYTHON) when using the tool.
+
+Upstream-Status: Backport [https://github.com/rockdaboot/libpsl/commit/b4fec5d0ddb70fc4f5360eb14f2f5c5e91194333]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/Makefile.am   | 2 +-
+ tests/Makefile.am | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f9c0a3d..a05ea05 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -19,7 +19,7 @@ libpsl_la_LDFLAGS = -no-undefined -version-info $(LIBPSL_SO_VERSION)
+ # Build rule for suffix_dafsa.c
+ # PSL_FILE can be set by ./configure --with-psl-file=[PATH]
+ suffixes_dafsa.h: $(PSL_FILE) $(srcdir)/psl-make-dafsa
+-	$(srcdir)/psl-make-dafsa --output-format=cxx+ "$(PSL_FILE)" suffixes_dafsa.h
++	$(PYTHON) $(srcdir)/psl-make-dafsa --output-format=cxx+ "$(PSL_FILE)" suffixes_dafsa.h
+ 
+ EXTRA_DIST = psl-make-dafsa LICENSE.chromium
+ 
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 8b29b61..28a9a0b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -34,9 +34,9 @@ TESTS = $(PSL_TESTS)
+ # check-local target works in parallel to the tests, so the test suite will likely fail
+ BUILT_SOURCES = psl.dafsa psl_ascii.dafsa
+ psl.dafsa: $(top_srcdir)/list/public_suffix_list.dat
+-	$(top_srcdir)/src/psl-make-dafsa --output-format=binary "$(PSL_FILE)" psl.dafsa
++	$(PYTHON) $(top_srcdir)/src/psl-make-dafsa --output-format=binary "$(PSL_FILE)" psl.dafsa
+ psl_ascii.dafsa: $(top_srcdir)/list/public_suffix_list.dat
+-	$(top_srcdir)/src/psl-make-dafsa --output-format=binary --encoding=ascii "$(PSL_FILE)" psl_ascii.dafsa
++	$(PYTHON) $(top_srcdir)/src/psl-make-dafsa --output-format=binary --encoding=ascii "$(PSL_FILE)" psl_ascii.dafsa
+ 
+ clean-local:
+ 	rm -f psl.dafsa psl_ascii.dafsa
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libpsl/libpsl_0.21.0.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
index fc2417fc2fc..9831b4b94f9 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
 
 SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://0001-gtk-doc-do-not-include-tree_index.sgml.patch \
+           file://0001-Makefile.am-use-PYTHON-when-invoking-psl-make-dafsa.patch \
            "
 SRC_URI[md5sum] = "171e96d887709e36a57f4ee627bf82d2"
 SRC_URI[sha256sum] = "41bd1c75a375b85c337b59783f5deb93dbb443fb0a52d257f403df7bd653ee12"
-- 
2.17.1


