Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356B2D3566C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:24 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7765.1769658855532940423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ORnWEDog;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658855; x=1801194855;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=X/mvl8viNwZEJESNHt2snDRN7wVX2Z5CIW4KoTLwESQ=;
  b=ORnWEDogIHXsXN+9nha5vtLcWbJCsKOfjiBM0I0NKZxynVbJaaUzqMS+
   8eysBpjqiu0UsYI8Y/uHsFPIo0X4DGF5pvCfJ+piLRkOBHHS95CF6fohg
   jsbd9f2S2SdxliQrJHd+Br+F0L9hdA46c/EDzQNPQi1DEYN6kh5V/QjRj
   Vlosvef8QaoxJBBFNNFG+viKf7MAH0x1mkfO9AIbJkuqnllpJzHZknoja
   1ytKnKNZRUL5wOmNk9lmel7MDB5fz9M5HFigwhtsC+p44SABGrM4WJs3F
   njuc09WFN/xhU/1Or5B/yzJflTFntFW0CWuJHvnPJzN+ECv9Ms/ANwxht
   Q==;
X-CSE-ConnectionGUID: 2ROPeMOrTEO4FwmVbczy6w==
X-CSE-MsgGUID: 0Fr7CTjyTy+E0Xxjb1Wygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="215600449"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="215600449"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:13 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id F06831002814
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:13 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A7B8992677D
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:13 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7AF2F140261A
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6 v3] hotdoc: Add new recipe
Date: Thu, 29 Jan 2026 11:53:52 +0800
Message-ID: <20260129035353.8982-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230117

1. Backport following patch to solve build and runtime issue
  0001-c_comment_scanner-fix-function-prototypes.patch
  0002-avoid-third-party-backports-dependency-on-sufficient.patch
  0003-CMake-4-compatibility.patch

2. Add do_configure:prepend() to solve buildpaths QA check
  do_package_qa: QA Issue: File /usr/lib/python3.14/site-packages/hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so in package hotdoc contains reference to TMPDIR [buildpaths]

3. Add 0004-Make-path-to-relative-in-FlexExtension.patch to solve buildpaths QA check
  do_package_qa: QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
 .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
 ...ke-path-to-relative-in-FlexExtension.patch | 34 +++++++++
 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb | 27 +++++++
 6 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945..af081dc3dc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -268,6 +268,7 @@ RECIPE_MAINTAINER:pn-harfbuzz = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-hdparm = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-help2man = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-hotdoc = "Liu Yiding <liuyd.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-hwdata = "Hiago De Franco <hfranco@baylibre.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch b/meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
new file mode 100644
index 0000000000..c26dde93b3
--- /dev/null
+++ b/meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH 1/2] c_comment_scanner: fix function prototypes
+
+scanner.l: Fix compile error as the following:
+
+python3-hotdoc/0.17.4/sources/hotdoc-0.17.4/hotdoc/parsers/c_comment_scanner/scanner.l:126:1: error: conflicting types for 'parse_comment'; have 'int(PyObject *)' {aka 'int(struct _object *)'}
+|   126 | parse_comment (PyObject *comments)
+
+Upstream-Status: Backport [https://github.com/hotdoc/hotdoc/commit/adf8518431fafb78c9b47862a0a9a58824b6a421]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ hotdoc/parsers/c_comment_scanner/scanner.l | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hotdoc/parsers/c_comment_scanner/scanner.l b/hotdoc/parsers/c_comment_scanner/scanner.l
+index 0408601..7bccd64 100644
+--- a/hotdoc/parsers/c_comment_scanner/scanner.l
++++ b/hotdoc/parsers/c_comment_scanner/scanner.l
+@@ -34,8 +34,8 @@
+ extern int yylex (PyObject *comments);
+ #define YY_DECL int yylex (PyObject *comments)
+ static int yywrap (void);
+-static int parse_comment ();
+-static int parse_define ();
++static int parse_comment (PyObject *);
++static int parse_define (PyObject *);
+ %}
+ 
+ %option nounput
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch b/meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
new file mode 100644
index 0000000000..560d1257f0
--- /dev/null
+++ b/meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
@@ -0,0 +1,72 @@
+Subject: [PATCH 2/2] avoid third-party backports dependency on sufficiently
+ new python
+
+`backports.entry_points_selectable` backports functionality from python
+3.10 to older versions of python.
+
+Backport this patch to solve runtime backports import problem as following:
+  File "/usr/lib/python3.14/site-packages/hotdoc/utils/utils.py", line 38, in <module>
+  from backports.entry_points_selectable import entry_points
+ModuleNotFoundError: No module named 'backports'
+
+Upstream-Status: Backport [https://github.com/hotdoc/hotdoc/commit/51043c3ef889e36c8232280581598b875073ded7]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ hotdoc/extensions/gi/utils.py | 6 +++++-
+ hotdoc/utils/utils.py         | 6 +++++-
+ setup.py                      | 2 +-
+ 3 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/hotdoc/extensions/gi/utils.py b/hotdoc/extensions/gi/utils.py
+index 159c2b6..91902cb 100644
+--- a/hotdoc/extensions/gi/utils.py
++++ b/hotdoc/extensions/gi/utils.py
+@@ -1,9 +1,13 @@
+ import os
+ from collections import namedtuple
+ import pathlib
++import sys
+ import traceback
+ 
+-from backports.entry_points_selectable import entry_points
++if sys.version_info >= (3, 10):
++    from importlib.metadata import entry_points
++else:
++    from backports.entry_points_selectable import entry_points
+ 
+ from hotdoc.core.links import Link
+ from hotdoc.utils.loggable import info, debug
+diff --git a/hotdoc/utils/utils.py b/hotdoc/utils/utils.py
+index 518d308..aef657a 100644
+--- a/hotdoc/utils/utils.py
++++ b/hotdoc/utils/utils.py
+@@ -35,7 +35,11 @@ import importlib.util
+ from urllib.request import urlretrieve
+ from pathlib import Path
+ 
+-from backports.entry_points_selectable import entry_points
++if sys.version_info >= (3, 10):
++    from importlib.metadata import entry_points
++else:
++    from backports.entry_points_selectable import entry_points
++
+ try:
+     import importlib.metadata as meta
+ except ImportError:
+diff --git a/setup.py b/setup.py
+index 5d7f131..9ee504d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -300,7 +300,7 @@ INSTALL_REQUIRES = [
+     'wheezy.template',
+     'toposort>=1.4',
+     'importlib_metadata; python_version<"3.10"',
+-    'backports.entry_points_selectable',
++    'backports.entry_points_selectable; python_version<"3.10"',
+ ]
+ 
+ # dbus-deviation requires sphinx, which requires python 3.5
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch b/meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
new file mode 100644
index 0000000000..cb243176ae
--- /dev/null
+++ b/meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
@@ -0,0 +1,44 @@
+Subject: [PATCH] CMake 4 compatibility
+
+All CMake versions older than 3.10 are deprecated.
+
+Upstream-Status: Backport [https://github.com/MathieuDuponchelle/cmark/commit/bd78193dbff98c3860e77629b5c7bfee6169d1da]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ cmark/CMakeLists.txt            | 11 ++---------
+ cmark/extensions/CMakeLists.txt |  2 +-
+ 2 files changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/cmark/CMakeLists.txt b/cmark/CMakeLists.txt
+index ff97419..45fdf6c 100755
+--- a/cmark/CMakeLists.txt
++++ b/cmark/CMakeLists.txt
+@@ -1,12 +1,5 @@
+-cmake_minimum_required(VERSION 2.8.9)
+-
+-# prevent ugly developer warnings because version is set directly, not through project()
+-# it should be redone properly by using VERSION in project() if on CMake 3.x
+-if(CMAKE_MAJOR_VERSION GREATER 2)
+-    cmake_policy(SET CMP0048 OLD)
+-endif()
+-
+-project(cmark)
++cmake_minimum_required(VERSION 3.10)
++project(cmark VERSION 0.28.3)
+ 
+ include("FindAsan.cmake")
+ 
+diff --git a/cmark/extensions/CMakeLists.txt b/cmark/extensions/CMakeLists.txt
+index e62d155..b6a1556 100644
+--- a/cmark/extensions/CMakeLists.txt
++++ b/cmark/extensions/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.10)
+ set(LIBRARY "cmarkextensions")
+ set(LIBRARY_SOURCES
+     core-extensions.c
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch b/meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
new file mode 100644
index 0000000000..ae8c2ef3e7
--- /dev/null
+++ b/meta/recipes-devtools/hotdoc/hotdoc/0004-Make-path-to-relative-in-FlexExtension.patch
@@ -0,0 +1,34 @@
+Subject: [PATCH] Make path to relative in FlexExtension
+
+To fix following do_package QA Issue:
+
+do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9ee504d..fc03c57 100644
+--- a/setup.py
++++ b/setup.py
+@@ -357,11 +357,11 @@ build_c_extension = os.environ.get('HOTDOC_BUILD_C_EXTENSION', 'auto')
+ class FlexExtension (Extension):
+     def __init__(self, flex_sources, *args, **kwargs):
+         Extension.__init__(self, *args, **kwargs)
+-        self.__flex_sources = [src(s) for s in flex_sources]
++        self.__flex_sources = list(flex_sources)
+ 
+     def __build_flex(self):
+         src_dir = os.path.dirname(self.__flex_sources[0])
+-        built_scanner_path = src(os.path.join(src_dir, 'scanner.c'))
++        built_scanner_path = os.path.join(src_dir, 'scanner.c')
+ 
+         self.sources.append(built_scanner_path)
+         if newer_group(self.__flex_sources, built_scanner_path):
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb b/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
new file mode 100644
index 0000000000..6236f03df8
--- /dev/null
+++ b/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Hotdoc is a documentation framework"
+DESCRIPTION = "Hotdoc is a documentation micro-framework. It provides an interface for extensions to plug upon, along with some base objects (formatters, ...)"
+HOMEPAGE = "https://github.com/hotdoc/hotdoc"
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90263a49bc1d9a204656fec4d5616c66"
+
+SRC_URI[sha256sum] = "c4d5dff647f03aa87a1d2d06035d2819edd099b91635e3b2ee390829357ae9fc"
+
+SRC_URI = "file://0001-c_comment_scanner-fix-function-prototypes.patch \
+           file://0002-avoid-third-party-backports-dependency-on-sufficient.patch \
+           file://0003-CMake-4-compatibility.patch \
+           file://0004-Make-path-to-relative-in-FlexExtension.patch \
+          "
+
+DEPENDS += "libxml2 glib-2.0 json-glib"
+
+inherit pypi python_setuptools_build_meta pkgconfig
+
+#Fix LIBDIR path to fix buildpaths QA check of hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so
+do_configure:prepend() {
+    sed -i -e "s#'\"%s\"' % CMARK_BUILD_DIR#'\"${PYTHON_SITEPACKAGES_DIR}/${PN}\"'#" ${S}/setup.py
+}
+
+RDEPENDS:${PN} += "python3-appdirs python3-lxml python3-pyyaml python3-schema python3-toposort python3-wheezy-template"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


