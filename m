Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A4AD6CFD1
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:22:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61511.1769145768581900359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sr/oVgtg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145773; x=1800681773;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sYwHd50uoqfbnMMX0OpX2mq1CVWzhscB7r2GB9Q8kzk=;
  b=Sr/oVgtgKssh7/W7+ear6rDEP0sXcj1gRurW0OEiqbbYnpo3vAGrOupq
   XK4XqpDyXScfa6uBnn7HNzXfxtFnUU15PC4rjYCRW9Pf+hzuwNFj70ZeN
   3lwfrX9cD5HZhZaMq5ww37cIyBzMiBIgU/VVZ+zkNPcJQ0T3sGMpzkIyF
   KCyQAekjDnCoAmk7o7JkFtIyQkgXymvqF4y6bFdN73ts4KXf2Uv+xOpS6
   foCedLd/vqAetrkRPi0sqpZCcifIhm+8WaySbDcxcTxrbxIU+sFsiRqS0
   diD3YyrwNpQNu6gEsq555doP7AAZwv3uZZr7UgONCXLpEn15YvnbTDi+B
   g==;
X-CSE-ConnectionGUID: 5eWj/DrVQCymv5UFiqmyVQ==
X-CSE-MsgGUID: 5x/WJF9qRqWYzY2SzxMrrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226205977"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226205977"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:22:53 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E52B51000371
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 985D91809ACC
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:52 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 531421401F25
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:50 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/5] hotdoc : Add new recipe
Date: Fri, 23 Jan 2026 13:22:34 +0800
Message-ID: <20260123052234.970-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
References: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229865

Add this recipe as it will be used for gstreamer/orc.

1.Backport following patch to solve build and runtime issue
  0001-c_comment_scanner-fix-function-prototypes.patch
  0002-avoid-third-party-backports-dependency-on-sufficient.patch
  0003-CMake-4-compatibility.patch

2.Add INSANE_SKIP to solve buildpaths QA check
  do_package_qa: QA Issue: File /usr/lib/python3.14/site-packages/hotdoc/parsers/cmark.cpython-314-x86_64-linux-gnu.so in package hotdoc contains reference to TMPDIR [buildpaths]

3.Add hotdoc_fix_sources to solve buildpaths QA check
  do_package_qa:QA Issue: File /usr/src/debug/hotdoc/0.17.4/hotdoc/parsers/c_comment_scanner/scanner.c in package hotdoc-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ment_scanner-fix-function-prototypes.patch | 32 +++++++++
 ...y-backports-dependency-on-sufficient.patch | 72 +++++++++++++++++++
 .../hotdoc/0003-CMake-4-compatibility.patch   | 44 ++++++++++++
 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb | 29 ++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0001-c_comment_scanner-fix-function-prototypes.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0002-avoid-third-party-backports-dependency-on-sufficient.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc/0003-CMake-4-compatibility.patch
 create mode 100644 meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb

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
diff --git a/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb b/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
new file mode 100644
index 0000000000..b995096170
--- /dev/null
+++ b/meta/recipes-devtools/hotdoc/hotdoc_0.17.4.bb
@@ -0,0 +1,29 @@
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
+          "
+
+DEPENDS += "libxml2 glib-2.0 json-glib"
+
+inherit pypi python_setuptools_build_meta pkgconfig
+
+PACKAGESPLITFUNCS =+ "hotdoc_fix_sources"
+
+hotdoc_fix_sources () {
+    sed -i -e 's#${S}/##g' ${PKGD}${TARGET_DBGSRC_DIR}/hotdoc/parsers/c_comment_scanner/scanner.c
+}
+
+RDEPENDS:${PN} += "python3-appdirs python3-lxml python3-pyyaml python3-schema python3-toposort python3-wheezy-template"
+
+BBCLASSEXTEND = "native"
+
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.43.0


